---
title: 基于语句级别选择性注意力机制的关系抽取模型-原论文学习笔记-ubuntu
tags:
  - 人工智能
  - 深度学习
  - 知识图谱
  - 数学
  - Linux
  - C/C++
  - GCC
  - G++
  - Ubuntu
  - 多线程
  - 神经关系抽取
  - 远程监督
categories: Paper
description: >-
  Neural Relation Extraction with Selective Attention over Instances
  原论文学习笔记，包括代码实现。
cover: 'https://cos.luyf-lemon-love.space/images/20221019123505 (1).png'
abbrlink: 4249978267
date: 2022-10-19 12:23:16
---

## 前言

**CNN+ATT** 是一种**基于语句级别选择性注意力机制**的**神经网络模型**, 用于构建基于**远程监督**的**关系抽取**系统.它是一个著名的**神经关系抽取** (Neural Relation Extraction, NRE) 模型。

本博文是 **CNN+ATT** 原论文学习笔记，包括代码实现。

**CNN+ATT** 原论文链接：[Neural Relation Extraction with Selective Attention over Instances](https://aclanthology.org/P16-1200v2.pdf).

**代码仓库地址**: https://github.com/LuYF-Lemon-love/susu-knowledge-graph/tree/main/neural-relation-extraction/C%2B%2B .

操作系统：Ubuntu 18.04.6 LTS

## 参考文档

<div id = "1"></div>

1. [Neural Relation Extraction with Selective Attention over Instances](https://aclanthology.org/P16-1200) (Lin et al., ACL 2016).

<div id = "2"></div>

2. [NRE](https://github.com/thunlp/NRE).

<div id = "3"></div>

3. Mike Mintz, Steven Bills, Rion Snow, and Dan Jurafsky. 2009. Distant supervision for relation extraction without labeled data. In Proceedings of ACL-IJCNLP, pages 1003–1011.

<div id = "4"></div>

4. Daojian Zeng, Kang Liu, Yubo Chen, and Jun Zhao. 2015. Distant supervision for relation extraction via piecewise convolutional neural networks. In Proceedings of EMNLP.

<div id = "5"></div>

5. 知识图谱与深度学习, 作者 刘知远, 韩旭, 孙茂松, 由 清华大学出版社 出版, 书号 978-7-302-53852-3, 豆瓣链接: https://book.douban.com/subject/35093204/ .

<div id = "6"></div>

6. Daojian Zeng, Kang Liu, Siwei Lai, Guangyou Zhou, and Jun Zhao. 2014. Relation classification via convolutional deep neural network. In Proceedings of COLING, pages 2335–2344.

<div id = "7"></div>

7. Nitish Srivastava, Geoffrey Hinton, Alex Krizhevsky, Ilya Sutskever, and Ruslan Salakhutdinov. 2014. Dropout: A simple way to prevent neural networks from overfitting. JMLR, 15(1):1929–1958.

<div id = "8"></div>

8. Sebastian Riedel, Limin Yao, and Andrew McCallum. 2010. Modeling relations and their mentions without labeled text. In Proceedings of ECML-PKDD, pages 148–163.



## CNN+ATT 原论文学习笔记

**Neural Relation Extraction with Selective Attention over Instances** (基于语句级别选择性注意力机制的神经网络模型) 提出于 *2016* 年, 发表于 [Proceedings of the 54th Annual Meeting of the Association for Computational Linguistics (Volume 1: Long Papers)](https://aclanthology.org/volumes/P16-1/).

**远程监督关系抽取**已经广泛地应用于从**文本**中发现**新型的关系事实**. 然而, 远程监督不可避免的伴随着**错误标注**的问题, 这些**嘈杂的数据**将大大损害关系抽取的性能.

**基于语句级别选择性注意力机制的关系出抽取神经网络模型**能够缓解**远程监督关系抽取**的**错误标签**问题, 该模型使用**卷机神经网络**来**嵌入句子的语义**. 之后, 使用**语句级别选择性注意力**来**动态地降低嘈杂实例 (句子) 的权重**.

实验结果证明, 该模型可以充分利用每个句子的所有信息, 有效的减少了错误标记实例 (句子) 的影响.

### **介绍**

最近几年, 各种大型知识库 (**Freebae**, **DBpedia**, **YAGO**) 已经被建立和广泛地应用于许多**自然语言处理** (natural language processing, NLP) 任务, 包括 **web search** 和 **question answering**. 这些知识库是由大量三元组 (格式为 (*Microsoft*, *founder*, *Bill Gates*)) 组成的.

**关系抽取** (relation extraction, RE) —— 从纯文本生成关系数据的过程, 是一个自然语言处理的重要任务.

(Mintz et al., 2009)[<sup>3</sup>](#3) 提出**远程监督**, 通过**对齐知识库和纯文本**自动生成训练数据. 远程监督假设, **如果两个实体在知识库中存在某种关系, 则包含这两个实体的所有句子都将表达这种关系**. 例如, 三元组 (*Microsoft, founder, Bill Gates*) 是知识库中的关系事实, 远距离监督会把**包含这两个实体的所有句子**都视为关系 ***founder*** 的正例. 然而 **“Bill Gates ’s turn to philanthropy was linked to the antitrust problems Microsoft had in the U.S. and the European union.”** (比尔·盖茨转向慈善事业与微软在美国和欧盟的反垄断问题有关。) 这句话并没有表达关系 *founder*, 但仍然视为一个正例 (关系 *founder*).

因此有很多人 (2010 年, 2011 年, 2012 年) 采用**多实例学习** (*multi-instance learning*) 缓解远程监督错误标注的问题.  (Zeng et al., 2015)[<sup>4</sup>](#4)将**多实例学习**与**神经网络模型**相结合进一步缓解该问题. 该方法**假设至少有一个提到这两个实体的句子**将表达它们之间的**关系**, 并且**只在训练和预测中为每个实体对选择最有可能的句子**. 该方法**将丢失大量包含在被忽视的句子中的丰富信息**.

本论文提出了一种**基于句子级注意力的卷积神经网络 (CNN)** 用于**远程监督关系提取**. 该模型使用 CNN 来嵌入句子的语义, 如下图. 之后, 为了利用每个句子的所有信息, 将**关系表示为句子嵌入的语义组合**. 为了解决远程监督带来的错误标注问题, 该模型在这些实例的**语义向量**上构建**语句级别的注意力机制**, 从而动态地**减少**噪声实例所对应的权重, 同时**提升**有效实例所对应的权重. 最后, 将利用注意力机制计算的权重与对应实例向量的**加权求和**作为**特征向量**来进行关系抽取.

![](https://cos.luyf-lemon-love.space/images/20221019155759.png)

该论文的贡献总结如下:

- 与现有的**神经关系抽取模型**相比, 该模型可以**充分利用每个实体对的所有实例 (句子) 的信息**.

- 为了解决远程监督的错误标注问题, **该论文提出选择性注意力机制来忽视噪声数据**.

- 实验表明, **选择注意力机制**对于两种 CNN 模型的**关系抽取**是有益的.

### 相关工作

**关系抽取**是一个重要的 **NLP** 任务, 很多人研究有监督的关系抽取. (Mintz et al., 2009)[<sup>3</sup>](#3) 提出**远程监督**, 通过**对齐知识库和纯文本**自动生成训练数据.

>1. (Riedel et al., 2010) models distant supervision for relation extraction as a **multi-instance single-label problem**.
>
>2. (Hoffmann et al., 2011; Surdeanu et al., 2012) adopt **multi-instance multi-label learning in relation extraction**.

---

>Multi-instance learning was originally proposed to address the issue of **ambiguously-labelled training data** when predicting the activity of **drugs** (Dietterich et al., 1997)
>
>(Bunescu and Mooney, 2007) connects weak supervision with multi-instance learning and extends it to relation extraction.

所有**基于特征的方法**严重依赖 NLP 工具生成的**特征的质量**, 这将受到错误传播问题 (**error propagation problem**) 的困扰.

> **deep learning** (Bengio, 2009) has been widely used for various areas, including **computer vision**, **speech recognition** and so on.
> 
>NLP tasks (successfully applied):
>
>1. part-of-speech tagging (Collobert et al., 2011)
>
>2. sentiment analysis (dos Santos and Gatti, 2014)
>
>3. parsing (Socher et al., 2013)
>
>4. machine translation (Sutskever et al., 2014)

---

>1. (Socher et al., 2012) uses a **recursive neural network** in relation extraction.They parse the sentences first and then represent each node in the parsing tree as a vector.
>
>2. (Zeng et al., 2014[<sup>6</sup>](#6); dos Santos et al., 2015) adopt **an end-to-end convolutional neural network for relation extraction**.
>
>3. (Xie et al., 2016) attempts to **incorporate the text information of entities for relation extraction**.

---

虽然深度学习的方法取得了极大的成功, 这些模型仍然**在句子级别上抽取关系**, 并且**缺乏足够的训练数据**. 此外, **传统方法的多实例学习策略不容易应用于神经网络模型**.

>(Zeng et al., 2015)[<sup>4</sup>](#4) **combines at-least-one multi-instance learning with neural network model** to extract relations on distant supervision data. However, they **assume that only one sentence is active for each entity pair**. Hence, it will **lose a large amount of rich information containing in those neglected sentences**.

因此, 本论文提出了**对多个实例 (句子) 的语句级别选择性注意力机制**, 它能**充分利用每个实体对的所有实例 (句子) 的信息**.

>1. The attention-based models have attracted a lot of interests of researchers recently.
>
>2. **The selectivity of attention-based models** allows them to **learn alignments between different modalities**.
>
>It has been applied to various areas:
>  
>1. image classification (Mnih et al., 2014)
>
>2. speech recognition (Chorowski et al., 2014)
>
>3. image caption generation (Xu et al., 2015)
>
>4. machine translation (Bahdanau et al., 2014).
>
>To the best of our knowledge, this is **the first effort to adopt attention-based model in distant supervised relation extraction**.

### 方法

给定一个句子集合 **$\{x_1,x_2,\cdot\cdot\cdot,x_n\}$** 和**两个相对应的实体 (头实体和尾实体)**, 本论文的模型预测**每个关系** $r$ 成立的概率.

**模型包含两个部分:**

- **语句编码器** (Sentence Encoder). 给定一个句子 $x$ 和两个目标实体 (头实体和尾实体), 使用一个卷积神经网络 (CNN) 来**提取句子的向量表示 $x$**. (原始句子和句子的向量都用 **$x$** 表示)

- **选择性注意力机制** (Selective Attention over Instances). 当获取到**所有实例 (句子) 的向量表示**后, 本论文的模型使用**语句级别的选择性注意力机制**来选择**那些能够真正表达对应关系**的语句, 并赋予其更高的权重.

#### 语句编码器

如下图所示, **CNN** 将句子 $x$ 转换为它的向量表示 **$x$**. 首先, **句子中的单词**被转换成**稠密实值特征向量** (词嵌入, 实值: **C/C++** 中的 **float** 类型, **32** 位). 然后, **卷积层**, **Max 池化层** 和 **非线性激活函数** 被用来提取**句子的向量表示 $x$**.

![](https://cos.luyf-lemon-love.space/images/20221019200710.png)

##### 输入表示

**CNN** 的输入是句子 $x$ 的**原始单词**. 首先将**单词**转换成**低维向量**. 本论文的模型通过**词嵌入矩阵**将**输入的每一个单词**转换成一个**向量**. 此外, 为了**指定每个实体对的位置**, 为句子中的**每个单词**使用了**位置嵌入**.

**词嵌入** (**Word Embeddings**). **词嵌入**旨在将**离散字符形式的单词**转换为**连续向量空间中分布式表示**, 从而**捕捉到单词句法和所对应的语义信息**. 给定一个包含 $m$ 个单词的句子 $x = \{w_1,w_2,\cdot\cdot\cdot,w_m\}$, 每一个单词 $w_i$ 都用一个**实值向量**表示. **单词的表示**用一个**词嵌入矩阵** **$V \in \mathbb{R}^{d^a\times\mid V\mid}$** 的**列向量**来编码, 其中 **$V$** 是一个**固定大小的词汇表** (单词的总数固定).

**位置嵌入** (**Position Embeddings**). 在关系抽取的任务中, **靠近目标实体的单词**通常具有**决定目标实体间关系的信息**. 类似于 (Zeng et al., 2014)[<sup>6</sup>](#6) 的处理方法, **由实体对指定的位置嵌入**帮助 **CNN** 观察**每一单词**相对**头实体**或**尾实体**的**相对距离**, **位置嵌入被定义为当前词相对头实体或尾实体的相对距离的组合**. 例如, **“Bill_Gates is the founder of Microsoft.”**, **单词 “founder” 到头实体 “Bill_Gates” 的相对距离是 3**, **到尾实体 “Microsoft” 的相对距离是 2**.

上图中, 假定**词嵌入的维度** $d^a$ 是 *3*, **位置嵌入的维度** $d^b$ 是 *1*. 最后, 将**所有单词的词嵌入和位置嵌入**拼接 (**concatenate**) 起来, 表示成一个**向量序列** $w = \{w_1,w_2,\cdot\cdot\cdot,w_m\}$, 其中 $w_i \in \mathbb{R}^d$ ($d = d^a + d^b \times 2$).

##### 卷积层, Max 池化层 和 非线性激活函数

在关系抽取中, 主要的**挑战**是:

1. **句子的长度是可变的**.

2. **重要信息可能出现在句子的任何位置**.

因此, 应该**利用所有的局部特征**, 并在**全局范围上进行关系预测**. 可以使用一个**卷积层**来**融合所有局部特征**.

**卷积层**首先使用一个在句子上滑动的长度为 $l$ 的窗口**提取局部特征** (**一维卷积**), 上图中, 假定**滑动窗口的长度**是 *3*. 然后, 通过一个 **Max 池化层**合并**所有的局部特征**, 进而为**每一个输入的句子**得到**一个固定大小的向量**.

**卷积**被定义为**一个向量序列** $w$ 和**一个卷积矩阵** $W \in \mathbb{R}^{d^c \times (l \times d)}$ 间的操作, 其中 $d^c$ 是**句子嵌入的维度**. 向量 $q_i \in \mathbb{R}^{l \times d}$ 是第 $i$ 个窗口中的**词嵌入 $w$ 序列**的**拼接**.

$$
q_i = w_{i - l + 1 : i}\quad\quad(1 \leq i \leq m + l - 1). \tag{1}
$$

当窗口**在边界附近滑动**时, 它可能**在句子边界之外**, 因此, 为**句子**设置了**特殊的填充标记**. 意味着将**所有超出范围的输入向量** $w_i(i < 1\quad or\quad i > m)$ 视为**零向量**.

卷积层的第 $i$ 个卷积输出为:

$$
p_i = [Wq + b]_i \tag{2}
$$

其中 $b$ 是偏置向量. **句子向量** $x \in \mathbb{R}^{d^c}$ 的第 $i$ 个元素:

$$
[x]_i = max(p_i), \tag{3}
$$

其中 $[x]_i$ 中的 $i$ 是**句子向量** $x \in \mathbb{R}^{d^c}$ 的第 $i$ 个元素, $p_i$ 中的 $i$ 是第 $i$ 窗口.

进一步, PCNN (Zeng et al., 2015)[<sup>4</sup>](#4), 是一个 **CNN** 的变体, 采用了分段 Max 池化操作来进行关系抽取, 每一个卷积输出 $p_i$ 被头实体和尾实体划分成三个片段 $p_{i1},p_{i2},p_{i3})$. **最大池化过程**分别在三个片段中执行. 定义如下:

$$
[x]_{ij} = max(p_{ij}), \tag{4}
$$

句子向量 $[x]_i$ 是三部分池化结果 $[x]_{ij}$ 的拼接 (concatenation).

最后, 是一个**非线性激活函数**, 如**双曲切线函数** (**the hyperbolic tangent**).

**双曲正切函数**（$tanh$）是**双曲正弦函数**（$sinh$）与**双曲余弦函数**（$cosh$）的比值，其解析形式为：

$$
tanh x = \frac{sinh x}{cosh x} = \frac{e^x - e^{-x}}{e^x + e^{-x}}
$$

**导数**

$$
(tanh x)^{'} = sech^2x = \frac{1}{cosh^2x} = 1 - tanh^2x
$$

**图像**

![](https://cos.luyf-lemon-love.space/images/20221007184613.png)

##### 面向多实例的选择性注意力机制

假设有一个包含 $n$ 个句子的集合 $S = \{x_1,x_2,\cdot\cdot\cdot,x_n\}$, 每一个句子都包含**实体对** $(head,tail)$.

为了**利用所有句子的信息**, 本论文的模型在预测关系 $r$ 时, 用**实值向量** $s$ 表示集合 $S$. 很容易想到, 集合 $S$ 的表示取决于所有句子的表示 $x_1,x_2,\cdot\cdot\cdot,x_n$. 每个句子表示 **$x_i$** 包含对于输入句子 $x_i$ 其中实体对 $(head,tail)$ 是否包含关系 $r$ 的信息.

集合向量 $s$ 被计算为这些句子向量 $x_i$ 的加权和:

$$
s = \sum_i a_ix_i, \tag{5}
$$

其中 $a_i$ 是每一个句子向量 $x_i$ 的权重.

本论文中, $a_i$ 有两种方式的定义:

**Average:** 假定所有的句子对于 $s$ 有相同的贡献, 所以集合 $S$ 的嵌入向量 $s$ 是所有句子向量的平均值:

$$
s = \sum_i \frac{1}{n}x_i, \tag{6}
$$

这是选择性注意力机制**最朴素的基线**.

**Selective Attention:** 远程监督不可避免的带来**错误标注**的问题, 因此, 如果简单将每个句子视为**等价的**, 错误标注的句子将在训练和测试过程中带来**大量的噪声**. 因此, 本论文的模型使用选择性注意力机制降噪 (**de-emphasize the noisy sentence**). $a_i$ 进一步被定义为:

$$
a_i = \frac{exp(e_i)}{\sum_kexp(e_k)} \tag{7}
$$

其中, $e_i$ 被称为**基于查询 (query-based) 的函数**, 它**对输入句子 $x_i$ 和预测关系 $r$ 的匹配程度进行评分**. 本论文的模型选择在不同替代方案中**实现最佳性能的双线性形式** (the bilinear form):

$$
e_i = x_iAr, \tag{8}
$$

其中, **$A$** 是一个**加权对角矩阵** (a weighted diagonal matrix), **$r$ 是与关系 $r$ 相关联的查询向量**, 它指示了关系 $r$ 的表示.

最终, 通过一个 **softmax** 层定义了**条件概率** $p(r\mid S, θ)$:

$$
p(r\mid S, θ) = \frac{exp(o_r)}{\sum_{k=1}^{n_r} exp(o_k)}, \tag{9}
$$

其中, $n_r$ 是**关系的总数**, $o$ 是神经网络的**最终输出**, 它表示对**所有关系类型**的**预测评分**, 被定义为:

$$
o = Ms + d. \tag{10}
$$

其中 $d \in \mathbb{R}^{n_r}$ 是一个**偏置向量**, $M$ 是**所有关系类型的表示矩阵** (即**所有关系类型对应的特征向量**所构成的**矩阵**).

>(Zeng et al., 2015)[<sup>4</sup>](#4)follows the assumption that **at least one mention of the entity pair will reflect their relation**, and **only uses the sentence with the highest probability in each set for training**. Hence, the method which they adopted for multi-instance learning can be regarded as **a special case as our selective attention** when **the weight of the sentence with the highest probability is set to 1 and others to 0**.

##### 优化和实现细节

**目标函数**. **交叉熵误差** (cross entropy error), 定义如下:

$$
J(θ) = \sum_{i=1}^{s} log p(r_i \mid S_i, θ), \tag{11}
$$

其中, $s$ 是句子的个数, $θ$ 是模型的全部参数, $r_i$ 中的 $i$ 是第 $i$ 个关系, $S_i$ 中的 $i$ 是第 $i$ 个句子. 优化方法是**随机梯度下降** (stochastic gradient descent, **SGD**). 从训练集中**随机选择一个小批次** (mini-batch) 迭代训练直到模型收敛.

在最终的输出层使用 **dropout** (Srivastava et al., 2014)[<sup>7</sup>](#7) 预防**过拟合**. **dropout** 被定义为与一个向量 $h$ 的**对应元素的乘法** (**element-wise multiplication**), 该向量的元素是概率为 $p$ 的伯努利随机变量 (**Bernoulli random variables**), 因此公式 $(10)$ 被重写为:

$$
o = M(s \circ h) + d. \tag{12}
$$

在测试阶段, 学习到的集合表示被 $p$ 缩放, 即 $\hat{s_i} = ps_i$. 缩放过的集合向量 $\hat{o_i}$ 最终被用于预测关系.

### 实验

>Our experiments are intended to demonstrate that **our neural models with sentence-level selective attention can alleviate the wrong labelling problem** and **take full advantage of informative sentences for distant supervised relation extraction**.

#### 数据集和评测指标

在关系抽取任务中, (Riedel et al., 2010)[<sup>8</sup>](#8) 开发的数据集被全世界研究者广泛应用. 该数据集是通过将 **Freebase** 知识图谱中的世界知识与 **<<纽约时报>>** 语料库 (NYT) 中的语料进行对齐而生成的 (This dataset was generated by aligning Freebase relations with the New York Times corpus (NYT)). 实体是使用**斯坦福大学命名实体标记器**找到的, 并进一步与 **Freebase** 实体名称相匹配 (Entity mentions are found using the Stanford named entity tagger (Finkel et al., 2005), and are further matched to the names of Freebase entities). 数据集包含两部分: **训练集**和**测试集**. 对齐了 **2005-2006** 年语料库中的句子, 并将它们视为**训练实例**. **测试实例**是 **2007** 年的对齐句子. 整个数据集合包含 **53** 种关系类型, 包含一种特殊类型关系 —— **NA**, 其表示头尾实体之间没有明确定义关系.

||**number of sentences**|**number of entity pairs**|**number of relational facts (not NA)**|**number of sentences / number of  entity pairs**|
|:-:|:-:|:-:|:-:|:-:|
|**training set**|522,611|281,270|18,252|1.86|
|**testing set**|172,448|96,678|1,950|1.78|

通过比较模型在测试集中挖掘出的世界知识与 **Freebase** 中的世界知识的重合度来评估关系抽取效果.

>we evaluate our model in **the held-out evaluation**. It evaluates our model by comparing **the relation facts discovered from the test articles** with **those in Freebase**.
>
> **It assumes that the testing systems have similar performances in relation facts inside and outside Freebase.**
> 
>Hence, the held-out evaluation **provides an approximate measure of precision without time consumed human evaluation**.

具体的模型性能则通过**精度——召回率曲线 (the aggregate curves precision/recall curves)**和**最高置信度预测精度** (**Precision@N, P@N**) 来体现.

#### 实验设置

##### 词嵌入

#### 选择性注意力机制的有效性验证

#### 实例数量的影响分析

#### 与基于人工特征工程的方法的性能比较


**WN 的最佳参数**: 嵌入维度 **$k = 20$**, 学习率 **$\lambda = 0.01$**, **margin $\gamma = 2$**, 能量函数 **$d = L_1$**.

**FB15K 的最佳参数**: 嵌入维度 **$k = 50$**, 学习率 **$\lambda = 0.01$**, **margin $\gamma = 1$**, 能量函数 **$d = L_1$**.

**FB1M 的最佳参数**: 嵌入维度 **$k = 50$**, 学习率 **$\lambda = 0.01$**, **margin $\gamma = 1$**, 能量函数 **$d = L_2$**.

对于所有数据集, 最多训练 `1000 epochs`, 可以参考验证集上的平均排名 (raw) 使用提前停止获得最佳模型.

#### 链接预测

As expected, the `filtered` setting provides `lower mean ranks` and `higher` *hits@10*, which we believe are `a clearer evaluation of the performance of the methods in link prediction`.


### Conclusion and future work

**TransE** 应用一共有三个: **知识图谱补全** (Link prediction), 知识表示, 嵌入到关系抽取模型中.


## 代码实现

### 文件

**代码仓库地址**: https://github.com/LuYF-Lemon-love/susu-knowledge-graph/tree/main/knowledge-representation-learning/C%2B%2B .

```shell
$ tree
.
├── data
│   └── FB15K
│       ├── entity2id.txt
│       ├── relation2id.txt
│       ├── test2id.txt
│       ├── train2id.txt
│       └── valid2id.txt
├── papers
│   └── TransE.pdf
├── README.md
└── TransE
    ├── clean.sh
    ├── data_preprocessing.py
    ├── run.sh
    ├── test_transE.cpp
    └── transE.cpp

4 directories, 12 files
```

### 数据

#### [FB15K](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/tree/main/knowledge-representation-learning/C%2B%2B/data/FB15K/)

该数据集是 `Wikilinks database` 的实体子集, 该子集中的实体和关系在 `Freebase` 至少出现了 `100` 次. 并且移除了像 `’!/people/person/nationality’` 这样的关系, 因为它是关系 `’/people/person/nationality’` `head` 和 `tail` 的颠倒. 一共 `592,213` 个三元组, `14,951` 个实体, `1,345` 个关系, 被随机地分成了训练集 (`483,142` 个), 验证集 (`50,000` 个), 测试集 (`59,071` 个).

- [entity2id.txt](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/tree/main/knowledge-representation-learning/C%2B%2B/data/FB15K/entity2id.txt): 第一行是实体个数. 其余行是实体名和对应的实体 ID, 每行一个.

- [relation2id.txt](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/tree/main/knowledge-representation-learning/C%2B%2B/data/FB15K/relation2id.txt): 第一行是关系个数. 其余行是关系名和对应的关系 ID, 每行一个.

- [train2id.txt](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/tree/main/knowledge-representation-learning/C%2B%2B/data/FB15K/train2id.txt): 训练文件. 第一行是训练集三元组的个数. 其余行是 (e1, e2, rel) 格式的三元组, 每行一个. e1, e2 是实体 ID, rel 是关系 ID.

- [valid2id.txt](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/tree/main/knowledge-representation-learning/C%2B%2B/data/FB15K/valid2id.txt): 验证文件. 第一行是验证集三元组的个数. 其余行是 (e1, e2, rel) 格式的三元组, 每行一个. e1, e2 是实体 ID, rel 是关系 ID.

- [test2id.txt](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/tree/main/knowledge-representation-learning/C%2B%2B/data/FB15K/test2id.txt): 测试文件. 第一行是测试集三元组的个数. 其余行是 (e1, e2, rel) 格式的三元组, 每行一个. e1, e2 是实体 ID, rel 是关系 ID.

```shell
$ tree
.
├── entity2id.txt
├── relation2id.txt
├── test2id.txt
├── train2id.txt
└── valid2id.txt

0 directories, 5 files
$ head entity2id.txt 
14951
/m/027rn	0
/m/06cx9	1
/m/017dcd	2
/m/06v8s0	3
/m/07s9rl0	4
/m/0170z3	5
/m/01sl1q	6
/m/044mz_	7
/m/0cnk2q	8
$ head relation2id.txt 
1345
/location/country/form_of_government	0
/tv/tv_program/regular_cast./tv/regular_tv_appearance/actor	1
/media_common/netflix_genre/titles	2
/award/award_winner/awards_won./award/award_honor/award_winner	3
/soccer/football_team/current_roster./sports/sports_team_roster/position	4
/sports/sports_position/players./soccer/football_roster_position/team	5
/government/political_district/representatives./government/government_position_held/legislative_sessions	6
/film/film/starring./film/performance/actor	7
/soccer/football_team/current_roster./soccer/football_roster_position/position	8
$ head test2id.txt 
59071
453 1347 37
3136 4357 588
8663 4522 307
2404 8386 186
722 806 37
1248 10937 26
9182 1043 20
706 14564 28
706 14004 28
$ head train2id.txt 
483142
0 1 0
2 3 1
4 5 2
6 7 3
8 9 4
10 11 5
12 13 6
14 15 7
16 17 8
$ head valid2id.txt 
50000
5167 1427 52
239 2379 326
837 9339 3
7674 4431 272
4528 8708 155
71 5412 32
5041 5979 26
11273 3632 390
10994 36 168
```

### [TransE](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/tree/main/knowledge-representation-learning/C%2B%2B/TransE)

- [data_preprocessing.py](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/tree/main/knowledge-representation-learning/C%2B%2B/TransE/data_preprocessing.py): 该 `Python` 脚本用于创建下面这些临时数据文件.

```shell
../data/FB15K/1-1.txt
../data/FB15K/1-n.txt
../data/FB15K/n-1.txt
../data/FB15K/n-n.txt
../data/FB15K/test2id_all.txt
../data/FB15K/type_constrain.txt
```

- [transE.cpp](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/tree/main/knowledge-representation-learning/C%2B%2B/TransE/transE.cpp): 该 `C++` 文件用于模型训练.

- [test_transE.cpp](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/tree/main/knowledge-representation-learning/C%2B%2B/TransE/test_transE.cpp): 该 `C++` 文件用于模型测试.

- [run.sh](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/tree/main/knowledge-representation-learning/C%2B%2B/TransE/run.sh): 该 `Shell` 脚本用于模型训练和模型测试.

- [clean.sh](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/tree/main/knowledge-representation-learning/C%2B%2B/TransE/clean.sh): 该 `Shell` 脚本用于清理临时文件.

```shell
$ tree
.
├── clean.sh
├── data_preprocessing.py
├── run.sh
├── test_transE.cpp
└── transE.cpp

0 directories, 5 files
```

#### [data_preprocessing.py](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/blob/main/knowledge-representation-learning/C%2B%2B/TransE/data_preprocessing.py)

```python
# data_preprocessing.py
# 使用方法: $ python3 data_preprocessing.py
# created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>
#
# 该 Python 脚本用于创建下面这些临时数据文件
# ../data/FB15K/1-1.txt ../data/FB15K/1-n.txt ../data/FB15K/n-1.txt ../data/FB15K/n-n.txt ../data/FB15K/test2id_all.txt ../data/FB15K/type_constrain.txt
#
# prerequisites: 
#     train2id.txt, valid2id.txt, test2id.txt

print("\n##################################################")
print("\n数据预处理开始...")

##################################################
# 从 train2id.txt, valid2id.txt、test2id.txt 读取三元组
##################################################

# lef 和 rig 类型为 {[]}, 外层是 <class 'dict'>, 内层是 <class 'list'>
# lef 外层的 key 为三元组 (训练集、验证集、测试集) (h, r)
# lef 外层的 value 为 (h, r) 对应的 t 的 list
# rig 外层的 key 为三元组 (训练集、验证集、测试集) (r, t)
# rig 外层的 value 为 (r, t) 对应的 h 的 list  
lef = {}
rig = {}

# rel_lef 和 rel_rig 类型为 {{}}, 外层是 <class 'dict'>, 内层是 <class 'dict'>
# rel_lef 外层的 key 为三元组 (训练集、验证集、测试集) r
# rel_lef 内层的 key 为 r 对应的 h, 内层的 value 为 1
# rel_rig 外层的 key 为三元组 (训练集、验证集、测试集) r
# rel_rig 内层的 key 为 r 对应的 t, 内层的 value 为 1
rel_lef = {}
rel_rig = {}

train_list = open("../data/FB15K/train2id.txt", "r")
valid_list = open("../data/FB15K/valid2id.txt", "r")
test_list = open("../data/FB15K/test2id.txt", "r")

tot = (int)(train_list.readline())
for i in range(tot):

	content = train_list.readline()
	h, t, r = content.strip().split()

	if not (h, r) in lef:
		lef[(h, r)] = []
	if not (r,t) in rig:
		rig[(r, t)] = []
	lef[(h, r)].append(t)
	rig[(r, t)].append(h)
	
	if not r in rel_lef:
		rel_lef[r] = {}
	if not r in rel_rig:
		rel_rig[r] = {}
	rel_lef[r][h] = 1
	rel_rig[r][t] = 1

tot = (int)(valid_list.readline())
for i in range(tot):

	content = valid_list.readline()
	h,t,r = content.strip().split()

	if not (h,r) in lef:
		lef[(h,r)] = []
	if not (r,t) in rig:
		rig[(r,t)] = []
	lef[(h,r)].append(t)
	rig[(r,t)].append(h)

	if not r in rel_lef:
		rel_lef[r] = {}
	if not r in rel_rig:
		rel_rig[r] = {}
	rel_lef[r][h] = 1
	rel_rig[r][t] = 1

tot = (int)(test_list.readline())
for i in range(tot):

	content = test_list.readline()
	h,t,r = content.strip().split()

	if not (h,r) in lef:
		lef[(h,r)] = []
	if not (r,t) in rig:
		rig[(r,t)] = []
	lef[(h,r)].append(t)
	rig[(r,t)].append(h)

	if not r in rel_lef:
		rel_lef[r] = {}
	if not r in rel_rig:
		rel_rig[r] = {}
	rel_lef[r][h] = 1
	rel_rig[r][t] = 1

test_list.close()
valid_list.close()
train_list.close()

##################################################
# 创建 type_constrain.txt
# type_constrain.txt: 类型约束文件, 第一行是关系的个数
# 下面的行是每个关系的类型限制 (训练集、验证集、测试集中每个关系存在的 head 和 tail 的类型)
# 每个关系有两行：
# 第一行：`id of relation` `Number of head types` `head1` `head2` ...
# 第二行: `id of relation` `number of tail types` `tail1` `tail2` ...
#
# For example, the relation with id 1200 has 4 types of head entities, which are 3123, 1034, 58 and 5733
# The relation with id 1200 has 4 types of tail entities, which are 12123, 4388, 11087 and 11088
# 1200	4	3123	1034	58	5733
# 1200	4	12123	4388	11087	11088
##################################################

f = open("../data/FB15K/type_constrain.txt", "w")
f.write("%d\n"%(len(rel_lef)))
for i in rel_lef:
	f.write("%s\t%d"%(i, len(rel_lef[i])))
	for j in rel_lef[i]:
		f.write("\t%s"%(j))
	f.write("\n")
	f.write("%s\t%d"%(i, len(rel_rig[i])))
	for j in rel_rig[i]:
		f.write("\t%s"%(j))
	f.write("\n")
f.close()
print("\n../data/FB15K/type_constrain.txt 创建成功.")


##################################################
# 创建 1-1.txt、1-n.txt、n-1.txt、n-n.txt、test2id_all.txt
##################################################

# rel_lef, tot_lef, rel_rig, tot_rig 类型为 <class 'dict'>
# rel_lef 的 key 为 r, value 为相应 (关系为 r) 三元组 (训练集、验证集、测试集) tail 的个数
# tot_lef 的 key 为 r, value 为相应 (关系为 r) 三元组 (训练集、验证集、测试集) head 的种类数
# rel_rig 的 key 为 r, value 为相应 (关系为 r) 三元组 (训练集、验证集、测试集) head 的个数
# tot_rig 的 key 为 r, value 为相应 (关系为 r) 三元组 (训练集、验证集、测试集) tail 的种类数
rel_lef = {}
tot_lef = {}
rel_rig = {}
tot_rig = {}

for i in lef:
	if not i[1] in rel_lef:
		rel_lef[i[1]] = 0
		tot_lef[i[1]] = 0
	rel_lef[i[1]] += len(lef[i])
	tot_lef[i[1]] += 1.0

for i in rig:
	if not i[0] in rel_rig:
		rel_rig[i[0]] = 0
		tot_rig[i[0]] = 0
	rel_rig[i[0]] += len(rig[i])
	tot_rig[i[0]] += 1.0

# 统计测试集中各种三元组 (关系: 1-1, 1-n, n-1, n-n) 的数量
# s11: 1-1
# s1n: 1-n
# sn1: n-1
# snn: n-n
s11 = 0
s1n = 0
sn1 = 0
snn = 0

f = open("../data/FB15K/test2id.txt", "r")
tot = (int)(f.readline())

for i in range(tot):

	content = f.readline()
	h, t, r = content.strip().split()

	rign = rel_lef[r] / tot_lef[r]
	lefn = rel_rig[r] / tot_rig[r]

	if (rign <= 1.5 and lefn <= 1.5):
		s11 += 1
	if (rign > 1.5 and lefn <= 1.5):
		s1n += 1
	if (rign <= 1.5 and lefn > 1.5):
		sn1 += 1
	if (rign > 1.5 and lefn > 1.5):
		snn += 1

f.close()

# 创建 1-1.txt、1-n.txt、n-1.txt、n-n.txt、test2id_all.txt
# 1-1.txt: 第一行是测试集中关系为 1-1 的三元组的个数，其余行为 (e1, e2, rel) 格式的三元组
# 1-n.txt: 第一行是测试集中关系为 1-n 的三元组的个数，其余行为 (e1, e2, rel) 格式的三元组
# n-1.txt: 第一行是测试集中关系为 n-1 的三元组的个数，其余行为 (e1, e2, rel) 格式的三元组
# n-n.txt: 第一行是测试集中关系为 n-n 的三元组的个数，其余行为 (e1, e2, rel) 格式的三元组
# test2id_all.txt:
#     第一行是测试集中三元组的个数
#     其余行为 `label` `(e1, e2, rel)`
#     label:
#         0: 1-1, 1: 1-n, 2: n-1, 3: n-n
f = open("../data/FB15K/test2id.txt", "r")
f11 = open("../data/FB15K/1-1.txt", "w")
f1n = open("../data/FB15K/1-n.txt", "w")
fn1 = open("../data/FB15K/n-1.txt", "w")
fnn = open("../data/FB15K/n-n.txt", "w")
fall = open("../data/FB15K/test2id_all.txt", "w")

tot = (int)(f.readline())
fall.write("%d\n"%(tot))
f11.write("%d\n"%(s11))
f1n.write("%d\n"%(s1n))
fn1.write("%d\n"%(sn1))
fnn.write("%d\n"%(snn))

for i in range(tot):

	content = f.readline()
	h, t, r = content.strip().split()

	rign = rel_lef[r] / tot_lef[r]
	lefn = rel_rig[r] / tot_rig[r]

	if (rign <= 1.5 and lefn <= 1.5):
		f11.write(content)
		fall.write("0"+"\t"+content)
	if (rign > 1.5 and lefn <= 1.5):
		f1n.write(content)
		fall.write("1"+"\t"+content)
	if (rign <= 1.5 and lefn > 1.5):
		fn1.write(content)
		fall.write("2"+"\t"+content)
	if (rign > 1.5 and lefn > 1.5):
		fnn.write(content)
		fall.write("3"+"\t"+content)

fall.close()
f.close()
f11.close()
f1n.close()
fn1.close()
fnn.close()
print("\n../data/FB15K/1-1.txt ../data/FB15K/1-n.txt ../data/FB15K/n-1.txt ../data/FB15K/n-n.txt ../data/FB15K/test2id_all.txt 创建成功.")
print("\n数据预处理结束.\n")
```

#### [transE.cpp](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/blob/main/knowledge-representation-learning/C%2B%2B/TransE/transE.cpp)

```c++
// transE.cpp
// 使用方法:
//     编译:
//           $ g++ transE.cpp -o ./build/transE -pthread -O3 -march=native
//     运行:
//           $ ./build/transE
//           
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>
//
// 该 C++ 文件用于模型训练
//
// prerequisites:
//     relation2id.txt, entity2id.txt, train2id.txt
//
// 加载 Pretrained Embeddings (可选)
// prerequisites: 
//     entity2vec + note + .bin
//     relation2vec + note + .bin
//     
//     or
//
//     entity2vec + note + .vec
//     relation2vec + note + .vec
//
// 输出实体嵌入和关系嵌入
// output: 
//     entity2vec + note + .bin
//     relation2vec + note + .bin
//     
//     or
//
//     entity2vec + note + .vec
//     relation2vec + note + .vec

// ##################################################
// 包含标准库
// ##################################################

#include <cstdio>           // FILE, fscanf, fwrite, fopen, fclose
#include <cstdlib>          // malloc, calloc, free, atoi, atof, rand, RAND_MAX
#include <cmath>            // exp, fabs
#include <cstring>          // memcpy, strcmp
#include <fcntl.h>          // open, close, O_RDONLY
#include <unistd.h>         // stat
#include <sys/stat.h>       // stat
#include <sys/mman.h>       // mmap, munmap
#include <sys/time.h>       // timeval, gettimeofday
#include <pthread.h>        // pthread_create, pthread_exit, pthread_join
#include <string>           // std::string, std::string::c_str
#include <algorithm>        // std::sort

// ##################################################
// 声明和定义变量
// ##################################################

#define REAL float
#define INT int

const REAL pi = 3.141592653589793238462643383;

INT bern_flag = 1;
INT load_binary_flag = 0;
INT out_binary_flag = 0;
INT dimension = 50;
REAL alpha = 0.01;
REAL margin = 1.0;
INT nbatches = 1;
INT epochs = 1000;
INT threads = 32;

std::string in_path = "../data/FB15K/";
std::string out_path = "./build/";
std::string load_path = "";
std::string note = "";

// 三元组: (head, label, tail)
// h: head
// r: label or relationship
// t: tail
// a relationship of name label between the entities head and tail
struct Triple {
	INT h, r, t;
};

// 为 std::sort() 定义比较仿函数
// 以三元组的 head 进行比较
struct cmp_head {
	bool operator()(const Triple &a, const Triple &b) {
		return (a.h < b.h)||(a.h == b.h && a.r < b.r)
			||(a.h == b.h && a.r == b.r && a.t < b.t);
	}
};

// 为 std::sort() 定义比较仿函数
// 以三元组的 tail 进行比较
struct cmp_tail {
	bool operator()(const Triple &a, const Triple &b) {
		return (a.t < b.t)||(a.t == b.t && a.r < b.r)
			||(a.t == b.t && a.r == b.r && a.h < b.h);
	}
};

// ##################################################
// 一些用于程序初始化的数学函数
// ##################################################

// 为每一个线程保存独立的随机种子
unsigned long long *next_random;

// 更新第 id[0, threads) 线程的随机种子
unsigned long long randd(INT id) {
	next_random[id] = next_random[id] 
		* (unsigned long long)25214903917 + 11;
	return next_random[id];
}

// 为第 id[0, threads) 线程返回取值为 [0, x) 的伪随机数
INT rand_max(INT id, INT x) {
	INT res = randd(id) % x;
	while (res < 0)
		res += x;
	return res;
}

// 返回取值为 [min, max) 的伪随机数 
REAL rand(REAL min, REAL max) {
	return min + (max - min) * rand() / (RAND_MAX + 1.0);
}

// 正态分布函数，X ~ N (miu, sigma)
REAL normal(REAL x, REAL miu, REAL sigma) {
	return 1.0 / sqrt(2 * pi) / sigma
		* exp(-1 * (x-miu) * (x-miu) / (2 * sigma * sigma));
}

// 从正态（高斯）分布中抽取随机样本，取值为 [min, max) 的伪随机数
REAL randn(REAL miu, REAL sigma, REAL min, REAL max) {
	REAL x, y, d_scope;
	do {
		x = rand(min, max);
		y = normal(x, miu, sigma);
		d_scope = rand(0.0, normal(miu, miu, sigma));
	} while (d_scope > y);
	return x;
}

// 最大范数正则化函数: 如果输入向量的 L2 范数 > 1, 将输入向量的压缩, 使的其 L2 范数 = 1
// 可以参考: https://tensorflow.google.cn/api_docs/python/tf/keras/constraints/MaxNorm
/*
@keras_export("keras.constraints.MaxNorm", "keras.constraints.max_norm")
class MaxNorm(Constraint):
    """MaxNorm weight constraint.
    Constrains the weights incident to each hidden unit
    to have a norm less than or equal to a desired value.
    Also available via the shortcut function `tf.keras.constraints.max_norm`.
    Args:
      max_value: the maximum norm value for the incoming weights.
      axis: integer, axis along which to calculate weight norms.
        For instance, in a `Dense` layer the weight matrix
        has shape `(input_dim, output_dim)`,
        set `axis` to `0` to constrain each weight vector
        of length `(input_dim,)`.
        In a `Conv2D` layer with `data_format="channels_last"`,
        the weight tensor has shape
        `(rows, cols, input_depth, output_depth)`,
        set `axis` to `[0, 1, 2]`
        to constrain the weights of each filter tensor of size
        `(rows, cols, input_depth)`.
    """

    def __init__(self, max_value=2, axis=0):
        self.max_value = max_value
        self.axis = axis

    @doc_controls.do_not_generate_docs
    def __call__(self, w):
        norms = backend.sqrt(
            tf.reduce_sum(tf.square(w), axis=self.axis, keepdims=True)
        )
        desired = backend.clip(norms, 0, self.max_value)
        return w * (desired / (backend.epsilon() + norms))

    @doc_controls.do_not_generate_docs
    def get_config(self):
        return {"max_value": self.max_value, "axis": self.axis}
*/
void norm(REAL * vec) {
	REAL x = 0;
	for (INT i = 0; i < dimension; i++)
		x += (*(vec + i)) * (*(vec + i));
	x = sqrt(x);
	if (x > 1)
		for (INT i = 0; i < dimension; i++)
			*(vec + i) /= x;
}

// ##################################################
// 从 train2id.txt 中读取三元组
// prerequisites: 
//     relation2id.txt, entity2id.txt, train2id.txt
// ##################################################

// relation_total: 关系总数
// entity_total: 实体总数
// train_triple_total: 训练集中的三元组总数
INT relation_total, entity_total, train_triple_total;

// relation_vec (relation_total * dimension): 关系嵌入矩阵
// entity_vec (entity_total * dimension): 实体嵌入矩阵
REAL *relation_vec, *entity_vec;

// train_head (train_triple_total): 训练集中的三元组集合，以 head 排序
// train_tail (train_triple_total): 训练集中的三元组集合，以 tail 排序
// train_list (train_triple_total): 训练集中的三元组集合，未排序
Triple *train_head, *train_tail, *train_list;

// left_head (entity_total): 存储每种实体 (head) 在 train_head 中第一次出现的位置
// right_head (entity_total): 存储每种实体 (head) 在 train_head 中最后一次出现的位置
// left_tail (entity_total): 存储每种实体 (tail) 在 train_tail 中第一次出现的位置
// right_tail (entity_total): 存储每种实体 (tail) 在 train_tail 中最后一次出现的位置
INT *left_head, *right_head;
INT *left_tail, *right_tail;

// left_mean (relation_total): 记录每种关系 head 的种类数
// right_mean (relation_total): 记录每种关系 tail 的种类数
REAL *left_mean, *right_mean;

void init() {

	FILE *fin;
	INT tmp;

	// 初始化 relation_vec
	fin = fopen((in_path + "relation2id.txt").c_str(), "r");
	tmp = fscanf(fin, "%d", &relation_total);
	fclose(fin);
	printf("relation_total: %d\n", relation_total);

	relation_vec = (REAL *)calloc(relation_total * dimension,
			sizeof(REAL));
	for (INT i = 0; i < relation_total; i++) {
		for (INT ii = 0; ii < dimension; ii++)
			relation_vec[i * dimension + ii] =
				randn(0, 1.0 / dimension, -6 / sqrt(dimension),
					6 / sqrt(dimension));
	}

	// 初始化 entity_vec
	fin = fopen((in_path + "entity2id.txt").c_str(), "r");
	tmp = fscanf(fin, "%d", &entity_total);
	fclose(fin);
	printf("entity_total: %d\n", entity_total);

	entity_vec = (REAL *)calloc(entity_total * dimension,
			sizeof(REAL));
	for (INT i = 0; i < entity_total; i++) {
		for (INT ii = 0; ii < dimension; ii++)
			entity_vec[i * dimension + ii] =
				randn(0, 1.0 / dimension, -6 / sqrt(dimension),
					6 / sqrt(dimension));
	}

	// 读取训练集中的三元组
	fin = fopen((in_path + "train2id.txt").c_str(), "r");
	tmp = fscanf(fin, "%d", &train_triple_total);
	train_head = (Triple *)calloc(train_triple_total, sizeof(Triple));
	train_tail = (Triple *)calloc(train_triple_total, sizeof(Triple));
	train_list = (Triple *)calloc(train_triple_total, sizeof(Triple));
	for (INT i = 0; i < train_triple_total; i++) {
		tmp = fscanf(fin, "%d", &train_list[i].h);
		tmp = fscanf(fin, "%d", &train_list[i].t);
		tmp = fscanf(fin, "%d", &train_list[i].r);
		train_head[i] = train_list[i];
		train_tail[i] = train_list[i];
	}
	fclose(fin);
	printf("train_triple_total: %d\n\n", train_triple_total);

	// train_head 和 train_tail 分别以 head 和 tail 排序
	std::sort(train_head, train_head + train_triple_total, cmp_head());
	std::sort(train_tail, train_tail + train_triple_total, cmp_tail());

	// 获得 left_head, right_head, left_tail, right_tail
	left_head = (INT *)calloc(entity_total, sizeof(INT));
	right_head = (INT *)calloc(entity_total, sizeof(INT));
	left_tail = (INT *)calloc(entity_total, sizeof(INT));
	right_tail = (INT *)calloc(entity_total, sizeof(INT));
	for (INT i = 1; i < train_triple_total; i++) {
		if (train_head[i].h != train_head[i - 1].h) {
			right_head[train_head[i - 1].h] = i - 1;
			left_head[train_head[i].h] = i;
		}
		if (train_tail[i].t != train_tail[i - 1].t) {
			right_tail[train_tail[i - 1].t] = i - 1;
			left_tail[train_tail[i].t] = i;
		}
	}
	right_head[train_head[train_triple_total - 1].h] = train_triple_total - 1;
	right_tail[train_tail[train_triple_total - 1].t] = train_triple_total - 1;

	// 获得 left_mean、right_mean，为 train_mode 中的 bern_flag 做准备
	// 在训练过程中，我们能够构建负三元组进行负采样
	// bern 算法能根据特定关系的 head 和 tail 种类的比值，选择构建适当的负三元组
	// train_mode 中的 bern_flag: pr = left_mean / (left_mean + right_mean)
	// 因此为训练而构建的负三元组比 = tail / (tail + head)
	left_mean = (REAL *)calloc(relation_total * 2, sizeof(REAL));
	right_mean = left_mean + relation_total;
	for (INT i = 0; i < entity_total; i++) {
		for (INT j = left_head[i] + 1; j <= right_head[i]; j++)
			if (train_head[j].r != train_head[j - 1].r)
				left_mean[train_head[j].r] += 1.0;
		if (left_head[i] <= right_head[i])
			left_mean[train_head[left_head[i]].r] += 1.0;
		for (INT j = left_tail[i] + 1; j <= right_tail[i]; j++)
			if (train_tail[j].r != train_tail[j - 1].r)
				right_mean[train_tail[j].r] += 1.0;
		if (left_tail[i] <= right_tail[i])
			right_mean[train_tail[left_tail[i]].r] += 1.0;
	}
}

// ##################################################
// 加载 Pretrained Embeddings
// prerequisites: 
//     entity2vec + note + .bin
//     relation2vec + note + .bin
//     
//     or
//
//     entity2vec + note + .vec
//     relation2vec + note + .vec
// ##################################################

void load_binary() {

	// 以二进制形式加载预训练实体嵌入
	struct stat statbuf1;
	if (stat((load_path + "entity2vec" + note + ".bin").c_str(),
			&statbuf1) != -1) {  
		INT fd = open((load_path + "entity2vec" + note + ".bin").c_str(),
			O_RDONLY);
		REAL* entity_vec_tmp = (REAL*)mmap(NULL, statbuf1.st_size,
			PROT_READ, MAP_PRIVATE, fd, 0); 
		memcpy(entity_vec, entity_vec_tmp, statbuf1.st_size);
		munmap(entity_vec_tmp, statbuf1.st_size);
		close(fd);
		printf("%s", ("以二进制形式加载预训练实体嵌入 (" + load_path + "entity2vec" + note + ".bin" + ") 成功.\n").c_str());
	}

	// 以二进制形式加载预训练关系嵌入
	struct stat statbuf2;
	if (stat((load_path + "relation2vec" + note + ".bin").c_str(),
			&statbuf2) != -1) {  
		INT fd = open((load_path + "relation2vec" + note + ".bin").c_str(),
			O_RDONLY);
		REAL* relation_vec_tmp =(REAL*)mmap(NULL, statbuf2.st_size,
			PROT_READ, MAP_PRIVATE, fd, 0); 
		memcpy(relation_vec, relation_vec_tmp, statbuf2.st_size);
		munmap(relation_vec_tmp, statbuf2.st_size);
		close(fd);
		printf("%s", ("以二进制形式加载预训练关系嵌入 (" + load_path + "relation2vec" + note + ".bin" + ") 成功.\n\n").c_str());
	}
}

void load() {
	
	if (load_binary_flag) {
		load_binary();
		return;
	}
	FILE *fin;
	INT tmp;

	// 加载预训练实体嵌入
	fin = fopen((load_path + "entity2vec" + note + ".vec").c_str(), "r");
	for (INT i = 0; i < entity_total; i++) {
		INT last = i * dimension;
		for (INT j = 0; j < dimension; j++)
			tmp = fscanf(fin, "%f", &entity_vec[last + j]);
	}
	fclose(fin);
	printf("%s", ("加载预训练实体嵌入 (" + load_path + "entity2vec" + note + ".vec" + ") 成功.\n").c_str());

	// 加载预训练关系嵌入
	fin = fopen((load_path + "relation2vec" + note + ".vec").c_str(), "r");
	for (INT i = 0; i < relation_total; i++) {
		INT last = i * dimension;
		for (INT j = 0; j < dimension; j++)
			tmp = fscanf(fin, "%f", &relation_vec[last + j]);
	}
	fclose(fin);
	printf("%s", ("加载预训练关系嵌入 (" + load_path + "relation2vec" + note + ".vec" + ") 成功.\n\n").c_str());
}

// ##################################################
// Update embeddings
// ##################################################

INT Len;
INT Batch;

// 由于没有使用互斥锁、读写锁、条件变量和信号量等手段进行线程同步
// 所以 res 可能被不同线程同时访问并修改，因此 res 会比真实值略小
// 但由于 res 只是为了直观地看到损失值的变化趋势，因此不需要通过
// 线程同步（降低程序性能）获得精确结果
REAL res;

// 使用 L1 范数计算能量 d(h + l, t)
REAL calc_sum(INT e1, INT e2, INT rel) {
	REAL sum = 0;
	INT last1 = e1 * dimension;
	INT last2 = e2 * dimension;
	INT lastr = rel * dimension;
	for (INT i = 0; i < dimension; i++)
		sum += fabs(entity_vec[last2 + i] -
			entity_vec[last1 + i] - relation_vec[lastr + i]);
	return sum;
}

// 根据 d(h + l, t) 更新实体和关系嵌入
// (e1_a, rel_a, e2_a): 正三元组
// (e1_b, rel_b, e2_b): 负三元组
void gradient(INT e1_a, INT e2_a, INT rel_a, INT e1_b, INT e2_b, INT rel_b) {
	INT lasta1 = e1_a * dimension;
	INT lasta2 = e2_a * dimension;
	INT lastar = rel_a * dimension;
	INT lastb1 = e1_b * dimension;
	INT lastb2 = e2_b * dimension;
	INT lastbr = rel_b * dimension;

	for (INT i = 0; i  < dimension; i++) {
		REAL x;

		// 尽可能让 d(e1_a, rel_a, e2_a) 接近 0
		x = (entity_vec[lasta2 + i] -
			entity_vec[lasta1 + i] - relation_vec[lastar + i]);
		if (x > 0)
			x = -alpha;
		else
			x = alpha;
		relation_vec[lastar + i] -= x;
		entity_vec[lasta1 + i] -= x;
		entity_vec[lasta2 + i] += x;

		// 尽可能让 d(e1_b, rel_b, e2_b) 远离 0
		x = (entity_vec[lastb2 + i] -
			entity_vec[lastb1 + i] - relation_vec[lastbr + i]);
		if (x > 0)
			x = alpha;
		else
			x = -alpha;
		relation_vec[lastbr + i] -=  x;
		entity_vec[lastb1 + i] -= x;
		entity_vec[lastb2 + i] += x;
	}
}

// 损失函数 L = [margin + d(e1_a, rel_a, e2_a) - d(e1_b, rel_b, e2_b)]+
// 当 L > 0，说明 (d(e1_b, rel_b, e2_b) - d(e1_a, rel_a, e2_a)) < margin，
// 进而，正负三元组的实体和关系嵌入需要 update
void train_kb(INT e1_a, INT e2_a, INT rel_a, INT e1_b, INT e2_b, INT rel_b) {
	REAL sum1 = calc_sum(e1_a, e2_a, rel_a);
	REAL sum2 = calc_sum(e1_b, e2_b, rel_b);
	if (sum1 + margin > sum2) {
		res += margin + sum1 - sum2;
		gradient(e1_a, e2_a, rel_a, e1_b, e2_b, rel_b);
	}
}

// ##################################################
// 构建负三元组
// ##################################################

// 用 head 和 relationship 构建负三元组，即替换 tail
// 该函数返回负三元组的 tail
INT corrupt_with_head(INT id, INT h, INT r) {
	INT lef, rig, mid, ll, rr;

	// lef: head(h) 在 train_head 中第一次出现的前一个位置
	// rig: head(h) 在 train_head 中最后一次出现的位置
	lef = left_head[h] - 1;
	rig = right_head[h];
	while (lef + 1 < rig) {
		mid = (lef + rig) >> 1;
		// 二分查找算法变体
		// 由于 >= -> rig，所以 rig 最终在第一个 r 的位置
		if (train_head[mid].r >= r) rig = mid; else lef = mid;
	}
	ll = rig;

	lef = left_head[h];
	rig = right_head[h] + 1;
	while (lef + 1 < rig) {
		mid = (lef + rig) >> 1;
		// 二分查找算法变体
		// 由于 <= -> lef，所以 lef 最终在最后一个 r 的位置
		if (train_head[mid].r <= r) lef = mid; else rig = mid;
	}
	rr = lef;

	// 只能产生 (entity_total - (rr - ll + 1)) 种实体，即去掉训练集中已有的三元组
	INT tmp = rand_max(id, entity_total - (rr - ll + 1));

	// 第一种：tmp 小于第一个 r 对应的 tail
	if (tmp < train_head[ll].t) return tmp;

	// 第二种：tmp 大于最后一个 r 对应的 tail
	if (tmp > train_head[rr].t - rr + ll - 1) return tmp + rr - ll + 1;

	// 第三种：由于 (>= -> rig), (lef + 1 < rig), (tmp + lef - ll + 1)
	// 因此最终返回取值为 (train_head[lef].t, train_head[rig].t) 的 tail
	lef = ll, rig = rr + 1;
	while (lef + 1 < rig) {
		mid = (lef + rig) >> 1;
		if (train_head[mid].t - mid + ll - 1 < tmp)
			lef = mid;
		else
			rig = mid;
	}
	return tmp + lef - ll + 1;
}

// 用 tail 和 relationship 构建负三元组，即替换 head
// 该函数返回负三元组的 head
INT corrupt_with_tail(INT id, INT t, INT r) {
	INT lef, rig, mid, ll, rr;

	// lef: tail(t) 在 train_tail 中第一次出现的前一个位置
	// rig: tail(t) 在 train_tail 中最后一次出现的位置
	lef = left_tail[t] - 1;
	rig = right_tail[t];
	while (lef + 1 < rig) {
		mid = (lef + rig) >> 1;
		// 二分查找算法变体
		// 由于 >= -> rig，所以 rig 最终在第一个 r 的位置
		if (train_tail[mid].r >= r) rig = mid; else lef = mid;
	}
	ll = rig;
	lef = left_tail[t];
	rig = right_tail[t] + 1;
	while (lef + 1 < rig) {
		mid = (lef + rig) >> 1;
		// 二分查找算法变体
		// 由于 <= -> lef，所以 lef 最终在最后一个 r 的位置
		if (train_tail[mid].r <= r) lef = mid; else rig = mid;
	}
	rr = lef;

	// 只能产生 (entity_total - (rr - ll + 1)) 种实体，即去掉训练集中已有的三元组
	INT tmp = rand_max(id, entity_total - (rr - ll + 1));

	// 第一种：tmp 小于第一个 r 对应的 head
	if (tmp < train_tail[ll].h) return tmp;

	// 第二种：tmp 大于最后一个 r 对应的 head
	if (tmp > train_tail[rr].h - rr + ll - 1) return tmp + rr - ll + 1;

	// 第三种：由于 (>= -> rig), (lef + 1 < rig), (tmp + lef - ll + 1)
	// 因此最终返回取值为 (train_tail[lef].h, train_tail[rig].h) 的 head
	lef = ll, rig = rr + 1;
	while (lef + 1 < rig) {
		mid = (lef + rig) >> 1;
		if (train_tail[mid].h - mid + ll - 1 < tmp)
			lef = mid;
		else 
			rig = mid;
	}
	return tmp + lef - ll + 1;
}

// ##################################################
// 多个线程训练
// ##################################################

// 单个线程内运行的任务
void* train_mode(void *thread_id) {
	INT id, pr, i, j;

	// id: 线程 ID
	id = (unsigned long long)(thread_id);
	next_random[id] = rand();

	// 每一个 Batch 被多个线程同时训练
	for (INT k = Batch / threads; k >= 0; k--) {
		i = rand_max(id, Len);
		if (bern_flag)
			pr = 1000 * left_mean[train_list[i].r] /
				(left_mean[train_list[i].r] + right_mean[train_list[i].r]);
		else
			pr = 500;
		if (randd(id) % 1000 < pr) {
			
			// 通过 h, r 构造出负三元组
			j = corrupt_with_head(id, train_list[i].h, train_list[i].r);
			train_kb(train_list[i].h, train_list[i].t, train_list[i].r,
				train_list[i].h, j, train_list[i].r);
		} else {

			// 通过 t, r 构造出负三元组
			j = corrupt_with_tail(id, train_list[i].t, train_list[i].r);
			train_kb(train_list[i].h, train_list[i].t, train_list[i].r,
				j, train_list[i].t, train_list[i].r);
		}

		// 对于 entity_vec 和 relation_vec 进行归一化
		norm(relation_vec + dimension * train_list[i].r);
		norm(entity_vec + dimension * train_list[i].h);
		norm(entity_vec + dimension * train_list[i].t);
		norm(entity_vec + dimension * j);
	}

	pthread_exit(NULL);
}

// 训练函数
void* train() {
	Len = train_triple_total;
	Batch = Len / nbatches;
	next_random = (unsigned long long *)calloc(threads, sizeof(unsigned long long));

	for (INT epoch = 1; epoch <= epochs; epoch++) {
		res = 0;
		for (INT batch = 0; batch < nbatches; batch++) {
			pthread_t *pt = (pthread_t *)malloc(threads * sizeof(pthread_t));
			for (long a = 0; a < threads; a++)
				pthread_create(&pt[a], NULL, train_mode,  (void*)a);
			for (long a = 0; a < threads; a++)
				pthread_join(pt[a], NULL);
			free(pt);
		}
		
		if (epoch % 50 == 0)
			printf("Epoch %d/%d - loss: %f\n", epoch, epochs, res);
	}
}

// ##################################################
// 输出实体嵌入和关系嵌入
// output: 
//     entity2vec + note + .bin
//     relation2vec + note + .bin
//     
//     or
//
//     entity2vec + note + .vec
//     relation2vec + note + .vec
// ##################################################

void out_binary() {
		
	INT len, tot;
	REAL *head;	
	FILE* f1 = fopen((out_path + "entity2vec" + note + ".bin").c_str(), "wb");
	FILE* f2 = fopen((out_path + "relation2vec" + note + ".bin").c_str(), "wb");

	// 以二进制形式输出实体嵌入
	len = entity_total * dimension; tot = 0;
	head = entity_vec;
	while (tot < len) {
		INT sum = fwrite(head + tot, sizeof(REAL), len - tot, f1);
		tot = tot + sum;
	}
	printf("%s", ("\n以二进制形式输出实体嵌入 (" + out_path + "entity2vec" + note + ".bin" + ") 成功.\n").c_str());

	// 以二进制形式输出关系嵌入
	len = relation_total * dimension; tot = 0;
	head = relation_vec;
	while (tot < len) {
		INT sum = fwrite(head + tot, sizeof(REAL), len - tot, f2);
		tot = tot + sum;
	}
	printf("%s", ("以二进制形式输出关系嵌入 (" + out_path + "relation2vec" + note + ".bin" + ") 成功.\n").c_str());
		
	fclose(f1);
	fclose(f2);
}

void out() {

	if (out_binary_flag) {
		out_binary(); 
		return;
	}

	FILE* f1 = fopen((out_path + "entity2vec" + note + ".vec").c_str(), "w");
	FILE* f2 = fopen((out_path + "relation2vec" + note + ".vec").c_str(), "w");

	// 输出预训练实体嵌入
	for (INT  i = 0; i < entity_total; i++) {
		INT last = i * dimension;
		for (INT j = 0; j < dimension; j++)
			fprintf(f1, "%.6f\t", entity_vec[last + j] );
		fprintf(f1,"\n");
	}
	printf("%s", ("\n输出预训练实体嵌入 (" + out_path + "entity2vec" + note + ".vec" + ") 成功.\n").c_str());

	// 输出预训练关系嵌入
	for (INT i = 0; i < relation_total; i++) {
		INT last = dimension * i;
		for (INT j = 0; j < dimension; j++)
			fprintf(f2, "%.6f\t", relation_vec[last + j]);
		fprintf(f2,"\n");
	}
	printf("%s", ("输出预训练关系嵌入 (" + out_path + "relation2vec" + note + ".vec" + ") 成功.\n").c_str());

	fclose(f1);
	fclose(f2);
}

// ##################################################
// Main function
// ##################################################

// 寻找特定参数的位置
INT arg_pos(char *str, INT argc, char **argv) {
	INT a;
	for (a = 1; a < argc; a++) if (!strcmp(str, argv[a])) {
		if (a == argc - 1) {
			printf("Argument missing for %s\n", str);
			exit(1);
		}
		return a;
	}
	return -1;
}

void setparameters(INT argc, char **argv) {
	INT i;
	if ((i = arg_pos((char *)"-bern", argc, argv)) > 0) bern_flag = atoi(argv[i + 1]);
	if ((i = arg_pos((char *)"-load-binary", argc, argv)) > 0) load_binary_flag = atoi(argv[i + 1]);
	if ((i = arg_pos((char *)"-out-binary", argc, argv)) > 0) out_binary_flag = atoi(argv[i + 1]);
	if ((i = arg_pos((char *)"-size", argc, argv)) > 0) dimension = atoi(argv[i + 1]);
	if ((i = arg_pos((char *)"-alpha", argc, argv)) > 0) alpha = atof(argv[i + 1]);
	if ((i = arg_pos((char *)"-margin", argc, argv)) > 0) margin = atof(argv[i + 1]);
	if ((i = arg_pos((char *)"-nbatches", argc, argv)) > 0) nbatches = atoi(argv[i + 1]);
	if ((i = arg_pos((char *)"-epochs", argc, argv)) > 0) epochs = atoi(argv[i + 1]);
	if ((i = arg_pos((char *)"-threads", argc, argv)) > 0) threads = atoi(argv[i + 1]);
	if ((i = arg_pos((char *)"-input", argc, argv)) > 0) in_path = argv[i + 1];
	if ((i = arg_pos((char *)"-output", argc, argv)) > 0) out_path = argv[i + 1];
	if ((i = arg_pos((char *)"-load", argc, argv)) > 0) load_path = argv[i + 1];	
	if ((i = arg_pos((char *)"-note", argc, argv)) > 0) note = argv[i + 1];
}

// ##################################################
// ./transE [-bern 0/1] [-load-binary 0/1] [-out-binary 0/1]
//          [-size SIZE] [-alpha ALPHA] [-margin MARGIN]
//          [-nbatches NBATCHES] [-epochs EPOCHS]
//          [-threads THREAD] [-input INPUT] [-output OUTPUT]
//          [-load LOAD] [-note NOTE]

// optional arguments:
// -bern [0/1]          [1] 使用 bern 算法进行负采样，默认值为 [1]
// -load-binary [0/1]   [1] 以二进制形式加载预训练嵌入，默认值为 [0]
// -out-binary [0/1]    [1] 以二进制形式输出嵌入，默认值为 [0]
// -size SIZE           实体和关系嵌入维度，默认值为 [50]
// -alpha ALPHA         学习率，默认值为 0.01
// -margin MARGIN       margin in max-margin loss for pairwise training，默认值为 1.0
// -nbatches NBATCHES   number of batches for each epoch. if unspecified, nbatches will default to 1
// -epochs EPOCHS       number of epochs. if unspecified, epochs will default to 1000
// -threads THREAD      number of worker threads. if unspecified, threads will default to 32
// -input INPUT         folder of training data. if unspecified, in_path will default to "../data/FB15K/"
// -output OUTPUT       folder of outputing results. if unspecified, out_path will default to "./build/"
// -load LOAD           folder of pretrained data. if unspecified, load_path will default to ""
// -note NOTE           information you want to add to the filename. if unspecified, note will default to ""
// ##################################################

INT main(INT argc, char **argv) {

	printf("##################################################\n\n");
	printf("训练开始:\n\n");

	struct timeval start, end;
	gettimeofday(&start, NULL);

	setparameters(argc, argv);
	init();
	if (load_path != "") load();
	train();
	if (out_path != "") out();
	
	gettimeofday(&end, NULL);
	long double time_use = 1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec;

	printf("\n训练结束, 用时 %.6Lf 秒.\n\n", time_use/1000000.0);
	printf("##################################################\n\n");

	return 0;
}
```

#### [test_transE.cpp](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/blob/main/knowledge-representation-learning/C%2B%2B/TransE/test_transE.cpp)


```c++
// test_transE.cpp
// 使用方法:
//     编译:
//           $ g++ test_transE.cpp -o ./build/test_transE -pthread -O3 -march=native
//     运行:
//           $ ./build/test_transE
//
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>
//
// 该 C++ 文件用于模型测试
//
// prerequisites: 
//     relation2id.txt, entity2id.txt, test2id_all.txt
//     train2id.txt、valid2id.txt、type_constrain.txt
//
// 加载 Pretrained Embeddings
// prerequisites: 
//     entity2vec + note + .bin
//     relation2vec + note + .bin
//     
//     or
//
//     entity2vec + note + .vec
//     relation2vec + note + .vec

// ##################################################
// 包含标准库
// ##################################################

#include <cstdio>           // FILE, fscanf, fopen, fclose
#include <cstdlib>          // malloc, calloc, free, atoi
#include <cmath>            // fabs
#include <cstring>          // memcpy, strcmp, memset
#include <fcntl.h>          // open, close, O_RDONLY
#include <unistd.h>         // stat
#include <sys/stat.h>       // stat
#include <sys/mman.h>       // mmap, munmap
#include <sys/time.h>       // timeval, gettimeofday
#include <pthread.h>        // pthread_create, pthread_exit, pthread_join
#include <string>           // std::string, std::string::c_str
#include <algorithm>        // std::sort

// ##################################################
// 声明和定义变量
// ##################################################

#define REAL float
#define INT int

INT load_binary_flag = 0;
INT dimension = 50;
INT threads = 32;

std::string in_path = "../data/FB15K/";
std::string load_path = "./build/";
std::string note = "";

// 三元组: (head, label, tail)
// h: head
// r: label or relationship
// t: tail
// label(head-tail, relationship type):
//     1: 1-1
//     2: 1-n
//     3: n-1
//     4: n-n
// a relationship of name label between the entities head and tail
struct Triple {
	INT h, r, t;
	INT label;
};

// 为 std::sort() 定义比较仿函数
// 以三元组的 head 进行比较
struct cmp_head {
	bool operator()(const Triple &a, const Triple &b) {
		return (a.h < b.h)||(a.h == b.h && a.r < b.r)
		        ||(a.h == b.h && a.r == b.r && a.t < b.t);
	}
};

// ##################################################
// 从 test2id_all.txt、train2id.txt、valid2id.txt 中读取三元组
// prerequisites: 
//     relation2id.txt, entity2id.txt, test2id_all.txt
//     train2id.txt、valid2id.txt、type_constrain.txt
// ##################################################

// relation_total: 关系总数
// entity_total: 实体总数
INT relation_total;
INT entity_total;

// relation_vec (relation_total * dimension): 关系嵌入矩阵
// entity_vec (entity_total * dimension): 实体嵌入矩阵
REAL *relation_vec, *entity_vec;

// test_total: 测试集中的三元组总数
// train_total: 训练集中的三元组总数
// valid_total: 验证集中的三元组总数
// triple_total: 测试集、训练集、验证集中的三元组总数，以 head 排序
INT test_total, train_total, valid_total, triple_total;

// test_list (test_total): 测试集中的三元组集合
// triple_list (triple_total): 测试集、训练集、验证集中的三元组集合
Triple *test_list, *triple_list;

// 统计测试集中各种三元组 (关系: 1-1, 1-n, n-1, n-n) 的数量
// nntotal[1]: 1-1, nntotal[2]: 1-n, nntotal[3]: n-1, nntotal[4]: n-n
INT nntotal[5];

// head_type: 存储各个关系的 head 类型, 各个关系的 head 类型独立地以升序排列
// tail_type: 存储各个关系的 tail 类型, 各个关系的 tail 类型独立地以升序排列
INT head_type[1000000];
INT tail_type[1000000];

// head_left: 记录各个关系的 head 类型在 head_type 中第一次出现的位置
// head_right: 记录各个关系的 head 类型在 head_type 中最后一次出现的后一个位置
// tail_left: 记录各个关系的 tail 类型在 tail_type 中第一次出现的位置
// tail_right: 记录各个关系的 tail 类型在 tail_type 中最后一次出现的后一个位置
INT head_left[10000];
INT head_right[10000];
INT tail_left[10000];
INT tail_right[10000];

void init() {

	FILE *fin;
	INT tmp, h, r, t, label;

	// 为 relation_vec 分配一个内存块，并将其所有位初始化为零
	fin = fopen((in_path + "relation2id.txt").c_str(), "r");
	tmp = fscanf(fin, "%d", &relation_total);
	fclose(fin);
	relation_vec = (REAL *)calloc(relation_total * dimension, sizeof(REAL));

	// 为 entity_vec 分配一个内存块，并将其所有位初始化为零
	fin = fopen((in_path + "entity2id.txt").c_str(), "r");
	tmp = fscanf(fin, "%d", &entity_total);
	fclose(fin);
	entity_vec = (REAL *)calloc(entity_total * dimension, sizeof(REAL));

	// 读取测试集、训练集、验证集中的三元组
	FILE* f_kb1 = fopen((in_path + "test2id_all.txt").c_str(), "r");
	FILE* f_kb2 = fopen((in_path + "train2id.txt").c_str(), "r");
	FILE* f_kb3 = fopen((in_path + "valid2id.txt").c_str(), "r");

	tmp = fscanf(f_kb1, "%d", &test_total);
	tmp = fscanf(f_kb2, "%d", &train_total);
	tmp = fscanf(f_kb3, "%d", &valid_total);
	triple_total = test_total + train_total + valid_total;
	test_list = (Triple *)calloc(test_total, sizeof(Triple));
	triple_list = (Triple *)calloc(triple_total, sizeof(Triple));

	// 将 nntotal 的内存初始化为 0
	memset(nntotal, 0, sizeof(nntotal));

	for (INT i = 0; i < test_total; i++) {
		tmp = fscanf(f_kb1, "%d", &label);
		tmp = fscanf(f_kb1, "%d", &h);
		tmp = fscanf(f_kb1, "%d", &t);
		tmp = fscanf(f_kb1, "%d", &r);
		label++;
		nntotal[label]++;
		test_list[i].label = label;
		test_list[i].h = h;
		test_list[i].t = t;
		test_list[i].r = r;
		triple_list[i].h = h;
		triple_list[i].t = t;
		triple_list[i].r = r;
	}

	for (INT i = 0; i < train_total; i++) {
		tmp = fscanf(f_kb2, "%d", &h);
		tmp = fscanf(f_kb2, "%d", &t);
		tmp = fscanf(f_kb2, "%d", &r);
		triple_list[i + test_total].h = h;
		triple_list[i + test_total].t = t;
		triple_list[i + test_total].r = r;
	}

	for (INT i = 0; i < valid_total; i++) {
		tmp = fscanf(f_kb3, "%d", &h);
		tmp = fscanf(f_kb3, "%d", &t);
		tmp = fscanf(f_kb3, "%d", &r);
		triple_list[i + test_total + train_total].h = h;
		triple_list[i + test_total + train_total].t = t;
		triple_list[i + test_total + train_total].r = r;
	}

	fclose(f_kb1);
	fclose(f_kb2);
	fclose(f_kb3);

	// triple_list 用 head 排序
	std::sort(triple_list, triple_list + triple_total, cmp_head());

	// type_constrain.txt: 类型约束文件, 第一行是关系的个数
	// 下面的行是每个关系的类型限制 (训练集、验证集、测试集中每个关系存在的 head 和 tail 的类型)
	// 每个关系有两行：
	// 第一行：`id of relation` `Number of head types` `head1` `head2` ...
	// 第二行: `id of relation` `number of tail types` `tail1` `tail2` ...
	//
	// For example, the relation with id 1200 has 4 types of head entities, which are 3123, 1034, 58 and 5733
	// The relation with id 1200 has 4 types of tail entities, which are 12123, 4388, 11087 and 11088
	// 1200	4	3123	1034	58	5733
	// 1200	4	12123	4388	11087	11088
	INT total_left = 0;
	INT total_right = 0;
	FILE* f_type = fopen((in_path + "type_constrain.txt").c_str(), "r");
	tmp = fscanf(f_type, "%d", &relation_total);
	
	for (INT i = 0; i < relation_total; i++) {
		INT rel, tot;
		tmp = fscanf(f_type, "%d%d", &rel, &tot);
		head_left[rel] = total_left;
		for (INT j = 0; j < tot; j++) {
			tmp = fscanf(f_type, "%d", &head_type[total_left]);
			total_left++;
		}
		head_right[rel] = total_left;
		std::sort(head_type + head_left[rel], head_type + head_right[rel]);

		tmp = fscanf(f_type, "%d%d", &rel, &tot);
		tail_left[rel] = total_right;
		for (INT j = 0; j < tot; j++) {
			tmp = fscanf(f_type, "%d", &tail_type[total_right]);
			total_right++;
		}
		tail_right[rel] = total_right;
		std::sort(tail_type + tail_left[rel], tail_type + tail_right[rel]);
	}
	fclose(f_type);
}

// ##################################################
// 加载 Pretrained Embeddings
// prerequisites: 
//     entity2vec + note + .bin
//     relation2vec + note + .bin
//     
//     or
//
//     entity2vec + note + .vec
//     relation2vec + note + .vec
// ##################################################

void load_binary() {

	// 以二进制形式加载预训练实体嵌入
	struct stat statbuf1;
	if (stat((load_path + "entity2vec" + note + ".bin").c_str(),
			&statbuf1) != -1) {
		INT fd = open((load_path + "entity2vec" + note + ".bin").c_str(),
			O_RDONLY);
		REAL* entity_vec_tmp = (REAL*)mmap(NULL, statbuf1.st_size,
			PROT_READ, MAP_PRIVATE, fd, 0);
		memcpy(entity_vec, entity_vec_tmp, statbuf1.st_size);
		munmap(entity_vec_tmp, statbuf1.st_size);
		close(fd);
		printf("%s", ("以二进制形式加载预训练实体嵌入 (" + load_path + "entity2vec" + note + ".bin" + ") 成功.\n").c_str());
	}

	// 以二进制形式加载预训练关系嵌入
	struct stat statbuf2;
	if (stat((load_path + "relation2vec" + note + ".bin").c_str(),
			&statbuf2) != -1) {
		INT fd = open((load_path + "relation2vec" + note + ".bin").c_str(),
			O_RDONLY);
		REAL* relation_vec_tmp = (REAL*)mmap(NULL, statbuf2.st_size,
			PROT_READ, MAP_PRIVATE, fd, 0);
		memcpy(relation_vec, relation_vec_tmp, statbuf2.st_size);
		munmap(relation_vec_tmp, statbuf2.st_size);
		close(fd);
		printf("%s", ("以二进制形式加载预训练关系嵌入 (" + load_path + "relation2vec" + note + ".bin" + ") 成功.\n\n").c_str());
	}
}

void load() {

	if (load_binary_flag) {
		load_binary();
		return;
	}

	FILE *fin;
	INT tmp;

	// 加载预训练实体嵌入
	fin = fopen((load_path + "entity2vec" + note + ".vec").c_str(), "r");
	for (INT i = 0; i < entity_total; i++) {
		INT last = i * dimension;
		for (INT j = 0; j < dimension; j++)
			tmp = fscanf(fin, "%f", &entity_vec[last + j]);
	}
	fclose(fin);
	printf("%s", ("加载预训练实体嵌入 (" + load_path + "entity2vec" + note + ".vec" + ") 成功.\n").c_str());

	// 加载预训练关系嵌入
	fin = fopen((load_path + "relation2vec" + note + ".vec").c_str(), "r");
	for (INT i = 0; i < relation_total; i++) {
		INT last = i * dimension;
		for (INT j = 0; j < dimension; j++)
			tmp = fscanf(fin, "%f", &relation_vec[last + j]);
	}
	fclose(fin);
	printf("%s", ("加载预训练关系嵌入 (" + load_path + "relation2vec" + note + ".vec" + ") 成功.\n\n").c_str());
}

// ##################################################
// 多个线程测试
// ##################################################

// 使用 L1 范数计算能量 d(h + l, t)
REAL calc_sum(INT e1, INT e2, INT rel) {
	REAL sum = 0;
	INT last1 = e1 * dimension;
	INT last2 = e2 * dimension;
	INT lastr = rel * dimension;
	for (INT i = 0; i < dimension; i++)
		sum += fabs(entity_vec[last2 + i] -
			entity_vec[last1 + i] - relation_vec[lastr + i]);
	return sum;
}

// 检查数据集中是否存在 (h, t, r)
bool find(INT h, INT t, INT r) {
	INT lef = 0;
	INT rig = triple_total - 1;
	INT mid;
	while (lef + 1 < rig) {
		INT mid = (lef + rig) >> 1;
		if ((triple_list[mid].h < h) 
			|| (triple_list[mid].h == h && triple_list[mid].r < r) 
			|| (triple_list[mid].h == h && triple_list[mid].r == r 
					&& triple_list[mid].t < t)) 
				lef = mid; else rig = mid;
	}
	if (triple_list[lef].h == h && triple_list[lef].r == r 
		&& triple_list[lef].t == t) return true;
	if (triple_list[rig].h == h && triple_list[rig].r == r 
		&& triple_list[rig].t == t) return true;
	return false;
}

// l_raw_tot, l_filter_tot, r_raw_tot, r_filter_tot 的形状为 [6][threads]
// l_raw_rank, l_filter_rank, r_raw_rank, r_filter_rank 的形状为 [6][threads]
// 第一维度:
// 0: 代表全部测试集的结果
// 1: 代表关系为 1-1 的测试三元组的结果
// 2: 代表关系为 1-n 的测试三元组的结果
// 3: 代表关系为 n-1 的测试三元组的结果
// 4: 代表关系为 n-n 的测试三元组的结果
// 5: 代表全部测试集的结果, 通过 type_constrain.txt 来构造负三元组
// 第二维度:
// 0 ~ (threads - 1): 线程 ID
// l_raw_tot: 记录排名前 10 的 (替换 head 生成负三元组) 测试三元组个数
// l_filter_tot: 记录排名前 10 的 (替换 head 生成负三元组) 测试三元组个数, 且负三元组不在数据集中
// r_raw_tot: 记录排名前 10 的 (替换 tail 生成负三元组) 测试三元组个数
// r_filter_tot: 记录排名前 10 的 (替换 tail 生成负三元组) 测试三元组个数, 且负三元组不在数据集中
// l_raw_rank: 记录 (替换 head 生成负三元组) 测试三元组的排名总和 (排名从 0 开始)
// l_filter_rank: 记录 (替换 head 生成负三元组) 测试三元组的排名总和 (排名从 0 开始), 且负三元组不在数据集中
// r_raw_rank: 记录 (替换 tail 生成负三元组) 测试三元组的排名总和 (排名从 0 开始)
// r_filter_rank: 记录 (替换 tail 生成负三元组) 测试三元组的排名总和 (排名从 0 开始), 且负三元组不在数据集中
REAL *l_raw_tot[6], *l_filter_tot[6], *r_raw_tot[6], *r_filter_tot[6];
REAL *l_raw_rank[6], *l_filter_rank[6], *r_raw_rank[6], *r_filter_rank[6];

// 单个线程内运行的任务
void* test_mode(void *thread_id) {
	INT id;

	// id: 线程 ID
	id = (unsigned long long)(thread_id);
	INT lef = test_total / (threads) * id;
	INT rig = test_total / (threads) * (id + 1) - 1;
	if (id == threads - 1) rig = test_total - 1;

	for (INT i = lef; i <= rig; i++) {

		INT h = test_list[i].h;
		INT t = test_list[i].t;
		INT r = test_list[i].r;
		INT label = test_list[i].label;

		REAL minimal = calc_sum(h, t, r);

		// l_raw: 记录能量 (d(h + l, t)) 小于测试三元组的 (替换 head) 负三元组个数
		// l_filter: 记录能量 (d(h + l, t)) 小于测试三元组的 (替换 head) 负三元组个数, 且负三元组不在数据集中
		// r_raw: 记录能量 (d(h + l, t)) 小于测试三元组的 (替换 tail) 负三元组个数
		// r_filter: 记录能量 (d(h + l, t)) 小于测试三元组的 (替换 tail) 负三元组个数, 且负三元组不在数据集中
		INT l_raw = 0;
		INT l_filter = 0;
		INT r_raw = 0;
		INT r_filter = 0;

		// l_raw_constrain: 记录能量 (d(h + l, t)) 小于测试三元组的 (通过 type_constrain.txt 替换 head 构造负三元组) 负三元组个数
		// l_filter_constrain: 记录能量 (d(h + l, t)) 小于测试三元组的 (通过 type_constrain.txt 替换 head 构造负三元组) 负三元组个数, 且负三元组不在数据集中
		// r_raw_constrain: 记录能量 (d(h + l, t)) 小于测试三元组的 (通过 type_constrain.txt 替换 tail 构造负三元组) 负三元组个数
		// r_filter_constrain: 记录能量 (d(h + l, t)) 小于测试三元组的 (通过 type_constrain.txt 替换 tail 构造负三元组) 负三元组个数, 且负三元组不在数据集中
		INT l_raw_constrain = 0;
		INT l_filter_constrain = 0;
		INT r_raw_constrain = 0;
		INT r_filter_constrain = 0;

		// left_head_type: 记录关系 r 的 head 类型在 head_type 中第一次出现的位置
		// left_tail_type: 记录关系 r 的 tail 类型在 tail_type 中第一次出现的位置
		INT left_head_type = head_left[r], left_tail_type = tail_left[r];
		for (INT j = 0; j < entity_total; j++) {

			// 替换 head
			if (j != h) {
				REAL value = calc_sum(j, t, r);
				if (value < minimal) {
					l_raw += 1;
					if (not find(j, t, r))
						l_filter += 1;
				}
				while (left_head_type < head_right[r] && head_type[left_head_type] < j) left_head_type++;
				if (left_head_type < head_right[r] && head_type[left_head_type] == j) {
					if (value < minimal) {
						l_raw_constrain += 1;
						if (not find(j, t, r))
							l_filter_constrain += 1;
					}
				}
			}

			// 替换 tail
			if (j != t) {
				REAL value = calc_sum(h, j, r);
				if (value < minimal) {
					r_raw += 1;
					if (not find(h, j, r))
						r_filter += 1;
				}
				while (left_tail_type < tail_right[r] && tail_type[left_tail_type] < j) left_tail_type++;
				if (left_tail_type < tail_right[r] && tail_type[left_tail_type] == j) {
					if (value < minimal) {
						r_raw_constrain += 1;
						if (not find(h, j, r))
							r_filter_constrain += 1;
					}
				}
			}
		}
		
		// 全部测试集
		if (l_raw < 10) l_raw_tot[0][id] += 1;
		if (l_filter < 10) l_filter_tot[0][id] += 1;
		if (r_raw < 10) r_raw_tot[0][id] += 1;
		if (r_filter < 10) r_filter_tot[0][id] += 1;

		l_raw_rank[0][id] += l_raw;
		l_filter_rank[0][id] += l_filter;
		r_raw_rank[0][id] += r_raw;
		r_filter_rank[0][id] += r_filter;

		// 1-1, 1-n, n-1, n-n
		if (l_raw < 10) l_raw_tot[label][id] += 1;
		if (l_filter < 10) l_filter_tot[label][id] += 1;
		if (r_raw < 10) r_raw_tot[label][id] += 1;
		if (r_filter < 10) r_filter_tot[label][id] += 1;

		l_raw_rank[label][id] += l_raw;
		l_filter_rank[label][id] += l_filter;
		r_raw_rank[label][id] += r_raw;
		r_filter_rank[label][id] += r_filter;

		// 全部测试集的结果, 通过 type_constrain.txt 来构造负三元组
		if (l_raw_constrain < 10) l_raw_tot[5][id] += 1;
		if (l_filter_constrain < 10) l_filter_tot[5][id] += 1;
		if (r_raw_constrain < 10) r_raw_tot[5][id] += 1;
		if (r_filter_constrain < 10) r_filter_tot[5][id] += 1;

		l_raw_rank[5][id] += l_raw_constrain;
		l_filter_rank[5][id] += l_filter_constrain;
		r_raw_rank[5][id] += r_raw_constrain;
		r_filter_rank[5][id] += r_filter_constrain;
	}

	pthread_exit(NULL);
}

// 测试函数
void* test() {

	for (INT i = 0; i <= 5; i++) {

		l_raw_tot[i] = (REAL *)calloc(threads, sizeof(REAL));
		l_filter_tot[i] = (REAL *)calloc(threads, sizeof(REAL));
		r_raw_tot[i] = (REAL *)calloc(threads, sizeof(REAL));
		r_filter_tot[i] = (REAL *)calloc(threads, sizeof(REAL));

		l_raw_rank[i] = (REAL *)calloc(threads, sizeof(REAL));
		l_filter_rank[i] = (REAL *)calloc(threads, sizeof(REAL));
		r_raw_rank[i] = (REAL *)calloc(threads, sizeof(REAL));
		r_filter_rank[i] = (REAL *)calloc(threads, sizeof(REAL));
		
	}

	// 开启多线程测试
	pthread_t *pt = (pthread_t *)malloc(threads * sizeof(pthread_t));
	for (long a = 0; a < threads; a++)
		pthread_create(&pt[a], NULL, test_mode, (void*)a);
	for (long a = 0; a < threads; a++)
		pthread_join(pt[a], NULL);
	free(pt);

	// 将各个线程的结果累加
	for (INT i = 0; i <= 5; i++)
		for (INT a = 1; a < threads; a++) {

			l_raw_tot[i][a] += l_raw_tot[i][a - 1];
			l_filter_tot[i][a] += l_filter_tot[i][a - 1];
			r_raw_tot[i][a] += r_raw_tot[i][a - 1];
			r_filter_tot[i][a] += r_filter_tot[i][a - 1];

			l_raw_rank[i][a] += l_raw_rank[i][a - 1];
			l_filter_rank[i][a] += l_filter_rank[i][a - 1];
			r_raw_rank[i][a] += r_raw_rank[i][a - 1];
			r_filter_rank[i][a] += r_filter_rank[i][a - 1];
			
		}
	
	// 总体结果
	printf("总体结果：\n\n");
	for (INT i = 0; i <= 0; i++) {
		printf("heads(raw) \t\t平均排名: %f, \tHits@10: %f\n", l_raw_rank[i][threads - 1] / test_total,
			l_raw_tot[i][threads - 1] / test_total);
		printf("heads(filter) \t\t平均排名: %f, \tHits@10: %f\n", l_filter_rank[i][threads - 1] / test_total,
			l_filter_tot[i][threads - 1] / test_total);
		printf("tails(raw) \t\t平均排名: %f, \tHits@10: %f\n", r_raw_rank[i][threads - 1] / test_total,
			r_raw_tot[i][threads - 1] / test_total);
		printf("tails(filter) \t\t平均排名: %f, \tHits@10: %f\n", r_filter_rank[i][threads - 1] / test_total,
			r_filter_tot[i][threads - 1] / test_total);
	}

	// 通过 type_constrain.txt 限制的总体结果
	printf("\n通过 type_constrain.txt 限制的总体结果：\n\n");
	for (INT i = 5; i <= 5; i++) {
		printf("heads(raw) \t\t平均排名: %f, \tHits@10: %f\n", l_raw_rank[i][threads - 1] / test_total,
			l_raw_tot[i][threads - 1] / test_total);
		printf("heads(filter) \t\t平均排名: %f, \tHits@10: %f\n", l_filter_rank[i][threads - 1] / test_total,
			l_filter_tot[i][threads - 1] / test_total);
		printf("tails(raw) \t\t平均排名: %f, \tHits@10: %f\n", r_raw_rank[i][threads - 1] / test_total,
			r_raw_tot[i][threads - 1] / test_total);
		printf("tails(filter) \t\t平均排名: %f, \tHits@10: %f\n", r_filter_rank[i][threads - 1] / test_total,
			r_filter_tot[i][threads - 1] / test_total);
	}

	// (关系: 1-1, 1-n, n-1, n-n) 测试三元组的结果
	printf("\n(关系: 1-1, 1-n, n-1, n-n) 测试三元组的结果：\n");

	std::string relation[] = {
		"关系: 1-1",
		"关系: 1-n",
		"关系: n-1",
		"关系: n-n"
	};

	for (INT i = 1; i <= 4; i++) {

		printf("\n%s:\n\n", relation[i - 1].c_str());

		printf("heads(raw) \t\t平均排名: %f, \tHits@10: %f\n", l_raw_rank[i][threads - 1] / nntotal[i],
			l_raw_tot[i][threads - 1] / nntotal[i]);
		printf("heads(filter) \t\t平均排名: %f, \tHits@10: %f\n", l_filter_rank[i][threads - 1] / nntotal[i],
			l_filter_tot[i][threads - 1] / nntotal[i]);
		printf("tails(raw) \t\t平均排名: %f, \tHits@10: %f\n", r_raw_rank[i][threads - 1] / nntotal[i],
			r_raw_tot[i][threads - 1] / nntotal[i]);
		printf("tails(filter) \t\t平均排名: %f, \tHits@10: %f\n", r_filter_rank[i][threads - 1] / nntotal[i],
			r_filter_tot[i][threads - 1] / nntotal[i]);
		
	}
}

// ##################################################
// Main function
// ##################################################

// 寻找特定参数的位置
INT arg_pos(char *str, INT argc, char **argv) {
	
	INT a;
	for (a = 1; a < argc; a++) if (!strcmp(str, argv[a])) {
		if (a == argc - 1) {
			printf("Argument missing for %s\n", str);
			exit(1);
		}
		return a;
	}
	return -1;
}

void setparameters(INT argc, char **argv) {
	INT i;
	if ((i = arg_pos((char *)"-load-binary", argc, argv)) > 0) load_binary_flag = atoi(argv[i + 1]);
	if ((i = arg_pos((char *)"-size", argc, argv)) > 0) dimension = atoi(argv[i + 1]);
	if ((i = arg_pos((char *)"-threads", argc, argv)) > 0) threads = atoi(argv[i + 1]);
	if ((i = arg_pos((char *)"-input", argc, argv)) > 0) in_path = argv[i + 1];
	if ((i = arg_pos((char *)"-load", argc, argv)) > 0) load_path = argv[i + 1];
	if ((i = arg_pos((char *)"-note", argc, argv)) > 0) note = argv[i + 1];
}

// ##################################################
// ./test_transE [-load-binary 0/1] [-size SIZE]
//          [-threads THREAD] [-input INPUT]
//          [-load LOAD] [-note NOTE]

// optional arguments:
// -load-binary [0/1]   [1] 以二进制形式加载预训练嵌入，默认值为 [0]
// -size SIZE           实体和关系嵌入维度，默认值为 [50]
// -threads THREAD      number of worker threads. if unspecified, threads will default to 32
// -input INPUT         folder of training data. if unspecified, in_path will default to "../data/FB15K/"
// -load LOAD           folder of pretrained data. if unspecified, load_path will default to "./build/"
// -note NOTE           information you want to add to the filename. if unspecified, note will default to ""
// ##################################################

INT main(INT argc, char **argv) {

	printf("测试开始:\n\n");

	struct timeval start, end;
	gettimeofday(&start, NULL);

	setparameters(argc, argv);
	init();
	load();
	test();

	gettimeofday(&end, NULL);
	long double time_use = 1000000 * (end.tv_sec - start.tv_sec) + end.tv_usec - start.tv_usec;

	printf("\n测试结束, 用时 %.6Lf 秒.\n\n", time_use/1000000.0);
	printf("##################################################\n\n");

	return 0;
}
```

#### [run.sh](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/blob/main/knowledge-representation-learning/C%2B%2B/TransE/run.sh)

```bash
#!/bin/bash

##################################################
# run.sh
# 使用方法：$ bash run.sh
# created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>
#
# 该 Shell 脚本用于模型训练和模型测试
##################################################

# 生成临时数据文件
python3 data_preprocessing.py

# 创建 build 目录
echo "##################################################"
echo ""
mkdir build
echo "./build 目录创建成功."
echo ""

# train
g++ transE.cpp -o ./build/transE -pthread -O3 -march=native
./build/transE
 
# test
g++ test_transE.cpp -o ./build/test_transE -pthread -O3 -march=native
./build/test_transE
```

#### [clean.sh](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/blob/main/knowledge-representation-learning/C%2B%2B/TransE/clean.sh)

```bash
#!/bin/bash

##################################################
# clean.sh
# 使用方法：$ bash clean.sh
# created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>
#
# 该 Shell 脚本用于清理临时文件
##################################################

# 删除目标文件和嵌入文件
echo ""
echo "##################################################"
echo ""
rm -rf ./build
echo "./build 目录递归删除成功."
echo ""

# 删除临时的数据文件
rm -f ../data/FB15K/1-1.txt ../data/FB15K/1-n.txt ../data/FB15K/n-1.txt ../data/FB15K/n-n.txt ../data/FB15K/test2id_all.txt ../data/FB15K/type_constrain.txt
echo "已删除 ../data/FB15K/1-1.txt ../data/FB15K/1-n.txt ../data/FB15K/n-1.txt ../data/FB15K/n-n.txt ../data/FB15K/test2id_all.txt ../data/FB15K/type_constrain.txt."
echo ""
echo "##################################################"
echo ""
```

### 使用

```shell
$ ls
data  papers  README.md  TransE
$ cd TransE/
$ ls
clean.sh  data_preprocessing.py  run.sh  test_transE.cpp  transE.cpp
$ bash run.sh 

##################################################

数据预处理开始...

../data/FB15K/type_constrain.txt 创建成功.

../data/FB15K/1-1.txt ../data/FB15K/1-n.txt ../data/FB15K/n-1.txt ../data/FB15K/n-n.txt ../data/FB15K/test2id_all.txt 创建成功.

数据预处理结束.

##################################################

./build 目录创建成功.

##################################################

训练开始:

relation_total: 1345
entity_total: 14951
train_triple_total: 483142

Epoch 50/1000 - loss: 4220.165039
Epoch 100/1000 - loss: 3433.874268
Epoch 150/1000 - loss: 3082.582031
Epoch 200/1000 - loss: 2955.229492
Epoch 250/1000 - loss: 2860.262695
Epoch 300/1000 - loss: 2755.290527
Epoch 350/1000 - loss: 2776.718506
Epoch 400/1000 - loss: 2601.110596
Epoch 450/1000 - loss: 2654.754883
Epoch 500/1000 - loss: 2641.694824
Epoch 550/1000 - loss: 2517.212891
Epoch 600/1000 - loss: 2625.712402
Epoch 650/1000 - loss: 2474.082764
Epoch 700/1000 - loss: 2581.359863
Epoch 750/1000 - loss: 2460.039062
Epoch 800/1000 - loss: 2542.918213
Epoch 850/1000 - loss: 2456.383057
Epoch 900/1000 - loss: 2467.666748
Epoch 950/1000 - loss: 2437.669434
Epoch 1000/1000 - loss: 2396.724121

输出预训练实体嵌入 (./build/entity2vec.vec) 成功.
输出预训练关系嵌入 (./build/relation2vec.vec) 成功.

训练结束, 用时 49.974742 秒.

##################################################

测试开始:

加载预训练实体嵌入 (./build/entity2vec.vec) 成功.
加载预训练关系嵌入 (./build/relation2vec.vec) 成功.

总体结果：

heads(raw) 		平均排名: 307.290955, 	Hits@10: 0.376293
heads(filter) 		平均排名: 193.796234, 	Hits@10: 0.499619
tails(raw) 		平均排名: 226.710876, 	Hits@10: 0.452726
tails(filter) 		平均排名: 155.753433, 	Hits@10: 0.567791

通过 type_constrain.txt 限制的总体结果：

heads(raw) 		平均排名: 201.278839, 	Hits@10: 0.403362
heads(filter) 		平均排名: 87.784126, 	Hits@10: 0.563898
tails(raw) 		平均排名: 138.802917, 	Hits@10: 0.480710
tails(filter) 		平均排名: 67.845474, 	Hits@10: 0.611315

(关系: 1-1, 1-n, n-1, n-n) 测试三元组的结果：

关系: 1-1:

heads(raw) 		平均排名: 122.549644, 	Hits@10: 0.698582
heads(filter) 		平均排名: 122.320328, 	Hits@10: 0.702128
tails(raw) 		平均排名: 143.882980, 	Hits@10: 0.692671
tails(filter) 		平均排名: 143.633575, 	Hits@10: 0.699764

关系: 1-n:

heads(raw) 		平均排名: 30.182560, 	Hits@10: 0.833934
heads(filter) 		平均排名: 29.975924, 	Hits@10: 0.838294
tails(raw) 		平均排名: 1288.020142, 	Hits@10: 0.184645
tails(filter) 		平均排名: 895.189941, 	Hits@10: 0.239621

关系: n-1:

heads(raw) 		平均排名: 1173.232788, 	Hits@10: 0.132855
heads(filter) 		平均排名: 732.672363, 	Hits@10: 0.200555
tails(raw) 		平均排名: 33.063072, 	Hits@10: 0.844115
tails(filter) 		平均排名: 32.890060, 	Hits@10: 0.846893

关系: n-n:

heads(raw) 		平均排名: 174.934845, 	Hits@10: 0.363132
heads(filter) 		平均排名: 109.573875, 	Hits@10: 0.513756
tails(raw) 		平均排名: 139.707718, 	Hits@10: 0.403733
tails(filter) 		平均排名: 91.915115, 	Hits@10: 0.549911

测试结束, 用时 12.542188 秒.

##################################################

$ tree
.
├── build
│   ├── entity2vec.vec
│   ├── relation2vec.vec
│   ├── test_transE
│   └── transE
├── clean.sh
├── data_preprocessing.py
├── run.sh
├── test_transE.cpp
└── transE.cpp

1 directory, 9 files
$ bash clean.sh 

##################################################

./build 目录递归删除成功.

已删除 ../data/FB15K/1-1.txt ../data/FB15K/1-n.txt ../data/FB15K/n-1.txt ../data/FB15K/n-n.txt ../data/FB15K/test2id_all.txt ../data/FB15K/type_constrain.txt.

##################################################

$ ls
clean.sh  data_preprocessing.py  run.sh  test_transE.cpp  transE.cpp
```

运行结果显示: 训练集中的关系一共为 *1345* 个，实体一共为 *14951* 个，三元组一共 *483142* 个。训练一共用时 **49.974742** 秒。

可以发现类型为 **1-TO-MANY** 和 **MANY-TO-1** 的关系, 从 **MANY** 侧边预测 **1** 侧边具有很高的利用价值, 因为这种训练数据较多.

对于大型知识图谱, 用全部实体构建`负三元组`是极其耗时的, 因此用 **type_constrain.txt** 来构造负三元组. 该文件记录了**数据集** (训练集, 验证集, 测试集) 中各个关系 **head** 和 **tail** 出现过的种类.

### 训练和测试的参数

#### transE.cpp

```shell
./transE [-bern 0/1] [-load-binary 0/1] [-out-binary 0/1]
         [-size SIZE] [-alpha ALPHA] [-margin MARGIN]
         [-nbatches NBATCHES] [-epochs EPOCHS]
         [-threads THREAD] [-input INPUT] [-output OUTPUT]
         [-load LOAD] [-note NOTE]

optional arguments:
-bern [0/1]          [1] 使用 bern 算法进行负采样，默认值为 [1]
-load-binary [0/1]   [1] 以二进制形式加载预训练嵌入，默认值为 [0]
-out-binary [0/1]    [1] 以二进制形式输出嵌入，默认值为 [0]
-size SIZE           实体和关系嵌入维度，默认值为 [50]
-alpha ALPHA         学习率，默认值为 0.01
-margin MARGIN       margin in max-margin loss for pairwise training，默认值为 1.0
-nbatches NBATCHES   number of batches for each epoch. if unspecified, nbatches will default to 1
-epochs EPOCHS       number of epochs. if unspecified, epochs will default to 1000
-threads THREAD      number of worker threads. if unspecified, threads will default to 32
-input INPUT         folder of training data. if unspecified, in_path will default to "../data/FB15K/"
-output OUTPUT       folder of outputing results. if unspecified, out_path will default to "./build/"
-load LOAD           folder of pretrained data. if unspecified, load_path will default to ""
-note NOTE           information you want to add to the filename. if unspecified, note will default to ""
```

#### test_transE.cpp

```shell
./test_transE [-load-binary 0/1] [-size SIZE]
         [-threads THREAD] [-input INPUT]
         [-load LOAD] [-note NOTE]

optional arguments:
-load-binary [0/1]   [1] 以二进制形式加载预训练嵌入，默认值为 [0]
-size SIZE           实体和关系嵌入维度，默认值为 [50]
-threads THREAD      number of worker threads. if unspecified, threads will default to 32
-input INPUT         folder of training data. if unspecified, in_path will default to "../data/FB15K/"
-load LOAD           folder of pretrained data. if unspecified, load_path will default to "./build/"
-note NOTE           information you want to add to the filename. if unspecified, note will default to ""
```

## 结语

第三十六篇博文写完，开心！！！！

今天，也是充满希望的一天。