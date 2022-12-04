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
abbrlink: 116460760
date: 2022-09-28 14:52:14
---

# 前言

介绍一些 `C/C++` 标准库和可移植操作系统接口（`Portable Operating System Interface`，缩写为 `POSIX`）。

`C/C++ Reference`: https://cplusplus.com/reference/ 。

操作系统：Ubuntu 20.04.4 LTS

下面是各个章节的`快速索引`:

1. [C Library](#1)

2. [Containers](#2)

3. [Input/Output Stream Library](#3)

4. [Atomics and threading library](#4)

5. [Miscellaneous headers](#5)

6. [C++ 语法](#6)

7. [计算机基础](#7)

# 参考文档

1. [可移植操作系统接口](https://baike.baidu.com/item/%E5%8F%AF%E7%A7%BB%E6%A4%8D%E6%93%8D%E4%BD%9C%E7%B3%BB%E7%BB%9F%E6%8E%A5%E5%8F%A3/12718298?fromtitle=POSIX&fromid=3792413&fr=aladdin)

2. [C/C++ Reference](https://cplusplus.com/reference/)

3. [`<cstdio>` (stdio.h)](https://cplusplus.com/reference/cstdio/)

4. [fopen](https://cplusplus.com/reference/cstdio/fopen/)

5. [fclose](https://cplusplus.com/reference/cstdio/fclose/)

6. [fputc](https://cplusplus.com/reference/cstdio/fputc/)

7. [rewind](https://cplusplus.com/reference/cstdio/rewind/)

8. [fscanf](https://cplusplus.com/reference/cstdio/fscanf/)

9. [fwrite](https://cplusplus.com/reference/cstdio/fwrite/)

10. [fread](https://cplusplus.com/reference/cstdio/fread/)

11. [`<cstring>` (string.h)](https://cplusplus.com/reference/cstring/)

12. [strcmp](https://cplusplus.com/reference/cstring/strcmp/)

13. [`<string>`](https://cplusplus.com/reference/string/)

14. [`std::to_string`](https://cplusplus.com/reference/string/to_string/)

15. [puts](https://cplusplus.com/reference/cstdio/puts/)

16. [fputs](https://cplusplus.com/reference/cstdio/fputs/)

17. [右移运算符](https://baike.baidu.com/item/%E5%8F%B3%E7%A7%BB%E8%BF%90%E7%AE%97%E7%AC%A6)

18. [exp](https://cplusplus.com/reference/cmath/exp/)

19. [calloc](https://cplusplus.com/reference/cstdlib/calloc/)

20. [memcpy](https://cplusplus.com/reference/cstring/memcpy/)

21. [memset](https://cplusplus.com/reference/cstring/memset/)

22. [free](https://cplusplus.com/reference/cstdlib/free/)

23. [atof](https://cplusplus.com/reference/cstdlib/atof/)

24. [atoi](https://cplusplus.com/reference/cstdlib/atoi/)

25. [memcmp](https://cplusplus.com/reference/cstring/memcmp/)

26. [`<algorithm>`](https://cplusplus.com/reference/algorithm/)

27. [sort](https://cplusplus.com/reference/algorithm/sort/)

28. [fabs](https://cplusplus.com/reference/cmath/fabs/)

29. [c_str](https://cplusplus.com/reference/string/string/c_str/)

30. [rand](https://cplusplus.com/reference/cstdlib/rand/)

31. [ASCII](https://baike.baidu.com/item/ASCII/309296?fr=aladdin)

32. [cout](https://cplusplus.com/reference/iostream/cout/)

33. [pair](https://cplusplus.com/reference/utility/pair/)

34. [begin](https://cplusplus.com/reference/iterator/begin/)

35. [fprintf](https://cplusplus.com/reference/cstdio/fprintf/)

36. [fgetc](https://cplusplus.com/reference/cstdio/fgetc/)

37. [feof](https://cplusplus.com/reference/cstdio/feof/)

38. [cerr](https://cplusplus.com/reference/iostream/cerr/)

39. [min](https://cplusplus.com/reference/algorithm/min/)

40. [std::map::operator[]](https://cplusplus.com/reference/map/map/operator[]/)

41. [std::vector::operator[]](https://cplusplus.com/reference/vector/vector/operator[]/)

42. [size](https://cplusplus.com/reference/map/map/size/)

43. [size](https://cplusplus.com/reference/vector/vector/size/)

44. [clear](https://cplusplus.com/reference/map/map/clear/)

45. [clear](https://cplusplus.com/reference/vector/vector/clear/)

46. [count](https://cplusplus.com/reference/map/map/count/)

47. [resize](https://cplusplus.com/reference/vector/vector/resize/)

48. [operator=](https://cplusplus.com/reference/vector/vector/operator=/)

49. [push_back](https://cplusplus.com/reference/vector/vector/push_back/)

50. [fseek](https://cplusplus.com/reference/cstdio/fseek/)

<div id = "1"></div>

# `C Library`

## `<cmath>` (math.h)

`<cmath> (math.h)`: https://cplusplus.com/reference/cmath/ 。

`<cmath> (math.h)`: C numerics library.

### Exponential and logarithmic functions

- `exp`: Compute exponential function (function)

#### exp

`exp`: https://cplusplus.com/reference/cmath/exp/ 。

`double exp (double x);`

**`Compute exponential function`**

`Returns` the `base-e` exponential function of `x`, which is `e` raised to the power $x: e^x$.

**`Parameters`**

**x**

1. Value of the exponent.

**`Return Value`**

Exponential value of `x`.

**`Example`**

```c++
/* exp example */
#include <stdio.h>      /* printf */
#include <math.h>       /* exp */

int main ()
{
  double param, result;
  param = 5.0;
  result = exp (param);
  printf ("The exponential value of %f is %f.\n", param, result );
  return 0;
}
```

{% label 输出 pink %}

```bash
The exponential value of 5.000000 is 148.413159.
```

### Other functions

- `fabs`: Compute absolute value (function)

#### fabs

`fabs`: https://cplusplus.com/reference/cmath/fabs/ 。

`double fabs (double x);`

**`Compute absolute value`**

Returns the `absolute value` of `x: |x|`.

**`Parameters`**

**x**

1. Value whose absolute value is returned.

**`Return Value`**

The absolute value of `x`.

**`Example`**

```c++
/* fabs example */
#include <stdio.h>      /* printf */
#include <math.h>       /* fabs */

int main ()
{
  printf ("The absolute value of 3.1416 is %f\n", fabs (3.1416) );
  printf ("The absolute value of -10.6 is %f\n", fabs (-10.6) );
  return 0;
}
```

{% label 输出 pink %}

```bash
The absolute value of 3.1416 is 3.141600
The absolute value of -10.6 is 10.600000
```

## `<cstdio>` (stdio.h)

`<cstdio> (stdio.h)`: https://cplusplus.com/reference/cstdio/ 。

`<cstdio> (stdio.h)`: C library to perform Input/Output operations.

### File access

- `fopen`: Open file (function)

- `fclose`: Close file (function)

#### fopen

`fopen`: https://cplusplus.com/reference/cstdio/fopen/ 。

`FILE * fopen ( const char * filename, const char * mode );`

**`打开文件`**

`Opens the file` whose name is specified in `the parameter filename` and `associates it with a stream` that can be identified in future operations by `the FILE pointer` returned.

The `operations` that are allowed on `the stream` and how these are performed are defined by `the mode parameter`.

The returned pointer can be `disassociated` from the file by calling `fclose` or `freopen`. `All opened files are automatically closed on normal program termination`.

**`参数`**

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

**`返回值`**

If the file is `successfully opened`, the function returns `a pointer to a FILE object` that can be used to identify the `stream` on future operations.

Otherwise, `a null pointer` is returned.

**`例子`**

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

#### fclose

`fclose`: https://cplusplus.com/reference/cstdio/fclose/ 。

`int fclose ( FILE * stream );`

**`关闭文件`**

`Closes the file` associated with the `stream` and `disassociates` it.

`All internal buffers associated with the stream` are disassociated from it and `flushed`: `the content of any unwritten output buffer is written` and `the content of any unread input buffer is discarded`.

Even if the call `fails`, the stream passed as parameter will `no longer be associated with the file` nor its buffers.

**`参数`**

**stream**

`Pointer` to a `FILE` object that specifies the stream to be closed.

**`返回值`**

If the stream is `successfully closed`, a `zero value` is returned.

On `failure`, `EOF` is returned.

**`例子`**

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

- `fprintf`: Write formatted data to stream (function)

- `fscanf`: Read formatted data from stream (function)

#### fprintf

`fprintf`: https://cplusplus.com/reference/cstdio/fprintf/ 。

`int fprintf ( FILE * stream, const char * format, ... );`

**`Write formatted data to stream`**

Writes the `C` string pointed by `format` to the `stream`. If `format` includes `format specifiers` (subsequences beginning with `%`), the additional arguments following format are `formatted` and inserted in the resulting string replacing their respective specifiers.

After the `format` parameter, the function expects at least as many additional arguments as specified by `format`.

**`Parameters`**

**stream**

1. `Pointer` to a `FILE` object that identifies `an output stream`.

**format**

`C string` that contains the text to be written to the stream.

It can optionally contain embedded `format specifiers` that are replaced by the values specified in subsequent additional arguments and formatted as requested.

`A format specifier` follows this prototype:

`%[flags][width][.precision][length]specifier`

**`Return Value`**

`On success`, `the total number of characters written` is returned.

If a writing error occurs, the `error indicator` (`ferror`) is set and `a negative number is returned`.

If a multibyte character encoding error occurs while writing wide characters, `errno` is set to EILSEQ and a negative number is returned.

**`Example`**

```c++
/* fprintf example */
#include <stdio.h>

int main ()
{
   FILE * pFile;
   int n;
   char name [100];

   pFile = fopen ("myfile.txt","w");
   for (n=0 ; n<3 ; n++)
   {
     puts ("please, enter a name: ");
     gets (name);
     fprintf (pFile, "Name %d [%-10.10s]\n",n+1,name);
   }
   fclose (pFile);

   return 0;
}
```

This example prompts `3 times` the user for `a name` and then writes them to `myfile.txt` each one in a line with a fixed length (a total of 19 characters + newline).

Two format tags are used:

`%d` : `Signed decimal integer`

`%-10.10s` : `left-justified (-)`, `minimum of ten characters (10)`, `maximum of ten characters (.10)`, `string (s)`.

Assuming that we have entered `John`, `Jean-Francois` and `Yoko` as the 3 names, `myfile.txt` would contain:

```
Name 1 [John      ] 
Name 2 [Jean-Franc] 
Name 3 [Yoko      ]
```

#### fscanf

`fscanf`: https://cplusplus.com/reference/cstdio/fscanf/ 。

`int fscanf ( FILE * stream, const char * format, ... );`

**`Read formatted data from stream`**

Reads data from the stream and `stores` them `according to the parameter format` into the locations pointed by the `additional arguments`.

The `additional arguments` should point to already `allocated objects` of the type specified by their corresponding format specifier within the format string.

**`Parameters`**

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

**`Return Value`**

On `success`, the function returns `the number of items of the argument list` successfully filled. This count can match the expected number of items or be less (even zero) due to a matching failure, a reading error, or the reach of the end-of-file.

If a reading error happens or the end-of-file is reached while reading, the proper indicator is set (`feof` or `ferror`). And, `if either happens before any data could be successfully read, EOF is returned`.

**`Example`**

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

- `fgetc`: Get character from stream (function)

- `fputc`: Write character to stream (function)

- `fputs`: Write string to stream (function)

- `puts`: Write string to stdout (function)

#### fgetc

`fgetc`: https://cplusplus.com/reference/cstdio/fgetc/ 。

`int fgetc ( FILE * stream );`

**`Get character from stream`**

Returns `the character` currently pointed by the internal file position indicator of the specified stream. `The internal file position indicator is then advanced to the next character`.

If the stream is at `the end-of-file` when called, the function returns `EOF` and `sets the end-of-file indicator` for the stream (`feof`).

If a read error occurs, the function returns `EOF` and sets `the error indicator` for the stream (`ferror`).

`fgetc` and `getc` are equivalent, except that `getc` may be implemented as a `macro` in `some libraries`.

**`Parameters`**

**stream**

1. Pointer to a `FILE` object that `identifies an input stream`.

**`Return Value`**

On success, `the character read is returned` (promoted to `an int value`).

`The return type` is int to accommodate for the special value `EOF`, which indicates failure:

1. If the position indicator was at `the end-of-file`, the function returns `EOF` and `sets the eof indicator (feof) of stream`.

2. If `some other reading error happens`, the function also returns `EOF`, but `sets its error indicator (ferror)` instead.

**`Example`**

```c++
/* fgetc example: money counter */
#include <stdio.h>
int main ()
{
  FILE * pFile;
  int c;
  int n = 0;
  pFile=fopen ("myfile.txt","r");
  if (pFile==NULL) perror ("Error opening file");
  else
  {
    do {
      c = fgetc (pFile);
      if (c == '$') n++;
    } while (c != EOF);
    fclose (pFile);
    printf ("The file contains %d dollar sign characters ($).\n",n);
  }
  return 0;
}
```

This program reads an existing file called `myfile.txt` character by character and uses the `n` variable to `count` how many dollar characters (`$`) the file contains.

#### fputc

`fputc`: https://cplusplus.com/reference/cstdio/fputc/ 。

`int fputc ( int character, FILE * stream );`

**`将字符写入流`**

`Writes a character` to `the stream` and `advances` the position indicator.

The character is written `at the position indicated by the internal position indicator of the stream`, which is then automatically advanced by `one`.

**`参数`**

**character**

1. The `int promotion of the character` to be written.

2. The value is internally converted to `an unsigned char` when written.

**stream**

1. Pointer to a `FILE` object that identifies `an output stream`.

**`返回值`**

On success, the `character` written is `returned`.

If a writing `error` occurs, `EOF` is returned and the error indicator (ferror) is set.

**`例子`**

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

#### fputs

`fputs`: https://cplusplus.com/reference/cstdio/fputs/ 。

`int fputs ( const char * str, FILE * stream );`

**`Write string to stream`**

Writes the `C string` pointed by `str` to the stream.

The function begins `copying from the address` specified (`str`) until it reaches `the terminating null character` ('\0'). `This terminating null-character is not copied to the stream.`

Notice that `fputs` not only differs from `puts` in that the destination `stream` can be specified, but also `fputs` does not write additional characters, while `puts` appends `a newline character` at the end automatically.

**`Parameters`**

**str**

1. `C string` with the content to be written to `stream`.

**stream**

2. `Pointer to a FILE object` that identifies an output stream.

**`Return Value`**

On `success`, a `non-negative` value is returned.

On `error`, the function returns `EOF` and sets the error indicator (`ferror`).

**`Example`**

```c++
/* fputs example */
#include <stdio.h>

int main ()
{
   FILE * pFile;
   char sentence [256];

   printf ("Enter sentence to append: ");
   fgets (sentence,256,stdin);
   pFile = fopen ("mylog.txt","a");
   fputs (sentence,pFile);
   fclose (pFile);
   return 0;
}
```

This program allows to `append a line` to a file called `mylog.txt` each time it is run.

#### puts

`puts`: https://cplusplus.com/reference/cstdio/puts/ 。

`int puts ( const char * str );`

**`Write string to stdout`**

Writes the `C string` pointed by `str` to the standard output (`stdout`) and `appends a newline character ('\n')`.

The function begins copying from the address specified (`str`) until it reaches the `terminating null character` ('\0'). `This terminating null-character is not copied to the stream.`

Notice that `puts` not only differs from `fputs` in that it uses `stdout as destination`, but `it also appends a newline character at the end automatically` (which `fputs` does not).

**`Parameters`**

**str**

1. `C string` to be printed.

**`Return Value`**

On `success`, a `non-negative value` is returned.

On `error`, the function returns `EOF` and `sets the error indicator (ferror)`.

**`Example`**

```c++
/* puts example : hello world! */
#include <stdio.h>

int main ()
{
  char string [] = "Hello world!";
  puts (string);
}
```

{% label 输出 pink %}

```bash
Hello world!
```

### Direct input/output

- `fread`: Read block of data from stream (function)

- `fwrite`: Write block of data to stream (function)

#### fread

`fread`: https://cplusplus.com/reference/cstdio/fread/ 。

`size_t fread ( void * ptr, size_t size, size_t count, FILE * stream );`

**`Read block of data from stream`**

`Reads an array of count elements`, each one with `a size of size bytes`, from the stream and `stores them in the block of memory specified by ptr`.

The position indicator of the stream is `advanced` by the `total amount of bytes read`.

The `total amount of bytes read` if successful is (`size*count`).

**`Parameters`**

**ptr**

1. `Pointer to a block of memory` with a size of at least (`size*count`) bytes, converted to a `void*`.

**size**

1. `Size`, `in bytes`, of each element to be read. `size_t` is an unsigned integral type.

**count**

1. `Number of elements`, each one with `a size of size bytes`. `size_t` is an unsigned integral type.

**stream**

1. `Pointer` to a `FILE object` that specifies an input stream.

**`Return Value`**

`The total number of elements` successfully read is returned.

If this number `differs` from the `count` parameter, either a reading `error` occurred or the `end-of-file` was reached while reading. In both cases, the proper indicator is set, which can be checked with `ferror` and `feof`, respectively.

If either `size` or `count` is zero, the function returns `zero` and both the stream state and the content pointed by `ptr` remain `unchanged`.

`size_t` is an unsigned integral type.

**`Example`**

```c++
/* fread example: read an entire file */
#include <stdio.h>
#include <stdlib.h>

int main () {
  FILE * pFile;
  long lSize;
  char * buffer;
  size_t result;

  pFile = fopen ( "myfile.bin" , "rb" );
  if (pFile==NULL) {fputs ("File error",stderr); exit (1);}

  // obtain file size:
  fseek (pFile , 0 , SEEK_END);
  lSize = ftell (pFile);
  rewind (pFile);

  // allocate memory to contain the whole file:
  buffer = (char*) malloc (sizeof(char)*lSize);
  if (buffer == NULL) {fputs ("Memory error",stderr); exit (2);}

  // copy the file into the buffer:
  result = fread (buffer,1,lSize,pFile);
  if (result != lSize) {fputs ("Reading error",stderr); exit (3);}

  /* the whole file is now loaded in the memory buffer. */

  // terminate
  fclose (pFile);
  free (buffer);
  return 0;
}
```

This code loads `myfile.bin` into a `dynamically` allocated `memory buffer`, which can be used to `manipulate` the content of a file as `an array`.

{% label 输出 pink %}

```bash
File error 
```

#### fwrite

`fwrite`: https://cplusplus.com/reference/cstdio/fwrite/ 。

`size_t fwrite ( const void * ptr, size_t size, size_t count, FILE * stream );`

**`Write block of data to stream`**

Writes `an array of count elements`, each one with `a size of size bytes`, from `the block of memory pointed by ptr` to `the current position in the stream`.

The `position indicator` of the stream is advanced by `the total number of bytes written`.

Internally, `the function interprets the block pointed by ptr as if it was an array of (size*count) elements of type unsigned char`, and `writes them sequentially to stream` as if `fputc was called for each byte`.

**`Parameters`**

**ptr**

1. `Pointer to the array of elements to be written`, converted to a const `void*`.

**size**

1. `Size in bytes of each element` to be written. `size_t` is an unsigned integral type.

**count**

1. `Number of elements`, each one with a `size` of size bytes. `size_t` is an unsigned integral type.

**stream**

1. `Pointer` to `a FILE object` that specifies an output stream.

**`Return Value`**

The `total number of elements` **successfully** written is returned.

If `this number` differs from the `count` parameter, `a writing error prevented the function from completing`. In this case, `the error indicator (ferror)` will be set for the stream.

If either `size` or `count` is `zero`, the function returns `zero` and `the error indicator remains unchanged.`

`size_t` is an unsigned integral type.

**`Example`**

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

- `fseek`: Reposition stream position indicator (function)

- `rewind`: Set position of stream to the beginning (function)

#### fseek

`fseek`: https://cplusplus.com/reference/cstdio/fseek/ 。

`int fseek ( FILE * stream, long int offset, int origin );`

**`Reposition stream position indicator`**

Sets `the position indicator` associated with the stream to `a new position`.

For streams `open in binary mode`, the new position is defined by adding `offset` to a reference position specified by `origin`.

For streams `open in text mode`, offset shall either be `zero` or a value returned by a previous call to `ftell`, and origin shall necessarily be `SEEK_SET`.

If the function is called with other values for these arguments, support depends on `the particular system` and `library implementation` (non-portable).

The `end-of-file internal indicator` of the `stream` is cleared after a successful call to this function, and all effects from previous calls to `ungetc` on this `stream` are dropped.

On streams open for update (`read+write`), a call to `fseek` allows to switch between reading and writing.

**`Parameters`**

**stream**

1. `Pointer` to a `FILE` object that identifies the stream.

**offset**

1. `Binary files`: Number of bytes to offset from `origin`.

2. `Text files`: Either `zero`, or a `value` returned by `ftell`.

**origin**

Position used as reference for the `offset`. It is specified by one of the following constants defined in `<cstdio>` exclusively to be used as arguments for this function:

|Constant|Reference position|
|:-:|:-:|
|SEEK_SET|Beginning of file|
|SEEK_CUR|Current position of the file pointer|
|SEEK_END|`End of file *`|

`* Library` implementations are allowed to not meaningfully support `SEEK_END` (therefore, code using it has no real standard portability).

**`Return Value`**

1. If successful, the function returns `zero`.

2. Otherwise, it returns `non-zero` value.

3. If a read or write error occurs, the `error indicator` (`ferror`) is set.

**`Example`**

```c++
/* fseek example */
#include <stdio.h>

int main ()
{
  FILE * pFile;
  pFile = fopen ( "example.txt" , "wb" );
  fputs ( "This is an apple." , pFile );
  fseek ( pFile , 9 , SEEK_SET );
  fputs ( " sam" , pFile );
  fclose ( pFile );
  return 0;
}
```

After this code is successfully executed, the file `example.txt` contains:

```bash
This is a sample.
```

#### rewind

`rewind`: https://cplusplus.com/reference/cstdio/rewind/ 。

`void rewind ( FILE * stream );`

**`Set position of stream to the beginning`**

Sets `the position indicator` associated with stream to `the beginning of the file`.

The `end-of-file` and `error` internal indicators associated to the `stream` are cleared after `a successful call` to this function, and all effects from previous calls to `ungetc` on this stream are dropped.

On streams open for `update (read+write)`, a call to `rewind` allows to `switch between reading and writing`.

**`Parameters`**

**stream**

1. `Pointer` to `a FILE object` that identifies the stream.

**`Return Value`**

`none`

**`Example`**

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

### Error-handling

- `feof`: Check end-of-file indicator (function)

#### feof

`feof`: https://cplusplus.com/reference/cstdio/feof/ 。

`int feof ( FILE * stream );`

**`Check end-of-file indicator`**

Checks whether the `end-of-File indicator` associated with `stream` is set, `returning a value different from zero` if it is.

This `indicator` is generally set by a previous operation on the `stream` that attempted to read at or past `the end-of-file`.

Notice that stream's internal position indicator may point to the `end-of-file` for the next operation, but still, the `end-of-file` indicator may not be set until an operation attempts to read at that point.

This indicator is cleared by a call to `clearerr`, `rewind`, `fseek`, `fsetpos` or `freopen`. Although if `the position indicator` is not repositioned by such a call, the next i/o operation is likely to set the indicator again.

**`Parameters`**

**stream**

1. `Pointer` to a `FILE` object that identifies the stream.

**`Return Value`**

`A non-zero value` is returned in the case that the `end-of-file` indicator associated with the stream is set.

Otherwise, `zero is returned`.

**`Example`**

```c++
/* feof example: byte counter */
#include <stdio.h>

int main ()
{
  FILE * pFile;
  int n = 0;
  pFile = fopen ("myfile.txt","rb");
  if (pFile==NULL) perror ("Error opening file");
  else
  {
    while (fgetc(pFile) != EOF) {
      ++n;
    }
    if (feof(pFile)) {
      puts ("End-of-File reached.");
      printf ("Total number of bytes read: %d\n", n);
    }
    else puts ("End-of-File was not reached.");
    fclose (pFile);
  }
  return 0;
}
```

This `code` opens the file called `myfile.txt`, and counts the number of characters that it contains by reading all of them one by one. The program `checks` whether `the end-of-file` was reached, and if so, `prints the total number of bytes read`.

## `<cstdlib>` (stdlib.h)

`<cstdlib> (stdlib.h)`: https://cplusplus.com/reference/cstdlib/ 。

`<cstdlib> (stdlib.h)`: C Standard General Utilities Library.

### String conversion

- `atof`: Convert string to double (function)

- `atoi`: Convert string to integer (function)

#### atof

`atof`: https://cplusplus.com/reference/cstdlib/atof/ 。

`double atof (const char* str);`

**`Convert string to double`**

`Parses the C string str`, interpreting its content as `a floating point number` and returns its value as `a double`.

The function first `discards as many whitespace characters` (as in `isspace`) as necessary until `the first non-whitespace character is found`. Then, starting from this character, `takes as many characters as possible that are valid following a syntax resembling that of floating point literals`, and interprets them as `a numerical value`. `The rest of the string after the last valid character` is `ignored` and has no effect on the behavior of this function.

If `the first sequence of non-whitespace characters` in str `does not form a valid floating-point number` as just defined, or if `no such sequence exists` because either `str` is `empty` or contains only `whitespace characters`, no conversion is performed and `the function returns 0.0`.

**`Parameters`**

**str**

1. `C-string` beginning with the representation of `a floating-point number`.

**`Return Value`**

On `success`, the function returns the converted floating point number as a `double value`.

If `no valid conversion` could be performed, the function returns `zero (0.0)`.

If the converted value would be out of the range of representable values by `a double`, it causes `undefined behavior`.

See `strtod` for a more `robust cross-platform alternative` when this is a possibility.

**`Example`**

```c++
/* atof example: sine calculator */
#include <stdio.h>      /* printf, fgets */
#include <stdlib.h>     /* atof */
#include <math.h>       /* sin */

int main ()
{
  double n,m;
  double pi=3.1415926535;
  char buffer[256];
  printf ("Enter degrees: ");
  fgets (buffer,256,stdin);
  n = atof (buffer);
  m = sin (n*pi/180);
  printf ("The sine of %f degrees is %f\n" , n, m);
  return 0;
}
```

{% label 输出 pink %}

```bash
Enter degrees: 45
The sine of 45.000000 degrees is 0.707101

```

**`Exceptions (C++)`**

`No-throw guarantee`: this function `never` throws exceptions.

If `str` does not point to `a valid C-string`, or if the converted value would be out of the range of values representable by `a double`, it causes `undefined behavior`.

#### atoi

`atoi`: https://cplusplus.com/reference/cstdlib/atoi/ 。

`int atoi (const char * str);`

**`Convert string to integer`**

Parses the C-string `str` interpreting its content as `an integral number`, which is returned as a value of type `int`.

The function first `discards as many whitespace characters` (as in `isspace`) as necessary until `the first non-whitespace character is found`. Then, starting from this character, takes an optional initial `plus` or `minus` sign followed by as `many base-10 digits` as possible, and interprets them as `a numerical value`.

The string can contain `additional characters` after those that `form the integral number`, which are `ignored` and `have no effect on the behavior of this function`.

If `the first sequence of non-whitespace characters` in `str` is `not a valid integral number`, or if `no such sequence` exists because either `str is empty` or it contains only `whitespace characters`, no conversion is performed and `zero is returned`.

**`Parameters`**

**str**

1. `C-string` beginning with the representation of an integral number.

**`Return Value`**

On `success`, the function returns the converted integral number as an `int` value.

If the converted value would be out of the range of representable values by `an int`, it causes `undefined behavior`.

See `strtol` for a more `robust cross-platform alternative` when this is a possibility.

**`Example`**

```c++
/* atoi example */
#include <stdio.h>      /* printf, fgets */
#include <stdlib.h>     /* atoi */

int main ()
{
  int i;
  char buffer[256];
  printf ("Enter a number: ");
  fgets (buffer, 256, stdin);
  i = atoi (buffer);
  printf ("The value entered is %d. Its double is %d.\n",i,i*2);
  return 0;
}
```

{% label 输出 pink %}

```bash
Enter a number: 73
The value entered is 73. Its double is 146.

```

**`Exceptions (C++)`**

`No-throw guarantee`: this function never throws exceptions.

If `str` does not point to a valid C-string, or if the converted value would be out of the range of values representable by an `int`, it causes `undefined behavior`.

### Pseudo-random sequence generation

- `rand`: Generate random number (function)

#### rand

`rand`: https://cplusplus.com/reference/cstdlib/rand/ 。

`int rand (void);`

**`Generate random number`**

Returns a pseudo-random integral number in the range between `0` and `RAND_MAX`.

This number is generated by an algorithm that returns a sequence of apparently non-related numbers each time it is called. This algorithm uses a `seed` to generate the series, which should be initialized to some distinctive value using function `srand`.

`RAND_MAX` is a constant defined in `<cstdlib>`.

A typical way to generate trivial pseudo-random numbers in a determined range using rand is to use the modulo of the returned value by the range span and add the initial value of the range:

```c++
v1 = rand() % 100;         // v1 in the range 0 to 99
v2 = rand() % 100 + 1;     // v2 in the range 1 to 100
v3 = rand() % 30 + 1985;   // v3 in the range 1985-2014
```

Notice though that `this modulo operation does not generate uniformly distributed random numbers in the span` (since in most cases this operation makes lower numbers slightly more likely).

C++ supports `a wide range of powerful tools` to generate random and pseudo-random numbers (see `<random>` for more info).

**`Parameters`**

**(none)**

**`Return Value`**

`An integer value` between `0` and `RAND_MAX`.

**`Example`**

```c++
/* rand example: guess the number */
#include <stdio.h>      /* printf, scanf, puts, NULL */
#include <stdlib.h>     /* srand, rand */
#include <time.h>       /* time */

int main ()
{
  int iSecret, iGuess;

  /* initialize random seed: */
  srand (time(NULL));

  /* generate secret number between 1 and 10: */
  iSecret = rand() % 10 + 1;

  do {
    printf ("Guess the number (1 to 10): ");
    scanf ("%d",&iGuess);
    if (iSecret<iGuess) puts ("The secret number is lower");
    else if (iSecret>iGuess) puts ("The secret number is higher");
  } while (iSecret!=iGuess);

  puts ("Congratulations!");
  return 0;
}
```

In this example, `the random seed` is initialized to a value representing `the current time` (calling `time`) to generate a different value every time the program is run.

{% label 可能的输出 pink %}

```bash
Guess the number (1 to 10): 5
The secret number is higher
Guess the number (1 to 10): 8
The secret number is lower
Guess the number (1 to 10): 7
Congratulations!
```

### Dynamic memory management

- `calloc`: Allocate and zero-initialize array (function)

- `free`: Deallocate memory block (function)

#### calloc

`calloc`: https://cplusplus.com/reference/cstdlib/calloc/ 。

`void* calloc (size_t num, size_t size);`

**`Allocate and zero-initialize array`**

`Allocates` a block of memory for `an array of num elements`, each of them `size` bytes long, and `initializes all its bits to zero`.

`The effective result` is the `allocation` of `a zero-initialized memory block` of (`num*size`) bytes.

If `size` is `zero`, the return value depends on `the particular library implementation` (it may or may not be `a null pointer`), but `the returned pointer shall not be dereferenced`.

**`Parameters`**

**num**

1. Number of elements to allocate.

**size**

1. Size of each element.

`size_t` is an unsigned integral type.

**`Return Value`**

On `success`, a `pointer` to `the memory block allocated by the function`.

The type of `this pointer` is always `void*`, which can be cast to `the desired type of data pointer` in order to be `dereferenceable`.

If the function `failed` to `allocate the requested block of memory`, `a null pointer` is returned.

**`Example`**

```c++
/* calloc example */
#include <stdio.h>      /* printf, scanf, NULL */
#include <stdlib.h>     /* calloc, exit, free */

int main ()
{
  int i,n;
  int * pData;
  printf ("Amount of numbers to be entered: ");
  scanf ("%d",&i);
  pData = (int*) calloc (i,sizeof(int));
  if (pData==NULL) exit (1);
  for (n=0;n<i;n++)
  {
    printf ("Enter number #%d: ",n+1);
    scanf ("%d",&pData[n]);
  }
  printf ("You have entered: ");
  for (n=0;n<i;n++) printf ("%d ",pData[n]);
  free (pData);
  return 0;
}
```

This program simply `stores numbers` and then `prints them out`. But the number of items it stores can be adapted each time the program is executed because it allocates the needed memory during runtime.

**`Data races`**

`Only the storage referenced by the returned pointer is modified.` No other storage locations are accessed by the call.

If the function `reuses the same unit of storage released` by `a deallocation function` (such as `free` or `realloc`), the functions are synchronized `in such a way that the deallocation happens entirely before the next allocation`.

#### free

`free`: https://cplusplus.com/reference/cstdlib/free/ 。

`void free (void* ptr);`

**`Deallocate memory block`**

`A block of memory` previously `allocated` by a call to `malloc`, `calloc` or `realloc` is `deallocated`, making it available again for `further allocations`.

If `ptr` does not point to `a block of memory allocated with the above functions`, it causes `undefined behavior`.

If `ptr` is a `null pointer`, the function `does nothing`.

Notice that `this function does not change the value of ptr itself`, hence it still points to `the same (now invalid) location`.

**`Parameters`**

**ptr**

1. `Pointer` to a memory block previously allocated with `malloc`, `calloc` or `realloc`.

**`Return Value`**

none

**`Example`**

```c++
/* free example */
#include <stdlib.h>     /* malloc, calloc, realloc, free */

int main ()
{
  int * buffer1, * buffer2, * buffer3;
  buffer1 = (int*) malloc (100*sizeof(int));
  buffer2 = (int*) calloc (100,sizeof(int));
  buffer3 = (int*) realloc (buffer2,500*sizeof(int));
  free (buffer1);
  free (buffer3);
  return 0;
}
```

`This program has no output`. It just demonstrates some ways to `allocate and free dynamic memory` using the `C stdlib` functions.

**`Data races`**

Only the storage referenced by `ptr` is modified. `No other storage locations are accessed by the call`.

If the function releases `a unit of storage` that is `reused` by a call to `allocation functions` (such as `calloc` or `malloc`), the functions are synchronized `in such a way` that `the deallocation happens entirely before the next allocation`.

**`Exceptions (C++)`**

`No-throw guarantee`: this function never throws exceptions.

If `ptr` does not point to a memory block previously allocated with `malloc`, `calloc` or `realloc`, and is not a `null pointer`, it causes `undefined behavior`.

## `<cstring>` (string.h)

`<cstring> (string.h)`: https://cplusplus.com/reference/cstring/ 。

`<cstring> (string.h)`: C Strings.

### Copying

- `memcpy`: Copy block of memory (function)

#### memcpy

`memcpy`: https://cplusplus.com/reference/cstring/memcpy/ 。

`void * memcpy ( void * destination, const void * source, size_t num );`

**`Copy block of memory`**

`Copies` the values of `num` bytes from the location pointed to by `source` directly to the memory block pointed to by `destination`.

The underlying type of the objects pointed to by both the `source` and `destination` pointers are irrelevant for this function; `The result is a binary copy of the data`.

The function does not check for any terminating null character `in source` - it always copies exactly `num` bytes.

To avoid `overflows`, the size of the arrays pointed to by both the `destination` and `source` parameters, shall be at least `num` bytes, and should not overlap (for `overlapping memory blocks`, `memmove` is a safer approach).

**`Parameters`**

**destination**

1. `Pointer to the destination array` where the content is to be copied, type-casted to a pointer of type `void*`.

**source**

1. `Pointer to the source of data` to be copied, type-casted to a pointer of type const `void*`.

**num**

1. `Number` of bytes to copy.

2. `size_t` is an unsigned integral type.

**`Return Value`**

`destination` is returned.

**`Example`**

```c++
/* memcpy example */
#include <stdio.h>
#include <string.h>

struct {
  char name[40];
  int age;
} person, person_copy;

int main ()
{
  char myname[] = "Pierre de Fermat";

  /* using memcpy to copy string: */
  memcpy ( person.name, myname, strlen(myname)+1 );
  person.age = 46;

  /* using memcpy to copy structure: */
  memcpy ( &person_copy, &person, sizeof(person) );

  printf ("person_copy: %s, %d \n", person_copy.name, person_copy.age );

  return 0;
}
```

{% label 输出 pink %}

```bash
person_copy: Pierre de Fermat, 46 
```

### Comparison

- `memcmp`: Compare two blocks of memory (function)

- `strcmp`: Compare two strings (function)

#### memcmp

`memcmp`: https://cplusplus.com/reference/cstring/memcmp/ 。

`int memcmp ( const void * ptr1, const void * ptr2, size_t num );`

**`Compare two blocks of memory`**

Compares the `first num bytes` of `the block of memory` pointed by `ptr1` to `the first num bytes` pointed by `ptr2`, returning `zero` if they all `match` or `a value different from zero representing which is greater if they do not`.

Notice that, unlike `strcmp`, `the function does not stop comparing after finding a null character`.

**`Parameters`**

**ptr1**

1. `Pointer` to block of memory.

**ptr2**

1. `Pointer` to block of memory.

**num**

1. `Number of bytes` to compare.

**`Return Value`**

Returns an `integral value` indicating `the relationship between the content of the memory blocks`:

|**return value**|**indicates**|
|:-:|:-:|
|`<0`|`the first byte` that does not match in both memory blocks `has a lower value` in `ptr1` than in `ptr2` (if evaluated as `unsigned char` values)|
|`0`|`the contents of both memory blocks` are `equal`|
|`>0`|`the first byte` that does not match in both memory blocks `has a greater value` in `ptr1` than in `ptr2` (if evaluated as `unsigned char` values)|

**`Example`**

```c++
/* memcmp example */
#include <stdio.h>
#include <string.h>

int main ()
{
  char buffer1[] = "DWgaOtP12df0";
  char buffer2[] = "DWGAOTP12DF0";

  int n;

  n=memcmp ( buffer1, buffer2, sizeof(buffer1) );

  if (n>0) printf ("'%s' is greater than '%s'.\n",buffer1,buffer2);
  else if (n<0) printf ("'%s' is less than '%s'.\n",buffer1,buffer2);
  else printf ("'%s' is the same as '%s'.\n",buffer1,buffer2);

  return 0;
}
```

{% label 输出 pink %}

```bash
'DWgaOtP12df0' is greater than 'DWGAOTP12DF0'.

```

`DWgAOtp12Df0` is `greater` than `DWGAOTP12DF0` because `the first non-matching character` in both words are `'g'` and `'G'` respectively, and `'g' (103) evaluates as greater than 'G' (71)`.

#### strcmp

`strcmp`: https://cplusplus.com/reference/cstring/strcmp/ 。

`int strcmp ( const char * str1, const char * str2 );`

**`Compare two strings`**

Compares the `C string str1` to the `C string str2`.

This function starts comparing the `first character` of each string. If they `are equal to` each other, it `continues` with the following pairs until `the characters differ` or until a `terminating null-character` is reached.

This function performs `a binary comparison of the characters`.

**`Parameters`**

**str1**

1. `C string` to be compared.

**str2**

2. `C string` to be compared.

**`Return Value`**

Returns an `integral value` indicating the `relationship` between the strings:

|**return value**|**indicates**|
|:-:|:-:|
|`<0`|the `first character` that does not match has a lower value in `ptr1` than in `ptr2`|
|`0`|the contents of both strings are `equal`|
|`>0`|the first character that does not match has a `greater value` in `ptr1` than in `ptr2`|

**`Example`**

```c++
#include <stdio.h>
#include <string.h>

int main ()
{
  char key[] = "apple";
  char buffer[80];
  do {
     printf ("Guess my favorite fruit? ");
     fflush (stdout);
     scanf ("%79s",buffer);
  } while (strcmp (key,buffer) != 0);
  puts ("Correct answer!");
  return 0;
}
```

{% label 输出 pink %}

```bash
Guess my favourite fruit? orange
Guess my favourite fruit? apple
Correct answer!
```

### Other

- `memset`: Fill block of memory (function)

#### memset

`memset`: https://cplusplus.com/reference/cstring/memset/ 。

`void * memset ( void * ptr, int value, size_t num );`

**`Fill block of memory`**

Sets the first `num` bytes of the block of memory pointed by `ptr` to the specified `value` (interpreted as an `unsigned char`).

**`Parameters`**

**ptr**

1. `Pointer` to the block of memory to fill.

**value**

1. `Value to be set`. The value is passed as an `int`, but the function `fills` the block of memory using the `unsigned char` conversion of this `value`.

**num**

1. `Number of bytes` to be set to the `value`.

2. `size_t` is an `unsigned integral type`.

**`Return Value`**

`ptr` is returned.

**`Example`**

```c++
/* memset example */
#include <stdio.h>
#include <string.h>

int main ()
{
  char str[] = "almost every programmer should know memset!";
  memset (str,'-',6);
  puts (str);
  return 0;
}
```

{% label 输出 pink %}

```bash
------ every programmer should know memset!

```

<div id = "2"></div>

# `Containers`

## `<map>`

`<map>`: https://cplusplus.com/reference/map/ 。

`<map>`: Map header (header).

### map

**Capacity:**

- `size`: Return container size (public member function)

**Element access:**

- `operator[]`: Access element (public member function)

**Modifiers:**

- `clear`: Clear content (public member function)

**Operations:**

- `count`: Count elements with a specific key (public member function)

#### `std::map::size`

`std::map::size`: https://cplusplus.com/reference/map/map/size/ 。

```c++
size_type size() const noexcept;
```

**`Return container size`**

Returns `the number of elements` in the map container.

**`Parameters`**

**none**

**`Return Value`**

`The number of elements` in the container.

Member type `size_type` is `an unsigned integral type`.

**`Example`**

```c++
// map::size
#include <iostream>
#include <map>

int main ()
{
  std::map<char,int> mymap;
  mymap['a']=101;
  mymap['b']=202;
  mymap['c']=302;

  std::cout << "mymap.size() is " << mymap.size() << '\n';

  return 0;
}
```

{% label 输出 pink %}

```bash
mymap.size() is 3
```

**`Complexity`**

Constant.

**`Iterator validity`**

No changes.

**`Data races`**

1. The container is `accessed`.

2. No elements are accessed: concurrently accessing or modifying them is safe.

**`Exception safety`**

`No-throw guarantee`: this member function `never throws exceptions`.

#### `std::map::operator[]`

`std::map::operator[]`: https://cplusplus.com/reference/map/map/operator[]/ 。

```c++
mapped_type& operator[] (const key_type& k);mapped_type& operator[] (key_type&& k);
```

**`Access element`**

If `k` matches `the key of an element` in the container, the function returns `a reference to its mapped value`.

`If k does not match the key of any element in the container, the function inserts a new element with that key and returns a reference to its mapped value.` Notice that this always `increases the container size by one`, even if `no mapped value is assigned to the element` (`the element is constructed using its default constructor`).

A similar member function, `map::at`, has `the same behavior when an element with the key exists`, but `throws an exception when it does not`.

A call to this function is equivalent to:

```c++
(*((this->insert(make_pair(k,mapped_type()))).first)).
```

**`Parameters`**

**k**

1. `Key value of the element` whose mapped value is accessed.

2. Member type `key_type` is the type of the keys for the elements stored in the container, defined in map as an alias of its first template parameter (`Key`).

3. If an `rvalue (second version)`, the key is `moved instead of copied` when a new element is inserted.

**`Return Value`**

A `reference` to the mapped value of the element with a `key` value equivalent to `k`.

Member type `mapped_type` is the type of the mapped values in the container, defined in `map` as an alias of its `second template parameter` (`T`).

**`Example`**

```c++
// accessing mapped values
#include <iostream>
#include <map>
#include <string>

int main ()
{
  std::map<char,std::string> mymap;

  mymap['a']="an element";
  mymap['b']="another element";
  mymap['c']=mymap['b'];

  std::cout << "mymap['a'] is " << mymap['a'] << '\n';
  std::cout << "mymap['b'] is " << mymap['b'] << '\n';
  std::cout << "mymap['c'] is " << mymap['c'] << '\n';
  std::cout << "mymap['d'] is " << mymap['d'] << '\n';

  std::cout << "mymap now contains " << mymap.size() << " elements.\n";

  return 0;
}
```

Notice how `the last access` (to element `'d'`) inserts a new element in the `map` with that key and `initialized to its default value` (an empty string) even though it is accessed only to retrieve its value. `Member function map::find does not produce this effect`.

{% label 输出 pink %}

```bash
mymap['a'] is an element
mymap['b'] is another element
mymap['c'] is another element
mymap['d'] is
mymap now contains 4 elements.
```

**`Complexity`**

`Logarithmic` in size.

**`Iterator validity`**

No changes.

**`Data races`**

1. The container is `accessed`, and `potentially modified`.

2. The function accesses an element and returns a reference that can be used to modify its mapped value. Concurrently accessing other elements is safe.

3. If the function inserts `a new element`, concurrently iterating ranges in the container is not safe.

**`Exception safety`**

1. Strong guarantee: `if an exception is thrown, there are no changes in the container`.

2. If a new element is inserted and `allocator_traits::construct` cannot construct an element with `k` and a default-constructed `mapped_type` (or if `mapped_type` is not `default constructible`), it causes `undefined behavior`.

#### `std::map::clear`

`std::map::clear`: https://cplusplus.com/reference/map/map/clear/ 。

```c++
void clear() noexcept;
```

**`Clear content`**

`Removes` all elements from `the map container` (which are destroyed), `leaving the container with a size of 0`.

**`Parameters`**

**none**

**`Return Value`**

**none**

**`Example`**

```c++
// map::clear
#include <iostream>
#include <map>

int main ()
{
  std::map<char,int> mymap;

  mymap['x']=100;
  mymap['y']=200;
  mymap['z']=300;

  std::cout << "mymap contains:\n";
  for (std::map<char,int>::iterator it=mymap.begin(); it!=mymap.end(); ++it)
    std::cout << it->first << " => " << it->second << '\n';

  mymap.clear();
  mymap['a']=1101;
  mymap['b']=2202;

  std::cout << "mymap contains:\n";
  for (std::map<char,int>::iterator it=mymap.begin(); it!=mymap.end(); ++it)
    std::cout << it->first << " => " << it->second << '\n';

  return 0;
}
```

{% label 输出 pink %}

```bash
mymap contains:
x => 100
y => 200
z => 300
mymap contains:
a => 1101
b => 2202
```

**`Complexity`**

`Linear` in size (destructions).

**`Iterator validity`**

`All iterators, pointers and references` related to this container are `invalidated`.

**`Data races`**

1. The container is modified.

2. `All contained elements are modified`.

**`Exception safety`**

`No-throw guarantee`: this member function `never throws` exceptions.

#### `std::map::count`

`std::map::count`: https://cplusplus.com/reference/map/map/count/ 。

```c++
size_type count (const key_type& k) const;
```

**`Count elements with a specific key`**

Searches the container for elements with `a key equivalent to k` and `returns the number of matches`.

Because all elements in a map container are `unique`, `the function can only return 1` (if the element is found) or `zero` (otherwise).

Two keys are considered equivalent if the container's `comparison object` returns false reflexively (i.e., no matter the order in which the keys are passed as arguments).

**`Parameters`**

**k**

1. `Key` to search for.

2. Member type `key_type` is the type of the element keys in the container, defined in `map` as an alias of `its first template parameter` (Key).

**`Return Value`**

`1` if the container contains an element whose key is equivalent to `k`, or `zero` otherwise.

Member type `size_type` is `an unsigned integral type`.

**`Example`**

```c++
// map::count
#include <iostream>
#include <map>

int main ()
{
  std::map<char,int> mymap;
  char c;

  mymap ['a']=101;
  mymap ['c']=202;
  mymap ['f']=303;

  for (c='a'; c<'h'; c++)
  {
    std::cout << c;
    if (mymap.count(c)>0)
      std::cout << " is an element of mymap.\n";
    else 
      std::cout << " is not an element of mymap.\n";
  }

  return 0;
}
```

{% label 输出 pink %}

```bash
a is an element of mymap.
b is not an element of mymap.
c is an element of mymap.
d is not an element of mymap.
e is not an element of mymap.
f is an element of mymap.
g is not an element of mymap.
```

**`Complexity`**

`Logarithmic` in size.

**`Iterator validity`**

No changes.

**`Data races`**

1. The container is accessed.

2. No mapped values are accessed: concurrently accessing or modifying elements is `safe`.

**`Exception safety`**

`Strong guarantee`: if an exception is thrown, there are `no changes` in the container.

## `<vector>`

`<vector>`: https://cplusplus.com/reference/vector/ 。

`<vector>`: Vector header (header).

### vector

- `operator=`: Assign content (public member function)

**Capacity:**

- `size`: Return size (public member function)

- `resize`: Change size (public member function)

**Element access:**

- `operator[]`: Access element (public member function)

**Modifiers:**

- `push_back`: Add element at the end (public member function)

- `clear`: Clear content (public member function)

#### `std::vector::operator=`

`std::vector::operator=`: https://cplusplus.com/reference/vector/vector/operator=/ 。

```c++
copy (1)	
vector& operator= (const vector& x);
move (2)	
vector& operator= (vector&& x);
initializer list (3)	
vector& operator= (initializer_list<value_type> il);
```

**`Assign content`**

`Assigns` new contents to the container, replacing its current contents, and modifying its `size` accordingly.

{% folding red, C++11 %}

The `copy assignment (1)` copies all the elements from `x` into the container (with `x` preserving its contents).

The `move assignment (2)` moves the elements of `x` into the container (`x` is left in an unspecified but valid state).

The `initializer list assignment (3)` copies the elements of `il` into the container.

The container preserves its `current allocator`, except if the `allocator traits` indicate that x's allocator should `propagate`. This `allocator` is used (through its `traits`) to `allocate` and `deallocate` storage if a reallocation happens, and to `construct` or `destroy` elements, if needed.

{% endfolding %}

Any elements held in the container before the call are either `assigned` to or `destroyed`.

**`Parameters`**

**x**

1. A `vector` object of the same type (i.e., with the same template parameters, `T` and `Alloc`).

**il**

1. An `initializer_list` object. The compiler will automatically construct such objects from `initializer list` declarators.

2. Member type `value_type` is the type of the elements in the container, defined in `vector` as an alias of its first template parameter (`T`).

**`Return Value`**

*this

**`Example`**

```c++
// vector assignment
#include <iostream>
#include <vector>

int main ()
{
  std::vector<int> foo (3,0);
  std::vector<int> bar (5,0);

  bar = foo;
  foo = std::vector<int>();

  std::cout << "Size of foo: " << int(foo.size()) << '\n';
  std::cout << "Size of bar: " << int(bar.size()) << '\n';
  return 0;
}
```

{% label 输出 pink %}

```bash
Size of foo: 0
Size of bar: 3
```

**`Complexity`**

`Linear` in size.

**`Iterator validity`**

All `iterators`, `references` and `pointers` related to this container before the call are invalidated.

In the `move assignment`, iterators, pointers and references referring to elements in `x` are also invalidated.

**`Data races`**

1. `All copied elements` are accessed.

2. The `move assignment (2)` modifies x.

3. The container and all its elements are modified.

**`Exception safety`**

1. `Basic guarantee`: if an exception is thrown, the container is in a valid state.

2. If `allocator_traits::construct` is not supported with the appropriate arguments for the element constructions, or if `value_type` is `not copy assignable` (or `move assignable` for (2)), it causes `undefined behavior`.

#### `std::vector::size`

`std::vector::size`: https://cplusplus.com/reference/vector/vector/size/ 。

```c++
size_type size() const noexcept;
```

**`Return size`**

Returns `the number of elements` in the `vector`.

This is `the number of actual objects` held in the `vector`, which is not necessarily equal to its storage `capacity`.

**`Parameters`**

none

**`Return Value`**

1. `The number of elements` in the container.

2. Member type `size_type` is `an unsigned integral type`.

**`Example`**

```c++
// vector::size
#include <iostream>
#include <vector>

int main ()
{
  std::vector<int> myints;
  std::cout << "0. size: " << myints.size() << '\n';

  for (int i=0; i<10; i++) myints.push_back(i);
  std::cout << "1. size: " << myints.size() << '\n';

  myints.insert (myints.end(),10,100);
  std::cout << "2. size: " << myints.size() << '\n';

  myints.pop_back();
  std::cout << "3. size: " << myints.size() << '\n';

  return 0;
}
```

{% label 输出 pink %}

```bash
0. size: 0
1. size: 10
2. size: 20
3. size: 19
```

**`Complexity`**

Constant.

**`Iterator validity`**

No changes.

**`Data races`**

1. The container is `accessed`.

2. No contained elements are accessed: concurrently accessing or modifying them is `safe`.

**`Exception safety`**

`No-throw guarantee`: this member function `never` throws exceptions.

#### `std::vector::resize`

`std::vector::resize`: https://cplusplus.com/reference/vector/vector/resize/ 。

```c++
void resize (size_type n);void resize (size_type n, const value_type& val);
```

**`Change size`**

`Resizes` the container so that it contains `n` elements.

If `n` is smaller than the current container size, the content is `reduced to its first n element`s, removing those beyond (and destroying them).

If `n` is greater than the current container size, the content is expanded by inserting at the end as many elements as needed to reach a size of n. `If val is specified, the new elements are initialized as copies of val`, `otherwise, they are value-initialized`.

If `n` is also greater than the current container `capacity`, an `automatic reallocation` of the allocated storage space takes place.

Notice that this function changes the actual content of the container by inserting or erasing elements from it.

**`Parameters`**

**n**

1. New container size, expressed in number of elements.

2. Member type `size_type` is an unsigned integral type.

**val**

1. `Object` whose content is copied to the added elements in case that `n` is greater than `the current container size`.

2. If `not specified`, `the default constructor` is used instead.

3. Member type `value_type` is the type of the elements in the container, defined in `vector` as an alias of the first template parameter (`T`).

**`Return Value`**

none

If a `reallocation` happens, the storage is allocated using the container's `allocator`, which may throw exceptions on failure (for the default `allocator`, `bad_alloc` is thrown if the allocation request does not succeed).

**`Example`**

```c++
// resizing vector
#include <iostream>
#include <vector>

int main ()
{
  std::vector<int> myvector;

  // set some initial content:
  for (int i=1;i<10;i++) myvector.push_back(i);

  myvector.resize(5);
  myvector.resize(8,100);
  myvector.resize(12);

  std::cout << "myvector contains:";
  for (int i=0;i<myvector.size();i++)
    std::cout << ' ' << myvector[i];
  std::cout << '\n';

  return 0;
}
```

{% label 输出 pink %}

```bash
myvector contains: 1 2 3 4 5 100 100 100 0 0 0 0
```

**`Complexity`**

1. `Linear` on the number of elements inserted/erased (`constructions/destructions`).

2. If a `reallocation` happens, the reallocation is itself up to linear in `the entire vector size`.

**`Iterator validity`**

1. In case the container `shrinks`, `all iterators`, `pointers` and `references` to elements that have not been removed remain valid after the resize and `refer to the same elements` they were referring to before the call.

2. If the container `expands`, `the end iterator` is `invalidated` and, if it has to `reallocate storage`, all `iterators`, `pointers` and `references` related to this container are also `invalidated`.

**`Data races`**

1. The container is `modified`.

2. If a reallocation happens, all contained elements are modified.

3. Otherwise, none of the elements before `n` is accessed, and concurrently accessing or modifying them is `safe`.

**`Exception safety`**

1. If `n` is less than or equal to the size of the container, the function `never` throws exceptions (`no-throw guarantee`).

2. If `n` is greater and a reallocation happens, there are `no changes` in the container `in case of exception` (`strong guarantee`) if the type of the elements is either copyable or no-throw moveable.

3. Otherwise, if an exception is thrown, the container is left with a valid state (basic guarantee).

#### `std::vector::operator[]`

`std::vector::operator[]`: https://cplusplus.com/reference/vector/vector/operator[]/ 。

```c++
reference operator[] (size_type n);const_reference operator[] (size_type n) const;
```

**`Access element`**

Returns a reference to the element at position `n` in the `vector` container.

A similar member function, `vector::at`, has the same behavior as this operator function, except that `vector::at` is `bound-checked` and signals `if the requested position is out of range by throwing an out_of_range exception`.

Portable programs should never call this function with an argument `n` that is out of range, since this causes `undefined behavior`.

**`Parameters`**

**n**

1. `Position of an element` in the container.

2. Notice that `the first element` has a position of `0` (not `1`).

3. Member type `size_type` is an `unsigned integral type`.

**`Return Value`**

1. `The element at the specified position` in the `vector`.

2. If the `vector` object is `const-qualified`, the function returns a `const_reference`. Otherwise, it returns a `reference`.

3. Member types `reference` and `const_reference` are the reference types to the elements of the container (see `vector member types`).

**`Example`**

```c++
// vector::operator[]
#include <iostream>
#include <vector>

int main ()
{
  std::vector<int> myvector (10);   // 10 zero-initialized elements

  std::vector<int>::size_type sz = myvector.size();

  // assign some values:
  for (unsigned i=0; i<sz; i++) myvector[i]=i;

  // reverse vector using operator[]:
  for (unsigned i=0; i<sz/2; i++)
  {
    int temp;
    temp = myvector[sz-1-i];
    myvector[sz-1-i]=myvector[i];
    myvector[i]=temp;
  }

  std::cout << "myvector contains:";
  for (unsigned i=0; i<sz; i++)
    std::cout << ' ' << myvector[i];
  std::cout << '\n';

  return 0;
}
```

{% label 输出 pink %}

```bash
myvector contains: 9 8 7 6 5 4 3 2 1 0
```

**`Complexity`**

`Constant`.

**`Iterator validity`**

No changes.

**`Data races`**

1. The `container` is `accessed` (neither the `const` nor the `non-const` versions modify the container).

2. The reference returned can be used to `access` or `modify elements`. Concurrently accessing or modifying different elements is `safe`.

**`Exception safety`**

1. If the container size is greater than `n`, the function `never throws exceptions` (no-throw guarantee).

2. Otherwise, the behavior is undefined.

#### `std::vector::push_back`

`std::vector::push_back`: https://cplusplus.com/reference/vector/vector/push_back/ 。

```c++
void push_back (const value_type& val);
void push_back (value_type&& val);
```

**`Add element at the end`**

`Adds a new element at the end of the vector`, after its current `last` element. The content of val is `copied` (or `moved`) to the new element.

This effectively increases the container `size` by one, `which causes an automatic reallocation of the allocated storage space if -and only if- the new vector size surpasses the current vector capacity`.

**`Parameters`**

**val**

1. `Value` to be `copied` (or `moved`) to the new element.

2. Member type `value_type` is the type of the elements in the container, defined in vector as an alias of `its first template parameter (T)`.

**`Return Value`**

none

If a `reallocation` happens, the storage is `allocated` `using the container's allocator`, which may throw exceptions on failure (for the default allocator, `bad_alloc` is thrown if the allocation request does not succeed).

**`Example`**

```c++
// vector::push_back
#include <iostream>
#include <vector>

int main ()
{
  std::vector<int> myvector;
  int myint;

  std::cout << "Please enter some integers (enter 0 to end):\n";

  do {
    std::cin >> myint;
    myvector.push_back (myint);
  } while (myint);

  std::cout << "myvector stores " << int(myvector.size()) << " numbers.\n";

  return 0;
}
```

The example uses `push_back` to add a new element to the vector each time a new integer is read.

**`Complexity`**

`Constant` (amortized time, `reallocation` may happen).

If a `reallocation` happens, the reallocation is itself up to linear `in the entire size`.

**`Iterator validity`**

1. If a `reallocation` happens, all iterators, pointers and references related to the container are `invalidated`.

2. `Otherwise`, only `the end iterator` is `invalidated`, and all iterators, pointers and references to elements are guaranteed to keep referring to the same elements they were referring to before the call.

**`Data races`**

1. The container is `modified`.

2. If a `reallocation` happens, all contained elements are modified.

3. Otherwise, no existing element is accessed, and concurrently accessing or modifying them is safe.

**`Exception safety`**

1. If `no reallocations` happen, there are `no changes` in the container in case of exception (strong guarantee).

2. If a `reallocation` happens, the strong guarantee is also given if the type of the elements is either `copyable` or `no-throw moveable`.

3. Otherwise, the `container` is guaranteed to `end in a valid state` (basic guarantee).

4. If `allocator_traits::construct` is not supported with `val` as argument, it causes `undefined behavior`.

#### `std::vector::clear`

`std::vector::clear`: https://cplusplus.com/reference/vector/vector/clear/ 。

```c++
void clear() noexcept;
```

**`Clear content`**

`Removes all elements from the vector` (which are destroyed), leaving the container with `a size of 0`.

`A reallocation is not guaranteed to happen`, and the `vector capacity` is not guaranteed to change due to calling this function. A typical alternative that `forces a reallocation` is to use swap:

```c++
vector<T>().swap(x);   // clear x reallocating
```

**`Parameters`**

none

**`Return Value`**

none

**`Example`**

```c++
// clearing vectors
#include <iostream>
#include <vector>

int main ()
{
  std::vector<int> myvector;
  myvector.push_back (100);
  myvector.push_back (200);
  myvector.push_back (300);

  std::cout << "myvector contains:";
  for (unsigned i=0; i<myvector.size(); i++)
    std::cout << ' ' << myvector[i];
  std::cout << '\n';

  myvector.clear();
  myvector.push_back (1101);
  myvector.push_back (2202);

  std::cout << "myvector contains:";
  for (unsigned i=0; i<myvector.size(); i++)
    std::cout << ' ' << myvector[i];
  std::cout << '\n';

  return 0;
}
```

{% label 输出 pink %}

```bash
myvector contains: 100 200 300
myvector contains: 1101 2202
```

**`Complexity`**

1. `Linear` in size (destructions).

2. This may be optimized to constant complexity for `trivially-destructible types` (such as scalar or PODs), where elements need not be destroyed.

**`Iterator validity`**

`All iterators`, `pointers` and `references` related to this container are `invalidated`.

**`Data races`**

1. The container is modified.

2. All contained elements are modified.

**`Exception safety`**

`No-throw guarantee`: this member function `never` throws exceptions.

<div id = "3"></div>

# `Input/Output Stream Library`

## `<iostream>`

`<iostream>`: https://cplusplus.com/reference/iostream/ 。

`<iostream>`: Standard Input / Output Streams Library.

### Narrow characters (char)

- `cout`: Standard output stream (object)

- `cerr`: Standard output stream for errors (object)

#### `std::cout`

`std::cout`: https://cplusplus.com/reference/iostream/cout/ 。

`extern ostream cout;`

**`Standard output stream`**

Object of class `ostream` that represents `the standard output stream` oriented to `narrow characters` (of `type char`). It corresponds to `the C stream stdout`.

The `standard output stream` is `the default destination` of characters determined by the environment. `This destination may be shared with more standard objects` (such as `cerr` or `clog`).

As an object of class `ostream`, characters can be written to it either as formatted data using the insertion operator (`operator<<`) or as unformatted data, using member functions such as `write`.

The object is declared in header **`<iostream>`** with `external linkage` and `static duration`: `it lasts the entire duration of the program`.

---

`cout` is not tied to any other output stream.

By default, `cout` is synchronized with `stdout`.

A program should not mix output operations on `cout` with output operations on `wcout` (or with other wide-oriented output operations on `stdout`): `Once an output operation has been performed on either, the standard output stream acquires an orientation (either narrow or wide) that can only be safely changed by calling freopen on stdout`.

#### `std::cerr`

`std::cerr`: https://cplusplus.com/reference/iostream/cerr/ 。

`extern ostream cerr;`

**`Standard output stream for errors`**

Object of class `ostream` that represents `the standard error stream` oriented to `narrow characters` (of type `char`). It corresponds to the C stream stderr.

`The standard error stream` is a destination of characters determined by the environment. This destination may be shared by `more than one standard object` (such as `cout` or `clog`).

As an object of class `ostream`, characters can be written to it either as formatted data using the insertion operator (`operator<<`) or as unformatted data, using member functions such as `write`.

The object is declared in header `<iostream>` with `external linkage` and `static duration`: it lasts the entire duration of the program.

---

`cerr` is not `tied` to any other output stream.

By default, `cerr` is `synchronized` with `stderr`.

A program should not `mix` output operations on `cerr` with output operations on `wcerr` or `wclog` (or with other wide-oriented output operations on `stderr`): `Once an output operation has been performed on either, the standard error stream acquires an orientation (either narrow or wide) that can only be safely changed by calling freopen on stderr`.

<div id = "4"></div>

# `Atomics and threading library`

<div id = "5"></div>

# `Miscellaneous headers`

## `<algorithm>`

`<algorithm>`: https://cplusplus.com/reference/algorithm/ 。

`<algorithm>`: Standard Template Library: Algorithms.

### Sorting

- `sort`: Sort elements in range (function template)

#### `std::sort`

`std::sort`: https://cplusplus.com/reference/algorithm/sort/ 。

```c++
default (1)	
template <class RandomAccessIterator>  void sort (RandomAccessIterator first, RandomAccessIterator last);
custom (2)	
template <class RandomAccessIterator, class Compare>  void sort (RandomAccessIterator first, RandomAccessIterator last, Compare comp);
```

**`Sort elements in range`**

`Sorts` the elements in the range `[first,last)` into `ascending order`.

The elements are compared using `operator<` for the `first` version, and `comp` for the `second`.

Equivalent elements `are not guaranteed to keep their original relative order` (see `stable_sort`).

**`Parameters`**

**first, last**

1. `Random-access iterators` to the initial and final positions of the sequence to be sorted. The range used is `[first,last)`, which contains all the elements between `first` and `last`, including the element pointed by `first` but not the element pointed by `last`.

2. `RandomAccessIterator` shall point to a type for which `swap` is properly defined and which is both `move-constructible` and `move-assignable`.

**comp**

1. Binary function that accepts `two elements` in the range as arguments, and returns a value convertible to `bool`. `The value returned indicates whether the element passed as first argument is considered to go before the second in the specific strict weak ordering it defines`.

2. The function `shall not modify any of its arguments`.

3. This can either be `a function pointer or a function object`.

**`Return Value`**

none.

**`Example`**

```c++
// sort algorithm example
#include <iostream>     // std::cout
#include <algorithm>    // std::sort
#include <vector>       // std::vector

bool myfunction (int i,int j) { return (i<j); }

struct myclass {
  bool operator() (int i,int j) { return (i<j);}
} myobject;

int main () {
  int myints[] = {32,71,12,45,26,80,53,33};
  std::vector<int> myvector (myints, myints+8);               // 32 71 12 45 26 80 53 33

  // using default comparison (operator <):
  std::sort (myvector.begin(), myvector.begin()+4);           //(12 32 45 71)26 80 53 33

  // using function as comp
  std::sort (myvector.begin()+4, myvector.end(), myfunction); // 12 32 45 71(26 33 53 80)

  // using object as comp
  std::sort (myvector.begin(), myvector.end(), myobject);     //(12 26 32 33 45 53 71 80)

  // print out content:
  std::cout << "myvector contains:";
  for (std::vector<int>::iterator it=myvector.begin(); it!=myvector.end(); ++it)
    std::cout << ' ' << *it;
  std::cout << '\n';

  return 0;
}
```

{% label 可能的输出 pink %}

```bash
myvector contains: 12 26 32 33 45 53 71 80
```

**`Complexity`**

On average, `linearithmic` in the distance between `first` and `last`: `Performs approximately N*log2(N) (where N is this distance) comparisons of elements, and up to that many element swaps (or moves)`.

**`Data races`**

The objects in the range `[first,last)` are `modified`.

### Min/max

- `min`: Return the smallest (function template)

#### `std::min`

`std::min`: https://cplusplus.com/reference/algorithm/min/ 。

```c++
default (1)	
template <class T> const T& min (const T& a, const T& b);
custom (2)	
template <class T, class Compare>  const T& min (const T& a, const T& b, Compare comp);
initializer list (3)	
template <class T> T min (initializer_list<T> il);template <class T, class Compare>  T min (initializer_list<T> il, Compare comp);
```

**`Return the smallest`**

Returns the smallest of `a` and `b`. If both are equivalent, `a` is returned.

The versions for `initializer lists (3)` return `the smallest` of all the elements in the list. Returning the first of them if these are more than one.

The function uses `operator<` (or `comp`, if provided) to compare the values.

The behavior of this function template (C++98) is equivalent to:

```c++
template <class T> const T& min (const T& a, const T& b) {
  return !(b<a)?a:b;     // or: return !comp(b,a)?a:b; for version (2)
}
```

**`Parameters`**

**a, b**

1. `Values` to compare.

**comp**

1. `Binary function` that accepts `two values` of type `T` as arguments, and returns `a value convertible to bool`. The value returned `indicates` whether the element passed as `first argument` is considered `less than` the second.

2. The function `shall not modify` any of its arguments.

3. This can either be `a function pointer` or `a function object`.

**il**

1. An `initializer_list` object.

2. These objects are automatically constructed from `initializer list` declarators.

`T` shall support being compared with `operator<`.

**`Return Value`**

The `lesser` of the values passed as arguments.

**`Example`**

```c++
// min example
#include <iostream>     // std::cout
#include <algorithm>    // std::min

int main () {
  std::cout << "min(1,2)==" << std::min(1,2) << '\n';
  std::cout << "min(2,1)==" << std::min(2,1) << '\n';
  std::cout << "min('a','z')==" << std::min('a','z') << '\n';
  std::cout << "min(3.14,2.72)==" << std::min(3.14,2.72) << '\n';
  return 0;
}
```

{% label 输出 pink %}

```bash
min(1,2)==1
min(2,1)==1
min('a','z')==a
min(3.14,2.72)==2.72
```

**`Complexity`**

`Linear` in one less than the number of elements compared (constant for `(1)` and `(2)`).

## `<iterator>`

`<iterator>`: https://cplusplus.com/reference/iterator/ 。

`<iterator>`: Iterator definitions (header).

### Iterator operations

- `begin`: Iterator to beginning (function template)

#### `std::begin`

`std::begin`: https://cplusplus.com/reference/iterator/begin/ 。

```c++
container (1)	
template <class Container>  auto begin (Container& cont) -> decltype (cont.begin());template <class Container>  auto begin (const Container& cont) -> decltype (cont.begin());
array (2)	
template <class T, size_t N>  T* begin (T(&arr)[N]);
```

**`Iterator to beginning`**

Returns `an iterator pointing` to `the first element` in the sequence:

**(1) Container**

The function returns `cont.begin().`

**(2) Array**

The function returns `the array-to-pointer conversion` of its argument.

If the sequence is `empty`, the returned value `shall not be dereferenced`.

These function templates `are defined in multiple headers`: Each of these headers includes the generic templates for all container and array types and not simply a specific overload. The headers are: `<iterator>`, `<array>`, `<deque>`, `<forward_list>`, `<list>`, `<map>`, `<regex>`, `<set>`, `<string>`, `<unordered_map>`, `<unordered_set>` and `<vector>`.

Conversely, `begin` is `overloaded` (with a different definition) in headers `<initializer_list>` and `<valarray>`.

**`Parameters`**

**cont**

1. An object of a class type for which member `begin` is defined.

**arr**

1. An array.

**`Return Value`**

For `(1)`, the same as returned by `cont.begin()`.

For `(2)`, `a pointer to the first element in the array`.

**`Example`**

```c++
// std::begin / std::end example
#include <iostream>     // std::cout
#include <vector>       // std::vector, std::begin, std::end

int main () {
  int foo[] = {10,20,30,40,50};
  std::vector<int> bar;

  // iterate foo: inserting into bar
  for (auto it = std::begin(foo); it!=std::end(foo); ++it)
    bar.push_back(*it);

  // iterate bar: print contents:
  std::cout << "bar contains:";
  for (auto it = std::begin(bar); it!=std::end(bar); ++it)
    std::cout << ' ' << *it;
  std::cout << '\n';

  return 0;
}
```

{% label 输出 pink %}

```bash
bar contains: 10 20 30 40 50
```

**`Data races`**

The argument is `accessed` but `not modified`.

`None of the elements` in the sequence are accessed by the call, but `the iterator returned` can be used to `access or modify them`.

## `<string>`

`<string>`: https://cplusplus.com/reference/string/ 。

`<string>`: Strings.

### string

- `c_str`: Get C string equivalent (public member function)

#### `std::string::c_str`

`std::string::c_str`: https://cplusplus.com/reference/string/string/c_str/ 。

`const char* c_str() const;`

**`Get C string equivalent`**

Returns `a pointer` to `an array` that contains `a null-terminated sequence of characters` (i.e., a C-string) representing the current value of the string object.

This array includes the same sequence of characters that make up `the value of the string object plus an additional terminating null-character ('\0') at the end`.

**`Parameters`**

**none**

**`Return Value`**

`A pointer` to `the c-string representation` of the string object's value.

**`Example`**

```c++
// strings and c-strings
#include <iostream>
#include <cstring>
#include <string>

int main ()
{
  std::string str ("Please split this sentence into tokens");

  char * cstr = new char [str.length()+1];
  std::strcpy (cstr, str.c_str());

  // cstr now contains a c-string copy of str

  char * p = std::strtok (cstr," ");
  while (p!=0)
  {
    std::cout << p << '\n';
    p = std::strtok(NULL," ");
  }

  delete[] cstr;
  return 0;
}
```

{% label 输出 pink %}

```bash
Please
split
this
sentence
into
tokens
```

### Convert to strings

- `to_string`: Convert numerical value to string (function)

#### `std::to_string`

`std::to_string`: https://cplusplus.com/reference/string/to_string/ 。

`string to_string (int val);string to_string (long val);string to_string (long long val);string to_string (unsigned val);string to_string (unsigned long val);string to_string (unsigned long long val);string to_string (float val);string to_string (double val);string to_string (long double val);`

**`Convert numerical value to string`**

Returns a `string` with `the representation of val`.

**`Parameters`**

**val**

1. Numerical value.

**`Return Value`**

A `string object` containing the representation of `val` as `a sequence of characters`.

**`Example`**

```c++
// to_string example
#include <iostream>   // std::cout
#include <string>     // std::string, std::to_string

int main ()
{
  std::string pi = "pi is " + std::to_string(3.1415926);
  std::string perfect = std::to_string(1+2+4+7+14) + " is a perfect number";
  std::cout << pi << '\n';
  std::cout << perfect << '\n';
  return 0;
}
```

{% label 可能的输出 pink %}

```bash
pi is 3.141593
28 is a perfect number
```

## `<utility>`

`<utility>`: https://cplusplus.com/reference/utility/ 。

`<utility>`: Utility components (header).

### Types

- `pair`: Pair of values (class template)

#### `std::pair`

`std::pair`: https://cplusplus.com/reference/utility/pair/ 。

```c++
template <class T1, class T2> struct pair;
```

**`Pair of values`**

This class `couples` together `a pair of values`, which may `be of different types` (`T1` and `T2`). The individual values can be `accessed` through its public members `first` and `second`.

`Pairs` are `a particular case` of `tuple`.

**`Template parameters`**

**T1**

Type of member `first`, aliased as `first_type`.

**T2**

Type of member `second`, aliased as `second_type`.

**`Member types`**

|member type|definition|notes|
|:-:|:-:|:-:|
|first_type|The first template parameter (T1)|Type of member first.|
|second_type|The second template parameter (T2)|Type of member second.|

**`Member variables`**

|member variable|definition|
|:-:|:-:|
|first|The first value in the pair|
|second|The second value in the pair|

<div id = "6"></div>

# C++ 语法

## 移位运算符

在 `C++` 中，`移位运算符`有双目移位运算符：`<<`（左移）和 `>>`（右移）。

`左移运算`是将一个`二进制位的操作数`按指定`移动的位数`向`左移位`，`移出位被丢弃`，右边的空位一律`补 0`。

`右移运算`是将一个`二进制位的操作数`按指定`移动的位数`向`右移动`，`移出位被丢弃`，左边移出的空位或者`一律补 0`，或者`补符号位`，这`由不同的机器而定`。在使用`补码`作为`机器数`的机器中，正数的符号位为 `0`，负数的符号位为 `1`。`右移`对于`无符号类型`强制补 `0`，对于`有符号类型`续补`符号位`。

<div id = "7"></div>

# 计算机基础

## ASCII

`ASCII` (American Standard Code for Information Interchange)：`美国信息交换标准代码`是基于拉丁字母的一套电脑编码系统，主要用于显示`现代英语`和`其他西欧语言`。它是`最通用的信息交换标准`，并等同于国际标准 ISO/IEC 646。ASCII第一次以规范标准的类型发表是在 `1967` 年，最后一次更新则是在 `1986` 年，到目前为止共定义了 `128` 个字符。

![](https://cos.luyf-lemon-love.space/images/20221126225117.png)

# 结语

第二十九篇博文写完，开心！！！！

今天，也是充满希望的一天。
