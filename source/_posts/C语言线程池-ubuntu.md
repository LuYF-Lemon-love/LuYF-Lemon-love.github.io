---
title: C语言线程池-ubuntu
tags:
  - C/C++
  - 多线程
  - GCC
  - Linux
  - VSCode
  - 线程池
categories: C语言
description: 用 C 语言编写线程池。
cover: 'https://cos.luyf-lemon-love.space/images/20220604154519.png'
abbrlink: 1808307381
date: 2022-06-23 15:20:36
---

### 前言

线程池可以复用线程，免去频繁地创建线程和销毁线程的操作。大大的提高程序的效率。

线程池是生产者和消费者模型的一部分，包含：消费者和缓冲区。

用户可以将任务添加到缓冲区，然后线程池会自动创建线程处理任务，并且线程池会自动控制线程的个数。

线程池包含三个部分：

- `任务队列`: 任务是由线程需要处理的函数指针和参数组成。

- `消费者线程队列`: 线程会不停地处理任务队列中的任务。

- `管理者线程`: 监控 `消费者线程队列`，控制 `消费者线程队列` 中线程的个数。

操作系统：Ubuntu 20.04.4 LTS

### 参考文档

1. [苏丙榅老师的多线程教程](https://subingwen.cn/linux/threadpool/)


### 创建项目

1. 创建项目

```shell
mkdir my_threadpool
cd my_threadpool/
code .
```

2. 进入 `VSCode` 中，如下图创建文件。

![](https://cos.luyf-lemon-love.space//images/20220623161823.png)

3. 关于如何在 `VSCode` 中配置 `C/C++` 环境，请参考 {% post_link C-C-和Python多线程初探-ubuntu %}。

4. 配置 `VSCode` 中 `C/C++` 的调试文件 `./vscode/tasks.json`。当你第一次运行程序时，`C++ extension` 会自动创建 `tasks.json` 文件。但是由于我们创建了三个文件 `main.c`、`threadpool.c` 和 `threadpool.h`，所以需要修改一下编译参数。当然由于我们使用了 `<pthread.h>`，所以也要加 `-lpthread` 参数。

![](https://cos.luyf-lemon-love.space//images/20220623163203.png)

```diff
{
    "tasks": [
        {
            "type": "cppbuild",
            "label": "C/C++: gcc-9 生成活动文件",
            "command": "/usr/bin/gcc-9",
            "args": [
                "-fdiagnostics-color=always",
                "-g",
-                "${file}",
+                "${fileDirname}/*.c",
+                "-lpthread",
                "-o",
                "${fileDirname}/${fileBasenameNoExtension}"
            ],
            "options": {
                "cwd": "${fileDirname}"
            },
            "problemMatcher": [
                "$gcc"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "detail": "调试器生成的任务。"
        }
    ],
    "version": "2.0.0"
}
```

### 头文件-threadpool.h

```c
#ifndef _THREADPOOL_H
#define _THREADPOOL_H

typedef struct ThreadPool ThreadPool;
// 创建线程池并初始化
ThreadPool *threadPoolCreate(int min, int max, int queueSize);

// 销毁线程池
int threadPoolDestroy(ThreadPool* pool);

// 给线程池添加任务
void threadPoolAdd(ThreadPool* pool, void(*func)(void*), void* arg);

// 获取线程池中工作的线程的个数
int threadPoolBusyNum(ThreadPool* pool);

// 获取线程池中活着的线程的个数
int threadPoolAliveNum(ThreadPool* pool);

// 工作的线程(消费者线程)任务函数
void* worker(void* arg);

// 管理者线程任务函数
void* manager(void* arg);

// 单个线程退出
void threadExit(ThreadPool* pool);

#endif  // _THREADPOOL_H
```

### 源文件-threadpool.c

```c
#include "threadpool.h"
#include <pthread.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

const int NUMBER = 2;

// 任务结构体
typedef struct Task
{
    void (*function)(void* arg);
    void* arg;
}Task;

// 线程池结构体
struct ThreadPool
{
    // 任务队列
    Task* taskQ;
    int queueCapacity;  // 容量
    int queueSize;      // 当前任务个数
    int queueFront;     // 队头 -> 取数据
    int queueRear;      // 队尾 -> 放数据

    pthread_t managerID;    // 管理者线程 ID
    pthread_t *threadIDs;   // 工作的线程 ID
    int minNum;             // 最小线程数量
    int maxNum;             // 最大线程数量
    int busyNum;            // 忙的线程的个数
    int liveNum;            // 存活的线程的个数
    int exitNum;            // 要销毁的线程个数
    pthread_mutex_t mutexPool;  // 锁整个的线程池
    pthread_mutex_t mutexBusy;  // 锁 busyNum 变量
    pthread_cond_t notFull;     // 任务队列是不是满了
    pthread_cond_t notEmpty;    // 任务队列是不是空了

    int shutdown;           // 是不是要销毁线程池, 销毁为 1, 不销毁为 0
};

ThreadPool* threadPoolCreate(int min, int max, int queueSize)
{
    ThreadPool* pool = (ThreadPool*)malloc(sizeof(ThreadPool));
    do
    {
        if (pool == NULL)
        {
            printf("malloc threadpool fail ...\n");
            break;
        }

        pool->threadIDs = (pthread_t*)malloc(sizeof(pthread_t) * max);
        if (pool->threadIDs == NULL)
        {
            printf("malloc threadIDs fail ...\n");
            break;
        }
        memset(pool->threadIDs, 0, sizeof(pthread_t) * max);
        pool->minNum = min;
        pool->maxNum = max;
        pool->busyNum = 0;
        pool->liveNum = min;    // 和最小个数相等
        pool->exitNum = 0;

        if (pthread_mutex_init(&pool->mutexPool, NULL) != 0 ||
            pthread_mutex_init(&pool->mutexBusy, NULL) != 0 ||
            pthread_cond_init(&pool->notEmpty, NULL) != 0 ||
            pthread_cond_init(&pool->notFull, NULL) != 0)
        {
            printf("mutex or condition init fail ...\n");
            break;
        }

        // 任务队列
        pool->taskQ = (Task*)malloc(sizeof(Task) * queueSize);
        pool->queueCapacity = queueSize;
        pool->queueSize = 0;
        pool->queueFront = 0;
        pool->queueRear = 0;

        pool->shutdown = 0;

        // 创建线程
        pthread_create(&pool->managerID, NULL, manager, pool);
        for (int i = 0; i < min; ++i)
        {
            pthread_create(&pool->threadIDs[i], NULL, worker, pool);
        }
        return pool;
    } while (0);

    // 释放资源
    if (pool && pool->threadIDs) free(pool->threadIDs);
    if (pool && pool->taskQ) free(pool->taskQ);
    if (pool) free(pool);

    return NULL;
}

int threadPoolDestroy(ThreadPool* pool)
{
    if (pool == NULL)
    {
        return -1;
    }

    // 关闭线程池
    pool->shutdown = 1;
    // 阻塞回收管理者线程
    pthread_join(pool->managerID, NULL);
    // 唤醒阻塞的消费者线程
    for (int i = 0; i < pool->liveNum; ++i)
    {
        pthread_cond_signal(&pool->notEmpty);
    }
    // 释放堆内存
    if (pool->taskQ)
    {
        free(pool->taskQ);
    }
    if (pool->threadIDs)
    {
        free(pool->threadIDs);
    }

    pthread_mutex_destroy(&pool->mutexPool);
    pthread_mutex_destroy(&pool->mutexBusy);
    pthread_cond_destroy(&pool->notEmpty);
    pthread_cond_destroy(&pool->notFull);

    free(pool);
    pool = NULL;

    return 0;
}


void threadPoolAdd(ThreadPool* pool, void(*func)(void*), void* arg)
{
    pthread_mutex_lock(&pool->mutexPool);
    while (pool->queueSize == pool->queueCapacity && !pool->shutdown)
    {
        // 阻塞生产者线程
        pthread_cond_wait(&pool->notFull, &pool->mutexPool);
    }
    if (pool->shutdown)
    {
        pthread_mutex_unlock(&pool->mutexPool);
        return;
    }
    // 添加任务
    pool->taskQ[pool->queueRear].function = func;
    pool->taskQ[pool->queueRear].arg = arg;
    pool->queueRear = (pool->queueRear + 1) % pool->queueCapacity;
    pool->queueSize++;

    pthread_cond_signal(&pool->notEmpty);
    pthread_mutex_unlock(&pool->mutexPool);
}

int threadPoolBusyNum(ThreadPool* pool)
{
    pthread_mutex_lock(&pool->mutexBusy);
    int busyNum = pool->busyNum;
    pthread_mutex_unlock(&pool->mutexBusy);
    return busyNum;
}

int threadPoolAliveNum(ThreadPool* pool)
{
    pthread_mutex_lock(&pool->mutexPool);
    int aliveNum = pool->liveNum;
    pthread_mutex_unlock(&pool->mutexPool);
    return aliveNum;
}

void* worker(void* arg)
{
    ThreadPool* pool = (ThreadPool*)arg;

    while (1)
    {
        pthread_mutex_lock(&pool->mutexPool);
        // 当前任务队列是否为空
        while (pool->queueSize == 0 && !pool->shutdown)
        {
            // 阻塞工作线程
            pthread_cond_wait(&pool->notEmpty, &pool->mutexPool);

            // 判断是不是要销毁线程
            if (pool->exitNum > 0)
            {
                pool->exitNum--;
                if (pool->liveNum > pool->minNum)
                {
                    pool->liveNum--;
                    pthread_mutex_unlock(&pool->mutexPool);
                    threadExit(pool);
                }
            }
        }

        // 判断线程池是否被关闭了
        if (pool->shutdown)
        {
            pthread_mutex_unlock(&pool->mutexPool);
            threadExit(pool);
        }

        // 从任务队列中取出一个任务
        Task task;
        task.function = pool->taskQ[pool->queueFront].function;
        task.arg = pool->taskQ[pool->queueFront].arg;
        // 移动头结点
        pool->queueFront = (pool->queueFront + 1) % pool->queueCapacity;
        pool->queueSize--;
        // 解锁
        pthread_cond_signal(&pool->notFull);
        pthread_mutex_unlock(&pool->mutexPool);

        printf("thread %ld start working ...\n", pthread_self());
        pthread_mutex_lock(&pool->mutexBusy);
        pool->busyNum++;
        pthread_mutex_unlock(&pool->mutexBusy);
        task.function(task.arg);
        free(task.arg);
        task.arg = NULL;

        printf("thread %ld end working ...\n", pthread_self());
        pthread_mutex_lock(&pool->mutexBusy);
        pool->busyNum--;
        pthread_mutex_unlock(&pool->mutexBusy);
    }
    return NULL;
}

void* manager(void* arg)
{
    ThreadPool* pool = (ThreadPool*)arg;
    while (!pool->shutdown)
    {
        // 每隔 3s 检测一次
        sleep(3);

        // 取出线程池中任务的数量和当前线程的数量
        pthread_mutex_lock(&pool->mutexPool);
        int queueSize = pool->queueSize;
        int liveNum = pool->liveNum;
        pthread_mutex_unlock(&pool->mutexPool);

        // 取出忙的线程的数量
        pthread_mutex_lock(&pool->mutexBusy);
        int busyNum = pool->busyNum;
        pthread_mutex_unlock(&pool->mutexBusy);

        // 添加线程
        // 任务的个数 > 存活的线程个数 && 存活的线程数 < 最大线程数
        if (queueSize > liveNum && liveNum < pool->maxNum)
        {
            pthread_mutex_lock(&pool->mutexPool);
            int counter = 0;
            for (int i = 0; i < pool->maxNum && counter < NUMBER
                && pool->liveNum < pool->maxNum; ++i)
            {
                if (pool->threadIDs[i] == 0)
                {
                    pthread_create(&pool->threadIDs[i], NULL, worker, pool);
                    counter++;
                    pool->liveNum++;
                }
            }
            pthread_mutex_unlock(&pool->mutexPool);
        }
        // 销毁线程
        // 忙的线程 * 2 < 存活的线程数 && 存活的线程 > 最小线程数
        if (busyNum * 2 < liveNum && liveNum > pool->minNum)
        {
            pthread_mutex_lock(&pool->mutexPool);
            pool->exitNum = NUMBER;
            pthread_mutex_unlock(&pool->mutexPool);
            // 让工作的线程自杀
            for (int i = 0; i < NUMBER; ++i)
            {
                pthread_cond_signal(&pool->notEmpty);
            }
        }
    }
    return NULL;
}

void threadExit(ThreadPool* pool)
{
    pthread_t tid = pthread_self();
    for (int i = 0; i < pool->maxNum; ++i)
    {
        if (pool->threadIDs[i] == tid)
        {
            pool->threadIDs[i] = 0;
            printf("threadExit() called, %ld exiting ...\n", tid);
            break;
        }
    }
    pthread_exit(NULL);
}
```

### main.c

```c
#include <stdio.h>
#include "threadpool.h"
#include <pthread.h>
#include <unistd.h>
#include <stdlib.h>

void taskFunc(void* arg)
{
    int num = *(int*)arg;
    printf("thread %ld is working, number = %d\n",
        pthread_self(), num);
    sleep(1);
}

int main()
{
    // 创建线程池
    ThreadPool* pool = threadPoolCreate(3, 10, 100);
    for (int i = 0; i < 100; ++i)
    {
        int* num = (int*)malloc(sizeof(int));
        *num = i + 100;
        threadPoolAdd(pool, taskFunc, num);
    }

    sleep(30);

    threadPoolDestroy(pool);
    
    return 0;
}
```

### 运行文件

1. 打开 `main.c` 文件，点击右上角的调试按钮。

![](https://cos.luyf-lemon-love.space//images/20220623172105.png)

![](https://cos.luyf-lemon-love.space//images/20220623172228.png)

2. {% label output pink %}

```shell
thread 140737334818560 start working ...
thread 140737343211264 start working ...
thread 140737343211264 is working, number = 100
thread 140737334818560 is working, number = 101
thread 140737326425856 start working ...
thread 140737326425856 is working, number = 102
thread 140737334818560 end working ...
thread 140737334818560 start working ...
thread 140737334818560 is working, number = 103
thread 140737343211264 end working ...
thread 140737343211264 start working ...
thread 140737343211264 is working, number = 104
thread 140737326425856 end working ...
thread 140737326425856 start working ...
thread 140737326425856 is working, number = 105
thread 140737343211264 end working ...
thread 140737343211264 start working ...
thread 140737343211264 is working, number = 106
thread 140737326425856 end working ...
thread 140737326425856 start working ...
thread 140737326425856 is working, number = 107
thread 140737334818560 end working ...
thread 140737334818560 start working ...
thread 140737334818560 is working, number = 108
thread 140737309640448 start working ...
thread 140737309640448 is working, number = 109
thread 140737318033152 start working ...
thread 140737318033152 is working, number = 110
thread 140737343211264 end working ...
thread 140737343211264 start working ...
thread 140737343211264 is working, number = 111
thread 140737326425856 end working ...
thread 140737326425856 start working ...
thread 140737326425856 is working, number = 112
thread 140737334818560 end working ...
thread 140737334818560 start working ...
thread 140737334818560 is working, number = 113
thread 140737309640448 end working ...
thread 140737309640448 start working ...
thread 140737309640448 is working, number = 114
thread 140737318033152 end working ...
thread 140737318033152 start working ...
thread 140737318033152 is working, number = 115
thread 140737326425856 end working ...
thread 140737326425856 start working ...
thread 140737326425856 is working, number = 116
thread 140737343211264 end working ...
thread 140737343211264 start working ...
thread 140737343211264 is working, number = 117
thread 140737334818560 end working ...
thread 140737334818560 start working ...
thread 140737334818560 is working, number = 118
thread 140737318033152 end working ...
thread 140737318033152 start working ...
thread 140737318033152 is working, number = 119
thread 140737334818560 end working ...
thread 140737334818560 start working ...
thread 140737334818560 is working, number = 120
thread 140737343211264 end working ...
thread 140737343211264 start working ...
thread 140737343211264 is working, number = 121
thread 140737326425856 end working ...
thread 140737326425856 start working ...
thread 140737326425856 is working, number = 122
thread 140737309640448 end working ...
thread 140737309640448 start working ...
thread 140737309640448 is working, number = 123
thread 140737318033152 end working ...
thread 140737334818560 end working ...
thread 140737343211264 end working ...
thread 140737326425856 end working ...
thread 140737309640448 end working ...
thread 140737301247744 start working ...
thread 140737301247744 is working, number = 124
thread 140737318033152 start working ...
thread 140737318033152 is working, number = 125
thread 140736951482112 start working ...
thread 140737334818560 start working ...
thread 140737334818560 is working, number = 127
thread 140737326425856 start working ...
thread 140737326425856 is working, number = 129
thread 140737343211264 start working ...
thread 140737343211264 is working, number = 128
thread 140736951482112 is working, number = 126
thread 140737309640448 start working ...
thread 140737309640448 is working, number = 130
thread 140737301247744 end working ...
thread 140737301247744 start working ...
thread 140737301247744 is working, number = 131
thread 140737318033152 end working ...
thread 140737318033152 start working ...
thread 140737318033152 is working, number = 132
thread 140737334818560 end working ...
thread 140737334818560 start working ...
thread 140737334818560 is working, number = 133
thread 140737326425856 end working ...
thread 140737326425856 start working ...
thread 140737326425856 is working, number = 134
thread 140737343211264 end working ...
thread 140737343211264 start working ...
thread 140737343211264 is working, number = 135
thread 140736951482112 end working ...
thread 140736951482112 start working ...
thread 140736951482112 is working, number = 136
thread 140737309640448 end working ...
thread 140737309640448 start working ...
thread 140737309640448 is working, number = 137
thread 140737301247744 end working ...
thread 140737301247744 start working ...
thread 140737301247744 is working, number = 138
thread 140737318033152 end working ...
thread 140737318033152 start working ...
thread 140737318033152 is working, number = 139
thread 140737326425856 end working ...
thread 140737326425856 start working ...
thread 140737326425856 is working, number = 140
thread 140737334818560 end working ...
thread 140737334818560 start working ...
thread 140737334818560 is working, number = 141
thread 140737343211264 end working ...
thread 140737343211264 start working ...
thread 140737343211264 is working, number = 142
thread 140736951482112 end working ...
thread 140736951482112 start working ...
thread 140736951482112 is working, number = 143
thread 140737309640448 end working ...
thread 140737309640448 start working ...
thread 140737309640448 is working, number = 144
thread 140737301247744 end working ...
thread 140737318033152 end working ...
thread 140737326425856 end working ...
thread 140737334818560 end working ...
thread 140737343211264 end working ...
thread 140737301247744 start working ...
thread 140737318033152 start working ...
thread 140737318033152 is working, number = 146
thread 140737301247744 is working, number = 145
thread 140736943089408 start working ...
thread 140736943089408 is working, number = 147
thread 140737326425856 start working ...
thread 140737326425856 is working, number = 148
thread 140737334818560 start working ...
thread 140737334818560 is working, number = 149
thread 140737343211264 start working ...
thread 140737343211264 is working, number = 150
thread 140736951482112 end working ...
thread 140736951482112 start working ...
thread 140736951482112 is working, number = 151
thread 140737309640448 end working ...
thread 140737309640448 start working ...
thread 140737309640448 is working, number = 152
thread 140736934696704 start working ...
thread 140736934696704 is working, number = 153
thread 140737334818560 end working ...
thread 140737334818560 start working ...
thread 140736951482112 end working ...
thread 140736951482112 start working ...
thread 140736951482112 is working, number = 155
thread 140737343211264 end working ...
thread 140736943089408 end working ...
thread 140736943089408 start working ...
thread 140736943089408 is working, number = 157
thread 140737326425856 end working ...
thread 140737326425856 start working ...
thread 140737326425856 is working, number = 158
thread 140737343211264 start working ...
thread 140737343211264 is working, number = 156
thread 140737318033152 end working ...
thread 140737318033152 start working ...
thread 140737318033152 is working, number = 159
thread 140737334818560 is working, number = 154
thread 140737301247744 end working ...
thread 140737301247744 start working ...
thread 140737301247744 is working, number = 160
thread 140737309640448 end working ...
thread 140737309640448 start working ...
thread 140737309640448 is working, number = 161
thread 140736934696704 end working ...
thread 140736934696704 start working ...
thread 140736934696704 is working, number = 162
thread 140736943089408 end working ...
thread 140736943089408 start working ...
thread 140736943089408 is working, number = 163
thread 140737309640448 end working ...
thread 140737309640448 start working ...
thread 140737309640448 is working, number = 164
thread 140737334818560 end working ...
thread 140737334818560 start working ...
thread 140737334818560 is working, number = 165
thread 140737326425856 end working ...
thread 140737326425856 start working ...
thread 140737326425856 is working, number = 166
thread 140737301247744 end working ...
thread 140737301247744 start working ...
thread 140737301247744 is working, number = 167
thread 140736951482112 end working ...
thread 140736951482112 start working ...
thread 140736951482112 is working, number = 168
thread 140737343211264 end working ...
thread 140737343211264 start working ...
thread 140737343211264 is working, number = 169
thread 140737318033152 end working ...
thread 140737318033152 start working ...
thread 140737318033152 is working, number = 170
thread 140736934696704 end working ...
thread 140736934696704 start working ...
thread 140736934696704 is working, number = 171
thread 140736926304000 start working ...
thread 140736926304000 is working, number = 172
thread 140737309640448 end working ...
thread 140737309640448 start working ...
thread 140737309640448 is working, number = 173
thread 140737326425856 end working ...
thread 140737326425856 start working ...
thread 140737326425856 is working, number = 174
thread 140736943089408 end working ...
thread 140736943089408 start working ...
thread 140736943089408 is working, number = 175
thread 140736951482112 end working ...
thread 140736951482112 start working ...
thread 140736951482112 is working, number = 176
thread 140737318033152 end working ...
thread 140737318033152 start working ...
thread 140737318033152 is working, number = 177
thread 140737301247744 end working ...
thread 140737301247744 start working ...
thread 140737301247744 is working, number = 178
thread 140737334818560 end working ...
thread 140737334818560 start working ...
thread 140737334818560 is working, number = 179
thread 140737343211264 end working ...
thread 140737343211264 start working ...
thread 140737343211264 is working, number = 180
thread 140736934696704 end working ...
thread 140736934696704 start working ...
thread 140736934696704 is working, number = 181
thread 140736926304000 end working ...
thread 140736926304000 start working ...
thread 140736926304000 is working, number = 182
thread 140737309640448 end working ...
thread 140737309640448 start working ...
thread 140737309640448 is working, number = 183
thread 140737326425856 end working ...
thread 140737326425856 start working ...
thread 140737326425856 is working, number = 184
thread 140736951482112 end working ...
thread 140736951482112 start working ...
thread 140736951482112 is working, number = 185
thread 140737318033152 end working ...
thread 140737318033152 start working ...
thread 140737318033152 is working, number = 186
thread 140736943089408 end working ...
thread 140736943089408 start working ...
thread 140736943089408 is working, number = 187
thread 140737334818560 end working ...
thread 140737334818560 start working ...
thread 140737334818560 is working, number = 188
thread 140737301247744 end working ...
thread 140737301247744 start working ...
thread 140737301247744 is working, number = 189
thread 140737343211264 end working ...
thread 140737343211264 start working ...
thread 140737343211264 is working, number = 190
thread 140736934696704 end working ...
thread 140736934696704 start working ...
thread 140736934696704 is working, number = 191
thread 140736926304000 end working ...
thread 140736926304000 start working ...
thread 140736926304000 is working, number = 192
thread 140737309640448 end working ...
thread 140737309640448 start working ...
thread 140737309640448 is working, number = 193
thread 140737326425856 end working ...
thread 140737326425856 start working ...
thread 140737326425856 is working, number = 194
thread 140736951482112 end working ...
thread 140736951482112 start working ...
thread 140736951482112 is working, number = 195
thread 140736943089408 end working ...
thread 140736943089408 start working ...
thread 140736943089408 is working, number = 196
thread 140737334818560 end working ...
thread 140737334818560 start working ...
thread 140737334818560 is working, number = 197
thread 140737301247744 end working ...
thread 140737301247744 start working ...
thread 140737301247744 is working, number = 198
thread 140737318033152 end working ...
thread 140737318033152 start working ...
thread 140737318033152 is working, number = 199
thread 140737343211264 end working ...
thread 140736934696704 end working ...
thread 140736926304000 end working ...
thread 140737309640448 end working ...
thread 140737326425856 end working ...
thread 140736951482112 end working ...
thread 140736943089408 end working ...
thread 140737334818560 end working ...
thread 140737301247744 end working ...
thread 140737318033152 end working ...
threadExit() called, 140737343211264 exiting ...
threadExit() called, 140736934696704 exiting ...
threadExit() called, 140736926304000 exiting ...
threadExit() called, 140737309640448 exiting ...
threadExit() called, 140737326425856 exiting ...
threadExit() called, 140736951482112 exiting ...
threadExit() called, 140736943089408 exiting ...
threadExit() called, 140737301247744 exiting ...
threadExit() called, 140737318033152 exiting ...
```

### 结语

第十五篇博文写完，开心！！！！

今天，也是充满希望的一天。
