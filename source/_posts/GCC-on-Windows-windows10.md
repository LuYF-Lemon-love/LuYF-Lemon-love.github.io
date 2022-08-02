---
title: GCC on Windows-windows10
tags:
  - C/C++
  - VSCode
  - GCC
  - MinGW
  - MSYS2
  - Windows
  - G++
categories: 配置环境
description: 在 VSCode 上配置 GCC C++ 编译器（g++），使用 mingw-w64 创建运行在 Windows 上的程序。
cover: 'https://cos.luyf-lemon-love.space/images/下载.png'
abbrlink: 175786877
date: 2022-08-02 16:01:36
---

### 前言

在这篇教程中，你将要配置 Visual Studio Code 使用 mingw-w64 的 GCC C++ compiler (g++) 创建运行在 Windows 的程序。

操作系统：**Windows 10 专业版**

### 参考文档

1. [Using GCC with MinGW](https://code.visualstudio.com/docs/cpp/config-mingw)

### Prerequisites

1. 安装 [Visual Studio Code](https://code.visualstudio.com/download)。

2. 安装 [C/C++ extension for VS Code](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)，你能通过在扩展视图（Ctrl+Shift+X）搜索 `c++` 安装这个 C/C++ 扩展。

![](https://cos.luyf-lemon-love.space/images/20220802170104.png)

3. 通过 [MSYS2](https://www.msys2.org/) 获取最新版本的 Mingw-w64，MSYS2 提供 GCC、Mingw-w64 和其他有用的C++工具和库的最新原生版本。

4. 按照 [MSYS2 website](https://www.msys2.org/) 上的 **Installation** 的指导安装 **Mingw-w64**。

   1. 下载 **installer**：[msys2-x86_64-20220603.exe](https://github.com/msys2/msys2-installer/releases/download/2022-06-03/msys2-x86_64-20220603.exe)

   2. 运行 **installer**，MSYS2 要求 64 位 Windows 7 或更新的操作系统。

   3. 选择安装目录，完成安装。

   4. 更新包数据库和基本包。除非您的安装文件是最新的，否则需要两个步骤。运行开始菜单的 "MSYS2 MSYS"。

   ```shell
   pacman -Syu
   ```

   5. 再次运行开始菜单的 "MSYS2 MSYS"。用 `pacman -Syu` 更新剩余的基础包。

### 结语

第二十篇博文写完，开心！！！！

今天，也是充满希望的一天。