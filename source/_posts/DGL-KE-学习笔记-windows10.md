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

## 结语

第四十五篇博文写完，开心！！！！

今天，也是充满希望的一天。