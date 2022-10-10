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

1. [Translating Embeddings for Modeling Multi-relational Data](https://proceedings.neurips.cc/paper/2013/file/1cecc7a77928ca8133fa24680a88d2f9-Paper.pdf)

<div id = "2"></div>

2. T. Mikolov, I. Sutskever, K. Chen, G. Corrado, and J. Dean. Distributed representations of words and phrases and their compositionality. In Advances in Neural Information Processing Systems (NIPS 26), 2013.

<div id = "3"></div>

3. X. Glorot and Y. Bengio. Understanding the difficulty of training deep feedforward neural networks. In Proceedings of the International Conference on Artificial Intelligence and Statistics (AISTATS)., 2010.

<div id = "4"></div>

4. A. Bordes, J. Weston, R. Collobert, and Y. Bengio. Learning structured embeddings of knowledge bases. In Proceedings of the 25th Annual Conference on Artificial Intelligence (AAAI), 2011.

<div id = "5"></div>

5. R. Socher, D. Chen, C. D. Manning, and A. Y. Ng. Learning new facts from knowledge bases with neural tensor networks and semantic word vectors. In Advances in Neural Information Processing Systems (NIPS 26), 2013.

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

{% folding red, Xavier 初始值简介 %}

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

2. `the Neural Tensor Model`[<sup>5</sup>](#5),




















>Freebase is a huge and growing KB of general facts; there are currently around **1.2 billion triplets** and **more than 80 million entities**. -- TransE paper **2013**

实验数据集为 [FB15K](https://github.com/LuYF-Lemon-love/susu-knowledge-graph/tree/main/knowledge-embedding/C%2B%2B/data/FB15K). 该数据集是 Wikilinks database 的实体子集, 该子集中的实体和关系在 Freebase 至少出现了 100 次. 并且移除了 ’!/people/person/nationality’ 的关系, 因为它是关系 ’/people/person/nationality’ head 和 tail 的颠倒. 一共 **592,213** 个三元组, **14,951** 种实体, **1,345** 种关系, 被随机分成了训练集 (**483,142** 个), 验证集 (**50,000** 个), 测试集 (**59,071** 个).

---

**评估准则**: 测试集中的三元组全部都是正三元组. 对于每一个测试三元组, head 被所有的实体依次替换, 通过模型计算各个负三组的 **$d(h^{'} + \ell, t)$**, 然后用升序排序. 测试三元组 (正三元组) 的名次被保存. 替换 tail 而不是 head 重复上面的过程. 最终报告测试三元组的平均排名和 *hits@10* (测试三元组排在前 10 的比例).

上面的指标可能存在缺陷, 因为一些负三元组可能存在于训练集和验证集. 在这种情况下,这些负三元组的排名可能高于测试三元组, 但这种不应该归类为错误, 因为测试三元组和负三元组都是正确的. **为了排除指标的缺陷, 移除了出现在数据集 (训练集, 验证集, 测试集) 中的负三元组. 确保了负三元组不属于数据集**. 因此有两种设置的指标 (平均排名和 *hits@10*): 原始 (存在缺陷) 被标记为 *raw*, 新的被标记为 *filter*.

**FB15K 的最佳参数**: 嵌入维度 **$k = 50$**, 学习率 **$\lambda = 0.01$**, **margin $\gamma = 1$**, 能量函数 **$d = L_1$**. 最多训练 1000 epochs, 可以参考验证集上的平均排名 (raw) 使用提前停止获得最佳模型.

---

根据 **head** 和 **tail** 的基数 (cardinalities) 能够将关系分成以下四种: **1-TO-1**, **1-TO-MANY**, **MANY-TO-1**, **MANY-TO-MANY**

1. 1-TO-1: 一个 head 至多有一个 tail.

2. 1-TO-MANY: 一个 head 有很多 tail.
  
3. MANY-TO-1: 许多 head 有很多相同 tail.

4. MANY-TO-MANY: 多个 head 和多个 tail 同时出现.

FB15k 有 26.2% 的 1-TO-1, 22.7% 的 1-TO-MANY, 28.3% 的 MANY-TO-1, 22.8% 的 MANY-TO-MANY.具体实现可以参考 [<sup>2</sup>](#2)

---

![](https://cos.luyf-lemon-love.space/images/20220926171344.png)

上图使用 **TransE** 预测的 **tails** 中，黑体和斜体都是知识图谱已有的知识 (三元组), 其余就是模型补全的, 即**知识图谱的补全**。**我就是想把 TransE 用到我的未来的工具中，进行知识图谱补全**.

---

**TransE** 应用一共有三个: **知识图谱补全** (Link prediction), 知识表示, 嵌入到关系抽取模型中.

---

### **实验**

下面是在服务器上运行的结果。

```shell
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

Epoch 50/1000 - loss: 4254.677734
Epoch 100/1000 - loss: 3452.187988
Epoch 150/1000 - loss: 3018.641113
Epoch 200/1000 - loss: 2960.243408
Epoch 250/1000 - loss: 2882.189209
Epoch 300/1000 - loss: 2870.555420
Epoch 350/1000 - loss: 2682.759277
Epoch 400/1000 - loss: 2600.209229
Epoch 450/1000 - loss: 2621.255371
Epoch 500/1000 - loss: 2612.536133
Epoch 550/1000 - loss: 2447.342529
Epoch 600/1000 - loss: 2606.887695
Epoch 650/1000 - loss: 2414.228760
Epoch 700/1000 - loss: 2550.244141
Epoch 750/1000 - loss: 2453.343018
Epoch 800/1000 - loss: 2515.363037
Epoch 850/1000 - loss: 2455.265137
Epoch 900/1000 - loss: 2484.796631
Epoch 950/1000 - loss: 2418.574219
Epoch 1000/1000 - loss: 2373.793945

输出预训练实体嵌入 (./build/entity2vec.vec) 成功.
输出预训练关系嵌入 (./build/relation2vec.vec) 成功.

训练结束, 用时 50.864228 秒.

##################################################

测试开始:

加载预训练实体嵌入 (./build/entity2vec.vec) 成功.
加载预训练关系嵌入 (./build/relation2vec.vec) 成功.

总体结果：

heads(raw) 		平均排名: 306.326965, 	Hits@10: 0.372924
heads(filter) 		平均排名: 191.934326, 	Hits@10: 0.495946
tails(raw) 		平均排名: 222.083633, 	Hits@10: 0.446649
tails(filter) 		平均排名: 150.873444, 	Hits@10: 0.563000

通过 type_constrain.txt 限制的总体结果：

heads(raw) 		平均排名: 202.505310, 	Hits@10: 0.399011
heads(filter) 		平均排名: 88.112625, 	Hits@10: 0.560614
tails(raw) 		平均排名: 138.922943, 	Hits@10: 0.473650
tails(filter) 		平均排名: 67.712753, 	Hits@10: 0.606389

(关系: 1-1, 1-n, n-1, n-n) 测试三元组的结果：

关系: 1-1:

heads(raw) 		平均排名: 124.536644, 	Hits@10: 0.712766
heads(filter) 		平均排名: 124.309692, 	Hits@10: 0.718676
tails(raw) 		平均排名: 147.830963, 	Hits@10: 0.687943
tails(filter) 		平均排名: 147.565018, 	Hits@10: 0.693853

关系: 1-n:

heads(raw) 		平均排名: 22.789383, 	Hits@10: 0.836019
heads(filter) 		平均排名: 22.579716, 	Hits@10: 0.840000
tails(raw) 		平均排名: 1221.926880, 	Hits@10: 0.188057
tails(filter) 		平均排名: 831.402466, 	Hits@10: 0.241517

关系: n-1:

heads(raw) 		平均排名: 1148.632812, 	Hits@10: 0.133086
heads(filter) 		平均排名: 701.605835, 	Hits@10: 0.197778
tails(raw) 		平均排名: 31.964703, 	Hits@10: 0.850365
tails(filter) 		平均排名: 31.795856, 	Hits@10: 0.852795

关系: n-n:

heads(raw) 		平均排名: 179.289429, 	Hits@10: 0.358076
heads(filter) 		平均排名: 113.992714, 	Hits@10: 0.508881
tails(raw) 		平均排名: 141.546097, 	Hits@10: 0.394096
tails(filter) 		平均排名: 93.141548, 	Hits@10: 0.542260

测试结束, 用时 12.604605 秒.

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

运行结果显示：训练集中的关系一共为 *1345* 种，实体一共为 *14951* 种，三元组一共 *483142* 个。训练一共用时 **50.386622** 秒。

可以发现类型为 **1-n** 和 **n-1** 的关系, 从 **n** 面预测 **1** 面具有很高的利用价值, 因为这种训练数据较多.

对于大型知识图谱, 用全部种类的实体构建负三元组是极其耗时的, 因此用 **type_constrain.txt** 来构造负三元组. 该文件记录了**数据集** (训练集, 验证集, 测试集) 中各个关系 **head** 和 **tail** 出现过的种类. 具体实现可以参考 [<sup>2</sup>](#2)

参数:

```
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

---

```
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

下图是服务器**没有运行任何程序**的 *cpu* 利用率 (*htop* 命令)

![](https://cos.luyf-lemon-love.space/images/20220926115831.png)

下图是服务器**训练时**的 *cpu* 利用率 (*htop* 命令)

![](https://cos.luyf-lemon-love.space/images/20220926115716.png)

下图是服务器**测试时**的 *cpu* 利用率 (*htop* 命令)

![](https://cos.luyf-lemon-love.space/images/20220926115747.png)

**因此，我想利用 C++ 版本的 TransE 作为未来工具中的补全知识图谱的工具.**

### **附录**
---

<div id = "2"></div>

```python
# data_preprocessing.py
# 使用方法: $ python3 data_preprocessing.py
# created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>
#
# 该 Python 脚本用于创建下面这些临时数据文件
# ../data/FB15K/1-1.txt ../data/FB15K/1-n.txt ../data/FB15K/n-1.txt ../data/FB15K/n-n.txt ../data/FB15K/test2id_all.txt ../data/FB15K/type_constrain.txt
#
# prerequisites: 
#     train2id.txt, valid2id.txt、test2id.txt

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

## 结语

第三十五篇博文写完，开心！！！！

今天，也是充满希望的一天。