---
title: C/C++和Python多线程初探-ubuntu
tags:
  - C/C++
  - Python
  - 多线程
  - 全局解释器锁（GIL）
  - VSCode
categories: C/C++和Python混合编程
description: 利用 C/C++ 的多线程实现 Python 的真正的多线程
cover: >-
  https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220520214859.png
abbrlink: 4010919642
date: 2022-05-22 16:34:09
---

### 前言

GIL：又称全局解释器锁。作用是限制多线程同时执行，保证同一时间内只有一个线程在执行。Python 由于 GIL 的存在，导致在多核 CPU 上，只能利用一个 CPU 的资源。

Python 自带的多线程在多核 CPU 上，只对于 IO 密集型计算产生正面效果；而当有至少有一个CPU密集型线程存在，那么多线程效率会由于GIL而大幅下降。

但是我们可以通过 ctypes 库引用 **动态链接库** 来实现真正的多线程。

本博文的代码在 Linux 版本的 Visual Studio Code 上测试的。

操作系统（本地）：Ubuntu 20.04.4 LTS

### 参考文档

1. [深入理解Python中的GIL（全局解释器锁）](https://blog.csdn.net/qq_50840738/article/details/123861602)

2. [python实现真正的多线程](https://blog.csdn.net/Chelseady/article/details/106793740?spm=1001.2014.3001.5506)

3. [C++ 多线程](https://www.w3cschool.cn/cpp/cpp-multithreading.html)

4. [Using C++ on Linux in VSCode](https://code.visualstudio.com/docs/cpp/config-linux)

### 配置 C/C++ 的环境

1. 安装 [Visual Studio Code](https://code.visualstudio.com/download)。

2. 为 VSCode 安装 C++ 的扩展，你能在扩展处（ Ctrl+Shift+X ）搜索 'c++' 来安装 C/C++ 的扩展。扩展为

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220522172757.png)

3. 确保 GCC 已经被安装。

```shell
# First, check to see whether GCC is already installed.
gcc -v

# If GCC isn't installed, run the following command from the terminal window.
sudo apt-get update
sudo apt-get install build-essential gdb
```

4. 创建 Hello World

```shell
mkdir projects
cd projects
mkdir helloworld
cd helloworld
code .
```

5. 进入到 VSCode 界面上后，在文件资源管理器的标题栏处，新建一个 helloword.cpp，粘贴下面代码，然后 Ctrl+S 保存文件

```c++
#include <iostream>
#include <vector>
#include <string>

using namespace std;

int main()
{
	vector<string> msg {"Hello", "C++", "World", "from", "VS Code", "and the C++ extension!"};

	for (const string& word : msg)
	{
		cout << word << " ";
	}
	cout << endl;
}
```

6. 打开 helloworld.cpp 文件，按 F5 启动调试，选择 C++（GDB/LLDB）> C/C++: g++ 生成和调试活动文件。

7. 运行完成后，你将要在命令行看到下面的输出

```
Hello C++ World from VS Code and the C++ extension!
```

### C++ 多线程

C++ 不包含多线程应用程序的任何内置支持。相反，它完全依赖于操作系统来提供此功能。

本博文假设您使用的是 Linux 操作系统，我们将使用 POSIX Threads 或 Pthreads 提供的 API 编写多线程 C++ 程序。

可移植操作系统接口（英语：Portable Operating System Interface，缩写为POSIX）是 IEEE 为要在各种 UNIX 操作系统上运行软件，而定义 API 的一系列互相关联的标准的总称。

进入到 VSCode 中，在 VSCode 下面的终端运行下面的命令创建运行目录

```shell
mkdir C++多线程
cd C++多线程
mkdir 01实例
cd 01实例
```

#### 01实例

新建一个 01实例.cpp 文件，粘贴下面代码，然后 Ctrl+S 保存文件

```c++
//文件名：01实例.cpp

#include<iostream>

// 必须的头文件是
#include <pthread.h>

using namespace std;

#define NUM_THREADS 5

// 线程的运行函数
void* say_hello(void* args)
{
    cout << "Hello World!" << endl;
}

int main()
{
    // 定义线程的 id 变量，多个变量使用数组
    pthread_t tids[NUM_THREADS];
    for(int i = 0; i < NUM_THREADS; ++i)
    {
        //参数依次是：创建的线程id，线程参数，调用的函数，传入的函数参数
        int ret = pthread_create(&tids[i], NULL, say_hello, NULL);
        if (ret != 0)
        {
            cout << "pthread_create error: error_code=" << ret << endl;
        }
    }
    //等各个线程退出后，进程才结束，否则进程强制结束了，线程可能还没反应过来；
    pthread_exit(NULL);
}
```

运行下面命令

```shell
g++ 01实例.cpp -lpthread -o 01实例
./01实例
```

打印出下面内容，由于多线程的作用，输出并不是完全按照顺序的，可以发现的有的 `Hello World!` 的换行符还没打印就开始打印其他线程的 `Hello World` 了。

```
Hello World!Hello World!Hello World!


Hello World!
Hello World!
```

#### 02实例 - 接受传入参数

运行下面的命令创建 02实例 目录

```shell
cd ..
mkdir 02实例
cd 02实例/
```

新建一个 02实例.cpp 文件，粘贴下面代码，然后 Ctrl+S 保存文件

```c++
//文件名：02实例.cpp

#include <iostream>
#include <pthread.h>

using namespace std;

#define NUM_THREADS 5

void *PrintHello(void *threadid)
{
    //对传入的参数进行强制类型转换，由无类型指针变为整形数指针，然后再读取
    int tid = *((int*)threadid);
    cout << "线程 ID, " << tid << endl;
    pthread_exit(NULL);
}

int main()
{
    pthread_t threads[NUM_THREADS];
    int indexes[NUM_THREADS]; //用数组来保存i的值
    int rc;
    int i;
    for (i=0; i < NUM_THREADS; i++) {
        cout << "main() : 创建线程，" << i << endl;
        indexes[i] = i; //先保存i的值
        // 传入的时候必须强制转换为void* 类型，即无类型指针
        rc = pthread_create(&threads[i], NULL,
                            PrintHello, (void *)&(indexes[i]));

        if (rc) {
            cout << "Error:无法创建线程，" << rc << endl;
            exit(-1);
        }
    }
    pthread_exit(NULL);
}
```

运行下面命令

```shell
g++ 02实例.cpp -lpthread -o 02实例
./02实例
```

打印出下面内容，由于多线程的作用，发现有的线程还没创建，已经有线程运行完了。

```
main() : 创建线程，0
main() : 创建线程，1
线程 ID, 0
main() : 创建线程，2
main() : 创建线程，3
main() : 创建线程，4
线程 ID, 1
线程 ID, 2
线程 ID, 4
线程 ID, 3
```

#### 03实例 - 接受结构体参数

运行下面的命令创建 03实例 目录

```shell
cd ..
mkdir 03实例
cd 03实例/
```

新建一个 03实例.cpp 文件，粘贴下面代码，然后 Ctrl+S 保存文件

```c++
//文件名：03实例.cpp

#include <iostream>
#include <pthread.h>

using namespace std;

#define NUM_THREADS 5

struct thread_data{
    int thread_id;
    char *message;
};

void *PrintHello(void *threadarg)
{
    struct thread_data *my_data;

    my_data = (struct thread_data *) threadarg;

    cout << "Thread ID : " << my_data->thread_id;
    cout << " Message : " << my_data->message << endl;

    pthread_exit(NULL);
}

int main()
{
    pthread_t threads[NUM_THREADS];
    struct thread_data td[NUM_THREADS];
    int rc;
    int i;

    for (i=0; i < NUM_THREADS; i++) {
        cout << "main() : creating thread, " << i << endl;
        td[i].thread_id = i;
        td[i].message = "This is message";
        rc = pthread_create(&threads[i], NULL,
                PrintHello, (void *)&td[i]);
        if (rc) {
            cout << "Error:unable to create thread," << rc << endl;
            exit(-1);
        }
    }
    pthread_exit(NULL);
}
```

运行下面命令

```shell
g++ 03实例.cpp -lpthread -o 03实例
./03实例
```

打印出下面内容，由于多线程的作用，发现有的线程还没创建，已经有线程运行完了。

```
main() : creating thread, 0
main() : creating thread, 1
main() : creating thread, 2
Thread ID : 0 Message : This is message
main() : creating thread, 3
Thread ID : 2 Message : This is message
main() : creating thread, 4
Thread ID : 3 Message : This is message
Thread ID : 1 Message : This is message
Thread ID : 4 Message : This is message
```

#### 04实例 - pthread_join

运行下面的命令创建 04实例 目录

```shell
cd ..
mkdir 04实例
cd 04实例/
```

新建一个 04实例.cpp 文件，粘贴下面代码，然后 Ctrl+S 保存文件

```c++
//文件名：04实例.cpp

#include <iostream>
#include <pthread.h>
#include <unistd.h>

using namespace std;

#define NUM_THREADS 5

void *wait(void *t)
{
    int i;
    long tid;

    tid = (long)t;

    sleep(1);
    cout << "Sleeping in thread " << endl;
    cout << "Thread with id : " << tid << " ...exiting " << endl;
    pthread_exit(NULL);
}

int main()
{
    int rc;
    int i;
    pthread_t threads[NUM_THREADS];
    pthread_attr_t attr;
    void *status;

    // 初始化并设置线程为可连接的（joinable)
    pthread_attr_init(&attr);
    pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE);

    for (i=0; i < NUM_THREADS; i++) {
        cout << "main() : creating thread, " << i << endl;
        rc = pthread_create(&threads[i], NULL, wait, (void *)i);
        if (rc) {
            cout << "Error:unable to create thread," << rc << endl;
            exit(-1);
        }
    }

    //删除属性，并等待其他线程
    pthread_attr_destroy(&attr);
    for (i=0; i < NUM_THREADS; i++){
        rc = pthread_join(threads[i], &status);
        if (rc) {
            cout << "Error:unable to join," << rc << endl;
            exit(-1);
        }
        cout << "Main: completed thread id :" << i;
        cout << " exiting with status :" << status << endl;
    }

    cout << "Main: program exiting." << endl;
    pthread_exit(NULL);
}
```

运行下面命令

```shell
g++ 04实例.cpp -lpthread -o 04实例
./04实例
```

pthread_join() 子例程阻碍调用例程，直到指定的 threadid 线程终止为止。

打印出下面内容，由于 pthread_join() 函数的作用，线程完成是有顺序的。

```
main() : creating thread, 0
main() : creating thread, 1
main() : creating thread, 2
main() : creating thread, 3
main() : creating thread, 4
Sleeping in thread 
Sleeping in thread Thread with id : 1 ...exiting 

Thread with id : 0 ...exiting 
Main: completed thread id :0 exiting with status :0
Main: completed thread id :1 exiting with status :0
Sleeping in thread 
Thread with id : 2 ...exiting 
Main: completed thread id :2 exiting with status :0
Sleeping in thread 
Thread with id : 4 ...exiting 
Sleeping in thread 
Thread with id : 3 ...exiting 
Main: completed thread id :3 exiting with status :0
Main: completed thread id :4 exiting with status :0
Main: program exiting.
```

### 配置 Python 的环境


### 结语

第八篇博文写完，开心！！！！

今天，也是充满希望的一天。