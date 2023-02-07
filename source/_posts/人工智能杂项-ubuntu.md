---
title: 人工智能杂项-ubuntu
tags:
  - 人工智能
  - 深度学习
  - 强化学习
  - 机器学习
  - 数学
categories: 杂项
description: 介绍一些人工智能杂项，包括：激活函数等问题。
cover: 'https://cos.luyf-lemon-love.space/images/noxus_creatures_01.jpg'
abbrlink: 1059991633
date: 2022-10-07 17:48:54
---

## 前言

介绍一些`人工智能`杂项，包括：`激活函数`等问题。

操作系统：Ubuntu 20.04.4 LTS

## 参考文档

1. [双曲正切函数](https://baike.baidu.com/item/%E5%8F%8C%E6%9B%B2%E6%AD%A3%E5%88%87%E5%87%BD%E6%95%B0/15469414)

2. [双曲正切](https://baike.baidu.com/item/%E5%8F%8C%E6%9B%B2%E6%AD%A3%E5%88%87/3194837)

3. [Sigmoid函数](https://baike.baidu.com/item/Sigmoid%E5%87%BD%E6%95%B0/7981407)

4. [对数公式](https://baike.baidu.com/item/%E5%AF%B9%E6%95%B0%E5%85%AC%E5%BC%8F/5557846)

5. [导数表](https://baike.baidu.com/item/%E5%AF%BC%E6%95%B0%E8%A1%A8/10889755?fr=aladdin)

6. [sklearn.metrics.pairwise.euclidean_distances](https://scikit-learn.org/stable/modules/generated/sklearn.metrics.pairwise.euclidean_distances.html#sklearn.metrics.pairwise.euclidean_distances)

## 双曲正切函数

`双曲正切函数`（$tanh$）是`双曲正弦函数`（$sinh$）与`双曲余弦函数`（$cosh$）的比值，其解析形式为：

$$
tanh x = \frac{sinh x}{cosh x} = \frac{e^x - e^{-x}}{e^x + e^{-x}}
$$

{% label 导数 pink %}

$$
(tanh x)^{'} = sech^2x = \frac{1}{cosh^2x} = 1 - tanh^2x
$$

{% label 图像 pink %}

![](https://cos.luyf-lemon-love.space/images/20221007184613.png)

## Sigmoid 函数

`Sigmoid` 函数也叫 `Logistic` 函数，其解析形式为：

$$
S(x) = \frac{1}{1 + e^{-x}}
$$

{% label 导数 pink %}

$$
S^{'}(x) = \frac{e^{-x}}{(1 + e^{-x})^2} = S(x)(1 - S(x))
$$

{% label 图像 pink %}

![](https://cos.luyf-lemon-love.space/images/20221007190111.png)

## 对数公式

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

## 基本初等函数求导公式

更详细的求导公式可以参考: [导数表](https://baike.baidu.com/item/%E5%AF%BC%E6%95%B0%E8%A1%A8/10889755?fr=aladdin).

![](https://cos.luyf-lemon-love.space/images/20221127154639.png)

## sklearn 常用的函数

### euclidean_distances

文档链接: https://scikit-learn.org/stable/modules/generated/sklearn.metrics.pairwise.euclidean_distances.html#sklearn.metrics.pairwise.euclidean_distances .

**`sklearn.metrics.pairwise.euclidean_distances`**

`sklearn.metrics.pairwise.euclidean_distances(X, Y=None, *, Y_norm_squared=None, squared=False, X_norm_squared=None)`

Compute the distance matrix between `each pair` from a vector array `X` and `Y`.

For efficiency reasons, the euclidean distance between `a pair of row vector x and y` is computed as:

`dist(x, y) = sqrt(dot(x, x) - 2 * dot(x, y) + dot(y, y))`

This formulation has two advantages over other ways of computing distances. **First, it is computationally efficient when dealing with sparse data.** Second, if one argument varies but the other remains unchanged, then `dot(x, x)` and/or `dot(y, y)` can be pre-computed.

However, this is not the most precise way of doing this computation, because this equation potentially suffers from “catastrophic cancellation”. Also, the distance matrix returned by this function may not be exactly symmetric as required by, e.g., `scipy.spatial.distance` functions.

Read more in the [User Guide](https://scikit-learn.org/stable/modules/metrics.html#metrics).

**Parameters:**

- **X: {array-like, sparse matrix} of shape (n_samples_X, n_features)**

   - An array where **each row is a sample** and **each column is a feature**.

- **Y: {array-like, sparse matrix} of shape (n_samples_Y, n_features), default=None**

   - An array where each row is a sample and each column is a feature. If `None`, method uses `Y=X`.

- **Y_norm_squared: array-like of shape (n_samples_Y,) or (n_samples_Y, 1) or (1, n_samples_Y), default=None**

   - Pre-computed dot-products of vectors in Y (e.g., `(Y**2).sum(axis=1)`) May be ignored in some cases, see the note below.

- **squared: bool, default=False**

   - Return squared Euclidean distances.

- **X_norm_squared: array-like of shape (n_samples_X,) or (n_samples_X, 1) or (1, n_samples_X), default=None**

   - Pre-computed dot-products of vectors in X (e.g., `(X**2).sum(axis=1)`) May be ignored in some cases, see the note below.

**Returns:**

- **distances: ndarray of shape (n_samples_X, n_samples_Y)**

   - Returns the distances between the row vectors of `X` and the row vectors of `Y`.

**Notes**

To achieve a better accuracy, `X_norm_squared` and `Y_norm_squared` may be unused if they are passed as `np.float32`.

**Examples**

```python
>>> from sklearn.metrics.pairwise import euclidean_distances
>>> X = [[0, 1], [1, 1]]
>>> # distance between rows of X
>>> euclidean_distances(X, X)
array([[0., 1.],
       [1., 0.]])
>>> # get distance to origin
>>> euclidean_distances(X, [[0, 0]])
array([[1.        ],
       [1.41421356]])
```

## 结语

第三十二篇博文写完，开心！！！！

今天，也是充满希望的一天。