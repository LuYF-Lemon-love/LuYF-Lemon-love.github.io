---
title: DGL-KE 学习笔记-windows10
tags:
  - 人工智能
  - 深度学习
  - 知识图谱
  - 数学
  - Linux
  - Ubuntu
  - 知识表示学习
  - 知识图谱补全
categories: Python
description: DGL-KE 学习笔记，DGL-KE 用于知识表示学习。
cover: 'https://cos.luyf-lemon-love.space/images/%E5%8E%9F%E7%A5%9E.webp'
abbrlink: 59170217
date: 2023-01-27 12:57:08
---

## 前言

**Knowledge graphs (KGs) are data structures that store information about different entities (nodes) and their relations (edges).** A common approach of using KGs in various machine learning tasks is to compute knowledge graph embeddings. **DGL-KE is a high performance, easy-to-use, and scalable package for learning large-scale knowledge graph embeddings.** The package is implemented on the top of *[Deep Graph Library (DGL)](https://github.com/dmlc/dgl)* and developers can run DGL-KE on CPU machine, GPU machine, as well as clusters with a set of popular models, including `TransE`, `TransR`, `RESCAL`, `DistMult`, `ComplEx`, and `RotatE`.

DGL-KE 代码仓库链接: https://github.com/awslabs/dgl-ke .

操作系统：**Windows 10 家庭版**

## 参考文档

1. [DGL-KE](https://github.com/awslabs/dgl-ke)

2. [DGL-KE Documentation](https://dglke.dgl.ai/doc/)

3. [DGL-KE paper](https://arxiv.org/abs/2004.08532)

## 项目仓库

<img src="https://cos.luyf-lemon-love.space/images/logo.png" width = "400"/>

![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)

[Documentation](https://dglke.dgl.ai/doc/)

**Knowledge graphs (KGs) are data structures that store information about different entities (nodes) and their relations (edges).** A common approach of using KGs in various machine learning tasks is to compute knowledge graph embeddings. **DGL-KE is a high performance, easy-to-use, and scalable package for learning large-scale knowledge graph embeddings.** The package is implemented on the top of *[Deep Graph Library (DGL)](https://github.com/dmlc/dgl)* and developers can run DGL-KE on CPU machine, GPU machine, as well as clusters with a set of popular models, including `TransE`, `TransR`, `RESCAL`, `DistMult`, `ComplEx`, and `RotatE`.

<p align="center">
  <img src="https://cos.luyf-lemon-love.space/images/dgl_ke_arch.png" alt="DGL-ke architecture" width="600">
  <br>
  <b>Figure</b>: DGL-KE Overall Architecture
</p>

Currently DGL-KE support three tasks:

- Training, trains KG embeddings using `dglke_train`(single machine) or `dglke_dist_train`(distributed environment).

- Evaluation, reads the pre-trained embeddings and evaluates the embeddings with a link prediction task on the test set using `dglke_eval`.

- Inference, reads the pre-trained embeddings and do the entities/relations linkage predicting inference tasks using `dglke_predict` or do the embedding similarity  inference tasks using `dglke_emb_sim`.

### A Quick Start

To install the latest version of DGL-KE run:

```shell
sudo pip3 install dgl
sudo pip3 install dglke
```

Train a `transE` model on `FB15k` dataset by running the following command:

```shell
DGLBACKEND=pytorch dglke_train --model_name TransE_l2 --dataset FB15k --batch_size 1000 \
--neg_sample_size 200 --hidden_dim 400 --gamma 19.9 --lr 0.25 --max_step 500 --log_interval 100 \
--batch_size_eval 16 -adv --regularization_coef 1.00E-09 --test --num_thread 1 --num_proc 8
```

This command will download the `FB15k` dataset, train the `transE` model and save the trained embeddings into the file.

### Performance and Scalability

**DGL-KE is designed for learning at scale.** It introduces various novel optimizations that accelerate training on knowledge graphs with millions of nodes and billions of edges. Our benchmark on knowledge graphs consisting of over *86M* nodes and *338M* edges shows that DGL-KE can compute embeddings in 100 minutes on an EC2 instance with 8 GPUs and 30 minutes on an EC2 cluster with 4 machines (48 cores/machine). These results represent a *2×∼5×* speedup over the best competing approaches.

<p align="center">
  <img src="https://cos.luyf-lemon-love.space/images/vs-gv-fb15k.png" alt="vs-gv-fb15k" width="750">
  <br>
  <b>Figure</b>: DGL-KE vs GraphVite on FB15k
</p>

<p align="center">
  <img src="https://cos.luyf-lemon-love.space/images/vs-pbg-fb.png" alt="vs-pbg-fb" width="750">
  <br>
  <b>Figure</b>: DGL-KE vs Pytorch-BigGraph on Freebase
</p>

Learn more details with our [documentation](https://dglke.dgl.ai/doc/)! If you are interested in the optimizations in DGL-KE, please check out [our paper](https://arxiv.org/abs/2004.08532) for more details.

### Cite

If you use DGL-KE in a scientific publication, we would appreciate citations to the following paper:

```bibtex
@inproceedings{DGL-KE,
author = {Zheng, Da and Song, Xiang and Ma, Chao and Tan, Zeyuan and Ye, Zihao and Dong, Jin and Xiong, Hao and Zhang, Zheng and Karypis, George},
title = {DGL-KE: Training Knowledge Graph Embeddings at Scale},
year = {2020},
publisher = {Association for Computing Machinery},
address = {New York, NY, USA},
booktitle = {Proceedings of the 43rd International ACM SIGIR Conference on Research and Development in Information Retrieval},
pages = {739–748},
numpages = {10},
series = {SIGIR '20}
}
```

### License

This project is licensed under the Apache-2.0 License.

## DGL-KE Documentation

原文档地址: https://dglke.dgl.ai/doc/ .

**Knowledge graphs (KGs) are data structures that store information about different entities (nodes) and their relations (edges).** A common approach of using KGs in various machine learning tasks is to compute knowledge graph embeddings. `DGL-KE is a high performance, easy-to-use, and scalable package for learning large-scale knowledge graph embeddings.` The package is implemented on the top of Deep Graph Library ([DGL](https://www.dgl.ai/)) and developers can run DGL-KE on CPU machine, GPU machine, as well as clusters with a set of popular models, including `TransE`, `TransR`, `RESCAL`, `DistMult`, `ComplEx`, and `RotatE`.

![](https://cos.luyf-lemon-love.space/images/dgl_ke_arch.png)

### Performance and Scalability

**DGL-KE is designed for learning at scale.** It introduces various novel optimizations that accelerate training on knowledge graphs with millions of nodes and billions of edges. Our benchmark on knowledge graphs consisting of over 86M nodes and 338M edges shows that DGL-KE can compute embeddings in 100 minutes on an EC2 instance with 8 GPUs and 30 minutes on an EC2 cluster with 4 machines (48 cores/machine). These results represent a **2×∼5×** speedup over the best competing approaches.

*DGL-KE vs Graphvite*

![](https://cos.luyf-lemon-love.space/images/vs-gv-fb15k.png)

*DGL-KE vs Pytorch-Biggraph*

![](https://cos.luyf-lemon-love.space/images/vs-pbg-fb.png)

**Get started with DGL-KE!**

## Installation Guide

原文档地址: https://dglke.dgl.ai/doc/install.html .

This topic explains how to install DGL-KE. We recommend installing DGL-KE by using `pip` and from the source.

### System requirements

DGL-KE works with the following operating systems:

- `Ubuntu 16.04 or higher version`

- `macOS x`

DGL-KE requires `Python version 3.5 or later`. Python 3.4 or earlier is not tested. Python 2 support is coming.

DGL-KE supports multiple tensor libraries as backends, e.g., `PyTorch` and `MXNet`. For requirements on backends and how to select one, see Working with different backends. As a demo, we install `Pytorch` using `pip`:

```shell
sudo pip3 install torch
```

### Install DGL

DGL-KE is implemented on the top of DGL (0.4.3 version). You can install DGL using pip:

```shell
sudo pip3 install dgl==0.4.3
```

### Install DGL-KE

After installing DGL, you can install DGL-KE. The fastest way to install DGL-KE is by using pip:

```shell
sudo pip3 install dglke
```

or you can install DGL-KE from source:

```shell
git clone https://github.com/awslabs/dgl-ke.git
cd dgl-ke/python
sudo python3 setup.py install
```

### Have a Quick Test

Once you install DGL-KE successfully, you can test it by the following command:

```shell
# create a new workspace
mkdir my_task && cd my_task
# Train transE model on FB15k dataset
DGLBACKEND=pytorch dglke_train --model_name TransE_l2 --dataset FB15k --batch_size 1000 \
--neg_sample_size 200 --hidden_dim 400 --gamma 19.9 --lr 0.25 --max_step 500 --log_interval 100 \
--batch_size_eval 16 -adv --regularization_coef 1.00E-09 --test --num_thread 1 --num_proc 8
```

This command will download the FB15k dataset, train the transE model on that, and save the trained embeddings into the file. You could see the following output at the end:

```shell
-------------- Test result --------------
Test average MRR : 0.47221913961451095
Test average MR : 58.68289854581774
Test average HITS@1 : 0.2784276548560207
Test average HITS@3 : 0.6244265375564998
Test average HITS@10 : 0.7726295474936941
-----------------------------------------
```

## Introduction to Knowledge Graph Embedding

原文档地址: https://dglke.dgl.ai/doc/kg.html .

**Knowledge Graphs (KGs) have emerged as an effective way to integrate disparate data sources and model underlying relationships for applications such as search.** At Amazon, we use KGs to represent the hierarchical relationships among products; the relationships between creators and content on Amazon Music and Prime Video; and information for Alexa’s question-answering service. **Information extracted from KGs in the form of embeddings is used to improve search, recommend products, and infer missing information.**

### What is a graph

**A graph is a structure used to represent things and their relations.** It is made of two sets - the set of nodes (also called vertices) and the set of edges (also called arcs). Each edge itself connects a pair of nodes indicating that there is a relation between them. **This relation can either be undirected, e.g., capturing symmetric relations between nodes, or directed, capturing asymmetric relations.** For example, if a graph is used to model the friendship relations of people in a social network, then the edges will be undirected as they are used to indicate that two people are friends; however, if the graph is used to model how people follow each other on Twitter, the edges will be directed. Depending on the edges’ directionality, a graph can be directed or undirected.

Graphs can be either homogeneous or heterogeneous. **In a homogeneous graph, all the nodes represent instances of the same type and all the edges represent relations of the same type.** For instance, a social network is a graph consisting of people and their connections, all representing the same entity type. **In contrast, in a heterogeneous graph, the nodes and edges can be of different types.** For instance, the graph for encoding the information in a marketplace will have buyer, seller, and product nodes that are connected via wants-to-buy, has-bought, is-customer-of, and is-selling edges.

Finally, another class of graphs that is especially important for knowledge graphs are multigraphs. **These are graphs that can have multiple (directed) edges between the same pair of nodes and can also contain loops. These multiple edges are typically of different types and as such most multigraphs are heterogeneous.** Note that graphs that do not allow these multiple edges and self-loops are called simple graphs.

### What is a Knowledge Graph

In the earlier marketplace graph example, `the labels assigned to the different node types (buyer, seller, product) and the different relation types (wants-to-buy, has-bought, is-customer-of, is-selling) convey precise information (often called semantics) about what the nodes and relations represent for that particular domain.` Once this graph is populated, it will encode the knowledge that we have about that marketplace as it relates to types of nodes and relations included. Such a graph is an example of a knowledge graph.

`A knowledge graph (KG) is a directed heterogeneous multigraph whose node and relation types have domain-specific semantics.` **KGs allow us to encode the knowledge into a form that is human interpretable and amenable to automated analysis and inference.** KGs are becoming a popular approach to represent diverse types of information in the form of different types of entities connected via different types of relations.

When working with KGs, we adopt a different terminology than the traditional vertices and edges used in graphs. `The vertices of the knowledge graph are often called entities and the directed edges are often called triplets and are represented as a (h, r, t) tuple, where h is the head entity, t is the tail entity, and r is the relation associating the head with the tail entities.` Note that the term relation here refers to the type of the relation (e.g., one of wants-to-buy, has-bought, is-customer-of, and is-selling).

Let us examine a directed multigraph in an example, which includes a cast of characters and the world in which they live.

**Scenario**:

**Mary** and **Tom** are *siblings* and they both are are *vegetarians*, who like **potatoes** and **cheese**. Mary and Tom both work at **Amazon**. **Joe** is a bloke who is *a colleague of* Tom. To make the matter complicated, Joe loves Mary, but we do not know if the feeling is reciprocated.

Joe is from **Quebec** and is proud of his native dish of **Poutine**, which is composed of potato, cheese, and **gravy**. We also know that gravy contains **meat** in some form.

Joe is excited to invite Tom for dinner and has sneakily included his sibling, Mary, in the invitation. His plans are doomed from get go as he is planning to serve the vegetarian siblings his favourite Quebecois dish, Poutine.

Oh! by the way, a piece of geography trivia: Quebec is located in a **province** of the same name which in turn is located in **Canada**.

There are several relationships in this scenario that are not explicitly mentioned but we can simply infer from what we are given:

- Mary is a colleague of Tom.

- Tom is a colleague of Mary.

- Mary is Tom’s sister.

- Tom is Mary’s brother.

- Poutine has meat.

- Poutine is not a vegetarian dish.

- Mary and Tom would not eat Poutine.

- Poutine is a Canadian dish.

- Joe is Canadian.

- Amazon is a workplace for Mary, Tom, and Joe.

There are also some interesting negative conclusions that seem intuitive to us, but not to the machine: - Potato does not like Mary. - Canada is not from Joe. - Canada is not located in Quebec. - … What we have examined is a knowledge graph, a set of nodes with different types of relations:

- `1-to-1`: Mary is a sibling of Tom.

- `1-to-N`: Amazon is a workplace for Mary, Tom, and Joe.

- `N-to-1`: Joe, Tom, and Mary work at Amazon.

- `N-to-N`: Joe, Mary, and Tom are colleagues.

There are other categorization perspectives on the relationships as well: - Symmetric: Joe is a colleague of Tom entails Tom is also a colleague of Joe. - Antisymmetric: Quebec is located in Canada entails that Canada cannot be located in Quebec.

`Figure 1` visualizes a knowledge-base that describes World of Mary. For more information on how to use the examples, please refer to the [code](https://github.com/cyrusmvahid/GNNTrainingMaterial/blob/master/March2020/supportingexamples/examples.py) that draws the examples.

![](https://cos.luyf-lemon-love.space/images/kg_example.png)

### What is the task of Knowledge Graph Embedding?

`Knowledge graph embedding is the task of completing the knowledge graphs by probabilistically inferring the missing arcs from the existing graph structure.` KGE differs from ordinary relation inference as the information in a knowledge graph is multi-relational and more complex to model and computationally expensive. For this rest of this blog, we examine fundamentals of KGE.

### Score Function

There are different flavours of KGE that have been developed over the course of the past few years. What most of them have in common is a score function. `The score function measures how distant two nodes relative to its relation type.` As we are setting the stage to introduce the reader to DGL-KE, an open source knowledge graph embedding library, we limit the scope only to those methods that are implemented by DGL-KE and are listed in Figure 2.

Figure2: A list of score functions for KE papers implemented by DGL-KE

![](https://cos.luyf-lemon-love.space/images/kge_scores.png)

### A short explanation of the score functions

Knowledge graphs that are beyond toy examples are always large, high dimensional, and sparse. High dimensionality and sparsity result from the amount of information that the KG holds that can be represented with 1-hot or n-hot vectors. The fact that most of the items have no relationship with one another is another major contributor to sparsity of KG representations. We, therefore, `desire to project the sparse and high dimensional graph representation vector space into a lower dimensional dense space.` This is similar to the process used to generate word embeddings and reduce dimensions in recommender systems based on matrix factorization models. I will provide a detailed account of all the methods in a different post, but here I will shortly explain `how projections differ in each paper`, `what the score functions do`, and `what consequences the choices have for relationship inference` and `computational complexity`.

#### TransE

## 结语

第四十五篇博文写完，开心！！！！

今天，也是充满希望的一天。