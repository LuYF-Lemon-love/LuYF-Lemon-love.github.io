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
    printf("子线程，ID：%ld\n", pthread_self());
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

线程退出函数，只会退出该线程，并不会释放虚拟地址空间（主线程）。

```c
#include <pthread.h>
void pthread_exit(void *retval);
```

- `retval`: 线程退出时返回的数据，主线程会得到该子线程的该数据。如果没有返回的数据，`retval` 指定为 NULL。

```c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <pthread.h>

void* working(void* arg)
{
    sleep(1);

    printf("子线程，ID：%ld\n", pthread_self());

    for(int i = 0; i < 9; ++i)
    {
        if(i == 6)
        {
            pthread_exit(NULL);
        }
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

    // 主线程调用退出函数退出时，虚拟地址空间不会被释放
    pthread_exit(NULL);

    return 0;
}
```

### 线程回收

线程回收函数是 `pthread_join()`，该函数会阻塞当前线程（一般为主线程），直到要回收的子线程退出。可以通过该函数获得子线程退出时返回的数据。

```c
#include <pthread.h>
int pthread_join(pthread_t thread, void **retval)
```

- `thread`: 子线程的 ID。

- `retval`: 传出参数，该块内存保存了子线程中的 `pthread_exit()` 方法传递出的数据。如果不需要该参数获得子线程返回的数据，指定为 NULL。

- `返回值`: 线程回收成功返回 0。

{% label 数据保存在子线程的栈区 pink %}

```c
// pthread_join.c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <pthread.h>

struct Person
{
    int id;
    char name[36];
    int age;
};

void* working(void* arg)
{
    printf("子线程，ID：%ld\n", pthread_self());
    
    for(int i = 0; i < 9; ++i)
    {
        printf("child i = %d\n", i);
        if(i == 6)
        {
            struct Person p;
            p.age = 12;
            strcpy(p.name, "susu");
            p.id = 1;
            
            pthread_exit(&p);
        }
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

    void* ptr = NULL;
    pthread_join(tid, &ptr);

    struct Person* pp = (struct Person*)ptr;
    
    pritnf("子线程返回数据 name: %s, age: %d, id: %d\n", pp->name, pp->age, pp->id);
    printf("子线程资源被成功回收...\n");

    return 0;
}
```

{% label 编译并执行程序 pink %}

```shell
gcc pthread_join.c -lpthread

./a.out
```

运行结果显示主线程并没有获取子线程返回的数据，由于子线程的栈区的生命周期与子线程相同，因此当子线程退出后，子线程的栈区将被回收，主线程并不能得到子线程返回的栈区数据。

{% label 数据保存在全局变量中 pink %}

位于同一个虚拟地址空间中的线程，可以共享全局数据区和堆区数据（全局变量、静态变量和堆内存）。

```c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <pthread.h>

struct Person
{
    int id;
    char name[36];
    int age;
};

struct Person p;

void* working(void* arg)
{
    printf("子线程，ID：%ld\n", pthread_self());
    for(int i = 0; i < 9; ++i)
    {
        printf("child i = %d\n", i);
        if(i == 6)
        {
            p.age = 12;
            strcpy(p.name, "susu");
            p.id = 1;
            pthread_exit(&p);
        }
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

    void* ptr = NULL;
    pthread_join(tid, &ptr);

    // ptr(需要转换类型为 struct Person*) 和 p 都可以访问子线程传出的数据
    struct Person* pp = (struct Person*)ptr;

    pritnf("子线程返回数据 name: %s, age: %d, id: %d\n", pp->name, pp->age, pp->id);
    printf("子线程资源被成功回收...\n");

    return 0;
}
```

{% label 数据保存在主线程栈区中 pink %}

```c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <pthread.h>

struct Person
{
    int id;
    char name[36];
    int age;
};

void* working(void* arg)
{
    struct Person* p = (struct Person*)arg;
    printf("子线程，ID：%ld\n", pthread_self());

    for(int i = 0; i < 9; ++i)
    {
        printf("child i = %d\n", i);
        if(i == 6)
        {
            p->age = 12;
            strcpy(p->name, "susu");
            p->id = 1;

            pthread_exit(p);
        }
    }

    return NULL;
}

int main()
{
    pthread_t tid;
    struct Person p;

    pthread_create(&tid, NULL, working, &p);

    printf("子线程创建成功，ID：%ld\n", tid);
    printf("主线程，ID：%ld\n", pthread_self());

    for(int i = 0; i < 3; ++i)
    {
        printf("main i = %d\n", i);
    }

    void* ptr = NULL;
    pthread_join(tid, &ptr);

    // ptr(需要转换类型为 struct Person*) 和 p 都可以访问子线程传出的数据
    pritnf("子线程返回数据 name: %s, age: %d, id: %d\n", p.name, p.age, p.id);
    printf("子线程资源被成功回收...\n");

    return 0;
}
```

### 线程分离

线程分离函数 `pthread_detach()` 可以使子线程和主线程分离，子线程退出时会被其他进程回收。

```c
#include <pthread.h>
int pthread_detach(pthread_t thread);
```

{% label 主线程和子线程的分离 pink %}

```c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <pthread.h>

void* working(void* arg)
{
    printf("字线程，ID：%ld\n", pthread_self());

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

    pthread_detach(tid);

    pthread_exit(NULL);

    return 0;
}
```

### 线程取消

线程取消函数 `pthread_cancel` 可以使一个线程 kill 另一个线程。下面是 kill 一个线程的步骤：

1. 线程 A 中调用线程取消函数 `pthread_cancel`，指定杀死线程 B。

2. 线程 B 调用一次系统调用（内核函数即系统函数）。

3. 线程 B 被 kill。

```c
#include <pthread.h>
int pthread_cancel(pthread_t thread);
```

- `thread`: 要 kill 的线程的 ID。

- `返回值`: 函数调用成功返回 0。

```c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <pthread.h>

void* working(void* arg)
{
    int j = 0;
    for(int i = 0; i < 9; ++i)
    {
        j++;
    }

    // printf 函数会调用系统函数
    printf("子线程，ID：%ld\n", pthread_self());

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

    pthread_cancel(tid);

    pthread_exit(NULL);

    return 0;
}
```

{% note blue 'fas fa-bullhorn' simple %}
系统调用的两种方式：

1. 直接调用 Linux 系统函数。

2. 调用 C 语言的标准库函数。
{% endnote %}

### 线程 ID 比较函数

`线程 ID` 的类型本质是无符号长整型，因此可以直接用比较运算符比较。也可以使用 `线程 ID 比较函数` 比较。

```c
#include <pthread.h>
int pthread_equal(pthread_t t1, pthread_t t2);
```

- `t1` 和 `t2`: 要比较的线程 ID。

- `返回值`: 想等返回非 0 值，不相等返回 0。

### 线程同步

### 结语

第十四篇博文写完，开心！！！！

今天，也是充满希望的一天。