---
title: TransE 原论文学习笔记-ubuntu
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
  - 知识表示学习
  - 知识图谱补全
categories: Paper
description: TransE 原论文学习笔记，包括代码实现。
cover: 'https://cos.luyf-lemon-love.space/images/ionia_placidium_01.jpg'
abbrlink: 1560426839
date: 2022-10-10 11:56:26
---

## 前言

`TransE` 是一个著名的`知识表示学习` (`knowledge representation learning`, KRL) 模型。

本博文是 `TransE` 原论文学习笔记，包括代码实现。

**TransE** 原论文链接：[Translating Embeddings for Modeling Multi-relational Data](https://proceedings.neurips.cc/paper/2013/file/1cecc7a77928ca8133fa24680a88d2f9-Paper.pdf)

**代码仓库地址**：https://github.com/LuYF-Lemon-love/susu-knowledge-graph/tree/main/knowledge-representation-learning/C%2B%2B .

操作系统：Ubuntu 18.04.6 LTS

## 参考文档

<div id = "1"></div>

1. [Translating Embeddings for Modeling Multi-relational Data](https://proceedings.neurips.cc/paper/2013/file/1cecc7a77928ca8133fa24680a88d2f9-Paper.pdf).

<div id = "2"></div>

2. T. Mikolov, I. Sutskever, K. Chen, G. Corrado, and J. Dean. Distributed representations of words and phrases and their compositionality. In Advances in Neural Information Processing Systems (NIPS 26), 2013.

<div id = "3"></div>

3. X. Glorot and Y. Bengio. Understanding the difficulty of training deep feedforward neural networks. In Proceedings of the International Conference on Artificial Intelligence and Statistics (AISTATS)., 2010.

<div id = "4"></div>

4. A. Bordes, J. Weston, R. Collobert, and Y. Bengio. Learning structured embeddings of knowledge bases. In Proceedings of the 25th Annual Conference on Artificial Intelligence (AAAI), 2011.

<div id = "5"></div>

5. R. Socher, D. Chen, C. D. Manning, and A. Y. Ng. Learning new facts from knowledge bases with neural tensor networks and semantic word vectors. In Advances in Neural Information Processing Systems (NIPS 26), 2013.

<div id = "6"></div>

6. M. Nickel, V. Tresp, and H.-P. Kriegel. A three-way model for collective learning on multi-relational data. In Proceedings of the 28th International Conference on Machine Learning (ICML), 2011.

<div id = "7"></div>

7. R. Jenatton, N. Le Roux, A. Bordes, G. Obozinski, et al. A latent factor model for highly multi-relational data. In Advances in Neural Information Processing Systems (NIPS 25), 2012.

<div id = "8"></div>

8. A. Bordes, X. Glorot, J. Weston, and Y. Bengio. A semantic matching energy function for learning with multi-relational data. Machine Learning, 2013.

<div id = "9"></div>

9. [torch.nn.init.xavier_uniform_](https://pytorch.org/docs/stable/nn.init.html#torch.nn.init.xavier_uniform_).

<div id = "10"></div>

10. J. Weston, A. Bordes, O. Yakhnenko, and N. Usunier. Connecting language and knowledge bases with embedding models for relation extraction. In Proceedings of the Conference on Empirical Methods in Natural Language Processing (EMNLP), 2013.

## TransE 原论文学习笔记

**TransE** 提出于 *2013* 年, 发表于 [NeurIPS](https://neurips.cc/) 会议论文. 为什么介绍 *2013* 年的 **TransE**, 因为 **TransE** 相对于它的变体, **简洁, 高效, 又不失准确**.

**TransE** 是一个将**关系**建模成**实体低维度嵌入向量**的**平移**的方法.

**TransE** `成功地`在一个大型知识图谱 (`1M` 个实体, `25k` 个关系, 超过 `17M` 个训练三元组)上完成训练 (学习).

### **介绍**

**Multi-relational data** 是指**有向图**, 它的**节点**被称为**实体**, *(head, label, tail)* 形式的**边** (标注为 *$(h, \ell, t)$*)能够指示在 *head* 和 *tail* 实体之间存在一个名为 *label* 的**关系**.

`TransE` 在论文中`建模`了来自 `Wordnet` 和 `Freebase` 的 `Multi-relational data`.

 **TransE** 是一个不需要**额外知识**，**自动**加新事实 (三元组) **补全**知识图谱的高效工具.

通过`对比`其他类型`知识表示学习`模型`表明`, 即使在`复杂`和`异构`的`多关系领域`中，`简单`而`适当`的`建模假设`可以在`准确性`和`可扩展性`之间实现更好的`权衡`。

**TransE** 是一个基于能量 *(energy-based)* 的学习**实体低维度嵌入向量**的模型. **关系**被表示为**嵌入空间**的**平移**: 如果 *$(h, \ell, t)$* 成立, *t* 的嵌入应该接近于 *h* 的嵌入加上某个**向量**, 某个向量就是**关系的嵌入** ($\ell$).

我们基于翻译的参数化背后的主要动机是，分层关系在KB中非常普遍，而翻译是表示它们的自然转换。

基于`平移` 的 `TransE` 主要`设计动机`是: `层次性关系`在知识图谱中非常普遍, `平移`是`表示实体`的`自然转换`. 如, `null` `平移向量`对应于`实体之间的等价关系`, 因此`平移`也可以表示`同级关系` (`父子关系`中的`兄弟关系`). 因此, 可以使用`每个关系`的 `parameter budget`（一个`低维向量`）来表示`知识图谱`中的关键 (`关系`).

`TransE` 的`第二个设计动机`是: `Mikolov` 等研究者于 `2013` 年提出了`词表示学习模型` —— `word2vec`[<sup>2</sup>](#2), 并发现 `word2vec` 学习到的`词向量`之间有着`有趣的语义平移现象`, 如:

$$
\nu(国王) - \nu(男人) \simeq \nu(王后) - \nu(女人)
$$

其中, $\nu(x)$ 表示 $x$ 的词向量, 这种`语义平移现象`表明了`词和词之间的隐含语义关系`被成功地`编码进了词向量中`. `word2vec` 表明存在`不同类型实体`之间的 `1-to-1` 关系能够表示成`嵌入向量空间`的平移.

由于 `TransE` 的`轻量参数`, 它能够`成功地`在包含 `1M` 实体, `25k`关系, 超过 `17M` 训练三元组的 `Freebase` 的`大型子集`上进行训练。

### **`Translation-based` model**

训练集 *$S$* 是由`三元组` *$(h, \ell, t)$* 组成, *$h, t \in E$* (实体集合), *$\ell \in L$* (关系集合), **TransE** 学习`实体`和`关系`的`嵌入向量`. 嵌入向量的值为 *$R^k$* (*$k$* 是超参数).

模型的基本思想是关系 *$\ell$* 是嵌入向量的平移, 例如: 如果 *$(h, \ell, t)$* 成立, *$h + \ell \approx t$*, 即 *$t$* 应该是 *$h + \ell$* 最近的邻居, 如果不成立, *$h + \ell$* 应该远离 *$t$*. 根据`能量框架` (`energy-based framework`), `三元组的能量`应该等价于 *$d(h + \ell, t)$*, `差异性度量`函数 *$d$* 是 **$L_1$** 或者 **$L_2-norm$**.

为了`学习嵌入向量`, 在训练集上`最小化` **margin-based ranking criterion** 损失函数:

$$
\mathcal{L} = \sum_{(h, \ell, t) \in S} \sum_{(h^{'}, \ell, t^{'}) \in S^{'}_{(h, \ell, t)}} [\gamma + d(h + \ell, t) - d(h^{'} + \ell, t^{'})]_{+}
$$

*$[x]_+$* 显示 *$x$* 正的部分, *$\gamma > 0$* 是一个 **margin** 超参数.

$$
S^{'}_{(h, \ell, t)} = \{(h^{'}, \ell, t)|h^{'} \in E\} \cup \{(h, \ell, t^{'})|t^{'} \in E\}.
$$

**负三元组** (`corrupted triplets`) 集合是`根据上面的公式`构造的, 是将`训练集三元组`中的 `head` 或者 `tail` 实体用`随机的实体`替换得到的 (**`head` 和 `tail` 不同时替换**). **损失函数会使`训练集中的三元组的能量`比`负三元组`低**. 实体作为三元组的 `head` 和 `tail` 时的嵌入向量相同.

优化方法是**随机梯度下降** (`SGD`), 并且使用 **$L_2-norm$** 将`实体`和`关系`的`嵌入向量`限制为 `1` (it prevents the
training process to `trivially` minimize $\mathcal{L}$ by artificially increasing entity embeddings norms.[<sup>2</sup>](#2)).

详细的训练过程如下图. 首先, 实体和关系的嵌入被随机初始化 (使用 `Xavier 初始值` 进行初始化[<sup>3</sup>](#3)). 每一轮 (epoch) 迭代, `实体和关系`的嵌入首先被**归一化 ( `normalized`)**, 然后从训练集中采样 `1 batch` 三元组作为`正三元组`; 对于每一个采样得到的正三元组, 随机替换 `head` 或 `tail` (**使用伯努利分布（Bernoulli distribution) 可以更加高效的选择替换 head 或 tail**)得到一个`负三元组`. 然后采用**`固定学习率`**的梯度`更新`实体和关系的嵌入向量. 该迭代过程`基于验证集上表现`停止.

![](https://cos.luyf-lemon-love.space/images/20220926131142.png)

{% folding red, Xavier 初始值简介[<sup>9</sup>](#9) %}

该模型层的`激活函数`为 `None`, `tanh`, `logistic`, `softmax` 时, 神经元初始化准则为:

1. `正态分布`, 均值为 `0`, 方差为 $\sigma^2 = \frac{1}{fan_{avg}}$

`or`

2. $-r$ 和 $+r$ 之间的`均匀分布`, 其中 $r = \sqrt{\frac{3}{fan_{avg}}}$

其中, $fan_{avg} = \frac{(fan_{in} + fan_{out})}{2}$, $fan_{in}$ 是`前一层的节点数`, $fan_{out}$ 是`下一层的节点数`.

{% endfolding %}

### 相关工作

1. `Structured Embeddings or SE`[<sup>4</sup>](#4), 虽然 `SE` 能够重现 `TransE` 的 `平移`, 但是 `TransE` 在实验中表现的更好. 主要原因如下:
   
   - `TransE` 更直接的表达`关系的特性` (`平移`).
   - 在`嵌入模型`中, 优化是异常困难的.
   - 对于 `SE` 来说, `更大的表现力`似乎更像是`欠拟合`的同义词，而不是`更好的性能`.

2. 相比于 `the Neural Tensor Model`[<sup>5</sup>](#5), `TransE` 的有较少的参数: 这可以`简化训练`并防止`欠拟合`, 并可能`弥补较低的表现力`.

3. `TransE`，可以看作是`编码一系列 2-way 交互`. 对于 $h$, $\ell$ 和 $t$ 之间存在的 `3-way` 依赖是相当重要的数据, `TransE` 不能够很好地建模 (相比于 `RESCAL`[<sup>6</sup>](#6) `LFM`[<sup>7</sup>](#7) `SME`[<sup>8</sup>](#8))

4. 为了处理像 `Freebase` 这样的通用大规模知识图谱, 人们应该首先正确地建模`最常见的连接模式`, 就像 `TransE` 所做的那样.

### 实验

#### 数据集

数据来自于 `Wordnet` 和 `Freebase`. 数据集的统计如下:

|DATA SET|WN|FB15K|FB1M|
|:-:|:-:|:-:|:-:|
|ENTITIES|40,943|14,951|1×10<sup>6</sup>|
|RELATIONSHIPS|18|1,345|23,382|
|TRAIN. EX.|141,442|483,142|17.5×10<sup>6</sup>|
|VALID EX.|5,000|50,000|50,000|
|TEST EX.|5,000|59,071|177,404|

>**`Wordnet`**: This `KB` is designed to `produce an intuitively usable dictionary and thesaurus`, and support `automatic text analysis`. Its entities (termed synsets) correspond to `word senses`, and relationships define lexical relations between them. We considered the data version used in [8](#8), which we denote WN in the following. Examples of triplets are `(_score_NN_1, _hypernym, _evaluation_NN_1)` or `(_score_NN_2, _has_part, _musical_notation_NN_1)`. WN is `composed of senses`, its entities are denoted by `the concatenation of a word, its part-of-speech tag and a digit` indicating which sense it refers to i.e. `_score_NN_1` encodes the first meaning of the noun “score”.
>
>**`Freebase`**: Freebase is a huge and growing KB of general facts; there are currently around **1.2 billion triplets** and **more than 80 million entities**. We created two data sets with Freebase.

实验数据集为 [FB15K](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/tree/main/knowledge-representation-learning/C%2B%2B/data/FB15K). 该数据集是 `Wikilinks database` 的`实体子集`, 该子集中的实体和关系在 `Freebase` 至少出现了 `100` 次. 并且移除了像 ’!/people/person/nationality’ 这样的关系, 因为它是关系 ’/people/person/nationality’ `head` 和 `tail` 的颠倒. 一共 **592,213** 个三元组, **14,951** 个实体, **1,345** 个关系, 被`随机地`分成了训练集 (**483,142** 个), 验证集 (**50,000** 个), 测试集 (**59,071** 个).

`FB1M`: 是从 `Freebase` 创建了`另一个数据集`, 方法是`选择最常出现的 100 万个实体`. 该数据大约有 `25k` 个关系和超过 `1700` 万训练三元组.

#### 实验设置

**评估准则**: 测试集中的三元组全部都是`正三元组`. 对于每一个测试三元组, `head` 被`所有实体`依次替换, 通过模型计算各个负三组的能量 **$d(h^{'} + \ell, t)$**, 然后用升序排序. 测试三元组 (正三元组) 的名次被保存. 替换 `tail` 而不是 `head` 重复上面的过程. 最终报告`测试三元组的平均排名`和 *`hits@10`* (`测试三元组`排在`前 10` 的比例).

上面的指标`可能存在缺陷`, 因为一些`"负三元组"`可能存在于`训练集`和`验证集`. 在这种情况下,这些`"负三元组"`的排名可能`高于`测试三元组, 但这种`"负三元组"`不应该归类为错误, 因为`测试三元组`和`负三元组`都是正确的. **为了排除指标的缺陷, 移除了出现在数据集 (训练集, 验证集, 测试集) 中的`负三元组`. 确保了负三元组不属于数据集**. 因此有两种设置的指标 (`平均排名`和 *`hits@10`*): 原始 (存在缺陷) 被标记为 *raw*, 新的被标记为 *`filtered`* (or *`filt.`*).

{% label Baselines  pink %}

1. `Unstructured`: a version of `TransE` which considers the data as `mono-relational` and sets all `translations` to 0.

2. `RESCAL`: the collective matrix factorization model.

3. `SE`: energy-based models.

4. `SME(linear)/SME(bilinear)`: energy-based models.

5. `LFM`: energy-based models.

{% folding red, 基线模型的额外信息 %}

`RESCAL` is trained via `an alternating least-square method`, whereas `the others` are trained by `stochastic gradient descent`, like `TransE`.

`SME(linear)`, `SME(bilinear)`, `LFM` and `TransE` have about `the same number of parameters` as `Unstructured` for `low dimensional embeddings`, the other algorithms `SE` and `RESCAL`, which learn at least `one k × k matrix` for each relationship rapidly need to `learn many parameters`.

`RESCAL` needs `about 87 times more parameters` on `FB15k` because it requires `a much larger embedding space` than other models to achieve good performance.

{% endfolding %}

{% label Implementation  green %}

{% folding red, TransE 超参数选择 %}

For experiments with `TransE`, we selected the learning rate $\lambda$ for `the stochastic gradient descent` among `{0.001, 0.01, 0.1}`, the margin $\gamma$ among `{1, 2, 10}` and the latent dimension $k$ among `{20, 50}` on `the validation set` of `each data set`.

The `dissimilarity measure` $d$ was set either to the $L_1$ or $L_2$ distance according to `validation performance` as well.

{% endfolding %}

**WN 的最佳参数**: 嵌入维度 **$k = 20$**, 学习率 **$\lambda = 0.01$**, **margin $\gamma = 2$**, 能量函数 **$d = L_1$**.

**FB15K 的最佳参数**: 嵌入维度 **$k = 50$**, 学习率 **$\lambda = 0.01$**, **margin $\gamma = 1$**, 能量函数 **$d = L_1$**.

**FB1M 的最佳参数**: 嵌入维度 **$k = 50$**, 学习率 **$\lambda = 0.01$**, **margin $\gamma = 1$**, 能量函数 **$d = L_2$**.

对于所有数据集, 最多训练 `1000 epochs`, 可以参考验证集上的平均排名 (raw) 使用提前停止获得最佳模型.

#### 链接预测

{% folding red, TransE 总体实验结果 %}

As expected, the `filtered` setting provides `lower mean ranks` and `higher` *hits@10*, which we believe are `a clearer evaluation of the performance of the methods in link prediction`.

`The trends` between `raw` and `filtered` are the same.

`TransE`, outperforms all counterparts on all metrics, usually with a wide margin.

The good performance of `TransE` is due to an appropriate design of the model according to the data, but also to its `relative simplicity`. This means that it can be `optimized efficiently with stochastic gradient`.

`SE` is `more expressive` than our proposal. However, its `complexity` may make it `quite hard to learn`, resulting in worse performance.

`TransE` is indeed less subject to `underfitting` and that this could explain its better performances.

{% folding red, 基线模型详细的总体实验结果 %}

`SME(bilinear)` and `LFM` suffer from the same training issue: we `never managed to train them well enough` so that they could exploit their full capabilities.

The poor results of `LFM` might also be explained by `our evaluation setting`, `based on ranking entities`, whereas `LFM` was `originally` proposed to `predict relationships`.

`RESCAL` can achieve quite good *hits@10* on FB15k but `yields poor mean ranks`, especially on `WN`, even when we used `large latent dimensions` (`2, 000` on `Wordnet`).

{% endfolding %}

The impact of the translation term is `huge`.

`Unstructured` simply `clusters` all entities cooccurring together, `independent of the relationships involved`, and hence can only make guesses of which entities are related.

On `FB1M`, `the mean ranks of TransE` and `Unstructured` are almost `similar`, but `TransE` places `10 times more predictions` in `the top 10`.

{% endfolding %}

---

根据 **head** 和 **tail** 的基数 (cardinalities) 能够将`关系`分成以下`四种`: **1-TO-1**, **1-TO-MANY**, **MANY-TO-1**, **MANY-TO-MANY**

1. `1-TO-1`: 一个 `head` 至多有一个 `tail`.

2. `1-TO-MANY`: 一个 `head` 有很多 `tail`.
  
3. `MANY-TO-1`: 许多 `head` 有很多相同 `tail`.

4. `MANY-TO-MANY`: 多个 `head` 和多个 `tail` 同时出现.

{% folding green, 关系划分方法 %}

We classified the relationships into these `four classes` by computing, for `each relationship` $\ell$, the `averaged number of heads` $h$ (respect. tails $t$) appearing in the `FB15k` data set, given a pair $(\ell, t)$ (respect. a pair $(h, \ell)$). If `this average number` was below `1.5` then the argument was labeled as `1` and `MANY` otherwise. For example, a `relationship` having `an average of 1.2 head per tail` and
of `3.2 tails per head` was classified as `1-to-Many`.

{% endfolding %}

`FB15k` 有 `26.2%` 的 `1-TO-1`, `22.7%` 的 `1-TO-MANY`, `28.3%` 的 `MANY-TO-1`, `22.8%` 的 `MANY-TO-MANY`.

可以发现类型为 **1-TO-MANY** 和 **MANY-TO-1** 的关系, 从 **MANY** 侧边预测 **1** 侧边具有很高的利用价值, 因为这种训练数据较多.

{% folding cyan, 关系划分方法 %}

Adding the `translation term` (i.e. upgrading `Unstructured` into `TransE`) brings the ability to `move in the embeddings space`, from `one entity cluster to another` by following relationships.

{% endfolding %}

---

![](https://cos.luyf-lemon-love.space/images/20220926171344.png)

上图使用 **TransE** 预测的 **tails** 中，黑体和斜体都是知识图谱已有的知识 (正三元组), 其余就是模型补全的, 即**知识图谱的补全**.

#### Learning to predict new relationships with few examples

{% folding yellow, 实验细节 %}

Using `FB15k`, we wanted to test how well methods could generalize to new facts by checking `how fast they were learning new relationships`.

To that end, we `randomly` selected `40` relationships and `split the data into two sets`: a set (named `FB15k-40rel`) containing all triplets with these `40` relationships and another set (`FB15k-rest`) containing the rest. We made sure that `both sets` contained all entities.

`FB15k-rest` has then been split into `a training set of 353,788 triplets` and `a validation set of 53,266`, and `FB15k-40rel` into `a training set of 40,000 triplets` (`1,000` for each relationship) and a test set of `45,159`.

Using these data sets, we conducted the following experiment: (1) models were `trained` and `selected` using `FB15k-rest training and validation sets`, (2) they were subsequently `trained` on `the training set FB15k-40rel` but only to learn the parameters related to `the fresh 40 relationships`, (3) they were evaluated in link prediction `on the test set of FB15k-40rel` (containing only relationships `unseen` during phase (1)).

We `repeated` this procedure while using `0`, `10`, `100` and `1000` examples of `each relationship` in phase (2).

{% endfolding %}

---

{% folding blue, 实验结果 %}

![](https://cos.luyf-lemon-love.space/images/20221011144348.png)

The performance of `Unstructured` is `the best` when `no example` of the unknown relationship is provided, because it `does not use this information to predict`.

But, of course, this performance `does not improve` while `providing labeled examples`.

`TransE` is the `fastest` method to learn: with only `10 examples` of a new relationship, the *hits@10* is already `18%` and it improves `monotonically` with the number of provided samples.

We believe the `simplicity` of the `TransE` model makes it able to `generalize` well, without having to `modify` any of `the already trained embeddings`.

{% endfolding %}

### Conclusion and future work

**TransE** 应用一共有三个: **知识图谱补全** (Link prediction), 知识表示, 嵌入到关系抽取模型中.

{% folding blue, 原论文 %}

We proposed `a new approach` to learn embeddings of KBs, focusing on the minimal parametrization of the model to `primarily represent hierarchical relationships`. We showed that it works very well `compared to competing methods` on `two different knowledge bases`, and is also `a highly scalable model`, whereby we applied it to `a very large-scale chunk of Freebase data`. Although it remains `unclear` to us if all relationship types can be `modeled adequately` by our approach, by breaking down the evaluation into `categories` (`1-to-1`, `1-to-Many`, . . . ) it `appears to be performing well` compared to other approaches across all settings.

Future work could analyze this model further, and also concentrates on exploiting it in more tasks, in particular, applications such as `learning word representations` inspired by [2](#2). `Combining KBs with text` as in [8](#8) is `another important direction` where our approach could prove useful. Hence, we recently fruitfully `inserted TransE into a framework for relation extraction` from text [10](#10).

{% endfolding %}

## 代码实现

运行结果显示：训练集中的关系一共为 *1345* 种，实体一共为 *14951* 种，三元组一共 *483142* 个。训练一共用时 **50.386622** 秒。

可以发现类型为 **1-n** 和 **n-1** 的关系, 从 **n** 面预测 **1** 面具有很高的利用价值, 因为这种训练数据较多.

对于大型知识图谱, 用全部种类的实体构建`负三元组`是极其耗时的, 因此用 **type_constrain.txt** 来构造负三元组. 该文件记录了**数据集** (训练集, 验证集, 测试集) 中各个关系 **head** 和 **tail** 出现过的种类.

## 结语

第三十五篇博文写完，开心！！！！

今天，也是充满希望的一天。