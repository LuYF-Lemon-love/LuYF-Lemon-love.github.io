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

## 数学公式编号

`\tag{n}` 标签为`数学公式`设置编号, `n` 为编号, 公式编号`右对齐`.

```markdown
$$Dets = \mathcal{H(\Phi_{det})} \tag{1}$$
```

$$Dets = \mathcal{H(\Phi_{det})} \tag{1}$$

## 常用符号

|符号|TeX|符号|TeX|符号|TeX|
|:-:|:-:|:-:|:-:|:-:|:-:|
|$\vee$|`$\vee$ or $\lor$`|$\wedge$|`$\wedge$ or $\land$`|||

## 例子

$$
\frac{M}{N}=\frac{piR^2}{(2R)^2} \Rightarrow pi=4*\frac{M}{N}
$$

---

$$
\sum_1^\infty(\frac{1}{n^2}) = \frac{pi^2}{6}
$$

---

$$
\frac{pi}{4} = 1-\frac{1}{3}+\frac{1}{5}-\frac{1}{7}+\cdots
$$

---

$$
tanh x = \frac{sinh x}{cosh x} = \frac{e^x - e^{-x}}{e^x + e^{-x}}
$$

---

$$
(tanh x)^{'} = sech^2x = \frac{1}{cosh^2x} = 1 - tanh^2x
$$

---

$$
S(x) = \frac{1}{1 + e^{-x}}
$$

---

$$
S^{'}(x) = \frac{e^{-x}}{(1 + e^{-x})^2} = S(x)(1 - S(x))
$$

---

$$
log_a(1) = 0
$$

---

$$
log_a(a) = 1
$$

---

$$
log_ab * log_ba = 1
$$

---

$$
-log_c\frac{a}{b} = log_c\frac{b}{a}
$$

---

$$
log_a(MN) = log_aM + log_aN
$$

---

$$
log_a(\frac{M}{N}) = log_aM - log_aN
$$

---

$$
log_a(\frac{1}{N}) = -log_aN
$$

---

$$
a^{log_ab} = b
$$

---

$$
log_aM^n = nlog_aM
$$

---

$$
log_a\sqrt[n]{M} = \frac{1}{n}log_aM
$$

---

$$
log_a(a^k) = k
$$

---

$$
log_ab = \frac{log_cb}{log_ca}
$$

---

$$
\nu(king) - \nu(man) \simeq \nu(queen) - \nu(woman)
$$

---

$$
\mathcal{L} = \sum_{(h, \ell, t) \in S} \sum_{(h^{'}, \ell, t^{'}) \in S^{'}_{(h, \ell, t)}} [\gamma + d(h + \ell, t) - d(h^{'} + \ell, t^{'})]_{+}
$$

---

$$
S^{'}_{(h, \ell, t)} = \{(h^{'}, \ell, t)|h^{'} \in E\} \cup \{(h, \ell, t^{'})|t^{'} \in E\}.
$$

---

$$
V \in \mathbb{R}^{d^a\times\mid V\mid}
$$

---

$$
w_i \in \mathbb{R}^d$ ($d = d^a + d^b \times 2
$$

---

$$
q_i = w_{i - l + 1 : i}\quad\quad(1 \leq i \leq m + l - 1). \tag{1}
$$

---

$$
p_i = [Wq + b]_i \tag{2}
$$

---

$$
[x]_i = max(p_i), \tag{3}
$$

---

$$
[x]_{ij} = max(p_{ij}), \tag{4}
$$

---

$$
s = \sum_i a_ix_i, \tag{5}
$$

---

$$
s = \sum_i \frac{1}{n}x_i, \tag{6}
$$

---

$$
a_i = \frac{exp(e_i)}{\sum_kexp(e_k)} \tag{7}
$$

---

$$
e_i = x_iAr, \tag{8}
$$

---

$$
p(r\mid S, θ) = \frac{exp(o_r)}{\sum_{k=1}^{n_r} exp(o_k)}, \tag{9}
$$

---

$$
o = Ms + d. \tag{10}
$$

---

$$
J(θ) = \sum_{i=1}^{s} log p(r_i \mid S_i, θ), \tag{11}
$$

---

$$
o = M(s \circ h) + d. \tag{12}
$$

---

$$
\hat{s_i} = ps_i
$$

---

$$
\mathbf{d} = \gamma - ||\mathbf{h}+\mathbf{r}-\mathbf{t}||_{2}
$$

---

$$
\mathbf{score} = \log\left(\frac{1}{1+\exp(\mathbf{-d})}\right)
$$

---

$\ell_2$

$$
min\sum_{h, r, t \in \mathbb{D}^+ \cup \mathbb{D}^-} log(1+exp(-y \times f(h,r,t))) \tag{1}
$$

$$
f(h,r,t)=\gamma - \parallel h + r - t \parallel_2 \tag{2}
$$

## 结语

第三十八篇博文写完，开心！！！！

今天，也是充满希望的一天。