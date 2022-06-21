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

2. [生产者消费者问题](https://baike.baidu.com/item/%E7%94%9F%E4%BA%A7%E8%80%85%E6%B6%88%E8%B4%B9%E8%80%85%E9%97%AE%E9%A2%98)

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

### 线程 ID 比较

`线程 ID` 的类型本质是无符号长整型，因此可以直接用比较运算符比较。也可以使用 `线程 ID 比较函数` 比较。

```c
#include <pthread.h>
int pthread_equal(pthread_t t1, pthread_t t2);
```

- `t1` 和 `t2`: 要比较的线程 ID。

- `返回值`: 相等返回非 0 值，不相等返回 0。

### 线程同步

线程同步保证多个线程只能有一个线程在访问共享资源。保证共享资源对于所有线程具有一致性。

{% label 不进行线程同步 pink %}

```c
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <string.h>
#include <pthread.h>

#define MAX 50

int number;

void* funcA_num(void* arg)
{
    for(int i = 0; i < MAX; ++i)
    {
        int cur = number;
        cur++;
        usleep(10);
        number = cur;
        printf("Thread A, id = %lu, number = %d\n", pthread_self(), number);
    }

    return NULL;
}

void* funcB_num(void* arg)
{
    for(int i = 0; i < MAX; ++i)
    {
        int cur = number;
        cur++;
        number = cur;
        printf("Thread B, id = %lu, number = %d\n", pthread_self(), number);
        usleep(5);
    }

    return NULL;
}

int main(int argc, const char* argv[])
{
    pthread_t p1, p2;

    pthread_create(&p1, NULL, funcA_num, NULL);
    pthread_create(&p2, NULL, funcB_num, NULL);

    pthread_join(p1, NULL);
    pthread_join(p2, NULL);

    return 0;
}
```

{% span cyan, 编译并执行上面代码，可以发现最终的 number 小于 100。%}

---

{% span cyan, CPU 的寄存器、一级缓存、二级缓存和三级缓存对于每个线程是独占的，用于存储处理的数据和线程的状态信息，即分时复用 CPU 时间片时上下文切换保存的状态。线程计算完成的数据需要从 CPU 保存到内存中，最终再通过文件 IO 将数据从内存保存到磁盘中。%}

当某一个线程未将某一循环中计算完成的数据保存到内存中时，失去了 CPU 时间片。另一个得到 CPU 时间片的线程从物理内存读取数据。因此这个线程只能基于旧数据计算，并将计算后的数据保存到内存中，然后继续循环计算，直到这个线程失去了 CPU 时间片。由于我们上面的例子中只有两个线程，上一个失去CPU 时间片获得 CPU 时间片，将还未来得及保存到内存的数据保存到内存中，覆盖了另一个线程保存的数据。因此导致最终的 number 小于 100。

线程同步共有 4 种，{% label 互斥锁 pink %}、{% label 读写锁 red %}、{% label 条件变量 purple %} 和 {% label 信号量 green %}。共享资源被称为临界资源。{% label 临界资源相关的上下文代码块被称为临界区。 orange %}

线程同步：需要在临界区上边添加锁函数，对临界区加锁；在临界区下边添加解锁函数，对临界区解锁。某一线程会将临界区锁定，防止其他线程和它同时访问临界区，等到它访问完成，对临界区解锁，其他被阻塞且抢到锁的线程对临界区加锁，访问临界区。

`锁机制保证任何时刻只能有一个线程可以访问临界区。`

### 互斥锁

互斥锁的类型为 `pthread_mutex_t`。该类型保存了锁的状态：锁定还是未锁定；加锁的线程 ID。一个互斥锁只能被一个线程锁定，其他想对临界区加锁的线程将被阻塞。直到这把互斥锁被加锁的线程解锁，被阻塞的线程才能解除阻塞。互斥锁的数量和共享资源的个数相同。

```c
pthread_mutex_t mutex;
```

只有 `restrict` 修饰的指针可以访问该地址。

```c
// 初始化互斥锁
int pthread_mutex_init(pthread_mutex_t *restrict mutex, const pthread_mutexattr_t *restrict attr);

// 释放互斥锁
int pthread_mutex_destroy(pthread_mutex_t *mutex);
```

- `mutex`: 互斥锁变量的地址。

- `attr`: 互斥锁的属性，一般为 NULL。

```c
// 加锁
int pthread_mutex_lock(pthread_mutex_t *mutex);
```

```c
// 尝试加锁
// 如果锁没有被锁定，则加锁成功；如果锁已被锁定，则尝试加锁的线程不会被阻塞
int pthread_mutex_trylock(pthread_mutex_t *mutex);
```

```c
// 解锁
int pthread_mutex_unlock(pthread_mutex_t *mutex);
```

{% label 进行线程同步 pink %}

```c
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <string.h>
#include <pthread.h>

#define MAX 50

int number;

pthread_mutex_t mutex;

void* funcA_num(void* arg)
{
    for(int i = 0; i < MAX; ++i)
    {
        pthread_mutex_lock(&mutex);
        int cur = number;
        cur++;
        usleep(10);
        number = cur;
        pthread_mutex_unlock(&mutex);
        printf("Thread A, id = %lu, number = %d\n", pthread_self(), number);
    }

    return NULL;
}

void* funcB_num(void* arg)
{
    for(int i = 0; i < MAX; ++i)
    {
        pthread_mutex_lock(&mutex);
        int cur = number;
        cur++;
        number = cur;
        pthread_mutex_unlock(&mutex);
        printf("Thread B, id = %lu, number = %d\n", pthread_self(), number);
        usleep(5);
    }

    return NULL;
}

int main()(int argc, const char* argv[])
{
    pthread_t p1, p2;

    pthread_mutex_init(&mutex, NULL);

    pthread_create(&p1, NULL, funcA_num, NULL);
    pthread_create(&p2, NULL, funcB_num, NULL);

    pthread_join(p1, NULL);
    pthread_join(p2, NULL);

    pthread_mutex_destroy(&mutex);

    return 0;
}
```

### 死锁

死锁现象：所有的线程都被阻塞，并且所有线程的阻塞都无法解开（解锁的线程也被阻塞了）。

{% label 死锁现象1——加锁之后忘记解锁 pink %}

```c
void func()
{
    for(int i = 0; i < 6; ++i)
    {
        pthread_mutex_lock(&mutex);
    }
}
```

```c
void func()
{
    for(int i = 0; i < 6; ++i)
    {
        pthread_mutex_lock(&mutex);

        if (condition)
        {
            return;
        }

        pthread_mutex_unlock(&mutex);
    }
}
```

{% label 死锁现象2——重复加锁 pink %}

```c
void func()
{
    for(int i = 0; i < 6; ++i)
    {
        pthread_mutex_lock(&mutex);

        pthread_mutex_lock(&mutex);

        pthread_mutex_unlock(&mutex);
    }
}
```

```c
void funcA()
{
    for(int i = 0; i < 6; ++i)
    {
        pthread_mutex_lock(&mutex);

        pthread_mutex_unlock(&mutex);
    }
}

void funcB()
{
    for(int i = 0; i < 6; ++i)
    {
        pthread_mutex_lock(&mutex);

        funcA();

        pthread_mutex_unlock(&mutex);
    }
}
```

{% label 死锁现象3——多个共享资源，多个线程，随意加锁 pink %}

![](https://cos.luyf-lemon-love.space/images/20220620225726.png)

{% label 避免死锁 pink %}

- 避免多次锁定。

- {% label 对共享资源访问完毕之后，一定要解锁。 pink %}

- 控制多个共享资源访问顺序，即控制加锁解锁顺序。

- {% label 对其他互斥锁加锁前，先释放拥有的互斥锁。 pink %}

### 读写锁

`读写锁是互斥锁的升级版，读操作是并行的`。读写锁的类型为 `pthread_rwlock_t`。该类型包含以下信息：`锁定 / 打开`、`读操作 / 写操作` 和 `线程 ID`。

```c
pthread_rwlock_t rwlock;
```

`读写锁` 锁定了 `读操作`，需要`先解锁`才能去`锁定写操作`，反之亦然。

读写锁的使用方式和互斥锁的使用方式完全相同。

- 使用读写锁的`读锁`锁定了临界区，线程对临界区的访问是并行的，`读锁是共享的`。

- 使用读写锁的`写锁`锁定了临界区，线程对临界区的访问是串行的，`写锁是独占的`。

- 两个线程要同时访问`读锁`和`写锁`锁定的两个临界区。访问`写锁锁定的临界区`线程先访问，访问`读锁锁定的临界区`的线程被阻塞。`写锁的优先级更高`。

- `读写锁`对读操作比写操作多的场景有优势。

```c
#include <pthread.h>
pthread_rwlock_t rwlock;

// 初始化读写锁
int pthread_rwlock_init(pthread_rwlock_t *restrict rwlock, const pthread_rwlockattr_t *restrict attr);

// 释放读写锁
int pthread_rwlock_destroy(pthread_rwlock_t *rwlock);
```

- `rwlock`: 读写锁变量的地址。

- `attr`: 读写锁的属性，一般为 NULL。

```c
// 加读锁
int pthread_rwlock_rdlock(pthread_rwlock_t *rwlock);
```

```c
// 尝试加读锁，加锁失败，不会阻塞当前线程
int pthread_rwlock_tryrdlock(pthread_rwlock_t *rwlock);
```

```c
// 加写锁
int pthread_rwlock_wrlock(pthread_rwlock_t *rwlock);
```

```c
// 尝试加写锁，加锁失败，不会阻塞当前线程
int pthread_rwlock_trywrlock(pthread_rwlock_t *rwlock);
```

```c
// 解锁，读锁和写锁都可以解锁
int pthread_rwlock_unlock(pthread_rwlock_t *rwlock);
```

{% label 读写锁的使用 pink %}

```c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <pthread.h>

int number = 0;

pthread_rwlock_t rwlock;

void* writeNum(void* arg)
{
    while(1)
    {
        pthread_rwlock_wrlock(&rwlock);
        int cur = number;
        cur++;
        number = cur;
        printf("写操作完毕，number = %d, tid = %ld\n", number, pthread_self());
        pthread_rwlock_unlock(&rwlock);

        usleep(rand() % 100);
    }

    return NULL;
}

void* readNum(void* arg)
{
    while(1)
    {
        pthread_rwlock_rdlock(&rwlock);
        printf("读操作完毕，number = %d, tid = %ld\n", number, pthread_self());
        pthread_rwlock_unlock(&rwlock);
        usleep(rand() % 100);
    }

    return NULL;
}

int main()
{
    pthread_rwlock_init(&rwlock, NULL);

    pthread_t wtid[3];
    pthread_t rtid[5];
    for(int i = 0; i < 3; ++i)
    {
        pthread_create(&wtid[i], NULL, writeNum, NULL);
    }

    for(int i = 0; i < 5; ++i)
    {
        pthread_create(&rtid[i], NULL, readNum, NULL);
    }

    for(int i = 0; i < 3; ++i)
    {
        pthread_join(wtid[i], NULL);
    }

    for(int i = 0; i < 5; ++i)
    {
        pthread_join(rtid[i], NULL);
    }

    pthread_rwlock_destroy(&rwlock);

    return 0;
}
```

### 条件变量

{% label 条件变量 pink %}

条件变量在满足条件时会阻塞线程。条件变量配合互斥锁用于处理生产者和消费者模型。

条件变量类型为 `pthread_cond_t`，被条件变量阻塞的线程的信息被记录在这个类型变量中。

```c
pthread_cond_t cond;
```

```c
#include <pthread.h>
pthread_cond_t cond;

// 初始化
int pthread_cond_init(pthread_cond_t *restrict cond, const pthread_condattr_t *restrict attr);

// 释放资源
int pthread_cond_destroy(pthread_cond_t *cond);
```

- `cond`: 条件变量的地址。

- `attr`: 条件变量的属性，一般为 NULL。

```c
// 线程阻塞函数
int pthread_cond_wait(pthread_cond_t *restrict cond, pthread_mutex_t *restrict mutex);
```

- `pthread_cond_wait` 函数的作用可以参考下面例子（生产者和消费者问题）中的消费者线程函数（`consumer函数`）。

- 在 `阻塞消费者线程` 时候（`内层的while循环`)，该函数会把当前消费者之前上的锁 `mutex` 打开。

- 当 `消费者线程解除阻塞` 时候，该函数会帮助这个消费者线程将这个 `mutex` 互斥锁再次锁上。消费者线程继续访问临界区。

```c
// 时间是从 1971.1.1 0:0:0 到当前的时间，总长度是两个成员变量的和。
struct timespec {
    
    // Seconds
    time_t tv_sec;

    // Nanoseconds
    long tv_nsec;
};

// 阻塞线程一段时间
int pthread_cond_timedwait(pthread_cond_t *restrict cond, pthread_mutex_t *restrict mutex, const struct timespec *restrict abstime);
```

```c
// 时间是从 1971.1.1 0:0:0 到当前的时间，总秒数
time_t mytime = time(NULL);

struct timespec tmsp;

// 线程阻塞 100s
tmsp.tv_sec = time(NULL) + 100;
tmsp.tv_nsec = 0;
```

```c
// 唤醒阻塞在条件变量上的线程，至少有一个线程被解除阻塞
int pthread_cond_signal(pthread_cond_t *cond);

// 唤醒阻塞在条件变量上的线程，被阻塞的线程全部被解除阻塞
int pthread_cond_broadcast(pthread_cond_t *cond);
```

{% label 生产者和消费者问题 pink %}

生产者消费者问题（英语：Producer-consumer problem），也称有限缓冲问题（英语：Bounded-buffer problem），是一个多线程同步问题的经典案例。该问题描述了两个共享固定大小缓冲区的线程——即所谓的“生产者”和“消费者”——在实际运行时会发生的问题。生产者的主要作用是生成一定量的数据放到缓冲区中，然后重复此过程。与此同时，消费者也在缓冲区消耗这些数据。该问题的关键就是要保证生产者不会在缓冲区满时加入数据，消费者也不会在缓冲区中空时消耗数据。该问题也能被推广到多个生产者和消费者的情形。

![](https://cos.luyf-lemon-love.space//images/20220621163744.png)

>场景描述：使用条件变量实现生产者和消费者模型，生产者和消费者各 5 个，生产者在链表头部添加节点；消费者在链表头部删除节点。由于缓存区是链表，所以生产者可以一直生产。

```c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <pthread.h>

struct Node
{
    int number;
    struct Node* next;
};

pthread_cond_t cond;

pthread_mutex_t mutex;

struct Node * head = NULL;

void* producer(void* arg)
{
    while(1)
    {
        pthread_mutex_lock(&mutex);

        struct Node* pnew = (struct Node*)malloc(sizeof(struct Node));

        pnew->number = rand() % 1000;

        pnew->next = head;

        head = pnew;

        printf("producer, number = %d, tid = %ld\n", pnew->number, pthread_self());

        pthread_mutex_unlock(&mutex);

        pthread_cond_broadcast(&cond);

        sleep(rand() % 3);
    }

    return NULL;
}

void* consumer(void* arg)
{
    while(1)
    {
        pthread_mutex_lock(&mutex);

        // 一定要用循环，不要用 if 条件判断
        while(head == NULL)
        {
            pthread_cond_wait(&cond, &mutex);
        }

        struct Node* pnode = head;
        printf("consumer, number = %d, tid = %ld\n", pnode->number, pthread_self());
        head = pnode->next;
        free(pnode);
        pthread_mutex_unlock(&mutex);

        sleep(rand() % 3);
    }

    return NULL;    
}

int main()
{
    pthread_cond_init(&cond, NULL);
    pthread_mutex_init(&mutex, NULL);

    pthread_t ptid[5];
    pthread_t ctid[5];

    for(int i = 0; i < 5; ++i)
    {
        pthread_create(&ptid[i], NULL, producer, NULL);
    }

    for(int i = 0; i < 5; ++i)
    {
        pthread_create(&ctid[i], NULL, consumer, NULL);
    }

    for(int i = 0; i < 5; ++i)
    {
        pthread_join(ptid[i], NULL);
    }

    for(int i = 0; i < 5; ++i)
    {
        pthread_join(ctid[i], NULL);
    }

    pthread_cond_destroy(&cond);
    pthread_mutex_destroy(&mutex);

    return 0;
}
```

### 信号量

### 结语

第十四篇博文写完，开心！！！！

今天，也是充满希望的一天。