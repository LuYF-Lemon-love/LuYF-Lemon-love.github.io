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

2. [关于用g++编译后运行时出现的问题:无法定位程序输入点__gxx_personality_v0](https://blog.csdn.net/lushuchengsky/article/details/78002565)

3. [无法定位程序输入点__gxx_personality_v0的一个解决方法](https://blog.csdn.net/zyli14/article/details/51302153)

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

   ```shell
   pacman -Syu
   ```

   6. 安装 `Mingw-w64 toolset`。

   ```shell
   pacman -S --needed base-devel mingw-w64-x86_64-toolchain
   ```

   7. 关闭 "MSYS2 MSYS" 窗口，运行开始菜单的 "MSYS2 MinGW x64"。现在就可以使用 "make" 和 "gcc" 为 Windows 构建软件了。

5. 将 `Mingw-w64` 的 `bin` 目录的路径添加到 Windows `PATH` 环境变量。

   1. In the Windows search bar, type 'settings' to open your Windows Settings.

   2. Search for **Edit environment variables for your account**.

   3. Choose the `Path` variable in your **User variables** and then select **Edit**.

   4. Select **New** and add the Mingw-w64 destination folder path to the system path. The exact path depends on which version of Mingw-w64 you have installed and where you installed it. If you used the settings above to install Mingw-w64, then add this to the path: `C:\msys64\mingw64\bin`.

   >由于为了以后的方便，我还添加了其他的路径。
   >
   >D:\lyf_computer_language\msys64\usr\bin
   >D:\lyf_computer_language\msys64\mingw64\bin
   >D:\lyf_computer_language\msys64\clang64\bin

   5. Select **OK** to save the updated PATH. You will need to reopen any console windows for the new PATH location to be available.

#### Check your MinGW installation

为了检查 `Mingw-w64 tools` 是否安装正确，打开一个新的控制台。

```shell
g++ --version
gdb --version
```

### Create Hello World

运行开始菜单的 "MSYS2 MinGW x64"，运行下面命令。

```shell
mkdir projects
cd projects
mkdir helloworld
cd helloworld
code .
```

The "code ." command opens VS Code in the current working folder, which becomes your "workspace". Accept the Workspace Trust dialog by selecting **Yes, I trust the authors** since this is a folder you created.

#### Add a source code file

1. 新建 `helloworld.cpp`。

```c++
#include <iostream>
#include <vector>
#include <string>

using namespace std;

int main(void)
{
    vector<string> msg {"Hello", "C++", "World", "from", "VS Code", "and the C++ extension!"};

    for (const string& word : msg)
    {
        cout << word << " ";
    }
    cout << endl;
}
```

### Run helloworld.cpp

1. Open `helloworld.cpp` so that it is the active file.

2. Press the play button in the top right corner of the editor.

![](https://cos.luyf-lemon-love.space/images/20220802193513.png)

3. Choose `C/C++: g++.exe build and debug active file` from the list of detected compilers on your system.

![](https://cos.luyf-lemon-love.space/images/20220802193613.png)

4. After the build succeeds, your program's output will appear in the integrated Terminal.

![](https://cos.luyf-lemon-love.space/images/20220802194403.png)

### 常见问题

1. 如果出现下图错误，可以采用下面的方法或者参考下面的文章。

![](https://cos.luyf-lemon-love.space/images/20220719205257.png)

   - `方法1`: 使用-static 编译[g++ -static file.cpp]。

   - `方法2`: 将 `libstdc++-6.dll` 文件放到 `C:\Windows\System32` 或 `C:\Windows\SysWOW64` 文件夹下。`libstdc++-6.dll` 文件可以从`Mingw-w64` 的 `bin` 目录的路径（`D:\lyf_computer_language\msys64\mingw64\bin`）得到。

   - `文章1`: [关于用g++编译后运行时出现的问题:无法定位程序输入点__gxx_personality_v0](https://blog.csdn.net/lushuchengsky/article/details/78002565)

   - `文章2`: [无法定位程序输入点__gxx_personality_v0的一个解决方法](https://blog.csdn.net/zyli14/article/details/51302153)

### 结语

第二十篇博文写完，开心！！！！

今天，也是充满希望的一天。