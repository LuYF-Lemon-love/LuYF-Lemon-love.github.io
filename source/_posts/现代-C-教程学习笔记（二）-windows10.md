---
title: 现代 C++ 教程学习笔记（二）-windows10
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
description: 现代 C++ 教程第 3 章、第 4 章和第 5 章（语言运行期的强化、容器、智能指针与内存管理）的学习笔记。
cover: 'https://cos.luyf-lemon-love.space/images/OrnnkaalRocks_1Full.jpg'
abbrlink: 201799990
date: 2022-08-20 22:06:19
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

## 第 3 章 语言运行期的强化

### Lambda 表达式

`Lambda` 表达式是现代 `C++` 中最重要的特性之一，而 `Lambda` 表达式，实际上就是提供了一个类似`匿名函数`的特性，而`匿名函数`则是在需要一个函数，但是又不想费力去命名一个函数的情况下去使用的。这样的场景其实有很多很多，所以`匿名函数`几乎是现代编程语言的标配。

#### 基础

`Lambda` 表达式的基本语法如下：

```c++
[捕获列表](参数列表) mutable(可选) 异常属性 -> 返回类型 {
// 函数体
}
```

上面的语法规则除了 `[捕获列表]` 内的东西外，其他部分都很好理解，只是一般函数的函数名被略去，`返回值`使用了一个 `->` 的形式进行（我们在上一节前面的`尾返回类型`已经提到过这种写法了）。

所谓`捕获列表`，其实可以理解为`参数`的一种类型，`Lambda` 表达式`内部函数体`在默认情况下是不能够使用函数体外部的变量的，这时候`捕获列表`可以起到`传递外部数据`的作用。根据传递的行为，捕获列表也分为以下几种：

**1. 值捕获**

与`参数传值`类似，`值捕获`的前提是变量可以拷贝，不同之处则在于，被捕获的变量在 `Lambda` 表达式被`创建时拷贝`，而`非调用时才拷贝`：

```c++
void lambda_value_capture() {
    int value = 1;
    auto copy_value = [value] {
        return value;
    };
    value = 100;
    auto stored_value = copy_value();
    std::cout << "stored_value = " << stored_value << std::endl;
    // 这时, stored_value == 1, 而 value == 100.
    // 因为 copy_value 在创建时就保存了一份 value 的拷贝
}
```

**2. 引用捕获**

与`引用传参`类似，`引用捕获`保存的是`引用`，值会发生变化。

```c++
void lambda_reference_capture() {
    int value = 1;
    auto copy_value = [&value] {
        return value;
    };
    value = 100;
    auto stored_value = copy_value();
    std::cout << "stored_value = " << stored_value << std::endl;
    // 这时, stored_value == 100, value == 100.
    // 因为 copy_value 保存的是引用
}
```

**3. 隐式捕获**

手动书写捕获列表有时候是非常复杂的，这种机械性的工作可以交给编译器来处理，这时候可以在捕获列表中写一个 `&` 或 `=` 向编译器声明采用`引用捕获`或者`值捕获`。

总结一下，捕获提供了 `Lambda` 表达式对外部值进行使用的功能，`捕获列表`的最常用的四种形式可以是：

- `[]` 空捕获列表。

- `[name1, name2, ...]` 捕获一系列变量。

- `[&]` 引用捕获, 让编译器自行推导引用列表。

- `[=]` 值捕获, 让编译器自行推导值捕获列表。

**4. 表达式捕获**

上面提到的`值捕获`、`引用捕获`都是已经在`外层作用域声明的变量`，因此这些捕获方式捕获的均为`左值`，而不能捕获`右值`。

`C++14` 给与了我们方便，允许捕获的成员用任意的表达式进行初始化，这就允许了`右值的捕获`，`被声明的捕获变量类型`会根据表达式进行判断，判断方式与使用 `auto` 本质上是相同的：

```c++
#include <iostream>
#include <memory>  // std::make_unique
#include <utility> // std::move

void lambda_expression_capture() {
    auto important = std::make_unique<int>(1);
    auto add = [v1 = 1, v2 = std::move(important)](int x, int y) -> int {
        return x+y+v1+(*v2);
    };
    std::cout << add(3,4) << std::endl;
}
```

在上面的代码中，`important` 是一个`独占指针`，是不能够被 "=" 值捕获到，这时候我们可以将其转移为`右值`，在表达式中初始化。

#### 泛型 Lambda

从 `C++14` 开始，`Lambda` 函数的形式参数可以使用 `auto` 关键字来产生`意义上的泛型`：

```c++
auto add = [](auto x, auto y) {
    return x+y;
};

add(1, 2);
add(1.1, 2.2);
```

#### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令构建项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/
mkdir 3
cd 3/
```

2. 创建 `3.1.lambda.basic.cpp` 文件，粘贴下面代码。

```c++
// 3.1.lambda.basic.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>
#include <memory> // std::make_unique
#include <utility> // std::move

void lambda_value_capture() {
        int value = 1;
        auto copy_value = [value] {
                return value;
        };
        value = 100;
        auto stored_value = copy_value();
        std::cout << "stored_value = " << stored_value << std::endl;
        // At this moment, stored_value == 1, and value == 100.
        // Because copy_value has copied when its was created.
}

void lambda_reference_capture() {
        int value = 1;
        auto copy_value = [&value] {
                return value;
        };
        value = 100;
        auto stored_value = copy_value();
        std::cout << "stored_value = " << stored_value << std::endl;
        // At this moment, stored_value == 100, value == 100.
        // Because copy_value stores reference
}

void lambda_expression_capture() {
        auto important = std::make_unique<int>(1);
        auto add = [v1 = 1, v2 = std::move(important)](int x, int y) -> int {
                return x+y+v1+(*v2);
        };
        std::cout << add(3,4) << std::endl;
}

void lambda_generic() {
        auto generic = [](auto x, auto y) {
                return x+y;
        };

        std::cout << generic(1, 2) << std::endl;
        std::cout << generic(1.1, 2.2) << std::endl;
}

int main() {

        lambda_value_capture();
        lambda_reference_capture();
        lambda_expression_capture();
        lambda_generic();

        return 0;
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
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$ tree
.
├── 3.1.lambda.basic.cpp
└── Makefile

0 directories, 2 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$ ls
3.1.lambda.basic.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$ make
clang++ 3.1.lambda.basic.cpp -o 3.1.lambda.basic.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$ ls
3.1.lambda.basic.cpp  3.1.lambda.basic.out  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$ ./3.1.lambda.basic.out
stored_value = 1
stored_value = 100
9
3
3.3

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$ ls
3.1.lambda.basic.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$
```

### 函数对象包装器

这部分内容虽然属于标准库的一部分，但是从本质上来看，它却增强了 `C++ 语言运行时`的能力，这部分内容也相当重要，所以放到这里来进行介绍。

#### std::function

`Lambda 表达式`的本质是一个和`函数对象类型`相似的`类型`（称为`闭包类型`）的对象（称为`闭包对象`），当 `Lambda 表达式`的捕获列表为空时，`闭包对象`还能够转换为`函数指针值`进行传递，例如：

```c++
#include <iostream>

using foo = void(int); // 定义函数类型, using 的使用见上一节中的别名语法
void functional(foo f) { // 参数列表中定义的函数类型 foo 被视为退化后的函数指针类型 foo*
    f(1); // 通过函数指针调用函数
}

int main() {
    auto f = [](int value) {
        std::cout << value << std::endl;
    };
    functional(f); // 传递闭包对象，隐式转换为 foo* 类型的函数指针值
    f(1); // lambda 表达式调用
    return 0;
}
```

上面的代码给出了两种不同的调用形式，一种是将 `Lambda` 作为函数类型传递进行调用，而另一种则是直接调用 `Lambda` 表达式，在 `C++11` 中，统一了这些概念，将能够被调用的对象的类型，统一称之为`可调用类型`。而这种类型，便是通过 `std::function` 引入的。

`C++11` `std::function` 是一种通用、多态的函数封装，它的实例可以对任何可以调用的目标实体进行`存储`、`复制`和`调用`操作，它也是对 `C++` 中现有的`可调用实体`的一种`类型安全`的包裹（相对来说，`函数指针`的调用不是`类型安全`的），换句话说，就是函数的`容器`。当我们有了函数的容器之后便能够更加方便的将`函数`、`函数指针`作为对象进行处理。例如：

```c++
#include <functional>
#include <iostream>

int foo(int para) {
    return para;
}

int main() {
    // std::function 包装了一个返回值为 int, 参数为 int 的函数
    std::function<int(int)> func = foo;

    int important = 10;
    std::function<int(int)> func2 = [&](int value) -> int {
        return 1+value+important;
    };
    std::cout << func(10) << std::endl;
    std::cout << func2(10) << std::endl;
}
```

#### std::bind 和 std::placeholder

而 `std::bind` 则是用来绑定函数调用的参数的，它解决的需求是我们有时候可能并不一定能够一次性获得调用某个函数的全部参数，通过这个函数，我们`可以将部分调用参数提前绑定到函数身上成为一个新的对象，然后在参数齐全后，完成调用`。例如：

```c++
int foo(int a, int b, int c) {
    ;
}
int main() {
    // 将参数1,2绑定到函数 foo 上，
    // 但使用 std::placeholders::_1 来对第一个参数进行占位
    auto bindFoo = std::bind(foo, std::placeholders::_1, 1,2);
    // 这时调用 bindFoo 时，只需要提供第一个参数即可
    bindFoo(1);
}
```

>提示：注意 `auto` 关键字的妙用。有时候我们可能不太熟悉一个函数的返回值类型，但是我们却可以通过 `auto` 的使用来规避这一问题的出现。

#### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/3/
```

2. 创建 `3.2.function.wrap.cpp` 文件，粘贴下面代码。

```c++
// 3.2.function.wrap.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <functional>
#include <iostream>

using foo = void(int);  // function pointer
void functional(foo f) {
        f(1);
}

int foo2(int para) {
        return para;
}

int foo3(int a, int b, int c) {
        return 0;
}

int main() {

        auto f = [](int value) {
                std::cout << value << std::endl;
        };
        functional(f);  // call by function pointer
        f(1);           // call by lambda expression

        // std::function wraps a function that take int parameter and returns int value
        std::function<int(int)> func = foo2;

        int important = 10;
        std::function<int(int)> func2 = [&](int value) -> int {
                return 1+value+important;
        };
        std::cout << func(10) << std::endl;
        std::cout << func2(10) << std::endl;

        // bind parameter 1, 2 on function foo, and use std::placeholders::_1 as placeholder
        // for the first parameter.
        auto bindFoo = std::bind(foo3, std::placeholders::_1, 1, 2);
        // when call bindFoo, we only need one param left
        bindFoo(1);

        return 0;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$ tree
.
├── 3.1.lambda.basic.cpp
├── 3.2.function.wrap.cpp
└── Makefile

0 directories, 3 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$ ls
3.1.lambda.basic.cpp  3.2.function.wrap.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$ make
clang++ 3.1.lambda.basic.cpp -o 3.1.lambda.basic.out -std=c++2a -pedantic
clang++ 3.2.function.wrap.cpp -o 3.2.function.wrap.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$ ls
3.1.lambda.basic.cpp  3.2.function.wrap.cpp  Makefile
3.1.lambda.basic.out  3.2.function.wrap.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$ ./3.2.function.wrap.out
1
1
10
21

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$ ls
3.1.lambda.basic.cpp  3.2.function.wrap.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$
```

### 右值引用

## 结语

第二十四篇博文写完，开心！！！！

今天，也是充满希望的一天。