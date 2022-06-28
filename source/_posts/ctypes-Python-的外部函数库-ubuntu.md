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

6. [strchr](https://cplusplus.com/reference/cstring/strchr/)

7. [sscanf](https://cplusplus.com/reference/cstdio/sscanf/)

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

1. 在 `test_ctypes.c` 文件中，添加 `say_bottles` 函数。

```c
void say_bottles(int bottles)
{
    printf("%d bottles of beer.\n", bottles);
}
```

2. 生成动态链接库。

```shell
gcc -fPIC -shared -o libtest.so test_ctypes.c
```

3. 在 `test_ctypes.py` 文件中，添加 `test_say_bottles` 函数。

```python
class Bottles:

    def __init__(self, number):
        
        self._as_parameter_ = number

def test_say_bottles():

    bottles = Bottles(42)

    libc = ctypes.CDLL("./libtest.so")

    libc.say_bottles(bottles)
```

4. 在 `if __name__ == '__main__':` 中，注释 `test_call_functions()`。

```python
#test_call_functions()

test_say_bottles()
```

5. 打开 `test_ctypes.py` 文件，点击右上角的 `Run Python File` 按钮，运行 Python 脚本。

{% label output pink %}

```shell
42 bottles of beer.
```

>You can also customize ctypes argument conversion to allow instances of your own classes be used as function arguments. ctypes looks for an _as_parameter_ attribute and uses this as the function argument. Of course, it must be one of integer, string, or bytes

{% span green, 你也可以通过自定义 ctypes 参数转换方式来允许自定义类型作为参数。ctypes 会寻找 _as_parameter_ 属性并使用它作为函数参数。当然，它必须是数字、字符串或者二进制字符串。 %}

### 指定必选参数的类型（函数原型）

1. 在 `test_ctypes.py` 文件中，添加 `test_argtypes` 函数。

```python
def test_argtypes():

    libc = ctypes.CDLL("./libtest.so")

    libc.call_functions.argtypes = [ctypes.c_int, ctypes.c_char_p, ctypes.c_wchar_p, ctypes.c_double]

    libc.call_functions(42, b"Hello, World in c_char_p.", "我要成为真正的狐狸精!!!", 3.14)
```

2. 在 `if __name__ == '__main__':` 中，注释 `test_say_bottles()`。

```python
#test_say_bottles()

test_argtypes()
```

3. 打开 `test_ctypes.py` 文件，点击右上角的 `Run Python File` 按钮，运行 Python 脚本。

{% label output pink %}

```shell
int i = 42
char* str = Hello, World in c_char_p.
wchar_t* w_str = 我要成为真正的狐狸精!!!
double* db = 3.140000
```

>It is possible to specify the required argument types of functions exported from DLLs by setting the argtypes attribute.
>
>argtypes must be a sequence of C data types.
>
>Specifying a format protects against incompatible argument types (just as a prototype for a C function), and tries to convert the arguments to valid types.

- 可以通过设置 argtypes 属性指定从 DLL 中导出函数的必选参数类型。

- argtypes 必须是一个 C 数据类型的序列。

- 指定数据类型可以防止不合理的参数传递（就像 C 函数的原型），并且会自动尝试将参数转换为需要的类型。

### 返回类型

1. 在 `test_ctypes.c` 文件中，引用 `<string.h>` 头文件。

```c
#include <string.h>
```

2. 在 `test_ctypes.c` 文件中，添加 `return_bool` 函数。

```c
int return_bool()
{
    return 1;
}
```

3. 生成动态链接库。

```shell
gcc -fPIC -shared -o libtest.so test_ctypes.c
```

4. 在 `test_ctypes.py` 文件中，添加 `valid_return` 和 `test_return_types` 函数。

```python
def valid_return(value):

    if value == 0:
        return False
    else:
        return True

def test_return_types():

    libc = ctypes.CDLL("./libtest.so")
    strchr = libc.strchr
    print(strchr(b"abcdef", ord("d")))

    # c_char_p is a pointer to a string
    strchr.restype = ctypes.c_char_p
    print(strchr(b"abcdef", ord("d")))
    print(strchr(b"abcdef", ord("x")))

    print("*" * 64)

    strchr.argtypes = [ctypes.c_char_p, ctypes.c_char]
    print(strchr(b"abcdef", b"d"))
    print(strchr(b"abcdef", b"x"))

    print("*" * 64)

    return_bool = libc.return_bool
    return_bool.restype = valid_return

    print(return_bool())
```

5. 在 `if __name__ == '__main__':` 中，注释 `test_argtypes()`。

```python
#test_argtypes()

test_return_types()
```

6. 打开 `test_ctypes.py` 文件，点击右上角的 `Run Python File` 按钮，运行 Python 脚本。

{% label output pink %}

```shell
-1173963645
b'def'
None
****************************************************************
b'def'
None
****************************************************************
True
```

---

```c
#include <string.h>

const char * strchr ( const char * str, int character );
char * strchr ( char * str, int character );
```

**Locate first occurrence of character in string**

Returns a pointer to the first occurrence of character in the C string str.

The terminating null-character is considered part of the C string. Therefore, it can also be located in order to retrieve a pointer to the end of a string.

**Parameters**

- `str`: C string.

- `character`: Character to be located. It is passed as its int promotion, but it is internally converted back to char for the comparison.

**Return Value**

A pointer to the first occurrence of character in str. If the character is not found, the function returns a null pointer.

**Portability**

In C, this function is only declared as:

`char * strchr ( const char *, int );`

instead of the two overloaded versions provided in C++.

---

>By default functions are assumed to return the C int type. Other return types can be specified by setting the restype attribute of the function object.

{% span green, 默认情况下都会假定函数返回 C int 类型。其他返回类型可以通过设置函数对象的 restype 属性来指定。 %}

```python
libc = ctypes.CDLL("./libtest.so")
strchr = libc.strchr
print(strchr(b"abcdef", ord("d")))

# c_char_p is a pointer to a string
strchr.restype = ctypes.c_char_p
print(strchr(b"abcdef", ord("d")))
print(strchr(b"abcdef", ord("x")))
```

>If you want to avoid the ord("x") calls above, you can set the argtypes attribute, and the second argument will be converted from a single character Python bytes object into a C char.

{% span green, 如果希望避免上述的 ord("x") 调用，可以设置 argtypes 属性，第二个参数就会将单字符的 Python 二进制字符对象转换为 C 字符。 %}

```python
strchr.argtypes = [ctypes.c_char_p, ctypes.c_char]
print(strchr(b"abcdef", b"d"))
print(strchr(b"abcdef", b"x"))
```

>You can also use a callable Python object (a function or a class for example) as the restype attribute, if the foreign function returns an integer. The callable will be called with the integer the C function returns, and the result of this call will be used as the result of your function call. This is useful to check for error return values and automatically raise an exception.

{% span green, 如果外部函数返回了一个整数，你也可以使用一个可调用的 Python 对象（比如函数或者类）作为 restype 属性的值。将会以 C 函数返回的整数对象作为参数调用这个可调用对象，执行后的结果作为最终函数返回值。这在错误返回值校验和自动抛出异常等方面比较有用。 %}

```python
def valid_return(value):

    if value == 0:
        return False
    else:
        return True
        
return_bool = libc.return_bool
return_bool.restype = valid_return

print(return_bool())
```

### 传递指针（或以引用方式传递形参）

1. 在 `test_ctypes.c` 文件中，引用 `<stdio.h>` 头文件。

```c
#include <stdio.h>
```

2. 在 `test_ctypes.c` 文件中，添加 `pass_pointers` 函数。

```c
void pass_pointers(int* i, float* f, char* str)
{
    sscanf("1 3.14 Hello", "%d %f %s", i, f, str);
}
```

3. 生成动态链接库。

```shell
gcc -fPIC -shared -o libtest.so test_ctypes.c
```

4. 在 `test_ctypes.py` 文件中，添加 `test_pass_pointers` 函数。

```python
def test_pass_pointers():

    i = ctypes.c_int()
    f = ctypes.c_float()
    s = ctypes.create_string_buffer(b'\000' * 32)
    print(i.value, f.value, repr(s.value))

    libc = ctypes.CDLL("./libtest.so")
    libc.pass_pointers(ctypes.byref(i), ctypes.byref(f), s)
    print(i.value, f.value, repr(s.value))
```

5. 在 `if __name__ == '__main__':` 中，注释 `test_return_types()`。

```python
#test_return_types()

test_pass_pointers()
```

6. 打开 `test_ctypes.py` 文件，点击右上角的 `Run Python File` 按钮，运行 Python 脚本。

{% label output pink %}

```shell
0 0.0 b''
1 3.140000104904175 b'Hello'
```

---

```c
#include <stdio.h>

int sscanf ( const char * s, const char * format, ...);
```

**Read formatted data from string**

Reads data from s and stores them according to parameter format into the locations given by the additional arguments, as if scanf was used, but reading from s instead of the standard input (stdin).

The additional arguments should point to already allocated objects of the type specified by their corresponding format specifier within the format string.

**Parameters**

- `s`: C string that the function processes as its source to retrieve the data.

- `format`: C string that contains a format string that follows the same specifications as format in scanf (see scanf for details).

- `... (additional arguments)`: Depending on the format string, the function may expect a sequence of additional arguments, each containing a pointer to allocated storage where the interpretation of the extracted characters is stored with the appropriate type. There should be at least as many of these arguments as the number of values stored by the format specifiers. Additional arguments are ignored by the function.

**Return Value**

On success, the function returns the number of items in the argument list successfully filled. This count can match the expected number of items or be less (even zero) in the case of a matching failure. In the case of an input failure before any data could be successfully interpreted, EOF is returned.

---

```python
ctypes.byref(obj[, offset])
```

Returns a light-weight pointer to obj, which must be an instance of a ctypes type. offset defaults to zero, and must be an integer that will be added to the internal pointer value.

byref(obj, offset) corresponds to this C code:

```c
(((char *)&obj) + offset)
```

The returned object can only be used as a foreign function call parameter. It behaves similar to pointer(obj), but the construction is a lot faster.

---

>Sometimes a C api function expects a pointer to a data type as parameter, probably to write into the corresponding location, or if the data is too large to be passed by value. This is also known as passing parameters by reference.

{% span green, 有时候 C 函数接口可能由于要往某个地址写入值，或者数据太大不适合作为值传递，从而希望接收一个指针作为数据参数类型。这可以称为引用方式传递形参。 %}

>ctypes exports the byref() function which is used to pass parameters by reference. The same effect can be achieved with the pointer() function, although pointer() does a lot more work since it constructs a real pointer object, so it is faster to use byref() if you don’t need the pointer object in Python itself.

{% span green, ctypes 暴露了 byref() 函数用于通过引用传递参数，使用 pointer() 函数也能达到同样的效果，只不过 pointer() 需要更多步骤，因为它要先构造一个真实指针对象。所以在 Python 代码本身不需要使用这个指针对象的情况下，使用 byref() 效率更高。 %}

```c
void pass_pointers(int* i, float* f, char* str)
{
    sscanf("1 3.14 Hello", "%d %f %s", i, f, str);
}
```

```python
def test_pass_pointers():

    i = ctypes.c_int()
    f = ctypes.c_float()
    s = ctypes.create_string_buffer(b'\000' * 32)
    print(i.value, f.value, repr(s.value))

    libc = ctypes.CDLL("./libtest.so")
    libc.pass_pointers(ctypes.byref(i), ctypes.byref(f), s)
    print(i.value, f.value, repr(s.value))
```

### Structures and unions

1. 在 `test_ctypes.py` 文件中，添加 `test_structures_unions` 函数。

```python
class POINT(ctypes.Structure):

    _fields_ = [("x", ctypes.c_int), ("y", ctypes.c_int)]

class RECT(ctypes.Structure):

    _fields_ = [("upperleft", POINT), ("lowerright", POINT)]

def test_structures_unions():

    p_1 = POINT(10, 20)
    print(p_1.x, p_1.y)

    p_2 = POINT(y = 5)
    print(p_2.x, p_2.y)

    print("*" * 64)

    rc = RECT(p_1)

    print(rc.upperleft.x, rc.upperleft.y, rc.lowerright.x, rc.lowerright.y)

    print("*" * 64)

    rc_1 = RECT(POINT(1, 2), POINT(3, 4))
    rc_2 = RECT((5, 6), (7, 8))
    print(rc_1.upperleft.x, rc_1.upperleft.y, rc_1.lowerright.x, rc_1.lowerright.y)
    print(rc_2.upperleft.x, rc_2.upperleft.y, rc_2.lowerright.x, rc_2.lowerright.y)

    print("*" * 64)

    print(POINT.x, POINT.y)
```

2. 在 `if __name__ == '__main__':` 中，注释 `test_pass_pointers()`。

```python
#test_pass_pointers()

test_structures_unions()
```

3. 打开 `test_ctypes.py` 文件，点击右上角的 `Run Python File` 按钮，运行 Python 脚本。

{% label output pink %}

```shell
10 20
0 5
****************************************************************
10 20 0 0
****************************************************************
1 2 3 4
5 6 7 8
****************************************************************
<Field type=c_int, ofs=0, size=4> <Field type=c_int, ofs=4, size=4>
```

---

>Structures and unions must derive from the Structure and Union base classes which are defined in the ctypes module. Each subclass must define a _fields_ attribute. _fields_ must be a list of 2-tuples, containing a field name and a field type.

{% span green, 结构体和联合必须继承自 ctypes 模块中的 Structure 和 Union 。子类必须定义 _fields_ 属性。 _fields_ 是一个二元组列表，二元组中包含 field name 和 field type 。 %}

>The field type must be a ctypes type like c_int, or any other derived ctypes type: structure, union, array, pointer.

{% span green, type 字段必须是一个 ctypes 类型，比如 c_int，或者其他 ctypes 类型: 结构体、联合、数组、指针。 %}

```python
class POINT(ctypes.Structure):

    _fields_ = [("x", ctypes.c_int), ("y", ctypes.c_int)]
    
p_1 = POINT(10, 20)
print(p_1.x, p_1.y)

p_2 = POINT(y = 5)
print(p_2.x, p_2.y)
```

---

```python
class RECT(ctypes.Structure):

    _fields_ = [("upperleft", POINT), ("lowerright", POINT)]

rc = RECT(p_1)

print(rc.upperleft.x, rc.upperleft.y, rc.lowerright.x, rc.lowerright.y)
```

>Nested structures can also be initialized in the constructor in several ways.

{% span green, 嵌套结构体可以通过几种方式构造初始化。 %}

```python
rc_1 = RECT(POINT(1, 2), POINT(3, 4))
rc_2 = RECT((5, 6), (7, 8))
print(rc_1.upperleft.x, rc_1.upperleft.y, rc_1.lowerright.x, rc_1.lowerright.y)
print(rc_2.upperleft.x, rc_2.upperleft.y, rc_2.lowerright.x, rc_2.lowerright.y)
```

>Field descriptors can be retrieved from the class, they are useful for debugging because they can provide useful information.

{% span green, 可以通过类获取字段 descriptor，它能提供很多有用的调试信息。 %}

```python
print(POINT.x, POINT.y)
```

---

{% note warning flat %}
ctypes does not support passing unions or structures with bit-fields to functions by value. While this may work on 32-bit x86, it’s not guaranteed by the library to work in the general case. Unions and structures with bit-fields should always be passed to functions by pointer.
{% endnote %}

---

{% note warning flat %}
ctypes 不支持带位域的结构体、联合以值的方式传给函数。这可能在 32 位 x86 平台上可以正常工作，但是对于一般情况，这种行为是未定义的。带位域的结构体、联合应该总是通过指针传递给函数。
{% endnote %}

### Bit fields in structures and unions

1. 在 `test_ctypes.py` 文件中，添加 `test_bit_fields` 函数。

```python
class Int(ctypes.Structure):

    _fields_ = [("first_16", ctypes.c_int, 16), ("second_16", ctypes.c_int, 16)]

def test_bit_fields():

    print(Int.first_16)
    print(Int.second_16)
```

2. 在 `if __name__ == '__main__':` 中，注释 `test_structures_unions()`。

```python
#test_structures_unions()

test_bit_fields()
```

3. 打开 `test_ctypes.py` 文件，点击右上角的 `Run Python File` 按钮，运行 Python 脚本。

{% label output pink %}

```shell
<Field type=c_int, ofs=0:0, bits=16>
<Field type=c_int, ofs=0:16, bits=16>
```

---

>It is possible to create structures and unions containing bit fields. Bit fields are only possible for integer fields, the bit width is specified as the third item in the `_fields_` tuples.

{% span green, 结构体和联合中是可以包含位域字段的。位域只能用于整型字段，位长度通过 _fields_ 中的第三个参数指定。 %}

```python
class Int(ctypes.Structure):

    _fields_ = [("first_16", ctypes.c_int, 16), ("second_16", ctypes.c_int, 16)]

def test_bit_fields():

    print(Int.first_16)
    print(Int.second_16)
```

### Arrays

1. 在 `test_ctypes.py` 文件中，添加 `test_arrays` 函数。

```python
class MyStruct(ctypes.Structure):

    _fields_ = [("a", ctypes.c_int), ("b", ctypes.c_float), ("point_array", POINT * 4)]

def test_arrays():

    TenPointsArrayType = POINT * 10

    arr = TenPointsArrayType()

    for pt in arr:
        print(pt.x, pt.y)

    print("*" * 64)

    print(len(MyStruct().point_array))

    print("*" * 64)

    TenIntegers = ctypes.c_int * 10

    ii = TenIntegers(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

    print(ii)

    for i in ii: print(i, end = " ")

    print()
```

2. 在 `if __name__ == '__main__':` 中，注释 `test_bit_fields()`。

```python
#test_bit_fields()

test_arrays()
```

3. 打开 `test_ctypes.py` 文件，点击右上角的 `Run Python File` 按钮，运行 Python 脚本。

{% label output pink %}

```shell
0 0
0 0
0 0
0 0
0 0
0 0
0 0
0 0
0 0
0 0
****************************************************************
4
****************************************************************
<__main__.c_int_Array_10 object at 0x7f22efcbedc0>
1 2 3 4 5 6 7 8 9 10
```

---

>Arrays are sequences, containing a fixed number of instances of the same type.
>
>The recommended way to create array types is by multiplying a data type with a positive integer.

{% span green, 数组是一个序列，包含指定个数元素，且必须类型相同。创建数组类型的推荐方式是使用一个类型乘以一个正数。 %}

```python
TenPointsArrayType = POINT * 10
```

```python
class MyStruct(ctypes.Structure):

    _fields_ = [("a", ctypes.c_int), ("b", ctypes.c_float), ("point_array", POINT * 4)]

print(len(MyStruct().point_array))
```

```python
arr = TenPointsArrayType()

for pt in arr:
    print(pt.x, pt.y)
```

>Initializers of the correct type can also be specified.

{% span green, 也能通过指定正确类型的数据来初始化。 %}

```python
TenIntegers = ctypes.c_int * 10

ii = TenIntegers(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

print(ii)

for i in ii: print(i, end = " ")

print()
```

### Pointers

1. 在 `test_ctypes.py` 文件中，添加 `test_pointers` 函数。

```python
def test_pointers():

    i = ctypes.c_int(42)
    pi = ctypes.pointer(i)

    print("*" * 64)

    print(pi.contents)

    print("*" * 64)

    print(pi.contents is i)
    print(pi.contents is pi.contents)

    print("*" * 64)

    j = ctypes.c_int(99)
    pi.contents = j
    print(pi.contents)

    print("*" * 64)

    print(pi[0])

    print("*" * 64)

    print(j)
    pi[0] = 22
    print(j)

    print("*" * 64)

    PI = ctypes.POINTER(ctypes.c_int)
    print(PI)
    print(PI(ctypes.c_int(42)))

    print("*" * 64)

    null_ptr = ctypes.POINTER(ctypes.c_int)()
    print(bool(null_ptr))
```

2. 在 `if __name__ == '__main__':` 中，注释 `test_arrays()`。

```python
#test_arrays()

test_pointers()
```

3. 打开 `test_ctypes.py` 文件，点击右上角的 `Run Python File` 按钮，运行 Python 脚本。

{% label output pink %}

```shell
****************************************************************
c_int(42)
****************************************************************
False
False
****************************************************************
c_int(99)
****************************************************************
99
****************************************************************
c_int(99)
c_int(22)
****************************************************************
<class '__main__.LP_c_int'>
<__main__.LP_c_int object at 0x7f354fbb7240>
****************************************************************
False
```

---

```python
ctypes.POINTER(type)
```

This factory function creates and returns a new ctypes pointer type. Pointer types are cached and reused internally, so calling this function repeatedly is cheap. type must be a ctypes type.

---

```python
ctypes.pointer(obj)
```

This function creates a new pointer instance, pointing to obj. The returned object is of the type POINTER(type(obj)).

Note: If you just want to pass a pointer to an object to a foreign function call, you should use byref(obj) which is much faster.

---

>Pointer instances are created by calling the pointer() function on a ctypes type.

{% span green, 可以将 ctypes 类型数据传入 pointer() 函数创建指针。 %}

```python
i = ctypes.c_int(42)
pi = ctypes.pointer(i)
```

>Pointer instances have a contents attribute which returns the object to which the pointer points, the i object above.

{% span green, 指针实例拥有 contents 属性，它返回指针指向的真实对象，如上面的 i 对象。 %}

```python
print(pi.contents)
```

>Note that ctypes does not have OOR (original object return), it constructs a new, equivalent object each time you retrieve an attribute.

{% span green, 注意 ctypes 并没有 OOR（返回原始对象），每次访问这个属性时都会构造返回一个新的相同对象。 %}

```python
print(pi.contents is i)
print(pi.contents is pi.contents)
```

>Assigning another c_int instance to the pointer’s contents attribute would cause the pointer to point to the memory location where this is stored.

{% span green, 将这个指针的 contents 属性赋值为另一个 c_int 实例将会导致该指针指向该实例的内存地址。 %}

```python
j = ctypes.c_int(99)
pi.contents = j
print(pi.contents)
```

>Pointer instances can also be indexed with integers.

{% span green, 指针对象也可以通过整数下标进行访问。 %}

```python
print(pi[0])
```

>Assigning to an integer index changes the pointed to value.

{% span green, 通过整数下标赋值可以改变指针所指向的真实内容。 %}

```python
print(j)
pi[0] = 22
print(j)
```

>It is also possible to use indexes different from 0, but you must know what you’re doing, just as in C: You can access or change arbitrary memory locations. Generally you only use this feature if you receive a pointer from a C function, and you know that the pointer actually points to an array instead of a single item.

{% span green, 使用 0 以外的索引也是合法的，但是你必须确保知道自己为什么这么做，就像 C 语言中: 你可以访问或者修改任意内存内容。通常只会在函数接收指针是才会使用这种特性，而且你知道这个指针指向的是一个数组而不是单个值。 %}

>Behind the scenes, the pointer() function does more than simply create pointer instances, it has to create pointer types first. This is done with the POINTER() function, which accepts any ctypes type, and returns a new type.

{% span green, 内部细节，pointer() 函数不只是创建了一个指针实例，它首先创建了一个指针类型。这是通过调用 POINTER() 函数实现的，它接收 ctypes 类型为参数，返回一个新的类型。 %}

```python
PI = ctypes.POINTER(ctypes.c_int)
print(PI)
print(PI(ctypes.c_int(42)))
```

>Calling the pointer type without an argument creates a NULL pointer. NULL pointers have a False boolean value.

{% span green, 无参调用指针类型可以创建一个 NULL 指针。 NULL 指针的布尔值是 False。 %}

```python
null_ptr = ctypes.POINTER(ctypes.c_int)()
print(bool(null_ptr))
```

>ctypes checks for NULL when dereferencing pointers (but dereferencing invalid non-NULL pointers would crash Python).

{% span green, 解引用指针的时候， ctypes 会帮你检测是否指针为 NULL (但是解引用无效的非 NULL 指针仍会导致 Python 崩溃) %}

### Type conversions





























































### 结语

第十六篇博文写完，开心！！！！

今天，也是充满希望的一天。
