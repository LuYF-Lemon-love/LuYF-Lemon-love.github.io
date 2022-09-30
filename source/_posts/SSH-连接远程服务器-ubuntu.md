---
title: SSH 连接远程服务器-ubuntu
tags:
  - VSCode
  - Linux
  - Ubuntu
  - SSH
categories: 配置环境
description: 通过 Visual Studio Code Remote - SSH 插件连接 Ubuntu 18.04.6 LTS 服务器。
cover: 'https://cos.luyf-lemon-love.space/images/demacia_silvermere_01.jpg'
abbrlink: 1233311406
date: 2022-09-30 19:53:40
---

## 前言

本教程介绍通过 `Visual Studio Code` `Remote - SSH 插件`连接 `Ubuntu 18.04.6 LTS` 服务器的方法。你将创建一个 `Node.js Express web app` 来展示如何用 `VSCode` 在远程服务器编辑代码，就像源代码在本地一样。

官方教程：[Remote development over SSH](https://code.visualstudio.com/docs/remote/ssh-tutorial)

操作系统：Ubuntu 20.04.4 LTS

## 参考文档

1. [Remote development over SSH](https://code.visualstudio.com/docs/remote/ssh-tutorial)

2. [Local Linux prerequisites](https://code.visualstudio.com/docs/remote/linux#_local-linux-prerequisites)

3. [Installing a supported SSH client](https://code.visualstudio.com/docs/remote/troubleshooting#_installing-a-supported-ssh-client)

## 先决条件

1. 安装一个 `OpenSSH compatible SSH client`。安装完成后，`VSCode` 将要在 `Path` 中寻找 `ssh` 命令。

```bash
# Ubuntu
sudo apt-get install openssh-client
```

2. 安装 [Visual Studio Code](https://code.visualstudio.com/)。

3. 安装 `Remote - SSH` 插件。

>The Remote - SSH extension is used to connect to SSH hosts.

![](https://cos.luyf-lemon-love.space/images/20220930203756.png)

## Remote - SSH

`Remote - SSH` 插件一旦被安装，你将在`左下角`看到一个新的状态栏。

![](https://cos.luyf-lemon-love.space/images/20220930204218.png)

该 `Remote - SSH` 状态栏能快速显示 `VSCode` 正在运行在哪个上下文 (本地或远程)，单击该项目将显示 `Remote - SSH` 命令。

![](https://cos.luyf-lemon-love.space/images/20220930204726.png)

## 使用 SSH 连接服务器

单击 `Remote - SSH` 状态栏显示 `Remote - SSH` 命令。

![](https://cos.luyf-lemon-love.space/images/20220930205708.png)

在通过 `Remote - SSH` 连接服务器前，你能通过 `ssh user@hostname` 命令验证是否能够连接到服务器。其中 `user` 是用户名，`hostname` 是服务器的 `IP` 地址。

选择 `Remote-SSH: Connect to Host` 命令，输入 `user@hostname` 连接服务器。

![](https://cos.luyf-lemon-love.space/images/20220930210826.png)

`VSCode` 将要打开一个新窗口，你将要看到一个 `VS Code Server` 正在 `SSH` 主机上初始化的通知，然后你需要输入`服务器密码`，在远程主机上安装 `VS Code Server` 后，它可以运行插件并与本地的 `VS Code` 通信。

![](https://cos.luyf-lemon-love.space/images/20220930211900.png)

你能通过左下角的状态栏看到你是否连接到服务器，它显示了服务器的 `IP` 地址。

![](https://cos.luyf-lemon-love.space/images/20220930212214.png)

`Remote - SSH` 插件还为你的左侧活动栏添加了一个新的图标，点击它将展示 `Remote explorer`。你能保存经常连接的主机，这样就不需要收入 `user` 和 `hostname` 连接服务器了。

![](https://cos.luyf-lemon-love.space/images/20220930212915.png)

连接到 `SSH` 主机后，即可与`远程计算机上的文件和文件夹进行交互`。你将打开集成的终端 (Ctrl+`)，它将显示远程服务器的 **bash shell**。

![](https://cos.luyf-lemon-love.space/images/20220930214150.png)

你能使用 `bash shell` 浏览远程主机上的文件系统。你也能通过 `File > Open Folder` 浏览远程主机上的文件系统。

![](https://cos.luyf-lemon-love.space/images/20220930214510.png)

## 创建 Node.js 应用

你将创建一个简单的 `Node.js` 应用。您将使用`应用程序生成器`从`终端`快速`构建应用程序`。

### 安装 Node.js and npm

从集成终端 (Ctrl+`)，更新 Linux 的包，然后安装 Node.js 和 Node.js 的包管理器 npm。

```bash
sudo apt-get update
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install npm
```

{% label 验证安装 pink %}

```bash
node --version
npm --version
```

### 安装 the Express generator

>[Express](https://www.expressjs.com/) is a popular framework for building and running Node.js applications. You can scaffold (create) a new Express application using the [Express Generator](https://expressjs.com/en/starter/generator.html) tool. The Express Generator is shipped as an npm module and installed by using the npm command-line tool `npm`.

```bash
sudo npm install -g express-generator
```

>The `-g` switch installs the Express Generator globally on your machine so that you can run it from anywhere.

### 创建一个新的应用程序

你能运行下面的命令创建一个新的名为 `myExpressApp` 的 `Express application`:

```bash
express myExpressApp --view pug
```

>The `--view pug` parameters tell the `generator` to use the `pug` template engine.

为了安装应用程序全部依赖，进入新的目录和运行 `npm install`。

```bash
cd myExpressApp
npm install
```

### 运行应用程序

让我们确保应用程序能否运行。使用 `npm start` 命令`启动应用程序`以`启动服务器`。

```bash
npm start
```

>The Express app by default runs on `http://localhost:3000`.

你也能使用服务器的 `IP` 地址访问应用程序，如 `http://10.4.6.15:3000/`

![](https://cos.luyf-lemon-love.space/images/20220930223058.png)

### 端口转发

为了能够在本地浏览这个 `Web app`，你能利用`端口转发`这个特性。

>To be able to access a port on the remote machine that may not be publicly exposed, you need to establish a connection or a tunnel between a port on your local machine and the server. With the app still running, open the `SSH` Explorer and find the `Forwarded Ports` view. Click on the `Forward a port` link and indicate that you want to forward port `3000`:

![](https://cos.luyf-lemon-love.space/images/20220930224454.png)

![](https://cos.luyf-lemon-love.space/images/20220930224532.png)

Name the connection "browser":

![](https://cos.luyf-lemon-love.space/images/20220930224633.png)

The `server` will now forward traffic on `port 3000` to your `local machine`. When you browse to `http://localhost:3000`, you see the running web app.

![](https://cos.luyf-lemon-love.space/images/20220930224859.png)

## 结束 SSH 连接

你能通过 `File > Close Remote Connection` 关闭 `SSH` 连接，回到本地 `VSCode`。

## 结语

第三十一篇博文写完，开心！！！！

今天，也是充满希望的一天。