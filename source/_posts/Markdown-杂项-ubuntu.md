---
title: Markdown 杂项-ubuntu
tags:
  - Markdown
categories: 杂项
description: 介绍一些 Markdown 杂项。
cover: 'https://cos.luyf-lemon-love.space/images/2923448421..png'
abbrlink: 4033391677
date: 2022-11-26 19:59:54
---

## 前言

介绍一些 `Markdown` 杂项。

操作系统：**Ubuntu 20.04.5 LTS**

## 参考文档

1. [CSDN Markdown 公式编号](https://blog.csdn.net/chengyq116/article/details/91175054)

2. [MarkDown数学公式基本语法](https://blog.csdn.net/qq_38342510/article/details/124064158)

3. [MarkDown编辑器字体颜色设置](https://blog.csdn.net/qq_43559187/article/details/120913021)

## 数学公式编号

`\tag{n}` 标签为`数学公式`设置编号, `n` 为编号, 公式编号`右对齐`.

```markdown
$$Dets = \mathcal{H(\Phi_{det})} \tag{1}$$
```

$$Dets = \mathcal{H(\Phi_{det})} \tag{1}$$

## 常用符号

|符号|TeX|符号|TeX|符号|TeX|
|:-:|:-:|:-:|:-:|:-:|:-:|
|$\vee$|`$\vee$ or $\lor$`|$\wedge$|`$\wedge$ or $\land$`|$pi$|`$pi$`|
|$\Rightarrow$|`$\Rightarrow$`|$\infty$|`$\infty$`|$\cdots$|`$\cdots$`|
|$\nu$|`$\nu$`|$\simeq$|`$\simeq$`|$\mathcal{L}$|`$\mathcal{L}$`|
|$\gamma$|`$\gamma$`|$\ell$|`$\ell$`|$\in$|`$\in$`|
|$[]$|`$[]$`|$\{\}$|`$\{\}$`|$\|$|`$\|$`|
|$\cup$|`$\cup$`|$\mathbb{R}$|`$\mathbb{R}$`|$\times$|`$\times$`|
|$\mid$|`$\mid$`|space|`$\quad$`|$\leq$|`$\leq$`|
|$θ$|`$θ$`|$\hat{s}$|`$\hat{s}$`|$\circ$|`$\circ$`|
|$\mathbf{h}$|`$\mathbf{h}$`|$J$|`$J$`|$\parallel$|`$\parallel$`|
|$\left(\right)$|`$\left(\right)$`|$\lambda$|`$\lambda$`|$\Phi$|`$\Phi$`|
|$\bar{x}$|`$\bar{x}$`|$\vec{x}$|`$\vec{x}$`|$\infty$|`$\infty$`|
|$\varepsilon$|`$\varepsilon$`|$\cap$|`$\cap$`|$\subset$|`$\subset$`|
|$\approx$|`$\approx$`|$\sigma$|`$\sigma$`|$\ne$|`$\ne$`|
|$\cdot$|`$\cdot$`|$\odot$|`$\odot$`|||

## 数学运算符

### 分数

$$
\frac{M}{N}
$$

```markdown
$$
\frac{M}{N}
$$
```

### 上标

$$
R^2
$$

```markdown
$$
R^2
$$
```

### 求和符号

$$
\sum_1^\infty n
$$

```markdown
$$
\sum_1^\infty n
$$
```

### 根号

$$
\sqrt[n]{M}
$$

```markdown
$$
\sqrt[n]{M}
$$
```

## 字体

### 颜色

```html
浅红色文字：<font color="#dd0000">浅红色文字</font><br/>
深红色文字：<font color="#660000">深红色文字</font><br/>
浅绿色文字：<font color="#00dd00">浅绿色文字</font><br/>
深绿色文字：<font color="#006600">深绿色文字</font><br/>
浅蓝色文字：<font color="#0000dd">浅蓝色文字</font><br/>
深蓝色文字：<font color="#000066">深蓝色文字</font><br/>
浅黄色文字：<font color="#dddd00">浅黄色文字</font><br/>
深黄色文字：<font color="#666600">深黄色文字</font><br/>
浅青色文字：<font color="#00dddd">浅青色文字</font><br/>
深青色文字：<font color="#006666">深青色文字</font><br/>
浅紫色文字：<font color="#dd00dd">浅紫色文字</font><br/>
深紫色文字：<font color="#660066">深紫色文字</font><br/>
```

---

浅红色文字：<font color="#dd0000">浅红色文字</font><br/>
深红色文字：<font color="#660000">深红色文字</font><br/>
浅绿色文字：<font color="#00dd00">浅绿色文字</font><br/>
深绿色文字：<font color="#006600">深绿色文字</font><br/>
浅蓝色文字：<font color="#0000dd">浅蓝色文字</font><br/>
深蓝色文字：<font color="#000066">深蓝色文字</font><br/>
浅黄色文字：<font color="#dddd00">浅黄色文字</font><br/>
深黄色文字：<font color="#666600">深黄色文字</font><br/>
浅青色文字：<font color="#00dddd">浅青色文字</font><br/>
深青色文字：<font color="#006666">深青色文字</font><br/>
浅紫色文字：<font color="#dd00dd">浅紫色文字</font><br/>
深紫色文字：<font color="#660066">深紫色文字</font><br/>

### 大小

```html
size为1：<font size="1">size为1</font><br/>
size为2：<font size="2">size为2</font><br/>
size为3：<font size="3">size为3</font><br/>
size为4：<font size="4">size为4</font><br/>
size为5：<font size="5">size为5</font><br/>
size为6：<font size="6">size为6</font><br/>
size为7：<font size="7">size为7</font><br/>
size为8：<font size="8">size为8</font><br/>
size为9：<font size="9">size为9</font><br/>
size为10：<font size="10">size为10</font><br/>
```

---

size为1：<font size="1">size为1</font><br/>
size为2：<font size="2">size为2</font><br/>
size为3：<font size="3">size为3</font><br/>
size为4：<font size="4">size为4</font><br/>
size为5：<font size="5">size为5</font><br/>
size为6：<font size="6">size为6</font><br/>
size为7：<font size="7">size为7</font><br/>
size为8：<font size="8">size为8</font><br/>
size为9：<font size="9">size为9</font><br/>
size为10：<font size="10">size为10</font><br/>

### 字体

```html
<font face="黑体">我是黑体字</font><br/>
<font face="宋体">我是宋体字</font><br/>
<font face="微软雅黑">我是微软雅黑字</font><br/>
<font face="fantasy">我是fantasy字</font><br/>
<font face="Helvetica">我是Helvetica字</font><br/>
```

---

<font face="黑体">我是黑体字</font><br/>
<font face="宋体">我是宋体字</font><br/>
<font face="微软雅黑">我是微软雅黑字</font><br/>
<font face="fantasy">我是fantasy字</font><br/>
<font face="Helvetica">我是Helvetica字</font><br/>

### 背景色

```html
<table>
    <tr>
        <td bgcolor=#FF00FF>背景色的设置是按照十六进制颜色值：#FF00FF</td>
    </tr>
</table>
<table>
    <tr>
        <td bgcolor=#FF83FA>背景色的设置是按照十六进制颜色值：#FF83FA</td>
    </tr>
</table>
<table>
    <tr>
        <td bgcolor=#D1EEEE>背景色的设置是按照十六进制颜色值：#D1EEEE</td>
    </tr>
</table>
<table>
    <tr>
        <td bgcolor=#C0FF3E>背景色的设置是按照十六进制颜色值：#C0FF3E</td>
    </tr>
</table>
<table>
    <tr>
        <td bgcolor=#54FF9F>背景色的设置是按照十六进制颜色值：#54FF9F</td>
    </tr>
</table>
<table>
    <tr>
        <td bgcolor=DarkSeaGreen>这里的背景色是：DarkSeaGreen</td>
    </tr>
</table>
```

---

<table>
    <tr>
        <td bgcolor=#FF00FF>背景色的设置是按照十六进制颜色值：#FF00FF</td>
    </tr>
</table>
<table>
    <tr>
        <td bgcolor=#FF83FA>背景色的设置是按照十六进制颜色值：#FF83FA</td>
    </tr>
</table>
<table>
    <tr>
        <td bgcolor=#D1EEEE>背景色的设置是按照十六进制颜色值：#D1EEEE</td>
    </tr>
</table>
<table>
    <tr>
        <td bgcolor=#C0FF3E>背景色的设置是按照十六进制颜色值：#C0FF3E</td>
    </tr>
</table>
<table>
    <tr>
        <td bgcolor=#54FF9F>背景色的设置是按照十六进制颜色值：#54FF9F</td>
    </tr>
</table>
<table>
    <tr>
        <td bgcolor=DarkSeaGreen>这里的背景色是：DarkSeaGreen</td>
    </tr>
</table>

## 结语

第三十八篇博文写完，开心！！！！

今天，也是充满希望的一天。