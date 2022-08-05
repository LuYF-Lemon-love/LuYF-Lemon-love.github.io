---
title: CMake Examples 学习笔记-windows10
tags:
  - C/C++
  - GCC
  - MinGW
  - MSYS2
  - Windows
  - G++
  - CMake
  - Pacman
  - Clang
  - make
categories: 学习笔记
description: CMake Examples 项目的学习笔记，该项目介绍一些现代 CMake 的例子。
cover: 'https://cos.luyf-lemon-love.space/images/弗雷尔卓德.png'
abbrlink: 2876445371
date: 2022-08-05 21:35:50
---

### 前言

[CMake](https://cmake.org/) 是一个跨平台开源构建系统，可以构建、测试和打包软件。它可用于支持多个本地构建环境，包括 `make`，Apple 的 `xcode` 和 `Microsoft Visual Studio`。

[CMake Examples](https://github.com/ttroy50/cmake-examples) 是一个包括现代 `CMake` 的配置例子的仓库。这些示例以类似教程的格式列出。第一个示例非常基本，并且利用前面的示例来缓慢增加复杂性，以显示更复杂的用例。

[cmake-examples-Chinese](https://github.com/SFUMECJF/cmake-examples-Chinese) 是 [CMake Examples](https://github.com/ttroy50/cmake-examples) 项目的中文版。

该学习笔记只介绍了 `CMake Examples` 项目的一部分例子。

操作系统（本地）：Windows 10 专业版

### 参考文档

1. [CMake Examples](https://github.com/ttroy50/cmake-examples)

2. [cmake-examples-Chinese](https://github.com/SFUMECJF/cmake-examples-Chinese)

### Prerequisites

关于如何安装 `MSYS2` 可以参考官方文档 [MSYS2](https://www.msys2.org/) 或者 {% post_link GCC-on-Windows-windows10 %}。

运行开始菜单的 “MSYS2 MSYS”。安装 CMake。

```shell
pacman -S mingw-w64-x86_64-cmake
```

### 01-basic

#### A-hello-cmake

1. 运行下面命令构建项目目录。

### 结语

第二十二篇博文写完，开心！！！！

今天，也是充满希望的一天。
