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

`右值引用`是 `C++11` 引入的与 `Lambda` 表达式齐名的重要特性之一。它的引入解决了 `C++` 中大量的历史遗留问题，消除了诸如 `std::vector`、`std::string` 之类的额外开销，也才使得函数对象容器 `std::function` 成为了可能。

#### 左值、右值的纯右值、将亡值、右值

要弄明白`右值引用`到底是怎么一回事，必须要对`左值`和`右值`做一个明确的理解。

`左值` (lvalue, left value)，顾名思义就是赋值符号左边的值。准确来说，左值是表达式（不一定是赋值表达式）后依然存在的`持久对象`。

`右值` (rvalue, right value)，右边的值，是指表达式结束后就不再存在的`临时对象`。

而 `C++11` 中为了引入强大的`右值引用`，将右值的概念进行了进一步的划分，分为：`纯右值`、`将亡值`。

`纯右值` (prvalue, pure rvalue)，纯粹的右值，要么是`纯粹的字面量`，例如 `10`, `true`；要么是`求值结果`相当于`字面量`或`匿名临时对象`，例如 `1+2`。非引用返回的`临时变量`、`运算表达式产生的临时变量`、`原始字面量`、`Lambda 表达式`都属于`纯右值`。

需要注意的是，`字面量`除了`字符串字面量`以外，均为`纯右值`。而`字符串字面量`是一个`左值`，类型为 `const char 数组`。例如：

```c++
#include <type_traits>

int main() {
    // 正确，"01234" 类型为 const char [6]，因此是左值
    const char (&left)[6] = "01234";

    // 断言正确，确实是 const char [6] 类型，注意 decltype(expr) 在 expr 是左值
    // 且非无括号包裹的 id 表达式与类成员表达式时，会返回左值引用
    static_assert(std::is_same<decltype("01234"), const char(&)[6]>::value, "");

    // 错误，"01234" 是左值，不可被右值引用
    // const char (&&right)[6] = "01234";
}
```

但是注意，`数组可以被隐式转换成相对应的指针类型`，而`转换表达式的结果（如果不是左值引用）则一定是个右值（右值引用为将亡值，否则为纯右值）`。例如：

```c++
const char*   p   = "01234";  // 正确，"01234" 被隐式转换为 const char*
const char*&& pr  = "01234";  // 正确，"01234" 被隐式转换为 const char*，该转换的结果是纯右值
// const char*& pl = "01234"; // 错误，此处不存在 const char* 类型的左值
```

**将亡值(xvalue, expiring value)**，是 `C++11` 为了引入`右值引用`而提出的概念（因此在`传统 C++` 中，`纯右值`和`右值`是同一个概念），也就是`即将被销毁、却能够被移动的值`。

`将亡值`可能稍有些难以理解，我们来看这样的代码：

```c++
std::vector<int> foo() {
    std::vector<int> temp = {1, 2, 3, 4};
    return temp;
}

std::vector<int> v = foo();
```

在这样的代码中，就传统的理解而言，函数 `foo` 的返回值 `temp` 在内部创建然后被赋值给 `v`，然而 `v` 获得这个对象时，会将整个 `temp` 拷贝一份，然后把 `temp` 销毁，如果这个 `temp` 非常大，这将造成`大量额外的开销`（这也就是`传统 C++` 一直被诟病的问题）。在最后一行中，`v` 是`左值`、`foo()` 返回的值就是`右值`（也是`纯右值`）。但是，`v` 可以被别的变量捕获到，而 `foo()` 产生的那个返回值作为一个`临时值`，一旦被 `v` 复制后，将立即被`销毁`，无法获取、也不能修改。而`将亡值`就定义了这样一种行为：`临时的值能够被识别、同时又能够被移动`。

在 `C++11` 之后，编译器为我们做了一些工作，此处的左值 `temp` 会被进行此`隐式右值转换`，等价于 `static_cast<std::vector<int> &&>(temp)`，进而此处的 `v` 会将 `foo` 局部返回的值进行`移动`。也就是后面我们将会提到的`移动语义`。

#### 右值引用和左值引用

要拿到一个`将亡值`，就需要用到`右值引用`：`T &&`，其中 `T` 是类型。`右值引用的声明让这个临时值的生命周期得以延长、只要变量还活着，那么将亡值将继续存活`。

`C++11` 提供了 `std::move` 这个方法将`左值`参数无条件的转换为`右值`，有了它我们就能够方便的获得一个`右值临时对象`，例如：

```c++
#include <iostream>
#include <string>

void reference(std::string& str) {
    std::cout << "左值" << std::endl;
}
void reference(std::string&& str) {
    std::cout << "右值" << std::endl;
}

int main()
{
    std::string lv1 = "string,"; // lv1 是一个左值
    // std::string&& r1 = lv1; // 非法, 右值引用不能引用左值
    std::string&& rv1 = std::move(lv1); // 合法, std::move可以将左值转移为右值
    std::cout << rv1 << std::endl; // string,

    const std::string& lv2 = lv1 + lv1; // 合法, 常量左值引用能够延长临时变量的生命周期
    // lv2 += "Test"; // 非法, 常量引用无法被修改
    std::cout << lv2 << std::endl; // string,string,

    std::string&& rv2 = lv1 + lv2; // 合法, 右值引用延长临时对象生命周期
    rv2 += "Test"; // 合法, 非常量引用能够修改临时变量
    std::cout << rv2 << std::endl; // string,string,string,Test

    reference(rv2); // 输出左值

    return 0;
}
```

`rv2` 虽然引用了一个`右值`，但由于它是一个引用，所以 `rv2` 依然是一个`左值`。

注意，这里有一个很有趣的`历史遗留问题`，我们先看下面的代码：

```c++
#include <iostream>

int main() {
    // int &a = std::move(1);    // 不合法，非常量左引用无法引用右值
    const int &b = std::move(1); // 合法, 常量左引用允许引用右值

    std::cout << a << b << std::endl;
}
```

第一个问题，为什么不允许非常量引用绑定到非左值？这是因为这种做法存在`逻辑错误`：

```c++
void increase(int & v) {
    v++;
}
void foo() {
    double s = 1;
    increase(s);
}
```

由于 `int&` 不能引用 `double` 类型的参数，因此必须产生一个`临时值`来保存 `s` 的值，从而当 `increase()` 修改这个临时值时，调用完成后 `s` 本身并没有被修改。

第二个问题，为什么`常量引用允许绑定到非左值`？原因很简单，因为 `Fortran` 需要。

##### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/3/
```

2. 创建 `3.3.rvalue.cpp` 文件，粘贴下面代码。

```c++
// 3.3.rvalue.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>
#include <string>

void reference(std::string& str) {
        std::cout << "lvalue" << std::endl;
}
void reference(std::string&& str) {
        std::cout << "rvalue" << std::endl;
}

int main()
{
        std::string lv1 = "string,";    // lv1 is a lvalue
        // std::string&& r1 = lv1;      // illegal, rvalue can't ref to lvalue
        std::string&& rv1 = std::move(lv1);     // legal, std::move can convert lvalue to rvalue
        std::cout << rv1 << std::endl;          // string,

        const std::string& lv2 = lv1 + lv1;     // legal, const lvalue reference can extend temp variable's lifecycle
        // lv2 += "Test";                       // illegal, const ref can't be modified
        std::cout << lv2 << std::endl;          // string,string

        std::string&& rv2= lv1 + lv2;           // legal, rvalue ref extend lifecycle
        rv2 += "string";                        // legal, non-const reference can be modified
        std::cout << rv2 << std::endl;          // string,string,string

        reference(rv2);                         // output: lvalue

        return 0;
}
```

3. 创建 `3.4.historical.cpp` 文件，粘贴下面代码。

```c++
// 3.4.historical.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>

int main() {
        // int &a = std::move(1);       // illegal, non-const lvalue reference cannot ref rvalue
        const int &b = std::move(1);    // legal, const lvalue reference can

        std::cout << b << std::endl;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$ tree
.
├── 3.1.lambda.basic.cpp
├── 3.2.function.wrap.cpp
├── 3.3.rvalue.cpp
├── 3.4.historical.cpp
└── Makefile

0 directories, 5 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$ ls
3.1.lambda.basic.cpp   3.3.rvalue.cpp      Makefile
3.2.function.wrap.cpp  3.4.historical.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$ make
clang++ 3.1.lambda.basic.cpp -o 3.1.lambda.basic.out -std=c++2a -pedantic
clang++ 3.2.function.wrap.cpp -o 3.2.function.wrap.out -std=c++2a -pedantic
clang++ 3.3.rvalue.cpp -o 3.3.rvalue.out -std=c++2a -pedantic
clang++ 3.4.historical.cpp -o 3.4.historical.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$ ls
3.1.lambda.basic.cpp   3.3.rvalue.out
3.1.lambda.basic.out   3.4.historical.cpp
3.2.function.wrap.cpp  3.4.historical.out
3.2.function.wrap.out  Makefile
3.3.rvalue.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$ ./3.3.rvalue.out
string,
string,string,
string,string,string,string
lvalue

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$ ./3.4.historical.out
1

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$ ls
3.1.lambda.basic.cpp   3.3.rvalue.cpp      Makefile
3.2.function.wrap.cpp  3.4.historical.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/3
$
```

#### 移动语义

`传统 C++` 通过`拷贝构造函数`和`赋值操作符`为类对象设计了`拷贝/复制`的概念，但为了`实现对资源的移动操作，调用者必须使用先复制、再析构的方式，否则就需要自己实现移动对象的接口`。试想，搬家的时候是把家里的东西直接搬到新家去，而不是将所有东西复制一份（重买）再放到新家、再把原来的东西全部扔掉（销毁），这是非常反人类的一件事情。

`传统的 C++` 没有区分 `移动`和 `拷贝` 的概念，造成了大量的数据拷贝，浪费时间和空间。`右值引用`的出现恰好就解决了这两个概念的混淆问题，例如：

```c++
#include <iostream>
class A {
public:
    int *pointer;
    A():pointer(new int(1)) {
        std::cout << "构造" << pointer << std::endl;
    }
    A(A& a):pointer(new int(*a.pointer)) {
        std::cout << "拷贝" << pointer << std::endl;
    } // 无意义的对象拷贝
    A(A&& a):pointer(a.pointer) {
        a.pointer = nullptr;
        std::cout << "移动" << pointer << std::endl;
    }
    ~A(){
        std::cout << "析构" << pointer << std::endl;
        delete pointer;
    }
};
// 防止编译器优化
A return_rvalue(bool test) {
    A a,b;
    if(test) return a; // 等价于 static_cast<A&&>(a);
    else return b;     // 等价于 static_cast<A&&>(b);
}
int main() {
    A obj = return_rvalue(false);
    std::cout << "obj:" << std::endl;
    std::cout << obj.pointer << std::endl;
    std::cout << *obj.pointer << std::endl;
    return 0;
}
```

在上面的代码中：

1. 首先会在 `return_rvalue` 内部构造两个 `A` 对象，于是获得两个构造函数的输出；

2. 函数返回后，产生一个`将亡值`，被 `A` 的移动构造（`A(A&&)`）引用，从而延长生命周期，并将这个`右值`中的指针拿到，保存到了 `obj` 中，而`将亡值的指针`被设置为 `nullptr`，防止了这块内存区域被销毁。

从而`避免了无意义的拷贝构造`，加强了性能。再来看看涉及标准库的例子：

```c++
#include <iostream> // std::cout
#include <utility> // std::move
#include <vector> // std::vector
#include <string> // std::string

int main() {

    std::string str = "Hello world.";
    std::vector<std::string> v;

    // 将使用 push_back(const T&), 即产生拷贝行为
    v.push_back(str);
    // 将输出 "str: Hello world."
    std::cout << "str: " << str << std::endl;

    // 将使用 push_back(const T&&), 不会出现拷贝行为
    // 而整个字符串会被移动到 vector 中，所以有时候 std::move 会用来减少拷贝出现的开销
    // 这步操作后, str 中的值会变为空
    v.push_back(std::move(str));
    // 将输出 "str: "
    std::cout << "str: " << str << std::endl;

    return 0;
}
```

#### 完美转发

前面我们提到了，一个声明的`右值引用`其实是一个`左值`。这就为我们进行`参数转发（传递）`造成了问题：

```c++
void reference(int& v) {
    std::cout << "左值" << std::endl;
}
void reference(int&& v) {
    std::cout << "右值" << std::endl;
}
template <typename T>
void pass(T&& v) {
    std::cout << "普通传参:";
    reference(v); // 始终调用 reference(int&)
}
int main() {
    std::cout << "传递右值:" << std::endl;
    pass(1); // 1是右值, 但输出是左值

    std::cout << "传递左值:" << std::endl;
    int l = 1;
    pass(l); // l 是左值, 输出左值

    return 0;
}
```

对于 `pass(1)` 来说，虽然传递的是`右值`，但由于 `v` 是一个`引用`，所以同时也是`左值`。因此 `reference(v)` 会调用 `reference(int&)`，输出`左值`。而对于 `pass(l)` 而言，`l` 是一个`左值`，为什么会成功传递给 `pass(T&&)` 呢？

这是基于`引用坍缩规则`的：在`传统 C++` 中，我们不能够对一个`引用类型`继续进行`引用`，但 `C++` 由于`右值引用`的出现而放宽了这一做法，从而产生了`引用坍缩规则`，允许我们对`引用`进行`引用`， 既能`左引用`，又能`右引用`。但是却遵循如下规则：

|**函数形参类型**|**实参参数类型**|**推导后函数形参类型**|
|:-:|:-:|:-:|
|T&|左引用|T&|
|T&|右引用|T&|
|T&&|左引用|T&|
|T&&|右引用|T&&|

因此，`模板函数`中使用 `T&&` 不一定能进行`右值引用`，当传入`左值`时，此函数的引用将被推导为`左值`。更准确的讲，**无论模板参数是什么类型的引用，当且仅当实参类型为右引用时，模板参数才能被推导为右引用类型**。这才使得 `v` 作为`左值`的`成功传递`。

`完美转发`就是基于上述规律产生的。所谓`完美转发`，就是为了让我们在`传递参数`的时候，`保持原来的参数类型（左引用保持左引用，右引用保持右引用）`。为了解决这个问题，我们应该使用 `std::forward` 来进行`参数的转发（传递）`：

```c++
#include <iostream>
#include <utility>
void reference(int& v) {
    std::cout << "左值引用" << std::endl;
}
void reference(int&& v) {
    std::cout << "右值引用" << std::endl;
}
template <typename T>
void pass(T&& v) {
    std::cout << "              普通传参: ";
    reference(v);
    std::cout << "       std::move 传参: ";
    reference(std::move(v));
    std::cout << "    std::forward 传参: ";
    reference(std::forward<T>(v));
    std::cout << "static_cast<T&&> 传参: ";
    reference(static_cast<T&&>(v));
}
int main() {
    std::cout << "传递右值:" << std::endl;
    pass(1);

    std::cout << "传递左值:" << std::endl;
    int v = 1;
    pass(v);

    return 0;
}
```

输出结果为：

```shell
传递右值:
              普通传参: 左值引用
       std::move 传参: 右值引用
    std::forward 传参: 右值引用
static_cast<T&&> 传参: 右值引用
传递左值:
              普通传参: 左值引用
       std::move 传参: 右值引用
    std::forward 传参: 左值引用
static_cast<T&&> 传参: 左值引用
```

无论传递参数为`左值`还是`右值`，`普通传参都会将参数作为左值进行转发`，所以 `std::move` 总会接受到一个`左值`，从而转发调用了`reference(int&&)` 输出`右值引用`。

唯独 `std::forward` 即没有造成任何多余的拷贝，同时`完美转发(传递)了函数的实参给了内部调用的其他函数`。

`std::forward` 和 `std::move` 一样，没有做任何事情，`std::move` 单纯的将`左值`转化为`右值`，`std::forward` 也只是单纯的将参数做了一个类型的转换，从现象上来看，`std::forward<T>(v)` 和 `static_cast<T&&>(v)` 是完全一样的。

读者可能会好奇，为何一条语句能够针对两种类型的返回对应的值，我们再简单看一看 `std::forward` 的具体实现机制，`std::forward` 包含`两个重载`：

```c++
template<typename _Tp>
constexpr _Tp&& forward(typename std::remove_reference<_Tp>::type& __t) noexcept
{ return static_cast<_Tp&&>(__t); }

template<typename _Tp>
constexpr _Tp&& forward(typename std::remove_reference<_Tp>::type&& __t) noexcept
{
    static_assert(!std::is_lvalue_reference<_Tp>::value, "template argument"
        " substituting _Tp is an lvalue reference type");
    return static_cast<_Tp&&>(__t);
}
```

在这份实现中，`std::remove_reference` 的功能是消除类型中的`引用`，`std::is_lvalue_reference` 则用于检查类型推导是否正确，在 `std::forward` 的第二个实现中检查了接收到的值确实是一个`左值`，进而体现了`坍缩规则`。

当 `std::forward` 接受`左值`时，`_Tp` 被推导为`左值`，所以返回值为`左值`；而当其接受`右值`时，`_Tp` 被推导为`右值引用`，则基于`坍缩规则`，返回值便成为了 `&& + &&` 的右值。可见 `std::forward` 的原理在于`巧妙的利用了模板类型推导中产生的差异`。

这时我们能回答这样一个问题：`为什么在使用循环语句的过程中，auto&& 是最安全的方式？` 因为当 `auto` 被推导为不同的`左右引用`时，与 `&&` 的坍缩组合是`完美转发`。

### 总结

本章介绍了现代 `C++` 中最为重要的几个`语言运行时的增强`，其中笔者认为本节中提到的所有特性都是值得掌握的：

1. `Lambda` 表达式。

2. `函数对象容器 std::function`。

3. `右值引用`。

### 进一步阅读的参考文献

1. [Bjarne Stroustrup, C++ 语言的设计与演化](https://www.amazon.cn/dp/B007JFSCPY)

## 第 4 章 容器

## 结语

第二十四篇博文写完，开心！！！！

今天，也是充满希望的一天。