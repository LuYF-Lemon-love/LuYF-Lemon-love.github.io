---
title: C++11新特性初探-ubuntu
tags:
  - C/C++
  - C++11
categories: C++
description: 介绍一些 C++11 的新特性。
cover: >-
  https://cos.luyf-lemon-love.space/images/20220513124745.png
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
        我要成为真正的狐狸精!!!\
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
        我要成为真正的狐狸精!!!
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

### final

C++11 增加了 {% span red, final %} 关键字来{% span blue, 限制某个类不能被继承，或者某个虚函数不能被重写 %}。

#### final 修饰函数

只能修饰{% span yellow, 虚函数 %}，阻止子类重写父类的该函数。

```c++
class Base
{
public:
    virtual void test()
    {
        cout << "Base class" << endl;
    }
};

class Child: public Base
{
public:
    void test() final
    {
        cout << "Child class" << endl;
    }
};

class GrandChild: public Child
{
public:
    // error, 不允许重写
    void test()
    {
        cout << "GrandChild class" << endl;
    }
};
```

#### final 修饰类

使用 {% span green, final %} 关键字修饰过的类是不允许有派生类的。

```c++
class Base
{
public:
    virtual void test()
    {
        cout << "Base class" << endl;
    }
};

class Child final: public Base
{
public:
    void test()
    {
        cout << "Child class" << endl;
    }
};

// error, 语法错误
class GrandChild: public Child
{

};
```

### override

`override` 关键字会明确表明将会重写基类的虚函数，提高了代码的可读性，编辑器会帮我们检查函数名、函数参数和返回值类型，提高了程序的正确性。

```c++
class Base
{
public:
    virtual void test()
    {
        cout << "Base class" << endl;
    }
};

class Child: public Base
{
public:
    void test() override
    {
        cout << "Child class" << endl;
    }
};

class GrandChild: public Child
{
public:
    void test() override
    {
        cout << "Child class" << endl;
    }
};
```

### 模板右尖括号的优化

在 C++11 以前，两个连续的尖括号（{% label >> pink %}）会被编译器解析成右移操作符，而不是模板参数表的结束。

```c++
// test.cpp
#include <iostream>
#include <vector>

using namespace std;

template <typename T>
class Base
{
public:
    void traversal(T& t)
    {
        auto it = t.begin();
        for (; it != t.end(); ++it)
        {
            cout << *it << " ";
        }
        cout << endl;
    }
};

int main()
{
    vector<int> v{ 1, 2, 3, 4, 5, 6, 7, 8, 9};

    // C++98/03 标准的编译器编译会 error，>> 之间需要空格，变为 > >
    Base<vector<int>> b;
    b.traversal(v);

    return 0;
}
```

C++11 改进了编译器的解析规则，尽可能地将多个由尖括号（>）解析成模板参数结束符。上面的代码在支持 C++11 的编译器中编译是没有任何问题。

### 默认模板参数

在 C++98/03 标准中，类模板可以有默认的模板参数。

```c++
#include <iostream>
using namespace std;

template <typename T = int, T t = 520>
class Test
{
public:
    void print()
    {
        cout << "current value: " << t << endl;
    }
};

int main()
{
    Test<> t;
    t.print();

    Test<int, 1024> t1;
    t1.print();

    return 0;
};
```

C++98/03 标准不支持函数的默认模板参数，在 C++11 中增加了对函数的默认模板参数的支持。

```c++
#include <iostream>
using namespace

template <typename T=int>
void func(T t)
{
    cout << "current value: " << t << endl;
}

int main()
{
    func(100);

    return 0;
}
```

注：当所有模板参数都有默认参数时，函数模板的调用如同一个普通函数，但是类模板即使所有参数都有默认参数，也必须在模板名后跟随 <> 来实例化。

函数模板的默认参数可以和模板参数的自动推导结合进而更灵活的书写代码。

```c++
#include <iostream>
#include <string>
using namespace std;

template <typename R = int, typename N>
R func(N arg)
{
    return arg;
}

int main()
{
    // ret1: 520
    // 函数返回值类型使用了默认的模板参数，函数的参数类型是自动推导出来的为 int 类型
    auto ret1 = func(520);

    // ret2: 52.134
    // 函数返回值指定为 double 类型，函数的参数类型是自动推导出来的为 double 类型
    auto ret2 = func<double>(52.134);

    // ret3: 52
    // 函数的返回值指定为 int 类型，函数的参数类型是自动推导出来的为 double 类型
    auto ret3 = func<int>(52.134);

    // ret4: d
    // 函数的返回值指定为 char 类型，函数的参数类型指定为 int 类型
    auto ret4 = func<char,int>(100);

    return 0;
}
```

{% label 函数模板的默认模板参数和函数模板参数自动推导的优先级（从高到低） pink %}

- 自动推导

- 函数模板的默认模板参数

- error

```c++
#include <iostream>
#include <string>
using namespace std;

template <typename T, typename U = char>
void func(T arg1 = 100, U arg2 = 100)
{
    cout << "arg1: " << arg1 << ", arg2: " << arg2 << endl;
}

int main()
{
    // output: arg1: a, arg2: d
    // T: 自动推导为 char，U: 默认模板参数 char
    func('a');

    // output: arg1: 97, arg2: a
    // T: 自动推导为 int，U: 自动推导为 char
    func(97, 'a');

    // error
    // T: 没有实参无法自动推导，也没有默认的模板参数
    func();

    return 0;
}
```

### using 的使用

在 C++11 之前，using 用于声明命名空间，命令空间可以防止命名冲突。声明命名空间之后，就可以直接使用命名空间中的定义的类了。

C++11 为 using 赋予了新的功能。

#### 定义别名

C++11 之前可以使用 typedef 重定义一个类型。被重定义的类型并不是一个新的类型，仅仅只是原有的类型取了一个新的名字。

```c++
typedef 旧的类型名 新的类型名;

// example
typedef unsigned int uint_t;
```

C++11 以后也可以使用 using 来定义类型的别名。类型别名和类型的名字等价。使用 typedef 定义的别名和使用 using 定义的别名在语义上是等效的。

```c++
using 新的类型名 = 旧的类型名;

// example
using uint_t = int;
```

#### 定义函数指针

```c++
// 使用 typedef 定义函数指针
typedef int(*func_ptr)(int, double);

// 使用 using 定义函数指针
using func_ptr1 = int(*)(int, double);
```

#### 模板的别名

需求：一个固定以 int 类型为 key 的 map，它可以和很多类型的 value 值进行映射。

```c++
typedef map<int, string> m1;
typedef map<int, int> m2;
typedef map<int, double> m3;
```

typename 不支持给模板定义别名。

```c++
template <typename T>
typedef map<int, T> type; // error
```

typedef 需要添加一个外敷类才能实现上面的需求。

```c++
#include <iostream>
#include <functional>
#include <map>
using namespace std;

template <typename T>
// 定义外敷类
struct MyMap
{
    typedef map<int, T> type;
};

int main(void)
{
    MyMap<string>::type m;
    m.insert(make_pair(1, "susu"));
    m.insert(make_pair(2, "honghong"));

    MyMap<int>::type m1;
    m1.insert(1, 100);
    m1.insert(2, 200);

    return 0;
}
```

C++11 可以使用 using 来为一个模板定义别名。

```c++
template <typename T>
using mymap = map<int, T>;
```

```c++
#include <iostream>
#include <functional>
#include <map>
using namespace std;

template <typename T>
using mymap = map<int, T>;

int main(void)
{
    mymap<string> m;
    m.insert(make_pair(1, "susu"));
    m.insert(make_pair(2, "honghong"));

    mymap<int> m1;
    m1.insert(1, 100);
    m1.insert(2, 200);

    return 0;
}
```

{% span cyan, using 语法和 typedef 一样，并不会创建出新的类型，它们只是给某些类型定义了新的别名。using 还可以给模板定义别名。 %}

### 委托构造函数

委托构造函数允许 {% label 同一个类中的构造函数 pink %} 调用其他的构造函数。

{% label C++11以前 purple %}

```c++
#include <iostream>
using namespace std;

class Test
{
public:
    Test() {};

    Test(int max)
    {
        this->m_max = max > 0 ? max : 100;
    }

    Test(int max, int min)
    {
        this->m_max = max > 0 ? max : 100;
        this->m_min = min > 0 && min < max ? min : 1;
    }

    Test(int max, int min, int mid)
    {
        this->m_max = max > 0 ? max : 100;
        this->m_min = min > 0 && min < max ? min : 1;
        this->m_middle = mid < max && mid > min ? mid : 50;
    }

    int m_min;
    int m_max;
    int m_middle;
};

int main()
{
    Test t(90, 30, 60);

    return 0;
}
```

{% label C++11加入了委托构造 purple %}

```c++
#include <iostream>
using namespace std;

class Test
{
public:
    Test() {};

    Test(int max)
    {
        this->m_max = max > 0 ? max : 100;
    }

    Test(int max, int min):Test(max)
    {
        this->m_min = min > 0 && min < max ? min : 1;
    }

    Test(int max, int min, int mid):Test(max, min)
    {
        this->m_middle = mid < max && mid > min ? mid : 50;
    }

    int m_min;
    int m_max;
    int m_middle;
};

int main()
{
    Test t(90, 30, 60);

    return 0;
}
```

注：一个构造函数调用了其他的构造函数用于相关数据的初始化，相当于一个 {% label 链式调用 pink %}。

- 链式调用不能形成一个闭环，否则会在运行期抛异常。

- 多层的链式调用时，需要将构造函数的调用写在初始化列表中而不是函数体内部，否则会出现形参重复定义。

- 在初始化列表中调用了委托构造函数初始化某个类成员变量之后，不能在初始化列表中再次初始化这个变量。

```c++
// error
Test(int max, int min):Test(max), m_max(max)
{
    this->m_min = min > 0 && min < max ? min : 1;
}
```

### 继承构造函数

C++11 新增了继承构造函数，可以让派生类直接使用基类的构造函数。

{% label C++11以前 pink %}

```c++
#include <iostream>
#include <string>
using namespace std;

class Base
{
public:
    Base(int i):m_i(i){}

    Base(int i, double j):m_i(i), m_j(j){}

    Base(int i, double j, string k):m_i(i), m_j(j), m_k(k){}

    int m_i;
    double m_j;
    string m_k;
};

class Child:public Base
{
public:
    Child(int i): Base(i){}

    Child(int i, double j): Base(i,j){}

    Child(int i, double j, string k): Base(i, j, k){}
};

int main()
{
    Child c(520, 13.14, "see you again!");

    return 0;
}
```

{% span green, C++11 %} 使用 using 类名::构造函数名 来声明使用基类的构造函数。

```c++
#include <iostream>
#include <string>
using namespace std;

class Base
{
public:
    Base(int i):m_i(i){}

    Base(int i, double j):m_i(i),m_j(j){}

    Base(int i, double j, string k):m_i(i),m_j(j),m_k(k){}

    int m_i;
    double m_j;
    string m_k;
};

class Child : public Base
{
public:
    using Base::Base;
};

int main()
{
    Child c1(520, 13.14);

    Child c2(520, 13.14, "see you again!");

    return 0;
}
```

{% span cyan, 通过 using 使用父类的同名函数 %}

```c++
#include <iostream>
#include <string>
using namespace std;

class Base
{
public:
    Base(int i):m_i(i) {}

    Base(int i, double j):m_i(i), m_j(j) {}

    Base(int i, double j, string k):m_i(i), m_j(j), m_k(k) {}

    void func(int i)
    {
        cout << "base class: i = " << i << ebdl;
    }

    void func(int i, string str)
    {
        cout << "base class: i = " << i << ", str = " << str << endl;
    }

    int m_i;
    double m_j;
    string m_k;
};

class Child : public Base
{
public:
    using Base::Base;
    using Base::func;

    void func()
    {
        cout << "child class: I'm Child!" << endl;
    }
};

int main()
{
    Child c(520);
    
    // output: child class: I'm Child!
    c.func();

    // output: base class: i = 19
    c.func(19);

    // output: base class: i = 19, str = see you again!
    c.func(19, "see you again!");

    return 0;
}
```

### 统一的初始化

{% span cyan, C++11以前，普通数组和可以直接进行内存拷贝的对象(memcpy())可以使用列表初始化来初始化数据 %}

```c++
int array[] = {1,3,5,7,9};
double array1[3] = {1.2,1.3,1.4};

struct Person
{
    int id;
    double salary;
}zhang3{1,3000};
```

{% span cyan, C++11 %}

```c++
#include <iostream>
using namespace std;

class Test
{
public:
    Test(int){}

private:
    Test(const Test &) {}
};

int main(void)
{
    // 带参的构造函数
    Test t1(520);

    // error ，因为拷贝构造函数是私有的。如果拷贝构造函数是公有的，520 会先隐式转换为 Test(int) 构造成一个匿名对象。然后匿名对象拷贝构造得到 t2。(VS 不会出现 error，Linux 的 g++ 会出现 error)
    Test t2 = 520;

    // C++11 的列表初始化，是否写等号无影响
    Test t3 = {520};
    Test t4{520};

    // 基础数据类型的列表初始化
    int a1 = {1314};
    int a2{1314};
    int arr1[] = {1,2,3};
    int arr2[]{1,2,3};

    return 0;
}
```

{% label new操作符创建新对象 pink %}

```c++
int * p = new int{520};
double b = double{52.134};
int * array = new int[3]{1,2,3};
```

{% label 列表初始化用在函数返回值上 pink %}

```c++
#include <iostream>
#include <string>
using namespace std;

class Person
{
public:
    Person(int id, string name)
    {
        cout << "id: " << id << ", name: " << name << endl;
    }
};

Person func()
{   
    // return {1, "susu"} = return Person(1, "susu")
    // 直接返回了一个匿名对象
    Return {1, "susu"};
}

int main(void)
{
    Person p = func();

    return 0;
}
```

#### 列表初始化聚合类型的变量

对于自定义类型，列表初始化可能有两种执行结果。

```c++
#include <iostream>
#include <string>
using namespace std;

struct T1
{
    int x;
    int y;
}a = { 123, 321 };

struct T2
{
    int x;
    int y;
    T2(int, int) : x(10), y(20) {}
}b = { 123, 321 };

int main(void)
{
    // output: a.x: 123, a.y: 321
    cout << "a.x: " << a.x << ", a.y: " << a.y << endl;

    // output: b.x: 10, b.y: 20
    cout << "b.x: " << b.x << ", b.y: " << b.y << endl;

    return 0;
}
```

对象 b 并没有被初始化列表中的数据初始化。因为如果使用列表初始化对对象初始化时，还需要判断这个对象对应的类型是不是一个聚合体，如果是，初始化列表中的数据就会拷贝到对象中。

聚合体类型：

- 普通数组本身可以看做是一个聚合类型

```c++
int x[] = {1, 2, 3, 4, 5, 6};
double y[3][3] = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9},
};
char carry[] = {'a', 'b', 'c', 'd', 'e', 'f'};
std::string sarray[] = {"hello", "world"};
```

- 满足以下条件的类（class、struct、union）可以被看做成一个聚合类型：

   - 无用户自定义的构造函数。

   - 无私有或保护的非静态成员。

   ```c++
   struct T2
   {
       int x;
       long y;
    
    protected:
        static int z;
   }t{ 1, 100};

   // 静态成员的初始化
   int T2::z = 2;
   ```

   - 无基类。

   - 无虚函数。

   ```c++
   #include <iostream>
   #include <string>
   using namespace std;

   struct T2
   {
       int x;
       long y;
    
    protected:
        static int z;
   }t1{1, 100};

   int T2::z = 2;

   stuct T3
   {
       int x;
       double y = 1;
       int z[3]{1,2,3};
   };

   int main(void)
   {
       T3 t{520, 2, {6, 7, 8}};

       return 0;
   }
   ```

#### 列表初始化非聚合类型的对象

非聚合类型对象：需要在类内定义一个使用初始化列表对类成员变量进行初始化的构造函数。

```c++
#include <iostream>
#include <string>
using namespace std;

struct T1
{
    int x;
    double y;

    T1(int a, double b, int c) : x(a), y(b), z(c){}

private:
    int z;
};

int main(void)
{
    T1 t{ 520, 1.2, 1};

    return 0;
}
```

一个类有非聚合类型的非静态成员时，也可能是聚合类型。

```c++
#include <iostream>
#include <string>
using namespace std;

struct T1
{
    int x;
    double y;

private:
    int z;
};

struct T2
{
    T1 t1;
    long x1;
    double y1;
};

int main(void)
{
    // {} 相当于调用 T1 的无参构造函数
    T2 t2{{}, 520, 1.2};
    
    return 0;
}
```

### std::initializer_list

std::initializer_list 类模板特点：

- 内部定义了迭代器 iterator，遍历时得到的迭代器是只读的。

- std::initializer_list<T>，可以接收任意长度的初始化列表，元素必须是同种类型 T

- 三个成员接口：size(), begin(), end()。

- std::initializer_list 对象只能被整体初始化或者赋值。

#### 作为普通函数的参数

{% label 变参函数 pink %}

```c++
#include <iostream>
#include <string>
using namespace std;

void traversal(std::initializer_list<int> a)
{
    for(auto it = a.begin(); it != a.end(); ++it)
    {
        cout << *it << " ";
    }
    cout << endl;
}

int main(void)
{
    initializer_list<int> list;
    cout << "current list size: " << list.size() << endl;
    traversal(list);

    list = {1,2,3,4,5,6,7,8,9,0};
    cout << "current list size: " << list.size() << endl;
    traversal(list);
    cout << endl;

    list = {1,3,5,7,9};
    cout << "current list size: " << list.size() << endl;
    traversal(list);
    cout << endl;

    traversal({2,4,6,8,0});
    cout << endl;

    traversal({11,12,13,14,15,16});

    return 0;
}
```

{% label output pink %}

```shell
current list size: 0

current list size: 10
1 2 3 4 5 6 7 8 9 0

current list size: 5
1 3 5 7 9

2 4 6 8 0

11 12 13 14 15 16
```

std::initializer_list 遍历时得到的是一个只读的迭代器，只能以值覆盖的方式进行容器内部数据的修改。它的效率是非常高的，它不保存初始化列表中元素的拷贝，仅仅存储了初始化列表中元素的引用。

#### 作为构造函数的参数

```c++
#include <iostream>
#include <string>
#include <vector>
using namespace std;

class Test
{
public:
    Test(std::initializer_list<string> list)
    {
        for (auto it = list.begin(); it != list.end(); ++it)
        {
            cout << *it << " ";
            m_names.push_back(*it);
        }
        cout << endl;
    }

private:
    vector<string> m_names;
};

int main(void)
{
    // output: susu yaya rongrong
    Test t({"susu", "yaya", "rongrong"});

    // output: honghong dongfangyuechu
    Test t1({"honghong","dongfangyuechu"});

    return 0;
}
```

### 基于范围的 for 循环

#### 基于范围的 for 循环的语法

{% label C++11以前 pink %}

```c++
#include <iostream>
#include <vector>
using namespace std;

int main()
{
    vector<int> t{1,2,3,4,5,6};
    for (auto it = t.begin(); it != t.end(); ++it)
    {
        cout << *it << " ";
    }
    cout << endl;

    return 0;
}
```

```c++
// C++98/03 中普通的 for 循环
for(表达式1;表达式2;表达式3)
{
    // 循环体
}

// C++11 基于范围的 for 循环
for(declaration : expression)
{
    // 循环体
}
```

declaration 表示遍历声明，在遍历过程中，当前被遍历到的元素会被存储到声明的变量中。expression 是要遍历的对象，它可以是表达式、容器、数组、初始化列表等。

{% label 基于范围的for循环 pink %}

```c++
#include <iostream>
#include <vector>
using namespace std;

int main(void)
{
    vector<int> t{1,2,3,4,5,6};
    for (auto value : t)
    {
        cout << value << " ";
    }
    cout << endl;

    return 0;
}
```

{% label 遍历过程中修改元素的值，需要使用引用 pink %}

```c++
#include <iostream>
#include <vector>
using namespace std;

int main(void)
{
    vector<int> t{1,2,3,4,5,6};
    cout << "遍历修改之前的容器：";
    for (auto &value : t)
    {
        cout << value++ << " ";
    }
    cout << endl << "遍历修改之后的容器：";

    for (auto &value : t)
    {
        cout << value << " ";
    }
    cout << endl;

    return 0;
}
```

{% label output pink %}

```shell
遍历修改之前的容器：1 2 3 4 5 6
遍历修改之后的容器：2 3 4 5 6 7
```

{% label 更高效率的只读 pink %}

```c++
#include <iostream>
#include <vector>
using namespace std;

int main(void)
{
    vector<int> t{1,2,3,4,5,6};

    // const auto & 效率高于 const auto
    for (const auto& value : t)
    {
        cout << value << " ";
    }

    return 0;
}
```

#### 关系型容器

```c++
#include <iostream>
#include <string>
#include <map>
using namespace std;

int main(void)
{
    map<int, string> m{
        {1, "susu"},{2, "yaya"},{3, "rongrong"}
    };

    for (auto& it : m)
    {
        cout << "id: " << it.fist << ", name: " << it.second << endl;
    }

    for (auto it = m.begin(); it != m.end(); ++it)
    {
        cout << "id: " << it->first << ", name: " << it->second << endl;
    }

    return 0;
}
```

- {% span cyan, 普通的 for 循环方式，auto 自动推导出一个迭代器类型，需要使用迭代器的方式访问键值对 %}

   - it->first

   - it->second

- {% span cyan, 基于范围的 for 循环方式，auto 自动推导出一个 value_type 类型对象，需要使用对象的方式访问键值对 %}

   - it.first

   - it.second

#### 元素只读

{% span cyan, 对于 set 容器，内部元素是只读的，for 循环中 auto & 会被视为 const auto & %}

```c++
#include <iostream>
#include <set>
using namespace std;

int main(void)
{
    set<int> st{1,2,3,4,5,6};
    for(auto &item : st)
    {
        // error
        cout << item++ << endl;
    }

    return 0;
}
```

{% span cyan, 对于 map 容器，不能修改 key 值，即 first 值 %}

```c++
#include <iostream>
#include <string>
#include <map>
using namespace std;

int main(void)
{
    map<int, string> m{
        {1, "susu"}, {2, "yaya"}, {3, "rongrong"}
    };

    for (auto& item : m)
    {
        // item.first 是一个常量，error
        cout << "id: " << item.first++ << ", name: " << item.second << endl;
    }

    return 0;
}
```

#### 访问次数

```c++
#include <iostream>
#include <vector>
using namespace std;

vector<int> v{1,2,3,4,5,6};
vector<int>& getRange()
{
    cout << "get vector range..." << endl;
    return v;
}

int main(void)
{
    for (auto val : getRange())
    {
        cout << val << " ";
    }
    cout << endl;

    return 0;
}
```

{% label output pink %}

```shell
get vector range...
1 2 3 4 5 6
```

注：基于范围的 for 循环，冒号后的表达式只被执行一次。

### 可调用对象

C++11 以前就有可调用对象。包括以下几种：

- 函数指针

```c++
int print(int a, double b)
{
    cout << a << b << endl;

    return 0;
}

// 定义函数指针
int (*func)(int, double) = &print;
```

- 具有重载 operator() 的成员函数的类对象（仿函数）

```c++
#include <iostream>
#include <string>
#include <vector>
using namespace std;

struct Test
{
    void operator()(string msg)
    {
        cout << "msg: " << msg << endl;
    }
};

int main(void)
{
    Test t;
    t("我要成为真正的狐狸精！！！");

    return 0;
}
```

- 转换为函数指针的类对象

```c++
#include <iostream>
#include <string>
#include <vector>
using namespace std;

using func_ptr = void(*)(int, string);
struct Test
{
    static void print(int a, string b)
    {
        cout << "name: " << b << ", age: " << a << endl;
    }

    // 将类对象转换为函数指针
    operator func_ptr()
    {
        return print;
    }
};

int main(void)
{
    Test t;

    // 对象转换为函数指针，并调用
    t(1, "susu");

    return 0;
}
```

- 类成员函数指针和类成员指针

```c++
#include <iostream>
#include <string>
#include <vector>
using namespace std;

struct Test
{
    void print(int a, string b)
    {
        cout << "name: " << b << ", age: " << a << endl;
    }
    int m_num;
};

int main(void)
{
    // 定义类成员函数指针
    void (Test::*func_ptr)(int, string) = &Test::print;

    // 类成员指针
    int Test::*obj_ptr = &Test::m_num;

    Test t;
    (t.*func_ptr)(1, "susu");
    t.*obj_ptr = 1;

    cout << "number is: " << t.m_num << endl;
    
    return 0;
}
```

### 可调用对象包装器

`std::function 是可调用对象的包装器，它是一个类模板，可以容纳除了类成员（函数）指针之外的所有可调用对象。`

#### 基本用法

```c++
# 语法
#include <functional>
std::function<返回值类型(参数类型列表)> name = 可调用对象;
```

```c++
#include <iostream>
#include <functional>
using namespace std;

int add(int a, int b)
{
    cout << a << " + " << b << " = " << a + b << endl;
    
    return a + b;
}

class T1
{
public:
    static int sub(int a, int b)
    {
        cout << a << " - " << b << " = " << a - b << endl;

        return a - b;
    }
};

class T2
{
public:
    int operator()(int a, int b)
    {
        cout << a << " * " << b << " = " << a * b << endl;

        return a * b;
    }
};

int main(void)
{
    function<int(int, int)> f1 = add;
    function<int(int, int)> f2 = T1::sub;

    T2 t;
    function<int(int, int)> f3 = t;

    // output: 9 + 3 = 12
    f1(9, 3);

    // output: 9 - 3 = 6
    f2(9, 3);

    // output: 9 * 3 = 27
    f3(9, 3);

    return 0;
}
```

注：std::function 可以将可调用对象进行包装，得到统一形式，包装得到的对象为一个函数指针。

#### 作为回调函数使用

```c++
#include <iostream>
#include <functional>
using namespace std;

class A
{
public:
    A(const function<void()>& f) : callback(f)
    {

    }

    void notify()
    {
        callback();
    }

private:
    function<void()> callback;
};

class B
{
public:
    void operator()()
    {
        cout << "我要成为真正的狐狸精！！！" << endl;
    }
};

int main(void)
{
    B b;
    A a(b);
    
    a.notify();

    return 0;
}
```

注：使用 std::function 作为函数的传入参数，可以将不同的可调用对象进行统一的传递。

### 可调用对象的绑定器

std::bind 可以将可调用对象与参数一起进行绑定，绑定后的结果可以使用 std::function 进行保存。

std::bind 的作用：

- 将可调用对象与参数一起绑定成一个仿函数。

- 将多元（参数个数为 n，n > 1）可调用对象转换为一元或者（n-1）元可调用对象。

```c++
// 绑定非类成员函数/变量
auto f = std::bind(可调用对象地址, 绑定的参数/占位符);

// 绑定类成员函数/变量
auto f = std::bind(类函数/成员地址, 类实例对象地址, 绑定的参数/占位符);
```

```c++
#include <iostream>
#include <functional>
using namespace std;

void callFunc(int x, const function<void(int)>& f)
{
    if (x % 2 == 0)
    {
        f(x);
    }
}

void output(int x)
{
    cout << x << " ";
}

void output_add(int x)
{
    cout << x + 10 << " ";
}

int main(void)
{
    // output: 0 2 4 6 8
    auto f1 = bind(output, placeholders::_1);
    for (int i = 0; i < 10; ++i)
    {
        callFunc(i, f1);
    }
    cout << endl;

    // output: 10 12 14 16 18
    auto f2 = bind(output_add, placeholders::_1);
    for (int i = 0; i < 10; ++i)
    {
        callFunc(i, f2);
    }
    cout << endl;

    return 0;
}
```

注：placeholders::_1 是一个占位符，代表这个位置将在函数调用时被传入的第一个参数所替代。

```c++
#include <iostream>
#include <functional>
using namespace std;

void output(int x, int y)
{
    cout << x << " " << y << endl;
}

int main(void)
{
    // output: 1 2
    bind(output, 1, 2)();

    // output: 10 2
    bind(output, placeholders::_1, 2)(10);

    // output: 2 10
    bind(output, 2, placeholders::_1)(10);

    // output: 2 20
    bind(output, 2, placeholders::_2)(10, 20);

    // output: 10 20
    bind(output, placeholders::_1, placeholders::_2)(10, 20);

    // output: 20 10
    bind(output, placeholders::_2, placeholders::_1)(10, 20);

    return 0;
}
```

`std::function 配合 std::bind 实现对类成员函数指针或类成员指针的包装`

```c++
#include <iostream>
#include <functional>
using namespace std;

class Test
{
public:
    void output(int x, int y)
    {
        cout << "x: " << x << ", y: " << y << endl;
    }
    int m_number = 100;
};

int main(void)
{
    Test t;

    // 绑定类成员函数
    function<void(int, int)> f1 = 
        bind(&Test::output, &t, placeholders::_1, placeholders::_2);

    // 绑定类成员变量（public）
    function<int&(void)> f2 = bind(&Test::number, &t);

    // output: x: 1, y: 2
    f1(1, 2);

    f2() = 1;

    // output: t.m_number: 1
    cout << "t.m_number: " << t.m_number << endl;

    return 0;
}
```

注：`f1` 的类型是 `function<void(int, int)>`，通过使用 std::bind 将 Test 的成员函数 output 的地址和对象 t 绑定，并转化为一个仿函数并存储到对象 f1 中。

注：`f2` 的类型是 `function<int&(void)>`，通过使用 std::bind 将 Test 的成员 m_number 的地址和对象 t 绑定，并转换为一个仿函数并存储到对象 f2 中。int 是绑定的类成员的类型，`&` 表示变量可以被修改，由于没有参数，因此参数列表指定为 void。

### Lambda 表达式

{% span cyan, lambda 表达式是 C++11 的新特性。 %}

- 就地匿名定义函数或函数对象

- 避免了代码膨胀和功能分散，实现功能闭包

{% span cyan, lambda 表达式定义了一个匿名函数，并且可以捕获一定范围内的变量。 %}

```c++
[capture](params) opt -> ret {body};
```

- `[capture]`: 捕获列表，捕获一定范围内的变量

- `(params)`: 如果没有参数，参数列表可以省略不写

```c++
// 参数列表为空
auto f = [](){return 1;};

// 没有参数，参数列表可以省略不写
auto f = []{return 1;};
```

- `opt`: 函数选项，可以省略不写

   - mutable: 修改按值传递进来的拷贝

   - exception: 指定函数抛出的异常

- `ret`: 返回值类型，使用返回值后置语法定义的

- `body`: 函数体，函数的实现

#### 捕获列表

lambda 表达式的捕获列表可以捕获一定范围内的变量。

- `[]`: 不捕捉任何变量

- `[&]`: 捕获外部作用域中所有变量，按引用捕获

- `[=]`: 捕获外部作用域中所有变量，按值捕获，拷贝的副本在匿名函数体内部是只读的

- `[=, &var]`: 按值捕获外部作用域中所有变量，并按照引用捕获外部变量 var

- `[var]`: 按值捕获 var 变量

- `[&var]`: 按引用捕获 var 变量

- `[this]`: 捕获当前类中的 this 指针，让 lambda 表达式拥有和当前类成员函数同样的访问权限，如果已经使用了 & 或者 =，默认添加此选项

```c++
#include <iostream>
#include <functional>
using namespace std;

class Test
{
public:
    void output(int x, int y)
    {
        // error
        auto x1 = []{return m_number;};

        // ok
        auto x2 = [=]{return m_number + x + y;};

        // ok
        auto x3 = [&]{return m_number + x + y;};

        // ok，捕获 this 指针，可访问对象内部成员
        auto x4 = [this]{return m_number;};

        // error
        auto x5 = [this]{return m_number + x + y;};

        // ok
        auto x6 = [this, x, y]{return m_number + x + y;};

        // ok
        auto x7 = [this]{return m_number++;};
    }

    int m_number = 100;
};
```

```c++
int main(void)
{
    int a = 10, b = 20;
    
    // error
    auto f1 = []{return a;};

    // ok
    auto f2 = [&]{return a++;};

    // ok
    auto f3 = [=]{return a;};

    // error
    auto f4 = [=]{return a++;};

    // error
    auto f5 = [a]{return a + b;};

    // ok
    auto f6 = [a, &b]{return a + (b++);};

    // ok
    auto f7 = [=, &b]{return a + (b++);};

    return 0;
}
```

#### 返回值

{% span cyan, C++11 中允许省略 lambda 表达式的返回值，编译器会根据 return 语句自动推导返回值的类型。 %}

```c++
// 完整的 lambda 表达式定义
auto f = [](int a) -> int
{
    return a + 10;
};

// 忽略返回值
auto f = [](int a)
{
    return a + 10;
};
```

{% span cyan, lambda 表达式不能通过列表初始化自动推导出返回值类型。 %}

```c++
// ok
auto f = [](int i)
{
    return i;
}

// error
auto f1 = []()
{
    return {1, 2};
}
```

#### 函数本质

被 mutable 修改的 lambda 表达式没有参数也要写出参数列表，可以去掉按值捕获的外部变量的只读（const）属性。

```c++
int a = 0;

// error
auto f1 = [=]{return a++;};

// ok
auto f2 = [=]()mutable {return a++;};
```

注：lambda 表达式的类型在 C++11 中会被看做是一个带 operator() 的类，即仿函数。lambda 表达式的 operator() 默认是 const 的，一个 const 成员函数是无法修改成员变量值的。

{% span cyan, mutable 选项可以取消 operator() 的 const 属性。 %}

---

`可以使用 std::function 和 std::bind 来存储和操作 lambda 表达式`

```c++
#include <iostream>
#include <functional>
using namespace std;

int main(void)
{
    std::function<int(int)> f1 = [](int a){return a;};
    std::function<int(int)> f2 = bind([](int a){return a;}, placeholders::_1);

    cout << f1(100) << endl;
    cout << f2(200) << endl;

    return 0;
}
```

{% span cyan, 没有捕获任何变量的 lambda 表达式，可以转换成一个普通的函数指针。 %}

```c++
using func_ptr = int(*)(int);

func_ptr f = [](int a)
{
    return a;
};

f(1);
```

### 右值引用

左值（loactor value, lvalue）是存储在内存中，有明确存储地址的数据（可取地址）。右值（read value，rvalue）是指可以提供数据值的数据（不可取地址）。所有有名字的变量或对象都是左值，而右值是匿名的。

```c++
// a，b 是左值。1，2 是右值。
int a = 1;
int b = 2;
a = b;
```

右值分为两种：

- 纯右值：非引用返回的临时变量、运算表达式产生的临时变量、原始字面量和 lambda 表达式等

- 将亡值：与右值引用相关的表达式，如 `T&&` 类型函数的返回值、`std::move` 的返回值等

{% span cyan, 右值引用（R-value reference）是一个对右值进行引用的类型，右值引用必须立即进行初始化，右值引用并不拥有所绑定对象的内存，只是一个别名，右值引用将右值（临时变量）的生命周期延长，使得所绑定的对象的生命周期与右值引用的声明周期相同，右值引用的标记为 && %}

```c++
#include <iostream>
using namespace std;

// 右值引用
int&& value = 1;

class Test
{
public:
    Test()
    {
        cout << "construct" << endl;
    }

    Test(const Test& a)
    {
        cout << "copy construct" << endl;
    }
};

Test getObj()
{
    return Test();
}

int main(){
    
    int a1;

    // error，使用左值初始化一个右值引用类型是不合法的
    int &&a2 = a1;

    // error，右值不能给普通的左值引用赋值
    Test& t = getObj();

    // ok
    Test && t = getObj();

    // ok，常量左值引用可以接受左值、右值、常量左值和常量右值
    const Test& t = getObj();

    return 0;
}
```

#### 性能优化

{% span cyan, 使用右值引用避免对象的深拷贝，可以提高程序效率。 %}

```c++
#include <iostream>
using namespace std;

class Test
{
public:
    Test() : m_num(new int(100))
    {
        cout << "construct" << endl;
    }

    Test(const Test& a) : m_num(new int(*a.m_num))
    {
        cout << "copy construct" << endl;
    }

    ~Test()
    {
        delete m_num;
    }

    int* m_num;
};

Test getObj()
{
    Test t;
    return t;
}

int main()
{
    // 调用拷贝构造函数进行深拷贝
    Test t = getObj();

    cout << "t.m_num: " << *t.m_num << endl;

    return 0;
}
```

{% label output pink %}

```shell
construct
copy construct
t.m_num: 100
```

{% span cyan, 右值引用具有移动语义，可以将资源（堆、系统对象等）通过浅拷贝从一个对象转移到另一个对象 %}

```c++
#include <iostream>
using namespace std;

class Test
{
public:
    Test() : m_num(new int(100))
    {
        cout << "construct" << endl;
    }

    Test(const Test& a) : m_num(new int(*a.m_num))
    {
        cout << "copy construct" << endl;
    }

    // 添加移动构造函数
    Test(Test&& a) : m_num(a.m_num)
    {
        a.m_num = nullptr;
        cout << "move construct" << endl;
    }

    ~Test()
    {
        delete m_num;
        cout << "destruct Test class ..." << endl;
    }

    int* m_num;
};

Test getObj()
{
    Test t;
    return t;
}

int main()
{
    // 调用移动构造函数进行浅拷贝
    Test t = getObj();
    cout << "t.m_num: " << *t.m_num << endl;

    return 0;
}
```

{% label output pink %}

```shell
construct
move construct
destruct Test class ...
t.m_num: 100
destruct Test class ...
```

注：移动构造中使用了右值引用，会将临时对象中的堆内存地址的所有权转移给对象 t。

#### && 的特性

模板类型参数 T&& 和自动类型推导 auto && 被称为未定的引用类型，但是 const T&& 表示一个右值引用，不是未定引用类型。

```c++
template<typename T>
void f(T&& param);
void f1(const T&& param);

// 10 是右值，T&& 表示右值引用
f(10);
int x = 10;

// x 是左值，T&& 表示左值引用
f(x);

// const T&& 一定是右值引用
f1(x);
```

```c++
int main()
{
    int x = 520, y = 1314;
}
```

### 结语

第十三篇博文写完，开心！！！！

今天，也是充满希望的一天。