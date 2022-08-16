---
title: 现代 C++ 教程学习笔记（一）-windows10
tags:
  - C++11
  - MinGW
  - MSYS2
  - Windows
  - Clang
  - make
  - Makefile
  - C/C++
categories: 学习笔记
description: 现代 C++ 教程前两章（序言、迈向现代 C++、语言可用性的强化）的学习笔记。
cover: 'https://cos.luyf-lemon-love.space/images/shadow_ruination_03.jpg'
abbrlink: 2389973386
date: 2022-08-16 11:00:28
---

# 前言

[现代 C++ 教程：高速上手 C++ 11/14/17/20（第二版）](https://changkun.de/modern-cpp/) 是欧长坤 (hi[at]changkun.de) 用中文写的。

本人的笔记对应的书籍最后更新时间为 2022 年 7 月 17 日。

本书的官网为 https://changkun.de/modern-cpp/ 。可以在线阅读或者下载 PDF 版本。

本书 GitHub 的地址为 https://github.com/changkun/modern-cpp-tutorial 。

本书 code 的地址为 https://github.com/changkun/modern-cpp-tutorial/tree/master/code 。

本书 exercises 的地址为 https://github.com/changkun/modern-cpp-tutorial/tree/master/exercises 。

操作系统：**Windows 10 专业版**

# 参考文档

1. [现代 C++ 教程：高速上手 C++ 11/14/17/20（第二版）](https://changkun.de/modern-cpp/)

# 序言

## 引言

>C++ 是一个用户群体相当大的语言。从 C++98 的出现到 C++11 的正式定稿经历了长达十年多之久的积累。C++14/17 则是作为对 C++11 的重要补充和优化，C++20 则将这门语言领进了现代化的大门，所有这些新标准中扩充的特性，给 C++ 这门语言注入了新的活力。本书把 C++98 及其之前的 C++ 特性均称之为传统 C++。 

现代 C++ (本书中均指 C++11/14/17/20) 为传统 C++ 注入的大量特性使得整个 C++ 变得更加像一门现代化的语言。

>现代 C++ 不仅仅增强了 C++ 语言自身的可用性，`auto` 关键字语义的修改使得我们更加有信心来操控极度复杂的模板类型。同时还对语言运行期进行了大量的强化，`Lambda` 表达式的出现让 C++ 具有了`匿名函数`的`闭包`特性，而这一特性几乎在现代的编程语言（诸如 Python/Swift/... ）中已经司空见惯，`右值引用`的出现解决了 C++ 长期以来被人诟病的`临时对象效率问题`等等。
>
>`C++17` 包含了大量小而美的语言与特性（例如结构化绑定），这些特性的出现再一次修正了我们在 C++ 中的编程范式。
>
>现代 C++ 还为自身的`标准库`增加了非常多的工具和方法，诸如在语言自身标准的层面上制定了 `std::thread`，从而`支持了并发编程`，在不同平台上不再依赖于系统底层的 API，实现了语言层面的跨平台支持；`std::regex` 提供了完整的正则表达式支持等等。`Concept` 提供了对模板参数编译期的检查，进一步增强了语言整体的可用性。

## 目标读者

1. 本书假定读者已经熟悉了传统 C++ ，至少在阅读传统 C++ 代码上不具备任何困难。换句话说，那些长期使用传统 C++ 进行编码的人、`渴望在短时间内迅速了解现代 C++ 特性的人`非常适合阅读本书。

2. 本书一定程度上介绍了一些现代 C++ 的黑魔法，但这些魔法毕竟有限，`不适合希望进阶学习现代 C++ 的读者`，本书的定位系`现代 C++ 的快速上手`。当然，希望进阶学习的读者可以使用本书来回顾并检验自己对 现代 C++ 的熟悉度。

## 本书目的

本书号称`高速上手`，从内容上对二十一世纪二十年代之前产生 C++ 的相关特性做了`非常相对全面`的介绍，读者可以自行根据下面的目录选取感兴趣的内容进行学习，快速熟悉需要了解的内容。`这些特性并不需要全部掌握`，只需针对自己的使用需求和特定的应用场景，`学习、查阅最适合自己的新特性即可`。

## 相关代码

你可以在[这里](https://changkun.de/modern-cpp/code)中找到书中介绍过的全部的源码，所有代码按章节组织，文件夹名称为章节序号。

## 随书习题

你可以在[这里](https://changkun.de/modern-cpp/exercises)找到习题的答案，文件夹名称为章节序号。

# 第 1 章 迈向现代 C++ 

`编译环境`：本书将使用 `clang++` 作为唯一使用的编译器，同时总是在代码中使用 `-std=c++2a` 编译标志。

本笔记的环境平台是 `MSYS2`。关于 `MSYS2` 的安装及使用可以参考：{% post_link GCC-on-Windows-windows10 %} 、{% post_link MSYS2-教程-windows10 %} 和 {% post_link CMake-Examples-学习笔记-windows10 %}。

`clang++` 的安装。

```shell
pacman -S --needed base-devel mingw-w64-clang-x86_64-toolchain
```

安装完成后，运行开始菜单的 “MSYS2 MinGW Clang x64”。现在就可以使用 “make” 和 “clang++” 为 Windows 构建软件了。

```shell
lyf@DESKTOP-GV2QHKN CLANG64 ~
$ which make
/usr/bin/make

lyf@DESKTOP-GV2QHKN CLANG64 ~
$ make -v
GNU Make 4.3
为 x86_64-pc-msys 编译
Copyright (C) 1988-2020 Free Software Foundation, Inc.
许可证：GPLv3+：GNU 通用公共许可证第 3 版或更新版本<http://gnu.org/licenses/gpl.html>。
本软件是自由软件：您可以自由修改和重新发布它。
在法律允许的范围内没有其他保证。

lyf@DESKTOP-GV2QHKN CLANG64 ~
$ which clang++
/clang64/bin/clang++

lyf@DESKTOP-GV2QHKN CLANG64 ~
$ clang++ -v
clang version 14.0.4
Target: x86_64-w64-windows-gnu
Thread model: posix
InstalledDir: D:/lyf_computer_language/msys64/clang64/bin

lyf@DESKTOP-GV2QHKN CLANG64 ~
$ which gcc
/clang64/bin/gcc

lyf@DESKTOP-GV2QHKN CLANG64 ~
$ gcc -v
clang version 14.0.4
Target: x86_64-w64-windows-gnu
Thread model: posix
InstalledDir: D:/lyf_computer_language/msys64/clang64/bin

lyf@DESKTOP-GV2QHKN CLANG64 ~
$
```

## 被弃用的特性

从 `C++11` 开始，被弃用的主要特性：

>注意：弃用并非彻底不能用，只是用于`暗示`程序员这些特性将从未来的标准中消失，应该`尽量避免使用`。但是，`已弃用的特性依然是标准库的一部分`，并且出于兼容性的考虑，大部分特性其实会`永久`保留。

- 不再允许`字符串字面值常量`赋值给一个 `char *`。如果需要用`字符串字面值常量`赋值和初始化一个 `char *`，应该使用 `const char *` 或者 `auto`。

```c++
char *str = "hello world!"; // 将出现弃用警告
```

- `C++98 异常说明`、 `unexpected_handler`、`set_unexpected()` 等相关特性被弃用，应该使用 `noexcept`。

- `auto_ptr` 被弃用，应使用 `unique_ptr`。

- `register` 关键字被弃用，可以使用但不再具备任何实际含义。

- `bool` 类型的 `++` 操作被弃用。

- 如果一个类有`析构函数`，为其生成`拷贝构造函数`和`拷贝赋值运算符`的特性被弃用了。

- `C 语言风格`的`类型转换`被弃用（即在变量前使用 `(convert_type)`），应该使用 `static_cast`、`reinterpret_cast`、`const_cast` 来进行`类型转换`。

- 特别地，在最新的 `C++17` 标准中弃用了一些可以使用的 `C 标准库`，例如 `<ccomplex>`、`<cstdalign>`、`<cstdbool>` 与 `<ctgmath>` 等。

还有一些其他诸如参数绑定（`C++11` 提供了 `std::bind` 和 `std::function`）、`export` 等特性也均被弃用。

## 与 C 的兼容性

出于一些不可抗力、历史原因，我们不得不在 `C++` 中使用一些 `C` 语言代码（甚至`古老的 C 语言代码`），例如 `Linux 系统调用`。

{% span cyan, C 和 C++ 互相兼容情况 %}

![](https://cos.luyf-lemon-love.space/images/20220816144219.png)

`C++` 不是 `C` 的一个超集。在编写 `C++` 时，也应该尽可能的避免使用诸如 `void*` 之类的程序风格。而在不得不使用 `C` 时，应该注意使用 `extern "C"` 这种特性，将 `C` 语言的代码与 `C++` 代码进行`分离编译`，再`统一链接`这种做法，例如：

```c++
// foo.h
#ifdef __cplusplus
extern "C" {
#endif

int add(int x, int y);

#ifdef __cplusplus
}
#endif

// foo.c
int add(int x, int y) {
    return x+y;
}

// 1.1.cpp
#include "foo.h"
#include <iostream>
#include <functional>

int main() {
    [out = std::ref(std::cout << "Result from C code: " << add(1, 2))](){
        out.get() << ".\n";
    }();
    return 0;
}
```

应先使用 `gcc` 编译 `C` 语言的代码：

```shell
gcc -c foo.c
```

编译出 `foo.o` 文件，再使用 `clang++` 将 `C++` 代码和 `.o` 文件链接起来（或者都编译为 `.o` 再统一链接）：

```shell
clang++ 1.1.cpp foo.o -std=c++2a -o 1.1
```

当然，你可以使用 `Makefile` 来编译上面的代码：

```makefile
C = gcc
CXX = clang++

SOURCE_C = foo.c
OBJECTS_C = foo.o

SOURCE_CXX = 1.1.cpp

TARGET = 1.1
LDFLAGS_COMMON = -std=c++2a

all:
  $(C) -c $(SOURCE_C)
  $(CXX) $(SOURCE_CXX) $(OBJECTS_C) $(LDFLAGS_COMMON) -o $(TARGET)
clean:
  rm -rf *.o $(TARGET)
```

>注意：`Makefile` 中的缩进是`制表符`而不是`空格符`。

## 进一步阅读的参考文献

1. C++ 语言导学. Bjarne Stroustrup

2. [C++ 历史](https://en.cppreference.com/w/cpp/language/history)

3. [C++ 特性在 GCC/Clang 等编译器中的支持情况](https://en.cppreference.com/w/cpp/compiler_support)

4. [C++98 与 C99 之间的区别](http://david.tribble.com/text/cdiffs.htm#C99-vs-CPP98)

## Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令构建项目目录。

```shell
cd /f/vscode/cpp_projects/
mkdir modern-cpp-tutorial
cd modern-cpp-tutorial/
mkdir code
cd code/
mkdir 1
cd 1
```

2. 创建 `foo.h` 文件，粘贴下面代码。

```c++
// foo.h
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#ifdef __cplusplus
extern "C" {
#endif

int add(int x, int y);

#ifdef __cplusplus
}
#endif
```

3. 创建 `foo.c` 文件，粘贴下面代码。

```c++
// foo.c
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include "foo.h"

int add(int x, int y) {
        return x+y;
}
```

4. 创建 `1.1.c.and.cpp` 文件，粘贴下面代码。

```c++
// 1.1.c.and.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include "foo.h"
#include <iostream>
#include <functional>

int main() {

        // use lambda expression
        [out = std::ref(std::cout << "Result from C code: " << add(1,2))](){
                out.get() << ".\n";
        }();

        return 0;
}
```

5. 创建 `Makefile` 文件，粘贴下面代码。

```makefile
# Makefile
# created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

C = gcc
CXX = clang++

SOURCE_C = foo.c
OBJECTS_C = foo.o

SOURCE_CXX = 1.1.c.and.cpp

TARGET = 1.1.out
LDFLAGS_COMMON = -std=c++2a

add:
        $(C) -c $(SOURCE_C)
        $(CXX) $(SOURCE_CXX) $(OBJECTS_C) $(LDFLAGS_COMMON) -o $(TARGET)

clean:
        rm -rf *.o $(TARGET)
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/1
$ tree
.
├── 1.1.c.and.cpp
├── foo.c
├── foo.h
└── Makefile

0 directories, 4 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/1
$ ls
1.1.c.and.cpp  foo.c  foo.h  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/1
$ make
gcc -c foo.c
clang++ 1.1.c.and.cpp foo.o -std=c++2a -o 1.1.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/1
$ ls
1.1.c.and.cpp  1.1.out  foo.c  foo.h  foo.o  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/1
$ ./1.1.out
Result from C code: 3.

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/1
$ make clean
rm -rf *.o 1.1.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/1
$ ls
1.1.c.and.cpp  foo.c  foo.h  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/1
$
```

# 第 2 章 语言可用性的强化

当我们声明、定义一个变量或者常量，对代码进行流程控制、面向对象的功能、模板编程等这些都是运行时之前，可能发生在编写代码或编译器编译代码时的行为。为此，我们通常谈及`语言可用性`，是指那些发生在运行时之前的语言行为。

## 常量

### nullptr

`nullptr` 出现的目的是为了替代 `NULL`。在某种意义上来说，`传统 C++` 会把 `NULL`、`0` 视为同一种东西，即直接将 `NULL` 定义为 `0`（C++ 不允许直接将 `void *` 隐式转换到其他类型）。

将 `NULL` 定义成 `0` 将导致 `C++` 中重载特性发生混乱。考虑下面这两个 `foo` 函数：

```c++
void foo(char*);
void foo(int);
```

那么 `foo(NULL);` 这个语句将会去调用 `foo(int)`，从而导致代码违反直觉。

为了解决这个问题，`C++11` 引入了 `nullptr` 关键字，专门用来区分`空指针`、`0`。而 `nullptr` 的类型为 `nullptr_t`，能够`隐式的转换`为`任何指针`或`成员指针`的类型，也能和它们进行`相等`或者`不等`的比较。

你可以尝试使用 `clang++` 编译下面的代码：

```c++
#include <iostream>
#include <type_traits>

void foo(char *);
void foo(int);

int main() {
    if (std::is_same<decltype(NULL), decltype(0)>::value)
        std::cout << "NULL == 0" << std::endl;
    if (std::is_same<decltype(NULL), decltype((void*)0)>::value)
        std::cout << "NULL == (void *)0" << std::endl;
    if (std::is_same<decltype(NULL), std::nullptr_t>::value)
        std::cout << "NULL == nullptr" << std::endl;

    foo(0);          // 调用 foo(int)
    // foo(NULL);    // 该行不能通过编译
    foo(nullptr);    // 调用 foo(char*)
    return 0;
}

void foo(char *) {
    std::cout << "foo(char*) is called" << std::endl;
}
void foo(int i) {
    std::cout << "foo(int) is called" << std::endl;
}
```

{% label 将输出 pink %}

```shell
foo(int) is called
foo(char*) is called
```

从输出中我们可以看出，`NULL` 不同于 `0` 与 `nullptr`。所以，请养成直接使用 `nullptr` 的习惯。

简单来说，`decltype` 用于`类型推导`，而 `std::is_same` 用于比较两个类型是否相同。

#### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令构建项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/
mkdir 2
cd 2/
```

2. 创建 `2.01.nullptr.cpp` 文件，粘贴下面代码。

```c++
// 2.01.nullptr.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>
#include <type_traits>

void foo(char *);
void foo(int);

int main() {
        if (std::is_same<decltype(NULL), decltype(0)>::value)
                std::cout << "NULL == 0" << std::endl;
        if (std::is_same<decltype(NULL), decltype((void*)0)>::value)
                std::cout << "NULL == (void *)0" << std::endl;
        if (std::is_same<decltype(NULL), std::nullptr_t>::value)
                std::cout << "NULL == nullptr" << std::endl;

        foo(0);                 // will call foo(int)
        foo(NULL);              // will call foo(int)
        foo(nullptr);           // will call foo(char*)

        return 0;
}

void foo(char *) {
        std::cout << "foo(char*) is called" << std::endl;
}

void foo(int i) {
        std::cout << "foo(int) is called" << std::endl;
}
```

3. 创建 `Makefile` 文件，粘贴下面代码。

```makefile
# Makefile
# created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

all: $(patsubst %.cpp, %.out, $(wildcard *.cpp))

%.out: %.cpp Makefile
        clang++ $< -o $@ -std=c++2a -pedantic

clean:
        rm *.out
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ tree
.
├── 2.01.nullptr.cpp
└── Makefile

0 directories, 2 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make
clang++ 2.01.nullptr.cpp -o 2.01.nullptr.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp  2.01.nullptr.out  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ./2.01.nullptr.out
NULL == 0
foo(int) is called
foo(int) is called
foo(char*) is called

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$
```

### constexpr

`C++` 本身已经具备了`常量表达式`的概念，比如 `1+2`, `3*4` 这种表达式总是会产生相同的结果并且没有任何副作用。如果`编译器`能够在编译时就把这些表达式直接优化并植入到程序运行时，将能增加程序的性能。一个非常明显的例子就是在数组的定义阶段：

```c++
#include <iostream>
#define LEN 10

int len_foo() {
    int i = 2;
    return i;
}
constexpr int len_foo_constexpr() {
    return 5;
}

constexpr int fibonacci(const int n) {
    return n == 1 || n == 2 ? 1 : fibonacci(n-1)+fibonacci(n-2);
}

int main() {
    char arr_1[10];                      // 合法
    char arr_2[LEN];                     // 合法

    int len = 10;
    // char arr_3[len];                  // 非法

    const int len_2 = len + 1;
    constexpr int len_2_constexpr = 1 + 2 + 3;
    // char arr_4[len_2];                // 非法
    char arr_4[len_2_constexpr];         // 合法

    // char arr_5[len_foo()+5];          // 非法
    char arr_6[len_foo_constexpr() + 1]; // 合法

    // 1, 1, 2, 3, 5, 8, 13, 21, 34, 55
    std::cout << fibonacci(10) << std::endl;
    return 0;
}
```

上面的例子中，`char arr_4[len_2]` 可能比较令人困惑，因为 `len_2` 已经被定义为了`常量`。为什么 `char arr_4[len_2]` 仍然是`非法`的呢？这是因为 `C++` 标准中`数组的长度`必须是`一个常量表达式`，而对于 `len_2` 而言，这是一个 `const` 常数，而不是`一个常量表达式`，因此（即便这种行为在大部分编译器中都支持，但是）它是`一个非法的行为`，`我们需要使用接下来即将介绍的 C++11 引入的 constexpr 特性来解决这个问题；`而对于 `arr_5` 来说，`C++98` 之前的编译器无法得知 `len_foo()` 在运行期实际上是`返回一个常数`，这也就导致了`非法的产生`。

>注意，现在大部分编译器其实都带有`自身编译优化`，很多非法行为在编译器优化的加持下会`变得合法`，若需重现编译报错的现象需要使用老版本的编译器。

`C++11` 提供了 `constexpr` 让用户`显式的声明`函数或对象构造函数在编译期会成为`常量表达式`，这个关键字明确的告诉编译器应该去验证 `len_foo` 在编译期就应该是`一个常量表达式`。

此外，`constexpr` 修饰的函数可以使用递归：

```c++
constexpr int fibonacci(const int n) {
    return n == 1 || n == 2 ? 1 : fibonacci(n-1)+fibonacci(n-2);
}
```

从 `C++14` 开始，`constexpr` 函数可以在内部使用`局部变量`、`循环`和`分支`等简单语句，例如下面的代码在 `C++11` 的标准下是不能够通过编译的：

```c++
constexpr int fibonacci(const int n) {
    if(n == 1) return 1;
    if(n == 2) return 1;
    return fibonacci(n-1) + fibonacci(n-2);
}
```

为此，我们可以写出下面这类简化的版本来使得函数从 `C++11` 开始即`可用`：

```c++
constexpr int fibonacci(const int n) {
    return n == 1 || n == 2 ? 1 : fibonacci(n-1) + fibonacci(n-2);
}
```

#### Files

# 结语

第二十三篇博文写完，开心！！！！

今天，也是充满希望的一天。