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

---

`docker search`：查找镜像。

```shell
(base) lyfubuntu@lyfubuntu:~$ docker search --help

Usage:  docker search [OPTIONS] TERM

Search the Docker Hub for images

Options:
  -f, --filter filter   Filter output based on conditions provided
      --format string   Pretty-print search using a Go template
      --limit int       Max number of search results (default 25)
      --no-trunc        Don't truncate output
(base) lyfubuntu@lyfubuntu:~$ docker search mysql
NAME                            DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
mysql                           MySQL is a widely used, open-source relation…   13110     [OK]       
mariadb                         MariaDB Server is a high performing open sou…   5011      [OK]       
phpmyadmin                      phpMyAdmin - A web interface for MySQL and M…   617       [OK]       
percona                         Percona Server is a fork of the MySQL relati…   584       [OK]       
bitnami/mysql                   Bitnami MySQL Docker Image                      76                   [OK]
databack/mysql-backup           Back up mysql databases to... anywhere!         65                   
linuxserver/mysql-workbench                                                     42                   
linuxserver/mysql               A Mysql container, brought to you by LinuxSe…   37                   
ubuntu/mysql                    MySQL open source fast, stable, multi-thread…   36                   
circleci/mysql                  MySQL is a widely used, open-source relation…   27                   
google/mysql                    MySQL server for Google Compute Engine          21                   [OK]
rapidfort/mysql                 RapidFort optimized, hardened image for MySQL   13                   
bitnami/mysqld-exporter                                                         3                    
ibmcom/mysql-s390x              Docker image for mysql-s390x                    2                    
newrelic/mysql-plugin           New Relic Plugin for monitoring MySQL databa…   1                    [OK]
vitess/mysqlctld                vitess/mysqlctld                                1                    [OK]
hashicorp/mysql-portworx-demo                                                   0                    
docksal/mysql                   MySQL service images for Docksal - https://d…   0                    
mirantis/mysql                                                                  0                    
cimg/mysql                                                                      0                    
drud/mysql                                                                      0                    
silintl/mysql-backup-restore    Simple docker image to perform mysql backups…   0                    [OK]
corpusops/mysql                 https://github.com/corpusops/docker-images/     0                    
drud/mysql-local-57             ddev mysql local container                      0                    
drud/mysql-docker-local-57      This repo has been deprecated, new tags are …   0                    
(base) lyfubuntu@lyfubuntu:~$ docker search mysql --filter=STARS=3000
NAME      DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
mysql     MySQL is a widely used, open-source relation…   13110     [OK]       
mariadb   MariaDB Server is a high performing open sou…   5011      [OK]       
(base) lyfubuntu@lyfubuntu:~$
```

```
--filter=STARS=3000     # 搜素出来的镜像是 STARS 大于 3000 的
```

---

`docker pull`：下拉镜像。

```shell
(base) lyfubuntu@lyfubuntu:~$ docker pull --help

Usage:  docker pull [OPTIONS] NAME[:TAG|@DIGEST]

Pull an image or a repository from a registry

Options:
  -a, --all-tags                Download all tagged images in the repository
      --disable-content-trust   Skip image verification (default true)
      --platform string         Set platform if server is multi-platform
                                capable
  -q, --quiet                   Suppress verbose output
(base) lyfubuntu@lyfubuntu:~$ docker pull mysql
Using default tag: latest
latest: Pulling from library/mysql
492d84e496ea: Pull complete 
bbe20050901c: Pull complete 
e3a5e171c2f8: Pull complete 
c2cedd8aa061: Pull complete 
d6a485af4cc9: Pull complete 
ee16a57baf60: Pull complete 
64bab9180d2a: Pull complete 
c3aceb7e4f48: Pull complete 
269002e5cf58: Pull complete 
d5abeb1bd18e: Pull complete 
cbd79da5fab6: Pull complete 
Digest: sha256:cdf3b62d78d1bbb1d2bd6716895a84014e00716177cbb7e90f6c6a37a21dc796
Status: Downloaded newer image for mysql:latest
docker.io/library/mysql:latest
(base) lyfubuntu@lyfubuntu:~$ docker pull docker.io/library/mysql:latest
latest: Pulling from library/mysql
Digest: sha256:cdf3b62d78d1bbb1d2bd6716895a84014e00716177cbb7e90f6c6a37a21dc796
Status: Image is up to date for mysql:latest
docker.io/library/mysql:latest
(base) lyfubuntu@lyfubuntu:~$ docker pull mysql:latest
latest: Pulling from library/mysql
Digest: sha256:cdf3b62d78d1bbb1d2bd6716895a84014e00716177cbb7e90f6c6a37a21dc796
Status: Image is up to date for mysql:latest
docker.io/library/mysql:latest
(base) lyfubuntu@lyfubuntu:~$ docker pull mysql:5.7
5.7: Pulling from library/mysql
9815334b7810: Pull complete 
f85cb6fccbfd: Pull complete 
b63612353671: Pull complete 
447901201612: Pull complete 
9b6bc806cc29: Pull complete 
24ec1f4b3b0d: Pull complete 
207ed1eb2fd4: Pull complete 
27cbde3edd97: Pull complete 
0a5aa35cc154: Pull complete 
e6c92bf6471b: Pull complete 
07b80de0d1af: Pull complete 
Digest: sha256:c1bda6ecdbc63d3b0d3a3a3ce195de3dd755c4a0658ed782a16a0682216b9a48
Status: Downloaded newer image for mysql:5.7
docker.io/library/mysql:5.7
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY    TAG       IMAGE ID       CREATED         SIZE
mysql         latest    ff3b5098b416   2 days ago      447MB
mysql         5.7       daff57b7d2d1   8 days ago      430MB
hello-world   latest    feb5d9fea6a5   11 months ago   13.3kB
(base) lyfubuntu@lyfubuntu:~$ 
```

```shell
# 下载镜像，docker pull 镜像名[:tag]
$ docker pull --help

Usage:  docker pull [OPTIONS] NAME[:TAG|@DIGEST]

Pull an image or a repository from a registry

Options:
  -a, --all-tags                Download all tagged images in the repository
      --disable-content-trust   Skip image verification (default true)
      --platform string         Set platform if server is multi-platform
                                capable
  -q, --quiet                   Suppress verbose output

# 如果不写 tag，默认是 latest
$ docker pull mysql
Using default tag: latest
latest: Pulling from library/mysql
492d84e496ea: Pull complete   # 分层下载，docker images 的核心，联合文件系统 
bbe20050901c: Pull complete 
e3a5e171c2f8: Pull complete 
c2cedd8aa061: Pull complete 
d6a485af4cc9: Pull complete 
ee16a57baf60: Pull complete 
64bab9180d2a: Pull complete 
c3aceb7e4f48: Pull complete 
269002e5cf58: Pull complete 
d5abeb1bd18e: Pull complete 
cbd79da5fab6: Pull complete 
Digest: sha256:cdf3b62d78d1bbb1d2bd6716895a84014e00716177cbb7e90f6c6a37a21dc796  # 签名
Status: Downloaded newer image for mysql:latest
docker.io/library/mysql:latest  # 镜像的真实地址

# 下面两个命令都等价于 docker pull mysql
$ docker pull docker.io/library/mysql:latest
$ docker pull mysql:latest

# 指定版本下载
$ docker pull mysql:5.7
```

可以在 [Docker Hub](https://hub.docker.com/) 中搜索 `mysql` 查看支持的版本：https://hub.docker.com/_/mysql 。

![](https://cos.luyf-lemon-love.space/images/20220902131341.png)

---

`docker rmi`：删除镜像。

```shell
(base) lyfubuntu@lyfubuntu:~$ docker rmi --help

Usage:  docker rmi [OPTIONS] IMAGE [IMAGE...]

Remove one or more images

Options:
  -f, --force      Force removal of the image
      --no-prune   Do not delete untagged parents
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY    TAG       IMAGE ID       CREATED         SIZE
mysql         latest    ff3b5098b416   2 days ago      447MB
mysql         5.7       daff57b7d2d1   8 days ago      430MB
hello-world   latest    feb5d9fea6a5   11 months ago   13.3kB
(base) lyfubuntu@lyfubuntu:~$ docker rmi -f daff57b7d2d1
Untagged: mysql:5.7
Untagged: mysql@sha256:c1bda6ecdbc63d3b0d3a3a3ce195de3dd755c4a0658ed782a16a0682216b9a48
Deleted: sha256:daff57b7d2d1e009d0b271972f62dbf4de64b8cdb9cd646442aeda961e615f44
Deleted: sha256:a2b6de0d8fad38b5d19b0207decce5994598e15ae6aaf974733924dcbd8f04de
Deleted: sha256:f3bd23ad30ca816481c810885546988744e444e8b4f52c196c29d5e3f667157f
Deleted: sha256:7789a0eac346070602d9fae747fb5d81952454c6e11d5381cbc12a4825198d6e
Deleted: sha256:2cdfa876efe3302b715dad6bfd13cee0c512c58843200920953efe3355f5931c
Deleted: sha256:8d4cf9ffb69b960e2a2ebb157660b37a15ea645a71791aefc2b1600f1f603ebb
Deleted: sha256:d98069632a6bb3b2ba690a11cff2481a9b954aba58a7c3388484dd65ef8e1580
Deleted: sha256:0295feed0657a087e23700dcf0e41069bf8c565a092eea9426be99d8de5a45dc
Deleted: sha256:c9a9086bbafa8383c2002a50cce49e22bd060897dc121c18b41a9893b83816f5
Deleted: sha256:ed4bd9721438e36a8667ddcb461b958473d7b5f155df32155e08764648486087
Deleted: sha256:018f336482437233f5c9e135a18f5ba391448340d3ef2ec99fd88ab599906463
Deleted: sha256:bcf2a1ad6472a891de95b5132d013c064a07ec9995cb61b0cc0f8d4a4ea855fb
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY    TAG       IMAGE ID       CREATED         SIZE
mysql         latest    ff3b5098b416   2 days ago      447MB
hello-world   latest    feb5d9fea6a5   11 months ago   13.3kB
(base) lyfubuntu@lyfubuntu:~$ docker pull mysql:5.7
5.7: Pulling from library/mysql
9815334b7810: Pull complete 
f85cb6fccbfd: Pull complete 
b63612353671: Pull complete 
447901201612: Pull complete 
9b6bc806cc29: Pull complete 
24ec1f4b3b0d: Pull complete 
207ed1eb2fd4: Pull complete 
27cbde3edd97: Pull complete 
0a5aa35cc154: Pull complete 
e6c92bf6471b: Pull complete 
07b80de0d1af: Pull complete 
Digest: sha256:c1bda6ecdbc63d3b0d3a3a3ce195de3dd755c4a0658ed782a16a0682216b9a48
Status: Downloaded newer image for mysql:5.7
docker.io/library/mysql:5.7
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY    TAG       IMAGE ID       CREATED         SIZE
mysql         latest    ff3b5098b416   2 days ago      447MB
mysql         5.7       daff57b7d2d1   8 days ago      430MB
hello-world   latest    feb5d9fea6a5   11 months ago   13.3kB
(base) lyfubuntu@lyfubuntu:~$ docker rmi -f ff3b5098b416 daff57b7d2d1
Untagged: mysql:latest
Untagged: mysql@sha256:cdf3b62d78d1bbb1d2bd6716895a84014e00716177cbb7e90f6c6a37a21dc796
Deleted: sha256:ff3b5098b416cc4294d8d5c43c2f0f8251e91711347318e73cb290ffe2783bcb
Deleted: sha256:905d309cb1263e8e4d25e6da210fb74fe83499efc9add5e6609126e7491fa678
Deleted: sha256:e1b431304265185fa56b11948a66872cc51dca13c846103826a87bb388db697f
Deleted: sha256:dac88f2d7418cdb9c78d704645fe67ec26aedf21663143a9fc61c5baa486190d
Deleted: sha256:ed4a5f5c6fac6754cf2f2bde87c96b0021f6ce60b4b9e6fb3e564a420a2a9ae6
Deleted: sha256:9a472987e016836271a64c41167b05cff6172d26f7b271e065d5529f91594e98
Deleted: sha256:8b1abcaa1fee4c98f2524e103d606c9ace626ae1f12870b6d6192b03606d14bd
Deleted: sha256:daf68c705b7040c9eb041965addd8c4c40c50e5117d7c57a574a0256d6ee6d3f
Deleted: sha256:651b02e8a29597103968fdae60ae6edad338baeb73a70dc0365259573e3755ac
Deleted: sha256:0af81bdae1055d2733abf41bd1aa7c16aadf0972b3e1aef6cdbc2122ea5d88f9
Deleted: sha256:8975afc0aa296e98991c081554898a0e68f26f833b1f0ffb687a39225eb74f9b
Deleted: sha256:0e64bf1a6285d2fb8ad6e30f3695bccfb48c51c526374e00304b5128f2724d19
Untagged: mysql:5.7
Untagged: mysql@sha256:c1bda6ecdbc63d3b0d3a3a3ce195de3dd755c4a0658ed782a16a0682216b9a48
Deleted: sha256:daff57b7d2d1e009d0b271972f62dbf4de64b8cdb9cd646442aeda961e615f44
Deleted: sha256:a2b6de0d8fad38b5d19b0207decce5994598e15ae6aaf974733924dcbd8f04de
Deleted: sha256:f3bd23ad30ca816481c810885546988744e444e8b4f52c196c29d5e3f667157f
Deleted: sha256:7789a0eac346070602d9fae747fb5d81952454c6e11d5381cbc12a4825198d6e
Deleted: sha256:2cdfa876efe3302b715dad6bfd13cee0c512c58843200920953efe3355f5931c
Deleted: sha256:8d4cf9ffb69b960e2a2ebb157660b37a15ea645a71791aefc2b1600f1f603ebb
Deleted: sha256:d98069632a6bb3b2ba690a11cff2481a9b954aba58a7c3388484dd65ef8e1580
Deleted: sha256:0295feed0657a087e23700dcf0e41069bf8c565a092eea9426be99d8de5a45dc
Deleted: sha256:c9a9086bbafa8383c2002a50cce49e22bd060897dc121c18b41a9893b83816f5
Deleted: sha256:ed4bd9721438e36a8667ddcb461b958473d7b5f155df32155e08764648486087
Deleted: sha256:018f336482437233f5c9e135a18f5ba391448340d3ef2ec99fd88ab599906463
Deleted: sha256:bcf2a1ad6472a891de95b5132d013c064a07ec9995cb61b0cc0f8d4a4ea855fb
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY    TAG       IMAGE ID       CREATED         SIZE
hello-world   latest    feb5d9fea6a5   11 months ago   13.3kB
(base) lyfubuntu@lyfubuntu:~$ docker pull mysql
Using default tag: latest
latest: Pulling from library/mysql
492d84e496ea: Pull complete 
bbe20050901c: Pull complete 
e3a5e171c2f8: Pull complete 
c2cedd8aa061: Pull complete 
d6a485af4cc9: Pull complete 
ee16a57baf60: Pull complete 
64bab9180d2a: Pull complete 
c3aceb7e4f48: Pull complete 
269002e5cf58: Pull complete 
d5abeb1bd18e: Pull complete 
cbd79da5fab6: Pull complete 
Digest: sha256:cdf3b62d78d1bbb1d2bd6716895a84014e00716177cbb7e90f6c6a37a21dc796
Status: Downloaded newer image for mysql:latest
docker.io/library/mysql:latest
(base) lyfubuntu@lyfubuntu:~$ docker pull mysql:5.7
5.7: Pulling from library/mysql
9815334b7810: Pull complete 
f85cb6fccbfd: Pull complete 
b63612353671: Pull complete 
447901201612: Pull complete 
9b6bc806cc29: Pull complete 
24ec1f4b3b0d: Pull complete 
207ed1eb2fd4: Pull complete 
27cbde3edd97: Pull complete 
0a5aa35cc154: Pull complete 
e6c92bf6471b: Pull complete 
07b80de0d1af: Pull complete 
Digest: sha256:c1bda6ecdbc63d3b0d3a3a3ce195de3dd755c4a0658ed782a16a0682216b9a48
Status: Downloaded newer image for mysql:5.7
docker.io/library/mysql:5.7
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY    TAG       IMAGE ID       CREATED         SIZE
mysql         latest    ff3b5098b416   2 days ago      447MB
mysql         5.7       daff57b7d2d1   8 days ago      430MB
hello-world   latest    feb5d9fea6a5   11 months ago   13.3kB
(base) lyfubuntu@lyfubuntu:~$ docker rmi -f $(docker images -aq)
Untagged: mysql:latest
Untagged: mysql@sha256:cdf3b62d78d1bbb1d2bd6716895a84014e00716177cbb7e90f6c6a37a21dc796
Deleted: sha256:ff3b5098b416cc4294d8d5c43c2f0f8251e91711347318e73cb290ffe2783bcb
Deleted: sha256:905d309cb1263e8e4d25e6da210fb74fe83499efc9add5e6609126e7491fa678
Deleted: sha256:e1b431304265185fa56b11948a66872cc51dca13c846103826a87bb388db697f
Deleted: sha256:dac88f2d7418cdb9c78d704645fe67ec26aedf21663143a9fc61c5baa486190d
Deleted: sha256:ed4a5f5c6fac6754cf2f2bde87c96b0021f6ce60b4b9e6fb3e564a420a2a9ae6
Deleted: sha256:9a472987e016836271a64c41167b05cff6172d26f7b271e065d5529f91594e98
Deleted: sha256:8b1abcaa1fee4c98f2524e103d606c9ace626ae1f12870b6d6192b03606d14bd
Deleted: sha256:daf68c705b7040c9eb041965addd8c4c40c50e5117d7c57a574a0256d6ee6d3f
Deleted: sha256:651b02e8a29597103968fdae60ae6edad338baeb73a70dc0365259573e3755ac
Deleted: sha256:0af81bdae1055d2733abf41bd1aa7c16aadf0972b3e1aef6cdbc2122ea5d88f9
Deleted: sha256:8975afc0aa296e98991c081554898a0e68f26f833b1f0ffb687a39225eb74f9b
Deleted: sha256:0e64bf1a6285d2fb8ad6e30f3695bccfb48c51c526374e00304b5128f2724d19
Untagged: mysql:5.7
Untagged: mysql@sha256:c1bda6ecdbc63d3b0d3a3a3ce195de3dd755c4a0658ed782a16a0682216b9a48
Deleted: sha256:daff57b7d2d1e009d0b271972f62dbf4de64b8cdb9cd646442aeda961e615f44
Deleted: sha256:a2b6de0d8fad38b5d19b0207decce5994598e15ae6aaf974733924dcbd8f04de
Deleted: sha256:f3bd23ad30ca816481c810885546988744e444e8b4f52c196c29d5e3f667157f
Deleted: sha256:7789a0eac346070602d9fae747fb5d81952454c6e11d5381cbc12a4825198d6e
Deleted: sha256:2cdfa876efe3302b715dad6bfd13cee0c512c58843200920953efe3355f5931c
Deleted: sha256:8d4cf9ffb69b960e2a2ebb157660b37a15ea645a71791aefc2b1600f1f603ebb
Deleted: sha256:d98069632a6bb3b2ba690a11cff2481a9b954aba58a7c3388484dd65ef8e1580
Deleted: sha256:0295feed0657a087e23700dcf0e41069bf8c565a092eea9426be99d8de5a45dc
Deleted: sha256:c9a9086bbafa8383c2002a50cce49e22bd060897dc121c18b41a9893b83816f5
Deleted: sha256:ed4bd9721438e36a8667ddcb461b958473d7b5f155df32155e08764648486087
Deleted: sha256:018f336482437233f5c9e135a18f5ba391448340d3ef2ec99fd88ab599906463
Deleted: sha256:bcf2a1ad6472a891de95b5132d013c064a07ec9995cb61b0cc0f8d4a4ea855fb
Untagged: hello-world:latest
Untagged: hello-world@sha256:7d246653d0511db2a6b2e0436cfd0e52ac8c066000264b3ce63331ac66dca625
Deleted: sha256:feb5d9fea6a5e9606aa995e879d862b825965ba48de054caab5ef356dc6b3412
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
(base) lyfubuntu@lyfubuntu:~$
```

```shell
# 删除指定镜像：docker rmi -f IMAGE ID
$ docker rmi -f daff57b7d2d1

# 删除多个镜像：docker rmi -f IMAGE ID1 IMAGE ID2 IMAGE ID3
$ docker rmi -f ff3b5098b416 daff57b7d2d1

# 删除所有镜像：docker rmi -f $(docker images -aq)
$ docker rmi -f $(docker images -aq)
```

3. {% label 容器命令 orange %}

说明：需要`镜像`才可以创建`容器`，下载一个 `centos` 镜像来学习`容器命令`：

```shell
$ docker pull centos
```

---

`docker run`：新建容器并启动。

```shell
$ docker run [可选参数] image

# 可选参数说明
--name="Name" # 指定容器的名字来区分容器
-d     # 后台方式运行
-it    # 使用交互方式运行，进入容器查看内容

# 指定容器端口
-p ip:主机端口:容器端口
-p 主机端口:容器端口 # 常用
-p 容器端口
-p 8080:8080

# 随机指定端口
-P # 大写
```

```shell
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
(base) lyfubuntu@lyfubuntu:~$ docker pull centos
Using default tag: latest
latest: Pulling from library/centos
a1d0c7532777: Pull complete 
Digest: sha256:a27fd8080b517143cbbbab9dfb7c8571c40d67d534bbdee55bd6c473f432b177
Status: Downloaded newer image for centos:latest
docker.io/library/centos:latest
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
centos       latest    5d0da3dc9764   11 months ago   231MB
(base) lyfubuntu@lyfubuntu:~$ docker run --help

Usage:  docker run [OPTIONS] IMAGE [COMMAND] [ARG...]

Run a command in a new container

Options:
      --add-host list                  Add a custom host-to-IP mapping
                                       (host:ip)
  -a, --attach list                    Attach to STDIN, STDOUT or STDERR
      --blkio-weight uint16            Block IO (relative weight),
                                       between 10 and 1000, or 0 to
                                       disable (default 0)
      --blkio-weight-device list       Block IO weight (relative device
                                       weight) (default [])
      --cap-add list                   Add Linux capabilities
      --cap-drop list                  Drop Linux capabilities
      --cgroup-parent string           Optional parent cgroup for the
                                       container
      --cgroupns string                Cgroup namespace to use
                                       (host|private)
                                       'host':    Run the container in
                                       the Docker host's cgroup namespace
                                       'private': Run the container in
                                       its own private cgroup namespace
                                       '':        Use the cgroup
                                       namespace as configured by the
                                                  default-cgroupns-mode
                                       option on the daemon (default)
      --cidfile string                 Write the container ID to the file
      --cpu-period int                 Limit CPU CFS (Completely Fair
                                       Scheduler) period
      --cpu-quota int                  Limit CPU CFS (Completely Fair
                                       Scheduler) quota
      --cpu-rt-period int              Limit CPU real-time period in
                                       microseconds
      --cpu-rt-runtime int             Limit CPU real-time runtime in
                                       microseconds
  -c, --cpu-shares int                 CPU shares (relative weight)
      --cpus decimal                   Number of CPUs
      --cpuset-cpus string             CPUs in which to allow execution
                                       (0-3, 0,1)
      --cpuset-mems string             MEMs in which to allow execution
                                       (0-3, 0,1)
  -d, --detach                         Run container in background and
                                       print container ID
      --detach-keys string             Override the key sequence for
                                       detaching a container
      --device list                    Add a host device to the container
      --device-cgroup-rule list        Add a rule to the cgroup allowed
                                       devices list
      --device-read-bps list           Limit read rate (bytes per second)
                                       from a device (default [])
      --device-read-iops list          Limit read rate (IO per second)
                                       from a device (default [])
      --device-write-bps list          Limit write rate (bytes per
                                       second) to a device (default [])
      --device-write-iops list         Limit write rate (IO per second)
                                       to a device (default [])
      --disable-content-trust          Skip image verification (default true)
      --dns list                       Set custom DNS servers
      --dns-option list                Set DNS options
      --dns-search list                Set custom DNS search domains
      --domainname string              Container NIS domain name
      --entrypoint string              Overwrite the default ENTRYPOINT
                                       of the image
  -e, --env list                       Set environment variables
      --env-file list                  Read in a file of environment variables
      --expose list                    Expose a port or a range of ports
      --gpus gpu-request               GPU devices to add to the
                                       container ('all' to pass all GPUs)
      --group-add list                 Add additional groups to join
      --health-cmd string              Command to run to check health
      --health-interval duration       Time between running the check
                                       (ms|s|m|h) (default 0s)
      --health-retries int             Consecutive failures needed to
                                       report unhealthy
      --health-start-period duration   Start period for the container to
                                       initialize before starting
                                       health-retries countdown
                                       (ms|s|m|h) (default 0s)
      --health-timeout duration        Maximum time to allow one check to
                                       run (ms|s|m|h) (default 0s)
      --help                           Print usage
  -h, --hostname string                Container host name
      --init                           Run an init inside the container
                                       that forwards signals and reaps
                                       processes
  -i, --interactive                    Keep STDIN open even if not attached
      --ip string                      IPv4 address (e.g., 172.30.100.104)
      --ip6 string                     IPv6 address (e.g., 2001:db8::33)
      --ipc string                     IPC mode to use
      --isolation string               Container isolation technology
      --kernel-memory bytes            Kernel memory limit
  -l, --label list                     Set meta data on a container
      --label-file list                Read in a line delimited file of labels
      --link list                      Add link to another container
      --link-local-ip list             Container IPv4/IPv6 link-local
                                       addresses
      --log-driver string              Logging driver for the container
      --log-opt list                   Log driver options
      --mac-address string             Container MAC address (e.g.,
                                       92:d0:c6:0a:29:33)
  -m, --memory bytes                   Memory limit
      --memory-reservation bytes       Memory soft limit
      --memory-swap bytes              Swap limit equal to memory plus
                                       swap: '-1' to enable unlimited swap
      --memory-swappiness int          Tune container memory swappiness
                                       (0 to 100) (default -1)
      --mount mount                    Attach a filesystem mount to the
                                       container
      --name string                    Assign a name to the container
      --network network                Connect a container to a network
      --network-alias list             Add network-scoped alias for the
                                       container
      --no-healthcheck                 Disable any container-specified
                                       HEALTHCHECK
      --oom-kill-disable               Disable OOM Killer
      --oom-score-adj int              Tune host's OOM preferences (-1000
                                       to 1000)
      --pid string                     PID namespace to use
      --pids-limit int                 Tune container pids limit (set -1
                                       for unlimited)
      --platform string                Set platform if server is
                                       multi-platform capable
      --privileged                     Give extended privileges to this
                                       container
  -p, --publish list                   Publish a container's port(s) to
                                       the host
  -P, --publish-all                    Publish all exposed ports to
                                       random ports
      --pull string                    Pull image before running
                                       ("always"|"missing"|"never")
                                       (default "missing")
      --read-only                      Mount the container's root
                                       filesystem as read only
      --restart string                 Restart policy to apply when a
                                       container exits (default "no")
      --rm                             Automatically remove the container
                                       when it exits
      --runtime string                 Runtime to use for this container
      --security-opt list              Security Options
      --shm-size bytes                 Size of /dev/shm
      --sig-proxy                      Proxy received signals to the
                                       process (default true)
      --stop-signal string             Signal to stop a container
                                       (default "SIGTERM")
      --stop-timeout int               Timeout (in seconds) to stop a
                                       container
      --storage-opt list               Storage driver options for the
                                       container
      --sysctl map                     Sysctl options (default map[])
      --tmpfs list                     Mount a tmpfs directory
  -t, --tty                            Allocate a pseudo-TTY
      --ulimit ulimit                  Ulimit options (default [])
  -u, --user string                    Username or UID (format:
                                       <name|uid>[:<group|gid>])
      --userns string                  User namespace to use
      --uts string                     UTS namespace to use
  -v, --volume list                    Bind mount a volume
      --volume-driver string           Optional volume driver for the
                                       container
      --volumes-from list              Mount volumes from the specified
                                       container(s)
  -w, --workdir string                 Working directory inside the container
# 测试，启动并进入容器
(base) lyfubuntu@lyfubuntu:~$ docker run -it centos /bin/bash
# 查看容器内的 centos，该 centos 是基础版本，很多命令都不支持
[root@85f35274de29 /]# ls
bin  etc   lib	  lost+found  mnt  proc  run   srv  tmp  var
dev  home  lib64  media       opt  root  sbin  sys  usr
# 从容器中退出
[root@85f35274de29 /]# exit
exit
(base) lyfubuntu@lyfubuntu:~$
```

---

`docker ps`：列出所有运行的容器。

```shell
$ docker ps 命令

# 默认列出当前正在运行的容器
-a  # 列出所有容器：正在运行和历史执行过的容器
-n=n # n 为数字，Show n last created containers (includes all states) (default -1)
-q  # 只显示容器 ID 
```

```shell
(base) lyfubuntu@lyfubuntu:~$ docker ps --help

Usage:  docker ps [OPTIONS]

List containers

Options:
  -a, --all             Show all containers (default shows just running)
  -f, --filter filter   Filter output based on conditions provided
      --format string   Pretty-print containers using a Go template
  -n, --last int        Show n last created containers (includes all
                        states) (default -1)
  -l, --latest          Show the latest created container (includes all
                        states)
      --no-trunc        Don't truncate output
  -q, --quiet           Only display container IDs
  -s, --size            Display total file sizes
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
centos       latest    5d0da3dc9764   11 months ago   231MB
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~$ docker ps -a
CONTAINER ID   IMAGE          COMMAND       CREATED          STATUS                      PORTS     NAMES
85f35274de29   centos         "/bin/bash"   49 minutes ago   Exited (0) 48 minutes ago             charming_banach
0a4d040ef05b   feb5d9fea6a5   "/hello"      21 hours ago     Exited (0) 21 hours ago               xenodochial_pare
f3a477033d81   feb5d9fea6a5   "/hello"      21 hours ago     Exited (0) 21 hours ago               elastic_margulis
(base) lyfubuntu@lyfubuntu:~$ docker ps -n=-1
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~$ docker ps -n=1
CONTAINER ID   IMAGE     COMMAND       CREATED          STATUS                      PORTS     NAMES
85f35274de29   centos    "/bin/bash"   51 minutes ago   Exited (0) 50 minutes ago             charming_banach
(base) lyfubuntu@lyfubuntu:~$ docker ps -n=2
CONTAINER ID   IMAGE          COMMAND       CREATED          STATUS                      PORTS     NAMES
85f35274de29   centos         "/bin/bash"   51 minutes ago   Exited (0) 50 minutes ago             charming_banach
0a4d040ef05b   feb5d9fea6a5   "/hello"      21 hours ago     Exited (0) 21 hours ago               xenodochial_pare
(base) lyfubuntu@lyfubuntu:~$ docker ps -n=3
CONTAINER ID   IMAGE          COMMAND       CREATED          STATUS                      PORTS     NAMES
85f35274de29   centos         "/bin/bash"   51 minutes ago   Exited (0) 51 minutes ago             charming_banach
0a4d040ef05b   feb5d9fea6a5   "/hello"      21 hours ago     Exited (0) 21 hours ago               xenodochial_pare
f3a477033d81   feb5d9fea6a5   "/hello"      21 hours ago     Exited (0) 21 hours ago               elastic_margulis
(base) lyfubuntu@lyfubuntu:~$ docker ps -qa
85f35274de29
0a4d040ef05b
f3a477033d81
(base) lyfubuntu@lyfubuntu:~$
```

---

退出容器。

## 结语

第二十七篇博文写完，开心！！！！

今天，也是充满希望的一天。