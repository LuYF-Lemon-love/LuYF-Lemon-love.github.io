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

定义方式：`R"xxx(原始字符串)xxx"` ，其中 `()` 两边的字符串可以省略。

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

### 指针空值类型 - nullptr

C++11 以前，为定义的指针进行初始化时，如果指针目前没有明确的指向，都会给指针初始化为 NULL。

**C++98/03**

```c++
char *ptr = 0;
char *ptr = NULL;
```

C++ 程序的 NULL 其实是 0，C 程序的 NULL 表示 (void*)0。在 C++ 中 void* 类型无法隐式转换为其他类型的指针。0（0x0000 0000）表示的是虚拟地址空间的 0 地址，这个地址是只读的。

这样初始化空指针有时会出现问题。

**C++98/03** 

```c++
#include <iostream>
using namespace std;

void func(char *p)
{
    cout << "void func(char *p)" << endl;
}

void func(int p)
{
    cout << "void func(int p)" << endl;
}

int main()
{
    func(NULL);
    func(250);

    return 0;
}
```

**输出**

```shell
void func(int p)
void func(int p)
```

C++11 中新引入了 nullptr 专门用于初始化空类型指针，不同类型的指针变量都可以用 nullptr 初始化。

```c++
int* ptr1 = nullptr;
char* ptr2 = nullptr;
double* ptr3 = nullptr;
```

上面代码中的 nullptr 会隐式转换成 int*、char* 和 double* 指针类型。

**C++11**

```c++
#include <iostream>
using namespace std;

void func(char *p)
{
    cout << "void func(char *p)" << endl;
}

void func(int p)
{
    cout << "void func(int p)" << endl;
}

int main()
{
    func(nullptr);
    func(250);

    return 0;
}
```

**输出**

```shell
void func(char *p)
void func(int p)
```

结果表明 nullptr 不会隐式转换为整型，但可以隐式转换为指针类型。

### constexpr

const 关键字有双重含义：变量只读和修饰常量。

**const**

```c++
void func(const int num)
{
    const int count = 24;
    int array[num];            // error，num是一个只读变量，不是常量
    int array1[count];         // ok，count是一个常量

    int a1 = 520;
    int a2 = 250;
    const int& b = a1;         // 常量引用，b 引用的变量是不能被修改的。引用 b 是只读的，因为它的值可以改变，所以常量引用不是常量
    b = a2;                         // error
    a1 = 1314;
    cout << "b: " << b << endl;     // 输出结果为1314
}
```

在 C++11 中添加了一个新的关键字 constexpr 用于修饰常量表达式。常量表达式：由一个或多个常量组成并且在编译过程中计算结果的表达式。常量表达式由于在编译过程中求值，因此可以极大提高程序的执行效率。

因此，建议：在只读场景下使用 const，常量场景下使用 constexpr。

```c++
//非常量表达式
const int m = f();

//常量表达式
const int i = 520;
const int j = i + 1;

constexpr int i = 520;
constexpr int j = i + 1;
```

**自定义数据类型**

```c++
struct Test
{
    int id;
    int num;
};

int main()
{
    constexpr Test t{ 1, 2 };
    constexpr int id = t.id;
    constexpr int num = t.num;
    // error，因为 t 是一个常量，它的成员也是常量
    t.num += 100;
    cout << "id: " << id << ", num: " << num << endl;

    return 0;
}
```

### 常量表达式函数

用 constexpr 关键字修饰返回值的函数被称为常量表达式函数。

**需要满足的条件**

1. 函数必须有返回值，并且 return 返回的表达式必须是常量表达式。

2. 函数在使用之前，必须已经定义了。也就是要把定义放到 main 函数上边。

3. 函数体中，不能出现非常量表达式之外的语句。using 语句、typedef 语句、static_assert 断言语句和 return 语句除外。

```c++
// example
constexpr int func()
{
    using mytype = int;
    constexpr mytype a = 100;
    constexpr mytype b = 10;
    constexpr mytype c = a * b;
    return c - (a + b);
}
```

```c++
class Test
{
public:
    constexpr int func()
    {
        constexpr int var = 100;
        return 5 * var;
    }
};

int main()
{
    Test t;
    constexpr int num = t.func();
    cout << "num: " << num << endl;

    return 0;
}
```

**模板函数**

如果 {% label constexpr pink %} 修饰的模板函数实例化结果不满足常量表达式函数的要求，则 {% label constexpr purple %} 会自动被忽略，即该函数就等同于一个普通函数。

```c++
#include <iostream>
using namespace std;

struct Person {
    const char* name;
    int age;
};

// 定义函数模板
template<typename T>
constexpr T display(T t){
    return t;
}

int main()
{
    struct Person p {"lyf", 18};

    // 普通函数
    struct Person ret = display(p);

    // 常量表达式函数
    constexpr int ret1 = display(250);

    constexpr struct Person p1 {"lyf", 18};
    constexpr struct Person p2 = display(p1);

    return 0;
}
```

**构造函数**

{% label constexpr red %} 修饰的构造函数被称为常量构造函数，要求：构造函数的函数体必须为空，并且采用初始化列表的方式为各个成员赋值。

```c++
#include <iostream>
using namespace std;

struct Person {
    constexpr Person(const char* p, int age):name(p),age(age)
    {

    }

    const char* name;
    int age;
};

int main()
{
    constexpr struct Person p("lyf", 18);

    reutn 0;
}
```

### auto

C++11 之前 auto 是和 static 对应的，表示变量是自动存储的，但是非 static 的局部变量默认都是自动存储的。因此，auto 没什么用。

#### auto 推导规则

C++11 中，auto 能够自动推导出变量的实际类型，前提：使用 auto 声明的变量必须要进行初始化。

{% label 语法 blue %}

```c++
auto 变量名 = 变量值;
```

```c++
// double
auto x = 3.14;

// int
auto y = 520;

// char
auto z = "a";
```

{% label 指针和引用 orange %}

- 当变量是指针或引用类型时，推导的结果中会保留 const、volatile 关键字。

- 其他类型时，推导的结果中不会保留 const、volatile 关键字。

```c++
int temp = 110;

// a: int*, auto: int
auto *a = &temp;

// b: int*, auto: int*
auto b = &temp;

// c: int&, auto: int
auto &c = temp;

// d: int, auto: int
auto d = temp;
```

```c++
int temp = 250;

// a: const int, auto: int
const auto a = temp;

// b: int, auto: int
auto b = a;

// c: const int&, auto: int
const auto &c = temp;

// d: const int&, auto: const int
auto &d = c;
```

#### auto 的限制

1. 不能做为函数参数使用。

```c++
// error
int func(auto a, auto b)
{
    cout << "a: " << a << ", b: " << b << endl;
}
```

2. 不能用于类的非静态成员变量的初始化。

```c++
class Test
{
    // error
    auto v1 = 0;

    // error, 类的静态非常量成员不允许在类内部直接初始化
    static auto v2 = 0;

    // ok
    static const auto v3 = 10;
};
```

3. 不能使用 auto 关键字定义数组

```c++
int func()
{
    // define array
    int array[] = {1, 2, 3, 4, 5};

    // ok, ti: int*
    auto t1 = array;

    // error, auto can not define array
    auto t2[] = array;

    // error, auto can not define array
    auto t3[] = {1, 2, 3, 4, 5};
}
```

4. 无法使用 auto 推导出模板类型

```c++
template <typename T>
struct Test{};

int func()
{
    Test<double> t;

    // error, 无法推导出模板类型
    Test<auto> t1 = t;
    
    return 0;
}
```

#### auto 的应用

---

{% label STL的容器的遍历 green %}

---

{% label C++11以前 pink %}

```c++
#include <map>

int main()
{
    map<int, string> person;
    map<int, string>::iterator it = person.begin();
    for (; it != person.end(); ++it)
    {
        // do something
    }

    return 0;
}
```

{% label C++11以后 pink %}

```c++
#include <map>

int main()
{
    map<int, string> person;

    // 代码简化
    for(auto it = person.begin(); it != person.end(); ++it)
    {
        // do something
    }

    return 0;
}
```

---

{% label 泛型编程 blue %}

---
{% label C++11以前 pink %}

```c++
#include <iostream>
#include <string>
using namespace std;

class T1
{
public:
    static int get()
    {
        return 0;
    }
};

class T2
{
public:
    static string get()
    {
        return "hello world";
    }
};

template <class A, typename B>
void func(void)
{
    B val = A::get();
    cout << "val: " << val << endl;
}

int main()
{
    func<T1, int>();
    func<T2, string>();
    return 0;
}
```

{% label C++11以后 pink %}

```c++
#include <iostream>
#include <string>
using namespace std;

class T1
{
public:
    static int get()
    {
        return 10;
    }
};

class T2
{
public:
    static string get()
    {
        return "hello, world";
    }
};

template <class A>
void func(void)
{
    auto val = A::get();
    cout << "val: " << val << endl;
}

int main()
{
    func<T1>();
    func<T2>();

    return 0;
}
```

---

### decltype

{% label decltype pink %} 在编译阶段推导出一个表达式的类型，它只是用于表达式类型的推导，并不会计算表达式的值。

```c++
decltype(表达式)
```

```c++
int a = 10;

// b: int
decltype(a) b = 99;

// c: double
decltype(a + 3.14) c = 52.13;

// d: double
decltype(a + b * c) d = 520.1314;
```

#### decltype 推导规则

1. 表达式为普通变量、普通表达式或者类表达式时，推导出的类型与表达式的类型相同。

```c++
#include <iostream>
#include <string>
using namespace std;

class Test
{
public:
    string text;
    static const int value = 110;
};

int main()
{
    int x = 99;
    const int &y = x;

    // a: int
    decltype(x) a = x;

    // b: const int &
    decltype(y) b = x;

    // c: const int
    decltype(Test::value) c = 0;

    Test t;

    // d: string
    decltype(t.text) d = "hello, world";

    return 0;
}
```

2. 表达式是函数调用，推导出的类型与函数返回值相同。

```c++
class Test{};

// 函数声明
int func_int();
int& func_int_r();
int&& func_int_rr();

const int func_cint();
const int& func_cint_r();
const int&& func_cint_rr();

const Test func_ctest();

int n = 100;

// a: int
decltype(func_int()) a = 0;

// b: int&
decltype(func_int_r()) b = n;

// c: int&&
decltype(func_int_rr()) c = 0;

// d: int
decltype(func_cint()) d = 0;

// e: const int &
decltype(func_cint_r()) e = n;

// f: const int &&
decltype(func_cint_rr()) f = 0;

// g: const Test
decltype(func_ctest()) g = Test();
```

   {% label func_cint() pink %} 返回的是一个纯右值（在表达式执行结束后不再存在的数据，也就是临时性数据），{% span cyan, 对于纯右值而言，只有类类型可以携带 const、volatile 限定符，除此之外需要忽略掉这两个限定符。%}因此 d 的类型为 int。

3. 表达式是一个左值，或者被括号 () 包围，推导出的类型是表达式类型的引用（如果有 const、volatile，不能被忽略）

```c++
#include <iostream>
#include <vector>
using namespace std;

class Test
{
public:
    int num;
};

int main() {
    const Test obj;

    // 带有括号的表达式
    // a: int
    decltype(obj.num) a = 0;
    // b: const int &
    decltype((obj.num)) b = a;

    int n = 0, m = 0;
    
    // 加法表达式
    // c: int
    decltype(n + m) c = 0;
    // n: int&, n 是一个左值
    decltype(n = n + m) d = n;
    
    return 0;
}
```

#### decltype 的应用

```c++
#include <iostream>
#include <list>
using namespace std;

template <class T>
class Container
{
public:
    void func(T& c)
    {
        for (m_it = c.begin(); m_it != c.end(); ++m_it)
        {
            cout << *m_it << " ";
        }
        cout << endl;
    }
private:
    decltype(T().begin()) m_it;
};

int main()
{
    const list<int> lst{1,2,3,4,5,6,7,8,9};
    Container<const list<int>> obj;
    obj.func(lst);

    return 0;
}
```

### 返回值类型后置

在{% label 泛型编程 purple %}中，需要通过参数的运算获得返回值的类型。

在 C++11 增加了 {% span cyan, 返回值类型后置 %}，通过 decltype 和 auto 来完成返回值类型的推导。 

```c++
auto func(参数1, 参数2, ...) -> decltype(参数表达式)
```

auto 会追踪 decltype() 推导出的类型。

```c++
#include <iostream>
using namespace std;

template <typename T, typename U>
auto add(T t, U u) -> decltype(t+u)
{
    return t + u;
}

int main()
{
    int x = 520;
    double y = 13.14;

    // auto z = add<int, double>(x, y);
    // 简化
    auto z = add(x, y);
    cout << "z: " << z << endl;

    return 0;
}
```

```c++
#include <iostream>
using namespace std;

int& test(int &i)
{
    return i;
}

double test(double &d)
{
    d = d + 100;
    return d;
}

template <typename T>
auto myFunc(T& t) -> decltype(test(t))
{
    return test(t);
}

int main()
{
    int x = 520;
    double y = 13.14;

    // auto z = myFunc<int>(x);
    // 简化
    auto z = myFunc(x);
    cout << "z: " << z << endl;

    // auto a = myFunc<double>(y);
    // 简化
    auto a = myFunc(y);
    cout << "a: " << a << endl;

    return 0;
}
```

### 结语

第十三篇博文写完，开心！！！！

今天，也是充满希望的一天。