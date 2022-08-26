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
|`|`|指明两项之间的一个选择。|

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

### 总结

本节简单介绍了`正则表达式`本身，然后根据使用`正则表达式`的主要需求，通过一个实际的例子介绍了`正则表达式库`的使用。

### 进一步阅读的参考资料

1. [知乎『如何评价 GCC 的 C++11 正则表达式？』中原库作者 Tim Shen 的回答](https://zhihu.com/question/23070203/answer/84248248)

2. [正则表达式库文档](https://en.cppreference.com/w/cpp/regex)

## 第 7 章 并行与并发

## 结语

第二十五篇博文写完，开心！！！！

今天，也是充满希望的一天。