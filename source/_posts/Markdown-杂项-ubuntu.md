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

4. [Markdown如何实现表格的合并单元格](https://blog.csdn.net/mahoon411/article/details/125871243)

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
|$\cdot$|`$\cdot$`|$\odot$|`$\odot$`|$\mathcal{X}$|`$\mathcal{X}$`|
|$\top$|`$\top$`|$\dots$|`$\dots$`|$\mathcal{R}$|`$\mathcal{R}$`|
|$\vdots$|`$\vdots$`|$\ddots$|`$\ddots$`|$\neq$|`$\neq$`|
|$\mathcal{V}$|`$\mathcal{V}$`|$\langle\rangle$|`$\langle\rangle$`|$\iff$|`$\iff$`|
|$\Lambda$|`$\Lambda$`|$\theta$|`$\theta$`|$\forall$|`$\forall$`|
|$\checkmark$|`$\checkmark$`|$\otimes$|`$\otimes$`|$\lgroup \rgroup$|`$\lgroup \rgroup$`|

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

### Max

$$
a=\max_{1\leq j \leq s}
$$

```markdown
a=\max_{1\leq j \leq s}
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

### 分段函数

$$
x = \begin{cases}
   a &\text{if } b \\
   c &\text{if } d
\end{cases}
$$

```markdown
$$
x = \begin{cases}
   a &\text{if } b \\
   c &\text{if } d
\end{cases}
$$
```

### 公式块

$$
\begin{gather}
   a=b \\
   e=b+c
\end{gather}
$$

```markdown
$$
\begin{gather}
   a=b \\
   e=b+c
\end{gather}
$$
```

### 矩阵块

$$
\begin{bmatrix}
   a & b \\
   c & d
\end{bmatrix}
$$

```markdown
$$
\begin{bmatrix}
   a & b \\
   c & d
\end{bmatrix}
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

## 合并单元格

实现单元格合并的属性:

```html
按行合并：rowspan
按列合并：colspan
```

```html
<table>
	<tr>
	    <th colspan="3">计算机网络分层模型</th>
	</tr >
	<tr>
	    <td >OSI七层模型</td>
	    <td>TCP/IP四层模型</td>
	    <td>TCP/IP五层模型</td>  
	</tr >
	<tr >
	    <td>应用层</td>
	    <td rowspan="3">应用层</td>
	    <td rowspan="3">应用层</td>
	</tr>
	<tr>
	    <td>表示层</td>
	</tr>
	<tr>
	    <td>会话层</td>
	</tr>
	<tr>
	    <td>传输层</td>
	    <td>传输层</td>
       <td>传输层</td>
	</tr>
	<tr>
       <td>网络层</td>
	    <td>网络层</td>
       <td>网络层</td>
	</tr>
	<tr>
	    <td>数据链路层</td>
	    <td rowspan="2">网络接口层</td>
       <td>数据链路层</td>
	</tr>
	<tr>
	    <td>物理层</td>
	    <td>物理层</td>
	</tr>
</table>
```

---

<table>
	<tr>
	    <th colspan="3">计算机网络分层模型</th>
	</tr >
	<tr>
	    <td >OSI七层模型</td>
	    <td>TCP/IP四层模型</td>
	    <td>TCP/IP五层模型</td>  
	</tr >
	<tr >
	    <td>应用层</td>
	    <td rowspan="3">应用层</td>
	    <td rowspan="3">应用层</td>
	</tr>
	<tr>
	    <td>表示层</td>
	</tr>
	<tr>
	    <td>会话层</td>
	</tr>
	<tr>
	    <td>传输层</td>
	    <td>传输层</td>
       <td>传输层</td>
	</tr>
	<tr>
       <td>网络层</td>
	    <td>网络层</td>
       <td>网络层</td>
	</tr>
	<tr>
	    <td>数据链路层</td>
	    <td rowspan="2">网络接口层</td>
       <td>数据链路层</td>
	</tr>
	<tr>
	    <td>物理层</td>
	    <td>物理层</td>
	</tr>
</table>

## 结语

第三十八篇博文写完，开心！！！！

今天，也是充满希望的一天。