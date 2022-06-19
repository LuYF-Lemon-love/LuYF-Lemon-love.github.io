---
title: C语言多线程-ubuntu
tags:
  - C/C++
  - 多线程
  - GCC
  - 进程
  - Linux
categories: C
description: 介绍 C 语言的线程。
cover: 'https://cos.luyf-lemon-love.space/images/20220604154620.png'
abbrlink: 1066633904
date: 2022-06-19 18:37:01
---

### 前言

线程是轻量级的进程（LWP: light weight process），在 Linux 环境下线程的本质是进程。`进程是资源分配的最小单位，线程是操作系统调度执行的最小单位。`

{% label 进程 pink %}

- 进程有自己独立的地址空间，多个线程共用同一个地址空间。

- 进程是操作系统中最小的资源分配单位。

- 每个进程对应一个虚拟地址空间，一个进程只能抢一个 CPU 时间片。

{% label 线程 pink %}

- 线程比进程更加节省系统资源，效率更高。

- 每个线程都有属于自己的栈区和寄存器。

- 代码段、堆区、全局数据区和打开的文件（文件描述符表）是的线程共享的。

- 线程是程序的最小执行单位。

- 一个地址空间中可以划分出多个线程，在有效的资源基础上，能够抢更多的 CPU 时间片。

- 线程的上下文切换比进程要快的多。

- 线程更加廉价，启动速度更快，退出速度也快，对系统资源的冲击小。

{% span cyan, 进程和线程的分时复用 CPU 时间片时，在切换之前会将上一个任务的状态进行保存，下次切换回这个任务的时候，加载这个状态继续运行，任务从保存到再次加载这个过程是一次上下文切换。 %}

`在处理多任务时，使用线程比使用进程更有优势。`

建议的线程数：

- `文件 IO 操作`: 文件 IO 对 CPU 使用率不高，线程的个数 = 2 * CPU 的核心数

- `高 CPU 的算法操作`: 线程的个数 = CPU 的核心数

操作系统：Ubuntu 20.04.4 LTS

### 参考文档

1. [苏丙榅老师的多线程教程](https://subingwen.cn/linux/thread/)

### 创建线程

线程的 ID 类型为 `pthread_t`，本质是无符号长整型。

{% label 返回当前线程ID的函数 pink %}

```c
pthread_t pthread_self(void);
```

{% label 创建线程的函数 pink %}

```c
#include <pthread.h>
int pthread_create(pthread_t *thread, const pthread_attr_t *attr, void *(*start_routine)(void *), void *arg);
```

- `thread`: 传出参数，该指针指向的内存用于保存线程 ID。

- `attr`: 线程的属性，一般为 NULL。

- `start_routine`: 函数指针。

- `arg`: 函数指针 `start_routine` 的实参。

- `返回值`: 线程创建成功返回 0。

函数指针 `start_routine` 的类型为 `void * (*start_routine)(void *)`。

```c
// pthread_create.c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <pthread.h>

void* working(void* arg)
{
    printf("子线程，ID： %ld\n", pthread_self());
    for(int i = 0; i < 9; ++i)
    {
        printf("child i = %d\n", i);
    }

    return NULL;
}

int main()
{
    pthread_t tid;
    pthread_create(&tid, NULL, working, NULL);

    printf("子线程创建成功，ID：%ld\n", tid);
    printf("主线程，ID：%ld\n", pthread_self());

    for(int i = 0; i < 3; ++i)
    {
        printf("main i = %d\n", i);
    }

    // 挂起主线程，使得子线程有机会抢到 CPU 时间片
    sleep(1);

    return 0;
}
```

{% label 线程的动态链接库为libpthread.so pink %}

```shell
gcc pthread_create.c -lpthread

./a.out
```

{% span cyan, 正常情况下，主线程控制虚拟地址空间（虚拟地址空间的生命周期和主线程相同），当主线程退出时，虚拟地址空间将被释放，因此子线程也将被销毁。但是子线程退出时，不会释放虚拟地址空间。 %}

### 线程退出

### 结语

第十四篇博文写完，开心！！！！

今天，也是充满希望的一天。