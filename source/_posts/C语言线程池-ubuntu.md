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

### 头文件

### 结语

第十五篇博文写完，开心！！！！

今天，也是充满希望的一天。
