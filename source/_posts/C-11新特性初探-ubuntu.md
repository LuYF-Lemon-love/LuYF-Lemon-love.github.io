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

### 结语

第十三篇博文写完，开心！！！！

今天，也是充满希望的一天。