---
title: docker 学习笔记-ubuntu
tags:
  - docker
  - Linux
  - Ubuntu
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

4. [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

## Docker 入门

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

### 安装 docker

官方 `Ubuntu` 安装 `Docker Engine` 教程为：[Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)。

为了在 `Ubuntu` 安装 `Docker Engine`，确保你满足 `prerequisites`，然后安装 `Docker`。

#### Prerequisites

##### OS requirements

为了安装 `Docker Engine`，你需要这些 `Ubuntu` 版本之一的 `64` 位版本：

- Ubuntu Jammy 22.04 (LTS)

- Ubuntu Impish 21.10

- Ubuntu Focal 20.04 (LTS)

- Ubuntu Bionic 18.04 (LTS)

`Docker Engine` 支持 `x86_64` (or `amd64`)，`armhf`，`arm64`，和 `s390x` 体系结构。

通过下面命令获得本机体系结构：

```shell
$ hostnamectl
```

##### Uninstall old versions

旧版本的 `Docker` 被称为 `docker`，`docker.io` 或 `docker-engine`。如果安装了这些，请卸载它们：

```shell
$ sudo apt-get remove docker docker-engine docker.io containerd runc
```

>It’s OK if `apt-get` reports that none of these packages are installed.
>
>The contents of `/var/lib/docker/`, including `images`, `containers`, `volumes`, and `networks`, are preserved. If you do not need to save your existing data, and want to start with `a clean installation`, refer to the `uninstall Docker Engine` section.

#### Installation methods

You can install `Docker Engine` in different ways, depending on your needs:

- Most users `set up Docker’s repositories` and install from them, for ease of installation and upgrade tasks. This is the recommended approach.

- Some users download the DEB package and `install it manually` and manage upgrades completely manually. This is useful in situations such as installing Docker on air-gapped systems with no access to the internet.

- In testing and development environments, some users choose to use automated `convenience scripts` to install Docker.

##### Install using the repository

Before you install `Docker Engine` for the first time on `a new host machine`, you need to `set up the Docker repository`. Afterward, you can `install` and `update` Docker from the repository.

###### Set up the repository

1. Update the `apt` package index and `install packages` to allow `apt` to use a repository over HTTPS:

```shell
$ sudo apt-get update

$ sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```

2. Add Docker’s official GPG key:

```shell
$ sudo mkdir -p /etc/apt/keyrings
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

3. Use the following command to set up the repository:

```shell
$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

###### Install Docker Engine

1. Update the `apt` package index, and install the `latest version` of `Docker Engine`, `containerd`, and `Docker Compose`:

```shell
$ sudo apt-get update
# 下面的安装命令第一次可能出错，需要再次运行一次
$ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
$ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

2. Verify that Docker Engine is installed correctly by running the `hello-world` image.

```shell
(base) lyfubuntu@lyfubuntu:~$ sudo docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
2db29710123e: Pull complete 
Digest: sha256:7d246653d0511db2a6b2e0436cfd0e52ac8c066000264b3ce63331ac66dca625
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

(base) lyfubuntu@lyfubuntu:~$ sudo docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

(base) lyfubuntu@lyfubuntu:~$ 
```

This command `downloads` a test image and `runs` it in a container. When the container runs, it prints a message and exits.

>`Docker Engine` is installed and running. The `docker` group is created but no users are added to it. You need to use `sudo` to run Docker commands.

#### Uninstall Docker Engine

1. Uninstall the `Docker Engine`, `CLI`, `Containerd`, and `Docker Compose` packages:

```shell
$ sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

2. `Images`, `containers`, `volumes`, or `customized configuration files` on your host are not automatically removed. To delete all `images`, `containers`, and `volumes`:

```shell
$ sudo rm -rf /var/lib/docker
$ sudo rm -rf /var/lib/containerd
```

`You must delete any edited configuration files manually`.

### 底层原理

**`hello-world` image**

```shell
$ sudo docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
2db29710123e: Pull complete 
Digest: sha256:7d246653d0511db2a6b2e0436cfd0e52ac8c066000264b3ce63331ac66dca625
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

输出上面这段提示以后，`hello-world` 就会停止运行，容器自动终止。

---

```shell
# 由于本地没有 hello-world 镜像，因此需要下载 hello-world 镜像。通过镜像创建一个容器，并运行。
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
```

---

**`run` 命令背后的机制**

```
start;
if (Docker 在本地寻找镜像, true)
{
   以该镜像为模板创建容器, 并运行;
} else if (在 Docker Hub 中查找该镜像, true) {
   下载该镜像到本地;
   以该镜像为模板创建容器, 并运行;
} else {
   返回错误信息, 显示找不到该镜像;
}
```

---

{% label 底层原理 green %}

`Docker Engine` 是一个`客户端-服务器`应用程序，具有以下主要组件：

- 一个`服务器`，是一个长期运行的程序，被称为`守护进程`。

- 一个 `REST API`，该 `API` 可以指定某些程序（如 `bash` ）与守护进程交互，进而向守护进程发出指令。

`Docker` 是一个 `Client Server` 结构的系统。`Docker` 守护进程运行在宿主机上，客户端可以通过 `Socket` 访问`守护进程`，进而管理运行在宿主机上的容器（一个运行时环境）。

---

**为什么 `Docker` 比 `VMware` 快**

- `docker` 有着比`虚拟机`更少的抽象层，`docker` 不需要 `Hypervisor` 实现`硬件虚拟化`，`docker` 容器上的程序直接使用宿主机上的硬件资源。因此，`docker` 更能充分利用宿主机上的 `CPU`、内存等资源。

- `docker` 利用的是宿主机的内核，不需要 `Guest OS`。因此，当新建一个容器时，`docker` 不需要和`虚拟机`一样重新加载一个操作系统内核，因而只需几秒钟；`虚拟机`需要加载 `Guest OS`，需要几分钟。

![](https://cos.luyf-lemon-love.space/images/20200411132454634.png)

## Docker 基本命令

### Docker 的常用命令

![](https://cos.luyf-lemon-love.space/images/20200812093539341.png)

官方的命令帮助文档为：https://docs.docker.com/engine/reference/commandline/docker/ 。

1. {% label 帮助命令 pink %}

```shell
$ docker version          # docker 版本信息
$ docker info             # 系统级别的信息，包括镜像和容器的数量
$ docker 命令 --help
```

```shell
(base) lyfubuntu@lyfubuntu:~$ docker version
Client: Docker Engine - Community
 Version:           20.10.17
 API version:       1.41
 Go version:        go1.17.11
 Git commit:        100c701
 Built:             Mon Jun  6 23:02:57 2022
 OS/Arch:           linux/amd64
 Context:           default
 Experimental:      true

Server: Docker Engine - Community
 Engine:
  Version:          20.10.17
  API version:      1.41 (minimum version 1.12)
  Go version:       go1.17.11
  Git commit:       a89b842
  Built:            Mon Jun  6 23:01:03 2022
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.6.8
  GitCommit:        9cd3357b7fd7218e4aec3eae239db1f68a5a6ec6
 runc:
  Version:          1.1.4
  GitCommit:        v1.1.4-0-g5fd4c4d
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
(base) lyfubuntu@lyfubuntu:~$ docker info
Client:
 Context:    default
 Debug Mode: false
 Plugins:
  app: Docker App (Docker Inc., v0.9.1-beta3)
  buildx: Docker Buildx (Docker Inc., v0.8.2-docker)
  compose: Docker Compose (Docker Inc., v2.6.0)
  scan: Docker Scan (Docker Inc., v0.17.0)

Server:
 Containers: 2
  Running: 0
  Paused: 0
  Stopped: 2
 Images: 1
 Server Version: 20.10.17
 Storage Driver: overlay2
  Backing Filesystem: extfs
  Supports d_type: true
  Native Overlay Diff: true
  userxattr: false
 Logging Driver: json-file
 Cgroup Driver: cgroupfs
 Cgroup Version: 1
 Plugins:
  Volume: local
  Network: bridge host ipvlan macvlan null overlay
  Log: awslogs fluentd gcplogs gelf journald json-file local logentries splunk syslog
 Swarm: inactive
 Runtimes: io.containerd.runc.v2 io.containerd.runtime.v1.linux runc
 Default Runtime: runc
 Init Binary: docker-init
 containerd version: 9cd3357b7fd7218e4aec3eae239db1f68a5a6ec6
 runc version: v1.1.4-0-g5fd4c4d
 init version: de40ad0
 Security Options:
  apparmor
  seccomp
   Profile: default
 Kernel Version: 5.15.0-46-generic
 Operating System: Ubuntu 20.04.5 LTS
 OSType: linux
 Architecture: x86_64
 CPUs: 4
 Total Memory: 7.659GiB
 Name: lyfubuntu
 ID: GSQI:CV5Z:MC5N:ODM5:XBVG:ZOJI:IQTJ:KJRY:7FC5:MFXA:GC6L:VNFQ
 Docker Root Dir: /var/lib/docker
 Debug Mode: false
 Registry: https://index.docker.io/v1/
 Labels:
 Experimental: false
 Insecure Registries:
  127.0.0.0/8
 Live Restore Enabled: false

(base) lyfubuntu@lyfubuntu:~$ docker images --help

Usage:  docker images [OPTIONS] [REPOSITORY[:TAG]]

List images

Options:
  -a, --all             Show all images (default hides
                        intermediate images)
      --digests         Show digests
  -f, --filter filter   Filter output based on conditions provided
      --format string   Pretty-print images using a Go template
      --no-trunc        Don't truncate output
  -q, --quiet           Only show image IDs
(base) lyfubuntu@lyfubuntu:~$
```

2. {% label 镜像命令 green %}

`docker images`：查看所有本地主机上的镜像。

```shell
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY    TAG       IMAGE ID       CREATED         SIZE
hello-world   latest    feb5d9fea6a5   11 months ago   13.3kB
(base) lyfubuntu@lyfubuntu:~$ docker images --help

Usage:  docker images [OPTIONS] [REPOSITORY[:TAG]]

List images

Options:
  -a, --all             Show all images (default hides
                        intermediate images)
      --digests         Show digests
  -f, --filter filter   Filter output based on conditions provided
      --format string   Pretty-print images using a Go template
      --no-trunc        Don't truncate output
  -q, --quiet           Only show image IDs
(base) lyfubuntu@lyfubuntu:~$
```

```
REPOSITORY                # 镜像的仓库
TAG                       # 镜像的标签
IMAGE ID                  # 镜像的 ID
CREATED                   # 镜像的创建时间
SIZE                      # 镜像的大小

# docker images

Usage:  docker images [OPTIONS] [REPOSITORY[:TAG]]

Options:
  -a, --all             Show all images (default hides
                        intermediate images)
      --digests         Show digests
  -f, --filter filter   Filter output based on conditions provided
      --format string   Pretty-print images using a Go template
      --no-trunc        Don't truncate output
  -q, --quiet           Only show image IDs
```

`docker search`：查找镜像。

## 结语

第二十七篇博文写完，开心！！！！

今天，也是充满希望的一天。