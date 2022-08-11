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
  - 静态链接库
  - 动态链接库
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

4. [Step 4: Installing and Testing](https://cmake.org/cmake/help/latest/guide/tutorial/Installing%20and%20Testing.html)

### Prerequisites

本博文使用 `MSYS2` 作为运行 `C++` 和 `CMake` 的工作环境。

关于如何安装 `MSYS2` 可以参考官方文档 [MSYS2](https://www.msys2.org/) 或者 {% post_link GCC-on-Windows-windows10 %}。

运行开始菜单的 “MSYS2 MSYS”。安装 CMake。

```shell
pacman -S mingw-w64-x86_64-cmake
pacman -S make
```

`MSYS2` 的 `CMake` 可以参考 [Using CMake in MSYS2](https://www.msys2.org/docs/cmake/)。

`MSYS2` 的 `CMake` 默认使用 `Ninja` 作为构建工具。可以通过 `-G` 指定。

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

#### B-hello-headers

##### Files

1. 运行开始菜单的 “MSYS2 MinGW x64”，运行下面命令构建项目目录。

```shell
cd ..
mkdir B-hello-headers
cd B-hello-headers
```

2. 创建 `CMakeLists.txt` 文件，粘贴下面代码。

```cmake
# Set the minimum version of CMake that can be used
# To find the cmake version run
# $ cmake --version
cmake_minimum_required(VERSION 3.5)

# Set the project name
project(hello_headers)

# Create a sources variable with a link to all cpp files to compile
file(GLOB SOURCES "src/*.cpp")

# Add an executable with the above sources
add_executable(hello_headers ${SOURCES})

# Set the directories that should be included in the build command for this target
# when running g++ these will be included as -I/directory/path/
target_include_directories(hello_headers
        PRIVATE
        ${PROJECT_SOURCE_DIR}/include
        )
```

3. 创建 `include/Hello.h` 文件，粘贴下面代码。

```c++
#ifndef __HELLO_H__
#define __HELLO_H__

class Hello
{
public:
        void print();
};

#endif
```

4. 创建 `src/Hello.cpp` 文件，粘贴下面代码。

```c++
#include <iostream>

#include "Hello.h"

void Hello::print()
{
        std::cout << "Hello Headers!" << std::endl;
}
```

5. 创建 `src/main.cpp` 文件，粘贴下面代码。

```c++
#include "Hello.h"

int main(int argc, char *argv[])
{
        Hello hi;
        hi.print();
        return 0;
}
```

##### Introduction

该例子使用不同目录包含头文件和源文件。

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers
$ tree
.
├── CMakeLists.txt
├── include
│   └── Hello.h
└── src
    ├── Hello.cpp
    └── main.cpp

2 directories, 4 files
```

- `CMakeLists.txt`: `CMake` 的配置文件。

- `include/Hello.h`: 头文件。

- `src/Hello.cpp`: 源文件。

- `src/main.cpp`: main 文件。

##### Concepts

###### Directory Paths

`CMake` 语法指定了许多变量，这些变量可用于帮助在项目或源代码树中查找有用的目录。其中一些包括：

|Variable|Info|
|:-:|:-:|
|CMAKE_SOURCE_DIR|The root source directory.|
|CMAKE_CURRENT_SOURCE_DIR|The current source directory if using sub-projects and directories.|
|PROJECT_SOURCE_DIR|The source directory of the current cmake project.|
|CMAKE_BINARY_DIR|The root binary / build directory. This is the directory where you run the cmake command.|
|CMAKE_CURRENT_BINARY_DIR|The build directory you are currently in.|
|PROJECT_BINARY_DIR|The build directory for the current project.|

###### Source Files Variable

通过创建包含源文件的变量，你可以更清楚地了解这些文件，并轻松地将它们添加到多个命令中，例如，add_executable() 函数。

```cmake
# Create a sources variable with a link to all cpp files to compile
set(SOURCES
    src/Hello.cpp
    src/main.cpp
)

add_executable(${PROJECT_NAME} ${SOURCES})
```

在 `SOURCES` 变量中设置特定文件名的替代方法是使用 `GLOB` 命令通过通配符模式匹配来查找文件。

```cmake
file(GLOB SOURCES "src/*.cpp")
```

###### Including Directories

当你有不同的文件夹时，可以使用 `target_include_directories()` 函数使编译器知道它们。在编译此目标时，这会将这些目录添加到具有 -I 标志的编译器中，例如 `-I /directory/path`。

```cmake
target_include_directories(target
    PRIVATE
        ${PROJECT_SOURCE_DIR}/include
)
```

##### Building the Example

###### Standard Output

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers
$ mkdir build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers
$ cd build/

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build
$ cmake .. -G "MSYS Makefiles"
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
-- Build files have been written to: F:/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build
$ make
[ 33%] Building CXX object CMakeFiles/hello_headers.dir/src/Hello.cpp.obj
[ 66%] Building CXX object CMakeFiles/hello_headers.dir/src/main.cpp.obj
[100%] Linking CXX executable hello_headers.exe
[100%] Built target hello_headers

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build
$ ls
cmake_install.cmake  CMakeFiles         Makefile
CMakeCache.txt       hello_headers.exe

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build
$ ./hello_headers.exe
Hello Headers!

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build
$
```

###### Verbose Output

在前面的示例中，运行 `make` 命令时，输出仅显示生成的状态。若要查看用于调试目的的完整输出，可以在运行 `make` 时添加 `VERBOSE=1` 标志。

下面显示了 `VERBOSE` 输出，对输出的检查显示了要添加到 c++ 编译器命令中的 `include` 目录。

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build
$ make clean

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build
$ ls
cmake_install.cmake  CMakeCache.txt  CMakeFiles  Makefile

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build
$ make VERBOSE=1
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -S/F/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers -B/F/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build --check-build-system CMakeFiles/Makefile.cmake 0
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E cmake_progress_start /F/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build/CMakeFiles /F/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build//CMakeFiles/progress.marks
make  -f CMakeFiles/Makefile2 all
make[1]: 进入目录“/f/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build”
make  -f CMakeFiles/hello_headers.dir/build.make CMakeFiles/hello_headers.dir/depend
make[2]: 进入目录“/f/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build”
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E cmake_depends "MSYS Makefiles" /F/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers /F/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers /F/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build /F/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build /F/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build/CMakeFiles/hello_headers.dir/DependInfo.cmake --color=
make[2]: 离开目录“/f/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build”
make  -f CMakeFiles/hello_headers.dir/build.make CMakeFiles/hello_headers.dir/build
make[2]: 进入目录“/f/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build”
[ 33%] Building CXX object CMakeFiles/hello_headers.dir/src/Hello.cpp.obj
/D/lyf_computer_language/msys64/mingw64/bin/c++.exe  -I/F/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/include  -MD -MT CMakeFiles/hello_headers.dir/src/Hello.cpp.obj -MF CMakeFiles/hello_headers.dir/src/Hello.cpp.obj.d -o CMakeFiles/hello_headers.dir/src/Hello.cpp.obj -c /F/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/src/Hello.cpp
[ 66%] Building CXX object CMakeFiles/hello_headers.dir/src/main.cpp.obj
/D/lyf_computer_language/msys64/mingw64/bin/c++.exe  -I/F/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/include  -MD -MT CMakeFiles/hello_headers.dir/src/main.cpp.obj -MF CMakeFiles/hello_headers.dir/src/main.cpp.obj.d -o CMakeFiles/hello_headers.dir/src/main.cpp.obj -c /F/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/src/main.cpp
[100%] Linking CXX executable hello_headers.exe
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E rm -f CMakeFiles/hello_headers.dir/objects.a
/D/lyf_computer_language/msys64/mingw64/bin/ar.exe qc CMakeFiles/hello_headers.dir/objects.a "CMakeFiles/hello_headers.dir/src/Hello.cpp.obj" "CMakeFiles/hello_headers.dir/src/main.cpp.obj"
/D/lyf_computer_language/msys64/mingw64/bin/c++.exe -Wl,--whole-archive CMakeFiles/hello_headers.dir/objects.a -Wl,--no-whole-archive -o hello_headers.exe -Wl,--out-implib,libhello_headers.dll.a -Wl,--major-image-version,0,--minor-image-version,0  -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32
make[2]: 离开目录“/f/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build”
[100%] Built target hello_headers
make[1]: 离开目录“/f/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build”
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E cmake_progress_start /F/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build/CMakeFiles 0

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/B-hello-headers/build
$
```

#### C-static-library

##### Files

1. 运行开始菜单的 “MSYS2 MinGW x64”，运行下面命令构建项目目录。

```shell
cd ../..
mkdir C-static-library
cd C-static-library
```

2. 创建 `CMakeLists.txt` 文件，粘贴下面代码。

```cmake
cmake_minimum_required(VERSION 3.5)

project(hello_library)

##############################################
# Create a library
##############################################

# Generate the static library from the library sources
add_library(hello_library STATIC
        src/Hello.cpp
        )

target_include_directories(hello_library
        PUBLIC
        ${PROJECT_SOURCE_DIR}/include
        )

###############################################
# Create an executable
###############################################

# Add an executable with the above sources
add_executable(hello_binary
        src/main.cpp
        )

# link the new hello_library target with the hello_binary target
target_link_libraries(hello_binary
        PRIVATE
        hello_library
        )
```

3. 创建 `include/static/Hello.h` 文件，粘贴下面代码。

```c++
#ifndef __HELLO_H__
#define __HELLO_H__

class Hello
{
public:
        void print();
};

#endif
```

4. 创建 `src/Hello.cpp` 文件，粘贴下面代码。

```c++
#include <iostream>

#include "static/Hello.h"

void Hello::print()
{
        std::cout << "Hello Static Library!" << std::endl;
}
```

5. 创建 `src/main.cpp` 文件，粘贴下面代码。

```c++
#include "static/Hello.h"

int main(int argc, char *argv[])
{
        Hello hi;
        hi.print();
        return 0;
}
```

##### Introduction

显示一个 `hello world` 示例，该示例首先创建并链接`静态链接库`。这是一个简化的示例，显示库和二进制文件位于同一文件夹中。

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/C-static-library
$ tree
.
├── CMakeLists.txt
├── include
│   └── static
│       └── Hello.h
└── src
    ├── Hello.cpp
    └── main.cpp

3 directories, 4 files
```

- `CMakeLists.txt`: `CMake` 的配置文件。

- `include/static/Hello.h`: 头文件。

- `src/Hello.cpp`: 源文件。

- `src/main.cpp`: main 文件。

##### Concepts

###### Adding a Static Library

`add_library()` 函数用于从某些源文件创建库。这称为：

```cmake
add_library(hello_library STATIC
    src/Hello.cpp
)
```

这将用于创建一个名为 `libhello_library.a` 的静态库，其中包含 `add_library` 调用中的源文件。

###### Populating Including Directories

在此示例中，我们使用作用域设置为 `PUBLIC` 的 `target_include_directories()` 函数在库中包含目录。

```cmake
target_include_directories(hello_library
    PUBLIC
        ${PROJECT_SOURCE_DIR}/include
)
```

This will cause the included directory used in the following places:

- When compiling the library.

- When compiling any additional target that links the library.

The meaning of scopes are:

- `PRIVATE` - the directory is added to `this target`’s include directories

- `INTERFACE` - the directory is added to the include directories for `any targets` that link this library.

- `PUBLIC` - As above, it is included in this library and also any targets that link this library.

For public headers it is often a good idea to have your include folder be "namespaced" with sub-directories.

The directory passed to target_include_directories will be the root of your include directory tree and your C++ files should include the path from there to your header.

For this example you can see that we do it as follows:

```c++
#include "static/Hello.h"
```

Using this method means that there is less chance of header filename clashes when you use multiple libraries in your project.

###### Linking a Library

创建将使用库的可执行文件时，必须告知编译器该库。这可以使用 `target_link_libraries()` 函数来完成。

```cmake
add_executable(hello_binary
    src/main.cpp
)

target_link_libraries( hello_binary
    PRIVATE
        hello_library
)
```

This tells CMake to link the hello_library against the hello_binary executable during link time. It will also propagate any include directories with `PUBLIC` or `INTERFACE` scope from the linked library target.

##### Building the Example

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/C-static-library
$ mkdir build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/C-static-library
$ cd build/

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/C-static-library/build
$ cmake .. -G "MSYS Makefiles"
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
-- Build files have been written to: F:/vscode/cpp_projects/cmake-examples/01-basic/C-static-library/build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/C-static-library/build
$ make
[ 25%] Building CXX object CMakeFiles/hello_library.dir/src/Hello.cpp.obj
[ 50%] Linking CXX static library libhello_library.a
[ 50%] Built target hello_library
[ 75%] Building CXX object CMakeFiles/hello_binary.dir/src/main.cpp.obj
[100%] Linking CXX executable hello_binary.exe
[100%] Built target hello_binary

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/C-static-library/build
$ ls
cmake_install.cmake  CMakeFiles        libhello_library.a
CMakeCache.txt       hello_binary.exe  Makefile

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/C-static-library/build
$ ./hello_binary.exe
Hello Static Library!

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/C-static-library/build
$
```

#### D-shared-library

##### Files

1. 运行开始菜单的 “MSYS2 MinGW x64”，运行下面命令构建项目目录。

```shell
cd ../..
mkdir D-shared-library
cd D-shared-library/
```

2. 创建 `CMakeLists.txt` 文件，粘贴下面代码。

```cmake
cmake_minimum_required(VERSION 3.5)

project(hello_library)

#########################################
# Create a library
#########################################

# Generate the shared library from the library sources
add_library(hello_library SHARED
        src/Hello.cpp
        )

add_library(hello::library ALIAS hello_library)

target_include_directories(hello_library
        PUBLIC
        ${PROJECT_SOURCE_DIR}/include
        )

#########################################
# Create an executable
#########################################

# Add an executable with the above sources
add_executable(hello_binary
        src/main.cpp
        )

# link the new hello_library target with the hello_binary target
target_link_libraries(hello_binary
        PRIVATE
        hello::library
        )
```

3. 创建 `include/shared/Hello.h` 文件，粘贴下面代码。

```c++
#ifndef __HELLO_H__
#define __HELLO_H__

class Hello
{
public:
        void print();
};

#endif
```

4. 创建 `src/Hello.cpp` 文件，粘贴下面代码。

```c++
#include <iostream>

#include "shared/Hello.h"

void Hello::print()
{
        std::cout << "Hello Shared Library!" << std::endl;
}
```

5. 创建 `src/main.cpp` 文件，粘贴下面代码。

```c++
#include "shared/Hello.h"

int main(int argc, char *argv[])
{
        Hello hi;
        hi.print();
        return 0;
}
```

##### Introduction

该示例首先创建并链接共享库，然后显示了如何创建别名目标。

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/D-shared-library
$ tree
.
├── CMakeLists.txt
├── include
│   └── shared
│       └── Hello.h
└── src
    ├── Hello.cpp
    └── main.cpp

3 directories, 4 files
```

- `CMakeLists.txt`: `CMake` 的配置文件。

- `include/shared/Hello.h`: 头文件。

- `src/Hello.cpp`: 源文件。

- `src/main.cpp`: main 文件。

##### Concepts

###### Adding a Shared Library

`add_library()` 函数也可以用于从某些源文件创建共享库。这称为：

```cmake
add_library(hello_library SHARED
    src/Hello.cpp
)
```

这将用于创建一个名为 `libhello_library.so` 的共享库，并将源文件传递给 `add_library()` 函数。

###### Alias Target

顾名思义，别名目标是目标的替代名称，可以在只读上下文中代替实际目标名称使用。

```cmake
add_library(hello::library ALIAS hello_library)
```

如下所示，这允许你在将目标与其他目标链接时使用别名引用目标。

###### Linking a Shared Library

链接共享库与链接静态库相同。创建可执行文件时，使用 `target_link_library()` 函数指向库。

```cmake
add_executable(hello_binary
    src/main.cpp
)

target_link_libraries(hello_binary
    PRIVATE
        hello::library
)
```

这将指示 `CMake` 使用别名目标名称将 `hello_library` 与 `hello_binary` 可执行文件链接起来。

##### Building the Example

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/D-shared-library
$ mkdir build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/D-shared-library
$ cd build/

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/D-shared-library/build
$ cmake .. -G "MSYS Makefiles"
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
-- Build files have been written to: F:/vscode/cpp_projects/cmake-examples/01-basic/D-shared-library/build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/D-shared-library/build
$ make
[ 25%] Building CXX object CMakeFiles/hello_library.dir/src/Hello.cpp.obj
[ 50%] Linking CXX shared library libhello_library.dll
[ 50%] Built target hello_library
[ 75%] Building CXX object CMakeFiles/hello_binary.dir/src/main.cpp.obj
[100%] Linking CXX executable hello_binary.exe
[100%] Built target hello_binary

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/D-shared-library/build
$ ls
cmake_install.cmake  hello_binary.exe        Makefile
CMakeCache.txt       libhello_library.dll
CMakeFiles           libhello_library.dll.a

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/D-shared-library/build
$ ./hello_binary.exe
Hello Shared Library!

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/D-shared-library/build
$
```

#### E-installing

##### Files

1. 运行开始菜单的 “MSYS2 MinGW x64”，运行下面命令构建项目目录。

```shell
cd ../..
mkdir E-installing
cd E-installing
```

2. 创建 `cmake-examples.conf` 文件，粘贴下面代码。

```conf
# Sample configuration file that could be installed
```

3. 创建 `CMakeLists.txt` 文件，粘贴下面代码。

```cmake
cmake_minimum_required(VERSION 3.5)

project(cmake_examples_install)

#########################################
# Create a library
#########################################

# Generate the shared library from the library sources
add_library(cmake_examples_inst SHARED
        src/Hello.cpp
        )

target_include_directories(cmake_examples_inst
        PUBLIC
        ${PROJECT_SOURCE_DIR}/include
        )

###########################################
# Create an executable
###########################################

# Add an executable with the above sources
add_executable(cmake_examples_inst_bin
        src/main.cpp
        )

# link the new hello_library target with the hello_binary target
target_link_libraries(cmake_examples_inst_bin
        PRIVATE
        cmake_examples_inst
        )

###################################################
# Install
###################################################

# Binaries
install(TARGETS cmake_examples_inst_bin
        DESTINATION bin)

# Library
# Note: may not work on windows
install(TARGETS cmake_examples_inst
        LIBRARY DESTINATION lib)

# Header files
install(DIRECTORY ${PROJECT_SOURCE_DIR}/include/
        DESTINATION include)
# Cofig
install(FILES cmake-examples.conf
        DESTINATION etc)
```

4. 创建 `include/installing/Hello.h` 文件，粘贴下面代码。

```c++
#ifndef __HELLO_H__
#define __HELLO_H__

class Hello
{
public:
        void print();
};

#endif
```

5. 创建 `src/Hello.cpp` 文件，粘贴下面代码。

```c++
#include <iostream>

#include "installing/Hello.h"

void Hello::print()
{
        std::cout << "Hello Install!" << std::endl;
}
```

6. 创建 `src/main.cpp` 文件，粘贴下面代码。

```c++
#include "installing/Hello.h"

int main(int argc, char *argv[])
{
        Hello hi;
        hi.print();
        return 0;
}
```

##### Introduction

此示例演示如何生成 `make install` 目标以在系统上安装文件和二进制文件。

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/E-installing
$ tree
.
├── cmake-examples.conf
├── CMakeLists.txt
├── include
│   └── installing
│       └── Hello.h
└── src
    ├── Hello.cpp
    └── main.cpp

3 directories, 5 files
```

- `CMakeLists.txt`: `CMake` 的配置文件。

- `cmake-examples.conf`: 配置文件。

- `include/installing/Hello.h`: 头文件。

- `src/Hello.cpp`: 源文件。

- `src/main.cpp`: main 文件。

##### Concepts

###### Installing

`CMake` 提供了添加 `make install` 目标的功能，以允许用户安装 `二进制文件`，`库` 和 `其他文件`。基本安装位置由变量 `CMAKE_INSTALL_PREFIX` 控制，该变量可以使用 `ccmake` 或通过调用 `cmake` (`cmake .. -DCMAKE_INSTALL_PREFIX=/install/location`) 来设置。

安装的文件由 `install()` 函数控制。

```cmake
install (TARGETS cmake_examples_inst_bin
    DESTINATION bin)
```

将从目标 `cmake_examples_inst_bin` 生成的 `二进制文件` 安装到 `${CMAKE_INSTALL_PREFIX}/bin` 目录中。

```cmake
install (TARGETS cmake_examples_inst
    LIBRARY DESTINATION lib)
```

将从目标 `cmake_examples_inst` 生成的 `共享库` 安装到 `${CMAKE_INSTALL_PREFIX}/lib` 目录中。

```cmake
install(DIRECTORY ${PROJECT_SOURCE_DIR}/include/
    DESTINATION include)
```

将用于针对 `cmake_examples_inst` 库进行开发的 `头文件` 安装到 `${CMAKE_INSTALL_PREFIX}/include` 目录中。

```cmake
install (FILES cmake-examples.conf
    DESTINATION etc)
```

将 `配置文件` 安装到 `${CMAKE_INSTALL_PREFIX}/etc` 目录中。

##### Building the Example

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/E-installing
$ mkdir build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/E-installing
$ cd build/

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/E-installing/build
$ cmake .. -G "MSYS Makefiles"
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
-- Build files have been written to: F:/vscode/cpp_projects/cmake-examples/01-basic/E-installing/build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/E-installing/build
$ make
[ 25%] Building CXX object CMakeFiles/cmake_examples_inst.dir/src/Hello.cpp.obj
[ 50%] Linking CXX shared library libcmake_examples_inst.dll
[ 50%] Built target cmake_examples_inst
[ 75%] Building CXX object CMakeFiles/cmake_examples_inst_bin.dir/src/main.cpp.obj
[100%] Linking CXX executable cmake_examples_inst_bin.exe
[100%] Built target cmake_examples_inst_bin

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/E-installing/build
$ cmake --install . --prefix "/f/home/lyf/installdir/"
-- Install configuration: ""
-- Installing: F:/home/lyf/installdir/bin/cmake_examples_inst_bin.exe
-- Installing: F:/home/lyf/installdir/lib/libcmake_examples_inst.dll.a
-- Installing: F:/home/lyf/installdir/bin/libcmake_examples_inst.dll
-- Installing: F:/home/lyf/installdir/include
-- Installing: F:/home/lyf/installdir/include/installing
-- Installing: F:/home/lyf/installdir/include/installing/Hello.h
-- Installing: F:/home/lyf/installdir/etc/cmake-examples.conf

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/E-installing/build
$ ls
cmake_examples_inst_bin.exe  install_manifest.txt
cmake_install.cmake          libcmake_examples_inst.dll
CMakeCache.txt               libcmake_examples_inst.dll.a
CMakeFiles                   Makefile

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/E-installing/build
$ ./cmake_examples_inst_bin.exe
Hello Install!

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/E-installing/build
$
```

>The CMake variable `CMAKE_INSTALL_PREFIX` is used to determine the root of where the files will be installed. If using the `cmake --install` command, the installation prefix can be overridden via the `--prefix` argument. For example:

```shell
cmake --install . --prefix "/home/myuser/installdir"
```

Navigate to the install directory and verify that the installed `cmake_examples_inst_bin` runs.

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/home/lyf/installdir
$ tree
.
├── bin
│   ├── cmake_examples_inst_bin.exe
│   └── libcmake_examples_inst.dll
├── etc
│   └── cmake-examples.conf
├── include
│   └── installing
│       └── Hello.h
└── lib
    └── libcmake_examples_inst.dll.a

5 directories, 5 files

lyf@DESKTOP-GV2QHKN MINGW64 /f/home/lyf/installdir
$ cd bin/

lyf@DESKTOP-GV2QHKN MINGW64 /f/home/lyf/installdir/bin
$ ./cmake_examples_inst_bin.exe
Hello Install!

lyf@DESKTOP-GV2QHKN MINGW64 /f/home/lyf/installdir/bin
$
```

#### F-build-type

##### Files

1. 运行开始菜单的 “MSYS2 MinGW x64”，运行下面命令构建项目目录。

```shell
cd ../..
mkdir F-build-type
cd F-build-type
```

2. 创建 `CMakeLists.txt` 文件，粘贴下面代码。

```cmake
# Set the minimum version of CMake that can be used
# To find the cmake version run
# $ cmake --version
cmake_minimum_required(VERSION 3.5)

# Set a default build type if none was specified
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
        message("Setting build type to 'RelWithDebInfo' as none was specified.")
        set(CMAKE_BUILD_TYPE RelWithDebInfo CACHE STRING "Choose the type of build." FORCE)
        # Set the possible values of build type for cmake-gui
        set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
endif()

# Set the project name
project(build_type)

# Add an executable
add_executable(cmake_examples_build_type main.cpp)
```

3. 创建 `main.cpp` 文件，粘贴下面代码。

```c++
#include <iostream>

int main(int argc, char *argv[])
{
        std::cout << "Hello Build Type!" << std::endl;
        return 0;
}
```

##### Introduction

`CMake` 具有许多内置的生成配置，可用于编译项目。它们指定优化级别以及调试信息是否要包含在二进制文件中。

提供的级别包括：

- `Release` - Adds the `-O3 -DNDEBUG` flags to the compiler.

- `Debug` - Adds the `-g` flag.

- `MinSizeRel` - Adds `-Os -DNDEBUG`.

- `RelWithDebInfo` - Adds `-O2 -g -DNDEBUG` flags.

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/F-build-type
$ tree
.
├── CMakeLists.txt
└── main.cpp

0 directories, 2 files
```

- `CMakeLists.txt`: `CMake` 的配置文件。

- `main.cpp`: main 文件。

##### Concepts

###### Set Build Type

`Passing into cmake`

```shell
cmake .. -DCMAKE_BUILD_TYPE=Release
```

###### Set Default Build Type

`CMake` 提供的默认生成类型是不包含用于优化的编译器标志。对于某些项目，您可能希望设置默认生成类型，这样就不必记得设置它。

为此，你可以将以下内容添加到顶级 `CMakeLists.txt`。

```cmake
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  message("Setting build type to 'RelWithDebInfo' as none was specified.")
  set(CMAKE_BUILD_TYPE RelWithDebInfo CACHE STRING "Choose the type of build." FORCE)
  # Set the possible values of build type for cmake-gui
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release"
    "MinSizeRel" "RelWithDebInfo")
endif()
```

##### Building the Example

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/F-build-type
$ mkdir build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/F-build-type
$ cd build/

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/F-build-type/build
$ cmake .. -G "MSYS Makefiles"
Setting build type to 'RelWithDebInfo' as none was specified.
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
-- Build files have been written to: F:/vscode/cpp_projects/cmake-examples/01-basic/F-build-type/build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/F-build-type/build
$ make VERBOSE=1
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -S/F/vscode/cpp_projects/cmake-examples/01-basic/F-build-type -B/F/vscode/cpp_projects/cmake-examples/01-basic/F-build-type/build --check-build-system CMakeFiles/Makefile.cmake 0
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E cmake_progress_start /F/vscode/cpp_projects/cmake-examples/01-basic/F-build-type/build/CMakeFiles /F/vscode/cpp_projects/cmake-examples/01-basic/F-build-type/build//CMakeFiles/progress.marks
make  -f CMakeFiles/Makefile2 all
make[1]: 进入目录“/f/vscode/cpp_projects/cmake-examples/01-basic/F-build-type/build”
make  -f CMakeFiles/cmake_examples_build_type.dir/build.make CMakeFiles/cmake_examples_build_type.dir/depend
make[2]: 进入目录“/f/vscode/cpp_projects/cmake-examples/01-basic/F-build-type/build”
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E cmake_depends "MSYS Makefiles" /F/vscode/cpp_projects/cmake-examples/01-basic/F-build-type /F/vscode/cpp_projects/cmake-examples/01-basic/F-build-type /F/vscode/cpp_projects/cmake-examples/01-basic/F-build-type/build /F/vscode/cpp_projects/cmake-examples/01-basic/F-build-type/build /F/vscode/cpp_projects/cmake-examples/01-basic/F-build-type/build/CMakeFiles/cmake_examples_build_type.dir/DependInfo.cmake --color=
make[2]: 离开目录“/f/vscode/cpp_projects/cmake-examples/01-basic/F-build-type/build”
make  -f CMakeFiles/cmake_examples_build_type.dir/build.make CMakeFiles/cmake_examples_build_type.dir/build
make[2]: 进入目录“/f/vscode/cpp_projects/cmake-examples/01-basic/F-build-type/build”
[ 50%] Building CXX object CMakeFiles/cmake_examples_build_type.dir/main.cpp.obj
/D/lyf_computer_language/msys64/mingw64/bin/c++.exe   -O2 -g -DNDEBUG -MD -MT CMakeFiles/cmake_examples_build_type.dir/main.cpp.obj -MF CMakeFiles/cmake_examples_build_type.dir/main.cpp.obj.d -o CMakeFiles/cmake_examples_build_type.dir/main.cpp.obj -c /F/vscode/cpp_projects/cmake-examples/01-basic/F-build-type/main.cpp
[100%] Linking CXX executable cmake_examples_build_type.exe
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E rm -f CMakeFiles/cmake_examples_build_type.dir/objects.a
/D/lyf_computer_language/msys64/mingw64/bin/ar.exe qc CMakeFiles/cmake_examples_build_type.dir/objects.a "CMakeFiles/cmake_examples_build_type.dir/main.cpp.obj"
/D/lyf_computer_language/msys64/mingw64/bin/c++.exe -O2 -g -DNDEBUG -Wl,--whole-archive CMakeFiles/cmake_examples_build_type.dir/objects.a -Wl,--no-whole-archive -o cmake_examples_build_type.exe -Wl,--out-implib,libcmake_examples_build_type.dll.a -Wl,--major-image-version,0,--minor-image-version,0  -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32
make[2]: 离开目录“/f/vscode/cpp_projects/cmake-examples/01-basic/F-build-type/build”
[100%] Built target cmake_examples_build_type
make[1]: 离开目录“/f/vscode/cpp_projects/cmake-examples/01-basic/F-build-type/build”
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E cmake_progress_start /F/vscode/cpp_projects/cmake-examples/01-basic/F-build-type/build/CMakeFiles 0

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/F-build-type/build
$ ls
cmake_examples_build_type.exe  CMakeCache.txt  Makefile
cmake_install.cmake            CMakeFiles

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/F-build-type/build
$ ./cmake_examples_build_type.exe
Hello Build Type!

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/F-build-type/build
$
```

#### G-compile-flags

##### Files

1. 运行开始菜单的 “MSYS2 MinGW x64”，运行下面命令构建项目目录。

```shell
cd ../..
mkdir G-compile-flags
cd G-compile-flags
```

2. 创建 `CMakeLists.txt` 文件，粘贴下面代码。

```cmake
cmake_minimum_required(VERSION 3.5)

# Set a default C++ compile flag
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DEX2" CACHE STRING "Set C++ Compiler Flags" FORCE)

# Set the project name
project(compile_flags)

# Add an executable
add_executable(cmake_examples_compile_flags main.cpp)

target_compile_definitions(cmake_examples_compile_flags
        PRIVATE EX3)
```

3. 创建 `main.cpp` 文件，粘贴下面代码。

```c++
#include<iostream>

int main(int argc, char *argv[])
{
        std::cout << "Hello Compile Flags!" << std::endl;

        // only print if compile flag set
#ifdef EX2
        std::cout << "Hello Compile Flag EX2!" << std::endl;
#endif

#ifdef EX3
        std::cout << "Hello Compile Flag Ex3!" << std::endl;
#endif

        return 0;
}
```

##### Introduction

`CMake` 支持以多种不同的方式设置编译标志：

- 使用 `target_compile_definitions()` 函数。

- 使用 `CMAKE_C_FLAGS` 和 `CMAKE_CXX_FLAGS` 变量。

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags
$ tree
.
├── CMakeLists.txt
└── main.cpp

0 directories, 2 files
```

- `CMakeLists.txt`: `CMake` 的配置文件。

- `main.cpp`: main 文件。

##### Concepts

###### Set Per-Target C++ Flags

在现代 `CMake` 中设置 `C++` 标志的推荐方法是使用 `per-target flags`，这些标志可以通过 `target_compile_definitions()` 函数填充到其他目标。这将填充库的 `INTERFACE_COMPILE_DEFINITIONS`，并根据范围将定义推送到链接的目标。

```cmake
target_compile_definitions(cmake_examples_compile_flags
    PRIVATE EX3
)
```

这将导致编译器在编译目标时添加定义 `-DEX3`。

如果目标是一个库，并且已选择作用域 `PUBLIC` 或 `INTERFACE`，则该定义也将包含在链接此目标的任何可执行文件中。

对于编译器选项，您还可以使用 `target_compile_options()` 函数。

###### Set Default C++ Flags

`CMAKE_CXX_FLAGS` 的默认值为空或包含生成类型的适当标志。

若要设置额外的默认编译标志，可以将以下内容添加到顶级 `CMakeLists.txt`。

```cmake
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DEX2" CACHE STRING "Set C++ Compiler Flags" FORCE)
```

与 `CMAKE_CXX_FLAGS` 类似，其他选项包括：

- 使用 `CMAKE_C_FLAGS` 设置 `C` 编译器标志。

- 使用 `CMAKE_LINKER_FLAGS` 设置链接器标志。

>The values `CACHE STRING "Set C++ Compiler Flags" FORCE` from the above command are used to force this variable to be set in the `CMakeCache.txt` file.

Once set the `CMAKE_C_FLAGS` and `CMAKE_CXX_FLAGS` will set a compiler flag / definition globally for all targets in this directory or any included sub-directories. This method is not recommended for general usage now and the `target_compile_definitions` function is preferred.

###### Set CMake Flags

Similar to the `build type` a global C++ compiler flag can be set using the following methods.

`Passing into cmake`

```shell
cmake .. -DCMAKE_CXX_FLAGS="-DEX3"
```

##### Building the Example

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags
$ mkdir build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags
$ cd build/

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags/build
$ cmake .. -G "MSYS Makefiles"
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
-- Build files have been written to: F:/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags/build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags/build
$ make VERBOSE=1
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -S/F/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags -B/F/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags/build --check-build-system CMakeFiles/Makefile.cmake 0
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E cmake_progress_start /F/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags/build/CMakeFiles /F/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags/build//CMakeFiles/progress.marks
make  -f CMakeFiles/Makefile2 all
make[1]: 进入目录“/f/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags/build”
make  -f CMakeFiles/cmake_examples_compile_flags.dir/build.make CMakeFiles/cmake_examples_compile_flags.dir/depend
make[2]: 进入目录“/f/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags/build”
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E cmake_depends "MSYS Makefiles" /F/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags /F/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags /F/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags/build /F/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags/build /F/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags/build/CMakeFiles/cmake_examples_compile_flags.dir/DependInfo.cmake --color=
make[2]: 离开目录“/f/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags/build”
make  -f CMakeFiles/cmake_examples_compile_flags.dir/build.make CMakeFiles/cmake_examples_compile_flags.dir/build
make[2]: 进入目录“/f/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags/build”
[ 50%] Building CXX object CMakeFiles/cmake_examples_compile_flags.dir/main.cpp.obj
/D/lyf_computer_language/msys64/mingw64/bin/c++.exe -DEX3  -DEX2 -MD -MT CMakeFiles/cmake_examples_compile_flags.dir/main.cpp.obj -MF CMakeFiles/cmake_examples_compile_flags.dir/main.cpp.obj.d -o CMakeFiles/cmake_examples_compile_flags.dir/main.cpp.obj -c /F/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags/main.cpp
[100%] Linking CXX executable cmake_examples_compile_flags.exe
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E rm -f CMakeFiles/cmake_examples_compile_flags.dir/objects.a
/D/lyf_computer_language/msys64/mingw64/bin/ar.exe qc CMakeFiles/cmake_examples_compile_flags.dir/objects.a "CMakeFiles/cmake_examples_compile_flags.dir/main.cpp.obj"
/D/lyf_computer_language/msys64/mingw64/bin/c++.exe  -DEX2 -Wl,--whole-archive CMakeFiles/cmake_examples_compile_flags.dir/objects.a -Wl,--no-whole-archive -o cmake_examples_compile_flags.exe -Wl,--out-implib,libcmake_examples_compile_flags.dll.a -Wl,--major-image-version,0,--minor-image-version,0  -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32
make[2]: 离开目录“/f/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags/build”
[100%] Built target cmake_examples_compile_flags
make[1]: 离开目录“/f/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags/build”
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E cmake_progress_start /F/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags/build/CMakeFiles 0

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags/build
$ ls
cmake_examples_compile_flags.exe  CMakeCache.txt  Makefile
cmake_install.cmake               CMakeFiles

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags/build
$ ./cmake_examples_compile_flags.exe
Hello Compile Flags!
Hello Compile Flag EX2!
Hello Compile Flag Ex3!

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/G-compile-flags/build
$
```

#### H-third-party-library

##### Files

1. 运行开始菜单的 “MSYS2 MinGW x64”，运行下面命令构建项目目录。

```shell
cd ../..
mkdir H-third-party-library
cd H-third-party-library
```

2. 创建 `CMakeLists.txt` 文件，粘贴下面代码。

```cmake
cmake_minimum_required(VERSION 3.5)

# Set the project name
project(third_party_include)

# find a boost install with the libraries filesystem and system
find_package(Boost 1.46.1 REQUIRED COMPONENTS filesystem system)

# check if boost was found
if(Boost_FOUND)
        message("boost found")
else()
        message(FATAL_ERROR "Cannot find Boost")
endif()

# Add an executable
add_executable(third_party_include main.cpp)

# link against the boost libraries
target_link_libraries(third_party_include
        PRIVATE
        Boost::filesystem
        )
```

3. 创建 `main.cpp` 文件，粘贴下面代码。

```c++
#include <iostream>
#include <boost/shared_ptr.hpp>
#include <boost/filesystem.hpp>

int main(int argc, char *argv[])
{
        std::cout << "Hello Third Party Include!" << std::endl;

        // use a shared ptr
        boost::shared_ptr<int> isp(new int(4));

        // trivial use of boost filesystem
        boost::filesystem::path path = "/usr/share/cmake/modules";
        if(path.is_relative())
        {
                std::cout << "Path is relative" << std::endl;
        }
        else
        {
                std::cout << "Path is not relative" << std::endl;
        }

        return 0;
}
```

##### Introduction

几乎所有重要的项目都需要包含第三方库、头文件或程序。`CMake` 支持使用 `find_package()` 函数查找这些工具的路径。这将从 `CMAKE_MODULE_PATH` 中的文件夹列表中搜索格式为 `FindXXX.cmake` 的 `CMake` 模块。在 `linux` 上，默认搜索路径将包括 `/usr/share/cmake/Modules`。

本教程中的文件如下：

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/H-third-party-library
$ tree
.
├── CMakeLists.txt
└── main.cpp

0 directories, 2 files
```

- `CMakeLists.txt`: `CMake` 的配置文件。

- `main.cpp`: main 文件。

##### Requirements

此示例要求 `boost` 安装在默认系统位置。

```shell
pacman -S mingw-w64-x86_64-boost
```

##### Concepts

###### Finding a Package

As mentioned above the `find_package()` function will search for CMake modules in the formant "FindXXX.cmake" from the list of folders in `CMAKE_MODULE_PATH`. The exact format of the arguments to `find_package` will depend on the module you are looking for. This is typically documented at the top of the `FindXXX.cmake` file.

A basic example of finding `boost` is below:

```cmake
find_package(Boost 1.46.1 REQUIRED COMPONENTS filesystem system)
```

The arguments are:

- `Boost` - Name of the library. This is part of used to find the module file `FindBoost.cmake`.

- `1.46.1` - The minimum version of `boost` to find.

- `REQUIRED` - Tells the module that this is required and to fail if it cannot be found.

- `COMPONENTS` - The list of components to find in the library.

`Boost` includes can take more arguments and also make use of other variables. 

###### Checking if the package is found

Most included packages will set a variable `XXX_FOUND`, which can be used to check if the package is available on the system.

In this example the variable is `Boost_FOUND`:

```cmake
if(Boost_FOUND)
    message ("boost found")
    include_directories(${Boost_INCLUDE_DIRS})
else()
    message (FATAL_ERROR "Cannot find Boost")
endif()
```

###### Exported Variables

After a package is found it will often export variables which can inform the user where to find the library, header, or executable files. Similar to the `XXX_FOUND` variable, these are package specific and are typically documented at the top of the `FindXXX.cmake` file.

The variables exported in this example include:

- `Boost_INCLUDE_DIRS` - The path to the boost header files.

In some cases you can also check these variables by examining the cache using ccmake or cmake-gui.

###### Alias / Imported targets

Most modern CMake libraries export ALIAS targets in their module files. The benefit of imported targets are that they can also populate include directories and linked libraries.

For example, starting from v3.5+ of CMake, the Boost module supports this. Similar to using your own ALIAS target for libraires, an ALIAS in a module can make referencing found targets easier.

In the case of Boost, all targets are exported using the `Boost::` identifier and then the name of the subsystem. For example you can use:

- `Boost::boost` for header only libraries

- `Boost::system` for the boost system library.

- `Boost::filesystem` for filesystem library.

As with your own targets, these targets include their dependencies, so linking against `Boost::filesystem` will automatically add `Boost::boost` and `Boost::system` dependencies.

To link against an imported target you can use the following:

```cmake
target_link_libraries(third_party_include
        PRIVATE
        Boost::filesystem
)
```

###### Non-alias targets

While most modern libraries use imported targets, not all modules have been updated. In the case where a library hasn’t been updated you will often find the following variables available:

- `xxx_INCLUDE_DIRS` - A variable pointing to the include directory for the library.

- `xxx_LIBRARY` - A variable pointing to the library path.

These can then be added to your `target_include_directories` and `target_link_libraries` as:

```cmake
# Include the boost headers
target_include_directories( third_party_include
    PRIVATE ${Boost_INCLUDE_DIRS}
)

# link against the boost libraries
target_link_libraries( third_party_include
    PRIVATE
    ${Boost_SYSTEM_LIBRARY}
    ${Boost_FILESYSTEM_LIBRARY}
)
```

##### Building the Example

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/H-third-party-library
$ mkdir build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/H-third-party-library
$ cd build/

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/H-third-party-library/build
$ cmake .. -G "MSYS Makefiles"
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
-- Found Boost: D:/lyf_computer_language/msys64/mingw64/include (found suitable version "1.79.0", minimum required is "1.46.1") found components: filesystem system
boost found
-- Configuring done
-- Generating done
-- Build files have been written to: F:/vscode/cpp_projects/cmake-examples/01-basic/H-third-party-library/build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/H-third-party-library/build
$ make
[ 50%] Building CXX object CMakeFiles/third_party_include.dir/main.cpp.obj
[100%] Linking CXX executable third_party_include.exe
[100%] Built target third_party_include

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/H-third-party-library/build
$ ls
cmake_install.cmake  CMakeFiles  third_party_include.exe
CMakeCache.txt       Makefile

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/H-third-party-library/build
$ ./third_party_include.exe
Hello Third Party Include!
Path is relative

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/H-third-party-library/build
$
```

#### I-compiling-with-clang

##### Files

1. 运行开始菜单的 “MSYS2 MSYS”，安装 `Clang toolchain`。

```shell
pacman -S --needed base-devel mingw-w64-clang-x86_64-toolchain
pacman -S cmake
```

2. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令构建项目目录。

```shell
cd /f/vscode/cpp_projects/cmake-examples/01-basic/
mkdir I-compiling-with-clang
cd I-compiling-with-clang
```

3. 创建 `CMakeLists.txt` 文件，粘贴下面代码。

```cmake
# Set the minimum version of CMake that can be used
# To find the cmake version run
# $ cmake --version
cmake_minimum_required(VERSION 3.5)

# Set the project name
project(hello_cmake)

# Add an executable
add_executable(hello_cmake main.cpp)
```

4. 创建 `main.cpp` 文件，粘贴下面代码。

```c++
#include <iostream>

int main(int argc, char *argv[])
{
        std::cout << "Hello CMake!" << std::endl;
        return 0;
}
```

##### Introduction

使用 `CMake` 构建时，可以设置 `C` 和 `C++` 编译器。

本教程中的文件如下：

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/cmake-examples/01-basic/I-compiling-with-clang
$ tree
.
├── CMakeLists.txt
└── main.cpp

0 directories, 2 files
```

- `CMakeLists.txt`: `CMake` 的配置文件。

- `main.cpp`: main 文件。

##### Concepts

###### Compiler Option

`CMake` exposes options to control the programs used to compile and link your code. These programs include:

- `CMAKE_C_COMPILER` - The program used to compile `c` code.

- `CMAKE_CXX_COMPILER` - The program used to compile `c++` code.

- `CMAKE_LINKER` - The program used to link your binary.

###### Setting Flags

As described in the `Build Type` example, you can set `CMake options` using either a cmake gui or by passing from the command line.

Below is an example of passing the compiler via `the command line`.

```shell
cmake .. -DCMAKE_C_COMPILER=clang-3.6 -DCMAKE_CXX_COMPILER=clang++-3.6
```

After setting these options, when your run `make` clang will be used to compile your binary. 

##### Building the Examples

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/cmake-examples/01-basic/I-compiling-with-clang
$ mkdir build.clang

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/cmake-examples/01-basic/I-compiling-with-clang
$ cd build.clang/

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/cmake-examples/01-basic/I-compiling-with-clang/build.clang
$ cmake .. -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++
-- The C compiler identification is Clang 14.0.4
-- The CXX compiler identification is Clang 14.0.4
System is unknown to cmake, create:
Platform/MINGW64_NT-10.0-19044 to use this system, please post your config file on discourse.cmake.org so it can be added to cmake
-- Detecting C compiler ABI info
System is unknown to cmake, create:
Platform/MINGW64_NT-10.0-19044 to use this system, please post your config file on discourse.cmake.org so it can be added to cmake
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /clang64/bin/clang.exe - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
System is unknown to cmake, create:
Platform/MINGW64_NT-10.0-19044 to use this system, please post your config file on discourse.cmake.org so it can be added to cmake
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /clang64/bin/clang++.exe - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: /f/vscode/cpp_projects/cmake-examples/01-basic/I-compiling-with-clang/build.clang

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/cmake-examples/01-basic/I-compiling-with-clang/build.clang
$ make
[ 50%] Building CXX object CMakeFiles/hello_cmake.dir/main.cpp.obj
[100%] Linking CXX executable hello_cmake
[100%] Built target hello_cmake

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/cmake-examples/01-basic/I-compiling-with-clang/build.clang
$ ls
cmake_install.cmake  CMakeCache.txt  CMakeFiles  hello_cmake.exe  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/cmake-examples/01-basic/I-compiling-with-clang/build.clang
$ ./hello_cmake.exe
Hello CMake!

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/cmake-examples/01-basic/I-compiling-with-clang/build.clang
$
```

#### J-building-with-ninja

##### Files

1. 运行开始菜单的 “MSYS2 MinGW x64”，运行下面命令构建项目目录。

```shell
cd /f/vscode/cpp_projects/cmake-examples/01-basic/
mkdir J-building-with-ninja
cd J-building-with-ninja
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
add_executable(hello_cmake main.cpp)
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

As mentioned, CMake is a meta-build system that can be used to create the build files for many other build tools. This example shows how to have CMake use the `ninja` build tool.

The files in this tutorial are below:

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/J-building-with-ninja
$ tree
.
├── CMakeLists.txt
└── main.cpp

0 directories, 2 files
```

- `CMakeLists.txt` - Contains the CMake commands you wish to run.

- `main.cpp` - A simple "Hello World" cpp file.

##### Concepts

###### Generators

CMake generators are responsible for writing the input files (e.g. Makefiles) for the underlying build system. Running `cmake --help` will show the generators available.

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/J-building-with-ninja
$ cmake --help
Usage

  cmake [options] <path-to-source>
  cmake [options] <path-to-existing-build>
  cmake [options] -S <path-to-source> -B <path-to-build>

Specify a source directory to (re-)generate a build system for it in the
current working directory.  Specify an existing build directory to
re-generate its build system.

Options
  -S <path-to-source>          = Explicitly specify a source directory.
  -B <path-to-build>           = Explicitly specify a build directory.
  -C <initial-cache>           = Pre-load a script to populate the cache.
  -D <var>[:<type>]=<value>    = Create or update a cmake cache entry.
  -U <globbing_expr>           = Remove matching entries from CMake cache.
  -G <generator-name>          = Specify a build system generator.
  -T <toolset-name>            = Specify toolset name if supported by
                                 generator.
  -A <platform-name>           = Specify platform name if supported by
                                 generator.
  --toolchain <file>           = Specify toolchain file
                                 [CMAKE_TOOLCHAIN_FILE].
  --install-prefix <directory> = Specify install directory
                                 [CMAKE_INSTALL_PREFIX].
  -Wdev                        = Enable developer warnings.
  -Wno-dev                     = Suppress developer warnings.
  -Werror=dev                  = Make developer warnings errors.
  -Wno-error=dev               = Make developer warnings not errors.
  -Wdeprecated                 = Enable deprecation warnings.
  -Wno-deprecated              = Suppress deprecation warnings.
  -Werror=deprecated           = Make deprecated macro and function warnings
                                 errors.
  -Wno-error=deprecated        = Make deprecated macro and function warnings
                                 not errors.
  --preset <preset>,--preset=<preset>
                               = Specify a configure preset.
  --list-presets               = List available presets.
  -E                           = CMake command mode.
  -L[A][H]                     = List non-advanced cached variables.
  --build <dir>                = Build a CMake-generated project binary tree.

  --install <dir>              = Install a CMake-generated project binary
                                 tree.
  --open <dir>                 = Open generated project in the associated
                                 application.
  -N                           = View mode only.
  -P <file>                    = Process script mode.
  --find-package               = Legacy pkg-config like mode.  Do not use.
  --graphviz=[file]            = Generate graphviz of dependencies, see
                                 CMakeGraphVizOptions.cmake for more.
  --system-information [file]  = Dump information about this system.
  --log-level=<ERROR|WARNING|NOTICE|STATUS|VERBOSE|DEBUG|TRACE>
                               = Set the verbosity of messages from CMake
                                 files.  --loglevel is also accepted for
                                 backward compatibility reasons.
  --log-context                = Prepend log messages with context, if given
  --debug-trycompile           = Do not delete the try_compile build tree.
                                 Only useful on one try_compile at a time.
  --debug-output               = Put cmake in a debug mode.
  --debug-find                 = Put cmake find in a debug mode.
  --debug-find-pkg=<pkg-name>[,...]
                               = Limit cmake debug-find to the
                                 comma-separated list of packages
  --debug-find-var=<var-name>[,...]
                               = Limit cmake debug-find to the
                                 comma-separated list of result variables
  --trace                      = Put cmake in trace mode.
  --trace-expand               = Put cmake in trace mode with variable
                                 expansion.
  --trace-format=<human|json-v1>
                               = Set the output format of the trace.
  --trace-source=<file>        = Trace only this CMake file/module.  Multiple

                                 options allowed.
  --trace-redirect=<file>      = Redirect trace output to a file instead of
                                 stderr.
  --warn-uninitialized         = Warn about uninitialized values.
  --no-warn-unused-cli         = Don't warn about command line options.
  --check-system-vars          = Find problems with variable usage in system
                                 files.
  --profiling-format=<fmt>     = Output data for profiling CMake scripts.
                                 Supported formats: google-trace
  --profiling-output=<file>    = Select an output path for the profiling data

                                 enabled through --profiling-format.
  --help,-help,-usage,-h,-H,/? = Print usage information and exit.
  --version,-version,/V [<f>]  = Print version number and exit.
  --help-full [<f>]            = Print all help manuals and exit.
  --help-manual <man> [<f>]    = Print one help manual and exit.
  --help-manual-list [<f>]     = List help manuals available and exit.
  --help-command <cmd> [<f>]   = Print help for one command and exit.
  --help-command-list [<f>]    = List commands with help available and exit.
  --help-commands [<f>]        = Print cmake-commands manual and exit.
  --help-module <mod> [<f>]    = Print help for one module and exit.
  --help-module-list [<f>]     = List modules with help available and exit.
  --help-modules [<f>]         = Print cmake-modules manual and exit.
  --help-policy <cmp> [<f>]    = Print help for one policy and exit.
  --help-policy-list [<f>]     = List policies with help available and exit.
  --help-policies [<f>]        = Print cmake-policies manual and exit.
  --help-property <prop> [<f>] = Print help for one property and exit.
  --help-property-list [<f>]   = List properties with help available and
                                 exit.
  --help-properties [<f>]      = Print cmake-properties manual and exit.
  --help-variable var [<f>]    = Print help for one variable and exit.
  --help-variable-list [<f>]   = List variables with help available and exit.

  --help-variables [<f>]       = Print cmake-variables manual and exit.

Generators

The following generators are available on this platform (* marks default):
  Visual Studio 17 2022        = Generates Visual Studio 2022 project files.
                                 Use -A option to specify architecture.
  Visual Studio 16 2019        = Generates Visual Studio 2019 project files.
                                 Use -A option to specify architecture.
  Visual Studio 15 2017 [arch] = Generates Visual Studio 2017 project files.
                                 Optional [arch] can be "Win64" or "ARM".
  Visual Studio 14 2015 [arch] = Generates Visual Studio 2015 project files.
                                 Optional [arch] can be "Win64" or "ARM".
  Visual Studio 12 2013 [arch] = Generates Visual Studio 2013 project files.
                                 Optional [arch] can be "Win64" or "ARM".
  Visual Studio 11 2012 [arch] = Generates Visual Studio 2012 project files.
                                 Optional [arch] can be "Win64" or "ARM".
  Visual Studio 10 2010 [arch] = Deprecated.  Generates Visual Studio 2010
                                 project files.  Optional [arch] can be
                                 "Win64" or "IA64".
  Visual Studio 9 2008 [arch]  = Generates Visual Studio 2008 project files.
                                 Optional [arch] can be "Win64" or "IA64".
  Borland Makefiles            = Generates Borland makefiles.
  NMake Makefiles              = Generates NMake makefiles.
  NMake Makefiles JOM          = Generates JOM makefiles.
  MSYS Makefiles               = Generates MSYS makefiles.
  MinGW Makefiles              = Generates a make file for use with
                                 mingw32-make.
  Green Hills MULTI            = Generates Green Hills MULTI files
                                 (experimental, work-in-progress).
  Unix Makefiles               = Generates standard UNIX makefiles.
* Ninja                        = Generates build.ninja files.
  Ninja Multi-Config           = Generates build-<Config>.ninja files.
  Watcom WMake                 = Generates Watcom WMake makefiles.
  CodeBlocks - MinGW Makefiles = Generates CodeBlocks project files.
  CodeBlocks - NMake Makefiles = Generates CodeBlocks project files.
  CodeBlocks - NMake Makefiles JOM
                               = Generates CodeBlocks project files.
  CodeBlocks - Ninja           = Generates CodeBlocks project files.
  CodeBlocks - Unix Makefiles  = Generates CodeBlocks project files.
  CodeLite - MinGW Makefiles   = Generates CodeLite project files.
  CodeLite - NMake Makefiles   = Generates CodeLite project files.
  CodeLite - Ninja             = Generates CodeLite project files.
  CodeLite - Unix Makefiles    = Generates CodeLite project files.
  Eclipse CDT4 - NMake Makefiles
                               = Generates Eclipse CDT 4.0 project files.
  Eclipse CDT4 - MinGW Makefiles
                               = Generates Eclipse CDT 4.0 project files.
  Eclipse CDT4 - Ninja         = Generates Eclipse CDT 4.0 project files.
  Eclipse CDT4 - Unix Makefiles= Generates Eclipse CDT 4.0 project files.
  Kate - MinGW Makefiles       = Generates Kate project files.
  Kate - NMake Makefiles       = Generates Kate project files.
  Kate - Ninja                 = Generates Kate project files.
  Kate - Unix Makefiles        = Generates Kate project files.
  Sublime Text 2 - MinGW Makefiles
                               = Generates Sublime Text 2 project files.
  Sublime Text 2 - NMake Makefiles
                               = Generates Sublime Text 2 project files.
  Sublime Text 2 - Ninja       = Generates Sublime Text 2 project files.
  Sublime Text 2 - Unix Makefiles
                               = Generates Sublime Text 2 project files.


lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/J-building-with-ninja
$
```

##### Calling a Generator

To call a CMake generator you can use the `-G` command line switch, for example:

```shell
cmake .. -G Ninja
```

After doing the above CMake will generate the required Ninja build files, which can be run from using the `ninja` command.

```shell
$ cmake .. -G Ninja

$ ls
build.ninja  CMakeCache.txt  CMakeFiles  cmake_install.cmake  rules.ninja
```

##### Building the Examples

Below is sample output from building this example.

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/J-building-with-ninja
$ mkdir build.ninja

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/J-building-with-ninja
$ cd build.ninja/

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/J-building-with-ninja/build.ninja
$ cmake .. -G Ninja
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
-- Build files have been written to: F:/vscode/cpp_projects/cmake-examples/01-basic/J-building-with-ninja/build.ninja

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/J-building-with-ninja/build.ninja
$ ninja
[2/2] Linking CXX executable hello_cmake.exe

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/J-building-with-ninja/build.ninja
$ ls
build.ninja          CMakeCache.txt  hello_cmake.exe
cmake_install.cmake  CMakeFiles

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/J-building-with-ninja/build.ninja
$ ./hello_cmake.exe
Hello CMake!

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/J-building-with-ninja/build.ninja
$
```

#### K-imported-targets

##### Files

1. 运行开始菜单的 “MSYS2 MinGW x64”，运行下面命令构建项目目录。

```shell
cd /f/vscode/cpp_projects/cmake-examples/01-basic/
mkdir K-imported-targets
cd K-imported-targets
```

2. 创建 `CMakeLists.txt` 文件，粘贴下面代码。

```cmake
cmake_minimum_required(VERSION 3.5)

# Set the project name
project(imported_targets)

# find a boost install with the libraries filesystem and system
find_package(Boost 1.46.1 REQUIRED COMPONENTS filesystem system)

# check if boost was found
if(Boost_FOUND)
        message("boost found")
else()
        message(FATAL_ERROR "Cannot find Boost")
endif()

# Add an executable
add_executable(imported_targets main.cpp)

# link against the boost libraries
target_link_libraries(imported_targets
        PRIVATE
        Boost::filesystem
        )
```

3. 创建 `main.cpp` 文件，粘贴下面代码。

```c++
#include <iostream>
#include <boost/shared_ptr.hpp>
#include <boost/filesystem.hpp>

int main(int argc, char *argv[])
{
        std::cout << "Hello Third Party Include!" << std::endl;

        // use a shared ptr
        boost::shared_ptr<int> isp(new int(4));

        // trivial use of boost filesystem
        boost::filesystem::path path = "/usr/share/cmake/modules";
        if(path.is_relative())
        {
                std::cout << "Path is relative" << std::endl;
        }
        else
        {
                std::cout << "Path is not relative" << std::endl;
        }

        return 0;
}
```

##### Introduction

As previously mentioned in `the third party library`, newer versions of CMake allow you to link third party libraries using `imported ALIAS targets`.

The files in this tutorial are below:

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/K-imported-targets
$ tree
.
├── CMakeLists.txt
└── main.cpp

0 directories, 2 files
```

- `CMakeLists.txt` - Contains the CMake commands you wish to run.

- `main.cpp` - The source file with main.

##### Requirements

This example requires the following:

- CMake v3.5+

- The boost libraries to be installed in a default system location.

```shell
pacman -S mingw-w64-x86_64-boost
```

##### Concepts

###### Imported Target

Imported targets are `read-only targets` that are exported by `FindXXX modules`.

To include `boost filesystem` you can do the following:

```cmake
target_link_libraries( imported_targets
        PRIVATE
        Boost::filesystem
)
```

Linking against `Boost::filesystem` will automatically add `Boost::boost` and `Boost::system` dependencies.

##### Building the Example

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/K-imported-targets
$ mkdir build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/K-imported-targets
$ cd build/

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/K-imported-targets/build
$ cmake .. -G "MSYS Makefiles"
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
-- Found Boost: D:/lyf_computer_language/msys64/mingw64/include (found suitable version "1.79.0", minimum required is "1.46.1") found components: filesystem system
boost found
-- Configuring done
-- Generating done
-- Build files have been written to: F:/vscode/cpp_projects/cmake-examples/01-basic/K-imported-targets/build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/K-imported-targets/build
$ make
[ 50%] Building CXX object CMakeFiles/imported_targets.dir/main.cpp.obj
[100%] Linking CXX executable imported_targets.exe
[100%] Built target imported_targets

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/K-imported-targets/build
$ ls
cmake_install.cmake  CMakeFiles            Makefile
CMakeCache.txt       imported_targets.exe

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/K-imported-targets/build
$ ./imported_targets.exe
Hello Third Party Include!
Path is relative

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/K-imported-targets/build
$
```

#### L-cpp-standard

Since the release of `C++11` and `C++14` a common use case is to invoke the compiler to use these standards. As CMake has evolved, it has added features to make this easier and new versions of CMake have changed how this is achieved.

The following examples show different methods of setting the C++ standard and what versions of CMake they are available from.

The examples include:

- `common-method` - A simple version that should work with most versions of CMake.

- `cxx-standard` - Using the `CMAKE_CXX_STANDARD` variable introduced in `CMake v3.1`.

- `compile-features` - Using the `target_compile_features` function introduced in `CMake v3.1`.

##### i-common-method

###### Files

1. 运行开始菜单的 “MSYS2 MinGW x64”，运行下面命令构建项目目录。

```shell
cd /f/vscode/cpp_projects/cmake-examples/01-basic/
mkdir L-cpp-standard
cd L-cpp-standard
mkdir i-common-method
cd i-common-method
```

2. 创建 `CMakeLists.txt` 文件，粘贴下面代码。

```cmake
# Set the minimum version of CMake that can be used
# To find the cmake version run
# $ cmake --version
cmake_minimum_required(VERSION 2.8)

# Set the project name
project(hello_cpp11)

# try conditional compilation
include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
CHECK_CXX_COMPILER_FLAG("-std=c++0x" COMPILER_SUPPORTS_CXX0X)

# check results and add flag
if(COMPILER_SUPPORTS_CXX11)
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
elseif(COMPILER_SUPPORTS_CXX0X)
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
else()
        message(STATUS "The compiler ${CMAKE_CXX_COMPILER} has no C++11 support. Please use a different C++ compiler.")
endif()

# Add an executable
add_executable(hello_cpp11 main.cpp)
```

3. 创建 `main.cpp` 文件，粘贴下面代码。

```c++
#include <iostream>

int main(int argc, char *argv[])
{
        auto message = "Hello C++11";
        std::cout << message << std::endl;
        return 0;
}
```

###### Introduction

This example shows a common method to set the C++ Standard. This can be used with most versions of CMake. However, if you are targeting a recent version of CMake there are more convenient methods available.

The files in this tutorial are below:

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method
$ tree
.
├── CMakeLists.txt
└── main.cpp

0 directories, 2 files
```

- `CMakeLists.txt` - Contains the CMake commands you wish to run.

- `main.cpp` - A simple "Hello World" cpp file targeting C++11.

###### Concepts

**Checking Compile flags**

CMake has support for attempting to compile a program with any flags you pass into the function `CMAKE_CXX_COMPILER_FLAG`. The result is then stored in a variable that you pass in.

For example:

```cmake
include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
```

This example will attempt to compile a program with the flag `-std=c++11` and store the result in the variable `COMPILER_SUPPORTS_CXX11`.

The line `include(CheckCXXCompilerFlag)` tells CMake to include this function to make it available for use.

**Adding the flag**

Once you have determined if the compile supports a flag, you can then use the standard cmake methods to add this flag to a target. In this example we use the `CMAKE_CXX_FLAGS` to propegate the flag to all targets.

```cmake
if(COMPILER_SUPPORTS_CXX11)#
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
elseif(COMPILER_SUPPORTS_CXX0X)#
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
else()
    message(STATUS "The compiler ${CMAKE_CXX_COMPILER} has no C++11 support. Please use a different C++ compiler.")
endif()
```

The above example only checks for the gcc version of the compile flags and supports fallback from `C++11` to the `pre-standardisation C+\+0x` flag. In real usage you may want to check for `C14`, or add support for different methods of setting the compile, e.g. `-std=gnu11`.

###### Building the Examples

Below is sample output from building this example.

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method
$ mkdir build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method
$ cd build/

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method/build
$ cmake .. -G "MSYS Makefiles"
CMake Deprecation Warning at CMakeLists.txt:4 (cmake_minimum_required):
  Compatibility with CMake < 2.8.12 will be removed from a future version of
  CMake.

  Update the VERSION argument <min> value or use a ...<max> suffix to tell
  CMake that the project does not need compatibility with older versions.


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
-- Performing Test COMPILER_SUPPORTS_CXX11
-- Performing Test COMPILER_SUPPORTS_CXX11 - Success
-- Performing Test COMPILER_SUPPORTS_CXX0X
-- Performing Test COMPILER_SUPPORTS_CXX0X - Success
-- Configuring done
-- Generating done
-- Build files have been written to: F:/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method/build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method/build
$ make VERBOSE=1
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -S/F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method -B/F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method/build --check-build-system CMakeFiles/Makefile.cmake 0
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E cmake_progress_start /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method/build/CMakeFiles /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method/build//CMakeFiles/progress.marks
make  -f CMakeFiles/Makefile2 all
make[1]: 进入目录“/f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method/build”
make  -f CMakeFiles/hello_cpp11.dir/build.make CMakeFiles/hello_cpp11.dir/depend
make[2]: 进入目录“/f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method/build”
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E cmake_depends "MSYS Makefiles" /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method/build /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method/build /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method/build/CMakeFiles/hello_cpp11.dir/DependInfo.cmake --color=
make[2]: 离开目录“/f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method/build”
make  -f CMakeFiles/hello_cpp11.dir/build.make CMakeFiles/hello_cpp11.dir/build
make[2]: 进入目录“/f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method/build”
[ 50%] Building CXX object CMakeFiles/hello_cpp11.dir/main.cpp.obj
/D/lyf_computer_language/msys64/mingw64/bin/c++.exe   -std=c++11 -MD -MT CMakeFiles/hello_cpp11.dir/main.cpp.obj -MF CMakeFiles/hello_cpp11.dir/main.cpp.obj.d -o CMakeFiles/hello_cpp11.dir/main.cpp.obj -c /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method/main.cpp
[100%] Linking CXX executable hello_cpp11.exe
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E rm -f CMakeFiles/hello_cpp11.dir/objects.a
/D/lyf_computer_language/msys64/mingw64/bin/ar.exe qc CMakeFiles/hello_cpp11.dir/objects.a "CMakeFiles/hello_cpp11.dir/main.cpp.obj"
/D/lyf_computer_language/msys64/mingw64/bin/c++.exe  -std=c++11 -Wl,--whole-archive CMakeFiles/hello_cpp11.dir/objects.a -Wl,--no-whole-archive -o hello_cpp11.exe -Wl,--out-implib,libhello_cpp11.dll.a -Wl,--major-image-version,0,--minor-image-version,0  -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32
make[2]: 离开目录“/f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method/build”
[100%] Built target hello_cpp11
make[1]: 离开目录“/f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method/build”
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E cmake_progress_start /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method/build/CMakeFiles 0

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method/build
$ ls
cmake_install.cmake  CMakeCache.txt  CMakeFiles  hello_cpp11.exe  Makefile

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method/build
$ ./hello_cpp11.exe
Hello C++11

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/i-common-method/build
$
```

##### ii-cxx-standard

###### Files

1. 运行开始菜单的 “MSYS2 MinGW x64”，运行下面命令构建项目目录。

```shell
cd /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/
mkdir ii-cxx-standard
cd ii-cxx-standard
```

2. 创建 `CMakeLists.txt` 文件，粘贴下面代码。

```cmake
# Set the minimum version of CMake that can be used
# To find the cmake version run
# $ cmake --version
cmake_minimum_required(VERSION 3.1)

# Set the project name
project(hello_cpp11)

# Set the C++ standard to C++ 11
set(CMAKE_CXX_STANDARD 11)

# Add an executable
add_executable(hello_cpp11 main.cpp)
```

3. 创建 `main.cpp` 文件，粘贴下面代码。

```c++
#include <iostream>

int main(int argc, char *argv[])
{
        auto message = "Hello C++11";
        std::cout << message << std::endl;
        return 0;
}
```

###### Introduction

This example shows how to set the C++ standard using the `CMAKE_CXX_STANDARD` variable. This is available since CMake v3.1.

The files in this tutorial are below:

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard
$ tree
.
├── CMakeLists.txt
└── main.cpp

0 directories, 2 files
```

- `CMakeLists.txt` - Contains the CMake commands you wish to run.

- `main.cpp` - A simple "Hello World" cpp file targeting C++11.

###### Concepts

**Using CXX_STANDARD property**

Setting the `CMAKE_CXX_STANDARD` variable causes the `CXX_STANDARD` property on all targets. This causes CMake to set the appropriate flag at compille time.

The `CMAKE_CXX_STANDARD` variable falls back to the closest appropriate standard without a failure. For example, if you request `-std=gnu11` you may end up with `-std=gnu0x`.

This can result in an unexpected failure at compile time.

###### Building the Examples

Below is sample output from building this example.

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard
$ mkdir build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard
$ cd build/

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard/build
$ cmake .. -G "MSYS Makefiles"
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
-- Build files have been written to: F:/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard/build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard/build
$ make VERBOSE=1
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -S/F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard -B/F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard/build --check-build-system CMakeFiles/Makefile.cmake 0
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E cmake_progress_start /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard/build/CMakeFiles /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard/build//CMakeFiles/progress.marks
make  -f CMakeFiles/Makefile2 all
make[1]: 进入目录“/f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard/build”
make  -f CMakeFiles/hello_cpp11.dir/build.make CMakeFiles/hello_cpp11.dir/depend
make[2]: 进入目录“/f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard/build”
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E cmake_depends "MSYS Makefiles" /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard/build /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard/build /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard/build/CMakeFiles/hello_cpp11.dir/DependInfo.cmake --color=
make[2]: 离开目录“/f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard/build”
make  -f CMakeFiles/hello_cpp11.dir/build.make CMakeFiles/hello_cpp11.dir/build
make[2]: 进入目录“/f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard/build”
[ 50%] Building CXX object CMakeFiles/hello_cpp11.dir/main.cpp.obj
/D/lyf_computer_language/msys64/mingw64/bin/c++.exe   -std=gnu++11 -MD -MT CMakeFiles/hello_cpp11.dir/main.cpp.obj -MF CMakeFiles/hello_cpp11.dir/main.cpp.obj.d -o CMakeFiles/hello_cpp11.dir/main.cpp.obj -c /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard/main.cpp
[100%] Linking CXX executable hello_cpp11.exe
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E rm -f CMakeFiles/hello_cpp11.dir/objects.a
/D/lyf_computer_language/msys64/mingw64/bin/ar.exe qc CMakeFiles/hello_cpp11.dir/objects.a "CMakeFiles/hello_cpp11.dir/main.cpp.obj"
/D/lyf_computer_language/msys64/mingw64/bin/c++.exe -Wl,--whole-archive CMakeFiles/hello_cpp11.dir/objects.a -Wl,--no-whole-archive -o hello_cpp11.exe -Wl,--out-implib,libhello_cpp11.dll.a -Wl,--major-image-version,0,--minor-image-version,0  -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32
make[2]: 离开目录“/f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard/build”
[100%] Built target hello_cpp11
make[1]: 离开目录“/f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard/build”
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E cmake_progress_start /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard/build/CMakeFiles 0

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard/build
$ ls
cmake_install.cmake  CMakeCache.txt  CMakeFiles  hello_cpp11.exe  Makefile

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard/build
$ ./hello_cpp11.exe
Hello C++11

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/ii-cxx-standard/build
$
```

##### iii-compile-features

###### Files

1. 运行开始菜单的 “MSYS2 MinGW x64”，运行下面命令构建项目目录。

```shell
cd /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/
mkdir iii-compile-features
cd iii-compile-features
```

2. 创建 `CMakeLists.txt` 文件，粘贴下面代码。

```cmake
# Set the minimum version of CMake that can be used
# To find the cmake version run
# $ cmake --version
cmake_minimum_required(VERSION 3.1)

# Set the project name
project(hello_cpp11)

# Add an executable
add_executable(hello_cpp11 main.cpp)

# set the C++ standard to the appropriate standard for using auto
target_compile_features(hello_cpp11 PUBLIC cxx_auto_type)

# Print the list of known compile features for this version of CMake
message("List of compile features: ${CMAKE_CXX_COMPILE_FEATURES}")
```

3. 创建 `main.cpp` 文件，粘贴下面代码。

```c++
#include <iostream>

int main(int argc, char *argv[])
{
        auto message = "Hello C++11";
        std::cout << message << std::endl;
        return 0;
}
```

###### Introduction

This example shows how to set the C++ standard using the `target_compile_features` function. This is available since CMake v3.1.

The files in this tutorial are below:

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features
$ tree
.
├── CMakeLists.txt
└── main.cpp

0 directories, 2 files
```

- `CMakeLists.txt` - Contains the CMake commands you wish to run.

- `main.cpp` - A simple "Hello World" cpp file targeting C++11.

###### Concepts

**Using target_compile_features**

Calling the `target_compile_features` function on a target will look at the passed in feature and determine the correct compiler flag to use for your target.

```cmake
target_compile_features(hello_cpp11 PUBLIC cxx_auto_type)
```

As with other `target_*` functions, you can specify the scope of the feature for the selected target. This populates the `INTERFACE_COMPILE_FEATURES` property for the target.

The list of available features can be found from the `CMAKE_CXX_COMPILE_FEATURES` variable. You can obtain a list of the available features using the following code:

```cmake
message("List of compile features: ${CMAKE_CXX_COMPILE_FEATURES}")
```

###### Building the Examples

Below is sample output from building this example.

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features
$ mkdir build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features
$ cd build/

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features/build
$ cmake .. -G "MSYS Makefiles"
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
List of compile features: cxx_std_98;cxx_template_template_parameters;cxx_std_11;cxx_alias_templates;cxx_alignas;cxx_alignof;cxx_attributes;cxx_auto_type;cxx_constexpr;cxx_decltype;cxx_decltype_incomplete_return_types;cxx_default_function_template_args;cxx_defaulted_functions;cxx_defaulted_move_initializers;cxx_delegating_constructors;cxx_deleted_functions;cxx_enum_forward_declarations;cxx_explicit_conversions;cxx_extended_friend_declarations;cxx_extern_templates;cxx_final;cxx_func_identifier;cxx_generalized_initializers;cxx_inheriting_constructors;cxx_inline_namespaces;cxx_lambdas;cxx_local_type_template_args;cxx_long_long_type;cxx_noexcept;cxx_nonstatic_member_init;cxx_nullptr;cxx_override;cxx_range_for;cxx_raw_string_literals;cxx_reference_qualified_functions;cxx_right_angle_brackets;cxx_rvalue_references;cxx_sizeof_member;cxx_static_assert;cxx_strong_enums;cxx_thread_local;cxx_trailing_return_types;cxx_unicode_literals;cxx_uniform_initialization;cxx_unrestricted_unions;cxx_user_literals;cxx_variadic_macros;cxx_variadic_templates;cxx_std_14;cxx_aggregate_default_initializers;cxx_attribute_deprecated;cxx_binary_literals;cxx_contextual_conversions;cxx_decltype_auto;cxx_digit_separators;cxx_generic_lambdas;cxx_lambda_init_captures;cxx_relaxed_constexpr;cxx_return_type_deduction;cxx_variable_templates;cxx_std_17;cxx_std_20;cxx_std_23
-- Configuring done
-- Generating done
-- Build files have been written to: F:/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features/build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features/build
$ make VERBOSE=1
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -S/F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features -B/F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features/build --check-build-system CMakeFiles/Makefile.cmake 0
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E cmake_progress_start /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features/build/CMakeFiles /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features/build//CMakeFiles/progress.marks
make  -f CMakeFiles/Makefile2 all
make[1]: 进入目录“/f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features/build”
make  -f CMakeFiles/hello_cpp11.dir/build.make CMakeFiles/hello_cpp11.dir/depend
make[2]: 进入目录“/f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features/build”
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E cmake_depends "MSYS Makefiles" /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features/build /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features/build /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features/build/CMakeFiles/hello_cpp11.dir/DependInfo.cmake --color=
make[2]: 离开目录“/f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features/build”
make  -f CMakeFiles/hello_cpp11.dir/build.make CMakeFiles/hello_cpp11.dir/build
make[2]: 进入目录“/f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features/build”
[ 50%] Building CXX object CMakeFiles/hello_cpp11.dir/main.cpp.obj
/D/lyf_computer_language/msys64/mingw64/bin/c++.exe    -MD -MT CMakeFiles/hello_cpp11.dir/main.cpp.obj -MF CMakeFiles/hello_cpp11.dir/main.cpp.obj.d -o CMakeFiles/hello_cpp11.dir/main.cpp.obj -c /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features/main.cpp
[100%] Linking CXX executable hello_cpp11.exe
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E rm -f CMakeFiles/hello_cpp11.dir/objects.a
/D/lyf_computer_language/msys64/mingw64/bin/ar.exe qc CMakeFiles/hello_cpp11.dir/objects.a "CMakeFiles/hello_cpp11.dir/main.cpp.obj"
/D/lyf_computer_language/msys64/mingw64/bin/c++.exe -Wl,--whole-archive CMakeFiles/hello_cpp11.dir/objects.a -Wl,--no-whole-archive -o hello_cpp11.exe -Wl,--out-implib,libhello_cpp11.dll.a -Wl,--major-image-version,0,--minor-image-version,0  -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32
make[2]: 离开目录“/f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features/build”
[100%] Built target hello_cpp11
make[1]: 离开目录“/f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features/build”
/D/lyf_computer_language/msys64/mingw64/bin/cmake.exe -E cmake_progress_start /F/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features/build/CMakeFiles 0

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features/build
$ ls
cmake_install.cmake  CMakeCache.txt  CMakeFiles  hello_cpp11.exe  Makefile

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features/build
$ ./hello_cpp11.exe
Hello C++11

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/01-basic/L-cpp-standard/iii-compile-features/build
$
```

### 02-sub-projects

Many large projects are made up of different libraries and binaries. These can be organised into multiple folders and sub-projects to ease development.

The examples included are

- `basic` - This basic example includes a static library, a header only library and an executable.

#### A-basic

##### Files

1. 运行开始菜单的 “MSYS2 MinGW x64”，运行下面命令构建项目目录。

```shell
cd /f/vscode/cpp_projects/cmake-examples/
mkdir 02-sub-projects
cd 02-sub-projects
mkdir A-basic
cd A-basic
```

2. 创建 `CMakeLists.txt` 文件，粘贴下面代码。

```cmake
cmake_minimum_required(VERSION 3.5)

project(subprojects)

# Add sub directories
add_subdirectory(sublibrary1)
add_subdirectory(sublibrary2)
add_subdirectory(subbinary)
```

3. 创建 `subbinary/CMakeLists.txt` 文件，粘贴下面代码。

```cmake
project(subbinary)

# Create the executable
add_executable(${PROJECT_NAME} main.cpp)

# Link the static library from subproject1 using its alias sub::lib1
# Link the header only library from subproject2 using its alias sub::lib2
# This will cause the include directories for that target to be added to this project
target_link_libraries(${PROJECT_NAME}
        sub::lib1
        sub::lib2
        )
```

4. 创建 `subbinary/main.cpp` 文件，粘贴下面代码。

```c++
#include "sublib1/sublib1.h"
#include "sublib2/sublib2.h"

int main(int argc, char *argv[])
{
        sublib1 hi;
        hi.print();

        sublib2 howdy;
        howdy.print();

        return 0;
}
```

5. 创建 `sublibrary1/CMakeLists.txt` 文件，粘贴下面代码。

```cmake
# Set the project name
project(sublibrary1)

# Add a library with the above sources
add_library(${PROJECT_NAME} src/sublib1.cpp)
add_library(sub::lib1 ALIAS ${PROJECT_NAME})

target_include_directories(${PROJECT_NAME}
        PUBLIC ${PROJECT_SOURCE_DIR}/include
        )
```

6. 创建 `sublibrary1/include/sublib1/sublib1.h` 文件，粘贴下面代码。

```c++
#ifndef __SUBLIB_1_H__
#define __SUBLIB_1_H__

class sublib1
{
public:
        void print();
};

#endif
```

7. 创建 `sublibrary1/src/sublib1.cpp` 文件，粘贴下面代码。

```c++
#include <iostream>

#include "sublib1/sublib1.h"

void sublib1::print()
{
        std::cout << "Hello sub-library 1!" << std::endl;
}
```

8. 创建 `sublibrary2/CMakeLists.txt` 文件，粘贴下面代码。

```cmake
# Set the project name
project(sublibrary2)

add_library(${PROJECT_NAME} INTERFACE)
add_library(sub::lib2 ALIAS ${PROJECT_NAME})

target_include_directories(${PROJECT_NAME}
        INTERFACE
        ${PROJECT_SOURCE_DIR}/include
        )
```

9. 创建 `sublibrary2/include/sublib2/sublib2.h` 文件，粘贴下面代码。

```c++
#ifndef __SUBLIB_2_H__
#define __SUBLIB_2_H__

#include <iostream>

class sublib2
{
public:
        void print()
        {
                std::cout << "Hello header only sub-library 2!" << std::endl;
        }
};

#endif
```

##### Introduction

This example shows how to setup a CMake project that includes sub-projects. The top level CMakeLists.txt calls the CMakeLists.txt in the sub directories to create the following:

- `sublibrary1` - A static library

- `sublibrary2` - A header only library

- `subbinary` - An executable

The files included in this example are:

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/02-sub-projects/A-basic
$ tree
.
├── CMakeLists.txt
├── subbinary
│   ├── CMakeLists.txt
│   └── main.cpp
├── sublibrary1
│   ├── CMakeLists.txt
│   ├── include
│   │   └── sublib1
│   │       └── sublib1.h
│   └── src
│       └── sublib1.cpp
└── sublibrary2
    ├── CMakeLists.txt
    └── include
        └── sublib2
            └── sublib2.h

8 directories, 8 files
```

- `CMakeLists.txt` - Top level CMakeLists.txt

- `subbinary/CMakeLists.txt` - to make the executable

- `subbinary/main.cpp` - source for the executable

- `sublibrary1/CMakeLists.txt` - to make a static library

`sublibrary1/include/sublib1/sublib1.h` - The header file of the static library

`sublibrary1/src/sublib1.cpp` - The source file of the static library

`sublibrary2/CMakeLists.txt` - to setup header only library

`sublibrary2/include/sublib2/sublib2.h` - The header file of the header only library

In this example I have moved the header files to a subfolder under each projects include directory, while `leaving the target include as the root include folder`. This is a good idea to prevent filename clashes because you have to include a file like below:

```c++
#include "sublib1/sublib1.h"
```

This also means that if you install your library for other users the default install location would be `/usr/local/include/sublib1/sublib1.h`.

##### Concepts

###### Adding a Sub-Directory

A `CMakeLists.txt` file can include and call sub-directories which include a `CMakeLists.txt` files.

```cmake
add_subdirectory(sublibrary1)
add_subdirectory(sublibrary2)
add_subdirectory(subbinary)
```

###### Referencing Sub-Project Directories

When a project is created using the `project()` command, CMake will automatically create a number of variables which can be used to reference details about the project. `These variables can then be used by other sub-projects or the main project.` For example, to reference the source directory for a different project you can use.

```cmake
${sublibrary1_SOURCE_DIR}
${sublibrary2_SOURCE_DIR}
```

The variables created by `CMake` include:

|Variable|Info|
|:-:|:-:|
|PROJECT_NAME|The name of the project set by the current `project()`.|
|CMAKE_PROJECT_NAME|the name of the first project set by the `project()` command, i.e. `the top level project`.|
|PROJECT_SOURCE_DIR|The source directory of the current project.|
|PROJECT_BINARY_DIR|The build directory for the current project.|
|name_SOURCE_DIR|The source directory of the project called "name". In this example the source directories created would be `sublibrary1_SOURCE_DIR`, `sublibrary2_SOURCE_DIR`, and `subbinary_SOURCE_DIR`.|
|name_BINARY_DIR|The binary directory of the project called "name". In this example the binary directories created would be `sublibrary1_BINARY_DIR`, `sublibrary2_BINARY_DIR`, and `subbinary_BINARY_DIR`.|

###### Header only Libraries

If you have a library that is created as a header only library, cmake supports the `INTERFACE` target to allow creating a target without any build output.

```cmake
add_library(${PROJECT_NAME} INTERFACE)
```

When creating the target you can also include directories for that target using the `INTERFACE` scope. The `INTERFACE` scope is use to make target requirements that are used in any Libraries that link this target but not in the compilation of the target itself.

```cmake
target_include_directories(${PROJECT_NAME}
    INTERFACE
        ${PROJECT_SOURCE_DIR}/include
)
```

###### Referencing Libraries from Sub-Projects

If a sub-project creates a library, it can be referenced by other projects by calling the name of the target in the `target_link_libraries()` command. This means that you don’t have to reference the full path of the new library and it is added as a dependency.

```cmake
target_link_libraries(subbinary
    PUBLIC
        sublibrary1
)
```

Alternatively, you can create an alias target which allows you to reference the target in read only contexts.

To create an alias target run:

```cmake
add_library(sublibrary2)
add_library(sub::lib2 ALIAS sublibrary2)
```

To reference the alias, just it as follows:

```cmake
target_link_libraries(subbinary
    sub::lib2
)
```

###### Include directories from sub-projects

When adding the libraries from the sub-projects, starting from cmake v3, there is no need to add the projects include directories in the include directories of the binary using them.

This is controlled by the scope in the `target_include_directories()` command when creating the libraries. In this example because the subbinary executable links the sublibrary1 and sublibrary2 libraries it will automatically include the `${sublibrary1_SOURCE_DIR}/include` and `${sublibrary2_SOURCE_DIR}/include` folders as they are exported with the `PUBLIC` and `INTERFACE` scopes of the libraries.

##### Building the example

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/02-sub-projects/A-basic
$ mkdir build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/02-sub-projects/A-basic
$ cd build/

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/02-sub-projects/A-basic/build
$ cmake .. -G "MSYS Makefiles"
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
-- Build files have been written to: F:/vscode/cpp_projects/cmake-examples/02-sub-projects/A-basic/build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/02-sub-projects/A-basic/build
$ make
[ 25%] Building CXX object sublibrary1/CMakeFiles/sublibrary1.dir/src/sublib1.cpp.obj
[ 50%] Linking CXX static library libsublibrary1.a
[ 50%] Built target sublibrary1
[ 75%] Building CXX object subbinary/CMakeFiles/subbinary.dir/main.cpp.obj
[100%] Linking CXX executable subbinary.exe
[100%] Built target subbinary

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/02-sub-projects/A-basic/build
$ ls
cmake_install.cmake  CMakeFiles  subbinary    sublibrary2
CMakeCache.txt       Makefile    sublibrary1

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/02-sub-projects/A-basic/build
$ cd subbinary/

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/02-sub-projects/A-basic/build/subbinary
$ ls
cmake_install.cmake  CMakeFiles  Makefile  subbinary.exe

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/02-sub-projects/A-basic/build/subbinary
$ ./subbinary.exe
Hello sub-library 1!
Hello header only sub-library 2!

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/cmake-examples/02-sub-projects/A-basic/build/subbinary
$
```

### 结语

第二十二篇博文写完，开心！！！！

今天，也是充满希望的一天。
