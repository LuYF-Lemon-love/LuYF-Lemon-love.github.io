---
title: Drug Repurposing for Covid-19 via Disease-ubuntu
tags:
  - Python
  - 人工智能
  - 深度学习
  - 知识图谱
  - 知识表示学习
  - 知识图谱补全
  - 药物重定位
categories: Python
description: 通过 TransE 进行药物重定位。
cover: 'https://cos.luyf-lemon-love.space/images/8151266243..png'
abbrlink: 1905961595
date: 2022-11-30 13:13:08
---

## 前言

>**Drug Repurposing Knowledge Graph (DRKG)** is a **comprehensive biological knowledge graph** relating **genes**, **compounds**, **diseases**, **biological processes**, **side effects** and **symptoms**. DRKG includes information from six existing databases including **DrugBank**, **Hetionet**, **GNBR**, **String**, **IntAct** and **DGIdb**, and **data collected from recent publications particularly related to Covid19**. It includes **97,238** entities belonging to **13 entity-types**; and **5,874,261** triplets belonging to **107 edge-types**. These 107 edge-types show a type of interaction between one of the 13 entity-type pairs (**multiple types of interactions are possible between the same entity-pair**), as depicted in the figure below. It also **includes a bunch of notebooks about how to explore and analysis the DRKG** using **statistical methodologies** or using **machine learning methodologies** such as **knowledge graph embedding**.

![](https://cos.luyf-lemon-love.space/images/20221130135805.png)

Figure: **Interactions in the DRKG**. The number next to an edge indicates **the number of relation-types for that entity-pair** in DRKG.

原项目地址: https://github.com/gnn4dr/DRKG .

操作系统：**Ubuntu 20.04.5 LTS**

## 参考文档

1. [Drug Repurposing Knowledge Graph (DRKG)](https://github.com/gnn4dr/DRKG)

## 配置环境

### 下载 DRKG

为了分析 **DRKG**, 可以直接通过下面的命令下载 **DRKG**.

```shell
$ wget https://dgl-data.s3-us-west-2.amazonaws.com/dataset/DRKG/drkg.tar.gz
```

(不推荐) 如果直接使用项目仓库中的 notebooks , 不需要手动的下载 **DRKG**, 因为会自动下载 **DRKG**.

当你解压 **drkg.tar.gz**, 将会发现下面的文件:

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

### 版本

Python 版本 (参考):

```shell
$ python --version
Python 3.9.7
```

Python 包版本 (参考):

```shell
Package                            Version
---------------------------------- --------------------
jupyter                            1.0.0
numpy                              1.20.3
requests                           2.26.0
torch                              1.13.0
```

### 真正的配置流程

最简单的方法就是直接 **git clone** 项目仓库.

```shell
$ git clone https://github.com/gnn4dr/DRKG.git
$ cd DRKG
$ mkdir data
$ cd data
```

直接在浏览器的地址栏输入 https://dgl-data.s3-us-west-2.amazonaws.com/dataset/DRKG/drkg.tar.gz, 下载到上面的 data 目录中, 然后解压, 结果如下.

```shell
$ tree data/
data/
├── drkg
│   ├── drkg.tsv
│   ├── embed
│   │   ├── DRKG_TransE_l2_entity.npy
│   │   ├── DRKG_TransE_l2_relation.npy
│   │   ├── entities.tsv
│   │   ├── mol_contextpred.npy
│   │   ├── mol_edgepred.npy
│   │   ├── mol_infomax.npy
│   │   ├── mol_masking.npy
│   │   ├── Readme.md
│   │   └── relations.tsv
│   ├── entity2src.tsv
│   └── relation_glossary.tsv
└── drkg.tar.gz

2 directories, 13 files
$
```

## 说明

本文介绍的内容是项目的 [DRKG/drug_repurpose/COVID-19_drug_repurposing.ipynb](https://github.com/gnn4dr/DRKG/blob/master/drug_repurpose/COVID-19_drug_repurposing.ipynb) 的内容, 只是额外的打印了一些帮助输出.

>[COVID-19_drug_repurposing.ipynb](https://github.com/gnn4dr/DRKG/blob/master/drug_repurpose/COVID-19_drug_repurposing.ipynb) shows how to do drug repurposing for Covid-19 by predicting links between **the disease entities** and **the drug entitites** in the DRKG. **The target disease entities** are listed in the notebook and the **candidate drug entities** are listed in [infer_drug.tsv](https://github.com/gnn4dr/DRKG/blob/master/drug_repurpose/infer_drug.tsv). **The drugs are all from Drugbank and we exclude drugs with molecule weight less than 250 daltons which results in 8104 candidates.** Two edge types are chosen here: **Hetionet::CtD::Compound:Disease** and **GNBR::T::Compound:Disease**, which represent the **treatment relationship** between a certain drug for a disease. **To evaluate the repurposed drugs, we compare them with the clinical drugs as there is no treatment for Covid-19 right now.** The list of clinical drugs are shown in [COVID19_clinical_trial_drugs.tsv](https://github.com/gnn4dr/DRKG/blob/master/drug_repurpose/COVID19_clinical_trial_drugs.tsv) which is collected from http://www.covid19-trials.com/.

### COVID-19 Drug Repurposing via disease-compounds relations

This example shows how to **do drug repurposing** using **DRKG** even with **the pretrained model**.

## Collecting COVID-19 related disease

At the very beginning we need to **collect a list of disease of Corona-Virus(COV)** in DRKG. We can easily use the **Disease ID** that DRKG uses for encoding the disease. Here we take **all of the COV disease** as target.

```python
COV_disease_list = [
'Disease::SARS-CoV2 E',
'Disease::SARS-CoV2 M',
'Disease::SARS-CoV2 N',
'Disease::SARS-CoV2 Spike',
'Disease::SARS-CoV2 nsp1',
'Disease::SARS-CoV2 nsp10',
'Disease::SARS-CoV2 nsp11',
'Disease::SARS-CoV2 nsp12',
'Disease::SARS-CoV2 nsp13',
'Disease::SARS-CoV2 nsp14',
'Disease::SARS-CoV2 nsp15',
'Disease::SARS-CoV2 nsp2',
'Disease::SARS-CoV2 nsp4',
'Disease::SARS-CoV2 nsp5',
'Disease::SARS-CoV2 nsp5_C145A',
'Disease::SARS-CoV2 nsp6',
'Disease::SARS-CoV2 nsp7',
'Disease::SARS-CoV2 nsp8',
'Disease::SARS-CoV2 nsp9',
'Disease::SARS-CoV2 orf10',
'Disease::SARS-CoV2 orf3a',
'Disease::SARS-CoV2 orf3b',
'Disease::SARS-CoV2 orf6',
'Disease::SARS-CoV2 orf7a',
'Disease::SARS-CoV2 orf8',
'Disease::SARS-CoV2 orf9b',
'Disease::SARS-CoV2 orf9c',
'Disease::MESH:D045169',
'Disease::MESH:D045473',
'Disease::MESH:D001351',
'Disease::MESH:D065207',
'Disease::MESH:D028941',
'Disease::MESH:D058957',
'Disease::MESH:D006517'
]
```

```python
len(COV_disease_list)
```

    34

```python
COV_disease_list[:3]
```

    ['Disease::SARS-CoV2 E', 'Disease::SARS-CoV2 M', 'Disease::SARS-CoV2 N']

## Candidate drugs

Now we use **FDA-approved drugs** in **Drugbank** as candidate drugs. (we exclude d**rugs with molecule weight < 250**) The drug list is in **infer\_drug.tsv**.

```python
import csv

# Load entity file
drug_list = []
with open("./infer_drug.tsv", newline='', encoding='utf-8') as csvfile:
    reader = csv.DictReader(csvfile, delimiter='\t', fieldnames=['drug','ids'])
    for row_val in reader:
        drug_list.append(row_val['drug'])
```

```python
len(drug_list)
```

    8104

```python
drug_list[:3]
```

    ['Compound::DB00605', 'Compound::DB00983', 'Compound::DB01240']

## Treatment relation

**Two treatment relations** in this context

```python
treatment = ['Hetionet::CtD::Compound:Disease','GNBR::T::Compound:Disease']
```

```python
treatment
```

    ['Hetionet::CtD::Compound:Disease', 'GNBR::T::Compound:Disease']

## Get pretrained model

We can directly use **the pretrianed model** to do drug repurposing.

```python
import numpy as np
import sys
sys.path.insert(1, '../utils')
from utils import download_and_extract
download_and_extract()
```

```python
entity_idmap_file = '../data/drkg/embed/entities.tsv'
relation_idmap_file = '../data/drkg/embed/relations.tsv'
```

## Get embeddings for diseases and drugs

```python
# Get drugname/disease name to entity ID mappings
entity_map = {}
entity_id_map = {}
relation_map = {}
with open(entity_idmap_file, newline='', encoding='utf-8') as csvfile:
    reader = csv.DictReader(csvfile, delimiter='\t', fieldnames=['name','id'])
    for row_val in reader:
        entity_map[row_val['name']] = int(row_val['id'])
        entity_id_map[int(row_val['id'])] = row_val['name']
        
with open(relation_idmap_file, newline='', encoding='utf-8') as csvfile:
    reader = csv.DictReader(csvfile, delimiter='\t', fieldnames=['name','id'])
    for row_val in reader:
        relation_map[row_val['name']] = int(row_val['id'])
        
# handle the ID mapping
drug_ids = []
disease_ids = []
for drug in drug_list:
    drug_ids.append(entity_map[drug])
    
for disease in COV_disease_list:
    disease_ids.append(entity_map[disease])

treatment_rid = [relation_map[treat]  for treat in treatment]
```

```python
len(disease_ids),len(drug_ids),len(treatment_rid)
```

    (34, 8104, 2)

```python
disease_ids[:3],drug_ids[:3],treatment_rid
```

    ([9079, 9085, 9110], [9475, 11010, 7486], [68, 35])

```python
# Load embeddings
import torch as th
entity_emb = np.load('../data/drkg/embed/DRKG_TransE_l2_entity.npy')
rel_emb = np.load('../data/drkg/embed/DRKG_TransE_l2_relation.npy')

drug_ids = th.tensor(drug_ids).long()
disease_ids = th.tensor(disease_ids).long()
treatment_rid = th.tensor(treatment_rid)

drug_emb = th.tensor(entity_emb[drug_ids])
treatment_embs = [th.tensor(rel_emb[rid]) for rid in treatment_rid]
```

```python
disease_ids[:3],drug_ids[:3],treatment_rid
```

    (tensor([9079, 9085, 9110]), tensor([ 9475, 11010,  7486]), tensor([68, 35]))

```python
drug_emb.shape
```

    torch.Size([8104, 400])

## Drug Repurposing Based on Edge Score

We use following algorithm to **calculate the edge score**. Note, here we use **logsigmiod** to make all **scores < 0**. **The larger the score is, the stronger the $h$ will have $r$ with $t$.**

$\mathbf{d} = \gamma - ||\mathbf{h}+\mathbf{r}-\mathbf{t}||_{2}$

$\mathbf{score} = \log\left(\frac{1}{1+\exp(\mathbf{-d})}\right)$

When doing **drug repurposing**, we only use the treatment related relations.

```python
import torch.nn.functional as fn

gamma=12.0
def transE_l2(head, rel, tail):
    score = head + rel - tail
    return gamma - th.norm(score, p=2, dim=-1)

scores_per_disease = []
dids = []
for rid in range(len(treatment_embs)):
    treatment_emb=treatment_embs[rid]
    for disease_id in disease_ids:
        disease_emb = entity_emb[disease_id]
        score = fn.logsigmoid(transE_l2(drug_emb, treatment_emb, disease_emb))
        scores_per_disease.append(score)
        dids.append(drug_ids)
scores = th.cat(scores_per_disease)
dids = th.cat(dids)
```

```python
scores.shape, dids.shape, 2*34*8104
```

    (torch.Size([551072]), torch.Size([551072]), 551072)

```python
# sort scores in decending order
idx = th.flip(th.argsort(scores), dims=[0])
scores = scores[idx].numpy()
dids = dids[idx].numpy()

scores.shape, dids.shape, 2*34*8104
```

    ((551072,), (551072,), 551072)

### Now we output proposed treatments

```python
_, unique_indices = np.unique(dids, return_index=True)
topk=100
topk_indices = np.sort(unique_indices)[:topk]
proposed_dids = dids[topk_indices]
proposed_scores = scores[topk_indices]
```

We select **top K** relevent drugs according **the edge score**.

```python
for i in range(topk):
    drug = int(proposed_dids[i])
    score = proposed_scores[i]
    
    print("{}\t{}".format(entity_id_map[drug], score))
```

    Compound::DB00811	-0.21416780352592468
    Compound::DB00993	-0.8350887298583984
    Compound::DB00635	-0.8974790573120117
    Compound::DB01082	-0.985488772392273
    Compound::DB01234	-0.9984012842178345
    Compound::DB00982	-1.0160716772079468
    Compound::DB00563	-1.0189464092254639
    Compound::DB00290	-1.0641062259674072
    Compound::DB01394	-1.080676555633545
    Compound::DB01222	-1.084547519683838
    Compound::DB00415	-1.0853973627090454
    Compound::DB01004	-1.096669316291809
    Compound::DB00860	-1.1004788875579834
    Compound::DB00681	-1.1011555194854736
    Compound::DB00688	-1.1256868839263916
    Compound::DB00624	-1.1428292989730835
    Compound::DB00959	-1.1618409156799316
    Compound::DB00115	-1.186812400817871
    Compound::DB00091	-1.1906721591949463
    Compound::DB01024	-1.2051165103912354
    Compound::DB00741	-1.2147064208984375
    Compound::DB00441	-1.2320411205291748
    Compound::DB00158	-1.2346546649932861
    Compound::DB00499	-1.252516746520996
    Compound::DB00929	-1.2730495929718018
    Compound::DB00770	-1.282552719116211
    Compound::DB01331	-1.2960493564605713
    Compound::DB00958	-1.296778917312622
    Compound::DB02527	-1.3034359216690063
    Compound::DB00196	-1.3053343296051025
    Compound::DB00537	-1.3131842613220215
    Compound::DB00644	-1.3131849765777588
    Compound::DB01048	-1.3267205953598022
    Compound::DB00552	-1.3272082805633545
    Compound::DB00328	-1.3286100625991821
    Compound::DB00171	-1.3300385475158691
    Compound::DB01212	-1.33307683467865
    Compound::DB09093	-1.3382985591888428
    Compound::DB00783	-1.3385637998580933
    Compound::DB09341	-1.3396947383880615
    Compound::DB00558	-1.3425898551940918
    Compound::DB05382	-1.3575100898742676
    Compound::DB01112	-1.3584487438201904
    Compound::DB00515	-1.3608112335205078
    Compound::DB01101	-1.3815491199493408
    Compound::DB01165	-1.3838152885437012
    Compound::DB01183	-1.3862131834030151
    Compound::DB00815	-1.3863469362258911
    Compound::DB00755	-1.3881793022155762
    Compound::DB00198	-1.3885042667388916
    Compound::DB00480	-1.3935296535491943
    Compound::DB00806	-1.3996552228927612
    Compound::DB01656	-1.3999735116958618
    Compound::DB00759	-1.4046530723571777
    Compound::DB00917	-1.4116041660308838
    Compound::DB01181	-1.4148895740509033
    Compound::DB01039	-1.4176596403121948
    Compound::DB00512	-1.4207416772842407
    Compound::DB01233	-1.4211865663528442
    Compound::DB11996	-1.4257901906967163
    Compound::DB00738	-1.4274098873138428
    Compound::DB00716	-1.4327492713928223
    Compound::DB03461	-1.437927484512329
    Compound::DB00591	-1.4404346942901611
    Compound::DB01327	-1.4408750534057617
    Compound::DB00131	-1.4446901082992554
    Compound::DB00693	-1.4460757970809937
    Compound::DB00369	-1.4505729675292969
    Compound::DB04630	-1.453115463256836
    Compound::DB00878	-1.4564695358276367
    Compound::DB08818	-1.4633687734603882
    Compound::DB00682	-1.4691758155822754
    Compound::DB01068	-1.470010757446289
    Compound::DB00446	-1.4720206260681152
    Compound::DB01115	-1.4729849100112915
    Compound::DB00355	-1.4770021438598633
    Compound::DB01030	-1.4850695133209229
    Compound::DB00620	-1.497349500656128
    Compound::DB00396	-1.497694492340088
    Compound::DB01073	-1.498704433441162
    Compound::DB00640	-1.502620816230774
    Compound::DB00999	-1.503427505493164
    Compound::DB01060	-1.5043613910675049
    Compound::DB00493	-1.5072377920150757
    Compound::DB01240	-1.5090980529785156
    Compound::DB00364	-1.5099471807479858
    Compound::DB01263	-1.5119924545288086
    Compound::DB00746	-1.5130668878555298
    Compound::DB00718	-1.5183119773864746
    Compound::DB01065	-1.5207159519195557
    Compound::DB01205	-1.521277904510498
    Compound::DB01137	-1.5229606628417969
    Compound::DB08894	-1.5239675045013428
    Compound::DB00813	-1.5308716297149658
    Compound::DB01157	-1.5316542387008667
    Compound::DB04570	-1.5430858135223389
    Compound::DB00459	-1.550320029258728
    Compound::DB01752	-1.554166555404663
    Compound::DB00775	-1.555970549583435
    Compound::DB01610	-1.5563467741012573

### Check Clinial Trial Drugs

There are **seven clinial trial drugs hit in top100**. (Note: **Ribavirin exists in DRKG as a treatment for SARS**)

```python
clinical_drugs_file = './COVID19_clinical_trial_drugs.tsv'
clinical_drug_map = {}
with open(clinical_drugs_file, newline='', encoding='utf-8') as csvfile:
    reader = csv.DictReader(csvfile, delimiter='\t', fieldnames=['id', 'drug_name','drug_id'])
    for row_val in reader:
        clinical_drug_map[row_val['drug_id']] = row_val['drug_name']
        
for i in range(topk):
    drug = entity_id_map[int(proposed_dids[i])][10:17]
    if clinical_drug_map.get(drug, None) is not None:
        score = proposed_scores[i]
        print("[{}]\t{}\t{}".format(i, clinical_drug_map[drug],score))
len(clinical_drug_map)
```

    [0]	Ribavirin	-0.21416780352592468
    [4]	Dexamethasone	-0.9984012842178345
    [8]	Colchicine	-1.080676555633545
    [16]	Methylprednisolone	-1.1618409156799316
    [49]	Oseltamivir	-1.3885042667388916
    [87]	Deferoxamine	-1.5130668878555298

    32

## 附录

上面脚本中下载 DRKG 的函数是在 [DRKG/utils/utils.py](https://github.com/gnn4dr/DRKG/blob/master/utils/utils.py) 中.

函数定义如下:

```python
import os
import tarfile

def download_and_extract():
    import shutil
    import requests
    
    url = "https://s3.us-west-2.amazonaws.com/dgl-data/dataset/DRKG/drkg.tar.gz"
    path = "../data/"
    filename = "drkg.tar.gz"
    fn = os.path.join(path, filename)
    if os.path.exists("../data/drkg/drkg.tsv"):
        return
    
    opener, mode = tarfile.open, 'r:gz'
    os.makedirs(path, exist_ok=True)
    cwd = os.getcwd()
    os.chdir(path)
    while True:
        try:
            file = opener(filename, mode)
            try: file.extractall()
            finally: file.close()
            break
        except Exception:
            f_remote = requests.get(url, stream=True)
            sz = f_remote.headers.get('content-length')
            assert f_remote.status_code == 200, 'fail to open {}'.format(url)
            with open(filename, 'wb') as writer:
                for chunk in f_remote.iter_content(chunk_size=1024*1024):
                    writer.write(chunk)
            print('Download finished. Unzipping the file...')
    os.chdir(cwd)
```

## 结语

第四十篇博文写完，开心！！！！

今天，也是充满希望的一天。