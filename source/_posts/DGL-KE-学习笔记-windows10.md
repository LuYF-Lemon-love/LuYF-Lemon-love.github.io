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

**TransE is a representative translational distance model that represents entities and relations as vectors in the same semantic space of dimension $\mathbb{R}^d$, where $d$ is the dimension of the target space with reduced dimension.** A fact in the source space is represented as a triplet $(h,r,t)$ where $h$ is short for head, $r$ is for relation, and $t$ is for tail. **The relationship is interpreted as a translation vector so that the embedded entities are connected by relation $r$ have a short distance.** In terms of vector computation it could mean adding a head to a relation should approximate to the relation’s tail, or $h+r \approx t$. For example if $h_1=emb("Ottawa"),\ h_2=emb("Berlin"), t_1=emb("Canada"), t_2=("Germany")$, and finally $r="CapilatOf"$, then $h_1 + r$ and $h_2+r$ should approximate $t_1$ and $t_2$  respectively. **TransE performs linear transformation and the scoring function is negative distance between $h+r$ and $t$, or $f=-\|h+r-t\|_{\frac{1}{2}}$**

Figure 3: TransE

![](https://cos.luyf-lemon-love.space/images/transe.png)

#### TransR

TransE cannot cover a relationship that is not 1-to-1 as it learns only one aspect of similarity. **TransR addresses this issue with separating relationship space from entity space where $h, t \in \mathbb{R}^k$ and $r \in \mathbb{R}^d$.** The semantic spaces do not need to be of the same dimension. **In the multi-relationship modeling we learn a projection matrix $M\in \mathbb{R}^{k \times d}$ for each relationship that can project an entity to different relationship semantic spaces.** Each of these spaces capture a different aspect of an entity that is related to a distinct relationship. **In this case a head node $h$ and a tail node $t$ in relation to relationship $r$ is projected into the relationship space using the learned projection matrix $M_r$ as $h_r=hM_r$ and $t_r=tM_r$ respectively.** Figure 5 illustrates this projection.

Let us explore this using an example. Mary and Tom are siblings and colleagues. They both are vegetarians. Joe also works for Amazon and is a colleague of Mary and Tom. TransE might end up learning very similar embeddings for Mary, Tom, and Joe because they are colleagues but cannot recognize the (not) sibling relationship. Using TransR, we learn projection matrices: **$M_{sib},\ M_{clg}$ and $M_{vgt}$ that perform better at learning relationship like (not)sibling.**

The score function in TransR is similar to the one used in TransE and measures euclidean distance between $h+r$ and $t$, but the distance measure is per relationship space. More formally: $f_r=\|h_r+r-t_r\|_2^2$

Figure 4: TransR projecting different aspects of an entity to a relationship space.

![](https://cos.luyf-lemon-love.space/images/transr.png)

Another advantage of TransR over TransE is its ability to extract compositional rules. Ability to extract rules has two major benefits. It offers richer information and has a smaller memory space as we can infer some rules from others.

---

**Drawbacks**

The benefits from more expressive projections in TransR adds to the complexity of the model and a higher rate of data transfer, which has adversely affected distributed training. TransE requires $O(d)$ parameters per relation, where $d$ is the dimension of semantic space in TransE and includes both entities and relationships. **As TransR projects entities to a relationship space of dimension $k$, it will require $O(kd)$  parameters per relation.** Depending on the size of k, this could potentially increase the number of parameters drastically. In exploring DGL-KE, we will examine benefits of DGL-KE in making computation of knowledge embedding significantly more efficient.

TransE and its variants such as TransR are generally called translational distance models as they translate the entities, relationships and measure distance in the target semantic spaces. **A second category of KE models is called semantic matching that includes models such as RESCAL, DistMult, and ComplEx.These models make use of a similarity-based scoring function.**

The first of semantic matching models we explore is RESCAL.

#### RESCAL

RESCAL is a **bilinear** model that captures latent semantics of a knowledge graph through associate entities with vectors and represents each relation as a matrix that **models pairwise interaction** between entities.

Multiple relations of any order can be represented as tensors. In fact $n-dimensional$ tensors are by definition representations of multi-dimensional vector spaces. RESCAL, therefore, proposes to capture entities and relationships as multidimensional tensors as illustrated in figure 5.

RESCAL uses semantic web’s RDF formation where relationships are modeled as $(subject, predicate, object)$. Tensor $\mathcal{X}$ contains such relationships as $\mathcal{X}_{ijk}$ between $i$th and $j$th entities through $k$th relation. Value of $\mathcal{X}_{ijk}$ is determined as:

$$
\begin{split}\mathcal{X}_{ijk} =
     \begin{cases}
       1\  &\quad\text{if }(e_i, r_k, e_j)\text{ holds}\\
       0\  &\quad\text{if }(e_i, r_k, e_j)\text{ does not hold}
     \end{cases}\end{split}
$$

Figure 5: RESCAL captures entities and their relations as multi-dimensional tensor

![](https://cos.luyf-lemon-love.space/images/rescal.png)

As entity relationship tensors tend to be sparse, the authors of RESCAL, propose a dyadic decomposition to capture the inherent structure of the relations in the form of a latent vector representation of the entities and an asymmetric square matrix that captures the relationships. More formally each slice of $\mathcal{X}_k$ is decomposed as a rank$-r$ factorization:

$$
\mathcal{X}_k \approx AR_k\mathbf{A}^\top, \text{ for } k=1, \dots, m
$$

where A is an $n\times r$ matrix of latent-component representation of entities and asymmetrical $r\times r$ square matrix $R_k$ that models interaction for $k_th$ predicate component in $\mathcal{X}$. To make sense of it all, let’s take a look at an example:

$$
\begin{gather}
   Entities=\{\text{Mary :}0, \text{Tom :}1, \text{Joe :}2\} \\
   Relationships=\{\text{sibling, colleague}\} \\
   Relation_{k=0}^{sibling}: \text{Mary and Tom are siblings but Joe is not their sibling.} \\
   Relations_{k=1}^{colleague}: \text{Mary,Tom, and Joe are colleagues}\\
   \text{relationship matrices will model: }\mathcal{X_k}=
   \begin{bmatrix}
   Mary & Tom  & Joe \\
   Tom  & Joe & Mary \\
   Joe  & Mary  & Tom
   \end{bmatrix}\\
   {\mathcal{X}}_{0:sibling}=
   \begin{bmatrix}
   0 & 1 & 0\\
   0 & 0 & 1\\
   0 & 0 & 0
   \end{bmatrix}\\
   \mathcal{X}_{1:colleague}=
   \begin{bmatrix}
   0 & 1 & 1\\
   1 & 0 & 1\\
   1 & 1 & 0
   \end{bmatrix}
\end{gather}
$$

Note that even in such a small knowledge graph where two of the three entities have even a symmetrical relationship, matrices $\mathcal{X}_k$ are sparse and asymmetrical. Obviously colleague relationship in this example is not representative of a real world problem. Even though such relationships can be created, they contain no information as probability of occurring is high. For instance if we are creating a knowledge graph for for registered members of a website is a specific country, we do not model relations like “is countryman of” as it contains little information and has very low entropy.

Next step in RESCAL is decomposing matrices $\mathcal{X}_k$ using a rank_k decomposition as illustrated in figure 6.

Figure 6: Each of the $k$ slices of martix $\mathcal{X}$ is factorized to its k-rank components in form of a $n\times r$ entity-latent component and an asymmetric $r\times r$ that specifies interactions of entity-latent components per relation.

![](https://cos.luyf-lemon-love.space/images/rescal2.png)

$A$ and $R_k$ are computed through solving an optimization problem that is correlated to minimizing the distance between $\mathcal{X}_k$ and $AR_k\mathbf{A}^\top$.

Now that the structural decomposition of entities and their relationships are modeled, we need to create a score function that can predict existence of relationship for those entities we lack their mutual connection information.

The score function $f_r(h,t)$ for $h,t\in \mathbb{R}^d$, where $h$ and $t$ are representations of head and tail entities, captures pairwise interactions between entities in $h$ and $t$ through relationship matrix $M_r$ that is the collection of all individual $R_k$ matrices and is of dimension $d\times d$.

$$
f_r(h, t) = \mathbf{h}^\top M_rt = \sum_{i=0}^{d-1}\sum_{j=0}^{d-1}[M_r]_{ij}.[h]_i.[t]_j
$$

Figure 7 illustrates computation of the the score for RESCAL method.

Figure 7: RESCAL

![](https://cos.luyf-lemon-love.space/images/rescal3.png)

Score function $f$ requires $O(d^2)$ parameters per relation.

#### DistMult

If we want to speed up the computation of RESCAL and limit the relationships only to symmetric relations, then we can take advantage of the proposal put forth by DistMult, which simplifies RESCAL by restricting $M_r$ from a general asymmetric $r\times r$ matrix to a diagonal square matrix, thus reducing the number of parameters per relation to $O(d)$. DistMulti introduces vector embedding $r \in \mathcal{R}^d$, the score function for DistMult where $M_r=diag(r)$ is computed as:

$$
f_r(h,t) = \mathbf{h}^\top diag(r) t = \sum_{i=0}^{d-1}[r]_i.[h]_i.[t]_i
$$

Figure 8 illustrates how DistMulti computes the score by capturing the pairwise interaction only along the same dimensions of components of h and t.

Figure 8: DistMulti

![](https://cos.luyf-lemon-love.space/images/distmult.png)

**A basic refresher on linear algebra**

$$
\begin{split}if\ A=[a_{ij}]_{m\times n}=
\begin{bmatrix}
a_{11} & a_{12} & \dots  & a_{1n} \\
a_{21} & a_{22} & \dots  & a_{2n} \\
\vdots & \vdots & \ddots & \dots  \\
a_{m1} & a_{m2} & \dots  & a_{mn} \\
\end{bmatrix}_{m\times n} \text{ and }
B=[b_{ij}]_{n\times k}=
\begin{bmatrix}
b_{11} & b_{12} & \dots  & b_{1k} \\
b_{21} & b_{22} & \dots  & b_{2k} \\
\vdots & \vdots & \ddots & \dots  \\
b_{n1} & b_{n2} & \dots  & b_{nk} \\
\end{bmatrix}_{n\times k}\        \\
then\
C=[c_{mk}]_{m\times k}\ such\ that\  c_{mk}=\sum_{p=1}^{k}a_{mp}b_{pk}\, thus: \\
C_{m\times k} = \begin{bmatrix}
a_{11}b_{11} + \dots + a_{1n}b_{n1} & a_{11}b_{12} + \dots + a_{1n}b_{n2} & \dots  & a_{11}b_{1k} + \dots + a_{1n}b_{nk} \\
a_{21}b_{11} + \dots + a_{2n}b_{n1} & a_{21}b_{12} + \dots + a_{2n}b_{n2} & \dots  & a_{21}b_{1k} + \dots + a_{2n}b_{nk} \\
\vdots & \vdots & \ddots & \dots  \\
a_{m1}b_{11} + \dots + a_{mn}b_{n1} & a_{m1}b_{12} + \dots + a_{mn}b_{n2} & \dots  & a_{m1}b_{1k} + \dots + a_{mn}b_{nk} \\
\end{bmatrix}_{n\times k}\end{split}
$$

We know that a diagonal matrix is a matrix in which all non diagonal elements, $(i \neq j)$, are zero. This reduces complexity of matrix multiplication as for diagonal matrix multiplication for diagonal matrices $A_{m\times n}$ and $B_{n\times k}$, $C=AB= [c_{mk}]_{m\times k}$ where

$$
\begin{split}c_{mk} =
\begin{cases}
0& \text{for }m \neq k \\
a_mb_k& \text{for }m = k
\end{cases}\end{split}
$$

This is basically multiplying to numbers $a_{ii}$ and $b_{ii}$ to get the value for the corresponding diagonal element on $C$.

This complexity reduction is the reason that whenever possible we would like to reduce matrices to diagonal matrices.

#### ComplEx

In order to model a KG effectively, models need to be able to identify most common relationship patters as laid out earlier in this blog. relations can be reflexive/irreflexive, symmetric/antisymmetric, and transitive/intransitive. We have also seen two classes of semantic matching models, RESCAL and DistMulti. RESCAL is expressive but has an exponential complexity, while DistMulti has linear complexity but is limited to symmetric relations.

An ideal model needs to keep linear complexity while being able to capture antisymmetric relations. Let us go back to what is good at DistMulti. It is using a rank-decomposition based on a diagonal matrix. We know that dot product of embedding scale well and handles symmetry, reflexity, and irreflexivity effectively. Matrix factorization (MF) methods have been very successful in recommender systems. MF works based on factorizing a relation matrix to dot product of lower dimensional matrices $\mathbf{U}\mathbf{V}^\top$ where $\mathbf{U}\mathbf{V} \in \mathbb{R}^{n\times K}$. The underlying assumption here is that the same entity would be taken to be different depending on whether it appears as a subject or an object in a relationship. For instance “Quebec” in “Quebec is located in Canada” and “Joe is from Quebec” appears as subject and object respectively. In many link prediction tasks the same entity can assume both roles as we perform graph embedding through adjacency matrix computation. Dealing with antisymmetric relationships, consequently, has resulted in an explosion of parameters and increased complexity and memory requirements.

The goal ComplEx is set to achieve is performing embedding while reducing the number of required parameters, to scale well, and to capture antisymmetric relations. One essential strategy is to compute a joint representation for the entities regardless of their role as subject or object and perform dot product on those embeddings.

Such embeddings cannot be achieved in the real vector spaces, so the ComplEx authors propose complex embedding.

But first a quick reminder about complex vectors.

---

Complex Vector Space 1 is the unit for real numbers, $i=\sqrt{-1}$ is the imaginary unit of complex numbers. Each complex number has two parts, a real and an imaginary part and is represented as $c = a + bi \in \mathbb{C}$. As expected, the complex plane has a horizontal and a vertical axis. Real numbers are placed on the horizontal axis and the vertical axis represents the imaginary part of a number. This is done in much the same way as in $x$ and $y$ are represented on Cartesian plane. An n-dimensional complex vector $\mathcal{V}\in \mathbb{C}^n$ is a vector whose elements $v_i\in \mathbb{C}$ are complex numbers.

Example:

$$
\begin{split}V_1 = \begin{bmatrix}
2 + 3i \\
1 + 5i
\end{bmatrix}
\text{ and }
V_2 = \begin{bmatrix}
2 + 3i \\
1 + 5i \\
3
\end{bmatrix}
\text{ are in } \mathbb{C}^2\text{ and }\mathbb{C}^3\text{ respectively.}\end{split}
$$

$\mathbb{R} \subset \mathbb{C}$ and $\mathbb{R}^n \subset \mathbb{C}^n$. Basically a real number is a complex number whose imaginary part has a coefficient of zero.

modulus of a complex number $z$ is a complex number as is given by $z=a+bi$, modulus $z$ is analogous to size in vector space and is given by $\mid z\mid = \sqrt{a^2 + b^2}$

Complex Conjugate The conjugate of complex number $z=a+bi$ is denoted by $\bar{z}$ and is given by $\bar{z}=a-bi$.

Example:

$$
\begin{split}\bar{V}_1 = \begin{bmatrix}
2 - 3i \\
1 - 5i
\end{bmatrix}
\text{ and }
\bar{V}_2 = \begin{bmatrix}
2 - 3i \\
1 - 5i \\
3
\end{bmatrix}
\text{ are in } \mathbb{C}^2\text{ and }\mathbb{C}^3\text{ respectively.}\end{split}
$$

Conjugate Transpose The conjugate transpose of a complex matrix $\mathcal{A}$, is denoted as $\mathcal{A}^*$ and is given by $\mathcal{A}^* = \mathbf{\bar{\mathcal{A}}}^\top$ where elements of $\bar{\mathcal{A}}$ are complex conjugates of $\mathcal{A}.$

Example:

$$
V^*_1 = \begin{bmatrix}
2 - 3i &
1 - 5i
\end{bmatrix}
\text{ and }
V^*_2 = \begin{bmatrix}
2 - 3i &
1 - 5i &
3
\end{bmatrix}
\text{ are in } \mathbb{C}^2\text{ and }\mathbb{C}^3\text{ respectively.}
$$

Complex dot product. aka Hermitian inner product if $\mathbf{u}$ and $\mathbf{c}$ are complex vectors, then their inner product is defined as $\langle \mathbf{u}, \mathbf{v} \rangle = \mathbf{u}^*\mathbf{v}$.

Example:

$$
\begin{split}u = \begin{bmatrix}
2 + 3i \\
1 + 5i
\end{bmatrix}
\text{ and }
v = \begin{bmatrix}
1 + i \\
2 + 2i
\end{bmatrix}
\text{ are in } \mathbb{C}^2\text{ and }\mathbb{C}^3\text{ respectively.} \\
\text{ then }u^*= \begin{bmatrix}
2 - 3i &
1 - 5i
\end{bmatrix}
\text{ and } \\
\langle u,v \rangle = u^*v = \begin{bmatrix}
2 - 3i &
1 - 5i
\end{bmatrix}
\begin{bmatrix}
1 + i \\
2 + 2i
\end{bmatrix}
= (2-3i)(1+i)+(1-5i)(2+2i)=[4-13i]\end{split}
$$

Definition: A complex matrix $A$ us unitary when $A^{-1} = A^*$

Example: $A = \frac{1}{2}\begin{bmatrix}1+i & 1-i \\1-i & 1+i\end{bmatrix}$

Theorem: An $n \times n$ complex matrix $A$ is unitary $\iff$ its rows or columns form an orthanormal set in $\mathcal{C}^n$

Definition: A square matrix $A$ is Hermitian when $A=A^*$

Example: $A = \begin{bmatrix}a_1 & b_1+b_2i \\b_1+b_2i & d+1\end{bmatrix}$

Theorem: Matrix $A$ is Hermitian $\iff$:

1. $a_{ii} \in \mathbb{R}$

2. $a_{ij}$ is complex conjugate of $a_{ji}$

Theorem: If $A$ is a Hermirian matrix, then its eigenvalues are real numbers.

Theorem: Hermitian matrices are unitarity diagonizable.

Definitions: A squared matrix A is unitarily diagonizable when there exists a unitary matrix $P$ such that $P^{-1}AP$.

Diagonizability can be extended to a larger class of matrices, called normal matrices.

Definition: A square complex matrix A is called normal when it commutes with its conjugate transpose. $AA^*=A^*A$.

Theorem: A complex matrix $A$ is normal $\iff A$ is diagonizable.

This theorem plays a crucial role in ComplEx paper.

---

**Eigen decomposition for entity embedding**

The matrix decomposition methods have a long history in machine learning. Using embeddings based decomposition in the form of $X=EWE^{-1}$ for square symmetric matrices can be represented as eigen decomposition $X=Q\Lambda Q^{-1}$ where $Q$ is orthogonal $(Q^{-1} = Q^\top)$ and $\Lambda = diag(\lambda)$ and $\lambda_i$ is an eigenvector of $X$.

As ComplEx targets to learn antisymmetric relations, and eigen decomposition for asymmetric matrices does not exist in real space, the authors extend the embedding representation to complex numbers, where they can factorize complex matrices and benefit from efficient scaling and distribution of matrix multiplication while being able to capture antisymmetric relations. This asymmetry is resulted from the fact that dot product of complex matrices involves conjugate transpose.

We are not done yet. Do you remember in RESCAL the number of parameters was $O(d^2)$ and DistMulti reduce that to a linear relation of $O(d)$ by limiting matrix $M_r$ to be diagonal?. Here even with complex eigenvectors $E \in \mathcal{C}^{n \times n}$, inversion of $E$ in $X=EWE^{*}$ explodes the number of parameters. As a result we need to find a solutions in which W is a diagonal matrix, and $E = E^*$, and $X$ is asymmetric, so that we

1. computation is minimized

2. there is no need to compute inverse of $E$, and

3. antisymmetric relations can be captures. We have already seen the solution in the complex vector space section. The paper does construct the decomposition in a normal space, a vector space composed of complex normal vectors.

---

**The Score Function**

A relation between two entities can be modeled as a sign function, meaning that if there is a relation between a subject and an object, then the score is 1, otherwise it is -1. More formally, $Y_{so}\in \{-1, 1\}$. The probability of a relation between two edntities to exist is then given by sigmoid function: $P(Y_{so}=1) = \sigma(X_{so})$.

This probability score requires $X$ to be real, while $EWE^*$ includes both real and imaginary components. We can simply project the decomposition to the real space so that $X =Re(EWE^*)$. the score function of ComlEx, therefore is given by:

$$
f_r(h, t) = Re(h^\top diag(r) \bar{t}) = Re(\sum_{i=0}^{d-1}[r]_i.[h]_i.[\bar{t}]_i)
$$

and since there are no nested loops, the number of parameters is linear and is given by $O(d)$.

#### RotateE

## 结语

第四十五篇博文写完，开心！！！！

今天，也是充满希望的一天。