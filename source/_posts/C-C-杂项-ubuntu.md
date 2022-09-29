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

6. [fputc](https://cplusplus.com/reference/cstdio/fputc/)

7. [rewind](https://cplusplus.com/reference/cstdio/rewind/)

8. [fscanf](https://cplusplus.com/reference/cstdio/fscanf/)

9. [fwrite](https://cplusplus.com/reference/cstdio/fwrite/)

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

### Formatted input/output

- `fscanf`: Read formatted data from stream (function)

#### fscanf - `<cstdio>`

`fscanf`: https://cplusplus.com/reference/cstdio/fscanf/ 。

`int fscanf ( FILE * stream, const char * format, ... );`

##### Read `formatted data` from `stream`

Reads data from the stream and `stores` them `according to the parameter format` into the locations pointed by the `additional arguments`.

The `additional arguments` should point to already `allocated objects` of the type specified by their corresponding format specifier within the format string.

##### Parameters

**stream**

1. `Pointer` to `a FILE object` that identifies `the input stream to read data from`.

**format**

`C string` that contains a sequence of characters that `control how characters extracted from the stream` are treated:

- `Whitespace character`: the function will `read` and `ignore` `any whitespace characters` encountered before `the next non-whitespace character` (`whitespace characters` include `spaces`, `newline` and `tab characters`). **`A single whitespace in the format string validates any quantity of whitespace characters extracted from the stream (including none).`**

- `Non-whitespace character, except format specifier (%)`: `Any character` that is not either `a whitespace character` (blank, newline or tab) or part of `a format specifier` (which begin with a % character) causes the function to `read the next character from the stream`, `compare it to this non-whitespace character and if it matches`, it is `discarded` and the function continues with the next character of format. `If the character does not match, the function fails, returning and leaving subsequent characters of the stream unread.`

- `Format specifiers`: A sequence formed by `an initial percentage sign (%) indicates a format specifier`, which is used to specify `the type` and `format` of the data to be retrieved from the stream and `stored` into the locations pointed by the additional arguments.

---

A format specifier for `fscanf` follows this `prototype`:

`%[*][width][length]specifier`

Where `the specifier character` at the end is `the most significant component`, since it defines which characters are extracted, their `interpretation` and `the type of its corresponding argument`:

|specifier|Description|Characters extracted|
|:-:|:-:|:-:|
|`i`, `u`|`Integer`|Any number of `digits`, optionally preceded by a sign (`+` or `-`). `Decimal digits` assumed by default (0-9), but a `0` prefix introduces `octal digits` (0-7), and `0x` `hexadecimal digits` (0-f).|
|`d`|`Decimal integer`|Any number of decimal digits (0-9), optionally preceded by a sign (+ or -).|
|`o`|`Octal integer`|Any number of `octal digits` (0-7), optionally preceded by a sign (+ or -).|
|`x`|`Hexadecimal integer`|Any number of `hexadecimal digits` (0-9, a-f, A-F), optionally preceded by 0x or 0X, and all optionally preceded by a sign (+ or -).|
|`f`, `e`, `g`, `a`|`Floating point number`|`A series of decimal digits`, `optionally containing a decimal point`, optionally preceeded by a sign (`+` or `-`) and optionally followed by the `e` or `E` character and `a decimal integer`. Implementations complying with `C99` also `support hexadecimal floating-point format` when preceded by `0x` or `0X`.|
|`c`|`Character`|`The next character`. `If a width other than 1 is specified, the function reads exactly width characters `and stores them in the successive locations of the array passed as argument. `No null character is appended at the end.`|
|`s`|`String of characters`|`Any number of non-whitespace characters`, stopping at `the first whitespace character` found. `A terminating null character` is automatically added `at the end of the stored sequence`.|
|`p`|`Pointer address`|`A sequence of characters` representing `a pointer`.|
|`[characters]`|Scanset|`Any number of the characters specified between the brackets`.|
|`[^characters]`|`Negated` scanset|Any number of characters `none` of them specified as characters between the brackets.|
|`n`|Count|`No input is consumed`. `The number of characters read so far from stream is stored in the pointed location.`|
|`%`|`%`|A `%` followed by another `%` matches a single `%`.|

Except for `n`, `at least one character` shall be `consumed` by any specifier. Otherwise the match fails, and the scan ends there.

The format specifier can also contain sub-specifiers: `asterisk (*)`, `width` and `length` (in that order), which are optional and follow these specifications:

|sub-specifier|description|
|:-:|:-:|
|`*`|An optional starting `asterisk` indicates that the data is to be read from the stream `but ignored` (i.e. it is not stored in the location pointed by an argument).|
|`width`|Specifiesthe `maximum number of characters` to be read in the current reading operation (`optional`).|
|`length`|One of `hh`, `h`, `l`, `ll`, `j`, `z`, `t`, `L` (optional). This `alters` the expected type of the storage pointed by the corresponding argument.|

|**length**`\`**specifiers**|d i|u o x|f e g a|c s [] [^]|p|n|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|`(none)`|`int*`|`unsigned int*`|`float*`|`char*`|`void**`|`int*`|
|`hh`|`signed char*`|`unsigned char*`||||`signed char*`|
|`h`|`short int*`|`unsigned short int*`||||`short int*`|
|`l`|`long int*`|`unsigned long int*`|`double*`|`wchar_t*`||`long int*`|
|`ll`|`long long int*`|`unsigned long long int*`||||`long long int*`|
|`j`|`intmax_t*`|`uintmax_t*`||||`intmax_t*`|
|`z`|`size_t*`|`size_t*`||||`size_t*`|
|`t`|`ptrdiff_t*`|`ptrdiff_t*`||||`ptrdiff_t*`|
|`L`|||`long double*`||||

**... (additional arguments)**

Depending on the format string, the function may expect a sequence of additional arguments, `each containing a pointer to allocated storage` where `the interpretation of the extracted characters is stored with the appropriate type`.

There should be at least `as many of these arguments as` the number of values stored by the format specifiers. `Additional arguments are ignored by the function.`

These arguments are expected to be `pointers`: to store the result of a fscanf operation on `a regular variable`, its name should be preceded by `the reference operator (&)`.

##### Return Value

On `success`, the function returns `the number of items of the argument list` successfully filled. This count can match the expected number of items or be less (even zero) due to a matching failure, a reading error, or the reach of the end-of-file.

If a reading error happens or the end-of-file is reached while reading, the proper indicator is set (`feof` or `ferror`). And, `if either happens before any data could be successfully read, EOF is returned`.

##### Example

```c++
/* fscanf example */
#include <stdio.h>

int main ()
{
  char str [80];
  float f;
  FILE * pFile;

  pFile = fopen ("myfile.txt","w+");
  fprintf (pFile, "%f %s", 3.1416, "PI");
  rewind (pFile);
  fscanf (pFile, "%f", &f);
  fscanf (pFile, "%s", str);
  fclose (pFile);
  printf ("I have read: %f and %s \n",f,str);
  return 0;
}
```

This sample code creates `a file called myfile.txt` and writes `a float number` and `a string` to it. Then, the stream is `rewinded` and both values are read with `fscanf`.

{% label 输出 pink %}

```bash
I have read: 3.141600 and PI
```

### Character input/output

- `fputc`: Write character to stream (function)

#### fputc - `<cstdio>`

`fputc`: https://cplusplus.com/reference/cstdio/fputc/ 。

`int fputc ( int character, FILE * stream );`

##### 将字符写入流

`Writes a character` to `the stream` and `advances` the position indicator.

The character is written `at the position indicated by the internal position indicator of the stream`, which is then automatically advanced by `one`.

##### 参数

**character**

1. The `int promotion of the character` to be written.

2. The value is internally converted to `an unsigned char` when written.

**stream**

1. Pointer to a `FILE` object that identifies `an output stream`.

##### 返回值

On success, the `character` written is `returned`.

If a writing `error` occurs, `EOF` is returned and the error indicator (ferror) is set.

##### 例子

```c++
/* fputc example: alphabet writer */
#include <stdio.h>

int main ()
{
  FILE * pFile;
  char c;

  pFile = fopen ("alphabet.txt","w");
  if (pFile!=NULL) {

    for (c = 'A' ; c <= 'Z' ; c++)
      fputc ( c , pFile );

    fclose (pFile);
  }
  return 0;
}
```

This program `creates a file` called `alphabet.txt` and writes `ABCDEFGHIJKLMNOPQRSTUVWXYZ` to it.

### Direct input/output

- `fwrite`: Write block of data to stream (function)

#### fwrite - `<cstdio>`

`fwrite`: https://cplusplus.com/reference/cstdio/fwrite/ 。

`size_t fwrite ( const void * ptr, size_t size, size_t count, FILE * stream );`

##### Write block of data to stream

Writes `an array of count elements`, each one with `a size of size bytes`, from `the block of memory pointed by ptr` to `the current position in the stream`.

The `position indicator` of the stream is advanced by `the total number of bytes written`.

Internally, `the function interprets the block pointed by ptr as if it was an array of (size*count) elements of type unsigned char`, and `writes them sequentially to stream` as if `fputc was called for each byte`.

##### Parameters

**ptr**

1. `Pointer to the array of elements to be written`, converted to a const `void*`.

**size**

1. `Size in bytes of each element` to be written. `size_t` is an unsigned integral type.

**count**

1. `Number of elements`, each one with a `size` of size bytes. `size_t` is an unsigned integral type.

**stream**

`Pointer` to `a FILE object` that specifies an output stream.

##### Return Value

The `total number of elements` **successfully** written is returned.

If `this number` differs from the `count` parameter, `a writing error prevented the function from completing`. In this case, `the error indicator (ferror)` will be set for the stream.

If either `size` or `count` is `zero`, the function returns `zero` and `the error indicator remains unchanged.`

`size_t` is an unsigned integral type.

##### Example

```c++
/* fwrite example : write buffer */
#include <stdio.h>

int main ()
{
  FILE * pFile;
  char buffer[] = { 'x' , 'y' , 'z' };
  pFile = fopen ("myfile.bin", "wb");
  fwrite (buffer , sizeof(char), sizeof(buffer), pFile);
  fclose (pFile);
  return 0;
}
```

A file called `myfile.bin` is created and `the content of the buffer is stored into it`. For `simplicity`, the `buffer` contains `char elements` but **`it can contain any other type`**.

`sizeof(buffer)` is the length of the array `in bytes` (in this case it is `three`, because the array has `three` elements of `one byte each`).

### File positioning

- `rewind`: Set position of stream to the beginning (function)

#### rewind - `<cstdio>`

`rewind`: https://cplusplus.com/reference/cstdio/rewind/ 。

`void rewind ( FILE * stream );`

##### Set position of stream to the beginning

Sets `the position indicator` associated with stream to `the beginning of the file`.

The `end-of-file` and `error` internal indicators associated to the `stream` are cleared after `a successful call` to this function, and all effects from previous calls to `ungetc` on this stream are dropped.

On streams open for `update (read+write)`, a call to `rewind` allows to `switch between reading and writing`.

##### Parameters

**stream**

1. `Pointer` to `a FILE object` that identifies the stream.

##### Return Value

`none`

##### Example

```c++
/* rewind example */
#include <stdio.h>

int main ()
{
  int n;
  FILE * pFile;
  char buffer [27];

  pFile = fopen ("myfile.txt","w+");
  for ( n='A' ; n<='Z' ; n++)
    fputc ( n, pFile);
  rewind (pFile);
  fread (buffer,1,26,pFile);
  fclose (pFile);
  buffer[26]='\0';
  puts (buffer);
  return 0;
}
```

A file called `myfile.txt` is created for `reading and writing` and `filled with the alphabet`. The file is then `rewinded`, `read and its content is stored in a buffer`, that then is written to `the standard output`:

```bash
ABCDEFGHIJKLMNOPQRSTUVWXYZ
```

## 结语

第二十九篇博文写完，开心！！！！

今天，也是充满希望的一天。
