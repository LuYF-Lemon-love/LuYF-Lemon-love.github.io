---
title: CF-812AC无线网卡驱动安装-ubuntu
tags:
  - CF-812AC
  - 无线网卡
  - RTL8812BU
  - 驱动
  - Ubuntu
categories: 硬件
description: Ubuntu 20.04.4 LTS 安装 CF-812AC 无线网卡
cover: >-
  https://cos.luyf-lemon-love.space/images/20220520214839.png
abbrlink: 1158755992
date: 2022-05-23 12:45:51
---

### 前言

由于学校的宽带最近一段时间不稳定，经常断网，严重影响学习和工作。因此打算买一个无线网卡让实验室的台式机能够连接 WIFI。

操作系统：Ubuntu 20.04.4 LTS

### 参考文档

1. [Ubuntu 20.04安装RTL8812BU网卡驱动教程](https://blog.csdn.net/xs_sd/article/details/121454892?spm=1001.2101.3001.6650.10&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EOPENSEARCH%7ERate-10-121454892-blog-108697108.pc_relevant_paycolumn_v3&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EOPENSEARCH%7ERate-10-121454892-blog-108697108.pc_relevant_paycolumn_v3&utm_relevant_index=12)

2. [Ubuntu-RTL8812BU无线网卡安装](https://blog.csdn.net/qyb19970829/article/details/108697108)

3. [[已解决]ubuntu下谷歌浏览器无法上网](https://blog.csdn.net/weixin_45617478/article/details/109251091)

### 安装网卡驱动

1. 购买的无线网卡（ CF-812AC ）。CF-812AC 是网卡型号（ 确定厂商），因此我们需要找到芯片型号。

![](https://cos.luyf-lemon-love.space/images/20220523130344.png)

2. 查看 USB 无线网卡 的芯片型号

```shell
sudo apt install usbutils
lsusb
```

![](https://cos.luyf-lemon-love.space/images/20220523130639.png)

Bus 001 Device 007: ID 0bda:b812 Realtek Semiconductor Corp. 802.11ac NIC

3. 登录 [The USB ID Repository](https://usb-ids.gowdy.us/)，如图

![](https://cos.luyf-lemon-love.space/images/20220523130920.png)

4. 点击 [USB devices](https://usb-ids.gowdy.us/read/UD/)，通过 0bda 找到无线网卡 Name。如图

![](https://cos.luyf-lemon-love.space/images/20220523131209.png)

5. 点击 [obda](https://usb-ids.gowdy.us/read/UD/0bda)，如图

![](https://cos.luyf-lemon-love.space/images/20220523131412.png)

6. 通过 b812 找到芯片型号，为 RTL88x2bu [AC1200 Techkey]

![](https://cos.luyf-lemon-love.space/images/20220523131842.png)

### 安装驱动

1. 由于驱动安装需要内核版本，因此我们查看我们的内核版本

```shell
cat /proc/version
```

```
# 输出
Linux version 5.13.0-41-generic (buildd@lcy02-amd64-017) (gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #46~20.04.1-Ubuntu SMP Wed Apr 20 13:16:21 UTC 2022
```

2. 内核版本为 Linux version 5.13.0-41-generic (buildd@lcy02-amd64-017)。

3. 驱动下载链接 https://github.com/fastoe/RTL8812BU

4. 我们根据内核选择 the v5.8.7 branch，安装命令如下

```shell
sudo apt update
sudo apt install -y dkms git bc
git clone -b v5.8.7 https://github.com/fastoe/RTL8812BU.git
cd RTL8812BU
make
sudo make install
sudo reboot
```

5. 重启电脑完成后，我们可以通过 Ubuntu 的右上角发现无线网络连接按钮，连上网络后，只有火狐浏览器可以上网，而谷歌浏览器和 Microsoft Edge 是无法上网的。点击 Ubuntu 的 Systemp Settings > Network > Network proxy，里面的 Method 需要设置为 None，即无代理模式。这样就可以上网了。

### 结语

第九篇博文写完，开心！！！！

今天，也是充满希望的一天。