---
title: Flowcharts-Basic Syntax-ubuntu
tags:
  - Flowcharts
  - Mermaid
  - Markdown
  - Hexo
  - Butterfly
categories:
  - 计算机基础
  - 博客
description: 基于 Mermaid 介绍在 Markdown 中绘制流程图的方法。
cover: >-
  https://cos.luyf-lemon-love.space/images/20220520214810.png
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

### Flowcharts - Basic Syntax

流程图是由节点、几何形状、边、箭头和线条组成。注：不要将小写单词 end 作为流程图的节点。

#### A node (default)

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

#### A node with text

```markdown
{% mermaid %}
flowchart LR
    id1[This is the text in the box]
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    id1[This is the text in the box]
{% endmermaid %}

#### Graph

```markdown
{% mermaid %}
flowchart TD
    Start --> Stop
{% endmermaid %}
```

{% mermaid %}
flowchart TD
    Start --> Stop
{% endmermaid %}

```markdown
{% mermaid %}
flowchart LR
    Start --> Stop
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    Start --> Stop
{% endmermaid %}

#### Flowchart Orientation

- TB | TD: 从上到下

- BT: 从下到上

- RL: 从右到左

- LR: 从左到右

#### A node with round edges

```markdown
{% mermaid %}
flowchart LR
    id1(This is the text in the box)
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    id1(This is the text in the box)
{% endmermaid %}

#### A stadium-shaped node

```markdown
{% mermaid %}
flowchart LR
    id1([This is the text in the box])
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    id1([This is the text in the box])
{% endmermaid %}

#### A node in a subroutine shape

```markdown
{% mermaid %}
flowchart LR
    id1[[This is the text in the box]]
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    id1[[This is the text in the box]]
{% endmermaid %}

#### A node in a cylindrical shape

```markdown
{% mermaid %}
flowchart LR
    id1[(Database)]
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    id1[(Database)]
{% endmermaid %}

#### A node in the form of a circle

```markdown
{% mermaid %}
flowchart LR
    id1((This is the text in the circle))
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    id1((This is the text in the circle))
{% endmermaid %}

#### A node in an asymmetric shape

```markdown
{% mermaid %}
flowchart LR
    id1>This is the text in the box]
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    id1>This is the text in the box]
{% endmermaid %}

#### A node (rhombus)

```markdown
{% mermaid %}
flowchart LR
    id1{This is the text in the box}
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    id1{This is the text in the box}
{% endmermaid %}

#### Parallelogram

```markdown
{% mermaid %}
flowchart TD
    id1[/This is the text in the box/]
{% endmermaid %}
```

{% mermaid %}
flowchart TD
    id1[/This is the text in the box/]
{% endmermaid %}

#### Parallelogram alt

```markdown
{% mermaid %}
flowchart TD
    id1[\This is the text in the box\]
{% endmermaid %}
```

{% mermaid %}
flowchart TD
    id1[\This is the text in the box\]
{% endmermaid %}

#### Trapezoid

```markdown
{% mermaid %}
flowchart TD
    A[/Christmas\]
{% endmermaid %}
```

{% mermaid %}
flowchart TD
    A[/Christmas\]
{% endmermaid %}

#### Trapezoid alt

```markdown
{% mermaid %}
flowchart TD
    B[\Go shopping/]
{% endmermaid %}
```

{% mermaid %}
flowchart TD
    B[\Go shopping/]
{% endmermaid %}

#### Double circle

```markdown
{% mermaid %}
flowchart TD
    id1(((This is the text in the circle)))
{% endmermaid %}
```

{% mermaid %}
flowchart TD
    id1(((This is the text in the circle)))
{% endmermaid %}

#### A link with arrow head

```markdown
{% mermaid %}
flowchart LR
    A-->B
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    A-->B
{% endmermaid %}

#### An open link

```markdown
{% mermaid %}
flowchart LR
    A --- B
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    A --- B
{% endmermaid %}

#### Text on links

```markdown
{% mermaid %}
flowchart LR
    A-- This is the text! ---B
{% endmermaid %}

or

{% mermaid %}
flowchart LR
    A---|This is the text!|B
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    A-- This is the text! ---B
{% endmermaid %}

or

{% mermaid %}
flowchart LR
    A---|This is the text!|B
{% endmermaid %}

#### A link with arrow head and text

```markdown
{% mermaid %}
flowchart LR
    A-->|text|B
{% endmermaid %}

or 

{% mermaid %}
flowchart LR
    A-- text -->B
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    A-->|text|B
{% endmermaid %}

or

{% mermaid %}
flowchart LR
    A-- text -->B
{% endmermaid %}

#### Dotted link

```markdown
{% mermaid %}
flowchart LR;
    A-.->B;
{% endmermaid %}
```

{% mermaid %}
flowchart LR;
    A-.->B;
{% endmermaid %}

#### Dotted link with text

```markdown
{% mermaid %}
flowchart LR
    A-. text .-> B
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    A-. text .-> B
{% endmermaid %}

#### Thick link

```markdown
{% mermaid %}
flowchart LR
    A ==> B
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    A ==> B
{% endmermaid %}

#### Thick link with text

```markdown
{% mermaid %}
flowchart LR
    A == text ==> B
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    A == text ==> B
{% endmermaid %}

#### Chaining of links

```markdown
{% mermaid %}
flowchart LR
    A -- text --> B -- text2 --> C
{% endmermaid %}

{% mermaid %}
flowchart LR
    a --> b & c --> d
{% endmermaid %}

{% mermaid %}
flowchart TB
    A & B--> C & D
{% endmermaid %}

{% mermaid %}
flowchart TB
    A --> C
    A --> D
    B --> C
    B --> D
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    A -- text --> B -- text2 --> C
{% endmermaid %}

{% mermaid %}
flowchart LR
    a --> b & c --> d
{% endmermaid %}

{% mermaid %}
flowchart TB
    A & B--> C & D
{% endmermaid %}

{% mermaid %}
flowchart TB
    A --> C
    A --> D
    B --> C
    B --> D
{% endmermaid %}

#### New arrow types

```markdown
{% mermaid %}
flowchart LR
    A --o B
    B --x C
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    A --o B
    B --x C
{% endmermaid %}

#### Multi directional arrows

```markdown
{% mermaid %}
flowchart LR
    A o--o B
    B <--> C
    C x--x D
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    A o--o B
    B <--> C
    C x--x D
{% endmermaid %}

#### Minimum length of a link

you can ask for any link to be longer than the others by adding extra dashes in the link definition.

```markdown
{% mermaid %}
flowchart TD
    A[Start] --> B{Is it?}
    B -->|Yes| C[OK]
    C --> D[Rethink]
    D --> B
    B ---->|No| E[End]
{% endmermaid %}

{% mermaid %}
flowchart TD
    A[Start] --> B{Is it?}
    B -- Yes --> C[Ok]
    C --> D[Rethink]
    D --> B
    B -- No ----> E[End]
{% endmermaid %}
```

{% mermaid %}
flowchart TD
    A[Start] --> B{Is it?}
    B -->|Yes| C[OK]
    C --> D[Rethink]
    D --> B
    B ---->|No| E[End]
{% endmermaid %}

{% mermaid %}
flowchart TD
    A[Start] --> B{Is it?}
    B -- Yes --> C[Ok]
    C --> D[Rethink]
    D --> B
    B -- No ----> E[End]
{% endmermaid %}

|Length|1|2|3|
|:-:|:-:|:-:|:-:|
|Normal|---|----|-----|
|Normal with arrow|-->|--->|---->|
|Thick|===|====|=====|
|Thick with arrow|==>|===>|====>|
|Dotted|-.-|-..-|-...-|
|Dotted with arrow|-.->|-..->|-...->|

#### Special characters that break syntax

It is possible to put text within quotes in order to render more troublesome characters.

```markdown
{% mermaid %}
flowchart LR
    id1["This is the (text) in the box"]
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    id1["This is the (text) in the box"]
{% endmermaid %}

#### Entity codes to escape characters

```markdown
{% mermaid %}
flowchart LR
    A["A double quote:#quot;"] -->B["A dec char:#9829;"]
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    A["A double quote:#quot;"] -->B["A dec char:#9829;"]
{% endmermaid %}

#### Subgraphs

```markdown
subgraph title
    graph definition
end
```

```markdown
{% mermaid %}
flowchart TB
    c1-->a2
    subgraph one
    a1-->a2
    end
    subgraph two
    b1-->b2
    end
    subgraph three
    c1-->c2
    end
{% endmermaid %}
```

{% mermaid %}
flowchart TB
    c1-->a2
    subgraph one
    a1-->a2
    end
    subgraph two
    b1-->b2
    end
    subgraph three
    c1-->c2
    end
{% endmermaid %}

```markdown
{% mermaid %}
flowchart TB
    c1-->a2
    subgraph ide1 [one]
    a1-->a2
    end
{% endmermaid %}
```

{% mermaid %}
flowchart TB
    c1-->a2
    subgraph ide1 [one]
    a1-->a2
    end
{% endmermaid %}

#### flowcharts

```markdown
{% mermaid %}
flowchart TB
    c1-->a2
    subgraph one
    a1-->a2
    end
    subgraph two
    b1-->b2
    end
    subgraph three
    c1-->c2
    end
    one --> two
    three --> two
    two --> c2
{% endmermaid %}
```

{% mermaid %}
flowchart TB
    c1-->a2
    subgraph one
    a1-->a2
    end
    subgraph two
    b1-->b2
    end
    subgraph three
    c1-->c2
    end
    one --> two
    three --> two
    two --> c2
{% endmermaid %}

#### Direction in subgraphs

```markdown
{% mermaid %}
flowchart LR
    subgraph TOP
        direction TB
        subgraph B1
            direction RL
            i1 -->f1
        end
        subgraph B2
            direction BT
            i2 -->f2
        end
    end
    A --> TOP --> B
    B1 --> B2
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    subgraph TOP
        direction TB
        subgraph B1
            direction RL
            i1 -->f1
        end
        subgraph B2
            direction BT
            i2 -->f2
        end
    end
    A --> TOP --> B
    B1 --> B2
{% endmermaid %}

#### Comments

```markdown
{% mermaid %}
flowchart LR
%% this is a comment A -- text --> B{node}
    A -- text --> B -- text2 --> C
{% endmermaid %}
```

{% mermaid %}
flowchart LR
%% this is a comment A -- text --> B{node}
    A -- text --> B -- text2 --> C
{% endmermaid %}

#### Styling links

```markdown
{% mermaid %}
flowchart TB
    A --> C
    A --> D
    B --> C
    B --> D
    linkStyle 3 stroke:#ff3,stroke-width:4px,color:red;
{% endmermaid %}
```

{% mermaid %}
flowchart TB
    A --> C
    A --> D
    B --> C
    B --> D
    linkStyle 3 stroke:#ff3,stroke-width:4px,color:red;
{% endmermaid %}

#### Styling a node

```markdown
{% mermaid %}
flowchart LR
    id1(Start)-->id2(Stop)
    style id1 fill:#f9f,stroke:#333,stroke-width:4px
    style id2 fill:#bbf,stroke:#f66,stroke-width:2px,color:#fff,stroke-dasharray: 5 5
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    id1(Start)-->id2(Stop)
    style id1 fill:#f9f,stroke:#333,stroke-width:4px
    style id2 fill:#bbf,stroke:#f66,stroke-width:2px,color:#fff,stroke-dasharray: 5 5
{% endmermaid %}

#### Classes

```markdown
{% mermaid %}
flowchart LR
    A:::someclass --> B
    classDef someclass fill:#f96,stroke:#333,stroke-width:4px;
{% endmermaid %}
```

{% mermaid %}
flowchart LR
    A:::someclass --> B
    classDef someclass fill:#f96,stroke:#333,stroke-width:4px;
{% endmermaid %}

#### Basic support for fontawesome

```markdown
{% mermaid %}
flowchart TD
    B["fa:fa-twitter for peace"]
    B-->C[fa:fa-ban forbidden]
    B-->D(fa:fa-spinner);
    B-->E(A fa:fa-camera-retro perhaps?)
{% endmermaid %}
```

{% mermaid %}
flowchart TD
    B["fa:fa-twitter for peace"]
    B-->C[fa:fa-ban forbidden]
    B-->D(fa:fa-spinner);
    B-->E(A fa:fa-camera-retro perhaps?)
{% endmermaid %}

### 结语

第十一篇博文写完，开心！！！！

今天，也是充满希望的一天。
