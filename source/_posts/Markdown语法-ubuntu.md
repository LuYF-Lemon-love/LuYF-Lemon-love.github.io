---
title: Markdown语法-ubuntu
tags:
  - VSCode
  - Markdown
categories: 计算机基础
description: 介绍一些 Markdown 常用语法
cover: https://cos.luyf-lemon-love.space/images/20220513124626.png
abbrlink: 2817253591
date: 2022-05-07 22:53:26
---

### 前言

Markdown 是一种轻量级标记语言，它允许人们使用易读易写的纯文本格式编写文档，然后转换成有效的 XHTML 或者 HTML 文档。

Markdown 语法是程序员的必备技能。

#### 环境

本文使用 VSCode 编写的。

VSCode 配置 Markdown 环境只需安装 Markdown 插件即可。

我选择的插件为 markdownlint。

Ctrl + K V 即可实现分屏预览效果，Ctrl + Shift + V 也可以产生预览效果。

操作系统：**Ubuntu 20.04.4 LTS**

### 参考文档

1. [花猪大佬的Markdown语法](https://cnhuazhu.top/butterfly/2021/01/20/Markdown%E8%AF%AD%E6%B3%95/)

2. [Markdown Cheat Sheet](https://www.markdownguide.org/cheat-sheet/)

3. [使用免费的CDN平台jsDelivr搭建个人cdn资源网盘](https://blog.csdn.net/q906270629/article/details/106145109?spm=1001.2014.3001.5506)

### Markdown 的基本语法

#### Heading

一共有6个级别的标题

```markdown
# H1
## H2
### H3
#### H4
##### H5
###### H6
```

#### Blockquote

```markdown
>blokquote
>>nest blockquote
```

效果

>blockquote
>
>>nest blockquote

#### Text

```markdown
**bold text**
*italicized text*
***blod && italicized text***
~~strikethrough~~
```

效果

**blod text**

*italicized text*

***blod && italicized text***

~~strikethrough~~

#### Horizontal Rule

三个或者三个以上的-或者*

```markdown
---
***
```

效果

---
***

#### Code

```markdown
(```python)
# 代码块语法：使用一对```将代码块包围起来。（这里加了括号是为了防止转义，因为这篇博文是使用 Markdown 写的）
print("hello world!)
(```)
```

效果

```python
# 代码块语法：使用一对```将代码块包围起来。（这里加了括号是为了防止转义，因为这篇博文是使用 Markdown 写的
print("hello world!)
```

```markdown
`print("hello world!)`
```

效果

`print("hello world!)`

#### Link

```markdown
[百度](https://www.baidu.com "百度一下")
```

效果

[百度](https://www.baidu.com "百度一下")

#### Image

```markdown
![苏苏真可爱](https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/picture@main/苏苏-001.jpeg "苏苏惊呆图")
```
效果

![苏苏真可爱](https://cos.luyf-lemon-love.space/images/苏苏1.jpeg "苏苏惊呆图")


#### Ordered List



```markdown
1. First item
2. Second item
3. Third item
```

效果

1. Fist item
2. Second item
3. Third item

#### Unordered List

无序列表：- + * 任何一种都可以

```markdown
- First item
- Second item
- Third item

---

+ First item
+ Second item
+ Third item

---

* First item
* Second item
* Third item
```

效果

- First item
- Second item
- Third item

---

+ First item
+ Second item
+ Third item

---

* First item
* Second item
* Third item

#### Nest List

```markdown
- Unordered List
  1. First item
  2. Second item
- Unordered List
  1. First item
  2. Second item
```

效果

- Unordered List
  1. First item
  2. Second item
- Unordered List
  1. First item
  2. Second item

#### Table

```markdown
| 左对齐 | 右对齐 | 居中对齐 |
|   :-  |   -:  |   :-:   |
|   c   |   c   |    c    |
|   c   |   c   |    c    |
```

效果

| 左对齐 | 右对齐 | 居中对齐 |
|   :-  |   -:  |   :-:   |
|   c   |   c   |    c    |
|   c   |   c   |    c    |


#### 表情包

表情包网站 https://www.emojidaquan.com/
直接从上面网站中复制即可

```markdown
🤪
```

效果

🤪

#### 空格字符

```markdown
中间有个空格字符&emsp;中间有个空格字符
```

#### 锚点

```markdown
[跳转链接 (说明文字)](#id)

<span id = "id"> 跳转位置（说明位置) </span>
```

效果

[跳转链接 (说明文字)](#id)

<span id = "id"> 跳转位置（说明位置) </span>

#### Subscript

```markdown
H<sub>2</sub>O
```

H<sub>2</sub>O

#### Superscript

```markdown
2x10<sup>10<sup>
```

2x10<sup>10<sup>


#### Fenced Code Block

```markdown
(```)
# 代码块语法：使用一对```将代码块包围起来。（这里加了括号是为了防止转义，因为这篇博文是使用 Markdown 写的）
{
  "firstName": "John",
  "lastName": "Smith",
  "age": 25
}
(```)
```

效果

```
# 代码块语法：使用一对```将代码块包围起来。（这里加了括号是为了防止转义，因为这篇博文是使用 Markdown 写的）
{
  "firstName": "John",
  "lastName": "Smith",
  "age": 25
}
```

#### Hightlight

```markdown
I need to highlight these <mark>very important words<mark>.
```

效果

I need to highlight these <mark>very important words<mark>.

### 结语

第二篇博文写完，开心！！！！

今天，也是充满希望的一天。