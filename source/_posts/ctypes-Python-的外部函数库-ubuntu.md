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

[ctypes](https://docs.python.org/zh-cn/3/library/ctypes.html#module-ctypes) 是 Pyhton 的外部函数库。也是 Python 的标准库，因此不需要安装。它提供了与 C 兼容的数据类型，并允许调用 DLL 或共享库中的函数。可以使用该模块以纯 Python 形式对这些库进行封装。

注意：部分示例代码引用了 ctypes 的 c_int 类型。在 sizeof(long) == sizeof(int) 的平台上此类型是 c_long 的一个别名。所以，在程序输出 `c_long` 而不是你期望的 `c_int` 时，不必感到迷惑 ——— 它们实际上是同一种类型。

本博文的代码在 Linux 版本的 Visual Studio Code 上测试的。

在 VSCode 上配置 C/C++ 和 Python 环境，请参考 {% post_link C-C-和Python多线程初探-ubuntu %}。

操作系统：Ubuntu 20.04.4 LTS

### 参考文档

1. [ctypes --- Python 的外部函数库](https://docs.python.org/zh-cn/3/library/ctypes.html)

2. [global interpreter lock -- 全局解释器锁](https://docs.python.org/zh-cn/3/glossary.html#term-global-interpreter-lock)

3. [东八区](https://baike.baidu.com/item/%E4%B8%9C%E5%85%AB%E5%8C%BA/8083927)

4. [利用time(NULL）函数表示此刻的时间](https://blog.csdn.net/weixin_50941322/article/details/111184723?spm=1001.2014.3001.5506)

5. [time](https://cplusplus.com/reference/ctime/time/)

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

    print("*" * 64)

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

6. 按 Ctrl+Shift+P，输入 `Python: Select Interpreter` 命令，选择上步配置的 `virtual environment` 环境，如 `Python 3.9.7 ('.venv': venv) ./.venv/bin/python	Recommended`。

7. 打开 `test_ctypes.py` 文件，点击右上角的 `Run Python File` 按钮，运行 Python 脚本。

{% label output pink %}

```shell
hello world in C.
hello world in C.
True
False
****************************************************************
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

{% span green, global interpreter lock -- 全局解释器锁 %}

>CPython 解释器所采用的一种机制，它确保同一时刻只有一个线程在执行 Python bytecode。此机制通过防止对象模型（包括 dict 等重要内置类型）的并发访问简化了 CPython 的实现。给整个解释器加锁使得解释器的多线程运行更方便，其代价则是牺牲了在多处理器上的并行性。
>
>不过，某些标准库或第三方库的扩展模块被设计为在执行计算密集型任务如压缩或哈希时释放 GIL。此外，在执行 I/O 操作时也总是会释放 GIL。
>
>创建一个（以更精细粒度来锁定共享数据的）“自由线程”解释器的努力从未获得成功，因为这会牺牲在普通单处理器情况下的性能。克服这种性能问题的措施将导致实现变得更复杂，从而更难以维护。

---

可以使用至少一个参数（共享库的路径名）调用 `ctypes.CDLL`。也可以传入一个已加载的动态链接库作为 `handler` 参数，其他情况会调用系统底层的 `dlopen` 或 `LoadLibrary` 函数将库加载到进程，并获取其句柄。作为初学者，只需通过 `共享库的路径名` 即 `name` 参数来加载动态链接库就可以了。

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

共享库也可以通用使用一个预制对象来加载，这种对象是 LibraryLoader 类的实例，具体做法或是通过调用 LoadLibrary() 方法，或是通过将库作为加载器实例的属性来提取。

```python
class ctypes.LibraryLoader(dlltype)
	
    __getattr__()
	
    LoadLibrary(name)
```

此类为加载共享库的类。 dlltype 应当为 CDLL, PyDLL, WinDLL 或 OleDLL 类型之一。PyDLL, WinDLL 和 OleDLL 类型与 CDLL 相似，也是用于加载动态链接库的类，由于我们的操作系统是 Linux 和 我们希望调用动态链接库的函数时 Python 会释放 `global interpreter lock` ，所以这里不介绍 `PyDLL`、`WinDLL` 和 `OleDLL`。

`__getattr__()` 具有特殊的行为：它允许通过将一个共享库作为库加载器实例的属性进行访问来加载它。加载结果将被缓存，因此重复的属性访问，每次都会返回相同的库。

`LoadLibrary(name)` 加载一个共享库到进程中并将其返回。 此方法总是返回一个新的库实例。

```python
ctypes.cdll
```

`ctypes.cdll` 是一个 `LibraryLoader` 类的实例。

```python
libc_ll = ctypes.cdll.LoadLibrary("./libtest.so")

libc_ll.say_hello_world()

libc_ll['say_hello_world']()

print(libc_ll.say_hello_world == libc_ll.say_hello_world)

print(libc_ll['say_hello_world'] == libc_ll['say_hello_world'])
```

---

`ctypes` 导出的 `cdll` 对象，将按`标准的 cdecl 调用协议`导出函数。

### 调用函数

你可以像调用其他 Python 函数那样调用这些动态链接库中的函数。

```c
#include <time.h>

time_t time (time_t* timer);
```

- Get the current calendar time as a value of type time_t.

- The function returns this value, and if the argument is not a null pointer, it also sets this value to the object pointed by timer.

- The value returned generally represents the number of seconds since 00:00 hours, Jan 1, 1970 UTC (i.e., the current unix timestamp). 

- `timer`: Pointer to an object of type time_t, where the time value is stored. Alternatively, this parameter can be a null pointer, in which case the parameter is not used (the function still returns a value of type time_t with the result).

- `time(NULL)`: The value returned represents the number of seconds since 00:00 hours, Jan 1, 1970 UTC (i.e., the current unix timestamp).

1. 在 test_ctypes.c 文件中，引用 `<time.h>` 头文件。

```c
#include <time.h>
```

2. 在 test_ctypes.c 文件中，添加 say_time 函数。

```c
void say_time(time_t* timer)
{
    long now;

    // 今天已经过去的时间（秒）
    now = time(timer) % (60 * 60 * 24);

    long hour = now / 3600;
    long minute = now % 3600 / 60;
    long second = now % 3600 % 60;

    printf("零时区时间： %2ld :%2ld :%2ld \n", hour, minute, second);

    // 北京位于东八区：东八区（UTC/GMT+08:00）是比世界协调时间（UTC）/格林尼治时间（GMT）快 8 小时的时区
    hour = (hour + 8) % 24;
    printf("北京时间：   %2ld :%2ld :%2ld \n", hour, minute, second);
}
```

3. 生成动态链接库。

```shell
gcc -fPIC -shared -o libtest.so test_ctypes.c
```

4. 在 test_ctypes.py 文件中， 添加 test_say_time 函数。

```python
def test_say_time(timer):

    libc = ctypes.CDLL("./libtest.so")

    libc.say_time(timer)
```

5. 在 `if _name__ == '__main__':` 中，注释 `test_say_hello_world()`。

```python
#test_say_hello_world()

test_say_time(None)
```

6. 打开 test_ctypes.py 文件，点击右上角的 `Run Python File` 按钮，运行 Python 脚本。

{% label output pink %}

```shell
零时区时间：  9 :16 :43 
北京时间：   17 :16 :43
```

在 `ctypes` 中，调用函数时可以使用 `None` 作为空指针。

>None, integers, bytes objects and (unicode) strings are the only native Python objects that can directly be used as parameters in these function calls. None is passed as a C NULL pointer, bytes objects and strings are passed as pointer to the memory block that contains their data (char* or wchar_t*). Python integers are passed as the platforms default C int type, their value is masked to fit into the C type.

`None`, `integers`, `bytes objects` 和 `(unicode) string` 是仅有的可以直接作为函数参数使用的四种 Python 本地数据类型。`None` 被作为 C 的空指针（NULL）,`bytes objects` 和 `strings` 是一个指向其保存数据（char* or wchar_t*）内存块指针，`integers` 则作为平台默认的 C 的 int 类型，它们的数值被截断以适应 C 类型的整型长度。

### 基础数据类型

`ctypes` 定义了一些和 `C` 兼容的基本数据类型。

| ctypes type | C type | Python type |
|:-:|:-:|:-:|
| c_bool | _Bool | bool(1) |
| c_char | char | 1-character bytes object |
| c_wchar | wchar_t | 1-character string |
| c_byte | char | int |
| c_ubyte | unsigned char | int |
| c_short | short | int |
| c_ushort | unsigned short | int |
| c_int | int | int |
| c_uint | unsigned int | int |
| c_long | long | int |
| c_ulong | unsigned long | int |
| c_longlong | __int64 or long long | int |
| c_ulonglong | unsigned __int64 or unsigned long long | int |
| c_size_t | size_t | int |
| c_ssize_t | ssize_t or Py_ssize_t | int |
| c_float | float | float |
| c_double | double | float |
| c_longdouble | long double | float |
| c_char_p | char* (NUL terminated) | bytes object or None |
| c_wchar_p | wchar_t* (NUL terminated) | string or None |
| c_void_p | void* | int or None |

1. 在 test_ctypes.py 文件中， 添加 test_say_time 函数。

```python
def test_fundamental_data_types():

    print("调用构造函数创建对象：")

    print(ctypes.c_int())
    print(ctypes.c_wchar_p("Hello, World"))
    print(ctypes.c_ushort(-3))

    print("*" * 64)

    print("更改对象的值")

    i = ctypes.c_int(42)
    print(i)
    print(i.value)

    i.value = -99
    print(i.value)

    print("*" * 64)

    print("c_wchar_p")

    s = "Hello, World"
    c_s = ctypes.c_wchar_p(s)
    print(c_s)
    print(c_s.value)

    # the memory location has changed
    c_s.value = "Hi, there"
    print(c_s)
    print(c_s.value)

    # first object is unchanged
    print(s)

    print("*" * 64)

    print("create_string_buffer()")

    # create a 3 byte buffer, initialized to NUL bytes
    p = ctypes.create_string_buffer(3)
    print(ctypes.sizeof(p), repr(p.raw))

    # create a buffer containing a NUL terminated string
    p = ctypes.create_string_buffer(b"Hello")
    print(ctypes.sizeof(p), repr(p.raw))
    print(repr(p.value))

    # create a 10 byte buffer
    p = ctypes.create_string_buffer(b"hello", 10)
    print(ctypes.sizeof(p), repr(p.raw))
    p.value = b"Hi"
    print(ctypes.sizeof(p), repr(p.raw))
```

2. 在 `if _name__ == '__main__':` 中，注释 `test_say_time(None)`。

```python
#test_say_time(None)

test_fundamental_data_types()
```

3. 打开 test_ctypes.py 文件，点击右上角的 `Run Python File` 按钮，运行 Python 脚本。

{% label output pink %}

```shell
调用构造函数创建对象：
c_int(0)
c_wchar_p(139905448734320)
c_ushort(65533)
****************************************************************
更改对象的值
c_int(42)
42
-99
****************************************************************
c_wchar_p
c_wchar_p(139905448734320)
Hello, World
c_wchar_p(139905448740688)
Hi, there
Hello, World
****************************************************************
create_string_buffer()
3 b'\x00\x00\x00'
6 b'Hello\x00'
b'Hello'
10 b'hello\x00\x00\x00\x00\x00'
10 b'Hi\x00lo\x00\x00\x00\x00\x00'
```

---

>The constructor accepts any object with a truth value.

{% span green, 使用构造函数创建对象。 %}

```python
print("调用构造函数创建对象：")

print(ctypes.c_int())
print(ctypes.c_wchar_p("Hello, World"))
print(ctypes.c_ushort(-3))
```

{% span green, 更改对象的值。 %}

```python
print("更改对象的值")

i = ctypes.c_int(42)
print(i)
print(i.value)

i.value = -99
print(i.value)
```

{% span green, 当给指针类型的对象 c_char_p、c_wchar_p 和 c_void_p 等赋值时，将改变它们所指向的内存地址，而不是它们所指向的内存区域的内容（这是理所当然的，因为 Python 的 bytes 对象是不可变的）。 %}

```python
print("c_wchar_p")

s = "Hello, World"
c_s = ctypes.c_wchar_p(s)
print(c_s)
print(c_s.value)

# the memory location has changed
c_s.value = "Hi, there"
print(c_s)
print(c_s.value)

# first object is unchanged
print(s)
```

>You should be careful, however, not to pass them to functions expecting pointers to mutable memory. If you need mutable memory blocks, ctypes has a create_string_buffer() function which creates these in various ways. The current memory block contents can be accessed (or changed) with the raw property; if you want to access it as NUL terminated string, use the value property.

{% span green, 因此，不能将对象 c_char_p、c_wchar_p 和 c_void_p 传递给会改变指针所指内存的函数。如果想要可改变的内存块，可以使用 create_string_buffer() 函数。可以使用 raw 属性存取当前的内存块的内容。如果想要取出 NUL 结束的字符串，需要使用 value 属性。%}



```python
print("create_string_buffer()")

# create a 3 byte buffer, initialized to NUL bytes
p = ctypes.create_string_buffer(3)
print(ctypes.sizeof(p), repr(p.raw))

# create a buffer containing a NUL terminated string
p = ctypes.create_string_buffer(b"Hello")
print(ctypes.sizeof(p), repr(p.raw))
print(repr(p.value))

# create a 10 byte buffer
p = ctypes.create_string_buffer(b"hello", 10)
print(ctypes.sizeof(p), repr(p.raw))
p.value = b"Hi"
print(ctypes.sizeof(p), repr(p.raw))
```

```python
ctypes.create_string_buffer(init_or_size, size=None)
```

> This function creates a mutable character buffer. The returned object is a ctypes array of c_char.
>
> init_or_size must be an integer which specifies the size of the array, or a bytes object which will be used to initialize the array items.
>
> If a bytes object is specified as first argument, the buffer is made one item larger than its length so that the last element in the array is a NUL termination character. An integer can be passed as second argument which allows specifying the size of the array if the length of the bytes should not be used.

- 此函数会创建一个可变的字符缓冲区。 返回的对象是一个 c_char 的 ctypes 数组。

- init_or_size 必须是一个指明数组大小的整数，或者是一个将被用来初始化数组条目的字节串对象。

- 如果将一个字节串对象指定为第一个参数，则将使缓冲区大小比其长度多一项以便数组的最后一项为一个 NUL 终结符。 可以传入一个整数作为第二个参数以允许在不使用字节串长度的情况下指定数组大小。

>To create a mutable memory block containing unicode characters of the C type wchar_t use the create_unicode_buffer() function.

{% span green, create_unicode_buffer() 函数可以创建 unicode 字符的可变内存块，与之对应的 C 语言类型是 wchar_t。 %}

```python
ctypes.create_unicode_buffer(init_or_size, size=None)
```

>This function creates a mutable unicode character buffer. The returned object is a ctypes array of c_wchar.
>
>init_or_size must be an integer which specifies the size of the array, or a string which will be used to initialize the array items.
>
>If a string is specified as first argument, the buffer is made one item larger than the length of the string so that the last element in the array is a NUL termination character. An integer can be passed as second argument which allows specifying the size of the array if the length of the string should not be used.

- 此函数会创建一个可变的 unicode 字符缓冲区。 返回的对象是一个 c_wchar 的 ctypes 数组。

- init_or_size 必须是一个指明数组大小的整数，或者是一个将被用来初始化数组条目的字符串。

- 如果将一个字符串指定为第一个参数，则将使缓冲区大小比其长度多一项以便数组的最后一项为一个 NUL 终结符。 可以传入一个整数作为第二个参数以允许在不使用字符串长度的情况下指定数组大小。

### Calling functions, continued

1. 在 `test_ctypes.c` 文件中，引用 `<wchar.h>` 头文件。

```c
#include <wchar.h>
```

2. 在 `test_ctypes.c` 文件中，添加 `call_functions` 函数。

```c
void call_functions(int i, char* str, wchar_t* w_str, double db)
{
    printf("int i = %d\nchar* str = %s\nwchar_t* w_str = %ls\ndouble* db = %f\n", i, str, w_str, db);
}
```

3. 生成动态链接库。

```shell
gcc -fPIC -shared -o libtest.so test_ctypes.c
```

4. 在 `test_ctypes.py` 文件中，添加 `test_call_functions` 函数。

```python
def test_call_functions():

    i = ctypes.c_int(42)

    str = ctypes.c_char_p(b"Hello, World in c_char_p.")

    w_str = ctypes.c_wchar_p("我要成为真正的狐狸精!!!")

    db = ctypes.c_double(3.14)

    libc = ctypes.CDLL("./libtest.so")

    libc.call_functions(i, str, w_str, db)
```

5. 在 `if __name__ == '__main__':` 中，注释 `test_fundamental_data_types()`。

```python
#test_fundamental_data_types()

test_call_functions()
```

6. 打开 `test_ctypes.py` 文件，点击右上角的 `Run Python File` 按钮，运行 Python 脚本。

{% label output pink %}

```shell
int i = 42
char* str = Hello, World in c_char_p.
wchar_t* w_str = 我要成为真正的狐狸精!!!
double* db = 3.140000
```

>As has been mentioned before, all Python types except integers, strings, and bytes objects have to be wrapped in their corresponding ctypes type, so that they can be converted to the required C data type

{% span green, 正如前面所提到过的，除了整数、字符串以及字节串之外，所有的 Python 类型都必须使用它们对应的 ctypes 类型包装，才能够被正确地转换为所需的C语言类型。 %}

### 使用自定义的数据类型调用函数











































































































































### 结语

第十六篇博文写完，开心！！！！

今天，也是充满希望的一天。
