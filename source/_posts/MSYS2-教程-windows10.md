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
  - make
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

3. [问题解决：系统上禁止运行脚本](https://blog.csdn.net/wodexinhaoleng1/article/details/119712635)

### 安装

关于如何安装 `MSYS2` 可以参考官方文档 [MSYS2](https://www.msys2.org/) 或者 {% post_link GCC-on-Windows-windows10 %}。

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

#### Issues

如果 `Windows PowerShell` 报告 `系统上禁止运行脚本` 问题。可以参考 [问题解决：系统上禁止运行脚本](https://blog.csdn.net/wodexinhaoleng1/article/details/119712635)。

1. 以 `管理员权限` 打开 `Windows PowerShell`，输入 `set-ExecutionPolicy RemoteSigned`，输入 `a` 或者 `y`。

2. 测试是否更改成功：输入 `get-executionpolicy` ，结果为 `RemoteSigned` 表示成功。

### Package Management

#### Package repositories

The MSYS2 software distribution uses a port of `pacman` (known from Arch Linux) to manage (install, remove and update) binary packages and also to build those packages in the first place.

There are 6 package repositories, the "classical" ones `msys2`, `mingw32`, and `mingw64` and the newer `ucrt64`, `clang32`, and `clang64`.

The packages in `msys2` are named just like on a Linux distribution, the packages in the others are prefixed by either `mingw-w64-i686-` for 32-bit packages, or `mingw-w64-x86_64-` for 64-bit packages with a secondary prefix `clang` or `ucrt` where applicable.

#### Finding a package

{% label 查找软件包 pink %}

```shell
pacman -Ss <name or part of the name of the package>

lyf@DESKTOP-GV2QHKN MSYS ~
$ pacman -Ss openjp
mingw32/mingw-w64-i686-openjpeg 1.5.2-7
    An open source JPEG 2000 codec (mingw-w64)
mingw32/mingw-w64-i686-openjpeg2 2.5.0-2
    An open source JPEG 2000 codec (mingw-w64)
mingw64/mingw-w64-x86_64-openjpeg 1.5.2-7
    An open source JPEG 2000 codec (mingw-w64)
mingw64/mingw-w64-x86_64-openjpeg2 2.5.0-2 [已安装]
    An open source JPEG 2000 codec (mingw-w64)
ucrt64/mingw-w64-ucrt-x86_64-openjpeg 1.5.2-7
    An open source JPEG 2000 codec (mingw-w64)
ucrt64/mingw-w64-ucrt-x86_64-openjpeg2 2.5.0-2
    An open source JPEG 2000 codec (mingw-w64)
clang32/mingw-w64-clang-i686-openjpeg 1.5.2-7
    An open source JPEG 2000 codec (mingw-w64)
clang32/mingw-w64-clang-i686-openjpeg2 2.5.0-2
    An open source JPEG 2000 codec (mingw-w64)
clang64/mingw-w64-clang-x86_64-openjpeg 1.5.2-7
    An open source JPEG 2000 codec (mingw-w64)
clang64/mingw-w64-clang-x86_64-openjpeg2 2.5.0-2
    An open source JPEG 2000 codec (mingw-w64)
```

你能发现 `mingw-w64-x86_64-openjpeg2` 包已被安装，其他包没有被安装。

{% label 只想在已安装的软件包中搜索 pink %}

```shell
pacman -Qs <name or part of the name of the package>

lyf@DESKTOP-GV2QHKN MSYS ~
$ pacman -Qs openjp
local/mingw-w64-x86_64-openjpeg2 2.5.0-2
    An open source JPEG 2000 codec (mingw-w64)
```

#### Installing a package

{% label 安装包 pink %}

```shell
pacman -S <name of the package>
```

>If the package has dependencies which are not installed, `pacman` will ask you whether you would like to install the dependencies in the first place.
>
>`pacman -S` also accepts virtual package names and package group names. Virtual package names can be often encountered with packages built from Git, e.g. `msys2-launcher-git` can be installed by requesting `msys-launcher`. Package groups simplify installation of related packages, e.g. install `base-devel` to get basic development tools.
>
>Please note that neither of those are real packages, so the commands below won't accept these names and you need to use the real package names instead.

#### Uninstalling a package

>The following command will remove a package (but not its dependencies nor any files produced by running it):

```shell
pacman -R <name of the package>
```

#### Installing a specific version of a package or a stand-alone packages

>Older (or pre-release) versions of packages can be installed directly from the package archive (`.tar.zst` or `.tar.xz`). [The data store](https://repo.msys2.org/) for the repositories contains older versions of packages, but beware that you might need to recursively find correct versions of dependencies for the desired package. Once downloaded, the package can be installed like this:

```shell
pacman -U <packagefile.tar.zst>
```

{% label or pink %}

```shell
pacman -U <packagefile.tar.xz>
```

#### Finding dependencies of a package

You can use `pactree` to figure out which packages are needed to make a package working properly:

```shell
lyf@DESKTOP-GV2QHKN MSYS ~
$ pactree mingw-w64-x86_64-gettext
mingw-w64-x86_64-gettext
├─mingw-w64-x86_64-expat
├─mingw-w64-x86_64-gcc-libs
│ ├─mingw-w64-x86_64-gmp
│ ├─mingw-w64-x86_64-mpc
│ │ └─mingw-w64-x86_64-mpfr
│ │   └─mingw-w64-x86_64-gmp
│ ├─mingw-w64-x86_64-mpfr
│ └─mingw-w64-x86_64-libwinpthread-git provides mingw-w64-x86_64-libwinpthread
└─mingw-w64-x86_64-libiconv
```

Alternatively you can use `pacman -Qi` to get the list of `direct` dependencies of a package:

```shell
lyf@DESKTOP-GV2QHKN MSYS ~
$ pacman -Qi mingw-w64-x86_64-gettext
名字           : mingw-w64-x86_64-gettext
版本           : 0.21-3
描述           : GNU internationalization library (mingw-w64)
架构           : any
URL            : https://www.gnu.org/software/gettext/
软件许可       : GPL3  partial:LGPL2.1
组             : 无
提供           : 无
依赖于         : mingw-w64-x86_64-expat  mingw-w64-x86_64-gcc-libs
                 mingw-w64-x86_64-libiconv
可选依赖       : 无
依赖它         : mingw-w64-x86_64-libidn2  mingw-w64-x86_64-libpsl
                 mingw-w64-x86_64-libtre-git  mingw-w64-x86_64-libxml2
                 mingw-w64-x86_64-make  mingw-w64-x86_64-p11-kit
                 mingw-w64-x86_64-rhash  mingw-w64-x86_64-xz
被可选依赖     : 无
与它冲突       : 无
取代           : 无
安装后大小     : 17.47 MiB
打包者         : CI (msys2-autobuild/f765fe5e/1689836820)
编译日期       : 2022年01月13日 6:36:51
安装日期       : 2022年07月19日 19:55:58
安装原因       : 作为其他软件包的依赖关系安装
安装脚本       : 否
验证者         : 数字签名
```

#### Finding out which package a file belongs to

Use the following command to trace a file back to its owning package:

```shell
pacman -Qo <full file path>
```

Note that this operation only compares the file paths, so proper capitalization and the `.exe` suffix (if applicable) is required. Also note that this works only on `installed packages`, it will not scan the whole package repositories.

#### Finding which package will install the file you need

The two recommended tools that can scan a repository and find packages that contain specific files are `pacman -F` and `pkgfile`. Below are examples of `pacman -F` usage:

Call `pacman -Fy` to update your package database. To find an `exact match`, call `pacman -F <filename>` (don't include the path in the filename). To find a `substring match`, call `pacman -Fx <filename>`.

Note that this operation only compares the file paths, so proper capitalization and the `.exe` suffix (if applicable) is required.

#### Listing installed packages

```shell
lyf@DESKTOP-GV2QHKN MSYS ~
$ pacman -Qqe
base
base-devel
clang
cmake
filesystem
meson
mingw-w64-clang-x86_64-clang
mingw-w64-clang-x86_64-clang-analyzer
mingw-w64-clang-x86_64-clang-tools-extra
mingw-w64-clang-x86_64-compiler-rt
mingw-w64-clang-x86_64-crt-git
mingw-w64-clang-x86_64-gcc-compat
mingw-w64-clang-x86_64-headers-git
mingw-w64-clang-x86_64-libc++
mingw-w64-clang-x86_64-libc++abi
mingw-w64-clang-x86_64-libmangle-git
mingw-w64-clang-x86_64-libunwind
mingw-w64-clang-x86_64-libwinpthread-git
mingw-w64-clang-x86_64-lld
mingw-w64-clang-x86_64-lldb
mingw-w64-clang-x86_64-llvm
mingw-w64-clang-x86_64-make
mingw-w64-clang-x86_64-openmp
mingw-w64-clang-x86_64-pkgconf
mingw-w64-clang-x86_64-polly
mingw-w64-clang-x86_64-tools-git
mingw-w64-clang-x86_64-winpthreads-git
mingw-w64-clang-x86_64-winstorecompat-git
mingw-w64-x86_64-binutils
mingw-w64-x86_64-boost
mingw-w64-x86_64-cmake
mingw-w64-x86_64-crt-git
mingw-w64-x86_64-gcc
mingw-w64-x86_64-gcc-ada
mingw-w64-x86_64-gcc-fortran
mingw-w64-x86_64-gcc-libgfortran
mingw-w64-x86_64-gcc-libs
mingw-w64-x86_64-gcc-objc
mingw-w64-x86_64-gdb
mingw-w64-x86_64-gdb-multiarch
mingw-w64-x86_64-headers-git
mingw-w64-x86_64-libgccjit
mingw-w64-x86_64-libmangle-git
mingw-w64-x86_64-libwinpthread-git
mingw-w64-x86_64-make
mingw-w64-x86_64-openjpeg2
mingw-w64-x86_64-pkgconf
mingw-w64-x86_64-protobuf-c
mingw-w64-x86_64-pugixml
mingw-w64-x86_64-tools-git
mingw-w64-x86_64-winpthreads-git
mingw-w64-x86_64-winstorecompat-git
msys2-runtime
pactoys
protobuf-devel
python
tree
unzip
vim
zip

lyf@DESKTOP-GV2QHKN MSYS ~
$
```

### Package Naming

#### Overview

不同环境的 `the package prefix` - `MINGW_PACKAGE_PREFIX`。

|                                                          | Name           | Package Prefix        |
|----------------------------------------------------------|----------------|---------------|
| ![msys](https://cos.luyf-lemon-love.space/images/20220803155912.png)        | **MSYS**       | `None`        |
| ![mingw64](https://cos.luyf-lemon-love.space/images/20220803160001.png)       | **MINGW64**    | `mingw-w64-x86_64-`    |
| ![ucrt64](https://cos.luyf-lemon-love.space/images/20220803160033.png)         | **UCRT64**     | `mingw-w64-ucrt-x86_64-`     |
| ![clang64](https://cos.luyf-lemon-love.space/images/20220803160111.png)       | **CLANG64**    | `mingw-w64-clang-x86_64-`    |
| ![mingw32](https://cos.luyf-lemon-love.space/images/20220803160139.png)       | **MINGW32**    | `mingw-w64-i686-`    |
| ![clang32](https://cos.luyf-lemon-love.space/images/20220803160311.png)       | **CLANG32**    | `mingw-w64-clang-i686-`    |
| ![clangarm64](https://cos.luyf-lemon-love.space/images/20220803160335.png) | **CLANGARM64** | `mingw-w64-clang-aarch64-` |

#### Avoiding writing long package names

Use `pacboy` to install **mingw** packages without having to type the long package names (install `pacboy` first using `pacman -S pactoys` if necessary). Examples:

- `pacboy` installs the listed packages for one or more environments. The selection of environments for each package is controlled by `appending suffixes` on the package name.

- In particular, adding the `:p` suffix installs the package for `the current environment only`.

- `If no suffix is given, the selection of environments depends on what environment you're currently in` - e.g. in a mingw64 environment, it currently defaults to installing the package for both mingw32 and mingw64.

```shell
lyf@DESKTOP-GV2QHKN MSYS ~
$ pacboy help

    Pacboy 2016.6.24
    Copyright (C) 2015, 2016 Renato Silva
    Licensed under BSD

    This is a pacman wrapper for MSYS2 which handles the package prefixes
    automatically, and provides human-friendly commands for common tasks.

    Usage:
        pacboy [command] [arguments]
        Arguments will be passed to pacman after translation:

        For 64-bit MSYS2 shell:
            name:i means i686-only
            name:x means x86_64-only
            name:z means clang-i686-only
            name:c means clang-x86_64-only
            name:u means ucrt-x86_64-only
            name:a means clang-aarch64-only
            name:p means MINGW_PACKAGE_PREFIX-only

        For MSYS shell:
            name:m means mingw-w64
            name:l means mingw-w64-clang

        For all shells:
            name: disables any translation for name
            repository::name means repository/name

    Commands:
        sync        Shorthand for --sync or --upgrade
        update      Shorthand for --sync --refresh --sysupgrade
        refresh     Shorthand for --sync --refresh
        find        Shorthand for --sync --search
        packages    Shorthand for --sync --list
        files       Shorthand for --query --list [--file]
        info        Shorthand for --query --info [--file]
        origin      Shorthand for --query --owns or --files
        remove      Shorthand for --remove --recursive
        debug       Verbose output for the above commands
```

Here are examples of using the `:x`, `:i` and `:m` suffixes for installing packages for the `mingw64`, `mingw32` and `both environments`:

```shell
lyf@DESKTOP-GV2QHKN MSYS ~
$ pacboy -S x265:x
正在解析依赖关系...
正在查找软件包冲突...

软件包 (1) mingw-w64-x86_64-x265-3.5-3

下载大小：       2.92 MiB
全部安装大小：  65.20 MiB

:: 进行安装吗？ [Y/n] n

lyf@DESKTOP-GV2QHKN MSYS ~
$ pacboy -S x265:i
正在解析依赖关系...
正在查找软件包冲突...

软件包 (6) mingw-w64-i686-gcc-libs-12.1.0-3  mingw-w64-i686-gmp-6.2.1-3
           mingw-w64-i686-libwinpthread-git-10.0.0.r54.gb4116e310-1
           mingw-w64-i686-mpc-1.2.1-1  mingw-w64-i686-mpfr-4.1.0.p13-1
           mingw-w64-i686-x265-3.5-3

下载大小：       3.52 MiB
全部安装大小：  30.04 MiB

:: 进行安装吗？ [Y/n] n

lyf@DESKTOP-GV2QHKN MSYS ~
$ pacboy -S x265:m
正在解析依赖关系...
正在查找软件包冲突...

软件包 (7) mingw-w64-i686-gcc-libs-12.1.0-3  mingw-w64-i686-gmp-6.2.1-3
           mingw-w64-i686-libwinpthread-git-10.0.0.r54.gb4116e310-1
           mingw-w64-i686-mpc-1.2.1-1  mingw-w64-i686-mpfr-4.1.0.p13-1
           mingw-w64-i686-x265-3.5-3  mingw-w64-x86_64-x265-3.5-3

下载大小：       6.44 MiB
全部安装大小：  95.24 MiB

:: 进行安装吗？ [Y/n] n
```

### Repositories and Mirrors

#### Active environments

The package manager uses only environments that are configured under `/etc/pacman.conf`. You may add/uncomment/remove/comment those as needed:

```
# always include msys!
[msys]
Include = /etc/pacman.d/mirrorlist.msys

[mingw32]
Include = /etc/pacman.d/mirrorlist.mingw

[mingw64]
Include = /etc/pacman.d/mirrorlist.mingw

[ucrt64]
Include = /etc/pacman.d/mirrorlist.mingw

[clang64]
Include = /etc/pacman.d/mirrorlist.mingw

[clang32]
Include = /etc/pacman.d/mirrorlist.mingw

#[clangarm64]
#Include = /etc/pacman.d/mirrorlist.mingw
```

To launch an environment either use the wrapper executables like `ucrt64.exe` or call `msys2_shell.cmd` with either the matching parameter like `msys2_shell.cmd -clang64` or by setting `MSYSTEM`.

### Tips and Tricks

#### Show the license information of a package

To list the license of an installed package you can run:

```shell
$ pacman -Qi meson | grep '^Licenses'
Licenses        : Apache 2
```

To list the license of a package in the sync database you can run:

```shell
$ pacman -Si meson | grep '^Licenses'
Licenses        : Apache 2
```

To list all license files installed by a package in the recommended location:

```shell
$ pacman -Ql meson | grep -E "/share/licenses/.+/.+"
meson /usr/share/licenses/meson/COPYING
```

Note that not every package includes the license text as a file, nor puts it in this specific recommended location.

#### Listing the content of a package

If you would like to know what has been installed as a part of a specific package use the following command:

```shell
pacman -Ql <name of the package>
```

Example:

```shell
pacman -Ql mingw-w64-x86_64-pugixml
```

```shell
mingw-w64-x86_64-pugixml /mingw64/
mingw-w64-x86_64-pugixml /mingw64/bin/
mingw-w64-x86_64-pugixml /mingw64/bin/libpugixml.dll
mingw-w64-x86_64-pugixml /mingw64/include/
mingw-w64-x86_64-pugixml /mingw64/include/pugixml-1.8/
mingw-w64-x86_64-pugixml /mingw64/include/pugixml-1.8/pugiconfig.hpp
mingw-w64-x86_64-pugixml /mingw64/include/pugixml-1.8/pugixml.hpp
mingw-w64-x86_64-pugixml /mingw64/lib/
mingw-w64-x86_64-pugixml /mingw64/lib/cmake/
mingw-w64-x86_64-pugixml /mingw64/lib/cmake/pugixml/
mingw-w64-x86_64-pugixml /mingw64/lib/cmake/pugixml/pugixml-config-noconfig.cmake
mingw-w64-x86_64-pugixml /mingw64/lib/cmake/pugixml/pugixml-config.cmake
mingw-w64-x86_64-pugixml /mingw64/lib/pkgconfig/
mingw-w64-x86_64-pugixml /mingw64/lib/pkgconfig/pugixml.pc
mingw-w64-x86_64-pugixml /mingw64/lib/pugixml-1.8/
mingw-w64-x86_64-pugixml /mingw64/lib/pugixml-1.8/libpugixml.dll.a
```

As you can see the package contains:

- a binary executable library file (libpugixml.dll),

- a static library (libpugixml.dll.a),

- 2 header files (pugixml.hpp, pugiconfig.hpp),

- 2 cmake files,

- and a PKGCONFIG file (pugixml.pc).

>请注意上面的命令不能够在 `Mintty` 中输出想要的结果。可以使用 `Windows PowerShell` 运行上面的命令。要在 `Windows PowerShell` 运行上面的命令，需要配置环境变量，可以参考 {% post_link GCC-on-Windows-windows10 %}

```shell
lyf@DESKTOP-GV2QHKN MSYS ~
$ which meson
/usr/bin/meson

lyf@DESKTOP-GV2QHKN MSYS ~
$ pacman -Qi meson | grep '^Licenses'

lyf@DESKTOP-GV2QHKN MSYS ~
$
```

---

```shell
版权所有 (C) Microsoft Corporation。保留所有权利。
尝试新的跨平台 PowerShell https://aka.ms/pscore6
PS C:\Users\lyf> pacman -Qi meson | grep '^Licenses'
error: package 'meson' was not found
PS C:\Users\lyf> pacman -S meson
resolving dependencies...
looking for conflicting packages...

Packages (1) meson-0.63.0-1

Total Installed Size:  7.84 MiB

:: Proceed with installation? [Y/n]
(1/1) checking keys in keyring                                 [#################################] 100%
(1/1) checking package integrity                               [#################################] 100%
(1/1) loading package files                                    [#################################] 100%
(1/1) checking for file conflicts                              [#################################] 100%
:: Processing package changes...
PS C:\Users\lyf> pacman -Ss meson
    High-productivity build system (mingw-w64)
mingw64/mingw-w64-x86_64-meson 0.63.0-1
    High-productivity build system (mingw-w64)
ucrt64/mingw-w64-ucrt-x86_64-meson 0.63.0-1
    High-productivity build system (mingw-w64)
clang32/mingw-w64-clang-i686-meson 0.63.0-1
    High-productivity build system (mingw-w64)
clang64/mingw-w64-clang-x86_64-meson 0.63.0-1
    High-productivity build system (mingw-w64)
msys/meson 0.63.0-1 [installed]
    High-productivity build system
PS C:\Users\lyf> pacman -Qi meson | grep '^Licenses'
Licenses        : spdx:Apache-2.0
PS C:\Users\lyf> pacman -Si meson | grep '^Licenses'
Licenses        : spdx:Apache-2.0
checking dependencies...

Packages (1) meson-0.63.0-1

Total Removed Size:  7.84 MiB

:: Do you want to remove these packages? [Y/n]
:: Processing package changes...
(1/1) removing meson                                           [#################################] 100%
PS C:\Users\lyf> pacman -Si meson | grep '^Licenses'
Licenses        : spdx:Apache-2.0
PS C:\Users\lyf> pacman -Ql meson | grep -E "/share/licenses/.+/.+"
error: package 'meson' was not found
PS C:\Users\lyf> pacman -S meson
resolving dependencies...
looking for conflicting packages...

Packages (1) meson-0.63.0-1

Total Installed Size:  7.84 MiB

:: Proceed with installation? [Y/n]
(1/1) checking keys in keyring                                 [#################################] 100%
(1/1) checking package integrity                               [#################################] 100%
(1/1) loading package files                                    [#################################] 100%
(1/1) checking for file conflicts                              [#################################] 100%
(1/1) checking available disk space                            [#################################] 100%
:: Processing package changes...
(1/1) installing meson                                         [#################################] 100%
PS C:\Users\lyf> pacman -Ql meson | grep -E "/share/licenses/.+/.+"
meson /usr/share/licenses/meson/COPYING
PS C:\Users\lyf> pacman -Ql mingw-w64-x86_64-pugixml
error: package 'mingw-w64-x86_64-pugixml' was not found
PS C:\Users\lyf> pacman -S mingw-w64-x86_64-pugixml
resolving dependencies...
looking for conflicting packages...

Packages (1) mingw-w64-x86_64-pugixml-1.12.1-1

Total Installed Size:  0.82 MiB

:: Proceed with installation? [Y/n]
(1/1) checking keys in keyring                                 [#################################] 100%
(1/1) checking package integrity                               [#################################] 100%
(1/1) loading package files                                    [#################################] 100%
(1/1) checking for file conflicts                              [#################################] 100%
(1/1) checking available disk space                            [#################################] 100%
:: Processing package changes...
(1/1) installing mingw-w64-x86_64-pugixml                      [#################################] 100%
PS C:\Users\lyf> pacman -Ql mingw-w64-x86_64-pugixml
mingw-w64-x86_64-pugixml /mingw64/
mingw-w64-x86_64-pugixml /mingw64/bin/
mingw-w64-x86_64-pugixml /mingw64/bin/libpugixml.dll
mingw-w64-x86_64-pugixml /mingw64/include/
mingw-w64-x86_64-pugixml /mingw64/include/pugiconfig.hpp
mingw-w64-x86_64-pugixml /mingw64/include/pugixml.hpp
mingw-w64-x86_64-pugixml /mingw64/lib/
mingw-w64-x86_64-pugixml /mingw64/lib/cmake/
mingw-w64-x86_64-pugixml /mingw64/lib/cmake/pugixml/
mingw-w64-x86_64-pugixml /mingw64/lib/cmake/pugixml/pugixml-config-version.cmake
mingw-w64-x86_64-pugixml /mingw64/lib/cmake/pugixml/pugixml-config.cmake
mingw-w64-x86_64-pugixml /mingw64/lib/cmake/pugixml/pugixml-targets-release.cmake
mingw-w64-x86_64-pugixml /mingw64/lib/cmake/pugixml/pugixml-targets.cmake
mingw-w64-x86_64-pugixml /mingw64/lib/libpugixml.a
mingw-w64-x86_64-pugixml /mingw64/lib/libpugixml.dll.a
mingw-w64-x86_64-pugixml /mingw64/lib/pkgconfig/
mingw-w64-x86_64-pugixml /mingw64/lib/pkgconfig/pugixml.pc
mingw-w64-x86_64-pugixml /mingw64/share/
mingw-w64-x86_64-pugixml /mingw64/share/licenses/
mingw-w64-x86_64-pugixml /mingw64/share/licenses/pugixml/
mingw-w64-x86_64-pugixml /mingw64/share/licenses/pugixml/LICENSE
PS C:\Users\lyf> history

  Id CommandLine
  -- -----------
   1 pacman -Qi meson | grep '^Licenses'
   2 pacman -S meson
   3 pacman -Ss meson
   4 pacman -Qi meson | grep '^Licenses'
   5 pacman -Si meson | grep '^Licenses'
   6 pacman -R meson
   7 pacman -Si meson | grep '^Licenses'
   8 pacman -Ql meson | grep -E "/share/licenses/.+/.+"
   9 pacman -S meson
  10 pacman -Ql meson | grep -E "/share/licenses/.+/.+"
  11 pacman -Ql mingw-w64-x86_64-pugixml
  12 pacman -S mingw-w64-x86_64-pugixml
  13 pacman -Ql mingw-w64-x86_64-pugixml


PS C:\Users\lyf>
```

### Using CMake in MSYS2

#### Installing

When building projects for Windows with CMake (as opposed to building projects that are going to run in MSYS2 posix emulation runtime) make sure to install the MinGW version of CMake, i.e. installing e.g. `mingw-w64-x86_64-cmake`.

You also want to install a tool for actually doing the build. The current recommended default is Ninja, which you can install from the `mingw-w64-x86_64-ninja` package.

Other alternatives are `make` or `mingw-w64-x86_64-make`, for building with `GNU Make` running either as a `MSYS2` or `MinGW` process.

#### Building

When running the CMake configuration command, it's recommended to explicitly specify the desired build file generator with the `-G` option. MSYS2 provided CMake defaults to `Ninja` (but this is not the default in upstream CMake, so `it's safest to explicitly specify it`).

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

### MSYS2-Introduction

`MSYS2` is software distribution and a building platform for Windows. It provides `a Unix-like environment`, a command-line interface and a software repository making it easier to install, use, build and port software on Windows. That means `Bash`, `Autotools`, `Make`, `Git`, `GCC`, `GDB`..., all easily installable through `Pacman`, a fully-featured package manager.

It is an independent rewrite of MSys, based on modern Cygwin (POSIX compatibility layer) and MinGW-w64 with the aim of better interoperability with native Windows software.

Both 32-bit and 64-bit variants exist and receive mostly the same level of support.

#### Subsystems

MSYS2 consists of three subsystems and their corresponding package repositories, `msys2`, `mingw32`, and `mingw64`.

The `mingw` subsystems provide native Windows programs and are the main focus of the project. These programs are built to co-operate well with other Windows programs, independently of the other subsystems. This part builds on the MinGW-w64 project.

The `msys2` subsystem provides an emulated mostly-POSIX-compliant environment for building software, package management, and shell scripting. These programs live in `a virtual single-root filesystem` (the root is the MSYS2 installation directory). Some effort is made to have the programs work well with native Windows programs, but it's not seamless. This part builds on the Cygwin project.

Each of the subsystems provides its own native (i.e. target=host) compiler toolchain, in `mingw-w64-i686-toolchain`, and `mingw-w64-x86_64-toolchain`. There are also cross compiler toolchains with host={i686,x86_64}-pc-msys and target={i686,x86_64}-w64-mingw32 in `mingw-w64-cross-toolchain`, but these are of limited use because `there are no library packages for them`.

#### Shells

Every subsystem has an associated "shell", which is essentially a set of environment variables that allow the subsystems to co-operate properly. These shells can be invoked using launchers in the MSYS2 installation directory or using the shortcuts in the Windows Start menu. The launchers set the `MSYSTEM` variable and open a terminal window (mintty) with a proper shell (bash). Bash in turn sources `/etc/profile` which sets the environment depending on the value of `MSYSTEM`.

Without the correct environment, various things may and will (sometimes silently) break. The exception is using mingw subsystems from pure Windows, which shouldn't require any special environment apart from an entry in `PATH`. Do not set `MSYSTEM` outside of the shells, because that will also break things.

#### PATH

For optimal usage, MSYS2 automatically strips your `PATH` environment variable, essentially only leaving `C:\Windows\System32` and few others. This behavior can be controlled by setting the variable `MSYS2_PATH_TYPE` before starting a shell or using a correct argument when executing the launcher script. Beware that mixing in programs from other MSYS2 installations, Cygwin installations, compiler toolchains or even various other programs is not supported and will probably break things in unexpected ways. Do not have these things in `PATH` when running MSYS2 unless you know what you're doing.

Use `msys2` shell for running `pacman`, `makepkg`, `makepkg-mingw` and for building POSIX-dependent software that you don't intend to distribute. Use `mingw` shells for building native Windows software and other tasks.

#### Packages

MSYS2 uses a port of **pacman** (known from Arch Linux) for package management. This brings many powerful features such as dependency resolution and simple complete system upgrades, as well as providing the build system (`makepkg-mingw`) - which is used to make these packages.

Packages for `msys2` are built from recipes in the `msys2-packages` Git repository, packages for `mingw` are in `mingw-packages`. Official repositories are on GitHub under user the msys2 organization. When looking for `msys2` packages or deciding to create a new one, keep in mind that MSYS2 doesn't intend to compete with Cygwin or duplicate their efforts. The set of things that belong to the `msys2` subsystem is pretty small and needs to stay that way.

You might be wondering why there appears to be only one architecture variant of the `msys2` repository. In reality there are two, but the decision about which one to use is made at the time you install it, depending on whether you installed the `i686` or the `x86_64` version. It is possible to install both if you wish. Actually, you can have multiple installations of each on your computer, but you should never run programs from two different MSYS2 XXbit variants at the same time due to DLL address space and version conflicts. Also note that the uninstaller will only remove the most recently installed one of each variant).

#### File system

The virtual filesystem contains:

Paths                                                    | Contents
---------------------------------------------------------|--------------------------------
`/bin`, `/dev`, `/home`, `/opt`, `/proc`, `/tmp`, `/var` | essential POSIX stuff
`/etc`, `/usr`                                           | `msys2` subsystem
`/mingw32`, `/mingw64`                                   | `mingw` subsystems
`/c`, `/d`, ...                                          | mount points for Windows drives
`/*.xml`, `/maintenancetool.*`, `InstallationLog.txt`    | (un)installer
`/autorebase.bat`, `/msys2_shell.cmd`, `/msys2.ico`      | shell entry points

### mingw32-make

MSYS2 provides two versions of make, one in the `make` package and one in the `mingw-w64-{i686,x86_64}-make` packages. The latter one is called `mingw32-make` on command line, is fully native and doesn't depend on `msys2` shells. The downside is that it doesn't work with many `Makefile`s. Unless you know what you're doing, use the regular `make`.

### 结语

第二十一篇博文写完，开心！！！！

今天，也是充满希望的一天。