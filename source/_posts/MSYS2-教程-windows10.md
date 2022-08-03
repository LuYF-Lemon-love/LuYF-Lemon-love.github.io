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

### 安装

关于如何安装可以参考官方文档 [MSYS2](https://www.msys2.org/) 或者 {% post_link GCC-on-Windows-windows10 %}。

### MSYS2 vs Cygwin

>The unixy tools in MSYS2 are directly based on Cygwin, so there is some overlap there. While Cygwin focuses on building Unix software on Windows as is, MSYS2 focuses on building native software built against the Windows APIs.

### Environments

MSYS2 具有不同的环境/子系统，首先，你必须决定使用哪一个。环境之间的差异主要是环境变量、默认编译器/链接器、体系结构和使用的系统库等。如果你不确定，请使用 `MINGW64`。

**MSYS** 环境包含基础的 unix/cygwin 工具，它处于 /msys64/usr 目录，这些工具始终处于激活状态。所有其他环境都继承自 **MSYS** 环境，并在其上添加各种工具。

例如，在 MINGW64 环境中，环境变量 $PATH 为 `/msys64/mingw64/bin:/msys64/usr/bin`，可以获得所有基于 mingw64 的工具以及所有 msys 工具。

#### Overview

|                                                          | Name           | Prefix        | Toolchain | Architecture | C Library | C++ Library |
|----------------------------------------------------------|----------------|---------------|-----------|--------------|-----------|-------------|
| ![msys](https://cos.luyf-lemon-love.space/images/20220803155912.png){: style="max-width:25px" }             | **MSYS**       | `/usr`        | gcc       | x86_64       | cygwin    | libstdc++   |
| ![mingw64](https://cos.luyf-lemon-love.space/images/20220803160001.png){: style="max-width:25px" }       | **MINGW64**    | `/mingw64`    | gcc       | x86_64       | msvcrt    | libstdc++   |
| ![ucrt64](https://cos.luyf-lemon-love.space/images/20220803160033.png){: style="max-width:25px" }         | **UCRT64**     | `/ucrt64`     | gcc       | x86_64       | ucrt      | libstdc++   |
| ![clang64](https://cos.luyf-lemon-love.space/images/20220803160111.png){: style="max-width:25px" }       | **CLANG64**    | `/clang64`    | llvm      | x86_64       | ucrt      | libc++      |
| ![mingw32](https://cos.luyf-lemon-love.space/images/20220803160139.png){: style="max-width:25px" }       | **MINGW32**    | `/mingw32`    | gcc       | i686         | msvcrt    | libstdc++   |
| ![clang32](https://cos.luyf-lemon-love.space/images/20220803160311.png){: style="max-width:25px" }       | **CLANG32**    | `/clang32`    | llvm      | i686         | ucrt      | libc++      |
| ![clangarm64](https://cos.luyf-lemon-love.space/images/20220803160335.png){: style="max-width:25px" } | **CLANGARM64** | `/clangarm64` | llvm      | aarch64      | ucrt      | libc++      |

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

默认情况下，MSVCRT（Microsoft Visual C++ Runtime）在所有Microsoft Windows 版本上都可用，但由于向后兼容性问题，与 C99 不兼容并且缺少某些功能。

- 与 C99 不兼容。

- **mingw-w64** 提供替换函数，在许多情况下兼容 C99。

- 不支持 **UTF-8 locale**。

- 与 MSVCRT 链接的二进制文件不应与 UCRT 二进制文件混合，因为内部结构和数据类型不同。（更严格地说，不应混合使用为不同目标构建的对象文件或静态库。为不同的 CRT 构建的 DLL 可以混合使用，只要它们不共享 CRT 对象。）相同的规则适用于 MSVC 编译的二进制文件，因为 MSVC 默认使用 UCRT（如果未更改）。

- 开箱即用，适用于每个 Microsoft Windows 版本。

UCRT（Universal C Runtime）是一个较新的版本，默认情况下也被 Microsoft Visual Studio 使用。它与 MSVC 效果相同。

- 在生成和运行时，与 MSVC 具有较好的兼容性。

- 默认情况下，它仅在 Windows 10 上提供，对于旧版本，您必须自己提供它。

### 结语

第二十一篇博文写完，开心！！！！

今天，也是充满希望的一天。