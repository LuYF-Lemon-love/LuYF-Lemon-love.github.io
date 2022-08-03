---
title: MSYS2 教程-windows10
tags:
  - C/C++
  - GCC
  - MinGW
  - MSYS2
  - Windows
  - G++
  - CMake
  - Pacman
  - Cygwin
  - mintty
  - MSVC
  - Clang
  - Windows-Terminal
categories: 配置环境
description: 系统介绍 MSYS2。
cover: 'https://cos.luyf-lemon-love.space/images/下载 (1).png'
abbrlink: 2468517816
date: 2022-08-02 22:21:45
---

### 前言

[MSYS2](https://www.msys2.org/) 是一个适用于 Windows 的软件分发和构建平台。

MSYS2 是一系列工具和库，为您提供易于使用的环境，用于构建、安装和运行 Windows 软件。包含名为 `mintty` 的 `bash` 命令行终端、`git` 等版本控制系统、`tar` 等工具，这些工具是 `Cygwin` 的修改版本。MSYS2 为 `GCC`、`mingw-w64`、`CPython`、`CMake`、`Meson`、`OpenSSL`、`FFmpeg`、`Rust`、`Ruby` 等提供了最新的原生版本。

MSYS2 具有一个名为 `Pacman` 的软件包管理系统。

操作系统：**Windows 10 专业版**

### 参考文档

1. [MSYS2](https://www.msys2.org/)

2. [给萌新的C/C++环境搭建攻略（VSCode和MSYS2）](https://zhuanlan.zhihu.com/p/401188789)

### 安装

关于如何安装可以参考官方文档 [MSYS2](https://www.msys2.org/) 或者 {% post_link GCC-on-Windows-windows10 %}。

### MSYS2 vs Cygwin

>The unixy tools in MSYS2 are directly based on Cygwin, so there is some overlap there. While Cygwin focuses on building Unix software on Windows as is, MSYS2 focuses on building native software built against the Windows APIs.

### Environments

MSYS2 具有不同的环境/子系统，首先，你必须决定使用哪一个。环境之间的差异主要是环境变量、默认编译器/链接器、体系结构和使用的系统库等。如果你不确定，请使用 `MINGW64`。

**MSYS** 环境包含基础的 unix/cygwin 工具，它处于 /msys64/usr 目录，这些工具始终处于激活状态。所有其他环境都继承自 **MSYS** 环境，并在其上添加各种工具。

例如，在 MINGW64 环境中，环境变量 `$PATH` 为 `/msys64/mingw64/bin:/msys64/usr/bin`，可以获得所有 mingw64 的工具以及所有 msys 工具。

#### Overview

|                                                          | Name           | Prefix        | Toolchain | Architecture | C Library | C++ Library |
|----------------------------------------------------------|----------------|---------------|-----------|--------------|-----------|-------------|
| ![msys](https://cos.luyf-lemon-love.space/images/20220803155912.png)        | **MSYS**       | `/usr`        | gcc       | x86_64       | cygwin    | libstdc++   |
| ![mingw64](https://cos.luyf-lemon-love.space/images/20220803160001.png)       | **MINGW64**    | `/mingw64`    | gcc       | x86_64       | msvcrt    | libstdc++   |
| ![ucrt64](https://cos.luyf-lemon-love.space/images/20220803160033.png)         | **UCRT64**     | `/ucrt64`     | gcc       | x86_64       | ucrt      | libstdc++   |
| ![clang64](https://cos.luyf-lemon-love.space/images/20220803160111.png)       | **CLANG64**    | `/clang64`    | llvm      | x86_64       | ucrt      | libc++      |
| ![mingw32](https://cos.luyf-lemon-love.space/images/20220803160139.png)       | **MINGW32**    | `/mingw32`    | gcc       | i686         | msvcrt    | libstdc++   |
| ![clang32](https://cos.luyf-lemon-love.space/images/20220803160311.png)       | **CLANG32**    | `/clang32`    | llvm      | i686         | ucrt      | libc++      |
| ![clangarm64](https://cos.luyf-lemon-love.space/images/20220803160335.png) | **CLANGARM64** | `/clangarm64` | llvm      | aarch64      | ucrt      | libc++      |

>The active environment is selected via the MSYSTEM environment variable. Setting MSYSTEM to UCRT64 and starting a login shell will put you in that environment.

#### GCC vs LLVM/Clang

These are **the default compilers/toolchains** used for building all packages in the respective repositories.

基于 **GCC** 的环境：

- 目前已广泛测试/使用。

- Fortran 支持。

- 虽然在 MINGW 环境中也存在一个 Clang 包，但该包仍然使用 GNU 链接器和 GNU C++ 库。在某些情况下，Clang 也用于构建软件包，如上游更喜欢 Clang 而不是 GCC。

基于 **LLVM/Clang** 的环境：

- 仅使用 LLVM 工具、LLD 作为链接器，LIBC++ 作为C++标准库。

- Clang 提供 ASAN 支持。

- 对 TLS 的原生支持（Thread-local storage）。

- LLD 比 LD 快，但不支持 LD 支持的所有特性。

- 一些工具与 GNU 工具不完全等效。

- 支持 Microsoft Windows 10 上的 ARM64/AArch64 架构。

#### MSVCRT vs UCRT

这些是 Microsoft Windows 上 C 标准库的两个变体。

默认情况下，MSVCRT（Microsoft Visual C++ Runtime）在所有 Microsoft Windows 版本上都可用，但由于向后兼容性问题，与 C99 不兼容并且缺少某些功能。

- 与 C99 不兼容。

- **mingw-w64** 提供替换函数，在许多情况下兼容 C99。

- 不支持 **UTF-8 locale**。

- 与 MSVCRT 链接的二进制文件不应与 UCRT 二进制文件混合，因为内部结构和数据类型不同。（更严格地说，不应混合使用为不同目标构建的对象文件或静态库。为不同的 CRT 构建的 DLL 可以混合使用，只要它们不共享 CRT 对象。）相同的规则适用于 MSVC 编译的二进制文件，因为 MSVC 默认使用 UCRT（如果未更改）。

- 开箱即用，适用于每个 Microsoft Windows 版本。

UCRT（Universal C Runtime）是一个较新的版本，默认情况下也被 Microsoft Visual Studio 使用。它与 MSVC 效果相同。

- 在生成和运行时，与 MSVC 具有较好的兼容性。

- 默认情况下，它仅在 Windows 10 上提供，对于旧版本，您必须自己提供它。

### Terminals

#### Mintty

**Mintty** 是 MSYS2 中的默认终端应用程序，包含在安装程序中。所有 MSYS2 环境有单独的启动器以及相应的.ini配置文件 （msys2{.exe，.ini}/mingw32{.exe，.ini}/mingw64{.exe，.ini}），因此可以轻松配置环境并将启动器固定到 Windows 任务栏。

![](https://cos.luyf-lemon-love.space/images/20220803195550.png)

![](https://cos.luyf-lemon-love.space/images/20220803195606.png)

#### Windows Terminal

如果你在电脑上安装了很多环境，就会发现有一大堆各种不同的命令行入口，管理起来十分不便。使用 **Windows Terminal** 可以将各种命令行界面入口整合到一起，界面也更加美观，还能改善部分命令行界面的复制粘贴体验。

**Windows Terminal** 可以直接在 win10 自带的微软商店里免费下载。而在 win11 则是默认的命令行程序（但是仍然推荐去商店更新一下，因为自带的版本比较古旧，甚至没有图形化的设置界面）。

![](https://cos.luyf-lemon-love.space/images/20220803200803.png)

我安装的是 **Windows Terminal Preview**。

**Windows Terminal** 默认情况下支持 cmd、powershell 和 WSL，也可以扩展支持 MSYS2 shell。

![](https://cos.luyf-lemon-love.space/images/20220803201434.png)

1. 打开 **Windows Terminal Preview**，在选项卡下拉菜单中选择 “设置”，然后点选择 “打开 JSON 文件”，这将打开一个名为 `settings.json` 的 JSON 配置文件。

2. 修改配置文件 `profiles` 键的代码。请注意，这些示例假定 MSYS2 安装在 `D:\lyf_computer_language\msys64`，[Git for Windows](https://gitforwindows.org/) 安装在 `D:\lyf_computer_language\Git`。

```diff
    "defaultProfile": "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}",
    "profiles": 
    {
        "defaults": {},
        "list": 
        [
            {
                "commandline": "%SystemRoot%\\System32\\WindowsPowerShell\\v1.0\\powershell.exe",
                "guid": "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}",
                "hidden": false,
                "name": "Windows PowerShell"
            },
            {
                "commandline": "%SystemRoot%\\System32\\cmd.exe",
                "guid": "{0caa0dad-35be-5f56-a8ff-afceeeaa6101}",
                "hidden": false,
                "name": "\u547d\u4ee4\u63d0\u793a\u7b26"
            },
            {
                "guid": "{b453ae62-4e3d-5e58-b989-0a998ec441b8}",
                "hidden": false,
                "name": "Azure Cloud Shell",
                "source": "Windows.Terminal.Azure"
            },
            {
                "guid": "{3c74f569-3ac8-5b00-9edd-c44fdb1f04b1}",
                "hidden": false,
                "name": "Developer Command Prompt for VS 2019",
                "source": "Windows.Terminal.VisualStudio"
            },
            {
                "guid": "{741d64b9-17f1-5c5b-965a-9d6cc79aa835}",
                "hidden": false,
                "name": "Developer PowerShell for VS 2019",
                "source": "Windows.Terminal.VisualStudio"
            },
+            {
+                "altGrAliasing": true,
+                "antialiasingMode": "grayscale",
+                "closeOnExit": "graceful",
+                "colorScheme": "Campbell",
+                "commandline": "D:/lyf_computer_language/Git/bin/bash.exe",
+                "cursorShape": "bar",
+                "font": 
+                {
+                    "face": "Cascadia Mono",
+                    "size": 12
+                },
+                "guid": "{7cf12cde-90ed-4420-95e5-1bbcb223c824}",
+                "hidden": false,
+                "historySize": 9001,
+                "icon": "D:/lyf_computer_language/Git/mingw64/share/git/git-for-windows.ico",
+                "name": "git bash",
+                "padding": "8, 8, 8, 8",
+                "snapOnInput": true,
+                "startingDirectory": "%USERPROFILE%",
+                "useAcrylic": false
+            },
+            {
+                "commandline": "D:/lyf_computer_language/msys64/msys2_shell.cmd -defterm -here -no-start -mingw64",
+                "font": 
+                {
+                    "face": "Lucida Console",
+                    "size": 18
+                },
+                "guid": "{17da3cac-b318-431e-8a3e-7fcdefe6d114}",
+                "icon": "D:/lyf_computer_language/msys64/mingw64.ico",
+                "name": "MINGW64 / MSYS2",
+                "startingDirectory": "D:/lyf_computer_language/msys64/home/%USERNAME%"
+            },
+            {
+                "commandline": "D:/lyf_computer_language/msys64/msys2_shell.cmd -defterm -here -no-start -clang64",
+                "font": 
+                {
+                    "face": "Lucida Console",
+                    "size": 18
+                },
+                "guid": "{17da3cac-b318-431e-8a3e-7fcdefe6d112}",
+                "icon": "D:/lyf_computer_language/msys64/clang64.ico",
+                "name": "CLANG64 / MSYS2",
+                "startingDirectory": "D:/lyf_computer_language/msys64/home/%USERNAME%"
+            },
+            {
+                "commandline": "D:/lyf_computer_language/msys64/msys2_shell.cmd -defterm -here -no-start -msys",
+                "font": 
+                {
+                    "face": "Lucida Console",
+                    "size": 18
+                },
+                "guid": "{71160544-14d8-4194-af25-d05feeac7233}",
+                "icon": "D:/lyf_computer_language/msys64/msys2.ico",
+                "name": "MSYS / MSYS2",
+                "startingDirectory": "D:/lyf_computer_language/msys64/home/%USERNAME%"
+            }
        ]
    },
```

![](https://cos.luyf-lemon-love.space/images/20220803204323.png)

>You can make one of the MSYS2 profiles the default by setting the defaultProfile key to the guid value of one of the profile entries.

### 结语

第二十一篇博文写完，开心！！！！

今天，也是充满希望的一天。