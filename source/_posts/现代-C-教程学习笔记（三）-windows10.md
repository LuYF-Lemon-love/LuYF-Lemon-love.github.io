---
title: 现代 C++ 教程学习笔记（三）-windows10
tags:
  - C++11
  - MinGW
  - MSYS2
  - Windows
  - Clang
  - make
  - Makefile
  - C/C++
  - 多线程
  - 线程池
  - 正则表达式
  - GCC
  - G++
  - CMake
categories: 学习笔记
description: >-
  现代 C++ 教程第 6 章、第 7 章、第 8 章、第 9 章和第 10 章（正则表达式、并行与并发、文件系统、其他杂项、展望：C++20
  简介和附录）的学习笔记。
cover: 'https://cos.luyf-lemon-love.space/images/noxus_expansion_01.jpg'
abbrlink: 539158218
date: 2022-08-26 11:19:39
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

## 第 6 章 正则表达式

### 正则表达式简介

`正则表达式`不是 `C++` 语言的一部分，这里仅做简单的介绍。

`正则表达式`描述了一种`字符串匹配的模式`。一般使用`正则表达式`主要是实现下面三个需求：

1. 检查一个串是否包含某种形式的子串；

2. 将匹配的子串替换；

3. 从某个串中取出符合条件的子串。

`正则表达式`是由`普通字符`（例如 `a` 到 `z`）以及`特殊字符`组成的`文字模式`。`模式描述在搜索文本时要匹配的一个或多个字符串`。`正则表达式`作为一个模板，将某个字符模式与所搜索的字符串进行匹配。

#### 普通字符

`普通字符`包括`没有显式指定为元字符的所有可打印和不可打印字符`。这包括所有`大写`和`小写字母`、`所有数字`、`所有标点符号`和`一些其他符号`。

#### 特殊字符

`特殊字符`是`正则表达式`里`有特殊含义的字符`，也是`正则表达式`的核心匹配语法。参见下表：

|**特别字符**|**描述**|
|:-:|:-:|
|`$`|匹配输入字符串的结尾位置。|
|`(`,`)`|标记一个子表达式的开始和结束位置。子表达式可以获取供以后使用。|
|`*`|匹配前面的子表达式零次或多次。|
|`+`|匹配前面的子表达式一次或多次。|
|`.`|匹配除换行符 `\n` 之外的任何单字符。|
|`[`|标记一个中括号表达式的开始。|
|`?`|匹配前面的子表达式零次或一次，或指明一个非贪婪限定符。|
|`\`|将下一个字符标记为或`特殊字符`、或`原义字符`、或`向后引用`、或`八进制转义符`。例如，`n` 匹配字符 `n`。`\n` 匹配`换行符`。序列 `\\` 匹配 `'\'` 字符，而 `\(` 则匹配 `'('` 字符。|
|`^`|`匹配输入字符串的开始位置`，除非在方括号表达式中使用，`此时它表示不接受该字符集合`。|
|`{`|标记`限定符`表达式的开始。|
|`\|`|指明两项之间的一个选择。|

#### 限定符

`限定符`用来指定`正则表达式`的一个给定的组件必须要出现`多少次`才能满足匹配。见下表：

|**字符**|**描述**|
|:-:|:-:|
|`*`|匹配前面的子表达式`零次`或`多次`。例如，`foo*` 能匹配 `fo` 以及 `foooo`。`*` 等价于 `{0,}`。|
|`+`|匹配前面的子表达式`一次`或`多次`。例如，`foo+` 能匹配 `foo` 以及 `foooo`，但不能匹配 `fo`。`+` 等价于 `{1,}`。|
|`?`|匹配前面的子表达式`零次`或`一次`。例如，`Your(s)?` 可以匹配 `Your` 或 `Yours` 中的 `Your`。`?` 等价于 `{0,1}`。|
|`{n}`|`n` 是一个非负整数。匹配确定的 `n` 次。例如，`o{2}` 不能匹配 `for` 中的 `o`，但是能匹配 `foo` 中的`两个 o`。|
|`{n,}`|`n` 是一个非负整数。至少匹配 `n` 次。例如，`o{2,}` 不能匹配 `for` 中的 `o`，但能匹配 `foooooo` 中的所有 `o`。`o{1,}` 等价于 `o+`。`o{0,}` 则等价于 `o*`。|
|`{n,m}`|`m` 和 `n` 均为非负整数，其中 `n` 小于等于 `m`。最少匹配 `n` 次且最多匹配 `m` 次。例如，`o{1,3}` 将匹配 `foooooo` 中的前三个 `o`。`o{0,1}` 等价于 `o?`。注意，在逗号和两个数之间不能有空格。|

有了这两张表，我们通常就能够读懂几乎所有的`正则表达式`了。

### std::regex 及其相关

对`字符串`内容进行匹配的最常见手段就是使用`正则表达式`。可惜在`传统 C++` 中`正则表达式`一直没有得到语言层面的支持，没有纳入标准库，而 `C++` 作为一门`高性能语言`，在后台服务的开发中，对 `URL` 资源链接进行判断时，使用`正则表达式`也是工业界最为成熟的普遍做法。

一般的解决方案就是使用 `boost` 的正则表达式库。而 `C++11` 正式将`正则表达式`的的处理方法纳入标准库的行列，从语言级上提供了标准的支持，不再依赖第三方。

`C++11` 提供的正则表达式库操作 `std::string` 对象，模式 `std::regex` (本质是 `std::basic_regex` )进行初始化，通过 `std::regex_match` 进行匹配，从而产生 `std::smatch` （本质是 `std::match_results` 对象）。

我们通过一个简单的例子来简单介绍这个库的使用。考虑下面的`正则表达式`:

>`[a-z]+\.txt`: 在这个正则表达式中, `[a-z]` 表示匹配一个`小写字母`, `+` 可以使前面的表达式匹配多次，因此 `[a-z]+` 能够`匹配一个小写字母组成的字符串`。在正则表达式中一个 `.` 表示匹配任意字符，而 `\.` 则表示匹配字符 `.`，最后的 `txt` 表示严格匹配 `txt` 则三个字母。因此这个`正则表达式`的所要匹配的内容就是`由纯小写字母组成的文本文件`。

`std::regex_match` 用于匹配`字符串`和`正则表达式`，有很多不同的重载形式。最简单的一个形式就是传入 `std::string` 以及一个 `std::regex` 进行匹配，当匹配成功时，会返回 `true`，否则返回 `false`。例如：

```c++
#include <iostream>
#include <string>
#include <regex>

int main() {
    std::string fnames[] = {"foo.txt", "bar.txt", "test", "a0.txt", "AAA.txt"};
    // 在 C++ 中 \ 会被作为字符串内的转义符，
    // 为使 \. 作为正则表达式传递进去生效，需要对 \ 进行二次转义，从而有 \\.
    std::regex txt_regex("[a-z]+\\.txt");
    for (const auto &fname: fnames)
        std::cout << fname << ": " << std::regex_match(fname, txt_regex) << std::endl;
}
```

另一种常用的形式就是依次传入 `std::string`/`std::smatch`/`std::regex` 三个参数，其中 `std::smatch` 的本质其实是 `std::match_results`。故而在标准库的实现中，`std::smatch` 被定义为了 `std::match_results<std::string::const_iterator>`，也就是一个`子串迭代器类型`的 `match_results`。使用 `std::smatch` 可以方便的对匹配的结果进行获取，例如：

```c++
std::regex base_regex("([a-z]+)\\.txt");
std::smatch base_match;
for(const auto &fname: fnames) {
    if (std::regex_match(fname, base_match, base_regex)) {
        // std::smatch 的第一个元素匹配整个字符串
        // std::smatch 的第二个元素匹配了第一个括号表达式
        if (base_match.size() == 2) {
            std::string base = base_match[1].str();
            std::cout << "sub-match[0]: " << base_match[0].str() << std::endl;
            std::cout << fname << " sub-match[1]: " << base << std::endl;
        }
    }
}
```

以上`两个代码段`的输出结果为：

```shell
foo.txt: 1
bar.txt: 1
test: 0
a0.txt: 0
AAA.txt: 0
sub-match[0]: foo.txt
foo.txt sub-match[1]: foo
sub-match[0]: bar.txt
bar.txt sub-match[1]: bar
```

#### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令构建项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/
mkdir 6
cd 6/
```

2. 创建 `6.1.regex.cpp` 文件，粘贴下面代码。

```c++
// 6.1.regex.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>
#include <string>
#include <regex>

int main() {
        std::string fnames[] = {"foo.txt", "bar.txt", "test", "a0.txt", "AAA.txt"};
        // In C++, '\' will be used as an escape character in the string.
        // In order for '\.' to be passed as a regular expression,
        // it is necessary to perform second escaping of '\', thus we have '\\.'
        std::regex txt_regex("[a-z]+\\.txt");
        for (const auto &fname: fnames)
                std::cout << fname << ": " << std::regex_match(fname, txt_regex) << std::endl;

        std::regex base_regex("([a-z]+)\\.txt");
        std::smatch base_match;
        for (const auto &fname: fnames) {
                if (std::regex_match(fname, base_match, base_regex)) {
                        // the first element of std::smatch matches the entire string
                        // the second element of std::smatch matches the first expression with brackets
                        if (base_match.size() == 2) {
                                std::string base = base_match[1].str();
                                std::cout << "sub-match[0]: " << base_match[0].str() << std::endl;
                                std::cout << fname << " sub-match[1]: " << base << std::endl;
                        }
                }
        }

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
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/6
$ tree
.
├── 6.1.regex.cpp
└── Makefile

0 directories, 2 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/6
$ ls
6.1.regex.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/6
$ make
clang++ 6.1.regex.cpp -o 6.1.regex.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/6
$ ls
6.1.regex.cpp  6.1.regex.out  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/6
$ ./6.1.regex.out
foo.txt: 1
bar.txt: 1
test: 0
a0.txt: 0
AAA.txt: 0
sub-match[0]: foo.txt
foo.txt sub-match[1]: foo
sub-match[0]: bar.txt
bar.txt sub-match[1]: bar

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/6
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/6
$ ls
6.1.regex.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/6
$
```

### 总结

本节简单介绍了`正则表达式`本身，然后根据使用`正则表达式`的主要需求，通过一个实际的例子介绍了`正则表达式库`的使用。

### 进一步阅读的参考资料

1. [知乎『如何评价 GCC 的 C++11 正则表达式？』中原库作者 Tim Shen 的回答](https://zhihu.com/question/23070203/answer/84248248)

2. [正则表达式库文档](https://en.cppreference.com/w/cpp/regex)

## 第 7 章 并行与并发

### 并行基础

`std::thread` 用于创建一个执行的线程实例，所以它是一切`并发编程`的基础，使用时需要包含 `<thread>` 头文件，它提供了很多基本的线程操作，例如 `get_id()` 来获取所创建线程的线程 `ID`，使用 `join()` 来加入一个线程等等，例如：

```c++
#include <iostream>
#include <thread>

int main() {
    std::thread t([](){
        std::cout << "hello world." << std::endl;
    });
    t.join();
    return 0;
}
```

#### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令构建项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/
mkdir 7
cd 7/
```

2. 创建 `7.1.thread.basic.cpp` 文件，粘贴下面代码。

```c++
// 7.1.thread.basic.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>
#include <thread>

int main() {
        std::thread t([](){
                std::cout << "hello world." << std::endl;
        });
        t.join();

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
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ tree
.
├── 7.1.thread.basic.cpp
└── Makefile

0 directories, 2 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ls
7.1.thread.basic.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ make
clang++ 7.1.thread.basic.cpp -o 7.1.thread.basic.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ls
7.1.thread.basic.cpp  7.1.thread.basic.out  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ./7.1.thread.basic.out
hello world.

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ls
7.1.thread.basic.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$
```

### 互斥量与临界区

我们在`操作系统`、亦或是`数据库`的相关知识中已经了解过了有关`并发技术`的基本知识，`mutex` 就是其中的核心之一。`C++11` 引入了 `mutex` 相关的类，其所有相关的函数都放在 `<mutex>` 头文件中。

`std::mutex` 是 `C++11` 中最基本的 `mutex` 类，通过实例化 `std::mutex` 可以创建`互斥量`，而通过其成员函数 `lock()` 可以进行`上锁`，`unlock()` 可以进行`解锁`。但是在实际编写代码的过程中，最好不去直接调用成员函数，因为调用成员函数就需要在每个临界区的出口处调用 `unlock()`，当然，还包括异常。这时候 `C++11` 还为`互斥量`提供了一个 `RAII` 语法的模板类 `std::lock_guard`。`RAII` 在不失代码简洁性的同时，很好的`保证了代码的异常安全性`。

在 `RAII` 用法下，对于`临界区`的`互斥量`的创建只需要`在作用域的开始部分`，例如：

```c++
#include <iostream>
#include <mutex>
#include <thread>

int v = 1;

void critical_section(int change_v) {
    static std::mutex mtx;
    std::lock_guard<std::mutex> lock(mtx);

    // 执行竞争操作
    v = change_v;

    // 离开此作用域后 mtx 会被释放
}

int main() {
    std::thread t1(critical_section, 2), t2(critical_section, 3);
    t1.join();
    t2.join();

    std::cout << v << std::endl;
    return 0;
}
```

由于 `C++` 保证了所有栈对象在生命周期结束时会被销毁，所以这样的代码也是`异常安全`的。无论 `critical_section()` 正常返回、还是在中途抛出异常，都会引发堆栈回退，也就自动调用了 `unlock()`。

而 `std::unique_lock` 则是相对于 `std::lock_guard` 出现的，`std::unique_lock` 更加灵活，`std::unique_lock` 的对象会以`独占所有权`（没有其他的 `unique_lock` 对象同时拥有某个 `mutex` 对象的所有权）的方式管理 `mutex` 对象上的`上锁`和`解锁`的操作。所以在`并发编程`中，推荐使用 `std::unique_lock`。

`std::lock_guard` 不能显式的调用 `lock` 和 `unlock`，而 `std::unique_lock` 可以在声明后的`任意位置调用`，可以缩小锁的作用范围，`提供更高的并发度`。

如果你用到了`条件变量` `std::condition_variable::wait` 则必须使用 `std::unique_lock` 作为参数。

例如：

```c++
#include <iostream>
#include <mutex>
#include <thread>

int v = 1;

void critical_section(int change_v) {
    static std::mutex mtx;
    std::unique_lock<std::mutex> lock(mtx);
    // 执行竞争操作
    v = change_v;
    std::cout << v << std::endl;
    // 将锁进行释放
    lock.unlock();

    // 在此期间，任何人都可以抢夺 v 的持有权

    // 开始另一组竞争操作，再次加锁
    lock.lock();
    v += 1;
    std::cout << v << std::endl;
}

int main() {
    std::thread t1(critical_section, 2), t2(critical_section, 3);
    t1.join();
    t2.join();
    return 0;
}
```

#### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/7/
```

2. 创建 `7.2.critical.section.a.cpp` 文件，粘贴下面代码。

```c++
// 7.2.critical.section.a.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>
#include <mutex>
#include <thread>

int v = 1;

void critical_section(int change_v) {
        static std::mutex mtx;
        std::lock_guard<std::mutex> lock(mtx);

        // do contention operations
        v = change_v;

        // mtx will be destructed when exit this region
}

int main() {

        std::thread t1(critical_section, 2), t2(critical_section, 3);
        t1.join();
        t2.join();

        std::cout << v << std::endl;
        return 0;
}
```

3. 创建 `7.3.critical.section.b.cpp` 文件，粘贴下面代码。

```c++
// 7.3.critical.section.b.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>
#include <mutex>
#include <thread>

int v = 1;

void critical_section(int change_v) {
        static std::mutex mtx;
        std::unique_lock<std::mutex> lock(mtx);
        // do contention operations
        v = change_v;
        std::cout << v << std::endl;
        // release the lock
        lock.unlock();

        // during this period,
        // others are allowed to acquire v

        // start another group of contention operations
        // lock again
        lock.lock();
        v += 1;
        std::cout << v << std::endl;
}

int main() {
        std::thread t1(critical_section, 2), t2(critical_section, 3);
        t1.join();
        t2.join();

        return 0;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ tree
.
├── 7.1.thread.basic.cpp
├── 7.2.critical.section.a.cpp
├── 7.3.critical.section.b.cpp
└── Makefile

0 directories, 4 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ls
7.1.thread.basic.cpp        7.3.critical.section.b.cpp
7.2.critical.section.a.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ make
clang++ 7.1.thread.basic.cpp -o 7.1.thread.basic.out -std=c++2a -pedantic
clang++ 7.2.critical.section.a.cpp -o 7.2.critical.section.a.out -std=c++2a -pedantic
clang++ 7.3.critical.section.b.cpp -o 7.3.critical.section.b.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ls
7.1.thread.basic.cpp        7.2.critical.section.a.out  Makefile
7.1.thread.basic.out        7.3.critical.section.b.cpp
7.2.critical.section.a.cpp  7.3.critical.section.b.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ./7.2.critical.section.a.out
3

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ./7.3.critical.section.b.out
3
4
2
3

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ls
7.1.thread.basic.cpp        7.3.critical.section.b.cpp
7.2.critical.section.a.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$
```

### 期物

`期物`（`Future`）表现为 `std::future`，`它提供了一个访问异步操作结果的途径`，这句话很不好理解。为了理解这个特性，我们需要先理解一下在 `C++11` 之前的多线程行为。

试想，如果我们的`主线程 A` 希望新开辟一个`线程 B` 去执行某个我们预期的任务，并返回我一个结果。而这时候，`线程 A` 可能正在忙其他的事情，无暇顾及 `B` 的结果，所以我们会很自然的希望能够在某个特定的时间获得`线程 B` 的结果。

在 `C++11` 的 `std::future` 被引入之前，通常的做法是：创建一个`线程 A`，在`线程 A` 里启动`任务 B`，当准备完毕后发送一个事件，并将结果保存在全局变量中。而主函数`线程 A` 里正在做其他的事情，当需要结果的时候，调用一个`线程等待函数`来获得执行的结果。

而 `C++11` 提供的 `std::future` 简化了这个流程，`可以用来获取异步任务的结果`。自然地，我们很容易能够想象到把它作为一种简单的`线程同步`手段，即`屏障`（`barrier`）。

为了看一个例子，我们这里额外使用 `std::packaged_task`，它`可以用来封装任何可以调用的目标`，从而用于`实现异步的调用`。 举例来说：

```c++
#include <iostream>
#include <future>
#include <thread>

int main() {
    // 将一个返回值为7的 lambda 表达式封装到 task 中
    // std::packaged_task 的模板参数为要封装函数的类型
    std::packaged_task<int()> task([](){return 7;});
    // 获得 task 的期物
    std::future<int> result = task.get_future(); // 在一个线程中执行 task
    std::thread(std::move(task)).detach();
    std::cout << "waiting...";
    result.wait(); // 在此设置屏障，阻塞到期物的完成
    // 输出执行结果
    std::cout << "done!" << std:: endl << "future result is "
              << result.get() << std::endl;
    return 0;
}
```

在封装好要调用的目标后，可以使用 `get_future()` 来获得一个 `std::future` 对象，`以便之后实施线程同步`。

#### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/7/
```

2. 创建 `7.4.futures.cpp` 文件，粘贴下面代码。

```c++
// 7.4.futures.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>
#include <thread>
#include <future>

int main() {
        // pack a lambda expression that returns 7 into a std::packaged_task
        std::packaged_task<int()> task([](){return 7;});
        // get the future of task
        std::future<int> result = task.get_future();    // run task in a thread
        std::thread(std::move(task)).detach();
        std::cout << "waiting...";
        result.wait(); // block until future has arrived
        // output result
        std::cout << "done!" << std::endl << "future result is " << result.get() << std::endl;
        return 0;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ tree
.
├── 7.1.thread.basic.cpp
├── 7.2.critical.section.a.cpp
├── 7.3.critical.section.b.cpp
├── 7.4.futures.cpp
└── Makefile

0 directories, 5 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ls
7.1.thread.basic.cpp        7.4.futures.cpp
7.2.critical.section.a.cpp  Makefile
7.3.critical.section.b.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ make
clang++ 7.1.thread.basic.cpp -o 7.1.thread.basic.out -std=c++2a -pedantic
clang++ 7.2.critical.section.a.cpp -o 7.2.critical.section.a.out -std=c++2a -pedantic
clang++ 7.3.critical.section.b.cpp -o 7.3.critical.section.b.out -std=c++2a -pedantic
clang++ 7.4.futures.cpp -o 7.4.futures.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ls
7.1.thread.basic.cpp        7.3.critical.section.b.out
7.1.thread.basic.out        7.4.futures.cpp
7.2.critical.section.a.cpp  7.4.futures.out
7.2.critical.section.a.out  Makefile
7.3.critical.section.b.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ./7.4.futures.out
waiting...done!
future result is 7

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ls
7.1.thread.basic.cpp        7.4.futures.cpp
7.2.critical.section.a.cpp  Makefile
7.3.critical.section.b.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$
```

### 条件变量

条件变量 `std::condition_variable` 是为了解决`死锁`而生，当互斥操作不够用而引入的。比如，`线程`可能需要等待某个条件为真才能继续执行，而一个忙等待循环中可能会导致所有其他线程都无法进入临界区使得条件为真时，就会发生`死锁`。所以，`condition_variable` 实例被创建出现主要就是用于`唤醒等待线程`从而避免`死锁`。`std::condition_variable` 的 `notify_one()` 用于`唤醒一个线程`；`notify_all()` 则是`通知所有线程`。下面是一个`生产者和消费者模型`的例子：

```c++
#include <queue>
#include <chrono>
#include <mutex>
#include <thread>
#include <iostream>
#include <condition_variable>


int main() {
    std::queue<int> produced_nums;
    std::mutex mtx;
    std::condition_variable cv;
    bool notified = false;  // 通知信号

    // 生产者
    auto producer = [&]() {
        for (int i = 0; ; i++) {
            std::this_thread::sleep_for(std::chrono::milliseconds(900));
            std::unique_lock<std::mutex> lock(mtx);
            std::cout << "producing " << i << std::endl;
            produced_nums.push(i);
            notified = true;
            cv.notify_all(); // 此处也可以使用 notify_one
        }
    };
    // 消费者
    auto consumer = [&]() {
        while (true) {
            std::unique_lock<std::mutex> lock(mtx);
            while (!notified) {  // 避免虚假唤醒
                cv.wait(lock);
            }
            // 短暂取消锁，使得生产者有机会在消费者消费空前继续生产
            lock.unlock();
            // 消费者慢于生产者
            std::this_thread::sleep_for(std::chrono::milliseconds(1000));
            lock.lock();
            while (!produced_nums.empty()) {
                std::cout << "consuming " << produced_nums.front() << std::endl;
                produced_nums.pop();
            }
            notified = false;
        }
    };

    // 分别在不同的线程中运行
    std::thread p(producer);
    std::thread cs[2];
    for (int i = 0; i < 2; ++i) {
        cs[i] = std::thread(consumer);
    }
    p.join();
    for (int i = 0; i < 2; ++i) {
        cs[i].join();
    }
    return 0;
}
```

值得一提的是，在`生产者`中我们虽然可以使用 `notify_one()`，但实际上并不建议在此处使用，因为在多`消费者`的情况下，我们的消费者实现中简单放弃了锁的持有，这使得可能让其他`消费者`争夺此锁，从而更好的利用多个消费者之间的并发。话虽如此，但实际上因为 `std::mutex` 的`排他性`，我们根本无法期待多个`消费者`能真正意义上的并行消费队列的中生产的内容，我们仍需要粒度更细的手段。

#### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/7/
```

2. 创建 `7.5.producer.consumer.cpp` 文件，粘贴下面代码。

```c++
// 7.5.producer.consumer.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <queue>
#include <chrono>
#include <mutex>
#include <thread>
#include <iostream>
#include <condition_variable>

int main() {
        std::queue<int> produced_nums;
        std::mutex mtx;
        std::condition_variable cv;
        bool notified = false;  // notification sign

        auto producer = [&]() {
                for (int i = 0; ; i++) {
                        std::this_thread::sleep_for(std::chrono::milliseconds(500));
                        std::unique_lock<std::mutex> lock(mtx);
                        std::cout << "producing " << i << std::endl;
                        produced_nums.push(i);
                        notified = true;
                        cv.notify_all();
                }
        };
        auto consumer = [&]() {
                while (true) {
                        std::unique_lock<std::mutex> lock(mtx);
                        while (!notified) {  // avoid spurious wakeup
                                cv.wait(lock);
                        }

                        // temporal unlock to allow producer produces more rather than
                        // let consumer hold the lock until its consumed.
                        lock.unlock();
                        std::this_thread::sleep_for(std::chrono::milliseconds(1000)); // consumer is slower
                        lock.lock();
                        if (!produced_nums.empty()) {
                                std::cout << "consuming " << produced_nums.front() << std::endl;
                                produced_nums.pop();
                        }
                        notified = false;
                }
        };

        std::thread p(producer);
        std::thread cs[2];
        for (int i = 0; i < 2; ++i) {
                cs[i] = std::thread(consumer);
        }
        p.join();
        for (int i = 0; i < 2; ++i) {
                cs[i].join();
        }
        return 0;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ tree
.
├── 7.1.thread.basic.cpp
├── 7.2.critical.section.a.cpp
├── 7.3.critical.section.b.cpp
├── 7.4.futures.cpp
├── 7.5.producer.consumer.cpp
└── Makefile

0 directories, 6 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ls
7.1.thread.basic.cpp        7.4.futures.cpp
7.2.critical.section.a.cpp  7.5.producer.consumer.cpp
7.3.critical.section.b.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ make
clang++ 7.1.thread.basic.cpp -o 7.1.thread.basic.out -std=c++2a -pedantic
clang++ 7.2.critical.section.a.cpp -o 7.2.critical.section.a.out -std=c++2a -pedantic
clang++ 7.3.critical.section.b.cpp -o 7.3.critical.section.b.out -std=c++2a -pedantic
clang++ 7.4.futures.cpp -o 7.4.futures.out -std=c++2a -pedantic
clang++ 7.5.producer.consumer.cpp -o 7.5.producer.consumer.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ls
7.1.thread.basic.cpp        7.4.futures.cpp
7.1.thread.basic.out        7.4.futures.out
7.2.critical.section.a.cpp  7.5.producer.consumer.cpp
7.2.critical.section.a.out  7.5.producer.consumer.out
7.3.critical.section.b.cpp  Makefile
7.3.critical.section.b.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ./7.5.producer.consumer.out
producing 0
producing 1
consuming 0
consuming 1
producing 2
producing 3
consuming 2
consuming 3
producing 4
producing 5
consuming 4
consuming 5
producing 6
producing 7
consuming 6
consuming 7
producing 8
producing 9
consuming 8
consuming 9
producing 10
producing 11
consuming 10
consuming 11
producing 12
producing 13
consuming 12
consuming 13
producing 14


lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ls
7.1.thread.basic.cpp        7.4.futures.cpp
7.2.critical.section.a.cpp  7.5.producer.consumer.cpp
7.3.critical.section.b.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$
```

### 原子操作与内存模型

细心的读者可能会对前一小节中`生产者消费者模型`的例子可能存在编译器优化导致程序出错的情况产生疑惑。例如，布尔值 `notified` 没有被 `volatile` 修饰，`编译器可能对此变量存在优化`，例如将其作为一个`寄存器`的值，`从而导致消费者线程永远无法观察到此值的变化`。这是一个好问题，为了解释清楚这个问题，我们需要进一步讨论`从 C++ 11 起引入的内存模型这一概念`。我们首先来看一个问题，下面这段代码输出结果是多少？

```c++
#include <thread>
#include <iostream>

int main() {
    int a = 0;
    int flag = 0;

    std::thread t1([&]() {
        while (flag != 1);

        int b = a;
        std::cout << "b = " << b << std::endl;
    });

    std::thread t2([&]() {
        a = 5;
        flag = 1;
    });

    t1.join();
    t2.join();
    return 0;
}
```

从直观上看，`t2` 中 `a = 5;` 这一条语句似乎总在 `flag = 1;` 之前得到执行，而 `t1` 中 `while (flag != 1)` 似乎保证了 `std::cout << "b = " << b << std::endl;` 不会再标记被改变前执行。从逻辑上看，似乎 `b` 的值应该等于 `5`。但实际情况远比此复杂得多，或者说`这段代码本身属于未定义的行为`，因为对于 `a` 和 `flag` 而言，他们`在两个并行的线程中被读写，出现了竞争`。除此之外，即便我们忽略竞争读写，仍然可能受 `CPU` 的`乱序执行`，`编译器对指令的重排`的影响，导致 `a = 5` 发生在 `flag = 1` 之后。从而 `b` 可能输出 `0`。

#### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/7/
```

2. 创建 `7.6.bad.example.cpp` 文件，粘贴下面代码。

```c++
// 7.6.bad.example.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <thread>
#include <iostream>

int main() {
        int a = 0;
        volatile int flag = 0;

        std::thread t1([&]() {
                while (flag != 1);

                int b = a;
                std::cout << "b = " << b << std::endl;
        });

        std::thread t2([&]() {
                a = 5;
                flag = 1;
        });

        t1.join();
        t2.join();

        return 0;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ tree
.
├── 7.1.thread.basic.cpp
├── 7.2.critical.section.a.cpp
├── 7.3.critical.section.b.cpp
├── 7.4.futures.cpp
├── 7.5.producer.consumer.cpp
├── 7.6.bad.example.cpp
└── Makefile

0 directories, 7 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ls
7.1.thread.basic.cpp        7.5.producer.consumer.cpp
7.2.critical.section.a.cpp  7.6.bad.example.cpp
7.3.critical.section.b.cpp  Makefile
7.4.futures.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ make
clang++ 7.1.thread.basic.cpp -o 7.1.thread.basic.out -std=c++2a -pedantic
clang++ 7.2.critical.section.a.cpp -o 7.2.critical.section.a.out -std=c++2a -pedantic
clang++ 7.3.critical.section.b.cpp -o 7.3.critical.section.b.out -std=c++2a -pedantic
clang++ 7.4.futures.cpp -o 7.4.futures.out -std=c++2a -pedantic
clang++ 7.5.producer.consumer.cpp -o 7.5.producer.consumer.out -std=c++2a -pedantic
clang++ 7.6.bad.example.cpp -o 7.6.bad.example.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ls
7.1.thread.basic.cpp        7.4.futures.out
7.1.thread.basic.out        7.5.producer.consumer.cpp
7.2.critical.section.a.cpp  7.5.producer.consumer.out
7.2.critical.section.a.out  7.6.bad.example.cpp
7.3.critical.section.b.cpp  7.6.bad.example.out
7.3.critical.section.b.out  Makefile
7.4.futures.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ./7.6.bad.example.out
b = 5

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ls
7.1.thread.basic.cpp        7.5.producer.consumer.cpp
7.2.critical.section.a.cpp  7.6.bad.example.cpp
7.3.critical.section.b.cpp  Makefile
7.4.futures.cpp

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$
```

#### 原子操作

`std::mutex` 可以解决上面出现的`并发读写`的问题，但`互斥锁`是`操作系统`级的功能，这是因为一个`互斥锁`的实现通常包含两条基本原理：

1. 提供线程间自动的状态转换，即 `锁住` 这个状态。

2. 保障在`互斥锁`操作期间，所操作变量的内存与临界区外进行隔离。

这是一组`非常强的同步条件`，换句话说`当最终编译为 CPU 指令时会表现为非常多的指令`（我们之后再来看如何实现一个简单的`互斥锁`）。这对于一个仅需`原子级操作`（没有中间态）的变量，似乎太苛刻了。

关于`同步条件`的研究有着非常久远的历史，我们在这里不进行赘述。读者应该明白，现代 `CPU` 体系结构提供了 `CPU` 指令级的`原子操作`，因此在 `C++11` 中`多线程下共享变量的读写`这一问题上，还引入了 `std::atomic` 模板，使得我们实例化一个`原子类型`，`将一个原子类型读写操作从一组指令，最小化到单个 CPU 指令`。例如：

```c++
std::atomic<int> counter;
```

并为`整数`或`浮点数`的`原子类型`提供了`基本的数值成员函数`，举例来说，包括 `fetch_add`, `fetch_sub` 等，同时通过重载方便的提供了对应的 `+`，`-` 版本。比如下面的例子：

```c++
#include <atomic>
#include <thread>
#include <iostream>

std::atomic<int> count = {0};

int main() {
    std::thread t1([](){
        count.fetch_add(1);
    });
    std::thread t2([](){
        count++;        // 等价于 fetch_add
        count += 1;     // 等价于 fetch_add
    });
    t1.join();
    t2.join();
    std::cout << count << std::endl;
    return 0;
}
```

当然，并非所有的类型都能提供`原子操作`，这是因为`原子操作`的可行性取决于具体的 `CPU` 架构，以及`所实例化的类型结构是否能够满足该 CPU 架构对内存对齐条件的要求`，因而我们总是可以通过 `std::atomic<T>::is_lock_free` 来`检查该原子类型是否需支持原子操作`，例如：

```c++
#include <atomic>
#include <iostream>

struct A {
    float x;
    int y;
    long long z;
};

int main() {
    std::atomic<A> a;
    std::cout << std::boolalpha << a.is_lock_free() << std::endl;
    return 0;
}
```

##### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/7/
```

2. 创建 `7.6.atomic.cpp` 文件，粘贴下面代码。

```c++
// 7.6.atomic.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <atomic>
#include <thread>
#include <iostream>

std::atomic<int> count = {0};

int main() {
        std::thread t1([](){
                count.fetch_add(1);
        });
        std::thread t2([](){
                count++;        // identical to fetch_add
                count += 1;     // identical to fetch_add
        });
        t1.join();
        t2.join();
        std::cout << count << std::endl;
        return 0;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ tree
.
├── 7.1.thread.basic.cpp
├── 7.2.critical.section.a.cpp
├── 7.3.critical.section.b.cpp
├── 7.4.futures.cpp
├── 7.5.producer.consumer.cpp
├── 7.6.atomic.cpp
├── 7.6.bad.example.cpp
└── Makefile

0 directories, 8 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ls
7.1.thread.basic.cpp        7.5.producer.consumer.cpp
7.2.critical.section.a.cpp  7.6.atomic.cpp
7.3.critical.section.b.cpp  7.6.bad.example.cpp
7.4.futures.cpp             Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ make
clang++ 7.1.thread.basic.cpp -o 7.1.thread.basic.out -std=c++2a -pedantic
clang++ 7.2.critical.section.a.cpp -o 7.2.critical.section.a.out -std=c++2a -pedantic
clang++ 7.3.critical.section.b.cpp -o 7.3.critical.section.b.out -std=c++2a -pedantic
clang++ 7.4.futures.cpp -o 7.4.futures.out -std=c++2a -pedantic
clang++ 7.5.producer.consumer.cpp -o 7.5.producer.consumer.out -std=c++2a -pedantic
clang++ 7.6.atomic.cpp -o 7.6.atomic.out -std=c++2a -pedantic
clang++ 7.6.bad.example.cpp -o 7.6.bad.example.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ls
7.1.thread.basic.cpp        7.5.producer.consumer.cpp
7.1.thread.basic.out        7.5.producer.consumer.out
7.2.critical.section.a.cpp  7.6.atomic.cpp
7.2.critical.section.a.out  7.6.atomic.out
7.3.critical.section.b.cpp  7.6.bad.example.cpp
7.3.critical.section.b.out  7.6.bad.example.out
7.4.futures.cpp             Makefile
7.4.futures.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ./7.6.atomic.out
3

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ls
7.1.thread.basic.cpp        7.5.producer.consumer.cpp
7.2.critical.section.a.cpp  7.6.atomic.cpp
7.3.critical.section.b.cpp  7.6.bad.example.cpp
7.4.futures.cpp             Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$
```

#### 一致性模型

并行执行的多个线程，从某种宏观层面上讨论，可以粗略的视为一种`分布式系统`。在分布式系统中，`任何通信乃至本地操作都需要消耗一定时间，甚至出现不可靠的通信`。

如果我们强行将一个变量 `v` 在多个线程之间的操作设为`原子操作`，即任何一个线程在操作完 `v` 后，其他线程均能同步感知到 `v` 的变化，则对于变量 `v` 而言，表现为`顺序执行`的程序，它并没有由于引入多线程而得到任何效率上的收益。对此有什么办法能够适当的加速呢？`答案便是削弱原子操作的在进程间的同步条件`。

从原理上看，每个线程可以对应为一个集群节点，而线程间的通信也几乎等价于集群节点间的通信。削弱进程间的同步条件，通常我们会考虑四种不同的`一致性模型`：

**1.** `线性一致性`：又称`强一致性`或`原子一致性`。`它要求任何一次读操作都能读到某个数据的最近一次写的数据，并且所有线程的操作顺序与全局时钟下的顺序是一致的`。

```
        x.store(1)      x.load()
T1 ---------+----------------+------>


T2 -------------------+------------->
                x.store(2)
```

在这种情况下线程 `T1`, `T2` 对 `x` 的`两次写操作是原子的`，且 `x.store(1)` 是严格的发生在 `x.store(2)` 之前，`x.store(2)` 严格的发生在 `x.load()` 之前。值得一提的是，`线性一致性对全局时钟的要求是难以实现的`，这也是人们不断研究比这个一致性更弱条件下其他一致性的算法的原因。

**2.** `顺序一致性`：`同样要求任何一次读操作都能读到数据最近一次写入的数据，但未要求与全局时钟的顺序一致`。

```
        x.store(1)  x.store(3)   x.load()
T1 ---------+-----------+----------+----->


T2 ---------------+---------------------->
              x.store(2)

或者

        x.store(1)  x.store(3)   x.load()
T1 ---------+-----------+----------+----->


T2 ------+------------------------------->
      x.store(2)
```

在`顺序一致性`的要求下，`x.load()` 必须读到最近一次写入的数据，因此 `x.store(2)` 与 `x.store(1)` 并无任何先后保障，即 只要 `T2` 的 `x.store(2)` 发生在 `x.store(3)` 之前即可。

**3.** `因果一致性`：它的要求进一步降低，`只需要有因果关系的操作顺序得到保障，而非因果关系的操作顺序则不做要求`。

```
      a = 1      b = 2
T1 ----+-----------+---------------------------->


T2 ------+--------------------+--------+-------->
      x.store(3)         c = a + b    y.load()

或者

      a = 1      b = 2
T1 ----+-----------+---------------------------->


T2 ------+--------------------+--------+-------->
      x.store(3)          y.load()   c = a + b

亦或者

     b = 2       a = 1
T1 ----+-----------+---------------------------->


T2 ------+--------------------+--------+-------->
      y.load()            c = a + b  x.store(3)
```

上面给出的三种例子都是属于因果一致的，因为整个过程中，只有 `c` 对 `a` 和 `b` 产生依赖，而 `x` 和 `y` 在此例子中表现为没有关系（但实际情况中我们需要更详细的信息才能确定 `x` 与 `y` 确实无关）。

**4.** `最终一致性`：是`最弱的一致性要求`，`它只保障某个操作在未来的某个时间节点上会被观察到，但并未要求被观察到的时间`。因此我们甚至可以对此条件稍作加强，例如`规定某个操作被观察到的时间总是有界的`。当然这已经不在我们的讨论范围之内了。

```
    x.store(3)  x.store(4)
T1 ----+-----------+-------------------------------------------->


T2 ---------+------------+--------------------+--------+-------->
         x.read      x.read()           x.read()   x.read()
```

在上面的情况中，如果我们假设 `x` 的初始值为 `0`，则 `T2` 中四次 `x.read()` 结果可能但不限于以下情况：

```
3 4 4 4 // x 的写操作被很快观察到
0 3 3 4 // x 的写操作被观察到的时间存在一定延迟
0 0 0 4 // 最后一次读操作读到了 x 的最终值，但此前的变化并未观察到
0 0 0 0 // 在当前时间段内 x 的写操作均未被观察到，
        // 但未来某个时间点上一定能观察到 x 为 4 的情况
```

#### 内存顺序

为了追求极致的性能，实现各种强度要求的一致性，`C++11` 为原子操作定义了六种不同的内存顺序 `std::memory_order` 的选项，表达了四种多线程间的同步模型：

**1.** `宽松模型`：在此模型下，`单个线程内的原子操作都是顺序执行的，不允许指令重排，但不同线程间原子操作的顺序是任意的`。类型通过 `std::memory_order_relaxed` 指定。我们来看一个例子：

```c++
std::atomic<int> counter = {0};
std::vector<std::thread> vt;
for (int i = 0; i < 100; ++i) {
    vt.emplace_back([&](){
        counter.fetch_add(1, std::memory_order_relaxed);
    });
}

for (auto& t : vt) {
    t.join();
}
std::cout << "current counter:" << counter << std::endl;
```

**2.** `释放/消费模型`：在此模型中，我们开始限制进程间的操作顺序，`如果某个线程需要修改某个值，但另一个线程会对该值的某次操作产生依赖，即后者依赖前者`。具体而言，线程 `A` 完成了三次对 `x` 的写操作，线程 `B` 仅依赖其中第三次 `x` 的写操作，与 `x` 的前两次写行为无关，则当 `A` 主动 `x.release()` 时候（即使用 `std::memory_order_release`），选项 `std::memory_order_consume` 能够确保 `B` 在调用 `x.load()` 时候观察到 `A` 中`第三次`对 `x` 的写操作。我们来看一个例子：

```c++
// 初始化为 nullptr 防止 consumer 线程从野指针进行读取
std::atomic<int*> ptr(nullptr);
int v;
std::thread producer([&]() {
    int* p = new int(42);
    v = 1024;
    ptr.store(p, std::memory_order_release);
});
std::thread consumer([&]() {
    int* p;
    while(!(p = ptr.load(std::memory_order_consume)));

    std::cout << "p: " << *p << std::endl;
    std::cout << "v: " << v << std::endl;
});
producer.join();
consumer.join();
```

**3.** `释放/获取模型`：在此模型下，我们可以进一步加紧对不同线程间原子操作的顺序的限制，在释放 `std::memory_order_release` 和获取 `std::memory_order_acquire` 之间`规定时序`，即`发生在释放（release）操作之前的所有写操作，对其他线程的任何获取（acquire）操作都是可见的`，亦即`发生顺序`（`happens-before`）。

可以看到，`std::memory_order_release` 确保了它之前的写操作不会发生在释放操作之后，是一个`向后的屏障`（backward），而 `std::memory_order_acquire` 确保了它之前的写行为不会发生在该获取操作之后，是一个`向前的屏障`（forward）。对于选项 `std::memory_order_acq_rel` 而言，则结合了这两者的特点，唯一确定了一个`内存屏障`，`使得当前线程对内存的读写不会被重排并越过此操作的前后`。

我们来看一个例子：

```c++
std::vector<int> v;
std::atomic<int> flag = {0};
std::thread release([&]() {
    v.push_back(42);
    flag.store(1, std::memory_order_release);
});
std::thread acqrel([&]() {
    int expected = 1; // must before compare_exchange_strong
    while(!flag.compare_exchange_strong(expected, 2, std::memory_order_acq_rel))
        expected = 1; // must after compare_exchange_strong
    // flag has changed to 2
});
std::thread acquire([&]() {
    while(flag.load(std::memory_order_acquire) < 2);

    std::cout << v.at(0) << std::endl; // must be 42
});
release.join();
acqrel.join();
acquire.join();
```

在此例中我们使用了 `compare_exchange_strong` 比较交换原语（Compare-and-swap primitive），它有一个更弱的版本，即 `compare_exchange_weak`，它允许即便交换成功，也仍然返回 `false` 失败。其原因是因为在某些平台上虚假故障导致的，具体而言，`当 CPU 进行上下文切换时，另一线程加载同一地址产生的不一致`。除此之外，`compare_exchange_strong` 的性能可能稍差于 `compare_exchange_weak`，但大部分情况下，鉴于其使用的复杂度而言，`compare_exchange_weak` 应该被有限考虑。

**4.** `顺序一致模型`：在此模型下，`原子操作满足顺序一致性，进而可能对性能产生损耗`。可显式的通过 `std::memory_order_seq_cst` 进行指定。最后来看一个例子：

```c++
std::atomic<int> counter = {0};
std::vector<std::thread> vt;
for (int i = 0; i < 100; ++i) {
    vt.emplace_back([&](){
        counter.fetch_add(1, std::memory_order_seq_cst);
    });
}

for (auto& t : vt) {
    t.join();
}
std::cout << "current counter:" << counter << std::endl;
```

这个例子与第一个宽松模型的例子本质上没有区别，仅仅只是将原子操作的内存顺序修改为了 `memory_order_seq_cst`，有兴趣的读者可以自行编写程序测量这两种不同内存顺序导致的性能差异。

##### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/7/
```

2. 创建 `7.8.memory.order.cpp` 文件，粘贴下面代码。

```c++
// 7.8.memory.order.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <atomic>
#include <thread>
#include <vector>
#include <iostream>

using namespace std;
using namespace std::chrono;

const int N = 10000;

void relaxed_order() {
        cout << "relaxed_order: " << endl;

        atomic<int> counter = {0};
        vector<thread> vt;
        for (int i = 0; i < N; ++i) {
                vt.emplace_back([&](){
                        counter.fetch_add(1, memory_order_relaxed);
                });
        }
        auto t1 = high_resolution_clock::now();
        for (auto& t : vt) {
                t.join();
        }
        auto t2 = high_resolution_clock::now();
        auto duration = ( t2 - t1 ).count();
        cout << "relaxed order speed: " << duration / N << "ns" << endl;
}

void release_consume_order() {
        cout << "release_consume_order: " << endl;

        atomic<int*> ptr;
        int v;
        thread producer([&]() {
                int* p = new int(42);
                v = 1024;
                ptr.store(p, memory_order_release);
        });
        thread consumer([&]() {
                int* p;
                while(!(p = ptr.load(memory_order_consume)));

                cout << "p: " << *p << endl;
                cout << "v: " << v << endl;
        });
        producer.join();
        consumer.join();
}

void release_acquire_order() {
        cout << "release_acquire_order: " << endl;

        int v;
        atomic<int> flag = {0};
        thread release([&]() {
                v = 42;
                flag.store(1, memory_order_release);
        });
        thread acqrel([&]() {
                int expected = 1; // must before compare_exchange_strong
                while(!flag.compare_exchange_strong(expected, 2, memory_order_acq_rel)) {
                        expected = 1; // must after compare_exchange_strong
                }
                // flag has changed to 2
        });
        thread acquire([&]() {
                while(flag.load(memory_order_acquire) < 2);

                cout << "v: " << v << endl; // must be 42
        });
        release.join();
        acqrel.join();
        acquire.join();
}

void sequential_consistent_order() {
        cout << "sequential_consistent_order: " << endl;

        atomic<int> counter = {0};
        vector<thread> vt;
        for (int i = 0; i < N; ++i) {
                vt.emplace_back([&](){
                        counter.fetch_add(1, memory_order_seq_cst);
                });
        }
        auto t1 = high_resolution_clock::now();
        for (auto& t : vt) {
                t.join();
        }
        auto t2 = high_resolution_clock::now();
        auto duration = ( t2 - t1 ).count();
        cout << "sequential consistent speed: " << duration / N << "ns" << endl;
}

int main() {
        relaxed_order();
        release_consume_order();
        release_acquire_order();
        sequential_consistent_order();
        return 0;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ tree
.
├── 7.1.thread.basic.cpp
├── 7.2.critical.section.a.cpp
├── 7.3.critical.section.b.cpp
├── 7.4.futures.cpp
├── 7.5.producer.consumer.cpp
├── 7.6.atomic.cpp
├── 7.6.bad.example.cpp
├── 7.8.memory.order.cpp
└── Makefile

0 directories, 9 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ls
7.1.thread.basic.cpp        7.4.futures.cpp            7.6.bad.example.cpp
7.2.critical.section.a.cpp  7.5.producer.consumer.cpp  7.8.memory.order.cpp
7.3.critical.section.b.cpp  7.6.atomic.cpp             Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ make
clang++ 7.1.thread.basic.cpp -o 7.1.thread.basic.out -std=c++2a -pedantic
clang++ 7.2.critical.section.a.cpp -o 7.2.critical.section.a.out -std=c++2a -pedantic
clang++ 7.3.critical.section.b.cpp -o 7.3.critical.section.b.out -std=c++2a -pedantic
clang++ 7.4.futures.cpp -o 7.4.futures.out -std=c++2a -pedantic
clang++ 7.5.producer.consumer.cpp -o 7.5.producer.consumer.out -std=c++2a -pedantic
clang++ 7.6.atomic.cpp -o 7.6.atomic.out -std=c++2a -pedantic
clang++ 7.6.bad.example.cpp -o 7.6.bad.example.out -std=c++2a -pedantic
clang++ 7.8.memory.order.cpp -o 7.8.memory.order.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ls
7.1.thread.basic.cpp        7.4.futures.cpp            7.6.bad.example.cpp
7.1.thread.basic.out        7.4.futures.out            7.6.bad.example.out
7.2.critical.section.a.cpp  7.5.producer.consumer.cpp  7.8.memory.order.cpp
7.2.critical.section.a.out  7.5.producer.consumer.out  7.8.memory.order.out
7.3.critical.section.b.cpp  7.6.atomic.cpp             Makefile
7.3.critical.section.b.out  7.6.atomic.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ./7.8.memory.order.out
relaxed_order:
relaxed order speed: 11489ns
release_consume_order:
p: 42
v: 1024
release_acquire_order:
v: 42
sequential_consistent_order:
sequential consistent speed: 23720ns

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$ ls
7.1.thread.basic.cpp        7.4.futures.cpp            7.6.bad.example.cpp
7.2.critical.section.a.cpp  7.5.producer.consumer.cpp  7.8.memory.order.cpp
7.3.critical.section.b.cpp  7.6.atomic.cpp             Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/7
$
```

### 总结

`C++11` 语言层提供了`并发编程`的相关支持，本节简单的介绍了 `std::thread`, `std::mutex`, `std::future` 这些`并发编程`中不可回避的重要工具。除此之外，我们还介绍了 `C++11` 最重要的几个特性之一的`内存模型`，它们为 `C++` 在`标准化高性能计算`中提供了重要的基础。

### 习题

1. 请编写一个简单的线程池，提供如下功能：

```c++
ThreadPool p(4); // 指定四个工作线程

// 将任务在池中入队，并返回一个 std::future
auto f = pool.enqueue([](int life) {
    return meaning;
}, 42);

// 从 future 中获得执行结果
std::cout << f.get() << std::endl;
```

#### Files

1. 运行开始菜单的 “MSYS2 MinGW x64”，运行下面命令构建项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/
mkdir 7
cd 7/
mkdir 7.1
cd 7.1/
```

2. 创建 `CMakeLists.txt` 文件，粘贴下面代码。

```cmake
# CMakeLists.txt
# created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

# Set the minimum version of CMake that can be used
# To find the cmake version run
# $ cmake --version
cmake_minimum_required(VERSION 3.5)

# Set the project name
project(thread_pool)

# Create a sources variable with a link to all cpp files to compile
file(GLOB SOURCES "src/*.cpp")

# Add an executable with the above sources
add_executable(thread_pool ${SOURCES})

# Set the directories that should be included in the build command for this target
# when running g++ these will be included as -I/directory/path/
target_include_directories(thread_pool
        PRIVATE
        ${PROJECT_SOURCE_DIR}/include
        )
```

3. 创建 `include/thread_pool.hpp` 文件，粘贴下面代码。

```c++
// thread_pool.hpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#ifndef THREAD_POOL_H
#define THREAD_POOL_H

#include <vector>               // std::vector
#include <queue>                // std::queue
#include <memory>               // std::make_shared

#include <thread>               // std::thread
#include <mutex>                // std::mutex, std::unique_lock
#include <condition_variable>   // std::condition_variable
#include <future>               // std::future, std::packaged_task

#include <functional>           // std::function, std::bind
#include <stdexcept>            // std::runtime_error
#include <utility>              // std::move, std::forward

class ThreadPool {
public:

    // initialize the number of concurrency threads
    ThreadPool(size_t);

    // enqueue new thread task
    template<class F, class... Args>
    decltype(auto) enqueue(F&& f, Args&&... args);

    // destroy thread pool and all created threads
    ~ThreadPool();
private:

    // thread list, stores all threads
    std::vector< std::thread > workers;
    // queue task, the type of queue elements are functions with void return type
    std::queue< std::function<void()> > tasks;

    // for synchonization
    std::mutex queue_mutex;
    // std::condition_variable is a new feature from c++11,
    // it's a synchronization primitives. it can be used
    // to block a thread or threads at the same time until
    // all of them modified condition_variable.
    std::condition_variable condition;
    bool stop;
};

// constructor initialize a fixed size of worker
inline ThreadPool::ThreadPool(size_t threads): stop(false) {
    // initialize worker
    for(size_t i = 0;i<threads;++i)
        // std::vector::emplace_back :
        //    append to the end of vector container
        //    this element will be constructed at the end of container, without copy and move behavior
        workers.emplace_back([this] { // the lambda express capture this, i.e. the instance of thread pool
                // avoid fake awake
                for(;;) {
                    // define function task container, return type is void
                    std::function<void()> task;

                    // critical section
                    {
                        // get mutex
                        std::unique_lock<std::mutex> lock(this->queue_mutex);

                        // block current thread
                        this->condition.wait(lock,
                            [this]{ return this->stop || !this->tasks.empty(); });

                        // return if queue empty and task finished
                        if(this->stop && this->tasks.empty())
                            return;

                        // otherwise execute the first element of queue
                        task = std::move(this->tasks.front());
                        this->tasks.pop();
                    }

                    // execution
                    task();
                }
            }
        );
}

// Enqueue a new thread
// use variadic templates and tail return type
template<class F, class... Args>
decltype(auto) ThreadPool::enqueue(F&& f, Args&&... args) {
    // deduce return type
    using return_type = typename std::result_of<F(Args...)>::type;

    // fetch task
    auto task = std::make_shared<std::packaged_task<return_type()>>(
        std::bind(std::forward<F>(f), std::forward<Args>(args)...)
    );

    std::future<return_type> res = task->get_future();

    // critical section
    {
        std::unique_lock<std::mutex> lock(queue_mutex);

        // avoid add new thread if theadpool is destroyed
        if(stop)
            throw std::runtime_error("enqueue on stopped ThreadPool");

        // add thread to queue
        tasks.emplace([task]{ (*task)(); });
    }

    // notify a wait thread
    condition.notify_one();
    return res;
}

// destroy everything
inline ThreadPool::~ThreadPool()
{
    // critical section
    {
        std::unique_lock<std::mutex> lock(queue_mutex);
        stop = true;
    }

    // wake up all threads
    condition.notify_all();

    // let all processes into synchronous execution, use c++11 new for-loop: for(value:values)
    for(std::thread &worker: workers)
        worker.join();
}

#endif
```

4. 创建 `src/main.cpp` 文件，粘贴下面代码。

```c++
// main.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream> // std::cout, std::endl

#include <vector>   // std::vector
#include <string>   // std::string
#include <future>   // std::future
#include <thread>   // std::this_thread::sleep_for
#include <chrono>   // std::chrono::seconds

#include "thread_pool.hpp"

int main()
{
    // create a thread pool with max. 4 concurrency threads
    ThreadPool pool(4);
    // create execution results list
    std::vector< std::future<std::string> > results;

    // start eight thread task
    for(int i = 0; i < 8; ++i) {
        // add all task to result list
        results.emplace_back(
            // ass print task to thread pool
            pool.enqueue([i] {
                std::cout << "hello " << i << std::endl;
                // wait a sec when the previous line is out
                std::this_thread::sleep_for(std::chrono::seconds(1));
                // keep output and return the status of execution
                std::cout << "world " << i << std::endl;
                return std::string("---thread ") + std::to_string(i) + std::string(" finished.---");
            })
        );
    }

    // outputs
    for(auto && result: results)
        std::cout << result.get() << ' ';
    std::cout << std::endl;

    return 0;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/7/7.1
$ tree
.
├── CMakeLists.txt
├── include
│   └── thread_pool.hpp
└── src
    └── main.cpp

2 directories, 3 files
```

---

该线程池代码使用`MSYS2 MinGW x64` 的 `g++` 作为编译器。详细安装方法可以参考 [GCC on Windows-windows10](../175786877)。

安装 `Mingw-w64 toolset`。

```shell
pacman -S --needed base-devel mingw-w64-x86_64-toolchain
```

---

该线程池代码使用 `CMake` 来构建可执行程序，关于 `CMake` 的语法和安装可以参考 [CMake Examples 学习笔记-windows10](../2876445371) 和 [Using CMake in MSYS2](https://www.msys2.org/docs/cmake/)。

运行开始菜单的 “MSYS2 MSYS”。安装 `CMake`。

```shell
pacman -S mingw-w64-x86_64-cmake
pacman -S make
```

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/7/7.1
$ which make
/usr/bin/make

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/7/7.1
$ which cmake
/mingw64/bin/cmake

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/7/7.1
```

---

{% label 外部构建 pink %}

```shell
lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/7/7.1
$ ls
CMakeLists.txt  include  src

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/7/7.1
$ mkdir build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/7/7.1
$ cd build/

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/7/7.1/build
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
-- Build files have been written to: F:/vscode/cpp_projects/modern-cpp-tutorial/exercises/7/7.1/build

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/7/7.1/build
$ make
[ 50%] Building CXX object CMakeFiles/thread_pool.dir/src/main.cpp.obj
[100%] Linking CXX executable thread_pool.exe
[100%] Built target thread_pool

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/7/7.1/build
$ ls
cmake_install.cmake  CMakeCache.txt  CMakeFiles  Makefile  thread_pool.exe

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/7/7.1/build
$ ./thread_pool.exe
hello hello 1hello 3

0
hello 2
world 3
world 2
world 0
hello 5
world 1
hello 6
---thread 0 finished.--- hello 7
hello 4
---thread 1 finished.--- ---thread 2 finished.--- ---thread 3 finished.--- world world 5
6
world world 4
7
---thread 4 finished.--- ---thread 5 finished.--- ---thread 6 finished.--- ---thread 7 finished.---

lyf@DESKTOP-GV2QHKN MINGW64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/7/7.1/build
$
```

2. 请使用 `std::atomic<bool>` 实现一个互斥锁。

#### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/7/
```

2. 创建 `7.2.mutex.cpp` 文件，粘贴下面代码。

```c++
// 7.2.mutex.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <atomic>
#include <thread>
#include <iostream>

class mutex {
        std::atomic<bool> flag{false};

public:
        void lock()
        {
                while (flag.exchange(true, std::memory_order_relaxed));
                std::atomic_thread_fence(std::memory_order_acquire);
        }

        void unlock()
        {
                std::atomic_thread_fence(std::memory_order_release);
                flag.store(false, std::memory_order_relaxed);
        }
};

int a = 0;

int main() {

        mutex mtx_a;

        std::thread t1([&](){
                mtx_a.lock();
                a += 1;
                mtx_a.unlock();
        });
        std::thread t2([&](){
                mtx_a.lock();
                a += 2;
                mtx_a.unlock();
        });

        t1.join();
        t2.join();

        std::cout << a << std::endl;

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
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/7
$ tree
.
├── 7.1
│   ├── build
│   │   ├── cmake_install.cmake
│   │   ├── CMakeCache.txt
│   │   ├── CMakeFiles
│   │   │   ├── 3.23.2
│   │   │   │   ├── CMakeCCompiler.cmake
│   │   │   │   ├── CMakeCXXCompiler.cmake
│   │   │   │   ├── CMakeDetermineCompilerABI_C.bin
│   │   │   │   ├── CMakeDetermineCompilerABI_CXX.bin
│   │   │   │   ├── CMakeRCCompiler.cmake
│   │   │   │   ├── CMakeSystem.cmake
│   │   │   │   ├── CompilerIdC
│   │   │   │   │   ├── a.exe
│   │   │   │   │   ├── CMakeCCompilerId.c
│   │   │   │   │   └── tmp
│   │   │   │   └── CompilerIdCXX
│   │   │   │       ├── a.exe
│   │   │   │       ├── CMakeCXXCompilerId.cpp
│   │   │   │       └── tmp
│   │   │   ├── cmake.check_cache
│   │   │   ├── CMakeDirectoryInformation.cmake
│   │   │   ├── CMakeOutput.log
│   │   │   ├── CMakeTmp
│   │   │   ├── Makefile.cmake
│   │   │   ├── Makefile2
│   │   │   ├── progress.marks
│   │   │   ├── TargetDirectories.txt
│   │   │   └── thread_pool.dir
│   │   │       ├── build.make
│   │   │       ├── cmake_clean.cmake
│   │   │       ├── compiler_depend.make
│   │   │       ├── compiler_depend.ts
│   │   │       ├── depend.make
│   │   │       ├── DependInfo.cmake
│   │   │       ├── flags.make
│   │   │       ├── objects.a
│   │   │       ├── progress.make
│   │   │       └── src
│   │   └── Makefile
│   ├── CMakeLists.txt
│   ├── include
│   │   └── thread_pool.hpp
│   └── src
│       └── main.cpp
├── 7.2.mutex.cpp
└── Makefile

13 directories, 34 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/7
$ ls
7.1  7.2.mutex.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/7
$ make
clang++ 7.2.mutex.cpp -o 7.2.mutex.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/7
$ ls
7.1  7.2.mutex.cpp  7.2.mutex.out  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/7
$ ./7.2.mutex.out
3

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/7
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/7
$ ls
7.1  7.2.mutex.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/exercises/7
$
```

### 进一步阅读的参考资料

1. [C++ 并发编程(中文版)](https://book.douban.com/subject/26386925/)

2. [线程支持库文档](https://en.cppreference.com/w/cpp/thread)

3. Herlihy, M. P., & Wing, J. M. (1990). Linearizability: a correctness condition for concurrent objects. ACM Transactions on Programming Languages and Systems, 12(3), 463–492. https://doi.org/10.1145/78969.78972

## 第 8 章 文件系统

`文件系统库`提供了`文件系统`、`路径`、`常规文件`、`目录`等等相关组件进行操作的相关功能。和`正则表达式库`类似，他也是最先由 `boost` 发起，并最终被合并为 `C++` 标准的众多库之一。

### 文档与链接

TODO:

### std::filesystem

TODO:

## 第 9 章 其他杂项

### 新类型

#### long long int

`long long int` 并不是 `C++11` 最先引入的，其实早在 `C99`，`long long int` 就已经被纳入 `C` 标准中，所以大部分的编译器早已支持。`C++11` 的工作则是正式把它纳入标准库，`规定了一个 long long int 类型至少具备 64 位的比特数`。

### noexcept 的修饰和操作

`C++` 相比于 `C` 的一大优势就在于 `C++` 本身就定义了一套完整的`异常处理机制`。然而在 `C++11` 之前，几乎没有人去使用在函数名后书写异常声明表达式，从 `C++11` 开始，这套机制被弃用，所以我们不去讨论也不去介绍以前这套机制是如何工作如何使用，你更不应该主动去了解它。

`C++11` 将异常的声明简化为以下两种情况：

1. 函数可能抛出任何异常。

2. 函数不能抛出任何异常。

并使用 `noexcept` 对这两种行为进行限制，例如：

```c++
void may_throw(); // 可能抛出异常
void no_throw() noexcept; // 不可能抛出异常
```

使用 `noexcept` 修饰过的函数如果抛出异常，编译器会使用 `std::terminate()` 来立即终止程序运行。

`noexcept` 还能够做操作符，用于操作一个表达式，`当表达式无异常时，返回 true，否则返回 false`。

```c++
#include <iostream>
void may_throw() {
    throw true;
}
auto non_block_throw = []{
    may_throw();
};
void no_throw() noexcept {
    return;
}

auto block_throw = []() noexcept {
    no_throw();
};
int main()
{
    std::cout << std::boolalpha
        << "may_throw() noexcept? " << noexcept(may_throw()) << std::endl
        << "no_throw() noexcept? " << noexcept(no_throw()) << std::endl
        << "lmay_throw() noexcept? " << noexcept(non_block_throw()) << std::endl
        << "lno_throw() noexcept? " << noexcept(block_throw()) << std::endl;
    return 0;
}
```

`noexcept` 修饰完一个函数之后`能够起到封锁异常扩散的功效`，`如果内部产生异常，外部也不会触发`。例如：

```c++
try {
    may_throw();
} catch (...) {
    std::cout << "捕获异常, 来自 may_throw()" << std::endl;
}
try {
    non_block_throw();
} catch (...) {
    std::cout << "捕获异常, 来自 non_block_throw()" << std::endl;
}
try {
    block_throw();
} catch (...) {
    std::cout << "捕获异常, 来自 block_throw()" << std::endl;
}
```

最终输出为：

```shell
捕获异常, 来自 may_throw()
捕获异常, 来自 non_block_throw()
```

#### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令构建项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/
mkdir 9
cd 9/
```

2. 创建 `9.1.noexcept.cpp` 文件，粘贴下面代码。

```c++
// 9.1.noexcept.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>

void may_throw() {
        throw true;
}

auto non_block_throw = []{
        may_throw();
};

void no_throw() noexcept {
        return;
}

auto block_throw = []() noexcept {
        no_throw();
};

int main()
{
        std::cout << std::boolalpha
                << "may_throw() noexcept? " << noexcept(may_throw()) << std::endl
                << "no_throw() noexcept? " << noexcept(no_throw()) << std::endl
                << "lmay_throw() noexcept? " << noexcept(non_block_throw()) << std::endl
                << "lno_throw() noexcept? " << noexcept(block_throw()) << std::endl;

        try {
                may_throw();
        } catch (...) {
                std::cout << "exception captured from my_throw()" << std::endl;
        }

        try {
                non_block_throw();
        } catch (...) {
                std::cout << "exception captured from non_block_throw()" << std::endl;
        }

        try {
                block_throw();
        } catch (...) {
                std::cout << "exception captured from block_throw()" << std::endl;
        }
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
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$ tree
.
├── 9.1.noexcept.cpp
└── Makefile

0 directories, 2 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$ ls
9.1.noexcept.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$ make
clang++ 9.1.noexcept.cpp -o 9.1.noexcept.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$ ls
9.1.noexcept.cpp  9.1.noexcept.out  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$ ./9.1.noexcept.out
may_throw() noexcept? false
no_throw() noexcept? true
lmay_throw() noexcept? false
lno_throw() noexcept? true
exception captured from my_throw()
exception captured from non_block_throw()

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$ ls
9.1.noexcept.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$
```

### 字面量

#### 原始字符串字面量

`传统 C++` 里面要编写一个充满特殊字符的字符串其实是非常痛苦的一件事情，比如一个包含 `HTML` 本体的字符串需要添加大量的`转义符`，例如一个 `Windows` 上的文件路径经常会：`C:\\File\\To\\Path`。

`C++11` 提供了`原始字符串字面量`的写法，可以在一个字符串前方使用 `R` 来修饰这个字符串，同时，`将原始字符串使用括号包裹`，例如：

```c++
#include <iostream>
#include <string>

int main() {
    std::string str = R"(C:\File\To\Path)";
    std::cout << str << std::endl;
    return 0;
}
```

#### 自定义字面量

`C++11` 引进了`自定义字面量`的能力，通过`重载双引号后缀运算符`实现：

```c++
// 字符串字面量自定义必须设置如下的参数列表
std::string operator"" _wow1(const char *wow1, size_t len) {
    return std::string(wow1)+"woooooooooow, amazing";
}

std::string operator"" _wow2 (unsigned long long i) {
    return std::to_string(i)+"woooooooooow, amazing";
}

int main() {
    auto str = "abc"_wow1;
    auto num = 1_wow2;
    std::cout << str << std::endl;
    std::cout << num << std::endl;
    return 0;
}
```

`自定义字面量`支持四种字面量：

1. `整型字面量`：重载时必须使用 `unsigned long long`、`const char *`、`模板字面量算符`参数，在上面的代码中使用的是前者；

2. `浮点型字面量`：重载时必须使用 `long double`、`const char *`、`模板字面量算符`；

3. `字符串字面量`：必须使用 `(const char *, size_t)` 形式的参数表；

4. `字符字面量`：参数只能是 `char`, `wchar_t`, `char16_t`, `char32_t` 这几种类型。

#### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/9/
```

2. 创建 `9.2.literals.cpp` 文件，粘贴下面代码。

```c++
// 9.2.literals.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>
#include <string>

std::string operator"" _wow1(const char *wow1, size_t len) {
        return std::string(wow1)+"woooooooooow, amazing";
}

std::string operator"" _wow2(unsigned long long i) {
        return std::to_string(i)+"woooooooooow, amazing";
}

int main() {
        std::string str = R"(C:\File\To\Path)";
        std::cout << str << std::endl;

        int value = 0b1001010101010;
        std::cout << value << std::endl;

        auto str2 = "abc"_wow1;
        auto num = 1_wow2;
        std::cout << str2 << std::endl;
        std::cout << num << std::endl;

        return 0;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$ tree
.
├── 9.1.noexcept.cpp
├── 9.2.literals.cpp
└── Makefile

0 directories, 3 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$ ls
9.1.noexcept.cpp  9.2.literals.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$ make
clang++ 9.1.noexcept.cpp -o 9.1.noexcept.out -std=c++2a -pedantic
clang++ 9.2.literals.cpp -o 9.2.literals.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$ ls
9.1.noexcept.cpp  9.2.literals.cpp  Makefile
9.1.noexcept.out  9.2.literals.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$ ./9.2.literals.out
C:\File\To\Path
4778
abcwoooooooooow, amazing
1woooooooooow, amazing

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$ ls
9.1.noexcept.cpp  9.2.literals.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$
```

### 内存对齐

`C++11` 引入了两个新的关键字 `alignof` 和 `alignas` 来支持对`内存对齐`进行控制。`alignof` 关键字能够获得一个与平台相关的 `std::size_t` 类型的值，`用于查询该平台的对齐方式`。当然我们有时候并不满足于此，甚至希望自定定义结构的对齐方式，同样，`C++11` 还引入了 `alignas` 来重新修饰某个结构的对齐方式。我们来看两个例子：

```c++
#include <iostream>

struct Storage {
    char      a;
    int       b;
    double    c;
    long long d;
};

struct alignas(std::max_align_t) AlignasStorage {
    char      a;
    int       b;
    double    c;
    long long d;
};

int main() {
    std::cout << alignof(Storage) << std::endl;
    std::cout << alignof(AlignasStorage) << std::endl;
    return 0;
}
```

其中 `std::max_align_t` 要求每个标量类型的对齐方式严格一样，因此它几乎是最大标量没有差异，进而大部分平台上得到的结果为 `long double`，因此我们这里得到的 `AlignasStorage` 的对齐要求是 `8` 或 `16`。

#### Files

1. 运行开始菜单的 “MSYS2 MinGW Clang x64”，运行下面命令进入项目目录。

```shell
cd /f/vscode/cpp_projects/modern-cpp-tutorial/code/9/
```

2. 创建 `9.3.alignment.cpp` 文件，粘贴下面代码。

```c++
// 9.3.alignment.cpp
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>

#include <iostream>

struct Storage {
        char      a;
        int       b;
        double    c;
        long long d;
};

struct alignas(std::max_align_t) AlignasStorage {
        char      a;
        int       b;
        double    c;
        long long d;
};

int main() {
        std::cout << alignof(Storage) << std::endl;
        std::cout << alignof(AlignasStorage) << std::endl;

        return 0;
}
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$ tree
.
├── 9.1.noexcept.cpp
├── 9.2.literals.cpp
├── 9.3.alignment.cpp
└── Makefile

0 directories, 4 files
```

---

```shell
lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$ ls
9.1.noexcept.cpp  9.2.literals.cpp  9.3.alignment.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$ make
clang++ 9.1.noexcept.cpp -o 9.1.noexcept.out -std=c++2a -pedantic
clang++ 9.2.literals.cpp -o 9.2.literals.out -std=c++2a -pedantic
clang++ 9.3.alignment.cpp -o 9.3.alignment.out -std=c++2a -pedantic

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$ ls
9.1.noexcept.cpp  9.2.literals.cpp  9.3.alignment.cpp  Makefile
9.1.noexcept.out  9.2.literals.out  9.3.alignment.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$ ./9.3.alignment.out
8
16

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$ make clean
rm *.out

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$ ls
9.1.noexcept.cpp  9.2.literals.cpp  9.3.alignment.cpp  Makefile

lyf@DESKTOP-GV2QHKN CLANG64 /f/vscode/cpp_projects/modern-cpp-tutorial/code/9
$
```

### 总结

本节介绍的几个特性是从仍未介绍的`现代 C++ 新特性`里使用频次较靠前的特性了，`noexcept` 是最为重要的特性，`它的一个功能在于能够阻止异常的扩散传播`，有效的让编译器最大限度的优化我们的代码。

## 第 10 章 展望：C++20 简介

`C++20` 如同 `C++11` 一样，似乎能够成为一个振奋人心的更新。例如，早在 `C++11` 时期就跃跃欲试呼声极高却最终落选的 `Concept`，如今已经箭在弦上。`C++` 组委会在讨论投票最终确定 `C++20` 有很多提案，诸如 `Concepts`/`Module`/`Coroutine`/`Ranges`/ 等等。本章我们就来一览 `C++20` 即将引入的那些重要特性。

### 概念与约束

`概念（Concepts）`是对 `C++` 模板编程的进一步增强扩展。简单来说，概念是一种编译期的特性，它能够让编译器在编译期时对模板参数进行判断，从而大幅度增强我们在 `C++` 中模板编程的体验。使用模板进行编程时候我们经常会遇到各种令人发指的错误，这是因为到目前为止我们始终不能够对模板参数进行检查与限制。举例而言，下面简单的两行代码会造成大量的几乎不可读的编译错误：

```c++
#include <list>
#include <algorithm>
int main() {
    std::list<int> l = {1, 2, 3};
    std::sort(l.begin(), l.end());
    return 0;
}
```

而这段代码出现错误的根本原因在于，`std::sort` 对`排序容器`必须提供`随机迭代器`，否则就不能使用，而我们知道 `std::list` 是`不支持随机访问`的。用概念的语言来说就是：`std::list` 中的迭代器不满足 `std::sort` 中随机迭代器这个概念的约束（Constraint）。在引入概念后，我们就可以这样对模板参数进行约束：

```c++
template <typename T>
requires Sortable<T> // Sortable 是一个概念
void sort(T& c);
```

缩写为：

```c++
template<Sortable T> // T 是一个 Sortable 的类型名
void sort(T& c)
```

甚至于直接将其作为类型来使用：

```c++
void sort(Sortable& c); // c 是一个 Sortable 类型的对象
```

我们现在来看一个实际的例子。

TODO: https://godbolt.org/z/9liFPD

### 模块

TODO:

### 合约

TODO:

### 范围

TODO:

### 协程

TODO:

### 事务内存

TODO:

### 总结

总的来说，终于在 `C++20` 中看到 `Concepts`/`Ranges`/`Modules` 这些令人兴奋的特性，这对于一门已经三十多岁`高龄`的编程语言，依然是充满魅力的。

### 进一步阅读的参考资料

1. [Why Concepts didn't make C++17？](http://honermann.net/blog/2016/03/06/why-concepts-didnt-make-cxx17/)

2. [C++11/14/17/20 编译器支持情况](https://en.cppreference.com/w/cpp/compiler_support)

3. [C++ 历史](https://en.cppreference.com/w/cpp/language/history)

## 附录 1：进一步阅读的学习材料

首先，恭喜 🎉 你阅读完本书！笔者希望本书有提起你对`现代 C++` 的兴趣。

正如本书引言部分提到的，本书只是一本带你快速领略`现代 C++ 11`/`14`/`17`/`20` 新特性的读物，而非进阶学习实践 `C++`『黑魔法』的内容。笔者当然也想到了这个需求，只是这样的内容非常艰深，鲜有受众。在此，笔者列出一些能够帮助你在此书基础之上进一步学习`现代 C++` 的资料，希望能够祝你一臂之力：

1. [C++ 参考](https://en.cppreference.com/w)

2. [CppCon YouTube 频道](https://www.youtube.com/user/CppCon/videos)

3. [Ulrich Drepper. 每位程序员都需要知道的内存知识. 2007](https://people.freebsd.org/~lstewart/articles/cpumemory.pdf)

## 附录 2：现代 C++ 的最佳实践

## 结语

第二十五篇博文写完，开心！！！！

今天，也是充满希望的一天。