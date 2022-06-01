---
title: C++11新特性初探-ubuntu
tags:
  - C/C++
  - C++11
categories: C++
description: 介绍一些 C++11 的新特性。
cover: >-
  https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220513124745.png
abbrlink: 4149413868
date: 2022-06-01 13:21:53
---
### 前言

C++11 标准是 ISO/IEC 14882：2011 - Information technology -- Programming languages -- C++ 的简称。此标准为 C++98 发布后 13 年来第一次重大修正。这一版本是具有划时代意义的。其后还有 C++14、C++17 和 C++20。

本文主要介绍 C++11 的一些相对于 C++98/03 的新特性。

操作系统：**Ubuntu 20.04.4 LTS**

### 参考文档

1. [苏丙榅老师的 C++ 教程](https://subingwen.cn/cplusplus/)

### 原始字面量

原始字面量能够直接表示字符串的实际含义，比如打印路径。

定义方式：`R"xxx(原始字符串)xxx` ，其中 `()` 两边的字符串可以省略。

```c++
#include<iostream>
#include<string>
using namespace std;

int main()
{
    string str1 = "D:\\hello\\world\\test.txt";
    cout << str1 << endl;
    string str2 = R"(D:\hello\world\test.txt)";
    cout << str2 << endl;

    return 0;
}
```

**输出**

```shell
D:\hello\world\test.txt
D:\hello\world\test.txt
```

C++11 之前输出 HTML 标签，需要连接符

```c++
#include<iostream>
#include<string>
using namespace std;

int main()
{
    string str = "<html>\
        <head>\
        <title>\
        狐妖小红娘\
        </title>\
        </head>\
        <body>\
        <p>\
        我是要成为真正的狐狸精!!!\
        </p>\
        </body>\
        </html>";
    cout << str << endl;
    return 0;
}
```

C++11 的原始字面量

```c++
#include<iostream>
#include<string>
using namespace std;

int main()
{
    string str = R"(<html>
        <head>
        <title>
        狐妖小红娘
        </title>
        </head>
        <body>
        <p>
        我是要成为真正的狐狸精!!!
        </p>
        </body>
        </html>)";
    cout << str << endl;
    return 0;
}
```

注：在 `R"xxx(raw string)xxx"` 中，括号前后可以追加其他字符串，但会被忽略，一般不用指定。并且括号前后加的字符串必须相同。

### 结语

第十三篇博文写完，开心！！！！

今天，也是充满希望的一天。