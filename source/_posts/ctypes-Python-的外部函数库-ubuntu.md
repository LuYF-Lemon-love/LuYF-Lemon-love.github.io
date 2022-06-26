---
title: ctypes --- Python 的外部函数库-ubuntu
tags:
  - C/C++
  - Python
  - 全局解释器锁（GIL）
  - VSCode
  - ctypes
  - virtual-environment
  - GCC
  - Linux
  - 动态链接库
categories: C/C++和Python混合编程
description: >-
  介绍 ctypes --- Python 的外部函数库，ctypes 提供了与 C 兼容的数据类型，并允许调用 DLL 或共享库中的函数。可以使用该模块以纯
  Python 形式对这些库进行封装。
cover: 'https://cos.luyf-lemon-love.space/images/20220604154341.png'
abbrlink: 3771116590
date: 2022-06-26 12:32:26
---

### 前言

[ctypes](https://docs.python.org/zh-cn/3/library/ctypes.html#module-ctypes) 是 Pyhton 的外部函数库。且也是 Python 的标准库，因此不需要安装。它提供了与 C 兼容的数据类型，并允许调用 DLL 或共享库中的函数。可以使用该模块以纯 Python 形式对这些库进行封装。

注意：部分示例代码引用了 ctypes 的 c_int 类型。在 sizeof(long) == sizeof(int) 的平台上此类型是 c_long 的一个别名。所以，在程序输出 `c_long` 而不是你期望的 `c_int` 时，不必感到迷惑 ——— 它们实际上是同一中类型。

本博文的代码在 Linux 版本的 Visual Studio Code 上测试的。

关于在 VSCode 上配置 C/C++ 和 Python 环境，请参考 {% post_link C-C-和Python多线程初探-ubuntu %}。

操作系统：Ubuntu 20.04.4 LTS

### 参考文档

1. [ctypes --- Python 的外部函数库](https://docs.python.org/zh-cn/3/library/ctypes.html)

2. [global interpreter lock -- 全局解释器锁](https://docs.python.org/zh-cn/3/glossary.html#term-global-interpreter-lock)

### 载入动态链接库

1. 启动 VSCode。

```shell
mkdir test_ctypes
cd test_ctypes/
code .
```

2. 新建 test_ctypes.c 文件，粘贴下面代码。

```c
#include <stdio.h>

void say_hello_world()
{
    printf("hello world in C.\n");
}
```

3. 生成动态链接库。新建一个终端，输入下面命令。

```shell
gcc -fPIC -shared -o libtest.so test_ctypes.c 
```

4. 新建 test_ctypes.py 文件，粘贴下面代码。

```python
import ctypes

def test_say_hello_world():

    libc = ctypes.CDLL("./libtest.so")

    libc.say_hello_world()

    libc['say_hello_world']()

    print(libc.say_hello_world == libc.say_hello_world)

    print(libc['say_hello_world'] == libc['say_hello_world'])

    print("**************************************")

    libc_ll = ctypes.cdll.LoadLibrary("./libtest.so")

    libc_ll.say_hello_world()

    libc_ll['say_hello_world']()

    print(libc_ll.say_hello_world == libc_ll.say_hello_world)

    print(libc_ll['say_hello_world'] == libc_ll['say_hello_world'])

if __name__ == '__main__':
    
    test_say_hello_world()
```

5. 配置 Python 的 `virtual environment` 环境。

```shell
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install --upgrade pip
deactivate
```

6. 按 Ctrl+Shift+p，输入 Python: Select Interpreter 命令，选择上步配置的 `virtual environment` 环境，如 `Python 3.9.7 ('.venv': venv) ./.venv/bin/python	Recommended`。

7. 打开 `test_ctypes.py` 文件，点击右上角的 `Run Python File` 文件按钮，运行 Python 脚本。

{% label output pink %}

```shell
hello world in C.
hello world in C.
True
False
**************************************
hello world in C.
hello world in C.
True
False
```

---

```python
class ctypes.CDLL(name, mode=DEFAULT_MODE, handle=None, use_errno=False, use_last_error=False, winmode=None)
```

此类的实例为已加载的动态链接库。库中的函数使用标准 C 调用约定，并假定返回 int 。调用动态库导出的函数之前，Python 会释放 `global interpreter lock`，并在调用后重新获取。

{% label green, global interpreter lock -- 全局解释器锁 %}

>CPython 解释器所采用的一种机制，它确保同一时刻只有一个线程在执行 Python bytecode。此机制通过防止对象模型（包括 dict 等重要内置类型）的并发访问简化了 CPython 实现。给整个解释器加锁使得解释器多线程运行更方便，其代价则是牺牲了在多处理器上的并行性。
>
>不过，某些标准库或第三方库的扩展模块被设计为在执行计算密集型任务如压缩或哈希时释放 GIL。此外，在执行 I/O 操作时也总是会释放 GIL。
>
>创建一个（以更精细粒度来锁定共享数据的）“自由线程”解释器的努力从未获得成功，因为这会牺牲在普通单处理器情况下的性能。克服这种性能问题的措施将导致实现变得更复杂，从而更难以维护。

---

通过使用至少一个参数（共享库的路径名）调用它们，可以实例化所有这些类。也可以传入一个已加载的动态链接库作为 `handler` 参数，其他情况会调用系统底层的 `dlopen` 或 `LoadLibrary` 函数将库加载到进程，并获取其句柄。作为初学者，只需通过 `共享库的路径名` 即 `name` 参数来加载动态链接库就可以了。

```python
libc = ctypes.CDLL("./libtest.so")
```

---

动态链接库的导出函数可以通过属性或者索引的方式访问。

- 通过属性的访问会缓存这个函数，因此每次访问时，返回的都是同一个对象。

- 通过索引的访问，每次都会返回一个新的对象。

```python
libc.say_hello_world()

libc['say_hello_world']()

print(libc.say_hello_world == libc.say_hello_world)

print(libc['say_hello_world'] == libc['say_hello_world'])
```

---

```python
class ctypes.LibraryLoader(dlltype)
	
    __getattr__()
	
    LoadLibrary(name)
```

此类为加载共享库的类。 dlltype 应当为 CDLL, PyDLL, WinDLL 或 OleDLL 类型之一。PyDLL, WinDLL 和 OleDLL 类型与 CDLL 相似，也是用于加载动态库，由于我们的操作系统是 Linux 和 我们希望调用动态链接库的函数时 Python 释放 global interpreter lock ，所以这里不介绍 `PyDLL`、`WinDLL` 和 `OleDLL`。

`__getattr__()` 具有特殊的行为：它允许通过将一个共享库作为库加载器实例的属性进行访问来加载它。加载结果将被缓存，因此重复的属性访问，每次都会返回相同的库。

`LoadLibrary(name)` 加载一个共享库到进程中并将其返回。 此方法总是返回一个新的库实例。

```
libc_ll = ctypes.cdll.LoadLibrary("./libtest.so")

libc_ll.say_hello_world()

libc_ll['say_hello_world']()

print(libc_ll.say_hello_world == libc_ll.say_hello_world)

print(libc_ll['say_hello_world'] == libc_ll['say_hello_world'])
```

---

`ctypes` 导出的 `cdll` 对象，将按`标准的 cdecl 调用协议`导出函数。

### 调用函数













































































































































































### 结语

第十六篇博文写完，开心！！！！

今天，也是充满希望的一天。
