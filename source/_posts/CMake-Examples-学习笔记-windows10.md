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

3. [Using CMake in MSYS2](https://www.msys2.org/docs/cmake/)

### Prerequisites

关于如何安装 `MSYS2` 可以参考官方文档 [MSYS2](https://www.msys2.org/) 或者 {% post_link GCC-on-Windows-windows10 %}。

运行开始菜单的 “MSYS2 MSYS”。安装 CMake。

```shell
pacman -S mingw-w64-x86_64-cmake
pacman -S make
```

`MSYS2` 的 `cmake` 可以参考 [Using CMake in MSYS2](https://www.msys2.org/docs/cmake/)。

`MSYS2` 的 `cmake` 默认使用 `Ninja` 作为构建工具。可以通过 `-G` 指定。

When running the CMake configuration command, it's recommended to explicitly specify the desired build file generator with the `-G` option. MSYS2 provided CMake defaults to Ninja (but this is not the default in upstream CMake, so it's safest to explicitly specify it).

Thus, to configure and build a CMake based project, you can run the following commands:

```shell
$ cmake -G Ninja <path-to-source> -DCMAKE_BUILD_TYPE=Release
$ cmake --build .
```

The relevant generator alternatives are:

- `-G Ninja`

- `-G "MSYS Makefiles"`

- `-G "MinGW Makefiles"`

If building by invoking `cmake --build`, the same command works for all generator choices. Alternatively, to build by directly invoking the build tool, you can call `ninja`, `make` or `mingw32-make` respectively for those three alternatives.

#### version

```shell
lyf@DESKTOP-GV2QHKN MINGW64 ~
$ cmake --version
cmake version 3.23.2

CMake suite maintained and supported by Kitware (kitware.com/cmake).

lyf@DESKTOP-GV2QHKN MINGW64 ~
$ make --version
GNU Make 4.3
为 x86_64-pc-msys 编译
Copyright (C) 1988-2020 Free Software Foundation, Inc.
许可证：GPLv3+：GNU 通用公共许可证第 3 版或更新版本<http://gnu.org/licenses/gpl.html>。
本软件是自由软件：您可以自由修改和重新发布它。
在法律允许的范围内没有其他保证。

lyf@DESKTOP-GV2QHKN MINGW64 ~
$ which cmake
/mingw64/bin/cmake

lyf@DESKTOP-GV2QHKN MINGW64 ~
$ which make
/usr/bin/make

lyf@DESKTOP-GV2QHKN MINGW64 ~
$
```

### 01-basic

#### A-hello-cmake

##### Files

1. 运行开始菜单的 “MSYS2 MinGW x64”，运行下面命令构建项目目录。

```shell
mkdir cmake-examples
cd cmake-examples
mkdir 01-basic
cd 01-basic
mkdir A-hello-cmake
cd A-hello-cmake
```

2. 创建 `CMakeLists.txt` 文件，粘贴下面代码。

```cmake
# Set the minimum version of CMake that can be used
# To find the cmake version run
# $ cmake --version
cmake_minimum_required(VERSION 3.5)

# Set the project name
project(hello_cmake)

# Add an executable
add_executable(${PROJECT_NAME} main.cpp)
```

3. 创建 `main.cpp` 文件，粘贴下面代码。

```c++
#include <iostream>

int main(int argc, char *argv[])
{
        std::cout << "Hello CMake!" << std::endl;
        return 0;
}
```

##### Introduction

这是一个基础的 `hello world` 例子。

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake
$ tree
.
├── CMakeLists.txt
└── main.cpp

0 directories, 2 files
```

- `CMakeLists.txt`: `CMake` 的配置文件。

- `main.cpp`: 一个简单的 `Hello World` cpp 文件。

##### Concepts

###### CMakeLists.txt

`CMakeLists.txt` 是一个存储 `CMake commands` 的文件，当在一个目录中运行 `cmake` 时，它将要寻找这个文件。如果没有这个文件，`cmake` 将要报错。

###### Minimum CMake version

当使用 `CMake` 创建一个项目时，你能指定支持的 `CMake` 的最低版本。

```cmake
cmake_minimum_required(VERSION 3.5)
```

###### Projects

`CMake` 生成可以包含项目名称，以便在使用多个项目时，更轻松地引用某些变量。

```cmake
project(hello_cmake)
```

###### Creating an Executable

`add_executable()` 命令可以从指定的源文件生成可执行文件，在此示例中为 `main.cpp`。`add_executable()` 函数的第一个参数是要生成的可执行文件的名称，第二个参数是要编译的源文件的列表。

```cmake
add_executable(hello_cmake main.cpp)
```

有些人经常使项目名称和可执行文件名称相同。这允许你指定 `CMakeLists.txt` 如下所示:

```cmake
cmake_minimum_required(VERSION 2.6)
project (hello_cmake)
add_executable(${PROJECT_NAME} main.cpp)
```

在此示例中，`project()` 函数将创建一个值为 `hello_cmake` 的变量 `${PROJECT_NAME}`。然后，可以将其传递给 `add_executable()` 函数以输出 `hello_cmake` 可执行文件。

###### Binary Directory

运行 cmake 命令的根文件夹或顶级文件夹称为 `CMAKE_BINARY_DIR`，并且是所有二进制文件的根文件夹。CMake 支持`外部构建`和`内部构建`两种方式生成二进制文件。

{% label 内部构建 pink %}

`内部构建`在与源代码相同的目录结构中生成所有临时生成文件。这意味着所有 `Makefiles and object files` 都散布在源代码代码中。要`内部构建`目标，请在根目录中运行 `cmake` 命令。例如：

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake
$ which cmake
/mingw64/bin/cmake

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake
$ which make
/usr/bin/make

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake
$ ls
CMakeLists.txt  main.cpp

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake
$ cmake . -G "MSYS Makefiles"
-- The C compiler identification is GNU 12.1.0
-- The CXX compiler identification is GNU 12.1.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: D:/lyf_computer_language/msys64/mingw64/bin/cc.exe - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: D:/lyf_computer_language/msys64/mingw64/bin/c++.exe - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: F:/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake
$ tree
.
├── cmake_install.cmake
├── CMakeCache.txt
├── CMakeFiles
│   ├── 3.23.2
│   │   ├── CMakeCCompiler.cmake
│   │   ├── CMakeCXXCompiler.cmake
│   │   ├── CMakeDetermineCompilerABI_C.bin
│   │   ├── CMakeDetermineCompilerABI_CXX.bin
│   │   ├── CMakeRCCompiler.cmake
│   │   ├── CMakeSystem.cmake
│   │   ├── CompilerIdC
│   │   │   ├── a.exe
│   │   │   ├── CMakeCCompilerId.c
│   │   │   └── tmp
│   │   └── CompilerIdCXX
│   │       ├── a.exe
│   │       ├── CMakeCXXCompilerId.cpp
│   │       └── tmp
│   ├── cmake.check_cache
│   ├── CMakeDirectoryInformation.cmake
│   ├── CMakeOutput.log
│   ├── CMakeTmp
│   ├── hello_cmake.dir
│   │   ├── build.make
│   │   ├── cmake_clean.cmake
│   │   ├── compiler_depend.make
│   │   ├── compiler_depend.ts
│   │   ├── depend.make
│   │   ├── DependInfo.cmake
│   │   ├── flags.make
│   │   └── progress.make
│   ├── Makefile.cmake
│   ├── Makefile2
│   ├── progress.marks
│   └── TargetDirectories.txt
├── CMakeLists.txt
├── main.cpp
└── Makefile

8 directories, 30 files

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake
$ make
[ 50%] Building CXX object CMakeFiles/hello_cmake.dir/main.cpp.obj
[100%] Linking CXX executable hello_cmake.exe
[100%] Built target hello_cmake

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake
$ ls
cmake_install.cmake  CMakeFiles      hello_cmake.exe  Makefile
CMakeCache.txt       CMakeLists.txt  main.cpp

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake
$ ./hello_cmake.exe
Hello CMake!

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake
$
```

{% label 外部构建 pink %}

`外部构建`允许您创建`单个构建文件夹`，该文件夹可以位于文件系统上的任何位置。所有临时构建文件和对象文件都位于此目录中，保持源代码目录的清洁。若要`外部构建`，请在`the build folder`中运行 `cmake` 命令，并将其指向包含根 `CMakeLists.txt` 文件的目录。如果要从头开始重新创建 cmake 环境，请使用外部构建，只需删除上面`内部构建`生成的文件，然后重新运行 `cmake`。

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake
$ ls
CMakeLists.txt  main.cpp

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake
$ mkdir build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake
$ ls
build  CMakeLists.txt  main.cpp

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake
$ cd build/

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake/build
$ ls

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake/build
$ cmake ..
-- Building for: Ninja
-- The C compiler identification is GNU 12.1.0
-- The CXX compiler identification is GNU 12.1.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: D:/lyf_computer_language/msys64/mingw64/bin/cc.exe - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: D:/lyf_computer_language/msys64/mingw64/bin/c++.exe - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: F:/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake/build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake/build
$ cmake --build .
[2/2] Linking CXX executable hello_cmake.exe

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake/build
$ ls
build.ninja          CMakeCache.txt  hello_cmake.exe
cmake_install.cmake  CMakeFiles

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake/build
$ ./hello_cmake.exe
Hello CMake!

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake/build
$ cd ..

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake
$ tree
.
├── build
│   ├── build.ninja
│   ├── cmake_install.cmake
│   ├── CMakeCache.txt
│   ├── CMakeFiles
│   │   ├── 3.23.2
│   │   │   ├── CMakeCCompiler.cmake
│   │   │   ├── CMakeCXXCompiler.cmake
│   │   │   ├── CMakeDetermineCompilerABI_C.bin
│   │   │   ├── CMakeDetermineCompilerABI_CXX.bin
│   │   │   ├── CMakeRCCompiler.cmake
│   │   │   ├── CMakeSystem.cmake
│   │   │   ├── CompilerIdC
│   │   │   │   ├── a.exe
│   │   │   │   ├── CMakeCCompilerId.c
│   │   │   │   └── tmp
│   │   │   └── CompilerIdCXX
│   │   │       ├── a.exe
│   │   │       ├── CMakeCXXCompilerId.cpp
│   │   │       └── tmp
│   │   ├── cmake.check_cache
│   │   ├── CMakeOutput.log
│   │   ├── CMakeTmp
│   │   ├── hello_cmake.dir
│   │   │   └── main.cpp.obj
│   │   ├── rules.ninja
│   │   └── TargetDirectories.txt
│   └── hello_cmake.exe
├── CMakeLists.txt
└── main.cpp

9 directories, 21 files

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/A-hello-cmake
$
```

### 结语

第二十二篇博文写完，开心！！！！

今天，也是充满希望的一天。
