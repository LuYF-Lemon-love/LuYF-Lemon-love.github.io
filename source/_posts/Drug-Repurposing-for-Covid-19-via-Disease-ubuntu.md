---
title: Drug Repurposing for Covid-19 via Disease-ubuntu
tags:
  - Python
  - 人工智能
  - 深度学习
  - 知识图谱
  - 知识表示学习
  - 知识图谱补全
  - 药物重定位
categories: Python
description: 通过 TransE 进行药物重定位。
cover: 'https://cos.luyf-lemon-love.space/images/8885233608..png'
abbrlink: 1905961595
date: 2022-11-30 13:13:08
---

## 前言

`OpenCV` 的官网地址为：https://opencv.org/ 。

`OpenCV Tutorials` 的地址为：https://docs.opencv.org/4.x/d9/df8/tutorial_root.html 。

原教程链接: https://docs.opencv.org/4.x/db/df5/tutorial_linux_gcc_cmake.html .

操作系统：**Ubuntu 20.04.5 LTS**

## 参考文档

1. [Using OpenCV with gcc and CMake](https://docs.opencv.org/4.x/db/df5/tutorial_linux_gcc_cmake.html)

## 安装 `OpenCV`

操作系统:

```shell
$ hostnamectl
   Static hostname: lyfubuntu
         Icon name: computer-desktop
           Chassis: desktop
        Machine ID: 5035e8d52f2e4471805511e24788918c
           Boot ID: b20ae92003504b5d9bdee983093f9ea6
  Operating System: Ubuntu 20.04.5 LTS
            Kernel: Linux 5.15.0-53-generic
      Architecture: x86-64
```

安装 `OpenCV`:

```shell
$ sudo apt install libopencv-dev
```

g++, cmake 和 make:

```shell
$ g++ --version
g++ (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
Copyright (C) 2019 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

$ cmake --version
cmake version 3.16.3

CMake suite maintained and supported by Kitware (kitware.com/cmake).
$ make --version
GNU Make 4.2.1
为 x86_64-pc-linux-gnu 编译
Copyright (C) 1988-2016 Free Software Foundation, Inc.
许可证：GPLv3+：GNU 通用公共许可证第 3 版或更新版本<http://gnu.org/licenses/gpl.html>。
本软件是自由软件：您可以自由修改和重新发布它。
在法律允许的范围内没有其他保证。
```

## 使用 OpenCV 创建程序

创建一个名为 `DisplayImage.cpp` 的文件, 如下所示.

```c++
#include <stdio.h>
#include <opencv2/opencv.hpp>
using namespace cv;
int main(int argc, char** argv )
{
    if ( argc != 2 )
    {
        printf("usage: DisplayImage.out <Image_Path>\n");
        return -1;
    }
    Mat image;
    image = imread( argv[1], 1 );
    if ( !image.data )
    {
        printf("No image data \n");
        return -1;
    }
    namedWindow("Display Image", WINDOW_AUTOSIZE );
    imshow("Display Image", image);
    waitKey(0);
    return 0;
}
```

## 结语

第四十篇博文写完，开心！！！！

今天，也是充满希望的一天。