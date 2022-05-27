---
title: Flowcharts-Basic Syntax-ubuntu
tags:
  - Flowcharts
  - Mermaid
  - Markdown
  - Hexo
  - Butterfly
categories:
  - 博客
  - 计算机基础
description: 基于 Mermaid 介绍在 Markdown 中绘制流程图的方法。
cover: >-
  https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220520214810.png
abbrlink: 3076501066
date: 2022-05-27 14:16:31
---

### 前言

[Mermaid](https://mermaid-js.github.io/mermaid/) 可以让你使用文本和代码构建可视化和图表。它是一个基于 Javascript 的图表工具，渲染 Markdown 文本来自动的生成和修改图表。

在 Hexo 的 Butterfly 主题下可以绘制 Mermaid 图表。

流程图是最常见的图表，因此将要在本博文介绍流程图的绘制。

操作系统：Ubuntu 20.04.4 LTS。

### 参考文档

1. [Mermaid 文档](https://mermaid-js.github.io/mermaid/)

2. [Butterfly 安装文档(三) 主题配置-1](https://butterfly.js.org/posts/4aa8abbe/)

3. [Flowcharts - Basic Syntax](https://mermaid-js.github.io/mermaid/#/flowchart)

### 配置 Mermaid

使用 Mermaid 标签可以绘制 Flowchart（流程图）、Sequence diagram（时序图 ）、Class Diagram（类别图）、State Diagram（状态图）、Gantt（甘特图）和Pie Chart（圆形图）。

[mermaid 文档](https://mermaid-js.github.io/mermaid/)

配置 _config.butterfly.yml 文件

```yaml
# mermaid
# see https://github.com/mermaid-js/mermaid
mermaid:
  enable: true
  # built-in themes: default/forest/dark/neutral
  theme:
    light: default
    dark: dark
```

**写法**

```markdown
{% mermaid %}
内容
{% endmermaid %}
```

```markdown
{% mermaid %}
pie
    title Key elements in Product X
    "Calcium" : 42.96
    "Potassium" : 50.05
    "Magnesium" : 10.01
    "Iron" :  5
{% endmermaid %}
```

**效果**

{% mermaid %}
pie
    title Key elements in Product X
    "Calcium" : 42.96
    "Potassium" : 50.05
    "Magnesium" : 10.01
    "Iron" :  5
{% endmermaid %}

### 流程图 - 基本语法

流程图是由节点、几何形状、边、箭头和线条组成。注：不要将小写单词 end 作为流程图的节点。

#### 节点（默认）

```markdown
{% mermaid %}
flowchart LR
    id
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    id
{% endmermaid %}

### 结语

第十一篇博文写完，开心！！！！

今天，也是充满希望的一天。
