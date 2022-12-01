---
title: DRKG 原论文学习笔记-ubuntu
tags:
  - 人工智能
  - 深度学习
  - 知识图谱
  - 知识表示学习
  - 知识图谱补全
  - 药物重定位
categories: Paper
description: DRKG 原论文学习笔记。
cover: 'https://cos.luyf-lemon-love.space/images/1110.webp'
abbrlink: 1792992474
date: 2022-11-30 20:13:30
---

## 前言

**DRKG** 是一个由 **Amazon Web Services Shanghai AI Lab** 联合多家科研机构**开源的综合生物知识图谱**, 涉及**基因**、**药物**、**疾病**、**生物学过程**、**副作用和症状**. **DRKG** 包括 **DrugBank**、**Hetionet**、**GNBR**、**String**、**IntAct** 和 **DGIdb** 六个现有数据库的信息, 以及**近期新冠病毒的相关医学文献中挖掘的数据**. **DRKG** 知识图谱包含属于 **13** 种实体类型的 **97,238** 个实体, 以及属于 **107** 种关系类型的 **5,874,261** 个三元组数据. 同一实体对之间可能存在多种交互类型.

**DRKG** 原论文链接: [DRKG Drug Repurposing Knowledge Graph](https://github.com/gnn4dr/DRKG/blob/master/DRKG%20Drug%20Repurposing%20Knowledge%20Graph.pdf).

**原仓库地址**: https://github.com/gnn4dr/DRKG .

操作系统：**Ubuntu 20.04.5 LTS**

## 参考文档

<div id = "1"></div>

1. [DRKG Drug Repurposing Knowledge Graph](https://github.com/gnn4dr/DRKG/blob/master/DRKG%20Drug%20Repurposing%20Knowledge%20Graph.pdf).

## 项目仓库 - Drug Repurposing Knowledge Graph (DRKG)

**药物再利用知识图谱** (Drug Repurposing Knowledge Graph, DRKG) [<sup>1</sup>](#1)是一个涉及**基因**、**药物**、**疾病**、**生物过程**、**副作用**和**症状**的**综合生物知识图谱**. **DRKG** 包括来自 **DrugBank**、**Hetionet**、**GNBR**、**String**、**IntAct** 和 **DGIdb** 等**六个现有数据库的信息**, 以及从最近发表的 **Covid19** 出版物中收集的数据. 它包含属于 **13** 种实体类型的 **97,238** 个实体; 以及属于 **107** 种关系类型的 **5,874,261** 个三元组. 这 **107** 种关系类型显示了 **13** 种实体类型之间的交互类型（**同一种实体对之间可能存在多种交互类型**), 如下图所示. 它还包括很多关于如何使用**统计方法**或使用**机器学习方法**（如**知识图谱嵌入**）探索和分析 DRKG 的 notebooks.

![](https://cos.luyf-lemon-love.space/images/20221130135805.png)

**Figure**: **Interactions** in the DRKG. **The number next to an edge** indicates **the number of relation-types** for that entity-pair in DRKG.

### Statistics of DRKG

**The type-wise distribution of the entities** in DRKG and their **original data-source(s)** is shown in following table.

| Entity type         | Drugbank | GNBR  | Hetionet | STRING | IntAct | DGIdb | Bibliography | Total Entities |
|:--------------------|---------:|------:|---------:|-------:|-------:|------:|-------------:|---------------:|
| Anatomy             | \-       | \-    | 400      | \-     | \-     | \-    | \-           | 400            |
| Atc                 | 4,048     | \-    | \-       | \-     | \-     | \-    | \-           | 4,048           |
| Biological Process  | \-       | \-    | 11,381    | \-     | \-     | \-    | \-           | 11,381          |
| Cellular Component  | \-       | \-    | 1,391     | \-     | \-     | \-    | \-           | 1,391           |
| Compound            | 9,708     | 11,961 | 1,538     | \-     | 153    | 6,348  | 6,250         | 24,313          |
| Disease             | 1,182     | 4,746  | 257      | \-     | \-     | \-    | 33           | 5,103           |
| Gene                | 4,973     | 27,111 | 19,145    | 18,316  | 16,321  | 2,551  | 3,181         | 39,220          |
| Molecular Function  | \-       | \-    | 2,884     | \-     | \-     | \-    | \-           | 2,884           |
| Pathway             | \-       | \-    | 1,822     | \-     | \-     | \-    | \-           | 1,822           |
| Pharmacologic Class | \-       | \-    | 345      | \-     | \-     | \-    | \-           | 345            |
| Side Effect         | \-       | \-    | 5,701     | \-     | \-     | \-    | \-           | 5,701           |
| Symptom             | \-       | \-    | 415      | \-     | \-     | \-    | \-           | 415            |
| Tax                 | \-       | 215   | \-       | \-     | \-     | \-    | \-           | 215            |
| Total               | 19,911   | 44,033 | 45,279    | 18,316  | 16,474  | 8,899  | 9,464         | 97,238          |

The following table shows **the number of triplets** between **different entity-type pairs** in DRKG for DRKG and various datasources.

| Entity\-type pair                     | Drugbank | GNBR   | Hetionet | STRING  | IntAct | DGIdb | Bibliography | Total interactions |
|:--------------------------------------|-----------:|-------:|---------:|--------:|-------:|------:|-------------:|-------------------:|
| \(Gene, Gene\)                    | \-         | 66,722  | 474,526   | 1,496,708 | 254,346 | \-    | 58,629        | 2,350,931            |
| \(Compound, Gene\)                | 24,801      | 80,803  | 51,429    | \-      | 1,805   | 26,290 | 25,666        | 210,794             |
| \(Disease, Gene\)                 | \-         | 95,399  | 27,977    | \-      | \-     | \-    | 461          | 123,837             |
| \(Atc, Compound\)                 | 15,750      | \-     | \-       | \-      | \-     | \-    | \-           | 15,750              |
| \(Compound, Compound\)            | 1,379,271    | \-     | 6,486     | \-      | \-     | \-    | \-           | 1,385,757            |
| \(Compound, Disease\)             | 4,968        | 77,782  | 1,145     | \-      | \-     | \-    | \-           | 83,895              |
| \(Gene, Tax\)                     | \-         | 14,663  | \-       | \-      | \-     | \-    | \-           | 14,663              |
| \(Biological Process, Gene\)      | \-         | \-     | 559,504   | \-      | \-     | \-    | \-           | 559,504             |
| \(Disease, Symptom\)              | \-         | \-     | 3,357     | \-      | \-     | \-    | \-           | 3,357               |
| \(Anatomy, Disease\)              | \-         | \-     | 3,602     | \-      | \-     | \-    | \-           | 3,602               |
| \(Disease, Disease\)              | \-         | \-     | 543      | \-      | \-     | \-    | \-           | 543                |
| \(Anatomy, Gene\)                 | \-         | \-     | 726,495   | \-      | \-     | \-    | \-           | 726,495             |
| \(Gene, Molecular Function\)      | \-         | \-     | 97,222    | \-      | \-     | \-    | \-           | 97,222              |
| \(Compound, Pharmacologic Class\) | \-         | \-     | 1,029     | \-      | \-     | \-    | \-           | 1,029               |
| \(Cellular Component, Gene\)      | \-         | \-     | 73,566    | \-      | \-     | \-    | \-           | 73,566              |
| \(Gene, Pathway\)                 | \-         | \-     | 84,372    | \-      | \-     | \-    | \-           | 84,372              |
| \(Compound, Side Effect\)         | \-         | \-     | 138,944   | \-      | \-     | \-    | \-           | 138,944             |
| Total                                 | 1,424,790    | 335,369 | 2,250,197  | 1,496,708 | 256,151 | 26,290 | 84,756        | 5,874,261            |

### Download DRKG

为了分析 **DRKG**, 你可以直接使用下面的命令下载 **DRKG**:

```shell
wget https://dgl-data.s3-us-west-2.amazonaws.com/dataset/DRKG/drkg.tar.gz
```

(**不推荐**) 如果你使用原仓库提供的 **notebooks**, 不需要手动下载 **DRKG**.

解压 **drkg.tar.gz**, 会得到下面的文件:

```shell
./drkg.tsv
./entity2src.tsv
./relation_glossary.tsv
./embed
./embed/DRKG_TransE_l2_relation.npy
./embed/relations.tsv
./embed/entities.tsv
./embed/Readme.md
./embed/DRKG_TransE_l2_entity.npy
./embed/mol_contextpred.npy
./embed/mol_masking.npy
./embed/mol_infomax.npy
./embed/mol_edgepred.npy
```

#### DRKG dataset

数据集包含**四部分**:

- **drkg.tsv**, 一个包含原始 **DRKG** 三元组 (格式为 **(h, r, t)**) 的 **tsv** 文件.

- **embed**, 一个包含使用全部 **drkg.tsv** 文件为**训练集**的**预训练知识图谱嵌入**和 [molecule SMILES](https://github.com/gnn4dr/DRKG/blob/master/drugbank_info/drugbank_smiles.txt) 的预训练 GNN 分子嵌入的**目录**.

- **entity2src.tsv**, **DRKG** 中的实体到源数据的**映射文件**.

- **relation_glossary.tsv**, DRKG 关系类型的解释文件, 以及相关的源信息.

#### Pretrained DRKG embedding

这些 **DRKG** 嵌入是使用 **400** 维度的 **TransE\_l2** 模型训练的, 有 **4** 个文件:

- **DRKG\_TransE\_l2\_entity.npy**, 二进制的 **NumPy** 的数据, 存储**实体嵌入**.

- **DRKG\_TransE\_l2\_relation.npy**, 二进制 **NumPy** 的数据, 存储**关系嵌入**.

- **entities.tsv**, 映射实体名到实体 ID.

- **relations.tsv**, 映射关系名到关系 ID.

可以使用 **np.load** 函数单独**加载实体嵌入**和**关系嵌入**:

```python
import numpy as np
entity_emb = np.load('./embed/DRKG_TransE_l2_entity.npy')
rel_emb = np.load('./embed/DRKG_TransE_l2_relation.npy')
```

#### Pretrained Molecule Embedding

**DRKG** 也提供了 DrugBank 的大多数小分子药物的分子嵌入 (使用预训练的 **GNN**). [Strategies for Pre-training Graph Neural Networks](https://arxiv.org/abs/1905.12265) 将监督的分子性质预测与自我监督学习结合, 开发了多种方法用于预训练基于 **GNN** 的分子表示. 下面的 **notebooks** 使用 [DGL-LifeSci](https://github.com/awslabs/dgl-lifesci/tree/master/examples/molecule_embeddings) 计算了四种分子嵌入的变体:

- **mol_contextpred.npy**: **预测分子子图的周围图结构**的**预训练模型**.

- **mol_infomax.npy**：**最大化局部节点表示和全局图谱表示间的交互信息**的预训练模型.

- **mol_edgepred.npy**: **鼓励邻近节点有类似的表示**和**强迫不相干的节点有不同的表示**的预训练模型.

- **mol_masking.npy**: **预测随机遮蔽节点和边的属性**的预训练模型.

### Tools to analyze DRKG

分析 **DRKG** 的深度学习框架, 包括 [DGL](https://github.com/dmlc/dgl) (一个**图神经网络的框架**) 和 [DGL-KE](https://github.com/awslabs/dgl-ke) (一个**计算知识图谱嵌入**的库).

#### Install PyTorch

所有的 **notebooks** 都使用 **PyTorch** 作为深度学习后端. 可以去 [Pytorch 官网](https://pytorch.org/) 安装其他版本.

```shell
sudo pip3 install torch==1.5.0+cu101 torchvision==0.6.0+cu101 -f https://download.pytorch.org/whl/torch_stable.html
```

#### Install DGL

使用下面命令安装 [DGL](https://www.dgl.ai/) (一个图神经网络框架), 它会安装支持 **CUDA** 的 **DGL**.

```shell
sudo pip3 install dgl-cu101
```

可以前往 [Install DGL](https://docs.dgl.ai/en/latest/install/index.html) 安装 **DGL** 的其他版本.

#### Install DGL-KE

如果你想用这些位于 [embedding_analysis](https://github.com/gnn4dr/DRKG/tree/master/embedding_analysis) 的 notebooks (**Train_embeddings.ipynb** or **Edge_score_analysis.ipynb**) 训练模型, 你需要安装 **DGL** and [DGL-KE](https://github.com/awslabs/dgl-ke), **DGL-KE** 能够和 **DGL** (版本 **>= 0.4.3**, either **CPU** or **GPU**) 一起工作.

```shell
sudo pip3 install dglke
```

### Notebooks for analyzing DRKG

#### Basic Graph Analysis of DRKG

为了评估一对**关系类型之间的结构相似性**, 通过**重叠系数**计算两个关系类型的 **Jaccard 相似系数**和**重叠**.

- [Jaccard_scores_among_all_edge_types_in_DRKG.ipynb](https://github.com/gnn4dr/DRKG/blob/master/raw_graph_analysis/Jaccard_scores_among_all_edge_types_in_DRKG.ipynb)

#### Knowledge Graph Embedding Based Analysis of DRKG

通过学习一个利用 $\ell_2$ 距离的 **TransE KGE 模型**分析 **DRKG**. 由于 **DRKG** 结合了**来自不同数据源**的信息, 我们希望**验证**使用**知识图谱嵌入技术**可以**生成有意义的实体和关系嵌入**.

将数据集分成**训练集** (90%), **验证集** (5%), **测试集** (5%), 使用下面的 **notebook** 训练 **KGE** 模型:

- [Train_embeddings.ipynb](https://github.com/gnn4dr/DRKG/blob/master/embedding_analysis/Train_embeddings.ipynb)

最终, 得到了 **DRKG** **实体和关系的嵌入**. 可以使用下面的 **notebooks** 进行嵌入分析.

- [Relation_similarity_analysis.ipynb](https://github.com/gnn4dr/DRKG/blob/master/embedding_analysis/Relation_similarity_analysis.ipynb), 分析**生成的关系嵌入相似性**.

- [Entity_similarity_analysis.ipynb](https://github.com/gnn4dr/DRKG/blob/master/embedding_analysis/Entity_similarity_analysis.ipynb), 分析**生成的实体嵌入相似性**.

- [Edge_score_analysis.ipynb](https://github.com/gnn4dr/DRKG/blob/master/embedding_analysis/Edge_score_analysis.ipynb), 评估学习到的 KGE 模型**能否预测 DRKG 的关系** (edges).

- [Edge_similarity_based_on_link_recommendation_results.ipynb](https://github.com/gnn4dr/DRKG/blob/master/embedding_analysis/Edge_similarity_based_on_link_recommendation_results.ipynb), 评估**不同关系类型之间的预测链接的相似程度**.

#### Drug Repurposing Using Pretrained Model for COVID-19

在使用**预训练模型进行 COVID-19 的药物再利用**的例子中, 直接使用 **DRKG** 的预训练模型推荐了**治疗 COVID-19 的 100 个药物**. 对应的 **notebook**:

- [COVID-19_drug_repurposing.ipynb](https://github.com/gnn4dr/DRKG/blob/master/drug_repurpose/COVID-19_drug_repurposing.ipynb)

#### DRKG with DGL

下面的 **notebook** 提供了利用 **DGL** 从 **DRKG** 中构建异构图的示例, 以及一些异构图的查询示例:

- [loading_drkg_in_dgl.ipynb](https://github.com/gnn4dr/DRKG/blob/master/drkg_with_dgl/loading_drkg_in_dgl.ipynb)

### Additional Information for DrugBank

[drugbank_info](https://github.com/gnn4dr/DRKG/tree/master/drugbank_info) 包括来自 **DrugBank 药物**的额外信息, 包含药物的类型, 重量和小分子药物的 **SMILES**.

### Licence

>This project is licensed under the **Apache-2.0 License**. However, the DRKG integrates data from many resources and users should consider the licensing of each source (see this [table](https://github.com/shuix007/COVID-19-KG/blob/master/licenses/Readme.md)) . Authors apply a license attribute on a per node and per edge basis for sources with defined licenses.

### Cite

>Please cite the dataset if you use this code and data in your work.

```markdown
@misc{drkg2020,
  author = {Ioannidis, Vassilis N. and Song, Xiang and Manchanda, Saurav and Li, Mufei and Pan, Xiaoqin
            and Zheng, Da and Ning, Xia and Zeng, Xiangxiang and Karypis, George},
  title = {DRKG - Drug Repurposing Knowledge Graph for Covid-19},
  howpublished = "\url{https://github.com/gnn4dr/DRKG/}",
  year = {2020}
}
```

## TransE 原论文学习笔记

**TransE** 提出于 *2013* 年, 发表于 [NeurIPS](https://neurips.cc/) 会议论文. 为什么介绍 *2013* 年的 **TransE**, 因为 **TransE** 相对于它的变体, **简洁, 高效, 又不失准确**.

### **介绍**

**Multi-relational data** 是指**有向图**, 它的**节点**被称为**实体**, *(head, label, tail)* 形式的**边** (标注为 *$(h, \ell, t)$*) 能够指示在 *head* 和 *tail* 实体之间存在一个名为 *label* 的**关系**.

## 结语

第四十一篇博文写完，开心！！！！

今天，也是充满希望的一天。