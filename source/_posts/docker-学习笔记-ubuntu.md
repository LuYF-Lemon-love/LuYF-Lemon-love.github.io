---
title: docker 学习笔记-ubuntu
tags:
  - docker
  - Linux
categories: 计算机基础
description: 初步学习 docker 的笔记。
cover: 'https://cos.luyf-lemon-love.space/images/docker.jpeg'
abbrlink: 2218338558
date: 2022-08-31 17:24:32
---

## 前言

[Docker](https://www.docker.com/) 是一个开源的应用`容器`引擎，让开发者可以打包他们的应用以及依赖包到一个可移植的`镜像`中，然后发布到任何流行的 `Linux` 或 `Windows` 操作系统的机器上，也可以实现`虚拟化`。`容器`是完全使用`沙箱`机制，相互之间不会有任何接口。

原教学视频是[遇见狂神说](https://space.bilibili.com/95256449)的[【狂神说Java】Docker最新超详细版教程通俗易懂](https://www.bilibili.com/video/BV1og4y1q7M4)。

原笔记可以参考：[狂神说docker(最全笔记）](https://blog.csdn.net/qq_21197507/article/details/115071715?spm=1001.2014.3001.5506)。

操作系统：Ubuntu 20.04.4 LTS

## 参考文档

1. [Docker](https://baike.baidu.com/item/Docker/13344470)

2. [【狂神说Java】Docker最新超详细版教程通俗易懂](https://www.bilibili.com/video/BV1og4y1q7M4)

3. [狂神说docker(最全笔记）](https://blog.csdn.net/qq_21197507/article/details/115071715?spm=1001.2014.3001.5506)

## Docker入门

### Docker 为什么会出现

在 `Docker` 之前，一款产品需要两种配置环境（`开发环境`和`运维上线环境`）。

1. 由于`开发`和`运维`的环境（电脑操作系统、软件版本等）不同，经常导致运维人员无法成功部署产品。

2. 分布式系统（如 `Hadoop`）需要为每一个电脑配置环境，非常麻烦。

3. 由于开发人员经常使用 `Windows` 或者 `MacOS` 进行开发，然后将产品部署到 `Linux` 上，因此经常出现无法成功部署问题。

`Docker` 让开发者可以打包他们的应用以及`依赖包`到一个可移植的`镜像`中，然后发布到任何流行的 `Linux` 或 `Windows` 操作系统的机器上，进而解决了上面问题。

---

`Docker` 的思想来自于集装箱！隔离机制（`容器`是完全使用`沙箱`机制，相互之间不会有任何接口。）使得 `Docker` 能够轻松的部署软件，并且各个软件不会相互冲突。

`Docker` 通过隔离机制，使得服务器可以被利用到极致。

### Docker 的历史

`Docker` 是 `PaaS` 提供商 `dotCloud` 开源的一个基于 `LXC` 的高级容器引擎，源代码托管在 `Github` 上, 基于 `go` 语言并遵从 `Apache2.0` 协议开源。

与 `Docker` （`容器技术`）相对应是`虚拟机技术`（如 `VMware`）。

- `虚拟机技术`: 在本地操作系统（如 `Windows`）装一个 `VMware`，通过 `VMware` 可以虚拟出来一个新的电脑（操作系统）。相当笨重！

- `虚拟机技术`和 `Docker` （`容器技术`）都属于虚拟化技术！

>`VMware`: `Linux centos` 原生镜像相当于一台完整的电脑，每个都需要几个 `G`，每次启动都需要几分钟。
>
>`docker`: 镜像一般十分小巧，只有几 `M`或者几 `KB`，秒级启动。

![](https://cos.luyf-lemon-love.space/images/20220831211811.png)

`Docker` 是基于 `Go` 语言开发的！是一个开源项目。

`Docker` 的官网地址为：https://www.docker.com/ 。

`Docker` 的官方文档地址为：https://docs.docker.com/ 。

`Docker Hub` 的地址为：https://hub.docker.com/ 。

### 虚拟机技术和容器化技术对比

#### 虚拟机技术的缺点

如下图，每一个虚拟机都包括`操作系统内核`、`库文件`和`上层应用软件`。

- `资源占用十分多`。

- `冗余步骤多`。

- `启动很慢`。

![](https://cos.luyf-lemon-love.space/images/20200807193002905.png)

#### 容器化技术

![](https://cos.luyf-lemon-love.space/images/20220831214838.png)

`Docker` 和`虚拟机技术`的区别：

- `传统虚拟机`会首先虚拟出一个完整的操作系统和相关硬件，然后在这个系统上安装和运行软件。

- `Docker` 的容器是没有自己的内核的，也没有相关硬件。容器内的应用是直接运行在宿主机上的，因此十分的轻巧。

- 容器间是相互隔离的，每个容器都有一个独立的文件系统，因此各个容器互不影响。

#### DevOps(开发和运营维护)

1. {% label 更快速的交互和部署 pink %}

   - `传统开发和运营维护`：大量帮助文档和安装程序。

   - `Docker`: 打包镜像，一键运行。

2. {% label 更便捷的升级和扩缩容 purple %}

   - `Docker` 会像搭积木一样部署应用。整个项目会被打包成一个镜像。

3. {% label 更简单的系统运维 orange %}

   - 开发和测试环境高度一致。

4. {% label 更高效的计算机资源利用 green %}

   - `Docker` 是内核级别的虚拟化，可以在一个物理机上运行多个容器实例！服务器的性能可以被压榨到极致。

### 名词解释

1. 镜像（image）

   - `Docker` 镜像相当于模板，可以用于创建 `Docker` 容器服务。一个镜像可以创建多个 `Docker` 容器服务（我们软件或者服务是运行在容器中的）。

2. 容器（container）

   - `Docker` 通过镜像来创建一个或者多个容器，进而独立运行一个或者一组应用。

   - 容器具有启动、停止和删除等基本命令！

   - 可以把容器理解为一个独立的 `linux` 系统。

3. 仓库（repository）

   - 存放镜像的地方。如 `Docker Hub` 和阿里云镜像服务器。

## 结语

第二十七篇博文写完，开心！！！！

今天，也是充满希望的一天。