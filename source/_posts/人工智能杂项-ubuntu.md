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
swiper_index: 1
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

## 结语

第三十二篇博文写完，开心！！！！

今天，也是充满希望的一天。