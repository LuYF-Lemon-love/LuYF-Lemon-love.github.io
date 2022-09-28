---
title: C/C++ 杂项-ubuntu
tags:
  - Linux
  - C/C++
  - GCC
  - C++11
  - G++
categories: 杂项
description: 介绍一些 C/C++ 标准库和可移植操作系统接口（Portable Operating System Interface，缩写为 POSIX）。
cover: 'https://cos.luyf-lemon-love.space/images/以绪塔尔.png'
swiper_index: 1
abbrlink: 116460760
date: 2022-09-28 14:52:14
---

## 前言

介绍一些 `C/C++` 标准库和可移植操作系统接口（`Portable Operating System Interface`，缩写为 `POSIX`）。

`C/C++ Reference`: https://cplusplus.com/reference/ 。

操作系统：Ubuntu 20.04.4 LTS

## 参考文档

1. [可移植操作系统接口](https://baike.baidu.com/item/%E5%8F%AF%E7%A7%BB%E6%A4%8D%E6%93%8D%E4%BD%9C%E7%B3%BB%E7%BB%9F%E6%8E%A5%E5%8F%A3/12718298?fromtitle=POSIX&fromid=3792413&fr=aladdin)

2. [C/C++ Reference](https://cplusplus.com/reference/)

3. [<cstdio> (stdio.h)](https://cplusplus.com/reference/cstdio/)

4. [fopen](https://cplusplus.com/reference/cstdio/fopen/)

5. [fclose](https://cplusplus.com/reference/cstdio/fclose/)

## <cstdio> (stdio.h)

`<cstdio> (stdio.h)`: https://cplusplus.com/reference/cstdio/ 。

`<cstdio> (stdio.h)`: C library to perform Input/Output operations.

### File access

- `fopen`: Open file (function)

- `fclose`: Close file (function)

#### fopen - `<cstdio>`

`fopen`: https://cplusplus.com/reference/cstdio/fopen/ 。

`FILE * fopen ( const char * filename, const char * mode );`

##### 打开文件

`Opens the file` whose name is specified in `the parameter filename` and `associates it with a stream` that can be identified in future operations by `the FILE pointer` returned.

The `operations` that are allowed on `the stream` and how these are performed are defined by `the mode parameter`.

The returned pointer can be `disassociated` from the file by calling `fclose` or `freopen`. `All opened files are automatically closed on normal program termination`.

##### 参数

**filename**

1. `C string` containing `the name of the file to be opened`.

2. Its value can `include a path`.

**mode**

`C string` containing `a file access mode`. It can be:

- `"r"` -> `read`: `Open file` for `input operations`. The file must exist.

- `"w"` -> `write`: `Create an empty file` for output operations. If a file with `the same name already exists`, its contents are `discarded` and the file is treated as a new empty file.

- `"a"` -> `append`: Open file for `output at the end of a file`. `Output operations always write data at the end of the file`, expanding it. `Repositioning operations` (fseek, fsetpos, rewind) `are ignored`. **The file is created if it does not exist**.

- `"r+"` -> `read/update`: `Open a file for update (both for input and output)`. **The file must exist**.

- `"w+"` -> `write/update`: `Create an empty file` and open it for update (`both for input and output`). If a file with the same name already exists `its contents are discarded` and the file is treated as a new empty file.

- `"a+"` -> `append/update`: Open a file for update (`both for input and output`) with `all output operations writing data at the end of the file`. Repositioning operations (fseek, fsetpos, rewind) affects `the next input operations`, but `output operations move the position back to the end of file`. **The file is created if it does not exist**.

---

With the mode specifiers above the file is open `as a text file`. In order to open a file as `a binary file`, a `"b"` character has to be included in the mode string. This additional `"b"` character can either be appended `at the end of the string` (thus making the following `compound modes`: "rb", "wb", "ab", "r+b", "w+b", "a+b") or be inserted between the letter and the "+" sign for the mixed modes ("rb+", "wb+", "ab+").

---

For files open for update (those which include a `"+"` sign), on which `both input and output operations are allowed`, `the stream shall be flushed (fflush) or repositioned (fseek, fsetpos, rewind) before a reading operation that follows a writing operation`. The stream shall `be repositioned (fseek, fsetpos, rewind) before a writing operation` that follows a `reading operation`(whenever that operation `did not reach the end-of-file`).

##### 返回值

If the file is `successfully opened`, the function returns `a pointer to a FILE object` that can be used to identify the `stream` on future operations.

Otherwise, `a null pointer` is returned.

##### 例子

```c++
/* fopen example */
#include <stdio.h>
int main ()
{
  FILE * pFile;
  pFile = fopen ("myfile.txt","w");
  if (pFile!=NULL)
  {
    fputs ("fopen example",pFile);
    fclose (pFile);
  }
  return 0;
}
```

#### fclose - `<cstdio>`

`fclose`: https://cplusplus.com/reference/cstdio/fclose/ 。

`int fclose ( FILE * stream );`

##### 关闭文件

`Closes the file` associated with the `stream` and `disassociates` it.

`All internal buffers associated with the stream` are disassociated from it and `flushed`: `the content of any unwritten output buffer is written` and `the content of any unread input buffer is discarded`.

Even if the call `fails`, the stream passed as parameter will `no longer be associated with the file` nor its buffers.

##### 参数

**stream**

`Pointer` to a `FILE` object that specifies the stream to be closed.

##### 返回值

If the stream is `successfully closed`, a `zero value` is returned.

On `failure`, `EOF` is returned.

##### 例子

```c++
/* fclose example */
#include <stdio.h>
int main ()
{
  FILE * pFile;
  pFile = fopen ("myfile.txt","wt");
  fprintf (pFile, "fclose example");
  fclose (pFile);
  return 0;
}
```

This simple code `creates a new text file`, then `writes` a sentence to it, and then `closes` it.

## 结语

第二十九篇博文写完，开心！！！！

今天，也是充满希望的一天。
