---
title: Python 杂项-ubuntu
tags:
  - Python
categories: 杂项
description: 介绍一些 Python 杂项，包括：Python 语法等问题。
cover: 'https://cos.luyf-lemon-love.space/images/比尔吉沃特湾.png'
abbrlink: 3206677790
date: 2022-09-29 11:36:43
---

## 前言

介绍一些 `Python` 杂项，包括：`Python` 语法等问题。

操作系统：Ubuntu 20.04.4 LTS

## 参考文档

1. [python注释](https://baijiahao.baidu.com/s?id=1718475616927579476&wfr=spider&for=pc)

2. [Python strip()方法](https://www.runoob.com/python/att-string-strip.html)

3. [Python readline()和readlines()函数：按行读取文件](https://blog.csdn.net/ccc369639963/article/details/123987000)

## Python 注释

1. 使用 `#` 进行单行注释：

```python
# 单行注释
print("单行注释!")
```

2. 使用`三个连续的单引号`或`三个连续的双引号`进行多行注释：

```python
'''
多行注释！
多行注释！
三个连续的单引号！
'''
print("三个连续的单引号！")


"""
多行注释！
多行注释！
三个连续的双引号！
"""
print("三个连续的双引号！")
```

---

```python
#!/usr/bin/env python
# coding=utf-8

# 单行注释
print("单行注释!")

'''
多行注释！
多行注释！
三个连续的单引号！
'''
print("三个连续的单引号！")


"""
多行注释！
多行注释！
三个连续的双引号！
"""
print("三个连续的双引号！")
```

{% label 输出 pink %}

```bash
单行注释!
三个连续的单引号！
三个连续的双引号！
```

## Python str.strip() 方法

```python
Help on method_descriptor:

strip(self, chars=None, /)
    Return a copy of the string with leading and trailing whitespace removed.
    
    If chars is given and not None, remove characters in chars instead.
```

---

```python
Python 3.9.7 (default, Sep 16 2021, 13:09:58) 
[GCC 7.5.0] :: Anaconda, Inc. on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> str1 = "    apple   "
>>> str1.strip()
'apple'
>>> str1.strip("a")
'    apple   '
>>> str1.strip(" a")
'pple'
>>> str2 = "   p urpl e "
>>> str2.strip(" p")
'urpl e'
>>>
```

## Python readline() 和 readlines() 方法

`readline()` 和 `readlines()` 按`行`读取文件。`二进制文件`以 `\n` 作为`行结束`的标志。

### Python readline() 方法

`Python readline() 方法`读取文件中的一行，包含 `\n`，语法如下：

```python
file.readline([size])
```

- `file`: 打开的`文件对象`，如 `open()` 返回的文件对象。

- `size`: 可选参数，一次`最多读取的字符数`。

- `前提`: `open()` 指定的模式为`可读模式` (`r`、`rb`、`r+`、`rb+`)。

### Python readlines() 方法

`Python readlines() 方法`读取文件中的所有行，返回`一个字符串列表` (每一个元素为`文件中的一行内容`，包含行尾的 `\n`)，语法如下:

```python
file.readlines()
```

- `file`: 打开的`文件对象`，如 `open()` 返回的文件对象。

- `前提`: `open()` 指定的模式为`可读模式` (`r`、`rb`、`r+`、`rb+`)。

## 结语

第三十篇博文写完，开心！！！！

今天，也是充满希望的一天。