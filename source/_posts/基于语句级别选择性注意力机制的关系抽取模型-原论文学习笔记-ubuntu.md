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

<div id = "9"></div>

9. https://code.google.com/p/word2vec/ .

## CNN+ATT 原论文学习笔记

**Neural Relation Extraction with Selective Attention over Instances** (基于语句级别选择性注意力机制的神经网络模型) 提出于 *2016* 年, 发表于 [Proceedings of the 54th Annual Meeting of the Association for Computational Linguistics (Volume 1: Long Papers)](https://aclanthology.org/volumes/P16-1/).

**远程监督关系抽取**已经广泛地应用于从**文本**中发现**新型的关系事实**. 然而, 远程监督不可避免的伴随着**错误标注**的问题, 这些**嘈杂的数据**将大大损害关系抽取的性能.

**基于语句级别选择性注意力机制的关系出抽取神经网络模型**能够缓解**远程监督关系抽取**的**错误标签**问题, 该模型使用**卷机神经网络**来**嵌入句子的语义**. 之后, 使用**语句级别选择性注意力**来**动态地降低嘈杂实例 (句子) 的权重**.

实验结果证明, 该模型可以充分利用每个句子的所有信息, 有效的减少了错误标记实例 (句子) 的影响.

### **介绍**

最近几年, 各种大型知识库 (**Freebase**, **DBpedia**, **YAGO**) 已经被建立和广泛地应用于许多**自然语言处理** (natural language processing, NLP) 任务, 包括 **web search** 和 **question answering**. 这些知识库是由大量三元组 (格式为 (*Microsoft*, *founder*, *Bill Gates*)) 组成的.

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

进一步, PCNN (Zeng et al., 2015)[<sup>4</sup>](#4), 是一个 **CNN** 的变体, 采用了分段 Max 池化操作来进行关系抽取, 每一个卷积输出 $p_i$ 被头实体和尾实体划分成三个片段 $(p_{i1},p_{i2},p_{i3})$. **最大池化过程**分别在三个片段中执行. 定义如下:

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

#### 面向多实例的选择性注意力机制

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

#### 优化和实现细节

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

使用 **word2vec**[<sup>9</sup>](#9) 工具在 **NYT 语料库**训练**词嵌入**. 将**语料库**中**出现超过 100 次的单词**保留为**词汇**. 当一个实体有多个单词时, **连接** (**concatenate**) 它的单词.

##### 参数设置

在**训练集**上使用**三折交叉验证** (**three-fold validation**) 调整模型, 使用网格搜索 **(grid search)** 确定最优参数.

对于**训练**, 将**所有训练数据**的**迭代次数**设置为 **25**.

最优超参数设置如下:

|参数|值|
|:-:|:-:|
|卷积窗口大小  $l$|3|
|句子表示维度  $d^c$|230|
|词向量维度  $d^a$|50|
|位置向量维度  $d^b$|5|
|训练批次大小  $B$|160|
|学习率  $\lambda$|0.01|
|Dropout probability  $p$|0.5|

#### 选择性注意力机制的有效性验证

为了证明`语句级别选择性注意力机制`的有效性, 通过`保留评估` ( **held-out evaluation**) 比较不同的方法. 选择 `Zeng` 等人[<sup>4</sup>](#4)[<sup>6</sup>](#6)提出的`卷积神经网路模型` `CNN` 及其变种模型 `PCNN` 作为句子编码器 (implement them by ourselves which achieve comparable results as the authors reported). 作者将`两种不同类型`的`卷积神经网络`分别与`句子级别注意力机制 ATT`、`ATT 的基线版本 AVE` (在该版本中, `每个实例集合的向量`表示为`集合内部实例的平均向量`) 及 Zeng 等人[<sup>4</sup>](#4)提出的`多实例学习方法 ONE` 进行了结合, 并比较了它们的表现.

---

**句子编码器**:

1. the **CNN** model proposed in (Zeng et al., 2014)[<sup>6</sup>](#6)

2. the **PCNN** model proposed in (Zeng et al., 2015)[<sup>4</sup>](#4)

比较了**两种 CNN**, 它们**带有句子级别注意力机制的版本 (ATT)**, 它们的**朴素版本 (AVE)**, 它们的**多实例学习方法**[<sup>4</sup>](#4) (the at-least-one multi-instance learning, ONE) 的**表现**.

---

`Precion/recall curves` of `CNN`, `CNN+ONE`, `CNN+AVE`, `CNN+ATT`

![](https://cos.luyf-lemon-love.space/images/20221020185854.png)

`Precion/recall curves` of `PCNN`, `PCNN+ONE`, `PCNN+AVE`, `PCNN+ATT`

![](https://cos.luyf-lemon-love.space/images/20221020185913.png)

从上图, 作者得到了如下`观察结果`:

1. 对于 `CNN` 和 `PCNN`, `ONE` 方法与 `CNN/PCNN` 相比`具有更好的性能`. 原因在于`原始的基于远程监督得到的训练数据`包含`大量的噪声数据`, 而`噪声数据`会损害`关系抽取的性能`. **`ONE 方法`引入`多实例学习`, 这`在一定程度上`减缓了该问题.**

2. 对于 `CNN` 和 `PCNN`, 与 `CNN/PCNN` 相比, `AVE 方法`对`关系抽取模型`的`效果提升`是有作用的. 这表明`考虑更多的实例`有利于`关系抽取`, 因为`噪声信息`可以通过`信息的互补`来`减少负面影响`, **`更多的实例也带来了更多的信息`.**

3. 对于 `CNN` 和 `PCNN`, `AVE 方法`与 `ONE 方法`相比具有`相似`的性能. 这说明, 尽管 `AVE` 方法引入了`更多的实例信息`, 但由于它将`每个句子`赋予`同等的权重`, 它也会`从错误标注的语句中得到负面的噪声信息`, 从而`损害`关系抽取的性能. **所以 `AVE` 方法与 `ONE` 方法`难以分出优劣`.**

4. 对于 `CNN` 和 `PCNN`, 与包括 `AVE` 方法在内的`其他方法`相比, `ATT 方法`在`整个召回范围内`实现了`最高的精度`. 它表明, 所提出的**选择性注意力机制**是有益的. 它`可以有效地滤除无意义的句子`, 解决基于远程监督的关系抽取中的错误标注问题, **并尽可能地充分利用每一个实例的信息进行关系抽取.**

#### 实例数量的影响分析

在`原始测试数据集`中, 有 `74,857` 个实体对`仅对应于一个句子`, 几乎占所有实体对的 `3/4`. 由于`选择性注意力机制的优势`在于`处理包含多个实例的实体对`, 所以实验比较了 `CNN/PCNN+ONE`、`CNN/PCNN+AVE`、以及采用了`注意力机制`的 `CNN/PCNN+ATT` 在`具有不同实例数量的实体对集合`上的表现. 具体有以下 `3` 个实验场景.

- **One**: 对于`每个测试实体对`, `随机选择`其对应的实例集合中的`一个实例`, 并将`这个实例`用作关系预测.

- **Two**: 对于`每个测试实体对`, `随机选择`其对应的实例集合中的`两个实例`, 并将`这两个实例`用作关系预测.

- **All**: 对于`每个测试实体对`, 使用其对应的实例集合中的`所有实例`进行`关系预测`.

**值得注意的是**, 在训练过程中, **`使用了所有实例`**. 实验汇报了`所有预测中评分最高的 N 项预测`的`预测精度 P@N`, 具体有 `P@100`、`P@200`、`P@300` 及它们的`平均值`. 各个模型`在实体对拥有不同实例数目情况下`的 `P@N 的效果对比`如下表所示.

![](https://cos.luyf-lemon-love.space/images/20221020203352.png)

从上表中, 可以观察到:

1. 对于 `CNN` 和 `PCNN`, `ATT 方法`在`所有测试设置`中`均达到最佳性能`. 它表明了`句子级选择性注意力机制`对于`多实例学习`的`有效性`.

2. 对于 `CNN` 和 `PCNN`, `AVE 方法`在 `One` 测试设置下, `效果与 ATT 方法相当`. 然而, 当`每个实体对`的`测试实例数量`增加时, `AVE 方法的性能`几乎没有改善. 随着`实例的增加`, 它甚至在 `P@100`、`P@200` 中`逐渐下降`. 原因在于, 由于 `AVE` 方法`对每个实例同等看待`, `实例包含的不表达任何关系的噪声数据`对于`关系抽取`的表现`会产生负面影响`.

3. 在 `One` 测试设置下, `CNN+AVE` 和 `CNN+ATT` 与 `CNN+ONE` 相比有 `5 ～ 8` 个百分点的改进. `每个实体对`在这个测试设置中`只有一个实例`, 这些方法的`唯一区别`来自`训练方式的不同`. 因此, 实验结果表明`利用所有的实例会带来更多的信息`, 尽管这也可能`带来一些额外的噪声`. **`这些附带的信息`在训练过程中`提升了模型效果`.**

4. 对于 `CNN` 和 `PCNN`, `ATT 方法`在 `Two` 和 `All` 测试设置中`优于`其他两个基线 (over `5%` and `9%`). 这表明, 通过`考虑更多有用的信息`, `CNN+ATT 排名较高的关系事实`更可靠, 更有利于`关系提取`.

#### 与基于人工特征工程的方法的性能比较

为了`验证`所提出的方法, 作者选择了`以下 3 种基于人工特征的方法`来进行`性能比较`.

- **Mintz** (Mintz et al., 2009) 是一个`传统的基于远程监督`的模型.

- **MultiR** (Hoffmann et al., 2011) 提出了`一个概率图模型`用于`多实例学习`, 它的特点`在于可以处理关系类型之间的重合`.

- **MIML** (Surdeanu et al., 2012) 同时考虑了`多实例`和`多关系类型`两种情况 (即`每个实体对`可能有`多个句子`, 也可能有`多个关系类型`).

>We implement them with the source codes released by the authors.

每个方法的`精度-召回率曲线`如下图所示.

![](https://cos.luyf-lemon-love.space/images/20221020203439.png)

从上图中, 可以观察到:

1. 在`整个召回率范围`内, `CNN/PCNN+ATT` **显著优于**所有基于人工特征的方法. 当`召回率 > 0.1` 时, `基于特征的方法`的性能`迅速下降`. 相比之下, 在`召回率达到约 0.3 之前`, 该论文的模型`都具有合理的准确率`. 这表明`人工设计的特征`不能简洁地`表达实例的语义含义`, 而`自然语言处理工具`带来的`错误`则会`损害`关系抽取的性能. 相比之下, 可以`自主学习每个实例向量表示`的 `CNN/PCNN+ATT 模型`可以很好地`表达每个实例的语义信息`.

2. 在`整个召回率范围`内, `PCNN+ATT` 与 `CNN+ATT` 相比`表现要好得多`. 这意味着`选择性注意力机制`可以很好地`考虑所有实例的全局信息`, 但无法使模型`对于单个实例`的理解和表示变好. 因此, 如果有`更好的句子编码器`, 那么`模型的性能`可以`进一步提高`.

#### 案例分析

下表显示了`测试数据`中`选择性注意力机制`的`两个示例`. `对于每个关系`, 展示了其对应的`拥有高注意力权值的句子`和`拥有低注意力权值的句子`, 并且对`每个实体对`都进行了`加粗显示`.

![](https://cos.luyf-lemon-love.space/images/20221020203630.png)

>From the table we find that: `The former example` is related to `the relation employer of`. `The sentence with low attention weight` does not express the relation between two entities, while `the high one` shows that **`Mel Karmazin is the chief executive of Sirius Satellite Radio`**. `The later example` is related to `the relation place of birth`. `The sentence with low attention weight` expresses `where Ernst Haefliger is died in`, while `the high one` expresses `where he is born in`.

### Conclusion and Future Works

>In this paper, we develop `CNN with sentence-level selective attention`. Our model can `make full use of all informative sentences` and `alleviate the wrong labelling problem for distant supervised relation extraction`. In experiments, we `evaluate our model on relation extraction task`. The experimental results show that `our model significantly and consistently outperforms state-of-the-art feature-based methods and neural network methods`.

---

>In the future, we will explore the following directions:
>
> - Our model `incorporates multi-instance learning with neural network via instance-level selective attention`. `It can be used in not only distant supervised relation extraction but also other multi-instance learning tasks.` We will `explore our model in other area` such as `text categorization`.
>
> - `CNN` is one of the effective neural networks for neural relation extraction. Researchers also propose many other neural network models for relation extraction. In the future, we will `incorporate our instance-level selective attention technique with those models for relation extraction`.

## 代码实现

### 文件

**代码仓库地址**: https://github.com/LuYF-Lemon-love/susu-knowledge-graph/tree/main/neural-relation-extraction/C%2B%2B .

```shell
$ tree
.
├── CNN+ATT
│   ├── clean.sh
│   ├── init.h
│   ├── output
│   │   ├── attention_weights.txt
│   │   ├── conv_1d.txt
│   │   ├── position_vec.txt
│   │   ├── pr.txt
│   │   ├── relation_matrix.txt
│   │   └── word2vec.txt
│   ├── run.sh
│   ├── test.cpp
│   ├── test.h
│   └── train.cpp
├── data
│   ├── relation.txt
│   ├── test.txt
│   ├── train.txt
│   └── vec.bin
├── data.zip
├── papers
│   └── Neural Relation Extraction with Selective Attention over Instances.pdf
└── README.md

4 directories, 19 files
$
```

### 数据

#### [NYT10](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/blob/main/neural-relation-extraction/C%2B%2B/data.zip)

The original data of NYT10 can be downloaded from:

Relation Extraction:  NYT10 is originally released by the paper "Sebastian Riedel, Limin Yao, and Andrew McCallum. Modeling relations and their mentions without labeled text." [[Download]](http://iesl.cs.umass.edu/riedel/ecml/)

Pre-Trained Word Vectors are learned from New York Times Annotated Corpus (LDC Data LDC2008T19), which should be obtained from LDC (https://catalog.ldc.upenn.edu/LDC2008T19).

The train set is generated by merging all training data of manual and held-out datasets, deleted those data that have overlap with the test set, and used the remain one as our training data.

To run the code, the dataset should be put in the folder **data/** using the following format, containing four files

- **train.txt**: training file, format (fb_mid_e1, fb_mid_e2, e1_name, e2_name, relation, sentence).

- **test.txt**: test file, same format as train.txt.

- **relation.txt**: all relations, one per line.

- **vec.bin**: the pre-train word embedding file.

```shell
$ tree
.
├── relation.txt
├── test.txt
├── train.txt
└── vec.bin

0 directories, 4 files
$ head relation.txt 
NA
/location/neighborhood/neighborhood_of
/location/fr_region/capital
/location/cn_province/capital
/location/in_state/administrative_capital
/base/locations/countries/states_provinces_within
/business/company/founders
/location/country/languages_spoken
/people/person/place_of_birth
/people/deceased_person/place_of_death
$ head test.txt 
m.01l443l	m.04t_bj	dave_holland	barry_altschul	NA	the occasion was suitably exceptional : a reunion of the 1970s-era sam rivers trio , with dave_holland on bass and barry_altschul on drums .	###END###
m.01l443l	m.04t_bj	dave_holland	barry_altschul	NA	tonight he brings his energies and expertise to the miller theater for the festival 's thrilling finale : a reunion of the 1970s sam rivers trio , with dave_holland on bass and barry_altschul on drums .	###END###
m.04t_bj	m.01l443l	barry_altschul	dave_holland	NA	the occasion was suitably exceptional : a reunion of the 1970s-era sam rivers trio , with dave_holland on bass and barry_altschul on drums .	###END###
m.04t_bj	m.01l443l	barry_altschul	dave_holland	NA	tonight he brings his energies and expertise to the miller theater for the festival 's thrilling finale : a reunion of the 1970s sam rivers trio , with dave_holland on bass and barry_altschul on drums .	###END###
m.0frkwp	m.04mh_g	ruth	little_neck	NA	shapiro -- ruth of little_neck , ny .	###END###
m.04mh_g	m.0frkwp	little_neck	ruth	NA	shapiro -- ruth of little_neck , ny .	###END###
m.02bv2x	m.01w7tkh	henry	nicole	NA	cherished grandmother of henry , stephanie , harrison and jill shapiro and nicole and eric beinhorn .	###END###
m.01w7tkh	m.02bv2x	nicole	henry	NA	cherished grandmother of henry , stephanie , harrison and jill shapiro and nicole and eric beinhorn .	###END###
m.0124lx	m.07hjs9	lewis	john_gross	NA	beloved wife of the late dr. frederick e. lane , and mother of joseph , ila lane gross , lewis , and edward ; mother-in-law of bobbi , john_gross , nancy , and judy .	###END###
m.0124lx	m.07hjs9	lewis	john_gross	NA	beloved wife of the late dr. frederick e. lane , and mother of joseph , ila lane gross , lewis , and edward ; mother-in-law of bobbi , john_gross , nancy , and judy .	###END###
$ head train.txt 
m.0ccvx	m.05gf08	queens	belle_harbor	/location/location/contains	sen. charles e. schumer called on federal safety officials yesterday to reopen their investigation into the fatal crash of a passenger jet in belle_harbor , queens , because equipment failure , not pilot error , might have been the cause .	###END###
m.0ccvx	m.05gf08	queens	belle_harbor	/location/location/contains	but instead there was a funeral , at st. francis de sales roman catholic church , in belle_harbor , queens , the parish of his birth .	###END###
m.0ccvx	m.05gf08	queens	belle_harbor	/location/location/contains	rosemary antonelle , the daughter of teresa l. antonelle and patrick antonelle of belle_harbor , queens , was married yesterday afternoon to lt. thomas joseph quast , a son of peggy b. quast and vice adm. philip m. quast of carmel , calif. .	###END###
m.0ccvx	m.05gf08	queens	belle_harbor	/location/location/contains	one was for st. francis de sales roman catholic church in belle_harbor ; another board studded with electromechanical magnets will go under the pipes of an organ at the evangelical lutheran church of christ in rosedale , queens .	###END###
m.0ccvx	m.05gf08	queens	belle_harbor	/location/location/contains	the firefighter , whom a fire department official identified as joseph moore , of belle_harbor , queens , was taken to newyork-presbyterian\/weill cornell hospital , where he was in critical but stable condition last night , the police said .	###END###
m.0ccvx	m.05gf08	queens	belle_harbor	/location/location/contains	in st. francis de sales roman catholic church in belle_harbor , queens , the second verse of the opening hymn , '' be not afraid , '' seemed to connect katrina and sept. 11 : '' if you pass through raging waters in the sea , you shall not drown .	###END###
m.0ccvx	m.05gf08	queens	belle_harbor	/location/location/contains	on nov. 12 , while walking his dog near his home in belle_harbor , queens , he saw a passenger plane plunge to the ground .	###END###
m.0ccvx	m.05gf08	queens	belle_harbor	/location/location/contains	colm j. neilson , of belle_harbor , queens , said he thought the conductors ' role was overrated . ''	###END###
m.0ccvx	m.05gf08	queens	belle_harbor	/location/location/contains	she is a daughter of marion i. rabbin and dr. murvin rabbin of belle_harbor , queens .###END###
m.0ccvx	m.05gf08	queens	belle_harbor	/location/location/contains	he is a son of vera and william lichtenberg of belle_harbor , queens .	###END###
$
```

### [CNN+ATT](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/tree/main/neural-relation-extraction/C%2B%2B/CNN%2BATT)

- [init.h](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/blob/main/neural-relation-extraction/C%2B%2B/CNN%2BATT/init.h): 该 C++ 文件用于初始化, 即读取训练数据和测试数据.

- [test.h](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/blob/main/neural-relation-extraction/C%2B%2B/CNN%2BATT/test.h): 该 C++ 文件用于模型测试.

- [train.cpp](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/blob/main/neural-relation-extraction/C%2B%2B/CNN%2BATT/train.cpp): 该 C++ 文件用于模型训练.

- [test.cpp](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/blob/main/neural-relation-extraction/C%2B%2B/CNN%2BATT/test.cpp): 该 C++ 文件用于模型测试.

- [run.sh](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/blob/main/neural-relation-extraction/C%2B%2B/CNN%2BATT/run.sh): 该 Shell 脚本用于模型训练和模型测试.

- [clean.sh](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/blob/main/neural-relation-extraction/C%2B%2B/CNN%2BATT/clean.sh): 该 Shell 脚本用于清理临时文件.

```shell
$ tree
.
├── clean.sh
├── init.h
├── output
│   ├── attention_weights.txt
│   ├── conv_1d.txt
│   ├── position_vec.txt
│   ├── pr.txt
│   ├── relation_matrix.txt
│   └── word2vec.txt
├── run.sh
├── test.cpp
├── test.h
└── train.cpp

1 directory, 12 files
$
```

#### [init.h](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/blob/main/neural-relation-extraction/C%2B%2B/CNN%2BATT/init.h)

```c++
// init.h
//
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>
// 
// 该 C++ 文件用于初始化, 即读取训练数据和测试数据
//
// prerequisites:
//     ../data/vec.bin
//     ../data/relation.txt
//     ../data/train.txt
//     ../data/test.txt

// ##################################################
// 包含标准库
// ##################################################

#ifndef INIT_H
#define INIT_H

#include <cstdio>          // FILE, fscanf, fopen, fclose, fgetc, feof, fread
#include <cstdlib>         // malloc, calloc, free, rand, RAND_MAX
#include <cmath>           // exp, fabs
#include <cstring>         // memcpy
#include <cfloat>          // FLT_MAX
#include <cassert>         // assert
#include <pthread.h>       // pthread_create, pthread_join, pthread_mutex_t
#include <sys/time.h>      // timeval, gettimeofday
#include <vector>          // std::vector, std::vector::resize, std::vector::operator[], std::vector::push_back, std::vector::size
#include <map>             // std::map, std::map::operator[], std::map::clear, std::map::size
#include <string>          // std::string, std::string::c_str
#include <algorithm>       // std::sort, std::min
#include <utility>         // std::make_pair

// ##################################################
// 声明和定义超参数变量
// ##################################################

#define INT int
#define REAL float

// batch: batch size
// num_threads: number of threads
// alpha: learning rate
// current_rate: init rate of learning rate
// reduce_epoch: reduce of init rate of learning rate per epoch
// epochs: epochs
// limit: 限制句子中 (头, 尾) 实体相对每个单词的最大距离
// dimension_pos: position dimension
// window: window size
// dimension_c: sentence embedding size
// dropout_probability: dropout probability
// output_model: 是否保存模型, 1: 保存模型, 0: 不保存模型
// note: 保存模型时, 文件名的额外的信息, ("./output/word2vec" + note + ".txt")
// data_path: folder of data
// output_path: folder of outputing results (precion/recall curves) and models
INT batch = 40;
INT num_threads = 32;
REAL alpha = 0.00125;
REAL current_rate = 1.0;
REAL reduce_epoch = 0.98;
INT epochs = 25;
INT limit = 30;
INT dimension_pos = 5;
INT window = 3;
INT dimension_c = 230;
REAL dropout_probability = 0.5;
INT output_model = 0;
std::string note = "";
std::string data_path = "../data/";
std::string output_path = "./output/";

// ##################################################
// 声明和定义保存训练数据和测试数据的变量
// ##################################################

// word_total: 词汇总数, 包括 "UNK"
// dimension: 词嵌入维度
// word_vec (word_total * dimension): 词嵌入矩阵
// word2id (word_total): word2id[name] -> name 对应的词汇 id
INT word_total, dimension;
REAL *word_vec;
std::map<std::string, INT> word2id;

// relation_total: 关系总数
// id2relation (relation_total): id2relation[id] -> id 对应的关系名
// relation2id (relation_total): relation2id[name] -> name 对应的关系 id
INT relation_total;
std::vector<std::string> id2relation;
std::map<std::string, INT> relation2id;

// position_min_head: 保存数据集 (训练集, 测试集) 句子中头实体相对每个单词的最小距离, 理论上取值范围为 -limit
// position_max_head: 保存数据集 (训练集, 测试集) 句子中头实体相对每个单词的最大距离, 理论上取值范围为 limit
// position_min_tail: 保存数据集 (训练集, 测试集) 句子中尾实体相对每个单词的最小距离, 理论上取值范围为 -limit
// position_max_tail: 保存数据集 (训练集, 测试集) 句子中尾实体相对每个单词的最大距离, 理论上取值范围为 limit
// position_total_head = position_max_head - position_min_head + 1
// position_total_tail = position_max_tail - position_min_tail + 1
INT position_min_head, position_max_head, position_min_tail, position_max_tail;
INT position_total_head, position_total_tail;

// bags_train: key -> (头实体 + "\t" + 尾实体 + "\t" + 关系名), value -> 句子索引 (训练文件中该句子的位置)
// train_relation_list: 保存训练集每个句子的关系 id, 按照训练文件句子的读取顺序排列
// train_length: 保存训练集每个句子的单词个数, 按照训练文件句子的读取顺序排列
// train_sentence_list: 保存训练集中的句子, 按照训练文件句子的读取顺序排列
// train_position_head: 保存训练集每个句子的头实体相对每个单词的距离, 理论上取值范围为 [0, 2 * limit], 其中头实体对应单词的取值为 limit
// train_position_tail: 保存训练集每个句子的尾实体相对每个单词的距离, 理论上取值范围为 [0, 2 * limit], 其中尾实体对应单词的取值为 limit
std::map<std::string, std::vector<INT> > bags_train;
std::vector<INT> train_relation_list, train_length;
std::vector<INT *> train_sentence_list, train_position_head, train_position_tail;

// bags_test: key -> (头实体 + "\t" + 尾实体), value -> 句子索引 (测试文件中该句子的位置)
// test_relation_list: 保存测试集每个句子的关系 id, 按照测试文件句子的读取顺序排列
// test_length: 保存测试集每个句子的单词个数, 按照测试文件句子的读取顺序排列
// test_sentence_list: 保存测试集中的句子, 按照测试文件句子的读取顺序排列
// test_position_head: 保存测试集每个句子的头实体相对每个单词的距离, 理论上取值范围为 [0, 2 * limit], 其中头实体对应单词的取值为 limit
// test_position_tail: 保存测试集每个句子的尾实体相对每个单词的距离, 理论上取值范围为 [0, 2 * limit], 其中尾实体对应单词的取值为 limit
std::map<std::string, std::vector<INT> > bags_test;
std::vector<INT> test_relation_list, test_length;
std::vector<INT *> test_sentence_list, test_position_head, test_position_tail;

// ##################################################
// 声明和定义模型的权重矩阵
// ##################################################

// position_vec_head (position_total_head * dimension_pos): 头实体的位置嵌入矩阵
// position_vec_tail (position_total_tail * dimension_pos): 尾实体的位置嵌入矩阵
REAL *position_vec_head, *position_vec_tail;

// conv_1d_word (dimension_c * window * dimension): 一维卷积的权重矩阵 (词嵌入)
// conv_1d_position_head (dimension_c * window * dimension_pos): 一维卷积的权重矩阵 (头实体的位置嵌入)
// conv_1d_position_tail (dimension_c * window * dimension_pos): 一维卷积的权重矩阵 (尾实体的位置嵌入)
// conv_1d_bias (dimension_c): 一维卷积的偏置向量
REAL *conv_1d_word, *conv_1d_position_head, *conv_1d_position_tail, *conv_1d_bias;

// attention_weights (relation_total * dimension_c * dimension_c): 注意力权重矩阵
std::vector<std::vector<std::vector<REAL> > > attention_weights;

// relation_matrix (relation_total * dimension_c): the representation matrix of relation
// relation_matrix_bias (relation_total): the bias vector of the representation matrix of relation
REAL *relation_matrix, *relation_matrix_bias;

// ##################################################
// 声明和定义模型的权重矩阵的副本, 用于每一训练批次计算损失值
// ##################################################

// word_vec_copy (word_total * dimension): 词嵌入矩阵副本, 由于使用多线程训练模型, 该副本用于每一训练批次计算损失值
// position_vec_head_copy (position_total_head * dimension_pos): 头实体的位置嵌入矩阵副本, 由于使用多线程训练模型, 该副本用于每一训练批次计算损失值
// position_vec_tail_copy (position_total_tail * dimension_pos): 尾实体的位置嵌入矩阵副本, 由于使用多线程训练模型, 该副本用于每一训练批次计算损失值
REAL *word_vec_copy, *position_vec_head_copy, *position_vec_tail_copy;

// conv_1d_word_copy (dimension_c * window * dimension): 一维卷积的权重矩阵 (词嵌入) 副本, 由于使用多线程训练模型, 该副本用于每一训练批次计算损失值
// conv_1d_position_head_copy (dimension_c * window * dimension_pos): 一维卷积的权重矩阵 (头实体的位置嵌入) 副本, 由于使用多线程训练模型, 该副本用于每一训练批次计算损失值
// conv_1d_position_tail_copy (dimension_c * window * dimension_pos): 一维卷积的权重矩阵 (尾实体的位置嵌入) 副本, 由于使用多线程训练模型, 该副本用于每一训练批次计算损失值
// conv_1d_bias_copy (dimension_c): 一维卷积的偏置向量副本, 由于使用多线程训练模型, 该副本用于每一训练批次计算损失值
REAL *conv_1d_word_copy, *conv_1d_position_head_copy, *conv_1d_position_tail_copy, *conv_1d_bias_copy;

// attention_weights_copy (relation_total * dimension_c * dimension_c): 注意力权重矩阵副本, 由于使用多线程训练模型, 该副本用于每一训练批次计算损失值
std::vector<std::vector<std::vector<REAL> > > attention_weights_copy;

// relation_matrix_copy (relation_total * dimension_c): the copy of the representation matrix of relation, 由于使用多线程训练模型, 该副本用于每一训练批次计算损失值
// relation_matrix_bias_copy (relation_total): the copy of the bias vector of the representation matrix of relation, 由于使用多线程训练模型, 该副本用于每一训练批次计算损失值
REAL *relation_matrix_copy, *relation_matrix_bias_copy;

// 初始化函数, 即读取训练数据和测试数据
void init() {
	
	printf("\n##################################################\n\nInit start...\n\n");

	INT tmp;

	// 读取预训练词嵌入
	FILE *f = fopen((data_path + "vec.bin").c_str(), "rb");
	tmp = fscanf(f, "%d", &word_total);
	tmp = fscanf(f, "%d", &dimension);
	word_vec = (REAL *)malloc((word_total + 1) * dimension * sizeof(REAL));
	word2id["UNK"] = 0;
	for (INT i = 1; i <= word_total; i++) {
		std::string name = "";
		while (1) {
			char ch = fgetc(f);
			if (feof(f) || ch == ' ') break;
			if (ch != '\n') name = name + ch;
		}
		word2id[name] = i;

		long long last = i * dimension;
		REAL sum = 0;
		for (INT a = 0; a < dimension; a++) {
			tmp = fread(&word_vec[last + a], sizeof(REAL), 1, f);
			sum += word_vec[last + a] * word_vec[last + a];
		}
		sum = sqrt(sum);
		for (INT a = 0; a < dimension; a++)
			word_vec[last + a] = word_vec[last + a] / sum;
	}
	word_total += 1;
	fclose(f);

	// 读取 relation.txt 文件
	char buffer[1000];
	f = fopen((data_path + "relation.txt").c_str(), "r");
	while (fscanf(f, "%s", buffer) == 1) {
		relation2id[(std::string)(buffer)] = relation_total++;
		id2relation.push_back((std::string)(buffer));
	}
	fclose(f);
	
	// 读取训练文件 (train.txt)
	position_min_head = 0;
	position_max_head = 0;
	position_min_tail = 0;
	position_max_tail = 0;
	f = fopen((data_path + "train.txt").c_str(), "r");
	while (fscanf(f, "%s", buffer) == 1)  {
		std::string e1 = buffer;
		tmp = fscanf(f, "%s", buffer);
		std::string e2 = buffer;

		tmp = fscanf(f, "%s", buffer);
		std::string head_s = (std::string)(buffer);
		tmp = fscanf(f, "%s", buffer);
		std::string tail_s = (std::string)(buffer);
			
		tmp = fscanf(f, "%s", buffer);
		bags_train[e1 + "\t" + e2 + "\t" + (std::string)(buffer)].push_back(train_relation_list.size());
		INT relation_id = relation2id[(std::string)(buffer)];

		INT len_s = 0, head_pos = 0, tail_pos = 0;
		std::vector<INT> sentence;
		while (fscanf(f, "%s", buffer) == 1) {
			std::string word = buffer;
			if (word == "###END###") break;
			INT word_id = word2id[word];
			if (word == head_s) head_pos = len_s;
			if (word == tail_s) tail_pos = len_s;
			len_s++;
			sentence.push_back(word_id);
		}

		train_relation_list.push_back(relation_id);
		train_length.push_back(len_s);
		
		INT *sentence_ptr = (INT *)calloc(len_s, sizeof(INT));
		INT *sentence_head_pos = (INT *)calloc(len_s, sizeof(INT));
		INT *sentence_tail_pos = (INT *)calloc(len_s, sizeof(INT));
		for (INT i = 0; i < len_s; i++) {
			sentence_ptr[i] = sentence[i];
			sentence_head_pos[i] = head_pos - i;
			sentence_tail_pos[i] = tail_pos - i;
			if (sentence_head_pos[i] >= limit) sentence_head_pos[i] = limit;
			if (sentence_tail_pos[i] >= limit) sentence_tail_pos[i] = limit;
			if (sentence_head_pos[i] <= -limit) sentence_head_pos[i] = -limit;
			if (sentence_tail_pos[i] <= -limit) sentence_tail_pos[i] = -limit;
			if (sentence_head_pos[i] > position_max_head) position_max_head = sentence_head_pos[i];
			if (sentence_tail_pos[i] > position_max_tail) position_max_tail = sentence_tail_pos[i];
			if (sentence_head_pos[i] < position_min_head) position_min_head = sentence_head_pos[i];
			if (sentence_tail_pos[i] < position_min_tail) position_min_tail = sentence_tail_pos[i];
		}

		train_sentence_list.push_back(sentence_ptr);
		train_position_head.push_back(sentence_head_pos);
		train_position_tail.push_back(sentence_tail_pos);
	}
	fclose(f);

	// 读取测试文件 (test.txt)
	f = fopen((data_path + "test.txt").c_str(), "r");
	while (fscanf(f, "%s", buffer)==1)  {
		std::string e1 = buffer;
		tmp = fscanf(f, "%s", buffer);
		std::string e2 = buffer;

		tmp = fscanf(f, "%s", buffer);
		std::string head_s = (std::string)(buffer);
		tmp = fscanf(f, "%s", buffer);
		std::string tail_s = (std::string)(buffer);

		tmp = fscanf(f, "%s", buffer);
		bags_test[e1 + "\t" + e2].push_back(test_relation_list.size());	
		INT relation_id = relation2id[(std::string)(buffer)];

		INT len_s = 0 , head_pos = 0, tail_pos = 0;
		std::vector<INT> sentence;
		while (fscanf(f, "%s", buffer) == 1) {
			std::string word = buffer;
			if (word=="###END###") break;
			INT word_id = word2id[word];
			if (head_s == word) head_pos = len_s;
			if (tail_s == word) tail_pos = len_s;
			len_s++;
			sentence.push_back(word_id);
		}

		test_relation_list.push_back(relation_id);
		test_length.push_back(len_s);

		INT *sentence_ptr=(INT *)calloc(len_s, sizeof(INT));
		INT *sentence_head_pos=(INT *)calloc(len_s, sizeof(INT));
		INT *sentence_tail_pos=(INT *)calloc(len_s, sizeof(INT));
		for (INT i = 0; i < len_s; i++) {
			sentence_ptr[i] = sentence[i];
			sentence_head_pos[i] = head_pos - i;
			sentence_tail_pos[i] = tail_pos - i;
			if (sentence_head_pos[i] >= limit) sentence_head_pos[i] = limit;
			if (sentence_tail_pos[i] >= limit) sentence_tail_pos[i] = limit;
			if (sentence_head_pos[i] <= -limit) sentence_head_pos[i] = -limit;
			if (sentence_tail_pos[i] <= -limit) sentence_tail_pos[i] = -limit;
			if (sentence_head_pos[i] > position_max_head) position_max_head = sentence_head_pos[i];
			if (sentence_tail_pos[i] > position_max_tail) position_max_tail = sentence_tail_pos[i];
			if (sentence_head_pos[i] < position_min_head) position_min_head = sentence_head_pos[i];
			if (sentence_tail_pos[i] < position_min_tail) position_min_tail = sentence_tail_pos[i];
		}

		test_sentence_list.push_back(sentence_ptr);
		test_position_head.push_back(sentence_head_pos);
		test_position_tail.push_back(sentence_tail_pos);
	}
	fclose(f);

	// 将 train_position_head, train_position_tail, test_position_head, test_position_tail 的元素值转换到 [0, 2 * limit] 范围内
	for (INT i = 0; i < train_position_head.size(); i++) {
		INT len_s = train_length[i];
		INT *position = train_position_head[i];
		for (INT j = 0; j < len_s; j++)
			position[j] = position[j] - position_min_head;
		position = train_position_tail[i];
		for (INT j = 0; j < len_s; j++)
			position[j] = position[j] - position_min_tail;
	}

	for (INT i = 0; i < test_position_head.size(); i++) {
		INT len_s = test_length[i];
		INT *position = test_position_head[i];
		for (INT j = 0; j < len_s; j++)
			position[j] = position[j] - position_min_head;
		position = test_position_tail[i];
		for (INT j = 0; j < len_s; j++)
			position[j] = position[j] - position_min_tail;
	}

	position_total_head = position_max_head - position_min_head + 1;
	position_total_tail = position_max_tail - position_min_tail + 1;

	printf("训练数据和测试数据加载成功!\n\n");
}

// 打印一些重要的信息
void print_information() {
	std::string save_model[] = {"不会保存模型.", "将会保存模型."};

	printf("batch: %d\nnumber of threads: %d\nlearning rate: %.8f\n", batch, num_threads, alpha);
	printf("init_rate: %.2f\nreduce_epoch: %.2f\nepochs: %d\n\n", current_rate, reduce_epoch, epochs);
	printf("word_total: %d\nword dimension: %d\n\n", word_total, dimension);
	printf("limit: %d\nposition_total_head: %d\nposition_total_tail: %d\ndimension_pos: %d\n\n",
		limit, position_total_head, position_total_tail, dimension_pos);
	printf("window: %d\ndimension_c: %d\n\n", window, dimension_c);
	printf("relation_total: %d\ndropout_probability: %.2f\n\n", relation_total, dropout_probability);
	printf("%s\nnote: %s\n\n", save_model[output_model].c_str(), note.c_str());
	printf("folder of data: %s\n", data_path.c_str());
	printf("folder of outputing results (precion/recall curves) and models: %s\n\n", output_path.c_str());

	printf("number of training samples: %7d - average sentence number of per training sample: %.2f\n",
		INT(bags_train.size()), float(float(train_sentence_list.size()) / bags_train.size()));
	printf("number of testing samples:  %7d - average sentence number of per testing sample:  %.2f\n\n",
		INT(bags_test.size()), float(float(test_sentence_list.size()) / bags_test.size()));
	
	printf("Init end.\n\n");
}

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

// ##################################################
// 数学函数
// ##################################################

// 计算双曲正切函数（tanh）
REAL calc_tanh(REAL value) {
	if (value > 20) return 1.0;
	if (value < -20) return -1.0;
	REAL sinhx = exp(value) - exp(-value);
	REAL coshx = exp(value) + exp(-value);
	return sinhx / coshx;
}

// 返回取值为 [min, max) 的伪随机整数
INT get_rand_i(INT min, INT max) {
	INT d = max - min;
	INT res = rand() % d;
	if (res < 0)
		res += d;
	return res + min;
}

// 返回取值为 [min, max) 的伪随机浮点数 
REAL get_rand_u(REAL min, REAL max) {
	return min + (max - min) * rand() / (RAND_MAX + 1.0);
}

#endif
```

#### [test.h](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/blob/main/neural-relation-extraction/C%2B%2B/CNN%2BATT/test.h)

```c++
// test.h
//
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>
//
// 该 C++ 文件用于模型测试
//
// 输出 precion/recall curves
// output:
//     ./output/pr + note + .txt
//
// 输出模型 (可选)
// output:
//     ./output/word2vec + note + .txt
//     ./output/position_vec + note + .txt
//     ./output/conv_1d + note + .txt
//     ./output/attention_weights + note + .txt
//     ./output/relation_matrix + note + .txt

// ##################################################
// 包含标准库和头文件
// ##################################################

#ifndef TEST_H
#define TEST_H
#include "init.h"

// ##################################################
// 声明和定义变量
// ##################################################

// predict_relation_vector: 每一个元素的 key -> (头实体 + "\t" + 尾实体 + "\t" + 预测关系名)
// value 的 key -> (0 或 1, 0 表示关系预测错误, 1 表示关系预测正确)
// value 的 value -> 模型给出的该关系成立的概率
// 以模型给出的关系成立的概率降序排列
std::vector<std::pair<std::string, std::pair<INT,double> > > predict_relation_vector;

// num_test_non_NA: 计算测试集中样本数 (其中 relation 非 NA,每个样本包含 n 个句子, 每个句子包含相同的 head, relation (label), tail)
// bags_test_key: 保存 bags_test 的 key (头实体 + "\t" + 尾实体), 按照 bags_test 的迭代顺序
// thread_first_bags_test (num_threads + 1): 保存每个线程第一个样本在 bags_test_key 中的位置
// test_mutex: 互斥锁, 线程同步 predict_relation_vector 变量
INT num_test_non_NA;
std::vector<std::string> bags_test_key;
std::vector<INT> thread_first_bags_test;
pthread_mutex_t test_mutex;

struct timeval test_start, test_end;

// 为 std::sort() 定义比较函数
// 以模型给出的关系成立的概率降序排列, 用于 predict_relation_vector 变量
bool cmp_predict_probability(std::pair<std::string, std::pair<INT,double> > a,
	std::pair<std::string, std::pair<INT,double> >b)
{
    return a.second.second > b.second.second;
}

// 计算句子的一维卷积
std::vector<REAL> calc_conv_1d(INT *sentence, INT *test_position_head,
	INT *test_position_tail, INT sentence_length) {
	
	std::vector<REAL> conv_1d_result_k;
	conv_1d_result_k.resize(dimension_c, 0);
	
	for (INT i = 0; i < dimension_c; i++) {
		INT last_word = i * window * dimension;
		INT last_pos = i * window * dimension_pos;
		REAL max_pool_1d = -FLT_MAX;
		for (INT last_window = 0; last_window <= sentence_length - window; last_window++) {
			REAL sum = 0;
			INT total_word = 0;
			INT total_pos = 0;
			for (INT j = last_window; j < last_window + window; j++)  {
				INT last_word_vec = sentence[j] * dimension;
			 	for (INT k = 0; k < dimension; k++) {
			 		sum += conv_1d_word[last_word + total_word] * word_vec[last_word_vec + k];
			 		total_word++;
			 	}
			 	INT last_pos_head = test_position_head[j] * dimension_pos;
			 	INT last_pos_tail = test_position_tail[j] * dimension_pos;
			 	for (INT k = 0; k < dimension_pos; k++) {
			 		sum += conv_1d_position_head[last_pos + total_pos] * position_vec_head[last_pos_head + k];
			 		sum += conv_1d_position_tail[last_pos + total_pos] * position_vec_tail[last_pos_tail + k];
			 		total_pos++;
			 	}
			}

			// 对应于论文中的公式 (3), [x]_i = max(p_i), 其中 x \in R^{d^c}
			if (sum > max_pool_1d) max_pool_1d = sum;
		}
		conv_1d_result_k[i] = max_pool_1d + conv_1d_bias[i];
	}

	for (INT i = 0; i < dimension_c; i++)
		conv_1d_result_k[i] = calc_tanh(conv_1d_result_k[i]);
	return conv_1d_result_k;
}

// 单个线程内运行的任务
void* test_mode(void *thread_id) 
{
	INT id;
	id = (unsigned long long)(thread_id);
	INT left = thread_first_bags_test[id];
	INT right;
	if (id == num_threads-1)
		right = bags_test_key.size();
	else
		right = thread_first_bags_test[id + 1];

	// 保存样本的正确标签 (关系)
	std::map<INT,INT> sample_relation_list;

	for (INT i_sample = left; i_sample < right; i_sample++)
	{
		// 一维卷积部分
		sample_relation_list.clear();
		std::vector<std::vector<REAL> > conv_1d_result;
		INT bags_size = bags_test[bags_test_key[i_sample]].size();
		for (INT k = 0; k < bags_size; k++)
		{
			INT i = bags_test[bags_test_key[i_sample]][k];
			sample_relation_list[test_relation_list[i]] = 1;

			conv_1d_result.push_back(calc_conv_1d(test_sentence_list[i],
				test_position_head[i], test_position_tail[i], test_length[i]));
		}

		// 对应于论文中的公式 (8), e_i = x_iAr, 其中 r is the query vector associated with relation r which
		// indicates the representation of relation r, 也就是 predict 时, 需要用每一个关系依次查询.
		std::vector<float> result_final;
		result_final.resize(relation_total, 0.0);
		for (INT index_r = 0; index_r < relation_total; index_r++) {
			
			// 获取每一个句子的权重
			std::vector<REAL> weight;
			REAL weight_sum = 0;
			for (INT k = 0; k < bags_size; k++)
			{
				REAL s = 0;
				for (INT i_r = 0; i_r < dimension_c; i_r++) 
				{
					REAL temp = 0;
					for (INT i_x = 0; i_x < dimension_c; i_x++)
						temp += conv_1d_result[k][i_x] * attention_weights[index_r][i_x][i_r];
					s += temp * relation_matrix[index_r * dimension_c + i_r];
				}
				s = exp(s);
				weight.push_back(s);
				weight_sum += s;
			}

			for (INT k = 0; k < bags_size; k++)
				weight[k] /= weight_sum;
			
			// 获取 s, i.e., s indicates the representation of the sentence set
			std::vector<REAL> result_sentence;
			result_sentence.resize(dimension_c);
			for (INT i = 0; i < dimension_c; i++) 
				for (INT k = 0; k < bags_size; k++)
					result_sentence[i] += conv_1d_result[k][i] * weight[k];

			// 获取关系 (id 为 index_r) 成立的概率
			std::vector<REAL> result_final_r;
			double temp = 0;
			for (INT i_r = 0; i_r < relation_total; i_r++) {
				REAL s = 0;
				for (INT i_s = 0; i_s < dimension_c; i_s++)
					s +=  dropout_probability * result_sentence[i_s] *
						relation_matrix[i_r * dimension_c + i_s];
				s += relation_matrix_bias[i_r];
				s = exp(s);
				temp += s;
				result_final_r.push_back(s);
			}
			result_final[index_r] = result_final_r[index_r]/temp;
		}

		// 保存该测试样本各个关系 (非 NA) 成立的概率, 使用线程同步
		pthread_mutex_lock (&test_mutex);
		for (INT i_r = 1; i_r < relation_total; i_r++) 
		{
			predict_relation_vector.push_back(std::make_pair(bags_test_key[i_sample] + "\t" + id2relation[i_r],
				std::make_pair(sample_relation_list.count(i_r), result_final[i_r])));
		}
		pthread_mutex_unlock(&test_mutex);
	}
}

// 测试函数
void test() {

	printf("##################################################\n\nTest start...\n\n");

	gettimeofday(&test_start, NULL);

	num_test_non_NA = 0;
	bags_test_key.clear();
	thread_first_bags_test.clear();
	predict_relation_vector.clear();

	std::vector<INT> sample_sum;
	sample_sum.clear();
	for (std::map<std::string, std::vector<INT> >::iterator it = bags_test.begin();
		it != bags_test.end(); it++)
	{
		std::map<INT, INT> sample_relation_list;
		sample_relation_list.clear();
		for (INT i = 0; i < it->second.size(); i++)
		{
			INT pos = it->second[i];
			if (test_relation_list[pos] > 0)
				sample_relation_list[test_relation_list[pos]] = 1;
		}
		num_test_non_NA += sample_relation_list.size();
		bags_test_key.push_back(it->first);
		sample_sum.push_back(it->second.size());
	}

	for (INT i = 1; i < sample_sum.size(); i++)
		sample_sum[i] += sample_sum[i - 1];
	
	INT thread_id = 0;
	thread_first_bags_test.resize(num_threads + 1);
	for (INT i = 0; i < sample_sum.size(); i++)
		if (sample_sum[i] >= (sample_sum[sample_sum.size()-1] / num_threads) * thread_id)
		{
			thread_first_bags_test[thread_id] = i;
			thread_id += 1;
		}
	printf("Number of test samples for non NA relation: %d\n\n", num_test_non_NA);

	// 多线程模型测试
	pthread_t *pt = (pthread_t *)malloc(num_threads * sizeof(pthread_t));
	for (long a = 0; a < num_threads; a++)
		pthread_create(&pt[a], NULL, test_mode,  (void *)a);
	for (long a = 0; a < num_threads; a++)
		pthread_join(pt[a], NULL);
	free(pt);

	// 以模型给出的关系成立的概率降序排列
	std::sort(predict_relation_vector.begin(),predict_relation_vector.end(), cmp_predict_probability);

	// 输出 precion/recall curves
	REAL correct = 0;
	FILE* f = fopen((output_path + "pr" + note + ".txt").c_str(), "w");
	INT top_2000 = std::min(2000, INT(predict_relation_vector.size()));
	for (INT i = 0; i < top_2000; i++)
	{
		if (predict_relation_vector[i].second.first != 0)
			correct++;	
		REAL precision = correct / (i + 1);
		REAL recall = correct / num_test_non_NA;
		if ((i+1) % 50 == 0)
			printf("precion/recall curves %4d / %4d - precision: %.3lf - recall: %.3lf\n", (i + 1), top_2000, precision, recall);
		fprintf(f, "precision: %.3lf  recall: %.3lf  correct: %d  predict_probability: %.2lf  predict_triplet: %s\n",
			precision, recall, predict_relation_vector[i].second.first, predict_relation_vector[i].second.second,
			predict_relation_vector[i].first.c_str());	
	}
	fclose(f);

	gettimeofday(&test_end, NULL);
	long double time_use = (1000000 * (test_end.tv_sec - test_start.tv_sec)
		+ test_end.tv_usec - test_start.tv_usec) / 1000000.0;
	printf("\ntest use time - %02d:%02d:%02d\n\n", INT(time_use / 3600.0),
		INT(time_use) % 3600 / 60, INT(time_use) % 60);

	if (!output_model)return;

	// 输出词嵌入
	FILE *fout = fopen((output_path + "word2vec" + note + ".txt").c_str(), "w");
	fprintf(fout, "%d\t%d\n", word_total, dimension);
	for (INT i = 0; i < word_total; i++)
	{
		for (INT j = 0; j < dimension; j++)
			fprintf(fout, "%f\t", word_vec[i * dimension + j]);
		fprintf(fout, "\n");
	}
	fclose(fout);

	// 输出位置嵌入
	fout = fopen((output_path + "position_vec" + note + ".txt").c_str(), "w");
	fprintf(fout, "%d\t%d\t%d\n", position_total_head, position_total_tail, dimension_pos);
	for (INT i = 0; i < position_total_head; i++) {
		for (INT j = 0; j < dimension_pos; j++)
			fprintf(fout, "%f\t", position_vec_head[i * dimension_pos + j]);
		fprintf(fout, "\n");
	}
	for (INT i = 0; i < position_total_tail; i++) {
		for (INT j = 0; j < dimension_pos; j++)
			fprintf(fout, "%f\t", position_vec_tail[i * dimension_pos + j]);
		fprintf(fout, "\n");
	}
	fclose(fout);

	// 输出一维卷积权重矩阵和对应的偏置向量
	fout = fopen((output_path + "conv_1d" + note + ".txt").c_str(), "w");
	fprintf(fout,"%d\t%d\t%d\t%d\n", dimension_c, window, dimension, dimension_pos);
	for (INT i = 0; i < dimension_c; i++) {
		for (INT j = 0; j < window * dimension; j++)
			fprintf(fout, "%f\t", conv_1d_word[i * window * dimension + j]);
		for (INT j = 0; j < window * dimension_pos; j++)
			fprintf(fout, "%f\t", conv_1d_position_head[i * window * dimension_pos + j]);
		for (INT j = 0; j < window * dimension_pos; j++)
			fprintf(fout, "%f\t", conv_1d_position_tail[i * window * dimension_pos + j]);
		fprintf(fout, "%f\n", conv_1d_bias[i]);
	}
	fclose(fout);

	// 输出注意力权重矩阵
	fout = fopen((output_path + "attention_weights" + note + ".txt").c_str(), "w");
	fprintf(fout,"%d\t%d\n", relation_total, dimension_c);
	for (INT r = 0; r < relation_total; r++) {
		for (INT i_x = 0; i_x < dimension_c; i_x++)
		{
			for (INT i_r = 0; i_r < dimension_c; i_r++)
				fprintf(fout, "%f\t", attention_weights[r][i_x][i_r]);
			fprintf(fout, "\n");
		}
	}
	fclose(fout);

	// 输出 relation_matrix 和对应的偏置向量
	fout = fopen((output_path + "relation_matrix" + note + ".txt").c_str(), "w");
	fprintf(fout, "%d\t%d\t%f\n", relation_total, dimension_c, dropout_probability);
	for (INT i_r = 0; i_r < relation_total; i_r++) {
		for (INT i_s = 0; i_s < dimension_c; i_s++)
			fprintf(fout, "%f\t", relation_matrix[i_r * dimension_c + i_s]);
		fprintf(fout, "\n");
	}
	for (INT i_r = 0; i_r < relation_total; i_r++) 
		fprintf(fout, "%f\t", relation_matrix_bias[i_r]);
	fprintf(fout, "\n");
	fclose(fout);

	printf("模型保存成功, 保存目录为: %s\n\n", output_path.c_str());
}

#endif
```

#### [train.cpp](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/blob/main/neural-relation-extraction/C%2B%2B/CNN%2BATT/train.cpp)

```c++
// train.cpp
//
// 使用方法:
//     编译:
//           $ g++ train.cpp -o ./build/train -pthread -O3 -march=native
//     运行:
//           $ ./build/train
//
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>
//
// 该 C++ 文件用于模型训练

// ##################################################
// 包含标准库和头文件
// ##################################################

#include "init.h"
#include "test.h"

// bags_test_key: 保存 bags_train 的 key (头实体 + "\t" + 尾实体 + "\t" + 关系名), 按照 bags_train 的迭代顺序
// total_loss: 每一轮次的总损失
// current_alpha: 当前轮次的学习率
// current_sample, final_sample: 由于使用多线程训练模型, 这两个变量用于确定当前训练批次是否完成, 进而更新各种权重矩阵的副本, 如 word_vec_copy
// train_mutex: 互斥锁, 线程同步 current_sample 变量
// len = bags_train.size()
// nbatches  =  len / (batch * num_threads)
std::vector<std::string> bags_train_key;
double total_loss = 0;
REAL current_alpha;
double current_sample = 0, final_sample = 0;
pthread_mutex_t train_mutex;
INT len;
INT nbatches;

struct timeval train_start, train_end;

// 计算句子的一维卷积
std::vector<REAL> calc_conv_1d(INT *sentence, INT *train_position_head,
	INT *train_position_tail, INT sentence_length, std::vector<INT> &max_pool_window_k) {
	
	std::vector<REAL> conv_1d_result_k;
	conv_1d_result_k.resize(dimension_c, 0);

	for (INT i = 0; i < dimension_c; i++) {
		INT last_word = i * window * dimension;
		INT last_pos = i * window * dimension_pos;
		REAL max_pool_1d = -FLT_MAX;
		for (INT last_window = 0; last_window <= sentence_length - window; last_window++) {
			REAL sum = 0;
			INT total_word = 0;
			INT total_pos = 0;
			for (INT j = last_window; j < last_window + window; j++)  {
				INT last_word_vec = sentence[j] * dimension;
			 	for (INT k = 0; k < dimension; k++) {
			 		sum += conv_1d_word_copy[last_word + total_word] * word_vec_copy[last_word_vec + k];
			 		total_word++;
			 	}
			 	INT last_pos_head = train_position_head[j] * dimension_pos;
			 	INT last_pos_tail = train_position_tail[j] * dimension_pos;
			 	for (INT k = 0; k < dimension_pos; k++) {
			 		sum += conv_1d_position_head_copy[last_pos + total_pos] * position_vec_head_copy[last_pos_head + k];
			 		sum += conv_1d_position_tail_copy[last_pos + total_pos] * position_vec_tail_copy[last_pos_tail + k];
			 		total_pos++;
			 	}
			}

			// 对应于论文中的公式 (3), [x]_i = max(p_i), 其中 x \in R^{d^c}
			if (sum > max_pool_1d) {
				max_pool_1d = sum;
				max_pool_window_k[i] = last_window;
			}
		}
		conv_1d_result_k[i] = max_pool_1d + conv_1d_bias_copy[i];
	}

	for (INT i = 0; i < dimension_c; i++) {
		conv_1d_result_k[i] = calc_tanh(conv_1d_result_k[i]);
	}
	return conv_1d_result_k;
}

// 根据梯度更新一维卷积的权重矩阵, 位置嵌入矩阵, 词嵌入矩阵
void gradient_conv_1d(INT *sentence, INT *train_position_head, INT *train_position_tail,
	std::vector<REAL> &conv_1d_result_k, std::vector<INT> &max_pool_window_k, std::vector<REAL> &grad_x_k)
{
	for (INT i = 0; i < dimension_c; i++) {
		if (fabs(grad_x_k[i]) < 1e-8)
			continue;
		INT last_word = i * window * dimension;
		INT last_pos = i * window * dimension_pos;
		INT total_word = 0;
		INT total_pos = 0;
		// (tanh x)^{'} = sech^2x = \frac{1}{cosh^2x} = 1 - tanh^2x
		REAL grad_word_pos = grad_x_k[i] * (1 -  conv_1d_result_k[i] * conv_1d_result_k[i]);
		for (INT j = 0; j < window; j++)  {
			INT last_word_vec = sentence[max_pool_window_k[i] + j] * dimension;
			for (INT k = 0; k < dimension; k++) {
				conv_1d_word[last_word + total_word] -= grad_word_pos * word_vec_copy[last_word_vec + k];
				word_vec[last_word_vec + k] -= grad_word_pos * conv_1d_word_copy[last_word + total_word];
				total_word++;
			}
			INT last_pos_head = train_position_head[max_pool_window_k[i] + j] * dimension_pos;
			INT last_pos_tail = train_position_tail[max_pool_window_k[i] + j] * dimension_pos;
			for (INT k = 0; k < dimension_pos; k++) {
				conv_1d_position_head[last_pos + total_pos] -= grad_word_pos * position_vec_head_copy[last_pos_head + k];
				conv_1d_position_tail[last_pos + total_pos] -= grad_word_pos * position_vec_tail_copy[last_pos_tail + k];
				position_vec_head[last_pos_head + k] -= grad_word_pos * conv_1d_position_head_copy[last_pos + total_pos];
				position_vec_tail[last_pos_tail + k] -= grad_word_pos * conv_1d_position_tail_copy[last_pos + total_pos];
				total_pos++;
			}
		}
		conv_1d_bias[i] -= grad_word_pos;
	}
}

// 训练一个样本
REAL train_bags(std::string bags_name)
{
	// ##################################################
	// 正向传播
	// ##################################################

	// 一维卷积部分
	// relation: 该训练样本的正确标签 (关系)
	INT relation = -1;
	INT bags_size = bags_train[bags_name].size();
	std::vector<std::vector<INT> > max_pool_window;
	max_pool_window.resize(bags_size);
	std::vector<std::vector<REAL> > conv_1d_result;
	
	for (INT k = 0; k < bags_size; k++)
	{
		max_pool_window[k].resize(dimension_c);
		INT pos = bags_train[bags_name][k];
		if (relation == -1)
			relation = train_relation_list[pos];
		else
			assert(relation == train_relation_list[pos]);
		conv_1d_result.push_back(calc_conv_1d(train_sentence_list[pos], train_position_head[pos],
			train_position_tail[pos], train_length[pos], max_pool_window[k]));
	}

	// 获取每一个句子的权重
	std::vector<REAL> weight;
	REAL weight_sum = 0;
	for (INT k = 0; k < bags_size; k++)
	{
		REAL s = 0;
		for (INT i_r = 0; i_r < dimension_c; i_r++) 
		{
			REAL temp = 0;
			for (INT i_x = 0; i_x < dimension_c; i_x++)
				temp += conv_1d_result[k][i_x] * attention_weights_copy[relation][i_x][i_r];
			s += temp * relation_matrix_copy[relation * dimension_c + i_r];
		}
		s = exp(s); 
		weight.push_back(s);
		weight_sum += s;
	}

	for (INT k = 0; k < bags_size; k++)
		weight[k] /= weight_sum;

	// 获取 s, i.e., s indicates the representation of the sentence set
	std::vector<REAL> result_sentence;
	result_sentence.resize(dimension_c);
	for (INT i = 0; i < dimension_c; i++) 
		for (INT k = 0; k < bags_size; k++)
			result_sentence[i] += conv_1d_result[k][i] * weight[k];
	
	// 计算各种关系成立的概率
	std::vector<REAL> result_final;
	std::vector<INT> dropout;
	for (INT i_s = 0; i_s < dimension_c; i_s++)
		dropout.push_back((REAL)(rand()) / (RAND_MAX + 1.0) < dropout_probability);

	REAL sum = 0;
	for (INT i_r = 0; i_r < relation_total; i_r++) {
		REAL s = 0;
		for (INT i_s = 0; i_s < dimension_c; i_s++) {
			s += dropout[i_s] * result_sentence[i_s] * relation_matrix_copy[i_r * dimension_c + i_s];
		}
		s += relation_matrix_bias_copy[i_r];
		s = exp(s);
		sum += s;
		result_final.push_back(s);
	}

	// 计算损失值
	double loss = -(log(result_final[relation]) - log(sum));

	// ##################################################
	// 反向传播
	// ##################################################
	
	// 更新 relation_matrix, 对应于论文中的公式 (12), o = M(s \circ h) + d
	std::vector<REAL> grad_s;
	grad_s.resize(dimension_c);

	for (INT i_r = 0; i_r < relation_total; i_r++)
	{
		// 由于损失函数是 cross-entropy, 负标签是 0
		// 对于负标签 (关系) 的梯度是计算的概率, 即 result_final[i_r] / sum
		// 这样做, 能省略一层 softmax
		REAL grad_final = result_final[i_r] / sum * current_alpha;
		
		// 正标签是 0, 对于正标签 (关系) 的梯度是计算的概率 - 1, 即 result_final[i_r] / sum - 1
		// 这样做, 能省略一层 softmax
		if (i_r == relation)
			grad_final -= current_alpha;

		for (INT i_s = 0; i_s < dimension_c; i_s++) 
		{
			REAL grad_i_s = 0;
			if (dropout[i_s] != 0)
			{
				grad_i_s += grad_final * relation_matrix_copy[i_r * dimension_c + i_s];
				relation_matrix[i_r * dimension_c + i_s] -= grad_final * result_sentence[i_s];
			}
			grad_s[i_s] += grad_i_s;
		}
		relation_matrix_bias[i_r] -= grad_final;
	}

	// 更新注意力权重矩阵和 relation_matrix, 对应于论文中的公式 (5), (7), (8)
	std::vector<std::vector<REAL> > grad_x;
	grad_x.resize(bags_size);

	for (INT k = 0; k < bags_size; k++)
		grad_x[k].resize(dimension_c);

	for (INT i_r = 0; i_r < dimension_c; i_r++) 
	{
		REAL grad_i_s = grad_s[i_r];
		double a_denominator_sum_exp = 0;

		for (INT k = 0; k < bags_size; k++)
		{
			// grad_i_s * weight[k] 对应于论文中的公式 5
			grad_x[k][i_r] += grad_i_s * weight[k];
			for (INT i_x = 0; i_x < dimension_c; i_x++)
			{
				// 对应于论文中的公式 7 中分子 (exp(e_i)) 的公式 8 中的 x_i
				grad_x[k][i_x] += grad_i_s * conv_1d_result[k][i_r] * weight[k] *
					relation_matrix_copy[relation * dimension_c + i_r] *
					attention_weights_copy[relation][i_x][i_r];

				// 对应于论文中的公式 7 中分子 (exp(e_i)) 的公式 8 中的 r
				relation_matrix[relation * dimension_c + i_r] -= grad_i_s *
					conv_1d_result[k][i_r] * weight[k] * conv_1d_result[k][i_x] *
					attention_weights_copy[relation][i_x][i_r];
				
				// 对应于论文中的公式 7 中分子 (exp(e_i)) 的公式 8 中的 A
				if (i_r == i_x)
					attention_weights[relation][i_x][i_r] -= grad_i_s * conv_1d_result[k][i_r] *
						weight[k] * conv_1d_result[k][i_x] *
						relation_matrix_copy[relation * dimension_c + i_r];
			}

			// 由于 1/x 的导数是 -1/x^2, exp(x) 的导数是 exp(x)
			// 所以论文中的公式 (7) 中分母 (exp(e_i)) 的公式 8 的求导需要一个和 (exp(x_1), exp(x_2) ,...)
			// 并且需要多乘一次 weight[k]
			a_denominator_sum_exp += conv_1d_result[k][i_r] * weight[k];
		}	
		for (INT k = 0; k < bags_size; k++)
		{
			for (INT i_x = 0; i_x < dimension_c; i_x++)
			{
				// 对应于论文中的公式 7 中分母 (exp(e_i)) 的公式 8 中的 x_i
				grad_x[k][i_x]-= grad_i_s * a_denominator_sum_exp * weight[k] *
					relation_matrix_copy[relation * dimension_c + i_r] *
					attention_weights_copy[relation][i_x][i_r];
				
				// 对应于论文中的公式 7 中分母 (exp(e_i)) 的公式 8 中的 r
				relation_matrix[relation * dimension_c + i_r] += grad_i_s *
					a_denominator_sum_exp * weight[k] * conv_1d_result[k][i_x] *
					attention_weights_copy[relation][i_x][i_r];
				
				// 对应于论文中的公式 7 中分母 (exp(e_i)) 的公式 8 中的 A
				if (i_r == i_x)
					attention_weights[relation][i_x][i_r] += grad_i_s * a_denominator_sum_exp *
						weight[k] * conv_1d_result[k][i_x] *
						relation_matrix_copy[relation * dimension_c + i_r];
			}
		}
	}

	// 根据梯度更新一维卷积的权重矩阵, 位置嵌入矩阵, 词嵌入矩阵
	for (INT k = 0; k < bags_size; k++)
	{
		INT pos = bags_train[bags_name][k];
		gradient_conv_1d(train_sentence_list[pos], train_position_head[pos], train_position_tail[pos],
			conv_1d_result[k], max_pool_window[k], grad_x[k]);
	}
	return loss;
}

// 单个线程内运行的任务
void* train_mode(void *id) {
	while (true)
	{
		pthread_mutex_lock (&train_mutex);
		if (current_sample >= final_sample)
		{
			pthread_mutex_unlock (&train_mutex);
			break;
		}
		current_sample += 1;
		pthread_mutex_unlock (&train_mutex);
		INT i = get_rand_i(0, len);
		total_loss += train_bags(bags_train_key[i]);
	}
}

// 训练函数
void train() {

	len = bags_train.size();
	nbatches  =  len / (batch * num_threads);

	bags_train_key.clear();
	for (std::map<std::string, std::vector<INT> >:: iterator it = bags_train.begin();
		it != bags_train.end(); it++)
	{
		bags_train_key.push_back(it->first);
	}

	// 为模型的权重矩阵分配内存空间
	position_vec_head = (REAL *)calloc(position_total_head * dimension_pos, sizeof(REAL));
	position_vec_tail = (REAL *)calloc(position_total_tail * dimension_pos, sizeof(REAL));
	conv_1d_word = (REAL*)calloc(dimension_c * window * dimension, sizeof(REAL));
	conv_1d_position_head = (REAL *)calloc(dimension_c * window * dimension_pos, sizeof(REAL));
	conv_1d_position_tail = (REAL *)calloc(dimension_c * window * dimension_pos, sizeof(REAL));
	conv_1d_bias = (REAL*)calloc(dimension_c, sizeof(REAL));
	attention_weights.resize(relation_total);
	for (INT i = 0; i < relation_total; i++)
	{
		attention_weights[i].resize(dimension_c);
		for (INT j = 0; j < dimension_c; j++)
		{
			attention_weights[i][j].resize(dimension_c);
			attention_weights[i][j][j] = 1.00;
		}
	}
	relation_matrix = (REAL *)calloc(relation_total * dimension_c, sizeof(REAL));
	relation_matrix_bias = (REAL *)calloc(relation_total, sizeof(REAL));

	// 为模型的权重矩阵的副本分配内存空间
	word_vec_copy = (REAL *)calloc(dimension * word_total, sizeof(REAL));
	position_vec_head_copy = (REAL *)calloc(position_total_head * dimension_pos, sizeof(REAL));
	position_vec_tail_copy = (REAL *)calloc(position_total_tail * dimension_pos, sizeof(REAL));
	conv_1d_word_copy =  (REAL*)calloc(dimension_c * window * dimension, sizeof(REAL));
	conv_1d_position_head_copy = (REAL *)calloc(dimension_c * window * dimension_pos, sizeof(REAL));
	conv_1d_position_tail_copy = (REAL *)calloc(dimension_c * window * dimension_pos, sizeof(REAL));
	conv_1d_bias_copy =  (REAL*)calloc(dimension_c, sizeof(REAL));
	attention_weights_copy = attention_weights;
	relation_matrix_copy = (REAL *)calloc(relation_total * dimension_c, sizeof(REAL));
	relation_matrix_bias_copy = (REAL *)calloc(relation_total, sizeof(REAL));

	// 模型的权重矩阵初始化
	REAL relation_matrix_init = sqrt(6.0 / (relation_total + dimension_c));
	REAL conv_1d_position_vec_init = sqrt(6.0 / ((dimension + dimension_pos) * window));

	for (INT i = 0; i < position_total_head; i++) {
		for (INT j = 0; j < dimension_pos; j++) {
			position_vec_head[i * dimension_pos + j] = get_rand_u(-conv_1d_position_vec_init,
				conv_1d_position_vec_init);
		}
	}
	for (INT i = 0; i < position_total_tail; i++) {
		for (INT j = 0; j < dimension_pos; j++) {
			position_vec_tail[i * dimension_pos + j] = get_rand_u(-conv_1d_position_vec_init,
				conv_1d_position_vec_init);
		}
	}
	for (INT i = 0; i < dimension_c; i++) {
		INT last = i * window * dimension;
		for (INT j = 0; j < window * dimension; j++)
			conv_1d_word[last + j] = get_rand_u(-conv_1d_position_vec_init, conv_1d_position_vec_init);
		last = i * window * dimension_pos;
		for (INT j = dimension_pos * window - 1; j >=0; j--) {
			conv_1d_position_head[last + j] = get_rand_u(-conv_1d_position_vec_init, conv_1d_position_vec_init);
			conv_1d_position_tail[last + j] = get_rand_u(-conv_1d_position_vec_init, conv_1d_position_vec_init);
		}
		conv_1d_bias[i] = get_rand_u(-conv_1d_position_vec_init, conv_1d_position_vec_init);
	}
	for (INT i = 0; i < relation_total; i++) 
	{
		for (INT j = 0; j < dimension_c; j++)
			relation_matrix[i * dimension_c + j] = get_rand_u(-relation_matrix_init, relation_matrix_init);
		relation_matrix_bias[i] = get_rand_u(-relation_matrix_init, relation_matrix_init);
	}

	printf("##################################################\n\nTrain start...\n\n");

	for (INT epoch = 1; epoch <= epochs; epoch++) {

		// 更新当前 epoch 的学习率		
		current_alpha = alpha * current_rate;

		current_sample = 0;
		final_sample = 0;
		total_loss = 0;

		gettimeofday(&train_start, NULL);

		for (INT i = 1; i <= nbatches; i++) {
			final_sample += batch * num_threads;
			
			memcpy(word_vec_copy, word_vec, word_total * dimension * sizeof(REAL));
			memcpy(position_vec_head_copy, position_vec_head, position_total_head * dimension_pos * sizeof(REAL));
			memcpy(position_vec_tail_copy, position_vec_tail, position_total_tail * dimension_pos * sizeof(REAL));
			memcpy(conv_1d_word_copy, conv_1d_word, dimension_c * window * dimension * sizeof(REAL));
			memcpy(conv_1d_position_head_copy, conv_1d_position_head, dimension_c * window * dimension_pos * sizeof(REAL));
			memcpy(conv_1d_position_tail_copy, conv_1d_position_tail, dimension_c * window * dimension_pos * sizeof(REAL));
			memcpy(conv_1d_bias_copy, conv_1d_bias, dimension_c * sizeof(REAL));
			attention_weights_copy = attention_weights;
			memcpy(relation_matrix_copy, relation_matrix, relation_total * dimension_c * sizeof(REAL));
			memcpy(relation_matrix_bias_copy, relation_matrix_bias, relation_total * sizeof(REAL));
			
			pthread_t *pt = (pthread_t *)malloc(num_threads * sizeof(pthread_t));
			for (long a = 0; a < num_threads; a++)
				pthread_create(&pt[a], NULL, train_mode,  (void *)a);
			for (long a = 0; a < num_threads; a++)
				pthread_join(pt[a], NULL);
			free(pt);
		}

		gettimeofday(&train_end, NULL);
		long double time_use = (1000000 * (train_end.tv_sec - train_start.tv_sec)
			+ train_end.tv_usec - train_start.tv_usec) / 1000000.0;

		printf("Epoch %d/%d - current_alpha: %.8f - loss: %f - %02d:%02d:%02d\n\n", epoch, epochs,
			current_alpha, total_loss / final_sample, INT(time_use / 3600.0),
			INT(time_use) % 3600 / 60, INT(time_use) % 60);
		test();
		printf("Test end.\n\n##################################################\n\n");

		current_rate = current_rate * reduce_epoch;
	}
	printf("Train end.\n\n##################################################\n\n");
}

// ##################################################
// Main function
// ##################################################

void setparameters(INT argc, char **argv) {
	INT i;
	if ((i = arg_pos((char *)"-batch", argc, argv)) > 0) batch = atoi(argv[i + 1]);
	if ((i = arg_pos((char *)"-threads", argc, argv)) > 0) num_threads = atoi(argv[i + 1]);
	if ((i = arg_pos((char *)"-alpha", argc, argv)) > 0) alpha = atof(argv[i + 1]);
	if ((i = arg_pos((char *)"-init_rate", argc, argv)) > 0) current_rate = atof(argv[i + 1]);
	if ((i = arg_pos((char *)"-reduce_epoch", argc, argv)) > 0) reduce_epoch = atof(argv[i + 1]);
	if ((i = arg_pos((char *)"-epochs", argc, argv)) > 0) epochs = atoi(argv[i + 1]);
	if ((i = arg_pos((char *)"-limit", argc, argv)) > 0) limit = atoi(argv[i + 1]);
	if ((i = arg_pos((char *)"-dimension_pos", argc, argv)) > 0) dimension_pos = atoi(argv[i + 1]);
	if ((i = arg_pos((char *)"-window", argc, argv)) > 0) window = atoi(argv[i + 1]);
	if ((i = arg_pos((char *)"-dimension_c", argc, argv)) > 0) dimension_c = atoi(argv[i + 1]);
	if ((i = arg_pos((char *)"-dropout", argc, argv)) > 0) dropout_probability = atof(argv[i + 1]);
	if ((i = arg_pos((char *)"-output_model", argc, argv)) > 0) output_model = atoi(argv[i + 1]);	
	if ((i = arg_pos((char *)"-note", argc, argv)) > 0) note = argv[i + 1];
	if ((i = arg_pos((char *)"-data_path", argc, argv)) > 0) data_path = argv[i + 1];
	if ((i = arg_pos((char *)"-output_path", argc, argv)) > 0) output_path = argv[i + 1];
}

void print_train_help() {
	std::string str = R"(
// ##################################################
// ./train [-batch BATCH] [-threads THREAD] [-alpha ALPHA]
//         [-init_rate INIT_RATE] [-reduce_epoch REDUCE_EPOCH]
//         [-epochs EPOCHS] [-limit LIMIT] [-dimension_pos DIMENSION_POS]
//         [-window WINDOW] [-dimension_c DIMENSION_C]
//         [-dropout DROPOUT] [-output_model 0/1]
//         [-note NOTE] [-data_path DATA_PATH]
//         [-output_path OUTPUT_PATH] [--help]

// optional arguments:
// -batch BATCH                   batch size. if unspecified, batch will default to [40]
// -threads THREAD                number of worker threads. if unspecified, num_threads will default to [32]
// -alpha ALPHA                   learning rate. if unspecified, alpha will default to [0.00125]
// -init_rate INIT_RATE           init rate of learning rate. if unspecified, current_rate will default to [1.0]
// -reduce_epoch REDUCE_EPOCH     reduce of init rate of learning rate per epoch. if unspecified, reduce_epoch will default to [0.98]
// -epochs EPOCHS                 number of epochs. if unspecified, epochs will default to [25]
// -limit LIMIT                   限制句子中 (头, 尾) 实体相对每个单词的最大距离. 默认值为 [30]
// -dimension_pos DIMENSION_POS   位置嵌入维度，默认值为 [5]
// -window WINDOW                 一维卷积的 window 大小. 默认值为 [3]
// -dimension_c DIMENSION_C       sentence embedding size, if unspecified, dimension_c will default to [230]
// -dropout DROPOUT               dropout probability. if unspecified, dropout_probability will default to [0.5]
// -output_model 0/1              [1] 保存模型, [0] 不保存模型. 默认值为 [1]
// -note NOTE                     information you want to add to the filename, like ("./output/word2vec" + note + ".txt"). if unspecified, note will default to ""
// -data_path DATA_PATH           folder of data. if unspecified, data_path will default to "../data/"
// -output_path OUTPUT_PATH       folder of outputing results (precion/recall curves) and models. if unspecified, output_path will default to "./output/"
// --help                         print help information of ./train
// ##################################################
)";

	printf("%s\n", str.c_str());
}

// ##################################################
// ./train [-batch BATCH] [-threads THREAD] [-alpha ALPHA]
//         [-init_rate INIT_RATE] [-reduce_epoch REDUCE_EPOCH]
//         [-epochs EPOCHS] [-limit LIMIT] [-dimension_pos DIMENSION_POS]
//         [-window WINDOW] [-dimension_c DIMENSION_C]
//         [-dropout DROPOUT] [-output_model 0/1]
//         [-note NOTE] [-data_path DATA_PATH]
//         [-output_path OUTPUT_PATH] [--help]

// optional arguments:
// -batch BATCH                   batch size. if unspecified, batch will default to [40]
// -threads THREAD                number of worker threads. if unspecified, num_threads will default to [32]
// -alpha ALPHA                   learning rate. if unspecified, alpha will default to [0.00125]
// -init_rate INIT_RATE           init rate of learning rate. if unspecified, current_rate will default to [1.0]
// -reduce_epoch REDUCE_EPOCH     reduce of init rate of learning rate per epoch. if unspecified, reduce_epoch will default to [0.98]
// -epochs EPOCHS                 number of epochs. if unspecified, epochs will default to [25]
// -limit LIMIT                   限制句子中 (头, 尾) 实体相对每个单词的最大距离. 默认值为 [30]
// -dimension_pos DIMENSION_POS   位置嵌入维度，默认值为 [5]
// -window WINDOW                 一维卷积的 window 大小. 默认值为 [3]
// -dimension_c DIMENSION_C       sentence embedding size, if unspecified, dimension_c will default to [230]
// -dropout DROPOUT               dropout probability. if unspecified, dropout_probability will default to [0.5]
// -output_model 0/1              [1] 保存模型, [0] 不保存模型. 默认值为 [1]
// -note NOTE                     information you want to add to the filename, like ("./output/word2vec" + note + ".txt"). if unspecified, note will default to ""
// -data_path DATA_PATH           folder of data. if unspecified, data_path will default to "../data/"
// -output_path OUTPUT_PATH       folder of outputing results (precion/recall curves) and models. if unspecified, output_path will default to "./output/"
// --help                         print help information of ./train
// ##################################################

INT main(INT argc, char **argv) {
	for (INT a = 1; a < argc; a++) if (!strcmp((char *)"--help", argv[a])) {
		print_train_help();
		return 0;
	}
	output_model = 1;
	setparameters(argc, argv);
	init();
	print_information();
	train();
	return 0;
}
```

#### [test.cpp](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/blob/main/neural-relation-extraction/C%2B%2B/CNN%2BATT/test.cpp)

```c++
// test.cpp
//
// 使用方法:
//     编译:
//           $ g++ test.cpp -o ./build/test -pthread -O3 -march=native
//     运行:
//           $ ./build/test
//
// created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>
//
// 该 C++ 文件用于模型测试
//
// 加载模型
// prerequisites:
//     ./output/word2vec + note + .txt
//     ./output/position_vec + note + .txt
//     ./output/conv_1d + note + .txt
//     ./output/attention_weights + note + .txt
//     ./output/relation_matrix + note + .txt

// ##################################################
// 包含标准库和头文件
// ##################################################

#include "init.h"
#include "test.h"

// 加载模型
void load_model()
{
	// 为模型的权重矩阵分配内存空间
	position_vec_head = (REAL *)calloc(position_total_head * dimension_pos, sizeof(REAL));
	position_vec_tail = (REAL *)calloc(position_total_tail * dimension_pos, sizeof(REAL));

	conv_1d_word = (REAL*)calloc(dimension_c * dimension * window, sizeof(REAL));
	conv_1d_position_head = (REAL *)calloc(dimension_c * dimension_pos * window, sizeof(REAL));
	conv_1d_position_tail = (REAL *)calloc(dimension_c * dimension_pos * window, sizeof(REAL));
	conv_1d_bias = (REAL*)calloc(dimension_c, sizeof(REAL));

	attention_weights.resize(relation_total);
	for (INT i = 0; i < relation_total; i++)
	{
		attention_weights[i].resize(dimension_c);
		for (INT j = 0; j < dimension_c; j++)
			attention_weights[i][j].resize(dimension_c);
	}

	relation_matrix = (REAL *)calloc(relation_total * dimension_c, sizeof(REAL));
	relation_matrix_bias = (REAL *)calloc(relation_total, sizeof(REAL));
	
	INT tmp;

	// 加载词嵌入
	FILE *fout = fopen((output_path + "word2vec" + note + ".txt").c_str(), "r");
	tmp = fscanf(fout,"%d%d", &word_total, &dimension);
	for (INT i = 0; i < word_total; i++)
	{
		for (INT j = 0; j < dimension; j++)
			tmp = fscanf(fout, "%f", &word_vec[i * dimension + j]);
	}
	fclose(fout);

	// 加载位置嵌入
	fout = fopen((output_path + "position_vec" + note + ".txt").c_str(), "r");
	tmp = fscanf(fout, "%d%d%d", &position_total_head, &position_total_tail, &dimension_pos);
	for (INT i = 0; i < position_total_head; i++) {
		for (INT j = 0; j < dimension_pos; j++)
			tmp = fscanf(fout, "%f", &position_vec_head[i * dimension_pos + j]);
	}
	for (INT i = 0; i < position_total_tail; i++) {
		for (INT j = 0; j < dimension_pos; j++)
			tmp = fscanf(fout, "%f", &position_vec_tail[i * dimension_pos + j]);
	}
	fclose(fout);

	// 加载一维卷积权重矩阵和对应的偏置向量
	fout = fopen((output_path + "conv_1d" + note + ".txt").c_str(), "r");
	tmp = fscanf(fout, "%d%d%d%d", &dimension_c, &window, &dimension, &dimension_pos);
	for (INT i = 0; i < dimension_c; i++) {
		for (INT j = 0; j < window * dimension; j++)
			tmp = fscanf(fout, "%f", &conv_1d_word[i * window * dimension + j]);
		for (INT j = 0; j < window * dimension_pos; j++)
			tmp = fscanf(fout, "%f", &conv_1d_position_head[i * window * dimension_pos + j]);
		for (INT j = 0; j < window * dimension_pos; j++)
			tmp = fscanf(fout, "%f", &conv_1d_position_tail[i * window * dimension_pos + j]);
		tmp = fscanf(fout, "%f", &conv_1d_bias[i]);
	}
	fclose(fout);

	// 加载注意力权重矩阵
	fout = fopen((output_path + "attention_weights" + note + ".txt").c_str(), "r");
	tmp = fscanf(fout,"%d%d", &relation_total, &dimension_c);
	for (INT r = 0; r < relation_total; r++) {
		for (INT i_x = 0; i_x < dimension_c; i_x++)
		{
			for (INT i_r = 0; i_r < dimension_c; i_r++)
				tmp = fscanf(fout, "%f", &attention_weights[r][i_x][i_r]);
		}
	}
	fclose(fout);

	// 加载 relation_matrix 和对应的偏置向量
	fout = fopen((output_path + "relation_matrix" + note + ".txt").c_str(), "r");
	tmp = fscanf(fout, "%d%d%f", &relation_total, &dimension_c, &dropout_probability);
	for (INT i_r = 0; i_r < relation_total; i_r++) {
		for (INT i_s = 0; i_s < dimension_c; i_s++)
			tmp = fscanf(fout, "%f", &relation_matrix[i_r * dimension_c + i_s]);
	}
	for (INT i_r = 0; i_r < relation_total; i_r++) 
		tmp = fscanf(fout, "%f", &relation_matrix_bias[i_r]);
	fclose(fout);

	printf("模型加载成功!\n\n");
}

// ##################################################
// Main function
// ##################################################

void setparameters(INT argc, char **argv) {
	INT i;
	if ((i = arg_pos((char *)"-threads", argc, argv)) > 0) num_threads = atoi(argv[i + 1]);
	if ((i = arg_pos((char *)"-note", argc, argv)) > 0) note = argv[i + 1];
	if ((i = arg_pos((char *)"-data_path", argc, argv)) > 0) data_path = argv[i + 1];
	if ((i = arg_pos((char *)"-load_path", argc, argv)) > 0) output_path = argv[i + 1];
}

void print_test_help() {
	std::string str = R"(
// ##################################################
// ./test [-threads THREAD] [-dropout DROPOUT]
//        [-note NOTE] [-data_path DATA_PATH]
//        [-load_path LOAD_PATH] [--help]

// optional arguments:
// -threads THREAD                number of worker threads. if unspecified, num_threads will default to [32]
// -note NOTE                     information you want to add to the filename, like ("./output/word2vec" + note + ".txt"). if unspecified, note will default to ""
// -data_path DATA_PATH           folder of data. if unspecified, data_path will default to "../data/"
// -load_path LOAD_PATH           folder of pretrained models. if unspecified, load_path will default to "./output/"
// --help                         print help information of ./test
// ##################################################
)";

	printf("%s\n", str.c_str());
}

// ##################################################
// ./test [-threads THREAD] [-dropout DROPOUT]
//        [-note NOTE] [-data_path DATA_PATH]
//        [-load_path LOAD_PATH] [--help]

// optional arguments:
// -threads THREAD                number of worker threads. if unspecified, num_threads will default to [32]
// -note NOTE                     information you want to add to the filename, like ("./output/word2vec" + note + ".txt"). if unspecified, note will default to ""
// -data_path DATA_PATH           folder of data. if unspecified, data_path will default to "../data/"
// -load_path LOAD_PATH           folder of pretrained models. if unspecified, load_path will default to "./output/"
// --help                         print help information of ./test
// ##################################################

INT main(INT argc, char **argv) {
	for (INT a = 1; a < argc; a++) if (!strcmp((char *)"--help", argv[a])) {
		print_test_help();
		return 0;
	}	
	setparameters(argc, argv);
	init();
	load_model();
	print_information();
	test();
	printf("Test end.\n\n##################################################\n\n");
	return 0;
}
```

#### [run.sh](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/blob/main/neural-relation-extraction/C%2B%2B/CNN%2BATT/run.sh)

```bash
#!/bin/bash

##################################################
# run.sh
# 使用方法：$ bash run.sh
# created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>
#
# 该 Shell 脚本用于模型训练和模型测试
##################################################

# 创建 build 目录
echo ""
echo "##################################################"
echo ""
mkdir -p build
mkdir -p output
echo "./build 和 ./output 目录创建成功."

# compile
g++ train.cpp -o ./build/train -pthread -O3 -march=native
g++ test.cpp -o ./build/test -pthread -O3 -march=native

# train
./build/train
```

#### [clean.sh](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/blob/main/neural-relation-extraction/C%2B%2B/CNN%2BATT/clean.sh)

```bash
#!/bin/bash

##################################################
# clean.sh
# 使用方法：$ bash clean.sh
# created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>
#
# 该 Shell 脚本用于清理临时文件
##################################################

# 删除目标文件
echo ""
echo "##################################################"
echo ""
rm -rf ./build
echo "./build 目录递归删除成功."
echo ""
echo "##################################################"
echo ""
```

### 使用

```shell
$ ls
clean.sh  init.h  run.sh  test.cpp  test.h  train.cpp
$ bash run.sh 

##################################################

./build 和 ./output 目录创建成功.

##################################################

Init start...

训练数据和测试数据加载成功!

batch: 40
number of threads: 32
learning rate: 0.00125000
init_rate: 1.00
reduce_epoch: 0.98
epochs: 25

word_total: 114043
word dimension: 50

limit: 30
position_total_head: 61
position_total_tail: 61
dimension_pos: 5

window: 3
dimension_c: 230

relation_total: 53
dropout_probability: 0.50

将会保存模型.
note: 

folder of data: ../data/
folder of outputing results (precion/recall curves) and models: ./output/

number of training samples:  281270 - average sentence number of per training sample: 1.86
number of testing samples:    96678 - average sentence number of per testing sample:  1.78

Init end.

##################################################

Train start...

Epoch 1/25 - current_alpha: 0.00125000 - loss: 0.392392 - 00:04:00

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.280 - recall: 0.007
precion/recall curves  100 / 2000 - precision: 0.210 - recall: 0.011
precion/recall curves  150 / 2000 - precision: 0.187 - recall: 0.014
precion/recall curves  200 / 2000 - precision: 0.185 - recall: 0.019
precion/recall curves  250 / 2000 - precision: 0.164 - recall: 0.021
precion/recall curves  300 / 2000 - precision: 0.147 - recall: 0.023
precion/recall curves  350 / 2000 - precision: 0.134 - recall: 0.024
precion/recall curves  400 / 2000 - precision: 0.125 - recall: 0.026
precion/recall curves  450 / 2000 - precision: 0.120 - recall: 0.028
precion/recall curves  500 / 2000 - precision: 0.122 - recall: 0.031
precion/recall curves  550 / 2000 - precision: 0.125 - recall: 0.035
precion/recall curves  600 / 2000 - precision: 0.118 - recall: 0.036
precion/recall curves  650 / 2000 - precision: 0.118 - recall: 0.039
precion/recall curves  700 / 2000 - precision: 0.116 - recall: 0.042
precion/recall curves  750 / 2000 - precision: 0.109 - recall: 0.042
precion/recall curves  800 / 2000 - precision: 0.109 - recall: 0.045
precion/recall curves  850 / 2000 - precision: 0.105 - recall: 0.046
precion/recall curves  900 / 2000 - precision: 0.104 - recall: 0.048
precion/recall curves  950 / 2000 - precision: 0.102 - recall: 0.050
precion/recall curves 1000 / 2000 - precision: 0.101 - recall: 0.052
precion/recall curves 1050 / 2000 - precision: 0.102 - recall: 0.055
precion/recall curves 1100 / 2000 - precision: 0.099 - recall: 0.056
precion/recall curves 1150 / 2000 - precision: 0.097 - recall: 0.057
precion/recall curves 1200 / 2000 - precision: 0.094 - recall: 0.058
precion/recall curves 1250 / 2000 - precision: 0.092 - recall: 0.059
precion/recall curves 1300 / 2000 - precision: 0.090 - recall: 0.060
precion/recall curves 1350 / 2000 - precision: 0.087 - recall: 0.061
precion/recall curves 1400 / 2000 - precision: 0.085 - recall: 0.061
precion/recall curves 1450 / 2000 - precision: 0.083 - recall: 0.062
precion/recall curves 1500 / 2000 - precision: 0.085 - recall: 0.065
precion/recall curves 1550 / 2000 - precision: 0.084 - recall: 0.067
precion/recall curves 1600 / 2000 - precision: 0.083 - recall: 0.068
precion/recall curves 1650 / 2000 - precision: 0.082 - recall: 0.069
precion/recall curves 1700 / 2000 - precision: 0.081 - recall: 0.071
precion/recall curves 1750 / 2000 - precision: 0.081 - recall: 0.073
precion/recall curves 1800 / 2000 - precision: 0.081 - recall: 0.075
precion/recall curves 1850 / 2000 - precision: 0.082 - recall: 0.078
precion/recall curves 1900 / 2000 - precision: 0.080 - recall: 0.078
precion/recall curves 1950 / 2000 - precision: 0.080 - recall: 0.080
precion/recall curves 2000 / 2000 - precision: 0.079 - recall: 0.081

test use time - 00:01:21

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 2/25 - current_alpha: 0.00122500 - loss: 0.312926 - 00:04:58

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.560 - recall: 0.014
precion/recall curves  100 / 2000 - precision: 0.540 - recall: 0.028
precion/recall curves  150 / 2000 - precision: 0.573 - recall: 0.044
precion/recall curves  200 / 2000 - precision: 0.555 - recall: 0.057
precion/recall curves  250 / 2000 - precision: 0.536 - recall: 0.069
precion/recall curves  300 / 2000 - precision: 0.517 - recall: 0.079
precion/recall curves  350 / 2000 - precision: 0.483 - recall: 0.087
precion/recall curves  400 / 2000 - precision: 0.468 - recall: 0.096
precion/recall curves  450 / 2000 - precision: 0.433 - recall: 0.100
precion/recall curves  500 / 2000 - precision: 0.412 - recall: 0.106
precion/recall curves  550 / 2000 - precision: 0.404 - recall: 0.114
precion/recall curves  600 / 2000 - precision: 0.388 - recall: 0.119
precion/recall curves  650 / 2000 - precision: 0.375 - recall: 0.125
precion/recall curves  700 / 2000 - precision: 0.370 - recall: 0.133
precion/recall curves  750 / 2000 - precision: 0.359 - recall: 0.138
precion/recall curves  800 / 2000 - precision: 0.350 - recall: 0.144
precion/recall curves  850 / 2000 - precision: 0.339 - recall: 0.148
precion/recall curves  900 / 2000 - precision: 0.332 - recall: 0.153
precion/recall curves  950 / 2000 - precision: 0.322 - recall: 0.157
precion/recall curves 1000 / 2000 - precision: 0.312 - recall: 0.160
precion/recall curves 1050 / 2000 - precision: 0.304 - recall: 0.164
precion/recall curves 1100 / 2000 - precision: 0.294 - recall: 0.166
precion/recall curves 1150 / 2000 - precision: 0.285 - recall: 0.168
precion/recall curves 1200 / 2000 - precision: 0.279 - recall: 0.172
precion/recall curves 1250 / 2000 - precision: 0.277 - recall: 0.177
precion/recall curves 1300 / 2000 - precision: 0.271 - recall: 0.181
precion/recall curves 1350 / 2000 - precision: 0.264 - recall: 0.183
precion/recall curves 1400 / 2000 - precision: 0.256 - recall: 0.184
precion/recall curves 1450 / 2000 - precision: 0.253 - recall: 0.188
precion/recall curves 1500 / 2000 - precision: 0.249 - recall: 0.191
precion/recall curves 1550 / 2000 - precision: 0.245 - recall: 0.194
precion/recall curves 1600 / 2000 - precision: 0.238 - recall: 0.195
precion/recall curves 1650 / 2000 - precision: 0.233 - recall: 0.197
precion/recall curves 1700 / 2000 - precision: 0.228 - recall: 0.198
precion/recall curves 1750 / 2000 - precision: 0.225 - recall: 0.202
precion/recall curves 1800 / 2000 - precision: 0.220 - recall: 0.203
precion/recall curves 1850 / 2000 - precision: 0.216 - recall: 0.205
precion/recall curves 1900 / 2000 - precision: 0.212 - recall: 0.207
precion/recall curves 1950 / 2000 - precision: 0.208 - recall: 0.208
precion/recall curves 2000 / 2000 - precision: 0.204 - recall: 0.209

test use time - 00:01:22

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 3/25 - current_alpha: 0.00120050 - loss: 0.263319 - 00:04:04

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.500 - recall: 0.013
precion/recall curves  100 / 2000 - precision: 0.550 - recall: 0.028
precion/recall curves  150 / 2000 - precision: 0.560 - recall: 0.043
precion/recall curves  200 / 2000 - precision: 0.585 - recall: 0.060
precion/recall curves  250 / 2000 - precision: 0.556 - recall: 0.071
precion/recall curves  300 / 2000 - precision: 0.527 - recall: 0.081
precion/recall curves  350 / 2000 - precision: 0.506 - recall: 0.091
precion/recall curves  400 / 2000 - precision: 0.490 - recall: 0.101
precion/recall curves  450 / 2000 - precision: 0.460 - recall: 0.106
precion/recall curves  500 / 2000 - precision: 0.448 - recall: 0.115
precion/recall curves  550 / 2000 - precision: 0.433 - recall: 0.122
precion/recall curves  600 / 2000 - precision: 0.420 - recall: 0.129
precion/recall curves  650 / 2000 - precision: 0.405 - recall: 0.135
precion/recall curves  700 / 2000 - precision: 0.394 - recall: 0.142
precion/recall curves  750 / 2000 - precision: 0.379 - recall: 0.146
precion/recall curves  800 / 2000 - precision: 0.371 - recall: 0.152
precion/recall curves  850 / 2000 - precision: 0.362 - recall: 0.158
precion/recall curves  900 / 2000 - precision: 0.353 - recall: 0.163
precion/recall curves  950 / 2000 - precision: 0.348 - recall: 0.170
precion/recall curves 1000 / 2000 - precision: 0.340 - recall: 0.174
precion/recall curves 1050 / 2000 - precision: 0.330 - recall: 0.177
precion/recall curves 1100 / 2000 - precision: 0.325 - recall: 0.183
precion/recall curves 1150 / 2000 - precision: 0.319 - recall: 0.188
precion/recall curves 1200 / 2000 - precision: 0.313 - recall: 0.193
precion/recall curves 1250 / 2000 - precision: 0.307 - recall: 0.197
precion/recall curves 1300 / 2000 - precision: 0.302 - recall: 0.201
precion/recall curves 1350 / 2000 - precision: 0.295 - recall: 0.204
precion/recall curves 1400 / 2000 - precision: 0.288 - recall: 0.207
precion/recall curves 1450 / 2000 - precision: 0.283 - recall: 0.211
precion/recall curves 1500 / 2000 - precision: 0.277 - recall: 0.213
precion/recall curves 1550 / 2000 - precision: 0.270 - recall: 0.214
precion/recall curves 1600 / 2000 - precision: 0.262 - recall: 0.215
precion/recall curves 1650 / 2000 - precision: 0.258 - recall: 0.218
precion/recall curves 1700 / 2000 - precision: 0.255 - recall: 0.223
precion/recall curves 1750 / 2000 - precision: 0.251 - recall: 0.225
precion/recall curves 1800 / 2000 - precision: 0.248 - recall: 0.229
precion/recall curves 1850 / 2000 - precision: 0.243 - recall: 0.230
precion/recall curves 1900 / 2000 - precision: 0.239 - recall: 0.233
precion/recall curves 1950 / 2000 - precision: 0.235 - recall: 0.235
precion/recall curves 2000 / 2000 - precision: 0.231 - recall: 0.237

test use time - 00:01:21

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 4/25 - current_alpha: 0.00117649 - loss: 0.234492 - 00:03:50

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.600 - recall: 0.015
precion/recall curves  100 / 2000 - precision: 0.600 - recall: 0.031
precion/recall curves  150 / 2000 - precision: 0.600 - recall: 0.046
precion/recall curves  200 / 2000 - precision: 0.590 - recall: 0.061
precion/recall curves  250 / 2000 - precision: 0.560 - recall: 0.072
precion/recall curves  300 / 2000 - precision: 0.540 - recall: 0.083
precion/recall curves  350 / 2000 - precision: 0.534 - recall: 0.096
precion/recall curves  400 / 2000 - precision: 0.507 - recall: 0.104
precion/recall curves  450 / 2000 - precision: 0.484 - recall: 0.112
precion/recall curves  500 / 2000 - precision: 0.480 - recall: 0.123
precion/recall curves  550 / 2000 - precision: 0.475 - recall: 0.134
precion/recall curves  600 / 2000 - precision: 0.470 - recall: 0.145
precion/recall curves  650 / 2000 - precision: 0.457 - recall: 0.152
precion/recall curves  700 / 2000 - precision: 0.451 - recall: 0.162
precion/recall curves  750 / 2000 - precision: 0.443 - recall: 0.170
precion/recall curves  800 / 2000 - precision: 0.438 - recall: 0.179
precion/recall curves  850 / 2000 - precision: 0.431 - recall: 0.188
precion/recall curves  900 / 2000 - precision: 0.416 - recall: 0.192
precion/recall curves  950 / 2000 - precision: 0.407 - recall: 0.198
precion/recall curves 1000 / 2000 - precision: 0.401 - recall: 0.206
precion/recall curves 1050 / 2000 - precision: 0.399 - recall: 0.215
precion/recall curves 1100 / 2000 - precision: 0.391 - recall: 0.221
precion/recall curves 1150 / 2000 - precision: 0.384 - recall: 0.227
precion/recall curves 1200 / 2000 - precision: 0.376 - recall: 0.231
precion/recall curves 1250 / 2000 - precision: 0.369 - recall: 0.236
precion/recall curves 1300 / 2000 - precision: 0.366 - recall: 0.244
precion/recall curves 1350 / 2000 - precision: 0.361 - recall: 0.250
precion/recall curves 1400 / 2000 - precision: 0.356 - recall: 0.256
precion/recall curves 1450 / 2000 - precision: 0.350 - recall: 0.260
precion/recall curves 1500 / 2000 - precision: 0.341 - recall: 0.263
precion/recall curves 1550 / 2000 - precision: 0.336 - recall: 0.267
precion/recall curves 1600 / 2000 - precision: 0.333 - recall: 0.273
precion/recall curves 1650 / 2000 - precision: 0.327 - recall: 0.277
precion/recall curves 1700 / 2000 - precision: 0.321 - recall: 0.279
precion/recall curves 1750 / 2000 - precision: 0.314 - recall: 0.282
precion/recall curves 1800 / 2000 - precision: 0.310 - recall: 0.286
precion/recall curves 1850 / 2000 - precision: 0.306 - recall: 0.290
precion/recall curves 1900 / 2000 - precision: 0.302 - recall: 0.294
precion/recall curves 1950 / 2000 - precision: 0.298 - recall: 0.298
precion/recall curves 2000 / 2000 - precision: 0.294 - recall: 0.301

test use time - 00:01:21

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 5/25 - current_alpha: 0.00115296 - loss: 0.211013 - 00:03:39

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.600 - recall: 0.015
precion/recall curves  100 / 2000 - precision: 0.600 - recall: 0.031
precion/recall curves  150 / 2000 - precision: 0.600 - recall: 0.046
precion/recall curves  200 / 2000 - precision: 0.590 - recall: 0.061
precion/recall curves  250 / 2000 - precision: 0.580 - recall: 0.074
precion/recall curves  300 / 2000 - precision: 0.560 - recall: 0.086
precion/recall curves  350 / 2000 - precision: 0.569 - recall: 0.102
precion/recall curves  400 / 2000 - precision: 0.562 - recall: 0.115
precion/recall curves  450 / 2000 - precision: 0.538 - recall: 0.124
precion/recall curves  500 / 2000 - precision: 0.530 - recall: 0.136
precion/recall curves  550 / 2000 - precision: 0.522 - recall: 0.147
precion/recall curves  600 / 2000 - precision: 0.512 - recall: 0.157
precion/recall curves  650 / 2000 - precision: 0.497 - recall: 0.166
precion/recall curves  700 / 2000 - precision: 0.487 - recall: 0.175
precion/recall curves  750 / 2000 - precision: 0.477 - recall: 0.184
precion/recall curves  800 / 2000 - precision: 0.466 - recall: 0.191
precion/recall curves  850 / 2000 - precision: 0.449 - recall: 0.196
precion/recall curves  900 / 2000 - precision: 0.443 - recall: 0.205
precion/recall curves  950 / 2000 - precision: 0.438 - recall: 0.213
precion/recall curves 1000 / 2000 - precision: 0.438 - recall: 0.225
precion/recall curves 1050 / 2000 - precision: 0.428 - recall: 0.230
precion/recall curves 1100 / 2000 - precision: 0.418 - recall: 0.236
precion/recall curves 1150 / 2000 - precision: 0.410 - recall: 0.242
precion/recall curves 1200 / 2000 - precision: 0.404 - recall: 0.249
precion/recall curves 1250 / 2000 - precision: 0.399 - recall: 0.256
precion/recall curves 1300 / 2000 - precision: 0.392 - recall: 0.262
precion/recall curves 1350 / 2000 - precision: 0.386 - recall: 0.267
precion/recall curves 1400 / 2000 - precision: 0.377 - recall: 0.271
precion/recall curves 1450 / 2000 - precision: 0.371 - recall: 0.276
precion/recall curves 1500 / 2000 - precision: 0.367 - recall: 0.283
precion/recall curves 1550 / 2000 - precision: 0.360 - recall: 0.286
precion/recall curves 1600 / 2000 - precision: 0.357 - recall: 0.293
precion/recall curves 1650 / 2000 - precision: 0.351 - recall: 0.297
precion/recall curves 1700 / 2000 - precision: 0.344 - recall: 0.300
precion/recall curves 1750 / 2000 - precision: 0.340 - recall: 0.305
precion/recall curves 1800 / 2000 - precision: 0.335 - recall: 0.309
precion/recall curves 1850 / 2000 - precision: 0.329 - recall: 0.312
precion/recall curves 1900 / 2000 - precision: 0.325 - recall: 0.317
precion/recall curves 1950 / 2000 - precision: 0.323 - recall: 0.323
precion/recall curves 2000 / 2000 - precision: 0.317 - recall: 0.325

test use time - 00:01:23

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 6/25 - current_alpha: 0.00112990 - loss: 0.201362 - 00:04:17

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.660 - recall: 0.017
precion/recall curves  100 / 2000 - precision: 0.620 - recall: 0.032
precion/recall curves  150 / 2000 - precision: 0.600 - recall: 0.046
precion/recall curves  200 / 2000 - precision: 0.610 - recall: 0.063
precion/recall curves  250 / 2000 - precision: 0.592 - recall: 0.076
precion/recall curves  300 / 2000 - precision: 0.563 - recall: 0.087
precion/recall curves  350 / 2000 - precision: 0.560 - recall: 0.101
precion/recall curves  400 / 2000 - precision: 0.567 - recall: 0.116
precion/recall curves  450 / 2000 - precision: 0.560 - recall: 0.129
precion/recall curves  500 / 2000 - precision: 0.552 - recall: 0.142
precion/recall curves  550 / 2000 - precision: 0.540 - recall: 0.152
precion/recall curves  600 / 2000 - precision: 0.528 - recall: 0.163
precion/recall curves  650 / 2000 - precision: 0.515 - recall: 0.172
precion/recall curves  700 / 2000 - precision: 0.504 - recall: 0.181
precion/recall curves  750 / 2000 - precision: 0.496 - recall: 0.191
precion/recall curves  800 / 2000 - precision: 0.485 - recall: 0.199
precion/recall curves  850 / 2000 - precision: 0.472 - recall: 0.206
precion/recall curves  900 / 2000 - precision: 0.463 - recall: 0.214
precion/recall curves  950 / 2000 - precision: 0.452 - recall: 0.220
precion/recall curves 1000 / 2000 - precision: 0.447 - recall: 0.229
precion/recall curves 1050 / 2000 - precision: 0.438 - recall: 0.236
precion/recall curves 1100 / 2000 - precision: 0.432 - recall: 0.244
precion/recall curves 1150 / 2000 - precision: 0.427 - recall: 0.252
precion/recall curves 1200 / 2000 - precision: 0.421 - recall: 0.259
precion/recall curves 1250 / 2000 - precision: 0.418 - recall: 0.268
precion/recall curves 1300 / 2000 - precision: 0.412 - recall: 0.274
precion/recall curves 1350 / 2000 - precision: 0.405 - recall: 0.281
precion/recall curves 1400 / 2000 - precision: 0.398 - recall: 0.286
precion/recall curves 1450 / 2000 - precision: 0.391 - recall: 0.291
precion/recall curves 1500 / 2000 - precision: 0.385 - recall: 0.296
precion/recall curves 1550 / 2000 - precision: 0.379 - recall: 0.302
precion/recall curves 1600 / 2000 - precision: 0.373 - recall: 0.306
precion/recall curves 1650 / 2000 - precision: 0.369 - recall: 0.312
precion/recall curves 1700 / 2000 - precision: 0.361 - recall: 0.315
precion/recall curves 1750 / 2000 - precision: 0.355 - recall: 0.319
precion/recall curves 1800 / 2000 - precision: 0.351 - recall: 0.324
precion/recall curves 1850 / 2000 - precision: 0.345 - recall: 0.327
precion/recall curves 1900 / 2000 - precision: 0.342 - recall: 0.333
precion/recall curves 1950 / 2000 - precision: 0.337 - recall: 0.337
precion/recall curves 2000 / 2000 - precision: 0.331 - recall: 0.339

test use time - 00:01:22

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 7/25 - current_alpha: 0.00110730 - loss: 0.189826 - 00:03:58

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.640 - recall: 0.016
precion/recall curves  100 / 2000 - precision: 0.620 - recall: 0.032
precion/recall curves  150 / 2000 - precision: 0.627 - recall: 0.048
precion/recall curves  200 / 2000 - precision: 0.595 - recall: 0.061
precion/recall curves  250 / 2000 - precision: 0.592 - recall: 0.076
precion/recall curves  300 / 2000 - precision: 0.577 - recall: 0.089
precion/recall curves  350 / 2000 - precision: 0.560 - recall: 0.101
precion/recall curves  400 / 2000 - precision: 0.565 - recall: 0.116
precion/recall curves  450 / 2000 - precision: 0.576 - recall: 0.133
precion/recall curves  500 / 2000 - precision: 0.560 - recall: 0.144
precion/recall curves  550 / 2000 - precision: 0.562 - recall: 0.158
precion/recall curves  600 / 2000 - precision: 0.543 - recall: 0.167
precion/recall curves  650 / 2000 - precision: 0.525 - recall: 0.175
precion/recall curves  700 / 2000 - precision: 0.520 - recall: 0.187
precion/recall curves  750 / 2000 - precision: 0.515 - recall: 0.198
precion/recall curves  800 / 2000 - precision: 0.500 - recall: 0.205
precion/recall curves  850 / 2000 - precision: 0.495 - recall: 0.216
precion/recall curves  900 / 2000 - precision: 0.481 - recall: 0.222
precion/recall curves  950 / 2000 - precision: 0.482 - recall: 0.235
precion/recall curves 1000 / 2000 - precision: 0.473 - recall: 0.243
precion/recall curves 1050 / 2000 - precision: 0.470 - recall: 0.253
precion/recall curves 1100 / 2000 - precision: 0.462 - recall: 0.261
precion/recall curves 1150 / 2000 - precision: 0.452 - recall: 0.267
precion/recall curves 1200 / 2000 - precision: 0.442 - recall: 0.272
precion/recall curves 1250 / 2000 - precision: 0.436 - recall: 0.279
precion/recall curves 1300 / 2000 - precision: 0.424 - recall: 0.283
precion/recall curves 1350 / 2000 - precision: 0.413 - recall: 0.286
precion/recall curves 1400 / 2000 - precision: 0.404 - recall: 0.290
precion/recall curves 1450 / 2000 - precision: 0.401 - recall: 0.298
precion/recall curves 1500 / 2000 - precision: 0.392 - recall: 0.302
precion/recall curves 1550 / 2000 - precision: 0.389 - recall: 0.309
precion/recall curves 1600 / 2000 - precision: 0.381 - recall: 0.312
precion/recall curves 1650 / 2000 - precision: 0.374 - recall: 0.316
precion/recall curves 1700 / 2000 - precision: 0.370 - recall: 0.323
precion/recall curves 1750 / 2000 - precision: 0.370 - recall: 0.332
precion/recall curves 1800 / 2000 - precision: 0.366 - recall: 0.338
precion/recall curves 1850 / 2000 - precision: 0.362 - recall: 0.343
precion/recall curves 1900 / 2000 - precision: 0.356 - recall: 0.347
precion/recall curves 1950 / 2000 - precision: 0.351 - recall: 0.351
precion/recall curves 2000 / 2000 - precision: 0.345 - recall: 0.354

test use time - 00:01:21

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 8/25 - current_alpha: 0.00108516 - loss: 0.182470 - 00:03:33

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.680 - recall: 0.017
precion/recall curves  100 / 2000 - precision: 0.650 - recall: 0.033
precion/recall curves  150 / 2000 - precision: 0.633 - recall: 0.049
precion/recall curves  200 / 2000 - precision: 0.620 - recall: 0.064
precion/recall curves  250 / 2000 - precision: 0.616 - recall: 0.079
precion/recall curves  300 / 2000 - precision: 0.597 - recall: 0.092
precion/recall curves  350 / 2000 - precision: 0.614 - recall: 0.110
precion/recall curves  400 / 2000 - precision: 0.615 - recall: 0.126
precion/recall curves  450 / 2000 - precision: 0.607 - recall: 0.140
precion/recall curves  500 / 2000 - precision: 0.602 - recall: 0.154
precion/recall curves  550 / 2000 - precision: 0.589 - recall: 0.166
precion/recall curves  600 / 2000 - precision: 0.570 - recall: 0.175
precion/recall curves  650 / 2000 - precision: 0.557 - recall: 0.186
precion/recall curves  700 / 2000 - precision: 0.547 - recall: 0.196
precion/recall curves  750 / 2000 - precision: 0.536 - recall: 0.206
precion/recall curves  800 / 2000 - precision: 0.525 - recall: 0.215
precion/recall curves  850 / 2000 - precision: 0.516 - recall: 0.225
precion/recall curves  900 / 2000 - precision: 0.507 - recall: 0.234
precion/recall curves  950 / 2000 - precision: 0.495 - recall: 0.241
precion/recall curves 1000 / 2000 - precision: 0.484 - recall: 0.248
precion/recall curves 1050 / 2000 - precision: 0.472 - recall: 0.254
precion/recall curves 1100 / 2000 - precision: 0.467 - recall: 0.264
precion/recall curves 1150 / 2000 - precision: 0.463 - recall: 0.273
precion/recall curves 1200 / 2000 - precision: 0.454 - recall: 0.279
precion/recall curves 1250 / 2000 - precision: 0.450 - recall: 0.288
precion/recall curves 1300 / 2000 - precision: 0.440 - recall: 0.293
precion/recall curves 1350 / 2000 - precision: 0.431 - recall: 0.298
precion/recall curves 1400 / 2000 - precision: 0.424 - recall: 0.305
precion/recall curves 1450 / 2000 - precision: 0.419 - recall: 0.311
precion/recall curves 1500 / 2000 - precision: 0.412 - recall: 0.317
precion/recall curves 1550 / 2000 - precision: 0.406 - recall: 0.323
precion/recall curves 1600 / 2000 - precision: 0.399 - recall: 0.328
precion/recall curves 1650 / 2000 - precision: 0.396 - recall: 0.335
precion/recall curves 1700 / 2000 - precision: 0.390 - recall: 0.340
precion/recall curves 1750 / 2000 - precision: 0.382 - recall: 0.343
precion/recall curves 1800 / 2000 - precision: 0.377 - recall: 0.348
precion/recall curves 1850 / 2000 - precision: 0.375 - recall: 0.355
precion/recall curves 1900 / 2000 - precision: 0.368 - recall: 0.359
precion/recall curves 1950 / 2000 - precision: 0.364 - recall: 0.364
precion/recall curves 2000 / 2000 - precision: 0.356 - recall: 0.366

test use time - 00:01:22

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 9/25 - current_alpha: 0.00106345 - loss: 0.174141 - 00:03:59

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.780 - recall: 0.020
precion/recall curves  100 / 2000 - precision: 0.650 - recall: 0.033
precion/recall curves  150 / 2000 - precision: 0.613 - recall: 0.047
precion/recall curves  200 / 2000 - precision: 0.600 - recall: 0.062
precion/recall curves  250 / 2000 - precision: 0.616 - recall: 0.079
precion/recall curves  300 / 2000 - precision: 0.607 - recall: 0.093
precion/recall curves  350 / 2000 - precision: 0.600 - recall: 0.108
precion/recall curves  400 / 2000 - precision: 0.605 - recall: 0.124
precion/recall curves  450 / 2000 - precision: 0.609 - recall: 0.141
precion/recall curves  500 / 2000 - precision: 0.578 - recall: 0.148
precion/recall curves  550 / 2000 - precision: 0.575 - recall: 0.162
precion/recall curves  600 / 2000 - precision: 0.565 - recall: 0.174
precion/recall curves  650 / 2000 - precision: 0.562 - recall: 0.187
precion/recall curves  700 / 2000 - precision: 0.553 - recall: 0.198
precion/recall curves  750 / 2000 - precision: 0.537 - recall: 0.207
precion/recall curves  800 / 2000 - precision: 0.520 - recall: 0.213
precion/recall curves  850 / 2000 - precision: 0.507 - recall: 0.221
precion/recall curves  900 / 2000 - precision: 0.500 - recall: 0.231
precion/recall curves  950 / 2000 - precision: 0.492 - recall: 0.239
precion/recall curves 1000 / 2000 - precision: 0.483 - recall: 0.248
precion/recall curves 1050 / 2000 - precision: 0.471 - recall: 0.254
precion/recall curves 1100 / 2000 - precision: 0.462 - recall: 0.261
precion/recall curves 1150 / 2000 - precision: 0.460 - recall: 0.271
precion/recall curves 1200 / 2000 - precision: 0.452 - recall: 0.278
precion/recall curves 1250 / 2000 - precision: 0.443 - recall: 0.284
precion/recall curves 1300 / 2000 - precision: 0.439 - recall: 0.293
precion/recall curves 1350 / 2000 - precision: 0.435 - recall: 0.301
precion/recall curves 1400 / 2000 - precision: 0.429 - recall: 0.308
precion/recall curves 1450 / 2000 - precision: 0.426 - recall: 0.316
precion/recall curves 1500 / 2000 - precision: 0.420 - recall: 0.323
precion/recall curves 1550 / 2000 - precision: 0.414 - recall: 0.329
precion/recall curves 1600 / 2000 - precision: 0.407 - recall: 0.334
precion/recall curves 1650 / 2000 - precision: 0.400 - recall: 0.338
precion/recall curves 1700 / 2000 - precision: 0.395 - recall: 0.345
precion/recall curves 1750 / 2000 - precision: 0.391 - recall: 0.351
precion/recall curves 1800 / 2000 - precision: 0.384 - recall: 0.355
precion/recall curves 1850 / 2000 - precision: 0.378 - recall: 0.359
precion/recall curves 1900 / 2000 - precision: 0.373 - recall: 0.364
precion/recall curves 1950 / 2000 - precision: 0.367 - recall: 0.367
precion/recall curves 2000 / 2000 - precision: 0.361 - recall: 0.371

test use time - 00:01:22

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 10/25 - current_alpha: 0.00104219 - loss: 0.170107 - 00:03:58

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.820 - recall: 0.021
precion/recall curves  100 / 2000 - precision: 0.700 - recall: 0.036
precion/recall curves  150 / 2000 - precision: 0.707 - recall: 0.054
precion/recall curves  200 / 2000 - precision: 0.700 - recall: 0.072
precion/recall curves  250 / 2000 - precision: 0.664 - recall: 0.085
precion/recall curves  300 / 2000 - precision: 0.647 - recall: 0.099
precion/recall curves  350 / 2000 - precision: 0.631 - recall: 0.113
precion/recall curves  400 / 2000 - precision: 0.630 - recall: 0.129
precion/recall curves  450 / 2000 - precision: 0.611 - recall: 0.141
precion/recall curves  500 / 2000 - precision: 0.606 - recall: 0.155
precion/recall curves  550 / 2000 - precision: 0.585 - recall: 0.165
precion/recall curves  600 / 2000 - precision: 0.575 - recall: 0.177
precion/recall curves  650 / 2000 - precision: 0.565 - recall: 0.188
precion/recall curves  700 / 2000 - precision: 0.554 - recall: 0.199
precion/recall curves  750 / 2000 - precision: 0.547 - recall: 0.210
precion/recall curves  800 / 2000 - precision: 0.533 - recall: 0.218
precion/recall curves  850 / 2000 - precision: 0.526 - recall: 0.229
precion/recall curves  900 / 2000 - precision: 0.516 - recall: 0.238
precion/recall curves  950 / 2000 - precision: 0.506 - recall: 0.247
precion/recall curves 1000 / 2000 - precision: 0.497 - recall: 0.255
precion/recall curves 1050 / 2000 - precision: 0.486 - recall: 0.262
precion/recall curves 1100 / 2000 - precision: 0.476 - recall: 0.269
precion/recall curves 1150 / 2000 - precision: 0.472 - recall: 0.278
precion/recall curves 1200 / 2000 - precision: 0.463 - recall: 0.285
precion/recall curves 1250 / 2000 - precision: 0.454 - recall: 0.291
precion/recall curves 1300 / 2000 - precision: 0.444 - recall: 0.296
precion/recall curves 1350 / 2000 - precision: 0.438 - recall: 0.303
precion/recall curves 1400 / 2000 - precision: 0.428 - recall: 0.307
precion/recall curves 1450 / 2000 - precision: 0.426 - recall: 0.316
precion/recall curves 1500 / 2000 - precision: 0.417 - recall: 0.321
precion/recall curves 1550 / 2000 - precision: 0.409 - recall: 0.325
precion/recall curves 1600 / 2000 - precision: 0.403 - recall: 0.331
precion/recall curves 1650 / 2000 - precision: 0.398 - recall: 0.337
precion/recall curves 1700 / 2000 - precision: 0.392 - recall: 0.342
precion/recall curves 1750 / 2000 - precision: 0.387 - recall: 0.348
precion/recall curves 1800 / 2000 - precision: 0.384 - recall: 0.354
precion/recall curves 1850 / 2000 - precision: 0.379 - recall: 0.359
precion/recall curves 1900 / 2000 - precision: 0.372 - recall: 0.363
precion/recall curves 1950 / 2000 - precision: 0.367 - recall: 0.367
precion/recall curves 2000 / 2000 - precision: 0.363 - recall: 0.372

test use time - 00:01:22

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 11/25 - current_alpha: 0.00102134 - loss: 0.164617 - 00:04:04

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.780 - recall: 0.020
precion/recall curves  100 / 2000 - precision: 0.680 - recall: 0.035
precion/recall curves  150 / 2000 - precision: 0.647 - recall: 0.050
precion/recall curves  200 / 2000 - precision: 0.635 - recall: 0.065
precion/recall curves  250 / 2000 - precision: 0.620 - recall: 0.079
precion/recall curves  300 / 2000 - precision: 0.627 - recall: 0.096
precion/recall curves  350 / 2000 - precision: 0.609 - recall: 0.109
precion/recall curves  400 / 2000 - precision: 0.600 - recall: 0.123
precion/recall curves  450 / 2000 - precision: 0.596 - recall: 0.137
precion/recall curves  500 / 2000 - precision: 0.580 - recall: 0.149
precion/recall curves  550 / 2000 - precision: 0.575 - recall: 0.162
precion/recall curves  600 / 2000 - precision: 0.577 - recall: 0.177
precion/recall curves  650 / 2000 - precision: 0.566 - recall: 0.189
precion/recall curves  700 / 2000 - precision: 0.557 - recall: 0.200
precion/recall curves  750 / 2000 - precision: 0.543 - recall: 0.209
precion/recall curves  800 / 2000 - precision: 0.535 - recall: 0.219
precion/recall curves  850 / 2000 - precision: 0.528 - recall: 0.230
precion/recall curves  900 / 2000 - precision: 0.520 - recall: 0.240
precion/recall curves  950 / 2000 - precision: 0.508 - recall: 0.248
precion/recall curves 1000 / 2000 - precision: 0.499 - recall: 0.256
precion/recall curves 1050 / 2000 - precision: 0.491 - recall: 0.265
precion/recall curves 1100 / 2000 - precision: 0.478 - recall: 0.270
precion/recall curves 1150 / 2000 - precision: 0.470 - recall: 0.277
precion/recall curves 1200 / 2000 - precision: 0.461 - recall: 0.284
precion/recall curves 1250 / 2000 - precision: 0.452 - recall: 0.290
precion/recall curves 1300 / 2000 - precision: 0.445 - recall: 0.297
precion/recall curves 1350 / 2000 - precision: 0.436 - recall: 0.302
precion/recall curves 1400 / 2000 - precision: 0.432 - recall: 0.310
precion/recall curves 1450 / 2000 - precision: 0.430 - recall: 0.319
precion/recall curves 1500 / 2000 - precision: 0.429 - recall: 0.330
precion/recall curves 1550 / 2000 - precision: 0.420 - recall: 0.334
precion/recall curves 1600 / 2000 - precision: 0.412 - recall: 0.338
precion/recall curves 1650 / 2000 - precision: 0.406 - recall: 0.344
precion/recall curves 1700 / 2000 - precision: 0.402 - recall: 0.350
precion/recall curves 1750 / 2000 - precision: 0.397 - recall: 0.356
precion/recall curves 1800 / 2000 - precision: 0.391 - recall: 0.361
precion/recall curves 1850 / 2000 - precision: 0.385 - recall: 0.366
precion/recall curves 1900 / 2000 - precision: 0.382 - recall: 0.372
precion/recall curves 1950 / 2000 - precision: 0.375 - recall: 0.375
precion/recall curves 2000 / 2000 - precision: 0.371 - recall: 0.381

test use time - 00:01:22

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 12/25 - current_alpha: 0.00100091 - loss: 0.158291 - 00:03:49

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.760 - recall: 0.019
precion/recall curves  100 / 2000 - precision: 0.680 - recall: 0.035
precion/recall curves  150 / 2000 - precision: 0.653 - recall: 0.050
precion/recall curves  200 / 2000 - precision: 0.640 - recall: 0.066
precion/recall curves  250 / 2000 - precision: 0.636 - recall: 0.082
precion/recall curves  300 / 2000 - precision: 0.623 - recall: 0.096
precion/recall curves  350 / 2000 - precision: 0.609 - recall: 0.109
precion/recall curves  400 / 2000 - precision: 0.595 - recall: 0.122
precion/recall curves  450 / 2000 - precision: 0.587 - recall: 0.135
precion/recall curves  500 / 2000 - precision: 0.576 - recall: 0.148
precion/recall curves  550 / 2000 - precision: 0.571 - recall: 0.161
precion/recall curves  600 / 2000 - precision: 0.562 - recall: 0.173
precion/recall curves  650 / 2000 - precision: 0.557 - recall: 0.186
precion/recall curves  700 / 2000 - precision: 0.550 - recall: 0.197
precion/recall curves  750 / 2000 - precision: 0.547 - recall: 0.210
precion/recall curves  800 / 2000 - precision: 0.538 - recall: 0.221
precion/recall curves  850 / 2000 - precision: 0.534 - recall: 0.233
precion/recall curves  900 / 2000 - precision: 0.521 - recall: 0.241
precion/recall curves  950 / 2000 - precision: 0.517 - recall: 0.252
precion/recall curves 1000 / 2000 - precision: 0.501 - recall: 0.257
precion/recall curves 1050 / 2000 - precision: 0.495 - recall: 0.267
precion/recall curves 1100 / 2000 - precision: 0.482 - recall: 0.272
precion/recall curves 1150 / 2000 - precision: 0.473 - recall: 0.279
precion/recall curves 1200 / 2000 - precision: 0.467 - recall: 0.287
precion/recall curves 1250 / 2000 - precision: 0.460 - recall: 0.295
precion/recall curves 1300 / 2000 - precision: 0.451 - recall: 0.301
precion/recall curves 1350 / 2000 - precision: 0.440 - recall: 0.305
precion/recall curves 1400 / 2000 - precision: 0.434 - recall: 0.311
precion/recall curves 1450 / 2000 - precision: 0.425 - recall: 0.316
precion/recall curves 1500 / 2000 - precision: 0.419 - recall: 0.323
precion/recall curves 1550 / 2000 - precision: 0.412 - recall: 0.328
precion/recall curves 1600 / 2000 - precision: 0.409 - recall: 0.335
precion/recall curves 1650 / 2000 - precision: 0.402 - recall: 0.341
precion/recall curves 1700 / 2000 - precision: 0.396 - recall: 0.345
precion/recall curves 1750 / 2000 - precision: 0.393 - recall: 0.353
precion/recall curves 1800 / 2000 - precision: 0.389 - recall: 0.359
precion/recall curves 1850 / 2000 - precision: 0.384 - recall: 0.364
precion/recall curves 1900 / 2000 - precision: 0.378 - recall: 0.369
precion/recall curves 1950 / 2000 - precision: 0.377 - recall: 0.377
precion/recall curves 2000 / 2000 - precision: 0.371 - recall: 0.381

test use time - 00:01:22

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 13/25 - current_alpha: 0.00098090 - loss: 0.157852 - 00:04:22

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.760 - recall: 0.019
precion/recall curves  100 / 2000 - precision: 0.690 - recall: 0.035
precion/recall curves  150 / 2000 - precision: 0.680 - recall: 0.052
precion/recall curves  200 / 2000 - precision: 0.665 - recall: 0.068
precion/recall curves  250 / 2000 - precision: 0.652 - recall: 0.084
precion/recall curves  300 / 2000 - precision: 0.613 - recall: 0.094
precion/recall curves  350 / 2000 - precision: 0.609 - recall: 0.109
precion/recall curves  400 / 2000 - precision: 0.600 - recall: 0.123
precion/recall curves  450 / 2000 - precision: 0.584 - recall: 0.135
precion/recall curves  500 / 2000 - precision: 0.592 - recall: 0.152
precion/recall curves  550 / 2000 - precision: 0.582 - recall: 0.164
precion/recall curves  600 / 2000 - precision: 0.572 - recall: 0.176
precion/recall curves  650 / 2000 - precision: 0.569 - recall: 0.190
precion/recall curves  700 / 2000 - precision: 0.570 - recall: 0.205
precion/recall curves  750 / 2000 - precision: 0.564 - recall: 0.217
precion/recall curves  800 / 2000 - precision: 0.555 - recall: 0.228
precion/recall curves  850 / 2000 - precision: 0.541 - recall: 0.236
precion/recall curves  900 / 2000 - precision: 0.530 - recall: 0.245
precion/recall curves  950 / 2000 - precision: 0.520 - recall: 0.253
precion/recall curves 1000 / 2000 - precision: 0.507 - recall: 0.260
precion/recall curves 1050 / 2000 - precision: 0.494 - recall: 0.266
precion/recall curves 1100 / 2000 - precision: 0.489 - recall: 0.276
precion/recall curves 1150 / 2000 - precision: 0.482 - recall: 0.284
precion/recall curves 1200 / 2000 - precision: 0.477 - recall: 0.293
precion/recall curves 1250 / 2000 - precision: 0.470 - recall: 0.302
precion/recall curves 1300 / 2000 - precision: 0.461 - recall: 0.307
precion/recall curves 1350 / 2000 - precision: 0.451 - recall: 0.312
precion/recall curves 1400 / 2000 - precision: 0.444 - recall: 0.319
precion/recall curves 1450 / 2000 - precision: 0.438 - recall: 0.326
precion/recall curves 1500 / 2000 - precision: 0.435 - recall: 0.334
precion/recall curves 1550 / 2000 - precision: 0.425 - recall: 0.337
precion/recall curves 1600 / 2000 - precision: 0.416 - recall: 0.342
precion/recall curves 1650 / 2000 - precision: 0.411 - recall: 0.348
precion/recall curves 1700 / 2000 - precision: 0.405 - recall: 0.353
precion/recall curves 1750 / 2000 - precision: 0.397 - recall: 0.356
precion/recall curves 1800 / 2000 - precision: 0.392 - recall: 0.362
precion/recall curves 1850 / 2000 - precision: 0.387 - recall: 0.367
precion/recall curves 1900 / 2000 - precision: 0.383 - recall: 0.373
precion/recall curves 1950 / 2000 - precision: 0.377 - recall: 0.377
precion/recall curves 2000 / 2000 - precision: 0.374 - recall: 0.384

test use time - 00:01:22

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 14/25 - current_alpha: 0.00096128 - loss: 0.153716 - 00:03:42

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.720 - recall: 0.018
precion/recall curves  100 / 2000 - precision: 0.710 - recall: 0.036
precion/recall curves  150 / 2000 - precision: 0.687 - recall: 0.053
precion/recall curves  200 / 2000 - precision: 0.675 - recall: 0.069
precion/recall curves  250 / 2000 - precision: 0.640 - recall: 0.082
precion/recall curves  300 / 2000 - precision: 0.620 - recall: 0.095
precion/recall curves  350 / 2000 - precision: 0.600 - recall: 0.108
precion/recall curves  400 / 2000 - precision: 0.600 - recall: 0.123
precion/recall curves  450 / 2000 - precision: 0.591 - recall: 0.136
precion/recall curves  500 / 2000 - precision: 0.582 - recall: 0.149
precion/recall curves  550 / 2000 - precision: 0.573 - recall: 0.162
precion/recall curves  600 / 2000 - precision: 0.565 - recall: 0.174
precion/recall curves  650 / 2000 - precision: 0.560 - recall: 0.187
precion/recall curves  700 / 2000 - precision: 0.561 - recall: 0.202
precion/recall curves  750 / 2000 - precision: 0.551 - recall: 0.212
precion/recall curves  800 / 2000 - precision: 0.545 - recall: 0.224
precion/recall curves  850 / 2000 - precision: 0.533 - recall: 0.232
precion/recall curves  900 / 2000 - precision: 0.521 - recall: 0.241
precion/recall curves  950 / 2000 - precision: 0.512 - recall: 0.249
precion/recall curves 1000 / 2000 - precision: 0.507 - recall: 0.260
precion/recall curves 1050 / 2000 - precision: 0.495 - recall: 0.267
precion/recall curves 1100 / 2000 - precision: 0.492 - recall: 0.277
precion/recall curves 1150 / 2000 - precision: 0.487 - recall: 0.287
precion/recall curves 1200 / 2000 - precision: 0.477 - recall: 0.293
precion/recall curves 1250 / 2000 - precision: 0.470 - recall: 0.301
precion/recall curves 1300 / 2000 - precision: 0.458 - recall: 0.306
precion/recall curves 1350 / 2000 - precision: 0.456 - recall: 0.315
precion/recall curves 1400 / 2000 - precision: 0.449 - recall: 0.322
precion/recall curves 1450 / 2000 - precision: 0.439 - recall: 0.326
precion/recall curves 1500 / 2000 - precision: 0.431 - recall: 0.332
precion/recall curves 1550 / 2000 - precision: 0.425 - recall: 0.337
precion/recall curves 1600 / 2000 - precision: 0.417 - recall: 0.343
precion/recall curves 1650 / 2000 - precision: 0.412 - recall: 0.349
precion/recall curves 1700 / 2000 - precision: 0.406 - recall: 0.354
precion/recall curves 1750 / 2000 - precision: 0.401 - recall: 0.360
precion/recall curves 1800 / 2000 - precision: 0.396 - recall: 0.366
precion/recall curves 1850 / 2000 - precision: 0.391 - recall: 0.371
precion/recall curves 1900 / 2000 - precision: 0.389 - recall: 0.379
precion/recall curves 1950 / 2000 - precision: 0.381 - recall: 0.381
precion/recall curves 2000 / 2000 - precision: 0.376 - recall: 0.386

test use time - 00:01:22

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 15/25 - current_alpha: 0.00094205 - loss: 0.150468 - 00:04:12

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.780 - recall: 0.020
precion/recall curves  100 / 2000 - precision: 0.710 - recall: 0.036
precion/recall curves  150 / 2000 - precision: 0.693 - recall: 0.053
precion/recall curves  200 / 2000 - precision: 0.675 - recall: 0.069
precion/recall curves  250 / 2000 - precision: 0.688 - recall: 0.088
precion/recall curves  300 / 2000 - precision: 0.653 - recall: 0.101
precion/recall curves  350 / 2000 - precision: 0.629 - recall: 0.113
precion/recall curves  400 / 2000 - precision: 0.598 - recall: 0.123
precion/recall curves  450 / 2000 - precision: 0.582 - recall: 0.134
precion/recall curves  500 / 2000 - precision: 0.580 - recall: 0.149
precion/recall curves  550 / 2000 - precision: 0.576 - recall: 0.163
precion/recall curves  600 / 2000 - precision: 0.570 - recall: 0.175
precion/recall curves  650 / 2000 - precision: 0.555 - recall: 0.185
precion/recall curves  700 / 2000 - precision: 0.544 - recall: 0.195
precion/recall curves  750 / 2000 - precision: 0.536 - recall: 0.206
precion/recall curves  800 / 2000 - precision: 0.530 - recall: 0.217
precion/recall curves  850 / 2000 - precision: 0.524 - recall: 0.228
precion/recall curves  900 / 2000 - precision: 0.519 - recall: 0.239
precion/recall curves  950 / 2000 - precision: 0.512 - recall: 0.249
precion/recall curves 1000 / 2000 - precision: 0.504 - recall: 0.258
precion/recall curves 1050 / 2000 - precision: 0.494 - recall: 0.266
precion/recall curves 1100 / 2000 - precision: 0.488 - recall: 0.275
precion/recall curves 1150 / 2000 - precision: 0.485 - recall: 0.286
precion/recall curves 1200 / 2000 - precision: 0.478 - recall: 0.294
precion/recall curves 1250 / 2000 - precision: 0.470 - recall: 0.301
precion/recall curves 1300 / 2000 - precision: 0.459 - recall: 0.306
precion/recall curves 1350 / 2000 - precision: 0.450 - recall: 0.312
precion/recall curves 1400 / 2000 - precision: 0.441 - recall: 0.316
precion/recall curves 1450 / 2000 - precision: 0.434 - recall: 0.323
precion/recall curves 1500 / 2000 - precision: 0.424 - recall: 0.326
precion/recall curves 1550 / 2000 - precision: 0.421 - recall: 0.334
precion/recall curves 1600 / 2000 - precision: 0.414 - recall: 0.339
precion/recall curves 1650 / 2000 - precision: 0.412 - recall: 0.348
precion/recall curves 1700 / 2000 - precision: 0.407 - recall: 0.355
precion/recall curves 1750 / 2000 - precision: 0.401 - recall: 0.359
precion/recall curves 1800 / 2000 - precision: 0.395 - recall: 0.365
precion/recall curves 1850 / 2000 - precision: 0.390 - recall: 0.370
precion/recall curves 1900 / 2000 - precision: 0.385 - recall: 0.375
precion/recall curves 1950 / 2000 - precision: 0.379 - recall: 0.379
precion/recall curves 2000 / 2000 - precision: 0.377 - recall: 0.386

test use time - 00:01:22

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 16/25 - current_alpha: 0.00092321 - loss: 0.145180 - 00:04:06

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.700 - recall: 0.018
precion/recall curves  100 / 2000 - precision: 0.750 - recall: 0.038
precion/recall curves  150 / 2000 - precision: 0.713 - recall: 0.055
precion/recall curves  200 / 2000 - precision: 0.700 - recall: 0.072
precion/recall curves  250 / 2000 - precision: 0.668 - recall: 0.086
precion/recall curves  300 / 2000 - precision: 0.640 - recall: 0.098
precion/recall curves  350 / 2000 - precision: 0.626 - recall: 0.112
precion/recall curves  400 / 2000 - precision: 0.615 - recall: 0.126
precion/recall curves  450 / 2000 - precision: 0.600 - recall: 0.138
precion/recall curves  500 / 2000 - precision: 0.584 - recall: 0.150
precion/recall curves  550 / 2000 - precision: 0.575 - recall: 0.162
precion/recall curves  600 / 2000 - precision: 0.562 - recall: 0.173
precion/recall curves  650 / 2000 - precision: 0.549 - recall: 0.183
precion/recall curves  700 / 2000 - precision: 0.546 - recall: 0.196
precion/recall curves  750 / 2000 - precision: 0.543 - recall: 0.209
precion/recall curves  800 / 2000 - precision: 0.533 - recall: 0.218
precion/recall curves  850 / 2000 - precision: 0.532 - recall: 0.232
precion/recall curves  900 / 2000 - precision: 0.519 - recall: 0.239
precion/recall curves  950 / 2000 - precision: 0.512 - recall: 0.249
precion/recall curves 1000 / 2000 - precision: 0.507 - recall: 0.260
precion/recall curves 1050 / 2000 - precision: 0.498 - recall: 0.268
precion/recall curves 1100 / 2000 - precision: 0.494 - recall: 0.278
precion/recall curves 1150 / 2000 - precision: 0.484 - recall: 0.286
precion/recall curves 1200 / 2000 - precision: 0.477 - recall: 0.294
precion/recall curves 1250 / 2000 - precision: 0.469 - recall: 0.301
precion/recall curves 1300 / 2000 - precision: 0.464 - recall: 0.309
precion/recall curves 1350 / 2000 - precision: 0.456 - recall: 0.315
precion/recall curves 1400 / 2000 - precision: 0.449 - recall: 0.323
precion/recall curves 1450 / 2000 - precision: 0.443 - recall: 0.329
precion/recall curves 1500 / 2000 - precision: 0.438 - recall: 0.337
precion/recall curves 1550 / 2000 - precision: 0.428 - recall: 0.341
precion/recall curves 1600 / 2000 - precision: 0.424 - recall: 0.348
precion/recall curves 1650 / 2000 - precision: 0.416 - recall: 0.352
precion/recall curves 1700 / 2000 - precision: 0.409 - recall: 0.357
precion/recall curves 1750 / 2000 - precision: 0.403 - recall: 0.362
precion/recall curves 1800 / 2000 - precision: 0.400 - recall: 0.369
precion/recall curves 1850 / 2000 - precision: 0.395 - recall: 0.374
precion/recall curves 1900 / 2000 - precision: 0.391 - recall: 0.381
precion/recall curves 1950 / 2000 - precision: 0.387 - recall: 0.387
precion/recall curves 2000 / 2000 - precision: 0.380 - recall: 0.389

test use time - 00:01:22

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 17/25 - current_alpha: 0.00090475 - loss: 0.142947 - 00:03:53

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.840 - recall: 0.022
precion/recall curves  100 / 2000 - precision: 0.760 - recall: 0.039
precion/recall curves  150 / 2000 - precision: 0.720 - recall: 0.055
precion/recall curves  200 / 2000 - precision: 0.710 - recall: 0.073
precion/recall curves  250 / 2000 - precision: 0.672 - recall: 0.086
precion/recall curves  300 / 2000 - precision: 0.647 - recall: 0.099
precion/recall curves  350 / 2000 - precision: 0.634 - recall: 0.114
precion/recall curves  400 / 2000 - precision: 0.625 - recall: 0.128
precion/recall curves  450 / 2000 - precision: 0.613 - recall: 0.142
precion/recall curves  500 / 2000 - precision: 0.600 - recall: 0.154
precion/recall curves  550 / 2000 - precision: 0.593 - recall: 0.167
precion/recall curves  600 / 2000 - precision: 0.580 - recall: 0.178
precion/recall curves  650 / 2000 - precision: 0.571 - recall: 0.190
precion/recall curves  700 / 2000 - precision: 0.560 - recall: 0.201
precion/recall curves  750 / 2000 - precision: 0.559 - recall: 0.215
precion/recall curves  800 / 2000 - precision: 0.550 - recall: 0.226
precion/recall curves  850 / 2000 - precision: 0.544 - recall: 0.237
precion/recall curves  900 / 2000 - precision: 0.538 - recall: 0.248
precion/recall curves  950 / 2000 - precision: 0.528 - recall: 0.257
precion/recall curves 1000 / 2000 - precision: 0.517 - recall: 0.265
precion/recall curves 1050 / 2000 - precision: 0.503 - recall: 0.271
precion/recall curves 1100 / 2000 - precision: 0.495 - recall: 0.279
precion/recall curves 1150 / 2000 - precision: 0.491 - recall: 0.290
precion/recall curves 1200 / 2000 - precision: 0.484 - recall: 0.298
precion/recall curves 1250 / 2000 - precision: 0.477 - recall: 0.306
precion/recall curves 1300 / 2000 - precision: 0.465 - recall: 0.310
precion/recall curves 1350 / 2000 - precision: 0.457 - recall: 0.316
precion/recall curves 1400 / 2000 - precision: 0.451 - recall: 0.324
precion/recall curves 1450 / 2000 - precision: 0.443 - recall: 0.329
precion/recall curves 1500 / 2000 - precision: 0.438 - recall: 0.337
precion/recall curves 1550 / 2000 - precision: 0.432 - recall: 0.344
precion/recall curves 1600 / 2000 - precision: 0.427 - recall: 0.350
precion/recall curves 1650 / 2000 - precision: 0.420 - recall: 0.355
precion/recall curves 1700 / 2000 - precision: 0.414 - recall: 0.361
precion/recall curves 1750 / 2000 - precision: 0.411 - recall: 0.369
precion/recall curves 1800 / 2000 - precision: 0.405 - recall: 0.374
precion/recall curves 1850 / 2000 - precision: 0.398 - recall: 0.378
precion/recall curves 1900 / 2000 - precision: 0.392 - recall: 0.382
precion/recall curves 1950 / 2000 - precision: 0.388 - recall: 0.388
precion/recall curves 2000 / 2000 - precision: 0.380 - recall: 0.390

test use time - 00:01:22

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 18/25 - current_alpha: 0.00088665 - loss: 0.138729 - 00:03:56

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.800 - recall: 0.021
precion/recall curves  100 / 2000 - precision: 0.780 - recall: 0.040
precion/recall curves  150 / 2000 - precision: 0.727 - recall: 0.056
precion/recall curves  200 / 2000 - precision: 0.695 - recall: 0.071
precion/recall curves  250 / 2000 - precision: 0.676 - recall: 0.087
precion/recall curves  300 / 2000 - precision: 0.643 - recall: 0.099
precion/recall curves  350 / 2000 - precision: 0.620 - recall: 0.111
precion/recall curves  400 / 2000 - precision: 0.615 - recall: 0.126
precion/recall curves  450 / 2000 - precision: 0.613 - recall: 0.142
precion/recall curves  500 / 2000 - precision: 0.612 - recall: 0.157
precion/recall curves  550 / 2000 - precision: 0.605 - recall: 0.171
precion/recall curves  600 / 2000 - precision: 0.588 - recall: 0.181
precion/recall curves  650 / 2000 - precision: 0.577 - recall: 0.192
precion/recall curves  700 / 2000 - precision: 0.567 - recall: 0.204
precion/recall curves  750 / 2000 - precision: 0.553 - recall: 0.213
precion/recall curves  800 / 2000 - precision: 0.543 - recall: 0.223
precion/recall curves  850 / 2000 - precision: 0.533 - recall: 0.232
precion/recall curves  900 / 2000 - precision: 0.521 - recall: 0.241
precion/recall curves  950 / 2000 - precision: 0.518 - recall: 0.252
precion/recall curves 1000 / 2000 - precision: 0.511 - recall: 0.262
precion/recall curves 1050 / 2000 - precision: 0.506 - recall: 0.272
precion/recall curves 1100 / 2000 - precision: 0.502 - recall: 0.283
precion/recall curves 1150 / 2000 - precision: 0.490 - recall: 0.289
precion/recall curves 1200 / 2000 - precision: 0.477 - recall: 0.293
precion/recall curves 1250 / 2000 - precision: 0.469 - recall: 0.301
precion/recall curves 1300 / 2000 - precision: 0.463 - recall: 0.309
precion/recall curves 1350 / 2000 - precision: 0.453 - recall: 0.314
precion/recall curves 1400 / 2000 - precision: 0.449 - recall: 0.323
precion/recall curves 1450 / 2000 - precision: 0.443 - recall: 0.329
precion/recall curves 1500 / 2000 - precision: 0.434 - recall: 0.334
precion/recall curves 1550 / 2000 - precision: 0.427 - recall: 0.339
precion/recall curves 1600 / 2000 - precision: 0.421 - recall: 0.346
precion/recall curves 1650 / 2000 - precision: 0.419 - recall: 0.355
precion/recall curves 1700 / 2000 - precision: 0.415 - recall: 0.362
precion/recall curves 1750 / 2000 - precision: 0.410 - recall: 0.368
precion/recall curves 1800 / 2000 - precision: 0.404 - recall: 0.373
precion/recall curves 1850 / 2000 - precision: 0.400 - recall: 0.379
precion/recall curves 1900 / 2000 - precision: 0.392 - recall: 0.382
precion/recall curves 1950 / 2000 - precision: 0.385 - recall: 0.385
precion/recall curves 2000 / 2000 - precision: 0.380 - recall: 0.390

test use time - 00:01:23

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 19/25 - current_alpha: 0.00086892 - loss: 0.137877 - 00:04:07

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.760 - recall: 0.019
precion/recall curves  100 / 2000 - precision: 0.720 - recall: 0.037
precion/recall curves  150 / 2000 - precision: 0.693 - recall: 0.053
precion/recall curves  200 / 2000 - precision: 0.690 - recall: 0.071
precion/recall curves  250 / 2000 - precision: 0.672 - recall: 0.086
precion/recall curves  300 / 2000 - precision: 0.657 - recall: 0.101
precion/recall curves  350 / 2000 - precision: 0.631 - recall: 0.113
precion/recall curves  400 / 2000 - precision: 0.620 - recall: 0.127
precion/recall curves  450 / 2000 - precision: 0.613 - recall: 0.142
precion/recall curves  500 / 2000 - precision: 0.596 - recall: 0.153
precion/recall curves  550 / 2000 - precision: 0.580 - recall: 0.164
precion/recall curves  600 / 2000 - precision: 0.575 - recall: 0.177
precion/recall curves  650 / 2000 - precision: 0.568 - recall: 0.189
precion/recall curves  700 / 2000 - precision: 0.559 - recall: 0.201
precion/recall curves  750 / 2000 - precision: 0.548 - recall: 0.211
precion/recall curves  800 / 2000 - precision: 0.538 - recall: 0.221
precion/recall curves  850 / 2000 - precision: 0.524 - recall: 0.228
precion/recall curves  900 / 2000 - precision: 0.520 - recall: 0.240
precion/recall curves  950 / 2000 - precision: 0.516 - recall: 0.251
precion/recall curves 1000 / 2000 - precision: 0.508 - recall: 0.261
precion/recall curves 1050 / 2000 - precision: 0.504 - recall: 0.271
precion/recall curves 1100 / 2000 - precision: 0.495 - recall: 0.279
precion/recall curves 1150 / 2000 - precision: 0.489 - recall: 0.288
precion/recall curves 1200 / 2000 - precision: 0.484 - recall: 0.298
precion/recall curves 1250 / 2000 - precision: 0.476 - recall: 0.305
precion/recall curves 1300 / 2000 - precision: 0.468 - recall: 0.312
precion/recall curves 1350 / 2000 - precision: 0.463 - recall: 0.321
precion/recall curves 1400 / 2000 - precision: 0.455 - recall: 0.327
precion/recall curves 1450 / 2000 - precision: 0.446 - recall: 0.331
precion/recall curves 1500 / 2000 - precision: 0.441 - recall: 0.339
precion/recall curves 1550 / 2000 - precision: 0.435 - recall: 0.346
precion/recall curves 1600 / 2000 - precision: 0.426 - recall: 0.349
precion/recall curves 1650 / 2000 - precision: 0.422 - recall: 0.357
precion/recall curves 1700 / 2000 - precision: 0.416 - recall: 0.363
precion/recall curves 1750 / 2000 - precision: 0.408 - recall: 0.366
precion/recall curves 1800 / 2000 - precision: 0.402 - recall: 0.371
precion/recall curves 1850 / 2000 - precision: 0.398 - recall: 0.378
precion/recall curves 1900 / 2000 - precision: 0.390 - recall: 0.380
precion/recall curves 1950 / 2000 - precision: 0.385 - recall: 0.385
precion/recall curves 2000 / 2000 - precision: 0.378 - recall: 0.388

test use time - 00:01:22

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 20/25 - current_alpha: 0.00085154 - loss: 0.135148 - 00:04:04

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.760 - recall: 0.019
precion/recall curves  100 / 2000 - precision: 0.750 - recall: 0.038
precion/recall curves  150 / 2000 - precision: 0.700 - recall: 0.054
precion/recall curves  200 / 2000 - precision: 0.670 - recall: 0.069
precion/recall curves  250 / 2000 - precision: 0.664 - recall: 0.085
precion/recall curves  300 / 2000 - precision: 0.653 - recall: 0.101
precion/recall curves  350 / 2000 - precision: 0.640 - recall: 0.115
precion/recall curves  400 / 2000 - precision: 0.625 - recall: 0.128
precion/recall curves  450 / 2000 - precision: 0.613 - recall: 0.142
precion/recall curves  500 / 2000 - precision: 0.600 - recall: 0.154
precion/recall curves  550 / 2000 - precision: 0.580 - recall: 0.164
precion/recall curves  600 / 2000 - precision: 0.575 - recall: 0.177
precion/recall curves  650 / 2000 - precision: 0.562 - recall: 0.187
precion/recall curves  700 / 2000 - precision: 0.551 - recall: 0.198
precion/recall curves  750 / 2000 - precision: 0.544 - recall: 0.209
precion/recall curves  800 / 2000 - precision: 0.526 - recall: 0.216
precion/recall curves  850 / 2000 - precision: 0.518 - recall: 0.226
precion/recall curves  900 / 2000 - precision: 0.511 - recall: 0.236
precion/recall curves  950 / 2000 - precision: 0.501 - recall: 0.244
precion/recall curves 1000 / 2000 - precision: 0.499 - recall: 0.256
precion/recall curves 1050 / 2000 - precision: 0.490 - recall: 0.264
precion/recall curves 1100 / 2000 - precision: 0.484 - recall: 0.273
precion/recall curves 1150 / 2000 - precision: 0.476 - recall: 0.281
precion/recall curves 1200 / 2000 - precision: 0.470 - recall: 0.289
precion/recall curves 1250 / 2000 - precision: 0.464 - recall: 0.297
precion/recall curves 1300 / 2000 - precision: 0.462 - recall: 0.308
precion/recall curves 1350 / 2000 - precision: 0.450 - recall: 0.311
precion/recall curves 1400 / 2000 - precision: 0.441 - recall: 0.316
precion/recall curves 1450 / 2000 - precision: 0.433 - recall: 0.322
precion/recall curves 1500 / 2000 - precision: 0.427 - recall: 0.328
precion/recall curves 1550 / 2000 - precision: 0.423 - recall: 0.336
precion/recall curves 1600 / 2000 - precision: 0.417 - recall: 0.343
precion/recall curves 1650 / 2000 - precision: 0.407 - recall: 0.345
precion/recall curves 1700 / 2000 - precision: 0.405 - recall: 0.353
precion/recall curves 1750 / 2000 - precision: 0.398 - recall: 0.357
precion/recall curves 1800 / 2000 - precision: 0.395 - recall: 0.365
precion/recall curves 1850 / 2000 - precision: 0.391 - recall: 0.371
precion/recall curves 1900 / 2000 - precision: 0.384 - recall: 0.374
precion/recall curves 1950 / 2000 - precision: 0.380 - recall: 0.380
precion/recall curves 2000 / 2000 - precision: 0.375 - recall: 0.385

test use time - 00:01:19

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 21/25 - current_alpha: 0.00083451 - loss: 0.132989 - 00:04:03

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.740 - recall: 0.019
precion/recall curves  100 / 2000 - precision: 0.720 - recall: 0.037
precion/recall curves  150 / 2000 - precision: 0.707 - recall: 0.054
precion/recall curves  200 / 2000 - precision: 0.705 - recall: 0.072
precion/recall curves  250 / 2000 - precision: 0.672 - recall: 0.086
precion/recall curves  300 / 2000 - precision: 0.647 - recall: 0.099
precion/recall curves  350 / 2000 - precision: 0.640 - recall: 0.115
precion/recall curves  400 / 2000 - precision: 0.618 - recall: 0.127
precion/recall curves  450 / 2000 - precision: 0.607 - recall: 0.140
precion/recall curves  500 / 2000 - precision: 0.600 - recall: 0.154
precion/recall curves  550 / 2000 - precision: 0.600 - recall: 0.169
precion/recall curves  600 / 2000 - precision: 0.597 - recall: 0.184
precion/recall curves  650 / 2000 - precision: 0.577 - recall: 0.192
precion/recall curves  700 / 2000 - precision: 0.566 - recall: 0.203
precion/recall curves  750 / 2000 - precision: 0.549 - recall: 0.211
precion/recall curves  800 / 2000 - precision: 0.543 - recall: 0.223
precion/recall curves  850 / 2000 - precision: 0.536 - recall: 0.234
precion/recall curves  900 / 2000 - precision: 0.530 - recall: 0.245
precion/recall curves  950 / 2000 - precision: 0.525 - recall: 0.256
precion/recall curves 1000 / 2000 - precision: 0.519 - recall: 0.266
precion/recall curves 1050 / 2000 - precision: 0.506 - recall: 0.272
precion/recall curves 1100 / 2000 - precision: 0.495 - recall: 0.279
precion/recall curves 1150 / 2000 - precision: 0.489 - recall: 0.288
precion/recall curves 1200 / 2000 - precision: 0.479 - recall: 0.295
precion/recall curves 1250 / 2000 - precision: 0.473 - recall: 0.303
precion/recall curves 1300 / 2000 - precision: 0.468 - recall: 0.312
precion/recall curves 1350 / 2000 - precision: 0.461 - recall: 0.319
precion/recall curves 1400 / 2000 - precision: 0.452 - recall: 0.325
precion/recall curves 1450 / 2000 - precision: 0.443 - recall: 0.329
precion/recall curves 1500 / 2000 - precision: 0.437 - recall: 0.336
precion/recall curves 1550 / 2000 - precision: 0.431 - recall: 0.343
precion/recall curves 1600 / 2000 - precision: 0.423 - recall: 0.347
precion/recall curves 1650 / 2000 - precision: 0.416 - recall: 0.352
precion/recall curves 1700 / 2000 - precision: 0.415 - recall: 0.362
precion/recall curves 1750 / 2000 - precision: 0.411 - recall: 0.369
precion/recall curves 1800 / 2000 - precision: 0.404 - recall: 0.373
precion/recall curves 1850 / 2000 - precision: 0.399 - recall: 0.378
precion/recall curves 1900 / 2000 - precision: 0.394 - recall: 0.384
precion/recall curves 1950 / 2000 - precision: 0.388 - recall: 0.388
precion/recall curves 2000 / 2000 - precision: 0.384 - recall: 0.394

test use time - 00:01:18

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 22/25 - current_alpha: 0.00081782 - loss: 0.130612 - 00:04:07

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.740 - recall: 0.019
precion/recall curves  100 / 2000 - precision: 0.760 - recall: 0.039
precion/recall curves  150 / 2000 - precision: 0.733 - recall: 0.056
precion/recall curves  200 / 2000 - precision: 0.720 - recall: 0.074
precion/recall curves  250 / 2000 - precision: 0.684 - recall: 0.088
precion/recall curves  300 / 2000 - precision: 0.650 - recall: 0.100
precion/recall curves  350 / 2000 - precision: 0.620 - recall: 0.111
precion/recall curves  400 / 2000 - precision: 0.613 - recall: 0.126
precion/recall curves  450 / 2000 - precision: 0.591 - recall: 0.136
precion/recall curves  500 / 2000 - precision: 0.596 - recall: 0.153
precion/recall curves  550 / 2000 - precision: 0.593 - recall: 0.167
precion/recall curves  600 / 2000 - precision: 0.578 - recall: 0.178
precion/recall curves  650 / 2000 - precision: 0.565 - recall: 0.188
precion/recall curves  700 / 2000 - precision: 0.557 - recall: 0.200
precion/recall curves  750 / 2000 - precision: 0.560 - recall: 0.215
precion/recall curves  800 / 2000 - precision: 0.558 - recall: 0.229
precion/recall curves  850 / 2000 - precision: 0.553 - recall: 0.241
precion/recall curves  900 / 2000 - precision: 0.543 - recall: 0.251
precion/recall curves  950 / 2000 - precision: 0.529 - recall: 0.258
precion/recall curves 1000 / 2000 - precision: 0.522 - recall: 0.268
precion/recall curves 1050 / 2000 - precision: 0.518 - recall: 0.279
precion/recall curves 1100 / 2000 - precision: 0.508 - recall: 0.287
precion/recall curves 1150 / 2000 - precision: 0.497 - recall: 0.293
precion/recall curves 1200 / 2000 - precision: 0.484 - recall: 0.298
precion/recall curves 1250 / 2000 - precision: 0.476 - recall: 0.305
precion/recall curves 1300 / 2000 - precision: 0.467 - recall: 0.311
precion/recall curves 1350 / 2000 - precision: 0.460 - recall: 0.318
precion/recall curves 1400 / 2000 - precision: 0.452 - recall: 0.325
precion/recall curves 1450 / 2000 - precision: 0.444 - recall: 0.330
precion/recall curves 1500 / 2000 - precision: 0.439 - recall: 0.338
precion/recall curves 1550 / 2000 - precision: 0.435 - recall: 0.346
precion/recall curves 1600 / 2000 - precision: 0.428 - recall: 0.351
precion/recall curves 1650 / 2000 - precision: 0.419 - recall: 0.355
precion/recall curves 1700 / 2000 - precision: 0.415 - recall: 0.362
precion/recall curves 1750 / 2000 - precision: 0.407 - recall: 0.365
precion/recall curves 1800 / 2000 - precision: 0.399 - recall: 0.368
precion/recall curves 1850 / 2000 - precision: 0.393 - recall: 0.373
precion/recall curves 1900 / 2000 - precision: 0.388 - recall: 0.378
precion/recall curves 1950 / 2000 - precision: 0.384 - recall: 0.384
precion/recall curves 2000 / 2000 - precision: 0.380 - recall: 0.390

test use time - 00:01:19

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 23/25 - current_alpha: 0.00080146 - loss: 0.127765 - 00:03:55

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.740 - recall: 0.019
precion/recall curves  100 / 2000 - precision: 0.740 - recall: 0.038
precion/recall curves  150 / 2000 - precision: 0.700 - recall: 0.054
precion/recall curves  200 / 2000 - precision: 0.690 - recall: 0.071
precion/recall curves  250 / 2000 - precision: 0.676 - recall: 0.087
precion/recall curves  300 / 2000 - precision: 0.653 - recall: 0.101
precion/recall curves  350 / 2000 - precision: 0.637 - recall: 0.114
precion/recall curves  400 / 2000 - precision: 0.627 - recall: 0.129
precion/recall curves  450 / 2000 - precision: 0.616 - recall: 0.142
precion/recall curves  500 / 2000 - precision: 0.604 - recall: 0.155
precion/recall curves  550 / 2000 - precision: 0.584 - recall: 0.165
precion/recall curves  600 / 2000 - precision: 0.562 - recall: 0.173
precion/recall curves  650 / 2000 - precision: 0.557 - recall: 0.186
precion/recall curves  700 / 2000 - precision: 0.543 - recall: 0.195
precion/recall curves  750 / 2000 - precision: 0.537 - recall: 0.207
precion/recall curves  800 / 2000 - precision: 0.531 - recall: 0.218
precion/recall curves  850 / 2000 - precision: 0.529 - recall: 0.231
precion/recall curves  900 / 2000 - precision: 0.526 - recall: 0.243
precion/recall curves  950 / 2000 - precision: 0.519 - recall: 0.253
precion/recall curves 1000 / 2000 - precision: 0.503 - recall: 0.258
precion/recall curves 1050 / 2000 - precision: 0.494 - recall: 0.266
precion/recall curves 1100 / 2000 - precision: 0.489 - recall: 0.276
precion/recall curves 1150 / 2000 - precision: 0.483 - recall: 0.285
precion/recall curves 1200 / 2000 - precision: 0.477 - recall: 0.293
precion/recall curves 1250 / 2000 - precision: 0.466 - recall: 0.298
precion/recall curves 1300 / 2000 - precision: 0.456 - recall: 0.304
precion/recall curves 1350 / 2000 - precision: 0.448 - recall: 0.310
precion/recall curves 1400 / 2000 - precision: 0.443 - recall: 0.318
precion/recall curves 1450 / 2000 - precision: 0.434 - recall: 0.323
precion/recall curves 1500 / 2000 - precision: 0.429 - recall: 0.330
precion/recall curves 1550 / 2000 - precision: 0.425 - recall: 0.337
precion/recall curves 1600 / 2000 - precision: 0.420 - recall: 0.345
precion/recall curves 1650 / 2000 - precision: 0.415 - recall: 0.351
precion/recall curves 1700 / 2000 - precision: 0.409 - recall: 0.356
precion/recall curves 1750 / 2000 - precision: 0.402 - recall: 0.361
precion/recall curves 1800 / 2000 - precision: 0.397 - recall: 0.366
precion/recall curves 1850 / 2000 - precision: 0.391 - recall: 0.371
precion/recall curves 1900 / 2000 - precision: 0.387 - recall: 0.377
precion/recall curves 1950 / 2000 - precision: 0.383 - recall: 0.383
precion/recall curves 2000 / 2000 - precision: 0.377 - recall: 0.387

test use time - 00:01:19

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 24/25 - current_alpha: 0.00078543 - loss: 0.124412 - 00:03:38

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.740 - recall: 0.019
precion/recall curves  100 / 2000 - precision: 0.720 - recall: 0.037
precion/recall curves  150 / 2000 - precision: 0.720 - recall: 0.055
precion/recall curves  200 / 2000 - precision: 0.700 - recall: 0.072
precion/recall curves  250 / 2000 - precision: 0.692 - recall: 0.089
precion/recall curves  300 / 2000 - precision: 0.657 - recall: 0.101
precion/recall curves  350 / 2000 - precision: 0.654 - recall: 0.117
precion/recall curves  400 / 2000 - precision: 0.640 - recall: 0.131
precion/recall curves  450 / 2000 - precision: 0.611 - recall: 0.141
precion/recall curves  500 / 2000 - precision: 0.612 - recall: 0.157
precion/recall curves  550 / 2000 - precision: 0.593 - recall: 0.167
precion/recall curves  600 / 2000 - precision: 0.580 - recall: 0.178
precion/recall curves  650 / 2000 - precision: 0.571 - recall: 0.190
precion/recall curves  700 / 2000 - precision: 0.556 - recall: 0.199
precion/recall curves  750 / 2000 - precision: 0.549 - recall: 0.211
precion/recall curves  800 / 2000 - precision: 0.549 - recall: 0.225
precion/recall curves  850 / 2000 - precision: 0.541 - recall: 0.236
precion/recall curves  900 / 2000 - precision: 0.537 - recall: 0.248
precion/recall curves  950 / 2000 - precision: 0.527 - recall: 0.257
precion/recall curves 1000 / 2000 - precision: 0.515 - recall: 0.264
precion/recall curves 1050 / 2000 - precision: 0.507 - recall: 0.273
precion/recall curves 1100 / 2000 - precision: 0.501 - recall: 0.283
precion/recall curves 1150 / 2000 - precision: 0.489 - recall: 0.288
precion/recall curves 1200 / 2000 - precision: 0.482 - recall: 0.296
precion/recall curves 1250 / 2000 - precision: 0.474 - recall: 0.304
precion/recall curves 1300 / 2000 - precision: 0.461 - recall: 0.307
precion/recall curves 1350 / 2000 - precision: 0.456 - recall: 0.315
precion/recall curves 1400 / 2000 - precision: 0.448 - recall: 0.322
precion/recall curves 1450 / 2000 - precision: 0.439 - recall: 0.326
precion/recall curves 1500 / 2000 - precision: 0.432 - recall: 0.332
precion/recall curves 1550 / 2000 - precision: 0.428 - recall: 0.341
precion/recall curves 1600 / 2000 - precision: 0.424 - recall: 0.348
precion/recall curves 1650 / 2000 - precision: 0.415 - recall: 0.351
precion/recall curves 1700 / 2000 - precision: 0.410 - recall: 0.357
precion/recall curves 1750 / 2000 - precision: 0.406 - recall: 0.365
precion/recall curves 1800 / 2000 - precision: 0.400 - recall: 0.369
precion/recall curves 1850 / 2000 - precision: 0.395 - recall: 0.374
precion/recall curves 1900 / 2000 - precision: 0.392 - recall: 0.382
precion/recall curves 1950 / 2000 - precision: 0.389 - recall: 0.389
precion/recall curves 2000 / 2000 - precision: 0.383 - recall: 0.393

test use time - 00:01:19

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Epoch 25/25 - current_alpha: 0.00076973 - loss: 0.124694 - 00:04:05

##################################################

Test start...

Number of test samples for non NA relation: 1950

precion/recall curves   50 / 2000 - precision: 0.760 - recall: 0.019
precion/recall curves  100 / 2000 - precision: 0.730 - recall: 0.037
precion/recall curves  150 / 2000 - precision: 0.720 - recall: 0.055
precion/recall curves  200 / 2000 - precision: 0.715 - recall: 0.073
precion/recall curves  250 / 2000 - precision: 0.692 - recall: 0.089
precion/recall curves  300 / 2000 - precision: 0.657 - recall: 0.101
precion/recall curves  350 / 2000 - precision: 0.634 - recall: 0.114
precion/recall curves  400 / 2000 - precision: 0.623 - recall: 0.128
precion/recall curves  450 / 2000 - precision: 0.611 - recall: 0.141
precion/recall curves  500 / 2000 - precision: 0.590 - recall: 0.151
precion/recall curves  550 / 2000 - precision: 0.587 - recall: 0.166
precion/recall curves  600 / 2000 - precision: 0.577 - recall: 0.177
precion/recall curves  650 / 2000 - precision: 0.565 - recall: 0.188
precion/recall curves  700 / 2000 - precision: 0.551 - recall: 0.198
precion/recall curves  750 / 2000 - precision: 0.540 - recall: 0.208
precion/recall curves  800 / 2000 - precision: 0.533 - recall: 0.218
precion/recall curves  850 / 2000 - precision: 0.519 - recall: 0.226
precion/recall curves  900 / 2000 - precision: 0.520 - recall: 0.240
precion/recall curves  950 / 2000 - precision: 0.511 - recall: 0.249
precion/recall curves 1000 / 2000 - precision: 0.501 - recall: 0.257
precion/recall curves 1050 / 2000 - precision: 0.492 - recall: 0.265
precion/recall curves 1100 / 2000 - precision: 0.484 - recall: 0.273
precion/recall curves 1150 / 2000 - precision: 0.477 - recall: 0.282
precion/recall curves 1200 / 2000 - precision: 0.469 - recall: 0.289
precion/recall curves 1250 / 2000 - precision: 0.468 - recall: 0.300
precion/recall curves 1300 / 2000 - precision: 0.463 - recall: 0.309
precion/recall curves 1350 / 2000 - precision: 0.454 - recall: 0.314
precion/recall curves 1400 / 2000 - precision: 0.449 - recall: 0.323
precion/recall curves 1450 / 2000 - precision: 0.440 - recall: 0.327
precion/recall curves 1500 / 2000 - precision: 0.436 - recall: 0.335
precion/recall curves 1550 / 2000 - precision: 0.428 - recall: 0.341
precion/recall curves 1600 / 2000 - precision: 0.426 - recall: 0.350
precion/recall curves 1650 / 2000 - precision: 0.419 - recall: 0.354
precion/recall curves 1700 / 2000 - precision: 0.413 - recall: 0.360
precion/recall curves 1750 / 2000 - precision: 0.406 - recall: 0.365
precion/recall curves 1800 / 2000 - precision: 0.398 - recall: 0.368
precion/recall curves 1850 / 2000 - precision: 0.395 - recall: 0.374
precion/recall curves 1900 / 2000 - precision: 0.389 - recall: 0.379
precion/recall curves 1950 / 2000 - precision: 0.383 - recall: 0.383
precion/recall curves 2000 / 2000 - precision: 0.379 - recall: 0.389

test use time - 00:01:19

模型保存成功, 保存目录为: ./output/

Test end.

##################################################

Train end.

##################################################

$ tree
.
├── build
│   ├── test
│   └── train
├── clean.sh
├── init.h
├── output
│   ├── attention_weights.txt
│   ├── conv_1d.txt
│   ├── position_vec.txt
│   ├── pr.txt
│   ├── relation_matrix.txt
│   └── word2vec.txt
├── run.sh
├── test.cpp
├── test.h
└── train.cpp

2 directories, 14 files
$ bash clean.sh 

##################################################

./build 目录递归删除成功.

##################################################

$ tree
.
├── clean.sh
├── init.h
├── output
│   ├── attention_weights.txt
│   ├── conv_1d.txt
│   ├── position_vec.txt
│   ├── pr.txt
│   ├── relation_matrix.txt
│   └── word2vec.txt
├── run.sh
├── test.cpp
├── test.h
└── train.cpp

1 directory, 12 files
$ 
```

### 训练和测试的参数

#### train.cpp

```shell
// ./train [-batch BATCH] [-threads THREAD] [-alpha ALPHA]
//         [-init_rate INIT_RATE] [-reduce_epoch REDUCE_EPOCH]
//         [-epochs EPOCHS] [-limit LIMIT] [-dimension_pos DIMENSION_POS]
//         [-window WINDOW] [-dimension_c DIMENSION_C]
//         [-dropout DROPOUT] [-output_model 0/1]
//         [-note NOTE] [-data_path DATA_PATH]
//         [-output_path OUTPUT_PATH] [--help]

// optional arguments:
// -batch BATCH                   batch size. if unspecified, batch will default to [40]
// -threads THREAD                number of worker threads. if unspecified, num_threads will default to [32]
// -alpha ALPHA                   learning rate. if unspecified, alpha will default to [0.00125]
// -init_rate INIT_RATE           init rate of learning rate. if unspecified, current_rate will default to [1.0]
// -reduce_epoch REDUCE_EPOCH     reduce of init rate of learning rate per epoch. if unspecified, reduce_epoch will default to [0.98]
// -epochs EPOCHS                 number of epochs. if unspecified, epochs will default to [25]
// -limit LIMIT                   限制句子中 (头, 尾) 实体相对每个单词的最大距离. 默认值为 [30]
// -dimension_pos DIMENSION_POS   位置嵌入维度，默认值为 [5]
// -window WINDOW                 一维卷积的 window 大小. 默认值为 [3]
// -dimension_c DIMENSION_C       sentence embedding size, if unspecified, dimension_c will default to [230]
// -dropout DROPOUT               dropout probability. if unspecified, dropout_probability will default to [0.5]
// -output_model 0/1              [1] 保存模型, [0] 不保存模型. 默认值为 [1]
// -note NOTE                     information you want to add to the filename, like ("./output/word2vec" + note + ".txt"). if unspecified, note will default to ""
// -data_path DATA_PATH           folder of data. if unspecified, data_path will default to "../data/"
// -output_path OUTPUT_PATH       folder of outputing results (precion/recall curves) and models. if unspecified, output_path will default to "./output/"
// --help                         print help information of ./train
```

#### test.cpp

```shell
// ./test [-threads THREAD] [-dropout DROPOUT]
//        [-note NOTE] [-data_path DATA_PATH]
//        [-load_path LOAD_PATH] [--help]

// optional arguments:
// -threads THREAD                number of worker threads. if unspecified, num_threads will default to [32]
// -note NOTE                     information you want to add to the filename, like ("./output/word2vec" + note + ".txt"). if unspecified, note will default to ""
// -data_path DATA_PATH           folder of data. if unspecified, data_path will default to "../data/"
// -load_path LOAD_PATH           folder of pretrained models. if unspecified, load_path will default to "./output/"
// --help                         print help information of ./test
```

## 结语

第三十六篇博文写完，开心！！！！

今天，也是充满希望的一天。