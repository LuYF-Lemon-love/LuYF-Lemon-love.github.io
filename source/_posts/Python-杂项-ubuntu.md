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

4. [【Python】np.unique() 介绍与使用](https://blog.csdn.net/weixin_44211968/article/details/123772201)

5. [fig.add_subplot(111)或者fig.add_subplot(234)的意义以及由来](https://blog.csdn.net/suanfajiegou/article/details/122609676)

6. [np.random.permutation](https://numpy.org/doc/stable/reference/random/generated/numpy.random.permutation.html?highlight=permutation#numpy.random.permutation)

7. [copy --- 浅层 (shallow) 和深层 (deep) 复制操作](https://docs.python.org/zh-cn/3/library/copy.html)

8. [python基础教程：startswith()和endswith()的用法](https://zhuanlan.zhihu.com/p/420740908)

9. [pip install -i 国内镜像地址](https://blog.csdn.net/qq_52671379/article/details/123392484)

10. [os.environ](https://docs.python.org/zh-cn/3/library/os.html#os.environ)

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

## np.unique() 方法

Returns the `sorted` `unique elements` of `an array`.

```python
>>> import numpy as np
>>> help(np.unique)
```

---

```python
Help on function unique in module numpy:

unique(ar, return_index=False, return_inverse=False, return_counts=False, axis=None)
    Find the unique elements of an array.
    
    Returns the sorted unique elements of an array. There are three optional
    outputs in addition to the unique elements:
    
    * the indices of the input array that give the unique values
    * the indices of the unique array that reconstruct the input array
    * the number of times each unique value comes up in the input array
    
    Parameters
    ----------
    ar : array_like
        Input array. Unless `axis` is specified, this will be flattened if it
        is not already 1-D.
    return_index : bool, optional
        If True, also return the indices of `ar` (along the specified axis,
        if provided, or in the flattened array) that result in the unique array.
    return_inverse : bool, optional
        If True, also return the indices of the unique array (for the specified
        axis, if provided) that can be used to reconstruct `ar`.
    return_counts : bool, optional
        If True, also return the number of times each unique item appears
        in `ar`.
    
        .. versionadded:: 1.9.0
    
    axis : int or None, optional
        The axis to operate on. If None, `ar` will be flattened. If an integer,
        the subarrays indexed by the given axis will be flattened and treated
        as the elements of a 1-D array with the dimension of the given axis,
        see the notes for more details.  Object arrays or structured arrays
        that contain objects are not supported if the `axis` kwarg is used. The
        default is None.
    
        .. versionadded:: 1.13.0
    
    Returns
    -------
    unique : ndarray
        The sorted unique values.
    unique_indices : ndarray, optional
        The indices of the first occurrences of the unique values in the
        original array. Only provided if `return_index` is True.
    unique_inverse : ndarray, optional
        The indices to reconstruct the original array from the
        unique array. Only provided if `return_inverse` is True.
    unique_counts : ndarray, optional
        The number of times each of the unique values comes up in the
        original array. Only provided if `return_counts` is True.
    
        .. versionadded:: 1.9.0
    
    See Also
    --------
    numpy.lib.arraysetops : Module with a number of other functions for
                            performing set operations on arrays.
    repeat : Repeat elements of an array.
    
    Notes
    -----
    When an axis is specified the subarrays indexed by the axis are sorted.
    This is done by making the specified axis the first dimension of the array
    (move the axis to the first dimension to keep the order of the other axes)
    and then flattening the subarrays in C order. The flattened subarrays are
    then viewed as a structured type with each element given a label, with the
    effect that we end up with a 1-D array of structured types that can be
    treated in the same way as any other 1-D array. The result is that the
    flattened subarrays are sorted in lexicographic order starting with the
    first element.
    
    Examples
    --------
    >>> np.unique([1, 1, 2, 2, 3, 3])
    array([1, 2, 3])
    >>> a = np.array([[1, 1], [2, 3]])
    >>> np.unique(a)
    array([1, 2, 3])
    
    Return the unique rows of a 2D array
    
    >>> a = np.array([[1, 0, 0], [1, 0, 0], [2, 3, 4]])
    >>> np.unique(a, axis=0)
    array([[1, 0, 0], [2, 3, 4]])
    
    Return the indices of the original array that give the unique values:
    
    >>> a = np.array(['a', 'b', 'b', 'c', 'a'])
    >>> u, indices = np.unique(a, return_index=True)
    >>> u
    array(['a', 'b', 'c'], dtype='<U1')
    >>> indices
    array([0, 1, 3])
    >>> a[indices]
    array(['a', 'b', 'c'], dtype='<U1')
    
    Reconstruct the input array from the unique values and inverse:
    
    >>> a = np.array([1, 2, 6, 4, 2, 3, 2])
    >>> u, indices = np.unique(a, return_inverse=True)
    >>> u
    array([1, 2, 3, 4, 6])
    >>> indices
    array([0, 1, 4, 3, 1, 2, 1])
    >>> u[indices]
    array([1, 2, 6, 4, 2, 3, 2])
    
    Reconstruct the input values from the unique values and counts:
    
    >>> a = np.array([1, 2, 6, 4, 2, 3, 2])
    >>> values, counts = np.unique(a, return_counts=True)
    >>> values
    array([1, 2, 3, 4, 6])
    >>> counts
    array([1, 3, 1, 1, 1])
    >>> np.repeat(values, counts)
    array([1, 2, 2, 2, 3, 4, 6])    # original order not preserved
(END)
```

## fig.add_subplot() 方法

`fig.add_subplot(xyz)` 是 `fig.add_subplot(ROW,COLUMN,POSITION)` 的简写形式, 其第一个参数表示`行数`, 第二个参数表示`列数`, 第三个参数表示你正在绘制图的`位置`.

![](https://cos.luyf-lemon-love.space/images/20221126221354.png)

生成上图的代码是:

```python
import matplotlib.pyplot as plt
fig = plt.figure()
fig.add_subplot(221)   # top left
fig.add_subplot(222)   # top right
fig.add_subplot(223)   # bottom left
fig.add_subplot(224)   # bottom right 
plt.show()
```

上面代码与下面代码是等效的:

```python
import matplotlib.pyplot as plt
fig = plt.figure()
fig.add_subplot(2,2,1)   # top left
fig.add_subplot(2,2,2)   # top right
fig.add_subplot(2,2,3)   # bottom left
fig.add_subplot(2,2,4)   # bottom right
plt.show()
```

## np.random.permutation() 方法

### numpy.random.permutation(x)

Randomly `permute` a sequence, or return `a permuted range`.

If `x` is `a multi-dimensional array`, it is `only shuffled` along `its first index`.

{% note info simple %}
New code should use the permutation method of a `default_rng()` instance instead; please see the [Quick Start](https://numpy.org/doc/stable/reference/random/index.html#random-quick-start).
{% endnote %}

**Parameters**

**x**: **int** or **array_like**, If **x** is an **integer**, randomly permute **np.arange(x)**. If **x** is an **array**, make a `copy` and `shuffle the elements randomly`.

**Returns**

**out**: **ndarray**, **Permuted** sequence or array range.

**Examples**

```python
>>> np.random.permutation(10)
array([1, 7, 4, 3, 0, 9, 2, 5, 8, 6]) # random
```

```python
>>> np.random.permutation([1, 4, 9, 12, 15])
array([15,  1,  9,  4, 12]) # random
```

```python
>>> arr = np.arange(9).reshape((3, 3))
>>> np.random.permutation(arr)
array([[6, 7, 8], # random
       [0, 1, 2],
       [3, 4, 5]])
```

## str.isspace() 方法

Return `True` if the string is a `whitespace` string, `False` otherwise.

```python
>>> help(str.isspace)
```

---

```python
Help on method_descriptor:

isspace(self, /)
    Return True if the string is a whitespace string, False otherwise.
    
    A string is whitespace if all characters in the string are whitespace and there
    is at least one character in the string.
(END)
```

## copy

源教程链接: https://docs.python.org/zh-cn/3/library/copy.html .

`Python` 的赋值语句不复制对象，而是`创建目标和对象的绑定关系`。对于`自身可变`，或`包含可变项的集合`，`有时要生成副本用于改变操作，而不必改变原始对象`。本模块提供了通用的`浅层复制`和`深层复制`操作，（如下所述）。

接口摘要：

- `copy.copy(x)`, 返回 `x` 的`浅层复制`。

- `copy.deepcopy(x[, memo])`, 返回 `x` 的`深层复制`。

- `exception copy.Error`, 针对模块特定错误引发。

`浅层`与`深层复制`的区别仅与复合对象（即包含`列表`或`类`的实例等其他对象的对象）相关：

- `浅层复制`构造一个新的复合对象，然后（在尽可能的范围内）将原始对象中找到的对象的`引用`插入其中。

- `深层复制`构造一个新的复合对象，然后，`递归地`将在原始对象里找到的对象的`副本`插入其中。

`深度复制`操作通常`存在两个问题`, 而`浅层复制`操作并不存在这些问题：

- `递归对象` (`直接`或`间接`包含对`自身引用`的复合对象) 可能会`导致递归循环`。

- 由于`深层复制`会复制所有内容，因此可能会`过多复制`（例如本应该在副本之间`共享的数据`）。

`deepcopy()` 函数用以下方式避免了这些问题：

- 保留在当前复制过程中`已复制`的对象的 "`备忘录`" （memo） 字典；以及

- 允许用户定义的类`重载复制操作`或`复制的组件集合`。

此模块不会复制`模块`、`方法`、`栈追踪`、`栈帧`、`文件`、`套接字`、`窗口`以及任何相似的类型。它会通过不加修改地返回原始对象来（`浅层`或`深层`地）“复制”函数和类；这与 `pickle` 模块处理这类问题的方式是兼容的。

制作`字典的浅层复制`可以使用 `dict.copy()` 方法，而制作`列表的浅层复制`可以通过赋值`整个列表的切片`完成，例如，`copied_list = original_list[:]`。

类可以使用与`控制序列化`（pickling）操作相同的接口来控制复制操作，关于这些方法的描述信息请参考 `pickle` 模块。实际上，`copy` 模块使用的正是从 `copyreg` 模块中注册的 `pickle` 函数。

想要`为一个类定义它自己的拷贝操作实现`，可以通过定义特殊方法 `__copy__()` 和 `__deepcopy__()`。 `调用前者以实现浅层拷贝操作`；`该方法不必传入额外参数`。 `调用后者以实现深层拷贝操作`；`它应转入一个参数`，即 `memo` 字典。如果 `__deepcopy__()` 实现需要创建一个组件的`深层拷贝`，它应当调用 `deepcopy()` 函数并以`该组件作为第一个参数`而以该 `memo` 字典作为`第二个参数`。`memo` 字典应当被当作`不透明对象`来处理。

## str.startswith() 方法和 str.endswith() 方法

```python
>>> help(str.startswith)
```

```python
Help on method_descriptor:

startswith(...)
    S.startswith(prefix[, start[, end]]) -> bool
    
    Return True if S starts with the specified prefix, False otherwise.
    With optional start, test S beginning at that position.
    With optional end, stop comparing S at that position.
    prefix can also be a tuple of strings to try.
(END)
```

---

```python
help(str.endswith)
```

```python
Help on method_descriptor:

endswith(...)
    S.endswith(suffix[, start[, end]]) -> bool
    
    Return True if S ends with the specified suffix, False otherwise.
    With optional start, test S beginning at that position.
    With optional end, stop comparing S at that position.
    suffix can also be a tuple of strings to try.
(END)
```

## pip install -i 国内镜像地址

```shell
# pip install 包名 -i 国内镜像地址
$ pip install pygame -i https://mirrors.aliyun.com/pypi/simple/
```

### 国内常用源镜像地址

{% label 清华 pink %}

```
https://pypi.tuna.tsinghua.edu.cn/simple
```

{% label 阿里云 blue %}

```
http://mirrors.aliyun.com/pypi/simple/
```

{% label 中国科技大学 red %}

```
https://pypi.mirrors.ustc.edu.cn/simple/
```

{% label 华中理工大学 purple %}

```
http://pypi.hustunique.com/
```

{% label 山东理工大学 orange %}

```
http://pypi.sdutlinux.org/
```

{% label 豆瓣 green %}

```
http://pypi.douban.com/simple/
```

## os.environ() 方法

源教程链接: https://docs.python.org/zh-cn/3/library/os.html#os.environ .

一个 `mapping` 对象，其中`键值`是代表`进程环境的字符串`。例如，`environ['HOME']` 是你的`主目录`（在某些平台上）的路径名，相当于 `C` 中的 `getenv("HOME")`。

`这个映射是在第一次导入 os 模块时捕获的`，通常作为 `Python` 启动时处理 `site.py` 的一部分。除了通过直接修改 `os.environ` 之外，`在此之后对环境所做的更改不会反映在 os.environ 中`。

该映射除了可以用于`查询环境`外，还能用于`修改环境`。当该映射被修改时，将自动调用 `putenv()`。

在 `Unix` 系统上，键和值会使用 `sys.getfilesystemencoding()` 和 `'surrogateescape'` 的错误处理。如果你想使用其他的编码，使用 `environb`。

>备注: 直接调用 `putenv()` 并不会影响 `os.environ`，所以推荐直接修改 `os.environ`。
>
>备注: 在某些平台上，包括 `FreeBSD` 和 `macOS`，设置 `environ` 可能导致内存泄漏。请参阅 `putenv()` 的系统文档。

`可以删除映射中的元素来删除对应的环境变量`。当从 `os.environ` 删除元素时，以及调用 `pop()` 或 `clear()` 之一时，将自动调用 `unsetenv()`。

## 结语

第三十篇博文写完，开心！！！！

今天，也是充满希望的一天。