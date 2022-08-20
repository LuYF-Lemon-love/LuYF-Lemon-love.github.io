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

## 前言

[现代 C++ 教程：高速上手 C++ 11/14/17/20（第二版）](https://changkun.de/modern-cpp/) 是欧长坤 (hi[at]changkun.de) 用中文写的。

本人的笔记对应的书籍最后更新时间为 2022 年 7 月 17 日。

本书的官网为 https://changkun.de/modern-cpp/ 。可以在线阅读或者下载 PDF 版本。

本书 GitHub 的地址为 https://github.com/changkun/modern-cpp-tutorial 。

本书 code 的地址为 https://github.com/changkun/modern-cpp-tutorial/tree/master/code 。

本书 exercises 的地址为 https://github.com/changkun/modern-cpp-tutorial/tree/master/exercises 。

操作系统：**Windows 10 专业版**

## 参考文档

1. [现代 C++ 教程：高速上手 C++ 11/14/17/20（第二版）](https://changkun.de/modern-cpp/)

2. [C++ 初始化列表展开,这个代码是什么意思？](https://www.zhihu.com/question/443285720/answer/1723184923)

## 序言

### 引言

>C++ 是一个用户群体相当大的语言。从 C++98 的出现到 C++11 的正式定稿经历了长达十年多之久的积累。C++14/17 则是作为对 C++11 的重要补充和优化，C++20 则将这门语言领进了现代化的大门，所有这些新标准中扩充的特性，给 C++ 这门语言注入了新的活力。本书把 C++98 及其之前的 C++ 特性均称之为传统 C++。 

现代 C++ (本书中均指 C++11/14/17/20) 为传统 C++ 注入的大量特性使得整个 C++ 变得更加像一门现代化的语言。

>现代 C++ 不仅仅增强了 C++ 语言自身的可用性，`auto` 关键字语义的修改使得我们更加有信心来操控极度复杂的模板类型。同时还对语言运行期进行了大量的强化，`Lambda` 表达式的出现让 C++ 具有了`匿名函数`的`闭包`特性，而这一特性几乎在现代的编程语言（诸如 Python/Swift/... ）中已经司空见惯，`右值引用`的出现解决了 C++ 长期以来被人诟病的`临时对象效率问题`等等。
>
>`C++17` 包含了大量小而美的语言与特性（例如结构化绑定），这些特性的出现再一次修正了我们在 C++ 中的编程范式。
>
>现代 C++ 还为自身的`标准库`增加了非常多的工具和方法，诸如在语言自身标准的层面上制定了 `std::thread`，从而`支持了并发编程`，在不同平台上不再依赖于系统底层的 API，实现了语言层面的跨平台支持；`std::regex` 提供了完整的正则表达式支持等等。`Concept` 提供了对模板参数编译期的检查，进一步增强了语言整体的可用性。

### 目标读者

1. 本书假定读者已经熟悉了传统 C++ ，至少在阅读传统 C++ 代码上不具备任何困难。换句话说，那些长期使用传统 C++ 进行编码的人、`渴望在短时间内迅速了解现代 C++ 特性的人`非常适合阅读本书。

2. 本书一定程度上介绍了一些现代 C++ 的黑魔法，但这些魔法毕竟有限，`不适合希望进阶学习现代 C++ 的读者`，本书的定位系`现代 C++ 的快速上手`。当然，希望进阶学习的读者可以使用本书来回顾并检验自己对 现代 C++ 的熟悉度。

### 本书目的

本书号称`高速上手`，从内容上对二十一世纪二十年代之前产生 C++ 的相关特性做了`非常相对全面`的介绍，读者可以自行根据下面的目录选取感兴趣的内容进行学习，快速熟悉需要了解的内容。`这些特性并不需要全部掌握`，只需针对自己的使用需求和特定的应用场景，`学习、查阅最适合自己的新特性即可`。

### 相关代码

你可以在[这里](https://changkun.de/modern-cpp/code)中找到书中介绍过的全部的源码，所有代码按章节组织，文件夹名称为章节序号。

### 随书习题

你可以在[这里](https://changkun.de/modern-cpp/exercises)找到习题的答案，文件夹名称为章节序号。

## 第 1 章 迈向现代 C++ 

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

### 被弃用的特性

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

### 与 C 的兼容性

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

### 进一步阅读的参考文献

1. C++ 语言导学. Bjarne Stroustrup

2. [C++ 历史](https://en.cppreference.com/w/cpp/language/history)

3. [C++ 特性在 GCC/Clang 等编译器中的支持情况](https://en.cppreference.com/w/cpp/compiler_support)

4. [C++98 与 C99 之间的区别](http://david.tribble.com/text/cdiffs.htm#C99-vs-CPP98)

### Files

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

## 第 2 章 语言可用性的强化

当我们声明、定义一个变量或者常量，对代码进行流程控制、面向对象的功能、模板编程等这些都是运行时之前，可能发生在编写代码或编译器编译代码时的行为。为此，我们通常谈及`语言可用性`，是指那些发生在运行时之前的语言行为。

### 常量

#### nullptr

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

##### Files

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

#### constexpr

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

##### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/2/
```

2. 创建 `2.02.constexpr.cpp` 文件，粘贴下面代码。

```c++
// 2.02.constexpr.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

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
        return n == 1 || n == 2 ? 1 : fibonacci(n-1) + fibonacci(n-2);
}

int main() {

        char arr_1[10];                                 // legal
        char arr_2[LEN];                                // legal

        int len = 10;
        // char arr_3[len];                             // illegal

        const int len_2 = len + 1;
        constexpr int len_2_constexpr = 1 + 2 + 3;
        // char arr_4[len_2];                           // illegal, but ok for most of the compilers
        char arr_4[len_2_constexpr];                    // legal

        // char arr_5[len_foo()+5];                     // illegal
        char arr_6[len_foo_constexpr() + 1];            // legal

        // 1, 1, 2, 3, 5, 8, 13, 21, 34, 55
        std::cout << fibonacci(10) << std::endl;

        return 0;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ tree
.
├── 2.01.nullptr.cpp
├── 2.02.constexpr.cpp
└── Makefile

0 directories, 3 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp  2.02.constexpr.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make
clang++ 2.01.nullptr.cpp -o 2.01.nullptr.out -std=c++2a -pedantic
clang++ 2.02.constexpr.cpp -o 2.02.constexpr.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp  2.02.constexpr.cpp  Makefile
2.01.nullptr.out  2.02.constexpr.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ./2.02.constexpr.out
55

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp  2.02.constexpr.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$
```

### 变量及其初始化

#### if/switch 变量声明强化

在传统 `C++` 中，`变量的声明虽然能够位于任何位置`，甚至于 `for` 语句内能够声明一个临时变量 `int`，但始终`没有办法`在 `if` 和 `switch` 语句中`声明一个临时的变量`。例如：

```c++
#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    std::vector<int> vec = {1, 2, 3, 4};

    // 在 c++17 之前
    const std::vector<int>::iterator itr = std::find(vec.begin(), vec.end(), 2);
    if (itr != vec.end()) {
        *itr = 3;
    }

    // 需要重新定义一个新的变量
    const std::vector<int>::iterator itr2 = std::find(vec.begin(), vec.end(), 3);
    if (itr2 != vec.end()) {
        *itr2 = 4;
    }

    // 将输出 1, 4, 3, 4
    for (std::vector<int>::iterator element = vec.begin(); element != vec.end(); 
        ++element)
        std::cout << *element << std::endl;
}
```

在上面的代码中，我们可以看到 `itr` 这一变量是定义在整个 `main()` 的作用域内的，这导致当我们需要再次遍历整个 `std::vectors` 时，需要重新命名另一个变量。`C++17` 消除了这一限制，使得我们可以在 `if`（或 `switch`）中完成这一操作：

```c++
// 将临时变量放到 if 语句内
if (const std::vector<int>::iterator itr = std::find(vec.begin(), vec.end(), 3);
    itr != vec.end()) {
    *itr = 4;
}
```

##### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/2/
```

2. 创建 `2.03.if.switch.cpp` 文件，粘贴下面代码。

```c++
// 2.03.if.switch.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>
#include <iostream>
#include <vector>
#include <algorithm>

int main() {

        std::vector<int> vec = {1, 2, 3, 4};

        // after c++17, can be simplefied by using 'auto'
        const std::vector<int>::iterator itr = std::find(vec.begin(), vec.end(), 2);
        if (itr != vec.end()) {
                *itr = 3;
        }

        if (const std::vector<int>::iterator itr = std::find(vec.begin(), vec.end(), 3);
                        itr != vec.end()) {
                *itr = 4;
        }

        // should output: 1, 4, 3, 4. can be simplefied using `auto`
        for (std::vector<int>::iterator element = vec.begin(); element != vec.end(); ++element)
                std::cout << *element << std::endl;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ tree
.
├── 2.01.nullptr.cpp
├── 2.02.constexpr.cpp
├── 2.03.if.switch.cpp
└── Makefile

0 directories, 4 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp    2.03.if.switch.cpp
2.02.constexpr.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make
clang++ 2.01.nullptr.cpp -o 2.01.nullptr.out -std=c++2a -pedantic
clang++ 2.02.constexpr.cpp -o 2.02.constexpr.out -std=c++2a -pedantic
clang++ 2.03.if.switch.cpp -o 2.03.if.switch.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp    2.02.constexpr.out  Makefile
2.01.nullptr.out    2.03.if.switch.cpp
2.02.constexpr.cpp  2.03.if.switch.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ./2.03.if.switch.out
1
4
3
4

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp    2.03.if.switch.cpp
2.02.constexpr.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$
```

#### 初始化列表

初始化是一个非常重要的语言特性，最常见的就是在对象进行初始化时进行使用。 在传统 `C++` 中，`不同的对象有着不同的初始化方法`，例如普通数组、 `POD` （Plain Old Data，即`没有构造`、`析构`和`虚函数`的类或结构体） 类型都可以使用 `{}` 进行初始化，也就是我们所说的`初始化列表`。 而对于类对象的初始化，要么需要通过`拷贝构造`、要么就需要使用 `()` 进行。 这些`不同方法都针对各自对象，不能通用`。例如：

```c++
#include <iostream>
#include <vector>

class Foo {
public:
    int value_a;
    int value_b;
    Foo(int a, int b) : value_a(a), value_b(b) {}
};

int main() {
    // before C++11
    int arr[3] = {1, 2, 3};
    Foo foo(1, 2);
    std::vector<int> vec = {1, 2, 3, 4, 5};

    std::cout << "arr[0]: " << arr[0] << std::endl;
    std::cout << "foo:" << foo.value_a << ", " << foo.value_b << std::endl;
    for (std::vector<int>::iterator it = vec.begin(); it != vec.end(); ++it) {
        std::cout << *it << std::endl;
    }
    return 0;
}
```

为解决这个问题，`C++11` 首先把初始化列表的概念绑定到类型上，称其为 `std::initializer_list`，`允许构造函数或其他函数像参数一样使用初始化列表`，这就为`类对象的初始化`与`普通数组`和 `POD` 的初始化方法提供了统一的桥梁，例如：

```c++
#include <initializer_list>
#include <vector>
#include <iostream>

class MagicFoo {
public:
    std::vector<int> vec;
    MagicFoo(std::initializer_list<int> list) {
        for (std::initializer_list<int>::iterator it = list.begin();
             it != list.end(); ++it)
            vec.push_back(*it);
    }
};
int main() {
    // after C++11
    MagicFoo magicFoo = {1, 2, 3, 4, 5};

    std::cout << "magicFoo: ";
    for (std::vector<int>::iterator it = magicFoo.vec.begin(); 
        it != magicFoo.vec.end(); ++it) 
        std::cout << *it << std::endl;
}
```

这种构造函数被叫做`初始化列表构造函数`，具有这种构造函数的类型将在初始化时被特殊关照。

初始化列表除了用在对象构造上，还能将其`作为普通函数的形参`，例如：

```c++
public:
    void foo(std::initializer_list<int> list) {
        for (std::initializer_list<int>::iterator it = list.begin();
            it != list.end(); ++it) vec.push_back(*it);
    }

magicFoo.foo({6,7,8,9});
```

其次，`C++11` 还提供了`统一的语法`来`初始化任意的对象`，例如：

```c++
Foo foo2 {3, 4};
```

##### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/2/
```

2. 创建 `2.04.initializer.list.cpp` 文件，粘贴下面代码。

```c++
// 2.04.initializer.list.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>
#include <initializer_list>
#include <vector>

class Foo {
public:
        int value_a;
        int value_b;
        Foo(int a, int b) : value_a(a), value_b(b) {}
};

class MagicFoo {
public:
        std::vector<int> vec;
        MagicFoo(std::initializer_list<int> list) {
                for (std::initializer_list<int>::iterator it = list.begin(); it != list.end(); ++it) {
                        vec.push_back(*it);
                }
        }

        void foo(std::initializer_list<int> list) {
                for (std::initializer_list<int>::iterator it = list.begin(); it != list.end(); ++it) {
                        vec.push_back(*it);
                }
        }
};

int main() {

        // before C++11
        int arr[3] = {1, 2, 3};
        Foo foo(1, 2);
        std::vector<int> vec = {1, 2, 3, 4, 5};

        // after C++11
        MagicFoo magicFoo = {1, 2, 3, 4, 5};
        magicFoo.foo({6, 7, 8, 9});
        Foo foo2 {3, 4};

        std::cout << "arr[0]: " << arr[0] << std::endl;
        std::cout << "foo: " << foo.value_a << ", " << foo.value_b << std::endl;
        std::cout << "vec: " << std::endl;
        for (std::vector<int>::iterator it = vec.begin(); it != vec.end(); ++it) {
                std::cout << *it << std::endl;
        }
        std::cout << "magicFoo: " << std::endl;
        for (std::vector<int>::iterator it = magicFoo.vec.begin(); it != magicFoo.vec.end(); ++it) {
                std::cout << *it << std::endl;
        }
        std::cout << "foo2: " << foo2.value_a << ", " << foo2.value_b << std::endl;

        return 0;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ tree
.
├── 2.01.nullptr.cpp
├── 2.02.constexpr.cpp
├── 2.03.if.switch.cpp
├── 2.04.initializer.list.cpp
└── Makefile

0 directories, 5 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp    2.03.if.switch.cpp         Makefile
2.02.constexpr.cpp  2.04.initializer.list.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make
clang++ 2.01.nullptr.cpp -o 2.01.nullptr.out -std=c++2a -pedantic
clang++ 2.02.constexpr.cpp -o 2.02.constexpr.out -std=c++2a -pedantic
clang++ 2.03.if.switch.cpp -o 2.03.if.switch.out -std=c++2a -pedantic
clang++ 2.04.initializer.list.cpp -o 2.04.initializer.list.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp    2.03.if.switch.out
2.01.nullptr.out    2.04.initializer.list.cpp
2.02.constexpr.cpp  2.04.initializer.list.out
2.02.constexpr.out  Makefile
2.03.if.switch.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ./2.04.initializer.list.out
arr[0]: 1
foo: 1, 2
vec:
1
2
3
4
5
magicFoo:
1
2
3
4
5
6
7
8
9
foo2: 3, 4

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp    2.03.if.switch.cpp         Makefile
2.02.constexpr.cpp  2.04.initializer.list.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$
```

#### 结构化绑定

`C++17` 给出的`结构化绑定`提供了类似其他语言中提供的`多返回值`的功能。

```c++
#include <iostream>
#include <tuple>

std::tuple<int, double, std::string> f() {
    return std::make_tuple(1, 2.3, "456");
}

int main() {
    auto [x, y, z] = f();
    std::cout << x << ", " << y << ", " << z << std::endl;
    return 0;
}
```

##### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/2/
```

2. 创建 `2.05.structured.binding.cpp` 文件，粘贴下面代码。

```c++
// 2.05.structured.binding.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>
#include <tuple>
#include <string>

std::tuple<int, double, std::string> f() {
        return std::make_tuple(1, 2.3, "456");
}

int main() {
        auto [x, y, z] = f();
        std::cout << x << ", " << y << ", " << z << std::endl;

        return 0;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ tree
.
├── 2.01.nullptr.cpp
├── 2.02.constexpr.cpp
├── 2.03.if.switch.cpp
├── 2.04.initializer.list.cpp
├── 2.05.structured.binding.cpp
└── Makefile

0 directories, 6 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp    2.04.initializer.list.cpp
2.02.constexpr.cpp  2.05.structured.binding.cpp
2.03.if.switch.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make
clang++ 2.01.nullptr.cpp -o 2.01.nullptr.out -std=c++2a -pedantic
clang++ 2.02.constexpr.cpp -o 2.02.constexpr.out -std=c++2a -pedantic
clang++ 2.03.if.switch.cpp -o 2.03.if.switch.out -std=c++2a -pedantic
clang++ 2.04.initializer.list.cpp -o 2.04.initializer.list.out -std=c++2a -pedantic
clang++ 2.05.structured.binding.cpp -o 2.05.structured.binding.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp    2.04.initializer.list.cpp
2.01.nullptr.out    2.04.initializer.list.out
2.02.constexpr.cpp  2.05.structured.binding.cpp
2.02.constexpr.out  2.05.structured.binding.out
2.03.if.switch.cpp  Makefile
2.03.if.switch.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ./2.05.structured.binding.out
1, 2.3, 456

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp    2.04.initializer.list.cpp
2.02.constexpr.cpp  2.05.structured.binding.cpp
2.03.if.switch.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$
```

### 类型推导

`C++11` 引入了 `auto` 和 `decltype` 这两个关键字实现了`类型推导`，让编译器来操心变量的类型。

#### auto

使用 `auto` 进行`类型推导`的一个最为常见而且显著的例子就是`迭代器`。你应该在前面的小节里看到了`传统 C++` 中`冗长的迭代写法`：

```c++
// 在 C++11 之前
// 由于 cbegin() 将返回 vector<int>::const_iterator
// 所以 itr 也应该是 vector<int>::const_iterator 类型
for(vector<int>::const_iterator it = vec.cbegin(); itr != vec.cend(); ++it)
```

而有了 `auto` 之后可以：

```c++
#include <initializer_list>
#include <vector>
#include <iostream>

class MagicFoo {
public:
    std::vector<int> vec;
    MagicFoo(std::initializer_list<int> list) {
        // 从 C++11 起, 使用 auto 关键字进行类型推导
        for (auto it = list.begin(); it != list.end(); ++it) {
            vec.push_back(*it);
        }
    }
};
int main() {
    MagicFoo magicFoo = {1, 2, 3, 4, 5};
    std::cout << "magicFoo: ";
    for (auto it = magicFoo.vec.begin(); it != magicFoo.vec.end(); ++it) {
        std::cout << *it << ", ";
    }
    std::cout << std::endl;
    return 0;
}
```

一些其他的常见用法：

```c++
auto i = 5;              // i 被推导为 int
auto arr = new auto(10); // arr 被推导为 int *
```

从 `C++ 20` 起，`auto` 甚至能用于`函数传参`，考虑下面的例子：

```c++
int add(auto x, auto y) {
    return x+y;
}

auto i = 5; // 被推导为 int
auto j = 6; // 被推导为 int
std::cout << add(i, j) << std::endl;
```

>**注意：**`auto` **还不能用于推导数组类型：**
>
>```c++
auto auto_arr2[10] = {arr}; // 错误, 无法推导数组元素类型
>
2.6.auto.cpp:30:19: error: 'auto_arr2' declared as array of 'auto'
>    auto auto_arr2[10] = {arr};
>```

##### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/2/
```

2. 创建 `2.06.auto.cpp` 文件，粘贴下面代码。

```c++
// 2.06.auto.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <initializer_list>
#include <vector>
#include <iostream>

class MagicFoo {
public:
        std::vector<int> vec;
        MagicFoo(std::initializer_list<int> list) {
                for (auto it = list.begin(); it != list.end(); ++it) {
                        vec.push_back(*it);
                }
        }
};

int add(auto x, auto y) { // Supported in C++20
        return x+y;
}

int main() {

        MagicFoo magicFoo = {1, 2, 3, 4, 5};
        std::cout << "magicFoo: ";
        for (auto it = magicFoo.vec.begin(); it != magicFoo.vec.end(); ++it) {
                std::cout << *it << ", ";
        }
        std::cout << std::endl;

        auto i = 5;                     // type int
        auto j = 6;                     // type int
        std::cout << add(i, j) << std::endl;

        auto arr = new auto(10);        // type int*
        // auto auto_arr2[10] = {arr};  // invalid

        return 0;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ tree
.
├── 2.01.nullptr.cpp
├── 2.02.constexpr.cpp
├── 2.03.if.switch.cpp
├── 2.04.initializer.list.cpp
├── 2.05.structured.binding.cpp
├── 2.06.auto.cpp
└── Makefile

0 directories, 7 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp    2.04.initializer.list.cpp    Makefile
2.02.constexpr.cpp  2.05.structured.binding.cpp
2.03.if.switch.cpp  2.06.auto.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make
clang++ 2.01.nullptr.cpp -o 2.01.nullptr.out -std=c++2a -pedantic
clang++ 2.02.constexpr.cpp -o 2.02.constexpr.out -std=c++2a -pedantic
clang++ 2.03.if.switch.cpp -o 2.03.if.switch.out -std=c++2a -pedantic
clang++ 2.04.initializer.list.cpp -o 2.04.initializer.list.out -std=c++2a -pedantic
clang++ 2.05.structured.binding.cpp -o 2.05.structured.binding.out -std=c++2a -pedantic
clang++ 2.06.auto.cpp -o 2.06.auto.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp    2.03.if.switch.out           2.06.auto.cpp
2.01.nullptr.out    2.04.initializer.list.cpp    2.06.auto.out
2.02.constexpr.cpp  2.04.initializer.list.out    Makefile
2.02.constexpr.out  2.05.structured.binding.cpp
2.03.if.switch.cpp  2.05.structured.binding.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ./2.06.auto.out
magicFoo: 1, 2, 3, 4, 5,
11

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp    2.04.initializer.list.cpp    Makefile
2.02.constexpr.cpp  2.05.structured.binding.cpp
2.03.if.switch.cpp  2.06.auto.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$
```

#### decltype

`decltype` 关键字是为了解决 `auto` 关键字只能对`变量`进行`类型推导`的缺陷而出现的。它的用法和 `typeof` 很相似：

```c++
decltype(表达式)
```

有时候，我们可能需要计算某个表达式的类型，例如：

```c++
auto x = 1;
auto y = 2;
decltype(x+y) z;
```

你已经在前面的例子中看到 `decltype` 用于推断类型的用法，下面这个例子就是判断上面的变量 `x`, `y`, `z` 是否是同一类型：

```c++
if (std::is_same<decltype(x), int>::value)
    std::cout << "type x == int" << std::endl;
if (std::is_same<decltype(x), float>::value)
    std::cout << "type x == float" << std::endl;
if (std::is_same<decltype(x), decltype(z)>::value)
    std::cout << "type z == type x" << std::endl;
```

其中，`std::is_same<T, U>` 用于判断 `T` 和 `U` 这两个类型是否相等。输出结果为：

```shell
type x == int
type z == type x
```

##### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/2/
```

2. 创建 `2.07.decltype.cpp` 文件，粘贴下面代码。

```c++
// 2.07.decltype.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>
#include <type_traits>

int main() {

        auto x = 1;
        auto y = 2;
        decltype(x+y) z = 3;
        if (std::is_same<decltype(x), int>::value)
                std::cout << "type x == int" << std::endl;
        if (std::is_same<decltype(x), float>::value)
                std::cout << "type z == float" << std::endl;
        if (std::is_same<decltype(x), decltype(z)>::value)
                std::cout << "type z == type x" << std::endl;

        return 0;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ tree
.
├── 2.01.nullptr.cpp
├── 2.02.constexpr.cpp
├── 2.03.if.switch.cpp
├── 2.04.initializer.list.cpp
├── 2.05.structured.binding.cpp
├── 2.06.auto.cpp
├── 2.07.decltype.cpp
└── Makefile

0 directories, 8 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp    2.04.initializer.list.cpp    2.07.decltype.cpp
2.02.constexpr.cpp  2.05.structured.binding.cpp  Makefile
2.03.if.switch.cpp  2.06.auto.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make
clang++ 2.01.nullptr.cpp -o 2.01.nullptr.out -std=c++2a -pedantic
clang++ 2.02.constexpr.cpp -o 2.02.constexpr.out -std=c++2a -pedantic
clang++ 2.03.if.switch.cpp -o 2.03.if.switch.out -std=c++2a -pedantic
clang++ 2.04.initializer.list.cpp -o 2.04.initializer.list.out -std=c++2a -pedantic
clang++ 2.05.structured.binding.cpp -o 2.05.structured.binding.out -std=c++2a -pedantic
clang++ 2.06.auto.cpp -o 2.06.auto.out -std=c++2a -pedantic
clang++ 2.07.decltype.cpp -o 2.07.decltype.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp    2.03.if.switch.out           2.06.auto.cpp
2.01.nullptr.out    2.04.initializer.list.cpp    2.06.auto.out
2.02.constexpr.cpp  2.04.initializer.list.out    2.07.decltype.cpp
2.02.constexpr.out  2.05.structured.binding.cpp  2.07.decltype.out
2.03.if.switch.cpp  2.05.structured.binding.out  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ./2.07.decltype.out
type x == int
type z == type x

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp    2.04.initializer.list.cpp    2.07.decltype.cpp
2.02.constexpr.cpp  2.05.structured.binding.cpp  Makefile
2.03.if.switch.cpp  2.06.auto.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$
```

#### 尾返回类型推导

>注意：`typename` 和 `class` 在`模板参数列表`中没有区别，在 `typename` 这个关键字出现之前，都是使用 `class` 来定义`模板参数`的。但在模板中定义有`嵌套依赖类型`的变量时，需要用 `typename` 消除歧义。

`C++11` 引入了一个叫做`尾返回类型`（trailing return type），利用 `auto` 关键字将返回类型后置，进而`推导函数的返回类型`：

```c++
template<typename T, typename U>
auto add2(T x, U y) -> decltype(x+y){
    return x + y;
}
```

令人欣慰的是从 `C++14` 开始是可以直接让`普通函数`具备返回值推导，因此下面的写法变得合法：

```c++
template<typename T, typename U>
auto add3(T x, U y){
    return x + y;
}
```

可以检查一下类型推导是否正确：

```c++
// after c++11
auto w = add2<int, double>(1, 2.0);
if (std::is_same<decltype(w), double>::value) {
    std::cout << "w is double: ";
}
std::cout << w << std::endl;

// after c++14
auto q = add3<double, int>(1.0, 2);
std::cout << "q: " << q << std::endl;
```

##### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/2/
```

2. 创建 `2.08.tail.return.type.cpp` 文件，粘贴下面代码。

```c++
// 2.08.tail.return.type.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>
#include <type_traits>

// before c++11
template<typename R, typename T, typename U>
R add(T x, U y) {
        return x + y;
}

// after c++11
template<typename T, typename U>
auto add2(T x, U y) -> decltype(x+y) {
        return x + y;
}

// after c++14
template<typename T, typename U>
auto add3(T x, U y) {
        return x + y;
}

int main() {

        // before c++11
        int z = add<int, int, int>(1, 2);
        std::cout << z << std::endl;

        // after c++11
        auto w = add2<int, double>(1, 2.0);
        if (std::is_same<decltype(w), double>::value) {
                std::cout << "w is double: ";
        }
        std::cout << w << std::endl;

        // after c++14
        auto q = add3<double, int>(1.0, 2);
        std::cout << "q: " << q << std::endl;

        return 0;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ tree
.
├── 2.01.nullptr.cpp
├── 2.02.constexpr.cpp
├── 2.03.if.switch.cpp
├── 2.04.initializer.list.cpp
├── 2.05.structured.binding.cpp
├── 2.06.auto.cpp
├── 2.07.decltype.cpp
├── 2.08.tail.return.type.cpp
└── Makefile

0 directories, 9 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.06.auto.cpp
2.02.constexpr.cpp           2.07.decltype.cpp
2.03.if.switch.cpp           2.08.tail.return.type.cpp
2.04.initializer.list.cpp    Makefile
2.05.structured.binding.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make
clang++ 2.01.nullptr.cpp -o 2.01.nullptr.out -std=c++2a -pedantic
clang++ 2.02.constexpr.cpp -o 2.02.constexpr.out -std=c++2a -pedantic
clang++ 2.03.if.switch.cpp -o 2.03.if.switch.out -std=c++2a -pedantic
clang++ 2.04.initializer.list.cpp -o 2.04.initializer.list.out -std=c++2a -pedantic
clang++ 2.05.structured.binding.cpp -o 2.05.structured.binding.out -std=c++2a -pedantic
clang++ 2.06.auto.cpp -o 2.06.auto.out -std=c++2a -pedantic
clang++ 2.07.decltype.cpp -o 2.07.decltype.out -std=c++2a -pedantic
clang++ 2.08.tail.return.type.cpp -o 2.08.tail.return.type.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.05.structured.binding.out
2.01.nullptr.out             2.06.auto.cpp
2.02.constexpr.cpp           2.06.auto.out
2.02.constexpr.out           2.07.decltype.cpp
2.03.if.switch.cpp           2.07.decltype.out
2.03.if.switch.out           2.08.tail.return.type.cpp
2.04.initializer.list.cpp    2.08.tail.return.type.out
2.04.initializer.list.out    Makefile
2.05.structured.binding.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ./2.08.tail.return.type.out
3
w is double: 3
q: 3

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.06.auto.cpp
2.02.constexpr.cpp           2.07.decltype.cpp
2.03.if.switch.cpp           2.08.tail.return.type.cpp
2.04.initializer.list.cpp    Makefile
2.05.structured.binding.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$
```

#### decltype(auto)

decltype(auto) 是 `C++14` 开始提供的一个略微复杂的用法。

简单来说，`decltype(auto)` 主要用于对`转发函数`或`封装`的`返回类型`进行`推导`，它使我们无需显式的指定 `decltype` 的参数表达式。考虑看下面的例子，当我们需要对下面两个函数进行封装时：

```c++
std::string  lookup1();
std::string& lookup2();
```

在 `C++11` 中，封装实现是如下形式：

```c++
std::string look_up_a_string_1() {
    return lookup1();
}
std::string& look_up_a_string_2() {
    return lookup2();
}
```

而有了 `decltype(auto)`，我们可以让`编译器`完成这一件烦人的`参数转发`：

```c++
decltype(auto) look_up_a_string_1() {
    return lookup1();
}
decltype(auto) look_up_a_string_2() {
    return lookup2();
}
```

### 控制流

#### if constexpr

`C++17` 将 `constexpr` 这个关键字引入到 `if` 语句中，允许在代码中声明`常量表达式`的`判断条件`，考虑下面的代码：

```c++
#include <iostream>

template<typename T>
auto print_type_info(const T& t) {
    if constexpr (std::is_integral<T>::value) {
        return t + 1;
    } else {
        return t + 0.001;
    }
}
int main() {
    std::cout << print_type_info(5) << std::endl;
    std::cout << print_type_info(3.14) << std::endl;
}
```

在编译时，实际代码就会表现为如下：

```c++
int print_type_info(const int& t) {
    return t + 1;
}
double print_type_info(const double& t) {
    return t + 0.001;
}
int main() {
    std::cout << print_type_info(5) << std::endl;
    std::cout << print_type_info(3.14) << std::endl;
}
```

##### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/2/
```

2. 创建 `2.10.if.constexpr.cpp` 文件，粘贴下面代码。

```c++
// 2.10.if.constexpr.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>

template<typename T>
auto print_type_info(const T& t) {
        if constexpr (std::is_integral<T>::value) {
                return t + 1;
        } else {
                return t + 0.001;
        }
}

int main() {

        std::cout << print_type_info(5) << std::endl;
        std::cout << print_type_info(3.14) << std::endl;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ tree
.
├── 2.01.nullptr.cpp
├── 2.02.constexpr.cpp
├── 2.03.if.switch.cpp
├── 2.04.initializer.list.cpp
├── 2.05.structured.binding.cpp
├── 2.06.auto.cpp
├── 2.07.decltype.cpp
├── 2.08.tail.return.type.cpp
├── 2.10.if.constexpr.cpp
└── Makefile

0 directories, 10 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.06.auto.cpp
2.02.constexpr.cpp           2.07.decltype.cpp
2.03.if.switch.cpp           2.08.tail.return.type.cpp
2.04.initializer.list.cpp    2.10.if.constexpr.cpp
2.05.structured.binding.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make
clang++ 2.01.nullptr.cpp -o 2.01.nullptr.out -std=c++2a -pedantic
clang++ 2.02.constexpr.cpp -o 2.02.constexpr.out -std=c++2a -pedantic
clang++ 2.03.if.switch.cpp -o 2.03.if.switch.out -std=c++2a -pedantic
clang++ 2.04.initializer.list.cpp -o 2.04.initializer.list.out -std=c++2a -pedantic
clang++ 2.05.structured.binding.cpp -o 2.05.structured.binding.out -std=c++2a -pedantic
clang++ 2.06.auto.cpp -o 2.06.auto.out -std=c++2a -pedantic
clang++ 2.07.decltype.cpp -o 2.07.decltype.out -std=c++2a -pedantic
clang++ 2.08.tail.return.type.cpp -o 2.08.tail.return.type.out -std=c++2a -pedantic
clang++ 2.10.if.constexpr.cpp -o 2.10.if.constexpr.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.06.auto.cpp
2.01.nullptr.out             2.06.auto.out
2.02.constexpr.cpp           2.07.decltype.cpp
2.02.constexpr.out           2.07.decltype.out
2.03.if.switch.cpp           2.08.tail.return.type.cpp
2.03.if.switch.out           2.08.tail.return.type.out
2.04.initializer.list.cpp    2.10.if.constexpr.cpp
2.04.initializer.list.out    2.10.if.constexpr.out
2.05.structured.binding.cpp  Makefile
2.05.structured.binding.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ./2.10.if.constexpr.out
6
3.141

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.06.auto.cpp
2.02.constexpr.cpp           2.07.decltype.cpp
2.03.if.switch.cpp           2.08.tail.return.type.cpp
2.04.initializer.list.cpp    2.10.if.constexpr.cpp
2.05.structured.binding.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$
```

#### 区间 for 迭代

终于，`C++11` 引入了`基于范围`的迭代写法，我们拥有了能够写出像 `Python` 一样`简洁的循环语句`，我们可以进一步简化前面的例子：

```c++
#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    std::vector<int> vec = {1, 2, 3, 4};
    if (auto itr = std::find(vec.begin(), vec.end(), 3); itr != vec.end()) *itr = 4;
    for (auto element : vec)
        std::cout << element << std::endl; // read only
    for (auto &element : vec) {
        element += 1;                      // writeable
    }
    for (auto element : vec)
        std::cout << element << std::endl; // read only
}
```

##### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/2/
```

2. 创建 `2.11.for.loop.cpp` 文件，粘贴下面代码。

```c++
// 2.11.for.loop.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>
#include <vector>
#include <algorithm>

int main() {

        std::vector<int> vec = {1, 2, 3, 4};
        if (auto itr = std::find(vec.begin(), vec.end(), 3); itr != vec.end()) *itr = 4;
        for (auto element : vec)
                std::cout << element << std::endl;      // read only
        for (auto &element : vec) {
                element += 1;                           // writeable
        }
        for (auto element : vec)
                std::cout << element << std::endl;      // read only
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ tree
.
├── 2.01.nullptr.cpp
├── 2.02.constexpr.cpp
├── 2.03.if.switch.cpp
├── 2.04.initializer.list.cpp
├── 2.05.structured.binding.cpp
├── 2.06.auto.cpp
├── 2.07.decltype.cpp
├── 2.08.tail.return.type.cpp
├── 2.10.if.constexpr.cpp
├── 2.11.for.loop.cpp
└── Makefile

0 directories, 11 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.07.decltype.cpp
2.02.constexpr.cpp           2.08.tail.return.type.cpp
2.03.if.switch.cpp           2.10.if.constexpr.cpp
2.04.initializer.list.cpp    2.11.for.loop.cpp
2.05.structured.binding.cpp  Makefile
2.06.auto.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make
clang++ 2.01.nullptr.cpp -o 2.01.nullptr.out -std=c++2a -pedantic
clang++ 2.02.constexpr.cpp -o 2.02.constexpr.out -std=c++2a -pedantic
clang++ 2.03.if.switch.cpp -o 2.03.if.switch.out -std=c++2a -pedantic
clang++ 2.04.initializer.list.cpp -o 2.04.initializer.list.out -std=c++2a -pedantic
clang++ 2.05.structured.binding.cpp -o 2.05.structured.binding.out -std=c++2a -pedantic
clang++ 2.06.auto.cpp -o 2.06.auto.out -std=c++2a -pedantic
clang++ 2.07.decltype.cpp -o 2.07.decltype.out -std=c++2a -pedantic
clang++ 2.08.tail.return.type.cpp -o 2.08.tail.return.type.out -std=c++2a -pedantic
clang++ 2.10.if.constexpr.cpp -o 2.10.if.constexpr.out -std=c++2a -pedantic
clang++ 2.11.for.loop.cpp -o 2.11.for.loop.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.06.auto.out
2.01.nullptr.out             2.07.decltype.cpp
2.02.constexpr.cpp           2.07.decltype.out
2.02.constexpr.out           2.08.tail.return.type.cpp
2.03.if.switch.cpp           2.08.tail.return.type.out
2.03.if.switch.out           2.10.if.constexpr.cpp
2.04.initializer.list.cpp    2.10.if.constexpr.out
2.04.initializer.list.out    2.11.for.loop.cpp
2.05.structured.binding.cpp  2.11.for.loop.out
2.05.structured.binding.out  Makefile
2.06.auto.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ./2.11.for.loop.out
1
2
4
4
2
3
5
5

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.07.decltype.cpp
2.02.constexpr.cpp           2.08.tail.return.type.cpp
2.03.if.switch.cpp           2.10.if.constexpr.cpp
2.04.initializer.list.cpp    2.11.for.loop.cpp
2.05.structured.binding.cpp  Makefile
2.06.auto.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$
```

### 模板

`C++` 的模板一直是这门语言的一种特殊的艺术，模板甚至可以独立作为一门新的语言来进行使用。`模板的哲学在于将一切能够在编译期处理的问题丢到编译期进行处理，仅在运行时处理那些最核心的动态服务，进而大幅优化运行期的性能。`因此模板也被很多人视作 `C++` 的`黑魔法`之一。

#### 外部模板

传统 `C++` 中，模板只有在使用时才会被编译器实例化。换句话说，`只要在每个编译单元（文件）中编译的代码中遇到了被完整定义的模板，都会实例化。`这就产生了`重复实例化`而导致的编译时间的增加。并且，`我们没有办法通知编译器不要触发模板的实例化`。

为此，`C++11` 引入了`外部模板`，扩充了原来的强制编译器在特定位置实例化模板的语法，使我们`能够显式的通知编译器何时进行模板的实例化`：

```c++
template class std::vector<bool>;          // 强行实例化
extern template class std::vector<double>; // 不在该当前编译文件中实例化模板
```

#### 尖括号 ">"

在`传统 C++ 的编译器`中，`>>` 一律被当做`右移运算符`来进行处理。但实际上我们很容易就写出了`嵌套模板`的代码：

```c++
std::vector<std::vector<int>> matrix;
```

这在`传统 C++ 编译器`下是不能够被编译的，而 `C++11` 开始，`连续的右尖括号将变得合法`，并且能够顺利通过编译。甚至于像下面这种写法都能够通过编译：

```c++
template<bool T>
class MagicType {
    bool magic = T;
};

// in main function:
std::vector<MagicType<(1>2)>> magic; // 合法, 但不建议写出这样的代码
```

##### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/2/
```

2. 创建 `2.12.external.template.cpp` 文件，粘贴下面代码。

```c++
// 2.12.external.template.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>
#include <vector>

template class std::vector<bool>;                       // forcely instantiation
extern template class std::vector<double>;              // external template for avoiding instantiation in this file

template<bool T> class MagicType {
        bool magic = T;
};

int main() {

        // the >> in template
        std::vector<std::vector<int>> matrix;
        std::vector<MagicType<(1>2)>> magic;            // legal, but not recommended
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ tree
.
├── 2.01.nullptr.cpp
├── 2.02.constexpr.cpp
├── 2.03.if.switch.cpp
├── 2.04.initializer.list.cpp
├── 2.05.structured.binding.cpp
├── 2.06.auto.cpp
├── 2.07.decltype.cpp
├── 2.08.tail.return.type.cpp
├── 2.10.if.constexpr.cpp
├── 2.11.for.loop.cpp
├── 2.12.external.template.cpp
└── Makefile

0 directories, 12 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.07.decltype.cpp
2.02.constexpr.cpp           2.08.tail.return.type.cpp
2.03.if.switch.cpp           2.10.if.constexpr.cpp
2.04.initializer.list.cpp    2.11.for.loop.cpp
2.05.structured.binding.cpp  2.12.external.template.cpp
2.06.auto.cpp                Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make
clang++ 2.01.nullptr.cpp -o 2.01.nullptr.out -std=c++2a -pedantic
clang++ 2.02.constexpr.cpp -o 2.02.constexpr.out -std=c++2a -pedantic
clang++ 2.03.if.switch.cpp -o 2.03.if.switch.out -std=c++2a -pedantic
clang++ 2.04.initializer.list.cpp -o 2.04.initializer.list.out -std=c++2a -pedantic
clang++ 2.05.structured.binding.cpp -o 2.05.structured.binding.out -std=c++2a -pedantic
clang++ 2.06.auto.cpp -o 2.06.auto.out -std=c++2a -pedantic
clang++ 2.07.decltype.cpp -o 2.07.decltype.out -std=c++2a -pedantic
clang++ 2.08.tail.return.type.cpp -o 2.08.tail.return.type.out -std=c++2a -pedantic
clang++ 2.10.if.constexpr.cpp -o 2.10.if.constexpr.out -std=c++2a -pedantic
clang++ 2.11.for.loop.cpp -o 2.11.for.loop.out -std=c++2a -pedantic
clang++ 2.12.external.template.cpp -o 2.12.external.template.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.07.decltype.cpp
2.01.nullptr.out             2.07.decltype.out
2.02.constexpr.cpp           2.08.tail.return.type.cpp
2.02.constexpr.out           2.08.tail.return.type.out
2.03.if.switch.cpp           2.10.if.constexpr.cpp
2.03.if.switch.out           2.10.if.constexpr.out
2.04.initializer.list.cpp    2.11.for.loop.cpp
2.04.initializer.list.out    2.11.for.loop.out
2.05.structured.binding.cpp  2.12.external.template.cpp
2.05.structured.binding.out  2.12.external.template.out
2.06.auto.cpp                Makefile
2.06.auto.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.07.decltype.cpp
2.02.constexpr.cpp           2.08.tail.return.type.cpp
2.03.if.switch.cpp           2.10.if.constexpr.cpp
2.04.initializer.list.cpp    2.11.for.loop.cpp
2.05.structured.binding.cpp  2.12.external.template.cpp
2.06.auto.cpp                Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$
```

#### 类型别名模板

在了解`类型别名模板`之前，需要理解`模板`和`类型`之间的不同。仔细体会这句话：`模板是用来产生类型的`。在传统 `C++` 中，`typedef` 可以`为类型定义一个新的名称`，但是`却没有办法为模板定义一个新的名称`。因为，`模板不是类型`。例如：

```c++
template<typename T, typename U>
class MagicType {
public:
    T dark;
    U magic;
};

// 不合法
template<typename T>
typedef MagicType<std::vector<T>, std::string> FakeDarkMagic;
```

`C++11` 使用 `using` 引入了下面这种形式的写法，并且同时支持对传统 `typedef` 相同的功效：

>通常我们使用 `typedef` 定义别名的语法是：`typedef 原名称 新名称;`，但是`对函数指针等别名的定义语法却不相同`，这通常给直接阅读造成了一定程度的困难。

```c++
typedef int (*process)(void *);
using NewProcess = int(*)(void *);
template<typename T>
using TrueDarkMagic = MagicType<std::vector<T>, std::string>;

int main() {
    TrueDarkMagic<bool> you;
}
```

##### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/2/
```

2. 创建 `2.13.alias.template.cpp` 文件，粘贴下面代码。

```c++
// 2.13.alias.template.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>
#include <vector>
#include <string>

template<typename T, typename U>
class MagicType {
public:
        T dark;
        U magic;
};

typedef int (*process)(void *);
using NewProcess = int(*)(void *);
template<typename T>
using TrueDarkMagic = MagicType<std::vector<T>, std::string>;

int main() {
        TrueDarkMagic<bool> you;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ tree
.
├── 2.01.nullptr.cpp
├── 2.02.constexpr.cpp
├── 2.03.if.switch.cpp
├── 2.04.initializer.list.cpp
├── 2.05.structured.binding.cpp
├── 2.06.auto.cpp
├── 2.07.decltype.cpp
├── 2.08.tail.return.type.cpp
├── 2.10.if.constexpr.cpp
├── 2.11.for.loop.cpp
├── 2.12.external.template.cpp
├── 2.13.alias.template.cpp
└── Makefile

0 directories, 13 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.08.tail.return.type.cpp
2.02.constexpr.cpp           2.10.if.constexpr.cpp
2.03.if.switch.cpp           2.11.for.loop.cpp
2.04.initializer.list.cpp    2.12.external.template.cpp
2.05.structured.binding.cpp  2.13.alias.template.cpp
2.06.auto.cpp                Makefile
2.07.decltype.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make
clang++ 2.01.nullptr.cpp -o 2.01.nullptr.out -std=c++2a -pedantic
clang++ 2.02.constexpr.cpp -o 2.02.constexpr.out -std=c++2a -pedantic
clang++ 2.03.if.switch.cpp -o 2.03.if.switch.out -std=c++2a -pedantic
clang++ 2.04.initializer.list.cpp -o 2.04.initializer.list.out -std=c++2a -pedantic
clang++ 2.05.structured.binding.cpp -o 2.05.structured.binding.out -std=c++2a -pedantic
clang++ 2.06.auto.cpp -o 2.06.auto.out -std=c++2a -pedantic
clang++ 2.07.decltype.cpp -o 2.07.decltype.out -std=c++2a -pedantic
clang++ 2.08.tail.return.type.cpp -o 2.08.tail.return.type.out -std=c++2a -pedantic
clang++ 2.10.if.constexpr.cpp -o 2.10.if.constexpr.out -std=c++2a -pedantic
clang++ 2.11.for.loop.cpp -o 2.11.for.loop.out -std=c++2a -pedantic
clang++ 2.12.external.template.cpp -o 2.12.external.template.out -std=c++2a -pedantic
clang++ 2.13.alias.template.cpp -o 2.13.alias.template.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.07.decltype.out
2.01.nullptr.out             2.08.tail.return.type.cpp
2.02.constexpr.cpp           2.08.tail.return.type.out
2.02.constexpr.out           2.10.if.constexpr.cpp
2.03.if.switch.cpp           2.10.if.constexpr.out
2.03.if.switch.out           2.11.for.loop.cpp
2.04.initializer.list.cpp    2.11.for.loop.out
2.04.initializer.list.out    2.12.external.template.cpp
2.05.structured.binding.cpp  2.12.external.template.out
2.05.structured.binding.out  2.13.alias.template.cpp
2.06.auto.cpp                2.13.alias.template.out
2.06.auto.out                Makefile
2.07.decltype.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.08.tail.return.type.cpp
2.02.constexpr.cpp           2.10.if.constexpr.cpp
2.03.if.switch.cpp           2.11.for.loop.cpp
2.04.initializer.list.cpp    2.12.external.template.cpp
2.05.structured.binding.cpp  2.13.alias.template.cpp
2.06.auto.cpp                Makefile
2.07.decltype.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$
```

#### 变长参数模板

模板一直是 `C++` 所独有的`黑魔法`（一起念：Dark Magic）之一。 在 `C++11` 之前，无论是`类模板`还是`函数模板`，都只能按其指定的样子， `接受一组固定数量的模板参数`；而 `C++11` 加入了新的表示方法， `允许任意个数、任意类别的模板参数`，同时`也不需要在定义时将参数的个数固定`。

```c++
template<typename... Ts> class Magic;
```

模板类 `Magic` 的对象，能够接受`不受限制个数`的 `typename` 作为`模板的形式参数`，例如下面的定义：

```c++
class Magic<int,
            std::vector<int>,
            std::map<std::string,
            std::vector<int>>> darkMagic;
```

既然是任意形式，所以个数为 `0` 的模板参数也是可以的：`class Magic<> nothing;`。

如果不希望产生的模板参数个数为 `0`，可以手动的定义`至少一个模板参数`：

```c++
template<typename Require, typename... Args> class Magic;
```

`变长参数模板`也能被直接调整到`模板函数`上。传统 `C` 中的 `printf` 函数，虽然也能达成不定个数的形参的调用，但其`并非类别安全`。而 `C++11` 除了能定义`类别安全`的`变长参数函数`外， 还可以使类似 `printf` 的函数`能自然地处理非自带类别的对象`。 除了在`模板参数`中能使用 `...` 表示`不定长模板参数`外，`函数参数`也使用同样的表示法代表`不定长参数`，这也就为我们简单编写`变长参数函数`提供了便捷的手段，例如：

```c++
template<typename... Args> void printf(const std::string &str, Args... args);
```

那么我们定义了`变长的模板参数`，如何对参数进行解包呢？

首先，我们可以使用 `sizeof...` 来计算参数的个数：

```c++
template<typename... Ts>
void magic(Ts... args) {
    std::cout << sizeof...(args) << std::endl;
}
```

我们可以传递任意个参数给 `magic` 函数：

```c++
magic(); // 输出0
magic(1); // 输出1
magic(1, ""); // 输出2
```

其次，`对参数进行解包`，到目前为止还没有一种简单的方法能够处理参数包，但有三种经典的处理手法：

**1. 递归模板函数**

递归是非常容易想到的一种手段，也是`最经典的处理方法`。这种方法不断递归地向函数传递模板参数，进而达到递归遍历所有模板参数的目的：

```c++
#include <iostream>
template<typename T0>
void printf1(T0 value) {
    std::cout << value << std::endl;
}
template<typename T, typename... Ts>
void printf1(T value, Ts... args) {
    std::cout << value << std::endl;
    printf1(args...);
}
int main() {
    printf1(1, 2, "123", 1.1);
    return 0;
}
```

**2. 变参模板展开**

你应该感受到了这很繁琐，在 `C++17` 中增加了变参模板展开的支持，于是你可以在一个函数中完成 `printf` 的编写：

```c++
template<typename T0, typename... T>
void printf2(T0 t0, T... t) {
    std::cout << t0 << std::endl;
    if constexpr (sizeof...(t) > 0) printf2(t...);
}
```

**3. 初始化列表展开**

`递归模板函数`是一种标准的做法，但缺点显而易见的在于必须定义一个`终止递归`的函数。

这里介绍一种使用`初始化列表展开`的黑魔法：

```c++
template<typename T, typename... Ts>
auto printf3(T value, Ts... args) {
    std::cout << value << std::endl;
    (void) std::initializer_list<T>{([&args] {
        std::cout << args << std::endl;
    }(), value)...};
}
```

通过`初始化列表`，`(lambda 表达式, value)...` 将会被展开。由于`逗号表达式`的出现，`首先会执行前面的 lambda 表达式，完成参数的输出`。 为了避免编译器警告，我们可以将 `std::initializer_list` 显式的转为 `void`。

关于上面`初始化列表展开`代码的详细解释可以参考：[C++ 初始化列表展开,这个代码是什么意思？](https://www.zhihu.com/question/443285720/answer/1723184923)。

##### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/2/
```

2. 创建 `2.15.variadic.template.param.cpp` 文件，粘贴下面代码。

```c++
// 2.15.variadic.template.param.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>
#include <vector>
#include <string>

// sizeof...
template<typename... Ts>
void magic(Ts... args) {
        std::cout << sizeof...(args) << std::endl;
}

// 1. recursive parameter unpack
template<typename T0>
void printf1(T0 value) {
        std::cout << value << std::endl;
}

template<typename T, typename... Ts>
void printf1(T value, Ts... args) {
        std::cout << value << std::endl;
        printf1(args...);
}

// 2. variadic template parameter unfold
template<typename T0, typename... T>
void printf2(T0 t0, T... t) {
        std::cout << t0 << std::endl;
        if constexpr (sizeof...(t) > 0) printf2(t...);
}

// 3. parameter unpack using initializer_list
template<typename T, typename... Ts>
auto printf3(T value, Ts... args) {
        std::cout << value << std::endl;
        (void) std::initializer_list<T>{([&args] {
                        std::cout << args << std::endl;
        }(), value)...};
}

int main() {

        magic();
        magic(1);
        magic(1,"");

        printf1(1, 2, "123", 1.1);
        printf2(1, 2.3, "abc");
        printf3(111, 123, "alpha", 1.2);

        return 0;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ tree
.
├── 2.01.nullptr.cpp
├── 2.02.constexpr.cpp
├── 2.03.if.switch.cpp
├── 2.04.initializer.list.cpp
├── 2.05.structured.binding.cpp
├── 2.06.auto.cpp
├── 2.07.decltype.cpp
├── 2.08.tail.return.type.cpp
├── 2.10.if.constexpr.cpp
├── 2.11.for.loop.cpp
├── 2.12.external.template.cpp
├── 2.13.alias.template.cpp
├── 2.15.variadic.template.param.cpp
└── Makefile

0 directories, 14 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.08.tail.return.type.cpp
2.02.constexpr.cpp           2.10.if.constexpr.cpp
2.03.if.switch.cpp           2.11.for.loop.cpp
2.04.initializer.list.cpp    2.12.external.template.cpp
2.05.structured.binding.cpp  2.13.alias.template.cpp
2.06.auto.cpp                2.15.variadic.template.param.cpp
2.07.decltype.cpp            Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make
clang++ 2.01.nullptr.cpp -o 2.01.nullptr.out -std=c++2a -pedantic
clang++ 2.02.constexpr.cpp -o 2.02.constexpr.out -std=c++2a -pedantic
clang++ 2.03.if.switch.cpp -o 2.03.if.switch.out -std=c++2a -pedantic
clang++ 2.04.initializer.list.cpp -o 2.04.initializer.list.out -std=c++2a -pedantic
clang++ 2.05.structured.binding.cpp -o 2.05.structured.binding.out -std=c++2a -pedantic
clang++ 2.06.auto.cpp -o 2.06.auto.out -std=c++2a -pedantic
clang++ 2.07.decltype.cpp -o 2.07.decltype.out -std=c++2a -pedantic
clang++ 2.08.tail.return.type.cpp -o 2.08.tail.return.type.out -std=c++2a -pedantic
clang++ 2.10.if.constexpr.cpp -o 2.10.if.constexpr.out -std=c++2a -pedantic
clang++ 2.11.for.loop.cpp -o 2.11.for.loop.out -std=c++2a -pedantic
clang++ 2.12.external.template.cpp -o 2.12.external.template.out -std=c++2a -pedantic
clang++ 2.13.alias.template.cpp -o 2.13.alias.template.out -std=c++2a -pedantic
clang++ 2.15.variadic.template.param.cpp -o 2.15.variadic.template.param.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.08.tail.return.type.cpp
2.01.nullptr.out             2.08.tail.return.type.out
2.02.constexpr.cpp           2.10.if.constexpr.cpp
2.02.constexpr.out           2.10.if.constexpr.out
2.03.if.switch.cpp           2.11.for.loop.cpp
2.03.if.switch.out           2.11.for.loop.out
2.04.initializer.list.cpp    2.12.external.template.cpp
2.04.initializer.list.out    2.12.external.template.out
2.05.structured.binding.cpp  2.13.alias.template.cpp
2.05.structured.binding.out  2.13.alias.template.out
2.06.auto.cpp                2.15.variadic.template.param.cpp
2.06.auto.out                2.15.variadic.template.param.out
2.07.decltype.cpp            Makefile
2.07.decltype.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ./2.15.variadic.template.param.out
0
1
2
1
2
123
1.1
1
2.3
abc
111
123
alpha
1.2

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.08.tail.return.type.cpp
2.02.constexpr.cpp           2.10.if.constexpr.cpp
2.03.if.switch.cpp           2.11.for.loop.cpp
2.04.initializer.list.cpp    2.12.external.template.cpp
2.05.structured.binding.cpp  2.13.alias.template.cpp
2.06.auto.cpp                2.15.variadic.template.param.cpp
2.07.decltype.cpp            Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$
```

#### 折叠表达式

`C++ 17` 中将`变长参数`这种特性进一步带给了`表达式`，考虑下面这个例子：

```c++
#include <iostream>
template<typename ... T>
auto sum(T ... t) {
    return (t + ...);
}
int main() {
    std::cout << sum(1, 2, 3, 4, 5, 6, 7, 8, 9, 10) << std::endl;
}
```

##### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/2/
```

2. 创建 `2.16.fold.expression.cpp` 文件，粘贴下面代码。

```c++
// 2.16.fold.expression.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>
template<typename ... T>
auto sum(T ... t) {
        return (t + ...);
}

int main() {
        std::cout << sum(1, 2, 3, 4, 5, 6, 7, 8, 9, 10) << std::endl;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ tree
.
├── 2.01.nullptr.cpp
├── 2.02.constexpr.cpp
├── 2.03.if.switch.cpp
├── 2.04.initializer.list.cpp
├── 2.05.structured.binding.cpp
├── 2.06.auto.cpp
├── 2.07.decltype.cpp
├── 2.08.tail.return.type.cpp
├── 2.10.if.constexpr.cpp
├── 2.11.for.loop.cpp
├── 2.12.external.template.cpp
├── 2.13.alias.template.cpp
├── 2.15.variadic.template.param.cpp
├── 2.16.fold.expression.cpp
└── Makefile

0 directories, 15 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.10.if.constexpr.cpp
2.02.constexpr.cpp           2.11.for.loop.cpp
2.03.if.switch.cpp           2.12.external.template.cpp
2.04.initializer.list.cpp    2.13.alias.template.cpp
2.05.structured.binding.cpp  2.15.variadic.template.param.cpp
2.06.auto.cpp                2.16.fold.expression.cpp
2.07.decltype.cpp            Makefile
2.08.tail.return.type.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make
clang++ 2.01.nullptr.cpp -o 2.01.nullptr.out -std=c++2a -pedantic
clang++ 2.02.constexpr.cpp -o 2.02.constexpr.out -std=c++2a -pedantic
clang++ 2.03.if.switch.cpp -o 2.03.if.switch.out -std=c++2a -pedantic
clang++ 2.04.initializer.list.cpp -o 2.04.initializer.list.out -std=c++2a -pedantic
clang++ 2.05.structured.binding.cpp -o 2.05.structured.binding.out -std=c++2a -pedantic
clang++ 2.06.auto.cpp -o 2.06.auto.out -std=c++2a -pedantic
clang++ 2.07.decltype.cpp -o 2.07.decltype.out -std=c++2a -pedantic
clang++ 2.08.tail.return.type.cpp -o 2.08.tail.return.type.out -std=c++2a -pedantic
clang++ 2.10.if.constexpr.cpp -o 2.10.if.constexpr.out -std=c++2a -pedantic
clang++ 2.11.for.loop.cpp -o 2.11.for.loop.out -std=c++2a -pedantic
clang++ 2.12.external.template.cpp -o 2.12.external.template.out -std=c++2a -pedantic
clang++ 2.13.alias.template.cpp -o 2.13.alias.template.out -std=c++2a -pedantic
clang++ 2.15.variadic.template.param.cpp -o 2.15.variadic.template.param.out -std=c++2a -pedantic
clang++ 2.16.fold.expression.cpp -o 2.16.fold.expression.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.08.tail.return.type.out
2.01.nullptr.out             2.10.if.constexpr.cpp
2.02.constexpr.cpp           2.10.if.constexpr.out
2.02.constexpr.out           2.11.for.loop.cpp
2.03.if.switch.cpp           2.11.for.loop.out
2.03.if.switch.out           2.12.external.template.cpp
2.04.initializer.list.cpp    2.12.external.template.out
2.04.initializer.list.out    2.13.alias.template.cpp
2.05.structured.binding.cpp  2.13.alias.template.out
2.05.structured.binding.out  2.15.variadic.template.param.cpp
2.06.auto.cpp                2.15.variadic.template.param.out
2.06.auto.out                2.16.fold.expression.cpp
2.07.decltype.cpp            2.16.fold.expression.out
2.07.decltype.out            Makefile
2.08.tail.return.type.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ./2.16.fold.expression.out
55

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.10.if.constexpr.cpp
2.02.constexpr.cpp           2.11.for.loop.cpp
2.03.if.switch.cpp           2.12.external.template.cpp
2.04.initializer.list.cpp    2.13.alias.template.cpp
2.05.structured.binding.cpp  2.15.variadic.template.param.cpp
2.06.auto.cpp                2.16.fold.expression.cpp
2.07.decltype.cpp            Makefile
2.08.tail.return.type.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$
```

#### 非类型模板参数推导

前面我们主要提及的是模板参数的一种形式：`类型模板参数`。

```c++
template <typename T, typename U>
auto add(T t, U u) {
    return t+u;
}
```

其中模板的参数 `T` 和 `U` 为具体的`类型`。但还有一种常见模板参数形式可以让不同`字面量`成为模板参数，即`非类型模板参数`：

```c++
template <typename T, int BufSize>
class buffer_t {
public:
    T& alloc();
    void free(T& item);
private:
    T data[BufSize];
}

buffer_t<int, 100> buf; // 100 作为模板参数
```

在这种模板参数形式下，我们可以将 `100` 作为模板的参数进行传递。 在 `C++11` 引入了`类型推导`这一特性后，我们会很自然的问，既然此处的`模板参数`以具体的`字面量`进行传递，能否让`编译器`辅助我们进行`类型推导`，通过使用占位符 `auto` 从而不再需要明确指明类型？ 幸运的是，`C++17` 引入了这一特性，我们的确可以用 `auto` 关键字，让`编译器`辅助完成具体类型的`推导`， 例如：

```c++
template <auto value> void foo() {
    std::cout << value << std::endl;
    return;
}

int main() {
    foo<10>();  // value 被推导为 int 类型
}
```

##### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/2/
```

2. 创建 `2.18.non.type.template.auto.cpp` 文件，粘贴下面代码。

```c++
// 2.18.non.type.template.auto.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>

template <auto value> void foo() {
        std::cout << value << std::endl;
        return;
}

int main() {
        foo<10>(); // value is deduced as type int
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ tree
.
├── 2.01.nullptr.cpp
├── 2.02.constexpr.cpp
├── 2.03.if.switch.cpp
├── 2.04.initializer.list.cpp
├── 2.05.structured.binding.cpp
├── 2.06.auto.cpp
├── 2.07.decltype.cpp
├── 2.08.tail.return.type.cpp
├── 2.10.if.constexpr.cpp
├── 2.11.for.loop.cpp
├── 2.12.external.template.cpp
├── 2.13.alias.template.cpp
├── 2.15.variadic.template.param.cpp
├── 2.16.fold.expression.cpp
├── 2.18.non.type.template.auto.cpp
└── Makefile

0 directories, 16 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.10.if.constexpr.cpp
2.02.constexpr.cpp           2.11.for.loop.cpp
2.03.if.switch.cpp           2.12.external.template.cpp
2.04.initializer.list.cpp    2.13.alias.template.cpp
2.05.structured.binding.cpp  2.15.variadic.template.param.cpp
2.06.auto.cpp                2.16.fold.expression.cpp
2.07.decltype.cpp            2.18.non.type.template.auto.cpp
2.08.tail.return.type.cpp    Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make
clang++ 2.01.nullptr.cpp -o 2.01.nullptr.out -std=c++2a -pedantic
clang++ 2.02.constexpr.cpp -o 2.02.constexpr.out -std=c++2a -pedantic
clang++ 2.03.if.switch.cpp -o 2.03.if.switch.out -std=c++2a -pedantic
clang++ 2.04.initializer.list.cpp -o 2.04.initializer.list.out -std=c++2a -pedantic
clang++ 2.05.structured.binding.cpp -o 2.05.structured.binding.out -std=c++2a -pedantic
clang++ 2.06.auto.cpp -o 2.06.auto.out -std=c++2a -pedantic
clang++ 2.07.decltype.cpp -o 2.07.decltype.out -std=c++2a -pedantic
clang++ 2.08.tail.return.type.cpp -o 2.08.tail.return.type.out -std=c++2a -pedantic
clang++ 2.10.if.constexpr.cpp -o 2.10.if.constexpr.out -std=c++2a -pedantic
clang++ 2.11.for.loop.cpp -o 2.11.for.loop.out -std=c++2a -pedantic
clang++ 2.12.external.template.cpp -o 2.12.external.template.out -std=c++2a -pedantic
clang++ 2.13.alias.template.cpp -o 2.13.alias.template.out -std=c++2a -pedantic
clang++ 2.15.variadic.template.param.cpp -o 2.15.variadic.template.param.out -std=c++2a -pedantic
clang++ 2.16.fold.expression.cpp -o 2.16.fold.expression.out -std=c++2a -pedantic
clang++ 2.18.non.type.template.auto.cpp -o 2.18.non.type.template.auto.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.10.if.constexpr.cpp
2.01.nullptr.out             2.10.if.constexpr.out
2.02.constexpr.cpp           2.11.for.loop.cpp
2.02.constexpr.out           2.11.for.loop.out
2.03.if.switch.cpp           2.12.external.template.cpp
2.03.if.switch.out           2.12.external.template.out
2.04.initializer.list.cpp    2.13.alias.template.cpp
2.04.initializer.list.out    2.13.alias.template.out
2.05.structured.binding.cpp  2.15.variadic.template.param.cpp
2.05.structured.binding.out  2.15.variadic.template.param.out
2.06.auto.cpp                2.16.fold.expression.cpp
2.06.auto.out                2.16.fold.expression.out
2.07.decltype.cpp            2.18.non.type.template.auto.cpp
2.07.decltype.out            2.18.non.type.template.auto.out
2.08.tail.return.type.cpp    Makefile
2.08.tail.return.type.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ./2.18.non.type.template.auto.out
10

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.10.if.constexpr.cpp
2.02.constexpr.cpp           2.11.for.loop.cpp
2.03.if.switch.cpp           2.12.external.template.cpp
2.04.initializer.list.cpp    2.13.alias.template.cpp
2.05.structured.binding.cpp  2.15.variadic.template.param.cpp
2.06.auto.cpp                2.16.fold.expression.cpp
2.07.decltype.cpp            2.18.non.type.template.auto.cpp
2.08.tail.return.type.cpp    Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$
```

### 面向对象

#### 委托构造

`C++11` 引入了`委托构造`的概念，这使得`构造函数`可以在同一个类中一个`构造函数`调用另一个`构造函数`，从而达到简化代码的目的：

```c++
#include <iostream>
class Base {
public:
    int value1;
    int value2;
    Base() {
        value1 = 1;
    }
    Base(int value) : Base() { // 委托 Base() 构造函数
        value2 = value;
    }
};

int main() {
    Base b(2);
    std::cout << b.value1 << std::endl;
    std::cout << b.value2 << std::endl;
}
```

#### 继承构造

在传统 `C++` 中，`构造函数`如果需要继承是需要将参数一一传递的，这将导致效率低下。`C++11` 利用关键字 `using` 引入了`继承构造函数`的概念：

```c++
#include <iostream>
class Base {
public:
    int value1;
    int value2;
    Base() {
        value1 = 1;
    }
    Base(int value) : Base() { // 委托 Base() 构造函数
        value2 = value;
    }
};
class Subclass : public Base {
public:
    using Base::Base; // 继承构造
};
int main() {
    Subclass s(3);
    std::cout << s.value1 << std::endl;
    std::cout << s.value2 << std::endl;
}
```

#### 显式虚函数重载

在`传统 C++` 中，经常容易发生意外重载虚函数的事情。例如：

```c++
struct Base {
    virtual void foo();
};
struct SubClass: Base {
    void foo();
};
```

`SubClass::foo` 可能并不是程序员尝试重载虚函数，只是恰好加入了一个具有`相同名字的函数`。另一个可能的情形是，`当基类的虚函数被删除后，子类拥有旧的函数就不再重载该虚拟函数并摇身一变成为了一个普通的类方法`，这将造成灾难性的后果。

C++11 引入了 `override` 和 `final` 这两个关键字来防止上述情形的发生。

**override**

当重载虚函数时，引入 `override` 关键字`将显式的告知编译器进行重载，编译器将检查基函数是否存在这样的虚函数，否则将无法通过编译`：

```c++
struct Base {
    virtual void foo(int);
};
struct SubClass: Base {
    virtual void foo(int) override; // 合法
    virtual void foo(float) override; // 非法, 父类没有此虚函数
};
```

**final**

`final` 则是为了`防止类被继续继承`以及`终止虚函数继续重载`引入的。

```c++
struct Base {
    virtual void foo() final;
};
struct SubClass1 final: Base {
}; // 合法

struct SubClass2 : SubClass1 {
}; // 非法, SubClass1 已 final

struct SubClass3: Base {
    void foo(); // 非法, foo 已 final
};
```

#### 显式禁用默认函数

在`传统 C++` 中，如果程序员没有提供，`编译器会默认为对象生成默认构造函数、复制构造、赋值算符以及析构函数`。另外，C++ 也为所有类定义了诸如 `new` `delete` 这样的运算符。当程序员有需要时，可以重载这部分函数。

这就引发了一些需求：`无法精确控制默认函数的生成行为`。例如`禁止类的拷贝`时，必须将`复制构造函数`与`赋值算符`声明为 `private`。尝试使用这些未定义的函数将导致编译或链接错误，则是一种非常不优雅的方式。

并且，编译器产生的默认构造函数与用户定义的构造函数无法同时存在。`若用户定义了任何构造函数，编译器将不再生成默认构造函数`，但有时候我们却希望同时拥有这两种构造函数，这就造成了尴尬。

`C++11` 提供了上述需求的解决方案，`允许显式的声明采用或拒绝编译器自带的函数`。例如：

```c++
class Magic {
    public:
    Magic() = default; // 显式声明使用编译器生成的构造
    Magic& operator=(const Magic&) = delete; // 显式声明拒绝编译器生成构造
    Magic(int magic_number);
}
```

##### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/2/
```

2. 创建 `2.19.delegate.constructor.cpp` 文件，粘贴下面代码。

```c++
// 2.19.delegate.constructor.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>
#include <string>

class Base {
public:
        std::string str;
        int value;
        Base() = delete;
        Base(std::string s) {
                str = s;
        }

        // delegate constructor
        Base(std::string s, int v) : Base(s) {
                value = v;
        }

        // final constructor
        virtual void foo() final {
                return;
        }

        virtual void foo(int v) {
                value = v;
        }
};

class Subclass final : public Base {
public:
        double floating;
        Subclass() = delete;

        // inherit constructor
        Subclass(double f, int v, std::string s) : Base(s, v) {
                floating = f;
        }

        // explifict constructor
        virtual void foo(int v) override {
                std::cout << v << std::endl;
                value = v;
        }
};

//class Subclass2 : Subclass {
//};    // illegal, Subclass has final
//class Subclass3 : Base {
//      void foo();     // illegal, foo has final
//}

int main() {

        // Subclass oops; // illegal, default constructor has deleted
        Subclass s(1.2, 3, "abc");

        s.foo(1);

        std::cout << s.floating << std::endl;
        std::cout << s.value << std::endl;
        std::cout << s.str << std::endl;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ tree
.
├── 2.01.nullptr.cpp
├── 2.02.constexpr.cpp
├── 2.03.if.switch.cpp
├── 2.04.initializer.list.cpp
├── 2.05.structured.binding.cpp
├── 2.06.auto.cpp
├── 2.07.decltype.cpp
├── 2.08.tail.return.type.cpp
├── 2.10.if.constexpr.cpp
├── 2.11.for.loop.cpp
├── 2.12.external.template.cpp
├── 2.13.alias.template.cpp
├── 2.15.variadic.template.param.cpp
├── 2.16.fold.expression.cpp
├── 2.18.non.type.template.auto.cpp
├── 2.19.delegate.constructor.cpp
└── Makefile

0 directories, 17 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.11.for.loop.cpp
2.02.constexpr.cpp           2.12.external.template.cpp
2.03.if.switch.cpp           2.13.alias.template.cpp
2.04.initializer.list.cpp    2.15.variadic.template.param.cpp
2.05.structured.binding.cpp  2.16.fold.expression.cpp
2.06.auto.cpp                2.18.non.type.template.auto.cpp
2.07.decltype.cpp            2.19.delegate.constructor.cpp
2.08.tail.return.type.cpp    Makefile
2.10.if.constexpr.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make
clang++ 2.01.nullptr.cpp -o 2.01.nullptr.out -std=c++2a -pedantic
clang++ 2.02.constexpr.cpp -o 2.02.constexpr.out -std=c++2a -pedantic
clang++ 2.03.if.switch.cpp -o 2.03.if.switch.out -std=c++2a -pedantic
clang++ 2.04.initializer.list.cpp -o 2.04.initializer.list.out -std=c++2a -pedantic
clang++ 2.05.structured.binding.cpp -o 2.05.structured.binding.out -std=c++2a -pedantic
clang++ 2.06.auto.cpp -o 2.06.auto.out -std=c++2a -pedantic
clang++ 2.07.decltype.cpp -o 2.07.decltype.out -std=c++2a -pedantic
clang++ 2.08.tail.return.type.cpp -o 2.08.tail.return.type.out -std=c++2a -pedantic
clang++ 2.10.if.constexpr.cpp -o 2.10.if.constexpr.out -std=c++2a -pedantic
clang++ 2.11.for.loop.cpp -o 2.11.for.loop.out -std=c++2a -pedantic
clang++ 2.12.external.template.cpp -o 2.12.external.template.out -std=c++2a -pedantic
clang++ 2.13.alias.template.cpp -o 2.13.alias.template.out -std=c++2a -pedantic
clang++ 2.15.variadic.template.param.cpp -o 2.15.variadic.template.param.out -std=c++2a -pedantic
clang++ 2.16.fold.expression.cpp -o 2.16.fold.expression.out -std=c++2a -pedantic
clang++ 2.18.non.type.template.auto.cpp -o 2.18.non.type.template.auto.out -std=c++2a -pedantic
clang++ 2.19.delegate.constructor.cpp -o 2.19.delegate.constructor.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.10.if.constexpr.out
2.01.nullptr.out             2.11.for.loop.cpp
2.02.constexpr.cpp           2.11.for.loop.out
2.02.constexpr.out           2.12.external.template.cpp
2.03.if.switch.cpp           2.12.external.template.out
2.03.if.switch.out           2.13.alias.template.cpp
2.04.initializer.list.cpp    2.13.alias.template.out
2.04.initializer.list.out    2.15.variadic.template.param.cpp
2.05.structured.binding.cpp  2.15.variadic.template.param.out
2.05.structured.binding.out  2.16.fold.expression.cpp
2.06.auto.cpp                2.16.fold.expression.out
2.06.auto.out                2.18.non.type.template.auto.cpp
2.07.decltype.cpp            2.18.non.type.template.auto.out
2.07.decltype.out            2.19.delegate.constructor.cpp
2.08.tail.return.type.cpp    2.19.delegate.constructor.out
2.08.tail.return.type.out    Makefile
2.10.if.constexpr.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ./2.19.delegate.constructor.out
1
1.2
1
abc

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.11.for.loop.cpp
2.02.constexpr.cpp           2.12.external.template.cpp
2.03.if.switch.cpp           2.13.alias.template.cpp
2.04.initializer.list.cpp    2.15.variadic.template.param.cpp
2.05.structured.binding.cpp  2.16.fold.expression.cpp
2.06.auto.cpp                2.18.non.type.template.auto.cpp
2.07.decltype.cpp            2.19.delegate.constructor.cpp
2.08.tail.return.type.cpp    Makefile
2.10.if.constexpr.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$
```

#### 强类型枚举

在`传统 C++` 中，`枚举类型`并非`类型安全`，`枚举类型`会被视作`整数`，则会让两种完全不同的枚举类型可以进行直接的比较（虽然编译器给出了检查，但并非所有），`甚至同一个命名空间中的不同枚举类型的枚举值名字不能相同`，这通常不是我们希望看到的结果。

`C++11` 引入了`枚举类`（enumeration class），并使用 `enum class` 的语法进行声明：

```c++
enum class new_enum : unsigned int {
    value1,
    value2,
    value3 = 100,
    value4 = 100
};
```

这样定义的枚举实现了`类型安全`，`首先他不能够被隐式的转换为整数，同时也不能够将其与整数数字进行比较，更不可能对不同的枚举类型的枚举值进行比较`。但相同枚举值之间如果指定的值相同，那么可以进行比较：

```c++
if (new_enum::value3 == new_enum::value4) {
    // 会输出
    std::cout << "new_enum::value3 == new_enum::value4" << std::endl;
}
```

在这个语法中，`枚举类型`后面使用了`冒号`及`类型`关键字来指定枚举中枚举值的类型，这使得我们能够为枚举赋值（未指定时将默认使用 `int` ）。

而我们希望获得枚举值的值时，将必须显式的进行类型转换，不过我们可以通过重载 `<<` 这个算符来进行输出，可以`收藏`下面这个代码段：

```c++
#include <iostream>
template<typename T>
std::ostream& operator<<(
    typename std::enable_if<std::is_enum<T>::value,
        std::ostream>::type& stream, const T& e)
{
    return stream << static_cast<typename std::underlying_type<T>::type>(e);
}
```

这时，下面的代码将能够被编译：

```c++
std::cout << new_enum::value3 << std::endl
```

##### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/2/
```

2. 创建 `2.20.strong.type.enum.cpp` 文件，粘贴下面代码。

```c++
// 2.20.strong.type.enum.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>
template<typename T>
std::ostream& operator<<(typename std::enable_if<std::is_enum<T>::value, std::ostream>::type& stream, const T& e)
{
        return stream << static_cast<typename std::underlying_type<T>::type>(e);
}

// there will be compile error if all define value1 和 value2
enum Left {
        left_value1 = 1,
        left_value2
};

enum Right {
        right_value1 = 1,
        right_value2
};

enum class new_enum : unsigned int{
        value1,
        value2,
        value3 = 100,
        value4 = 100
};

int main() {

        // compile error
        //if (Left::left_value1 == Right::right_value2) {
        //      std::cout << "Left::value1 == Right::value2" << std::endl;
        //}

        // compile error
        // if(new_enum::left_value1 == 1) {
        //      std::cout << "true!" << std::endl;
        // }

        if (new_enum::value3 == new_enum::value4) {
                std::cout << "new_enum::value3 == new_enum::value4" << std::endl;
        }

        std::cout << new_enum::value3 << std::endl;

        return 0;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ tree
.
├── 2.01.nullptr.cpp
├── 2.02.constexpr.cpp
├── 2.03.if.switch.cpp
├── 2.04.initializer.list.cpp
├── 2.05.structured.binding.cpp
├── 2.06.auto.cpp
├── 2.07.decltype.cpp
├── 2.08.tail.return.type.cpp
├── 2.10.if.constexpr.cpp
├── 2.11.for.loop.cpp
├── 2.12.external.template.cpp
├── 2.13.alias.template.cpp
├── 2.15.variadic.template.param.cpp
├── 2.16.fold.expression.cpp
├── 2.18.non.type.template.auto.cpp
├── 2.19.delegate.constructor.cpp
├── 2.20.strong.type.enum.cpp
└── Makefile

0 directories, 18 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.11.for.loop.cpp
2.02.constexpr.cpp           2.12.external.template.cpp
2.03.if.switch.cpp           2.13.alias.template.cpp
2.04.initializer.list.cpp    2.15.variadic.template.param.cpp
2.05.structured.binding.cpp  2.16.fold.expression.cpp
2.06.auto.cpp                2.18.non.type.template.auto.cpp
2.07.decltype.cpp            2.19.delegate.constructor.cpp
2.08.tail.return.type.cpp    2.20.strong.type.enum.cpp
2.10.if.constexpr.cpp        Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make
clang++ 2.01.nullptr.cpp -o 2.01.nullptr.out -std=c++2a -pedantic
clang++ 2.02.constexpr.cpp -o 2.02.constexpr.out -std=c++2a -pedantic
clang++ 2.03.if.switch.cpp -o 2.03.if.switch.out -std=c++2a -pedantic
clang++ 2.04.initializer.list.cpp -o 2.04.initializer.list.out -std=c++2a -pedantic
clang++ 2.05.structured.binding.cpp -o 2.05.structured.binding.out -std=c++2a -pedantic
clang++ 2.06.auto.cpp -o 2.06.auto.out -std=c++2a -pedantic
clang++ 2.07.decltype.cpp -o 2.07.decltype.out -std=c++2a -pedantic
clang++ 2.08.tail.return.type.cpp -o 2.08.tail.return.type.out -std=c++2a -pedantic
clang++ 2.10.if.constexpr.cpp -o 2.10.if.constexpr.out -std=c++2a -pedantic
clang++ 2.11.for.loop.cpp -o 2.11.for.loop.out -std=c++2a -pedantic
clang++ 2.12.external.template.cpp -o 2.12.external.template.out -std=c++2a -pedantic
clang++ 2.13.alias.template.cpp -o 2.13.alias.template.out -std=c++2a -pedantic
clang++ 2.15.variadic.template.param.cpp -o 2.15.variadic.template.param.out -std=c++2a -pedantic
clang++ 2.16.fold.expression.cpp -o 2.16.fold.expression.out -std=c++2a -pedantic
clang++ 2.18.non.type.template.auto.cpp -o 2.18.non.type.template.auto.out -std=c++2a -pedantic
clang++ 2.19.delegate.constructor.cpp -o 2.19.delegate.constructor.out -std=c++2a -pedantic
clang++ 2.20.strong.type.enum.cpp -o 2.20.strong.type.enum.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.11.for.loop.cpp
2.01.nullptr.out             2.11.for.loop.out
2.02.constexpr.cpp           2.12.external.template.cpp
2.02.constexpr.out           2.12.external.template.out
2.03.if.switch.cpp           2.13.alias.template.cpp
2.03.if.switch.out           2.13.alias.template.out
2.04.initializer.list.cpp    2.15.variadic.template.param.cpp
2.04.initializer.list.out    2.15.variadic.template.param.out
2.05.structured.binding.cpp  2.16.fold.expression.cpp
2.05.structured.binding.out  2.16.fold.expression.out
2.06.auto.cpp                2.18.non.type.template.auto.cpp
2.06.auto.out                2.18.non.type.template.auto.out
2.07.decltype.cpp            2.19.delegate.constructor.cpp
2.07.decltype.out            2.19.delegate.constructor.out
2.08.tail.return.type.cpp    2.20.strong.type.enum.cpp
2.08.tail.return.type.out    2.20.strong.type.enum.out
2.10.if.constexpr.cpp        Makefile
2.10.if.constexpr.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ./2.20.strong.type.enum.out
new_enum::value3 == new_enum::value4
100

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$ ls
2.01.nullptr.cpp             2.11.for.loop.cpp
2.02.constexpr.cpp           2.12.external.template.cpp
2.03.if.switch.cpp           2.13.alias.template.cpp
2.04.initializer.list.cpp    2.15.variadic.template.param.cpp
2.05.structured.binding.cpp  2.16.fold.expression.cpp
2.06.auto.cpp                2.18.non.type.template.auto.cpp
2.07.decltype.cpp            2.19.delegate.constructor.cpp
2.08.tail.return.type.cpp    2.20.strong.type.enum.cpp
2.10.if.constexpr.cpp        Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/2
$
```

### 总结

本节介绍了现代 `C++` 中对语言可用性的增强，其中笔者认为最为重要的几个特性是几乎所有人都需要了解并熟练使用的：

1. `auto` 类型推导。

2. 范围 `for` 迭代。

3. 初始化列表。

4. 变参模板。

### 习题

1. 使用`结构化绑定`，仅用一行函数内代码实现如下函数：

```c++
template <typename Key, typename Value, typename F>
void update(std::map<Key, Value>& m, F foo) {
    // TODO:
}
int main() {
    std::map<std::string, long long int> m {
        {"a", 1},
        {"b", 2},
        {"c", 3}
    };
    update(m, [](std::string key) {
        return std::hash<std::string>{}(key);
    });
    for (auto&& [key, value] : m)
        std::cout << key << ":" << value << std::endl;
}
```

#### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令构建项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/
mkdir exercises
cd exercises/
mkdir 2
cd 2/
```

2. 创建 `structured.binding.cpp` 文件，粘贴下面代码。

```c++
// structured.binding.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>
#include <map>
#include <string>
#include <functional>

template <typename Key, typename Value, typename F>
void update(std::map<Key, Value>& m, F foo) {
        for (auto&& [key, value] : m ) value = foo(key);
}

int main() {

        std::map<std::string, long long int> m {
                {"a", 1},
                {"b", 2},
                {"c", 3}
        };

        update(m, [](std::string key) -> long long int {
                        return std::hash<std::string>{}(key);
        });

        for (auto&& [key, value] : m)
                std::cout << key << ":" << value << std::endl;
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
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/2
$ tree
.
├── Makefile
└── structured.binding.cpp

0 directories, 2 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/2
$ ls
Makefile  structured.binding.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/2
$ make
clang++ structured.binding.cpp -o structured.binding.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/2
$ ls
Makefile  structured.binding.cpp  structured.binding.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/2
$ ./structured.binding.out
a:2603192927274642682
b:4947675599669400333
c:-7663404831243078624

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/2
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/2
$ ls
Makefile  structured.binding.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/2
$
```

2. 尝试用`折叠表达式`实现用于计算均值的函数，传入允许任意参数。

#### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/2/
```

2. 创建 `fold.expresion.cpp` 文件，粘贴下面代码。

```c++
// fold.expresion.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>

template<typename ... T>
auto average(T ... t) {
        return (t + ... ) / sizeof...(t);
}

int main() {
        std::cout << average(1, 2, 3, 4, 5, 6, 7, 8, 9, 10) << std::endl;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/2
$ tree
.
├── fold.expresion.cpp
├── Makefile
└── structured.binding.cpp

0 directories, 3 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/2
$ ls
fold.expresion.cpp  Makefile  structured.binding.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/2
$ make
clang++ fold.expresion.cpp -o fold.expresion.out -std=c++2a -pedantic
clang++ structured.binding.cpp -o structured.binding.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/2
$ ls
fold.expresion.cpp  structured.binding.cpp
fold.expresion.out  structured.binding.out
Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/2
$ ./fold.expresion.out
5

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/2
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/2
$ ls
fold.expresion.cpp  Makefile  structured.binding.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/2
$
```

## 结语

第二十三篇博文写完，开心！！！！

今天，也是充满希望的一天。