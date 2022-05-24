---
title: Linux 基础-ubuntu
tags:
  - Linux
categories: 计算机基础
description: 介绍一些 Linux 基础知识，包括 Linux 操作系统、 Vim 的使用、GCC、静态链接库、动态链接库、Makefile 和 GDB 调试。
cover: >-
  https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220520215149.png
abbrlink: 4256061298
date: 2022-05-24 14:35:22
---

### 前言

Linux 是 UNIX 操作系统的一个克隆系统，但是 Linux 操作系统是开源的。因此 Linux 自从但是以来就是企业级服务器的首选操作系统。它和 Git 一直是学生从学校到企业的两个拦路虎。所以学习 Linux 操作是必要的。

### 参考文档

1. [苏丙榅老师的 Linux 教程](https://subingwen.cn/linux/)

### 初识 Linux 操作系统

#### Linux 的发展历程

{% timeline 1991 %}
<!-- timeline 年初 -->
林纳斯 · 托瓦兹开始在一台 386sx 兼容微机上学习 minix 操作系统。
<!-- endtimeline -->
<!-- timeline 04 -->
林纳斯 · 托瓦兹开始酝酿并着手编制自己的操作系统。
<!-- endtimeline -->
<!-- timeline 04-13 -->
林纳斯 · 托瓦兹在 comp.os.minix 上宣布自己已经成功地将 bash 移植到了 minix 上了。
<!-- endtimeline -->
<!-- timeline 10-05 -->
林纳斯 · 托瓦兹在 comp.os.minix 宣布 Linux 内核已经诞生。
<!-- endtimeline -->
{% endtimeline %}
{% timeline 1992 %}
<!-- timeline -->
Linux 与其他 GNU 软件结合，完全自由的操作系统 GNU/Linux 诞生。
<!-- endtimeline -->
{% endtimeline %}
{% timeline 1993 %}
<!-- timeline -->
Linux 0.99 的代码量有十万行，用户有 10 万个左右。
<!-- endtimeline -->
{% endtimeline %}
{% timeline 1994 %}
<!-- timeline 03 -->
Linux 1.0 发布，公有 17 万行代码。不久正式采用 GPL 协议。
<!-- endtimeline -->
{% endtimeline %}

**Linux 特性**

- Linux 是一个基于文件的操作系统。甚至像鼠标键盘等硬件都被抽象成一个设备文件来管理。

- 多个用户可以同时登录，每个用户同时可以运行多个应用程序。

- 是一个自由软件，免费且开源。

**POSIX** ，英文全称为 Portable Operating System Interface for Computing Systems，是由 IEEE 和 ISO/IEC 开发的一套接口标准，保证所编制的应用程序在源代码一级可以在多种操作系统上可移植。中文名为 可移植操作系统接口。

**Linux 发行版**，对于初学者接触的两个最常见的发行版为

- [CentOS Linux](https://www.centos.org) 发行版是一个稳定、可预测、可管理和可重现的平台，源自红帽 Linux（ RHEL ）的源代码。

- [Ubuntu](https://ubuntu.com) 发行版最大的特点就是具有优秀易用的桌面环境，基于 Debian Linux 发行版。

#### Linux 内核

Linux 内核主要包含 5 个子系统：进程调度、内存管理、虚拟文件系统、网路接口和进程间通信。

- 进程调度 SCHED 是操作系统对进程的多种状态之间的转换策略。

  - SCHED_OTHER: 分时调度策略（默认），用于针对普通进程的时间片轮转调度策略。

  - SCHED_FIFO: 实时调度策略，是针对运行的实时性要求比较高、运行时间短的进程调度策略。

  - SCHED_RR: 实时调度策略，是针对实时性要求比较高、运行时间比较长的进程调度策略。

- 内存管理 MMU
  
  - 内存管理是多个进程间的内存共享策略。指的是虚拟内存。

  - 虚拟内存可以让进程拥有比实际物理内存更大的内存。

  - 每个进程的虚拟内存存在不同的地址空间，多个进程的虚拟内存不会冲突。

- 虚拟文件系统 VFS

  - Linux 支持多种文件系统，目前最常用的文件系统为 ext2 和 ext3。

- 网路接口

  - 网络接口包括网络协议和驱动程序。

  - 网络协议是一种网络传输的通信标准。

  - 网络驱动程序是硬件设备的驱动程序。

- 进程间通信

  - 通信方式包括管道、信号、消息队列、共享内存和套接字。

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220524154719.png，"Linux 内核")

#### Linux 目录

### 结语

第十篇博文写完，开心！！！！

今天，也是充满希望的一天。