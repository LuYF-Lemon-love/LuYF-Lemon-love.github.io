---
title: 使用 pandas 为 TransE 预处理数据-ubuntu
tags:
  - Python
  - pandas
  - 人工智能
  - 深度学习
  - 知识图谱
  - 知识表示学习
  - 知识图谱补全
categories: Python
description: 使用 pandas 为 TransE 预处理数据。
cover: 'https://cos.luyf-lemon-love.space/images/8885233608..png'
abbrlink: 1364586428
date: 2022-11-27 14:06:55
---

## 前言

```python
# data_preprocessing
#
# created by LuYF-Lemon-love  on October 31, 2022
#
# 该脚本为 TransE 生成数据集
#
# prerequisites:
#     ../origin_data/raw_data.csv
#
# 输出最终的数据
# output:
#     ../final_data/relation2id.txt
#     ../final_data/entity2id.txt
#     ../final_data/train2id.txt
#     ../final_data/valid2id.txt
#     ../final_data/test2id.txt
```

操作系统：**Ubuntu 20.04.5 LTS**

## 生成目录

```shell
!mkdir -p ../final_data
```

## 导入第三方库

```python
import numpy as np
import pandas as pd
import random
```

## 读取原始数据

```python
df = pd.read_csv('../origin_data/raw_data.csv')
```

---

```python
# 去掉 '病理', '诊断', '预防' 三列

df = df.loc[:, [column for column in df.columns if column not in ['病理', '诊断', '预防']]]
```

## 生成 relation2id.txt

```python
relation2id = {}
f = open('../final_data/relation2id.txt', 'w')
f.write('%d\n' % (len(df.columns[1:])))
for id, relation in enumerate(df.columns[1:]):
    f.write("%s\n" % relation)
    relation2id[relation] = id
f.close()
```

## 生成 entity2id.txt

```python
entitys = set()
triples = []

for index, Series in df.iterrows():
    head = Series['疾病名称'].replace(' ', '-')
    for column_name in df.columns[1:]:
        if Series[column_name] is not np.nan:
            for tail in Series[column_name].strip(' ;').split(';'):
                if tail != '':
                    tail = ''.join([ch for ch in tail if ch not in [' ', '\t', '\n', '\r']])
                    entitys.add(tail)
                    triples.append([head, tail, column_name])
    entitys.add(head)
```

---

```python
entity2id = {}
f = open('../final_data/entity2id.txt', 'w')
f.write('%d\n' % (len(entitys)))
for id, entity in enumerate(list(entitys)):
    f.write('%s\n' % entity)
    entity2id[entity] = id
f.close()
```

## shuffle 数据集

```python
random.seed(42)
random.shuffle(triples)
total = len(triples)
```

## 生成 train2id.txt, valid2id.txt, test2id.txt

```python
train_set = triples[:int(total * 0.8)]
valid_set = triples[int(total * 0.8):int(total * 0.9)]
test_set = triples[int(total * 0.9):]

f= open('../final_data/train2id.txt', 'w')
f.write('%d\n' % (len(train_set)))
for row in train_set:
    f.write('%d\t%d\t%d\n' % (entity2id[row[0]], entity2id[row[1]], relation2id[row[2]]))
f.close()

f= open('../final_data/valid2id.txt', 'w')
f.write('%d\n' % (len(valid_set)))
for row in valid_set:
    f.write('%d\t%d\t%d\n' % (entity2id[row[0]], entity2id[row[1]], relation2id[row[2]]))
f.close()

f= open('../final_data/test2id.txt', 'w')
f.write('%d\n' % (len(test_set)))
for row in test_set:
    f.write('%d\t%d\t%d\n' % (entity2id[row[0]], entity2id[row[1]], relation2id[row[2]]))
f.close()
```

## `final_data`

该数据集是 [医药知识图谱](http://43.142.68.89/) 的实体子集. `raw_data.csv` 是 [医药知识图谱](http://43.142.68.89/) 的原始数据. 该数据集是使用 `data_preprocessing.ipynb` 脚本移除了 `raw_data.csv` 的 **病理**, **诊断**, **预防** 这**三列数据**得到的. 一共 **32,831** 个三元组, **12,728** 个实体, **10** 个关系, 被随机地分成了训练集 (**26,264** 个), 验证集 (**3,283** 个), 测试集 (**3,284** 个).

- `entity2id.txt`: 第一行是实体个数. 其余行是实体名, 每行一个. (实体名内不能有**空白符**, 实体的 **ID** 从 **0** 开始, **第二行的第一个实体的 ID 为 0**, **第三行的第二个实体的 ID 为 1**, ...)

- `relation2id.txt`: 第一行是关系个数. 其余行是关系名, 每行一个. (关系名内不能有**空白符**, 关系的 **ID** 从 **0** 开始, **第二行的第一个关系的 ID 为 0**, **第三行的第二个关系的 ID 为 1**, ...)

- `train2id.txt`: 训练文件. 第一行是训练集三元组的个数. 其余行是 (e1, e2, rel) 格式的三元组, 每行一个. e1, e2 是实体 ID, rel 是关系 ID.

- `valid2id.txt`: 验证文件. 第一行是验证集三元组的个数. 其余行是 (e1, e2, rel) 格式的三元组, 每行一个. e1, e2 是实体 ID, rel 是关系 ID.

- `test2id.txt`: 测试文件. 第一行是测试集三元组的个数. 其余行是 (e1, e2, rel) 格式的三元组, 每行一个. e1, e2 是实体 ID, rel 是关系 ID.

## 结语

第三十九篇博文写完，开心！！！！

今天，也是充满希望的一天。