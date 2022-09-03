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

5. [【已解决】Error: Failed to download metadata for repo ‘appstream‘: Cannot prepare internal mirrorlist](https://blog.csdn.net/weixin_43252521/article/details/124409151)

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

```shell
# 直接退出容器并关闭容器
$ exit

# 退出但不关闭容器
Ctrl + P + Q
```

```shell
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
centos       latest    5d0da3dc9764   11 months ago   231MB
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~$ docker run -it centos /bin/bash
[root@627bd6b5cd95 /]# exit
exit
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~$ docker ps -qa
627bd6b5cd95
91e1fd1452f2
80d3d24027f6
85f35274de29
0a4d040ef05b
f3a477033d81
(base) lyfubuntu@lyfubuntu:~$ docker run -it centos /bin/bash
[root@6e8be4eea04d /]# (base) lyfubuntu@lyfubuntu:~$ 
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED          STATUS          PORTS     NAMES
6e8be4eea04d   centos    "/bin/bash"   48 seconds ago   Up 46 seconds             romantic_jepsen
(base) lyfubuntu@lyfubuntu:~$ docker ps -qa
6e8be4eea04d
627bd6b5cd95
91e1fd1452f2
80d3d24027f6
85f35274de29
0a4d040ef05b
f3a477033d81
(base) lyfubuntu@lyfubuntu:~$
```

---

`docker rm`：删除容器。

```shell
# 删除指定容器
$ docker rm -f 容器id

# 删除所有容器
$ docker rm -f $(docker ps -aq)

# 删除所有容器
$ docker ps -a -q|xargs docker rm -f
```

```shell
(base) lyfubuntu@lyfubuntu:~$ docker rm --help

Usage:  docker rm [OPTIONS] CONTAINER [CONTAINER...]

Remove one or more containers

Options:
  -f, --force     Force the removal of a running container (uses SIGKILL)
  -l, --link      Remove the specified link
  -v, --volumes   Remove anonymous volumes associated with the container
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED          STATUS          PORTS     NAMES
6e8be4eea04d   centos    "/bin/bash"   21 minutes ago   Up 21 minutes             romantic_jepsen
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
6e8be4eea04d
627bd6b5cd95
91e1fd1452f2
80d3d24027f6
85f35274de29
0a4d040ef05b
f3a477033d81
(base) lyfubuntu@lyfubuntu:~$ docker rm -f 6e8be4eea04d
6e8be4eea04d
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
627bd6b5cd95
91e1fd1452f2
80d3d24027f6
85f35274de29
0a4d040ef05b
f3a477033d81
(base) lyfubuntu@lyfubuntu:~$ docker run -it centos /bin/bash
[root@f4c57c4ec509 /]# (base) lyfubuntu@lyfubuntu:~$ 
(base) lyfubuntu@lyfubuntu:~$ docker run -it centos /bin/bash
[root@20519a4f87bb /]# (base) lyfubuntu@lyfubuntu:~$ 
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED              STATUS              PORTS     NAMES
20519a4f87bb   centos    "/bin/bash"   13 seconds ago       Up 10 seconds                 focused_easley
f4c57c4ec509   centos    "/bin/bash"   About a minute ago   Up About a minute             zen_taussig
(base) lyfubuntu@lyfubuntu:~$ docker rm -f $(docker ps -aq)
20519a4f87bb
f4c57c4ec509
627bd6b5cd95
91e1fd1452f2
80d3d24027f6
85f35274de29
0a4d040ef05b
f3a477033d81
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
(base) lyfubuntu@lyfubuntu:~$ docker run -it centos /bin/bash
[root@11636531fe99 /]# (base) lyfubuntu@lyfubuntu:~$ 
(base) lyfubuntu@lyfubuntu:~$ docker run -it centos /bin/bash
[root@6698ed716b2e /]# (base) lyfubuntu@lyfubuntu:~$ 
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED          STATUS          PORTS     NAMES
6698ed716b2e   centos    "/bin/bash"   11 seconds ago   Up 9 seconds              unruffled_yonath
11636531fe99   centos    "/bin/bash"   27 seconds ago   Up 24 seconds             vibrant_visvesvaraya
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
6698ed716b2e
11636531fe99
(base) lyfubuntu@lyfubuntu:~$ docker ps -a -q|xargs docker rm -f
6698ed716b2e
11636531fe99
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
(base) lyfubuntu@lyfubuntu:~$
```

---

启动和停止容器。

```shell
$ docker start 容器id       # 启动容器
$ docker restart 容器id     # 重启容器
$ docker stop 容器id        # 停止当前正在运行的容器
$ docker kill 容器id        # 强制停止当前的容器
```

```shell
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
centos       latest    5d0da3dc9764   11 months ago   231MB
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
(base) lyfubuntu@lyfubuntu:~$ docker run -it centos /bin/bash
[root@bca1af92f836 /]# exit
exit
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
bca1af92f836
(base) lyfubuntu@lyfubuntu:~$ docker start bca1af92f836
bca1af92f836
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED          STATUS         PORTS     NAMES
bca1af92f836   centos    "/bin/bash"   42 seconds ago   Up 5 seconds             laughing_cohen
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
bca1af92f836
(base) lyfubuntu@lyfubuntu:~$ docker stop bca1af92f836
bca1af92f836
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
bca1af92f836
(base) lyfubuntu@lyfubuntu:~$ docker restart bca1af92f836
bca1af92f836
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS         PORTS     NAMES
bca1af92f836   centos    "/bin/bash"   2 minutes ago   Up 3 seconds             laughing_cohen
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
bca1af92f836
(base) lyfubuntu@lyfubuntu:~$ docker kill bca1af92f836
bca1af92f836
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
bca1af92f836
(base) lyfubuntu@lyfubuntu:~$ docker start bca1af92f836
bca1af92f836
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS         PORTS     NAMES
bca1af92f836   centos    "/bin/bash"   5 minutes ago   Up 8 seconds             laughing_cohen
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
bca1af92f836
(base) lyfubuntu@lyfubuntu:~$
```

4. {% label 常用的其他命令 purple %}

**后台启动容器**

```shell
# 后台启动容器
$ docker run -d 镜像名

# 虽然后台启动 centos，但 centos 会立即停止
# docker 容器后台运行，必须要有一个前台进程
# 如果 docker 容器没有发现前台进程，会自动停止
# eg: nginx 容器启动后，发现自己没有提供服务，就会立即停止
$ docker run -d centos
```

```shell
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
centos       latest    5d0da3dc9764   11 months ago   231MB
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
(base) lyfubuntu@lyfubuntu:~$ docker run -d centos
309739215d97f874bde9247147dee7c3c175b9debbf18b516d1c81bbfe7a3079
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
309739215d97
(base) lyfubuntu@lyfubuntu:~$
```

---

**查看日志**

```shell
# 产看日志
$ docker logs -tf --tail number 容器id
```

```shell
(base) lyfubuntu@lyfubuntu:~$ docker logs --help

Usage:  docker logs [OPTIONS] CONTAINER

Fetch the logs of a container

Options:
      --details        Show extra details provided to logs
  -f, --follow         Follow log output
      --since string   Show logs since timestamp (e.g.
                       2013-01-02T13:23:37Z) or relative (e.g. 42m for 42
                       minutes)
  -n, --tail string    Number of lines to show from the end of the logs
                       (default "all")
  -t, --timestamps     Show timestamps
      --until string   Show logs before a timestamp (e.g.
                       2013-01-02T13:23:37Z) or relative (e.g. 42m for 42
                       minutes)
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
centos       latest    5d0da3dc9764   11 months ago   231MB
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
# 自己编写一段 shell 脚本
(base) lyfubuntu@lyfubuntu:~$ docker run -d centos /bin/sh -c "while true;do echo lyf;sleep 1;done"
c932288629d9005c4b437ca7a361fab76b734d9451fe5395de1bb2d60606b8dc
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS     NAMES
c932288629d9   centos    "/bin/sh -c 'while t…"   8 seconds ago   Up 6 seconds             magical_vaughan
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
c932288629d9
(base) lyfubuntu@lyfubuntu:~$ docker logs -tf --tail 10 c932288629d9
2022-09-02T10:36:31.262678127Z lyf
2022-09-02T10:36:32.264323517Z lyf
2022-09-02T10:36:33.267344527Z lyf
2022-09-02T10:36:34.271134363Z lyf
2022-09-02T10:36:35.275115881Z lyf
2022-09-02T10:36:36.279852540Z lyf
2022-09-02T10:36:37.280406750Z lyf
2022-09-02T10:36:38.282420358Z lyf
2022-09-02T10:36:39.284665474Z lyf
2022-09-02T10:36:40.286341674Z lyf
2022-09-02T10:36:41.289391202Z lyf
2022-09-02T10:36:42.292997214Z lyf
2022-09-02T10:36:43.294832286Z lyf
2022-09-02T10:36:44.296896067Z lyf
2022-09-02T10:36:45.299721966Z lyf
2022-09-02T10:36:46.303165736Z lyf
2022-09-02T10:36:47.305254231Z lyf
2022-09-02T10:36:48.307091027Z lyf
2022-09-02T10:36:49.308867983Z lyf
^C
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED              STATUS              PORTS     NAMES
c932288629d9   centos    "/bin/sh -c 'while t…"   About a minute ago   Up About a minute             magical_vaughan
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
c932288629d9
(base) lyfubuntu@lyfubuntu:~$ docker kill c932288629d9
c932288629d9
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~$
```

---

**查看容器中进程信息**

```shell
# 查看容器中的进程信息
$ docker top 容器id
```

```shell
(base) lyfubuntu@lyfubuntu:~$ docker top --help

Usage:  docker top CONTAINER [ps OPTIONS]

Display the running processes of a container
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
centos       latest    5d0da3dc9764   11 months ago   231MB
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
(base) lyfubuntu@lyfubuntu:~$ docker run -it centos /bin/bash
[root@74050c27a32c /]# (base) lyfubuntu@lyfubuntu:~$ 
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED          STATUS          PORTS     NAMES
74050c27a32c   centos    "/bin/bash"   30 seconds ago   Up 28 seconds             silly_feynman
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
74050c27a32c
(base) lyfubuntu@lyfubuntu:~$ docker top 74050c27a32c
UID                 PID                 PPID                C                   STIME               TTY                 TIME                CMD
root                33557               33536               0                   21:29               pts/0               00:00:00            /bin/bash
(base) lyfubuntu@lyfubuntu:~$ docker stop 74050c27a32c
74050c27a32c
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
74050c27a32c
(base) lyfubuntu@lyfubuntu:~$ docker top 74050c27a32c
Error response from daemon: Container 74050c27a32ca42179063a7bc9cb44cc670282beed427455b3fb120bb917b07e is not running
(base) lyfubuntu@lyfubuntu:~$
```

---

**查看 `Docker objects` 的元数据**

```shell
(base) lyfubuntu@lyfubuntu:~$ docker inspect --help

Usage:  docker inspect [OPTIONS] NAME|ID [NAME|ID...]

Return low-level information on Docker objects

Options:
  -f, --format string   Format the output using the given Go template
  -s, --size            Display total file sizes if the type is container
      --type string     Return JSON for specified type
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
centos       latest    5d0da3dc9764   11 months ago   231MB
(base) lyfubuntu@lyfubuntu:~$ docker inspect 5d0da3dc9764
[
    {
        "Id": "sha256:5d0da3dc976460b72c77d94c8a1ad043720b0416bfc16c52c45d4847e53fadb6",
        "RepoTags": [
            "centos:latest"
        ],
        "RepoDigests": [
            "centos@sha256:a27fd8080b517143cbbbab9dfb7c8571c40d67d534bbdee55bd6c473f432b177"
        ],
        "Parent": "",
        "Comment": "",
        "Created": "2021-09-15T18:20:05.184694267Z",
        "Container": "9bf8a9e2ddff4c0d76a587c40239679f29c863a967f23abf7a5babb6c2121bf1",
        "ContainerConfig": {
            "Hostname": "9bf8a9e2ddff",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/sh",
                "-c",
                "#(nop) ",
                "CMD [\"/bin/bash\"]"
            ],
            "Image": "sha256:f5b050f177fd426be8fe998a8ecf3fb1858d7e26dff4080b29a327d1bd5ba422",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {
                "org.label-schema.build-date": "20210915",
                "org.label-schema.license": "GPLv2",
                "org.label-schema.name": "CentOS Base Image",
                "org.label-schema.schema-version": "1.0",
                "org.label-schema.vendor": "CentOS"
            }
        },
        "DockerVersion": "20.10.7",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/bash"
            ],
            "Image": "sha256:f5b050f177fd426be8fe998a8ecf3fb1858d7e26dff4080b29a327d1bd5ba422",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {
                "org.label-schema.build-date": "20210915",
                "org.label-schema.license": "GPLv2",
                "org.label-schema.name": "CentOS Base Image",
                "org.label-schema.schema-version": "1.0",
                "org.label-schema.vendor": "CentOS"
            }
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 231268856,
        "VirtualSize": 231268856,
        "GraphDriver": {
            "Data": {
                "MergedDir": "/var/lib/docker/overlay2/68c0bb331e495f19cce0129c91c6516051d2631b6d53982558d5c700237b7d64/merged",
                "UpperDir": "/var/lib/docker/overlay2/68c0bb331e495f19cce0129c91c6516051d2631b6d53982558d5c700237b7d64/diff",
                "WorkDir": "/var/lib/docker/overlay2/68c0bb331e495f19cce0129c91c6516051d2631b6d53982558d5c700237b7d64/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:74ddd0ec08fa43d09f32636ba91a0a3053b02cb4627c35051aff89f853606b59"
            ]
        },
        "Metadata": {
            "LastTagTime": "0001-01-01T00:00:00Z"
        }
    }
]
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
74050c27a32c
(base) lyfubuntu@lyfubuntu:~$ docker inspect 74050c27a32c
[
    {
        "Id": "74050c27a32ca42179063a7bc9cb44cc670282beed427455b3fb120bb917b07e",
        "Created": "2022-09-02T13:29:25.386559939Z",
        "Path": "/bin/bash",
        "Args": [],
        "State": {
            "Status": "exited",
            "Running": false,
            "Paused": false,
            "Restarting": false,
            "OOMKilled": false,
            "Dead": false,
            "Pid": 0,
            "ExitCode": 0,
            "Error": "",
            "StartedAt": "2022-09-02T13:29:27.021962105Z",
            "FinishedAt": "2022-09-02T13:30:38.951857153Z"
        },
        "Image": "sha256:5d0da3dc976460b72c77d94c8a1ad043720b0416bfc16c52c45d4847e53fadb6",
        "ResolvConfPath": "/var/lib/docker/containers/74050c27a32ca42179063a7bc9cb44cc670282beed427455b3fb120bb917b07e/resolv.conf",
        "HostnamePath": "/var/lib/docker/containers/74050c27a32ca42179063a7bc9cb44cc670282beed427455b3fb120bb917b07e/hostname",
        "HostsPath": "/var/lib/docker/containers/74050c27a32ca42179063a7bc9cb44cc670282beed427455b3fb120bb917b07e/hosts",
        "LogPath": "/var/lib/docker/containers/74050c27a32ca42179063a7bc9cb44cc670282beed427455b3fb120bb917b07e/74050c27a32ca42179063a7bc9cb44cc670282beed427455b3fb120bb917b07e-json.log",
        "Name": "/silly_feynman",
        "RestartCount": 0,
        "Driver": "overlay2",
        "Platform": "linux",
        "MountLabel": "",
        "ProcessLabel": "",
        "AppArmorProfile": "docker-default",
        "ExecIDs": null,
        "HostConfig": {
            "Binds": null,
            "ContainerIDFile": "",
            "LogConfig": {
                "Type": "json-file",
                "Config": {}
            },
            "NetworkMode": "default",
            "PortBindings": {},
            "RestartPolicy": {
                "Name": "no",
                "MaximumRetryCount": 0
            },
            "AutoRemove": false,
            "VolumeDriver": "",
            "VolumesFrom": null,
            "CapAdd": null,
            "CapDrop": null,
            "CgroupnsMode": "host",
            "Dns": [],
            "DnsOptions": [],
            "DnsSearch": [],
            "ExtraHosts": null,
            "GroupAdd": null,
            "IpcMode": "private",
            "Cgroup": "",
            "Links": null,
            "OomScoreAdj": 0,
            "PidMode": "",
            "Privileged": false,
            "PublishAllPorts": false,
            "ReadonlyRootfs": false,
            "SecurityOpt": null,
            "UTSMode": "",
            "UsernsMode": "",
            "ShmSize": 67108864,
            "Runtime": "runc",
            "ConsoleSize": [
                0,
                0
            ],
            "Isolation": "",
            "CpuShares": 0,
            "Memory": 0,
            "NanoCpus": 0,
            "CgroupParent": "",
            "BlkioWeight": 0,
            "BlkioWeightDevice": [],
            "BlkioDeviceReadBps": null,
            "BlkioDeviceWriteBps": null,
            "BlkioDeviceReadIOps": null,
            "BlkioDeviceWriteIOps": null,
            "CpuPeriod": 0,
            "CpuQuota": 0,
            "CpuRealtimePeriod": 0,
            "CpuRealtimeRuntime": 0,
            "CpusetCpus": "",
            "CpusetMems": "",
            "Devices": [],
            "DeviceCgroupRules": null,
            "DeviceRequests": null,
            "KernelMemory": 0,
            "KernelMemoryTCP": 0,
            "MemoryReservation": 0,
            "MemorySwap": 0,
            "MemorySwappiness": null,
            "OomKillDisable": false,
            "PidsLimit": null,
            "Ulimits": null,
            "CpuCount": 0,
            "CpuPercent": 0,
            "IOMaximumIOps": 0,
            "IOMaximumBandwidth": 0,
            "MaskedPaths": [
                "/proc/asound",
                "/proc/acpi",
                "/proc/kcore",
                "/proc/keys",
                "/proc/latency_stats",
                "/proc/timer_list",
                "/proc/timer_stats",
                "/proc/sched_debug",
                "/proc/scsi",
                "/sys/firmware"
            ],
            "ReadonlyPaths": [
                "/proc/bus",
                "/proc/fs",
                "/proc/irq",
                "/proc/sys",
                "/proc/sysrq-trigger"
            ]
        },
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/fc8cfa7a5e8e04a542c98995749138df953125a3b372422817559ae1c81005d8-init/diff:/var/lib/docker/overlay2/68c0bb331e495f19cce0129c91c6516051d2631b6d53982558d5c700237b7d64/diff",
                "MergedDir": "/var/lib/docker/overlay2/fc8cfa7a5e8e04a542c98995749138df953125a3b372422817559ae1c81005d8/merged",
                "UpperDir": "/var/lib/docker/overlay2/fc8cfa7a5e8e04a542c98995749138df953125a3b372422817559ae1c81005d8/diff",
                "WorkDir": "/var/lib/docker/overlay2/fc8cfa7a5e8e04a542c98995749138df953125a3b372422817559ae1c81005d8/work"
            },
            "Name": "overlay2"
        },
        "Mounts": [],
        "Config": {
            "Hostname": "74050c27a32c",
            "Domainname": "",
            "User": "",
            "AttachStdin": true,
            "AttachStdout": true,
            "AttachStderr": true,
            "Tty": true,
            "OpenStdin": true,
            "StdinOnce": true,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/bash"
            ],
            "Image": "centos",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {
                "org.label-schema.build-date": "20210915",
                "org.label-schema.license": "GPLv2",
                "org.label-schema.name": "CentOS Base Image",
                "org.label-schema.schema-version": "1.0",
                "org.label-schema.vendor": "CentOS"
            }
        },
        "NetworkSettings": {
            "Bridge": "",
            "SandboxID": "956c9ea1711f190012cd274a72984cfe46ead809dbcf5e98e3ab0706174f996d",
            "HairpinMode": false,
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "Ports": {},
            "SandboxKey": "/var/run/docker/netns/956c9ea1711f",
            "SecondaryIPAddresses": null,
            "SecondaryIPv6Addresses": null,
            "EndpointID": "",
            "Gateway": "",
            "GlobalIPv6Address": "",
            "GlobalIPv6PrefixLen": 0,
            "IPAddress": "",
            "IPPrefixLen": 0,
            "IPv6Gateway": "",
            "MacAddress": "",
            "Networks": {
                "bridge": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "NetworkID": "45716432c8c854ce71961a659d7c935c23ece87516106a6420186114b0ee5568",
                    "EndpointID": "",
                    "Gateway": "",
                    "IPAddress": "",
                    "IPPrefixLen": 0,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "MacAddress": "",
                    "DriverOpts": null
                }
            }
        }
    }
]
(base) lyfubuntu@lyfubuntu:~$
```

---

**进入当前正在运行的容器**

```shell
# 当容器使用后台方式运行时，我们经常需要进入容器，修改一些配置

# 进入容器后开启一个新的终端
$ docker exec

# 进入容器正在执行的终端，不会启动新的进程
$ docker attach

$ docker exec -it 容器id /bin/bash
```

```shell
(base) lyfubuntu@lyfubuntu:~$ docker exec --help

Usage:  docker exec [OPTIONS] CONTAINER COMMAND [ARG...]

Run a command in a running container

Options:
  -d, --detach               Detached mode: run command in the background
      --detach-keys string   Override the key sequence for detaching a container
  -e, --env list             Set environment variables
      --env-file list        Read in a file of environment variables
  -i, --interactive          Keep STDIN open even if not attached
      --privileged           Give extended privileges to the command
  -t, --tty                  Allocate a pseudo-TTY
  -u, --user string          Username or UID (format: <name|uid>[:<group|gid>])
  -w, --workdir string       Working directory inside the container
(base) lyfubuntu@lyfubuntu:~$ docker attach --help

Usage:  docker attach [OPTIONS] CONTAINER

Attach local standard input, output, and error streams to a running container

Options:
      --detach-keys string   Override the key sequence for detaching a container
      --no-stdin             Do not attach STDIN
      --sig-proxy            Proxy all received signals to the process (default true)
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
centos       latest    5d0da3dc9764   11 months ago   231MB
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
(base) lyfubuntu@lyfubuntu:~$ docker run -it centos /bin/bash
[root@00f83d56efbf /]# ls
bin  dev  etc  home  lib  lib64  lost+found  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
[root@00f83d56efbf /]# (base) lyfubuntu@lyfubuntu:~$ 
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED          STATUS          PORTS     NAMES
00f83d56efbf   centos    "/bin/bash"   15 seconds ago   Up 13 seconds             stupefied_pike
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
00f83d56efbf
(base) lyfubuntu@lyfubuntu:~$ docker exec -it 00f83d56efbf /bin/bash
[root@00f83d56efbf /]# ls
bin  dev  etc  home  lib  lib64  lost+found  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
[root@00f83d56efbf /]# read escape sequence
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED              STATUS              PORTS     NAMES
00f83d56efbf   centos    "/bin/bash"   About a minute ago   Up About a minute             stupefied_pike
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
00f83d56efbf
(base) lyfubuntu@lyfubuntu:~$ docker attach 00f83d56efbf
[root@00f83d56efbf /]# ls
bin  dev  etc  home  lib  lib64  lost+found  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
[root@00f83d56efbf /]# read escape sequence
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS         PORTS     NAMES
00f83d56efbf   centos    "/bin/bash"   2 minutes ago   Up 2 minutes             stupefied_pike
(base) lyfubuntu@lyfubuntu:~$ docker ps -aq
00f83d56efbf
(base) lyfubuntu@lyfubuntu:~$ docker rm -f $(docker ps -aq)
00f83d56efbf
(base) lyfubuntu@lyfubuntu:~$
```

---

**从容器中拷贝文件到主机**

`Dokcer` 中的 `centos` 的镜像不能通过 `yum` 安装软件，主要原因是 `CentOS` 已经停止更新和维护。如果需要更新 `CentOS`，需要将镜像从 `mirror.centos.org` 更改为 `vault.centos.org`。详情可以参考[【已解决】Error: Failed to download metadata for repo ‘appstream‘: Cannot prepare internal mirrorlist](https://blog.csdn.net/weixin_43252521/article/details/124409151)。

1. 进入到 `yum` 的 `repos` 目录。

```shell
$ cd /etc/yum.repos.d/
```

2. 修改 `centos` 文件内容。

```shell
$ sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
$ sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
```

3. 生成`缓存更新`（第一次更新，速度稍微有点慢，耐心等待两分钟左右）。

```shell
$ yum makecache
```

4. 运行 `yum update` 并重新安装 `vim`。

```shell
$ yum update -y
$ yum -y install vim
```

---

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
centos       latest    5d0da3dc9764   11 months ago   231MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -aq
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker run -it centos /bin/bash
[root@bf46371dea89 /]# cd /etc/yum.repos.d/
[root@bf46371dea89 yum.repos.d]# sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
[root@bf46371dea89 yum.repos.d]# sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
[root@bf46371dea89 yum.repos.d]# yum makecache
Failed to set locale, defaulting to C.UTF-8
CentOS Linux 8 - AppStream                      1.0 MB/s | 8.4 MB     00:08    
CentOS Linux 8 - BaseOS                         595 kB/s | 4.6 MB     00:07    
CentOS Linux 8 - Extras                         4.5 kB/s |  10 kB     00:02    
Metadata cache created.
[root@bf46371dea89 yum.repos.d]# yum update -y
Failed to set locale, defaulting to C.UTF-8
Last metadata expiration check: 0:00:17 ago on Sat Sep  3 03:50:05 2022.
Dependencies resolved.
================================================================================
 Package                     Arch   Version                     Repo       Size
================================================================================
Upgrading:
 bash                        x86_64 4.4.20-2.el8                baseos    1.5 M
 bind-export-libs            x86_64 32:9.11.26-6.el8            baseos    1.1 M
 binutils                    x86_64 2.30-108.el8_5.1            baseos    5.8 M
 ca-certificates             noarch 2021.2.50-80.0.el8_4        baseos    390 k
 centos-gpg-keys             noarch 1:8-3.el8                   baseos     12 k
 centos-linux-release        noarch 8.5-1.2111.el8              baseos     22 k
 centos-linux-repos          noarch 8-3.el8                     baseos     20 k
 chkconfig                   x86_64 1.19.1-1.el8                baseos    198 k
 coreutils-single            x86_64 8.30-12.el8                 baseos    629 k
 crypto-policies             noarch 20210617-1.gitc776d3e.el8   baseos     63 k
 curl                        x86_64 7.61.1-22.el8               baseos    351 k
 dbus                        x86_64 1:1.12.8-14.el8             baseos     41 k
 dbus-common                 noarch 1:1.12.8-14.el8             baseos     46 k
 dbus-daemon                 x86_64 1:1.12.8-14.el8             baseos    240 k
 dbus-libs                   x86_64 1:1.12.8-14.el8             baseos    184 k
 dbus-tools                  x86_64 1:1.12.8-14.el8             baseos     85 k
 device-mapper               x86_64 8:1.02.177-10.el8           baseos    377 k
 device-mapper-libs          x86_64 8:1.02.177-10.el8           baseos    409 k
 dhcp-client                 x86_64 12:4.3.6-45.el8             baseos    318 k
 dhcp-common                 noarch 12:4.3.6-45.el8             baseos    207 k
 dhcp-libs                   x86_64 12:4.3.6-45.el8             baseos    148 k
 dnf                         noarch 4.7.0-4.el8                 baseos    544 k
 dnf-data                    noarch 4.7.0-4.el8                 baseos    154 k
 dracut                      x86_64 049-191.git20210920.el8     baseos    374 k
 dracut-network              x86_64 049-191.git20210920.el8     baseos    108 k
 dracut-squash               x86_64 049-191.git20210920.el8     baseos     61 k
 elfutils-default-yama-scope noarch 0.185-1.el8                 baseos     49 k
 elfutils-libelf             x86_64 0.185-1.el8                 baseos    221 k
 elfutils-libs               x86_64 0.185-1.el8                 baseos    292 k
 ethtool                     x86_64 2:5.8-7.el8                 baseos    209 k
 file-libs                   x86_64 5.33-20.el8                 baseos    543 k
 filesystem                  x86_64 3.8-6.el8                   baseos    1.1 M
 glib2                       x86_64 2.56.4-156.el8              baseos    2.5 M
 glibc                       x86_64 2.28-164.el8                baseos    3.6 M
 glibc-common                x86_64 2.28-164.el8                baseos    1.3 M
 glibc-minimal-langpack      x86_64 2.28-164.el8                baseos     58 k
 gnutls                      x86_64 3.6.16-4.el8                baseos    1.0 M
 gpgme                       x86_64 1.13.1-9.el8                baseos    336 k
 hwdata                      noarch 0.314-8.10.el8              baseos    1.7 M
 iproute                     x86_64 5.12.0-4.el8                baseos    775 k
 iptables-libs               x86_64 1.8.4-20.el8                baseos    107 k
 json-c                      x86_64 0.13.1-2.el8                baseos     40 k
 kexec-tools                 x86_64 2.0.20-57.el8_5.1           baseos    514 k
 keyutils-libs               x86_64 1.5.10-9.el8                baseos     34 k
 kmod                        x86_64 25-18.el8                   baseos    126 k
 kmod-libs                   x86_64 25-18.el8                   baseos     68 k
 krb5-libs                   x86_64 1.18.2-14.el8               baseos    840 k
 libblkid                    x86_64 2.32.1-28.el8               baseos    217 k
 libcap                      x86_64 2.26-5.el8                  baseos     60 k
 libcap-ng                   x86_64 0.7.11-1.el8                baseos     33 k
 libcom_err                  x86_64 1.45.6-2.el8                baseos     49 k
 libcomps                    x86_64 0.1.16-2.el8                baseos     82 k
 libcurl-minimal             x86_64 7.61.1-22.el8               baseos    287 k
 libdb                       x86_64 5.3.28-42.el8_4             baseos    751 k
 libdb-utils                 x86_64 5.3.28-42.el8_4             baseos    150 k
 libdnf                      x86_64 0.63.0-3.el8                baseos    700 k
 libfdisk                    x86_64 2.32.1-28.el8               baseos    251 k
 libgcc                      x86_64 8.5.0-4.el8_5               baseos     79 k
 libgcrypt                   x86_64 1.8.5-6.el8                 baseos    463 k
 libibverbs                  x86_64 35.0-1.el8                  baseos    335 k
 libmodulemd                 x86_64 2.13.0-1.el8                baseos    233 k
 libmount                    x86_64 2.32.1-28.el8               baseos    234 k
 librepo                     x86_64 1.14.0-2.el8                baseos     93 k
 libsepol                    x86_64 2.9-3.el8                   baseos    340 k
 libsmartcols                x86_64 2.32.1-28.el8               baseos    177 k
 libsolv                     x86_64 0.7.19-1.el8                baseos    374 k
 libstdc++                   x86_64 8.5.0-4.el8_5               baseos    453 k
 libtirpc                    x86_64 1.1.4-5.el8                 baseos    112 k
 libuuid                     x86_64 2.32.1-28.el8               baseos     96 k
 libxcrypt                   x86_64 4.1.1-6.el8                 baseos     73 k
 libxml2                     x86_64 2.9.7-9.el8_4.2             baseos    696 k
 lua-libs                    x86_64 5.3.4-12.el8                baseos    118 k
 lz4-libs                    x86_64 1.8.3-3.el8_4               baseos     66 k
 ncurses-base                noarch 6.1-9.20180224.el8          baseos     81 k
 ncurses-libs                x86_64 6.1-9.20180224.el8          baseos    334 k
 nettle                      x86_64 3.4.1-7.el8                 baseos    301 k
 openldap                    x86_64 2.4.46-18.el8               baseos    352 k
 openssl-libs                x86_64 1:1.1.1k-5.el8_5            baseos    1.5 M
 pam                         x86_64 1.3.1-15.el8                baseos    739 k
 pcre                        x86_64 8.42-6.el8                  baseos    211 k
 platform-python             x86_64 3.6.8-41.el8                baseos     85 k
 python3-dnf                 noarch 4.7.0-4.el8                 baseos    545 k
 python3-gpg                 x86_64 1.13.1-9.el8                baseos    245 k
 python3-hawkey              x86_64 0.63.0-3.el8                baseos    116 k
 python3-libcomps            x86_64 0.1.16-2.el8                baseos     51 k
 python3-libdnf              x86_64 0.63.0-3.el8                baseos    777 k
 python3-libs                x86_64 3.6.8-41.el8                baseos    7.8 M
 python3-pip-wheel           noarch 9.0.3-20.el8                baseos    1.0 M
 python3-rpm                 x86_64 4.14.3-19.el8               baseos    154 k
 rdma-core                   x86_64 35.0-1.el8                  baseos     59 k
 rpm                         x86_64 4.14.3-19.el8               baseos    543 k
 rpm-build-libs              x86_64 4.14.3-19.el8               baseos    156 k
 rpm-libs                    x86_64 4.14.3-19.el8               baseos    344 k
 shadow-utils                x86_64 2:4.6-14.el8                baseos    1.2 M
 sqlite-libs                 x86_64 3.26.0-15.el8               baseos    581 k
 systemd                     x86_64 239-51.el8_5.2              baseos    3.6 M
 systemd-libs                x86_64 239-51.el8_5.2              baseos    1.1 M
 systemd-pam                 x86_64 239-51.el8_5.2              baseos    477 k
 systemd-udev                x86_64 239-51.el8_5.2              baseos    1.6 M
 tpm2-tss                    x86_64 2.3.2-4.el8                 baseos    275 k
 tzdata                      noarch 2021e-1.el8                 baseos    474 k
 util-linux                  x86_64 2.32.1-28.el8               baseos    2.5 M
 vim-minimal                 x86_64 2:8.0.1763-16.el8           baseos    573 k
 yum                         noarch 4.7.0-4.el8                 baseos    205 k
Installing dependencies:
 file                        x86_64 5.33-20.el8                 baseos     77 k
 gettext                     x86_64 0.19.8.1-17.el8             baseos    1.1 M
 gettext-libs                x86_64 0.19.8.1-17.el8             baseos    314 k
 grub2-common                noarch 1:2.02-106.el8              baseos    891 k
 grub2-tools                 x86_64 1:2.02-106.el8              baseos    2.0 M
 grub2-tools-minimal         x86_64 1:2.02-106.el8              baseos    210 k
 kbd-legacy                  noarch 2.0.4-10.el8                baseos    481 k
 kbd-misc                    noarch 2.0.4-10.el8                baseos    1.5 M
 libbpf                      x86_64 0.4.0-1.el8                 baseos    110 k
 libcroco                    x86_64 0.6.12-4.el8_2.1            baseos    113 k
 libevent                    x86_64 2.1.8-5.el8                 baseos    253 k
 libgomp                     x86_64 8.5.0-4.el8_5               baseos    206 k
 openssl                     x86_64 1:1.1.1k-5.el8_5            baseos    709 k
 os-prober                   x86_64 1.74-9.el8                  baseos     51 k
 trousers-lib                x86_64 0.3.15-1.el8                baseos    168 k
 unbound-libs                x86_64 1.7.3-17.el8                appstream 503 k
 which                       x86_64 2.21-16.el8                 baseos     49 k
 xkeyboard-config            noarch 2.28-1.el8                  appstream 782 k
Installing weak dependencies:
 crypto-policies-scripts     noarch 20210617-1.gitc776d3e.el8   baseos     83 k
 diffutils                   x86_64 3.6-6.el8                   baseos    358 k
 elfutils-debuginfod-client  x86_64 0.185-1.el8                 baseos     66 k
 glibc-langpack-en           x86_64 2.28-164.el8                baseos    828 k
 grubby                      x86_64 8.40-42.el8                 baseos     49 k
 hardlink                    x86_64 1:1.3-6.el8                 baseos     29 k
 kbd                         x86_64 2.0.4-10.el8                baseos    390 k
 kpartx                      x86_64 0.8.4-17.el8                baseos    113 k
 libxkbcommon                x86_64 0.9.1-1.el8                 appstream 116 k
 memstrack                   x86_64 0.1.11-1.el8                baseos     48 k
 openssl-pkcs11              x86_64 0.4.10-2.el8                baseos     66 k
 pigz                        x86_64 2.4-4.el8                   baseos     79 k
 platform-python-pip         noarch 9.0.3-20.el8                baseos    1.7 M
 python3-unbound             x86_64 1.7.3-17.el8                appstream 119 k
 rpm-plugin-systemd-inhibit  x86_64 4.14.3-19.el8               baseos     78 k
 shared-mime-info            x86_64 1.9-3.el8                   baseos    329 k
 trousers                    x86_64 0.3.15-1.el8                baseos    152 k

Transaction Summary
================================================================================
Install   35 Packages
Upgrade  104 Packages

Total download size: 77 M
Downloading Packages:
(1/139): libxkbcommon-0.9.1-1.el8.x86_64.rpm     65 kB/s | 116 kB     00:01    
(2/139): python3-unbound-1.7.3-17.el8.x86_64.rp  65 kB/s | 119 kB     00:01    
(3/139): unbound-libs-1.7.3-17.el8.x86_64.rpm   210 kB/s | 503 kB     00:02    
(4/139): crypto-policies-scripts-20210617-1.git 143 kB/s |  83 kB     00:00    
(5/139): elfutils-debuginfod-client-0.185-1.el8 119 kB/s |  66 kB     00:00    
(6/139): xkeyboard-config-2.28-1.el8.noarch.rpm 639 kB/s | 782 kB     00:01    
(7/139): diffutils-3.6-6.el8.x86_64.rpm         538 kB/s | 358 kB     00:00    
(8/139): file-5.33-20.el8.x86_64.rpm            124 kB/s |  77 kB     00:00    
(9/139): gettext-libs-0.19.8.1-17.el8.x86_64.rp 483 kB/s | 314 kB     00:00    
(10/139): gettext-0.19.8.1-17.el8.x86_64.rpm    1.4 MB/s | 1.1 MB     00:00    
(11/139): grub2-common-2.02-106.el8.noarch.rpm  1.6 MB/s | 891 kB     00:00    
(12/139): glibc-langpack-en-2.28-164.el8.x86_64 684 kB/s | 828 kB     00:01    
(13/139): grub2-tools-minimal-2.02-106.el8.x86_ 387 kB/s | 210 kB     00:00    
(14/139): grub2-tools-2.02-106.el8.x86_64.rpm   1.8 MB/s | 2.0 MB     00:01    
(15/139): hardlink-1.3-6.el8.x86_64.rpm          61 kB/s |  29 kB     00:00    
(16/139): grubby-8.40-42.el8.x86_64.rpm          94 kB/s |  49 kB     00:00    
(17/139): kbd-2.0.4-10.el8.x86_64.rpm           690 kB/s | 390 kB     00:00    
(18/139): kbd-legacy-2.0.4-10.el8.noarch.rpm    850 kB/s | 481 kB     00:00    
(19/139): kpartx-0.8.4-17.el8.x86_64.rpm        208 kB/s | 113 kB     00:00    
(20/139): kbd-misc-2.0.4-10.el8.noarch.rpm      1.8 MB/s | 1.5 MB     00:00    
(21/139): libbpf-0.4.0-1.el8.x86_64.rpm         208 kB/s | 110 kB     00:00    
(22/139): libcroco-0.6.12-4.el8_2.1.x86_64.rpm  233 kB/s | 113 kB     00:00    
(23/139): libevent-2.1.8-5.el8.x86_64.rpm       464 kB/s | 253 kB     00:00    
(24/139): libgomp-8.5.0-4.el8_5.x86_64.rpm      382 kB/s | 206 kB     00:00    
(25/139): memstrack-0.1.11-1.el8.x86_64.rpm      99 kB/s |  48 kB     00:00    
(26/139): openssl-1.1.1k-5.el8_5.x86_64.rpm     1.2 MB/s | 709 kB     00:00    
(27/139): openssl-pkcs11-0.4.10-2.el8.x86_64.rp 138 kB/s |  66 kB     00:00    
(28/139): os-prober-1.74-9.el8.x86_64.rpm        95 kB/s |  51 kB     00:00    
(29/139): pigz-2.4-4.el8.x86_64.rpm             149 kB/s |  79 kB     00:00    
(30/139): shared-mime-info-1.9-3.el8.x86_64.rpm 206 kB/s | 329 kB     00:01    
(31/139): trousers-0.3.15-1.el8.x86_64.rpm      284 kB/s | 152 kB     00:00    
(32/139): trousers-lib-0.3.15-1.el8.x86_64.rpm  311 kB/s | 168 kB     00:00    
(33/139): rpm-plugin-systemd-inhibit-4.14.3-19.  23 kB/s |  78 kB     00:03    
(34/139): which-2.21-16.el8.x86_64.rpm           93 kB/s |  49 kB     00:00    
(35/139): bash-4.4.20-2.el8.x86_64.rpm          2.3 MB/s | 1.5 MB     00:00    
(36/139): bind-export-libs-9.11.26-6.el8.x86_64 1.5 MB/s | 1.1 MB     00:00    
(37/139): ca-certificates-2021.2.50-80.0.el8_4. 677 kB/s | 390 kB     00:00    
(38/139): centos-gpg-keys-8-3.el8.noarch.rpm     12 kB/s |  12 kB     00:01    
(39/139): centos-linux-release-8.5-1.2111.el8.n  41 kB/s |  22 kB     00:00    
(40/139): centos-linux-repos-8-3.el8.noarch.rpm  37 kB/s |  20 kB     00:00    
(41/139): platform-python-pip-9.0.3-20.el8.noar 233 kB/s | 1.7 MB     00:07    
(42/139): chkconfig-1.19.1-1.el8.x86_64.rpm     343 kB/s | 198 kB     00:00    
(43/139): binutils-2.30-108.el8_5.1.x86_64.rpm  1.5 MB/s | 5.8 MB     00:03    
(44/139): crypto-policies-20210617-1.gitc776d3e 127 kB/s |  63 kB     00:00    
(45/139): dbus-1.12.8-14.el8.x86_64.rpm          84 kB/s |  41 kB     00:00    
(46/139): curl-7.61.1-22.el8.x86_64.rpm         571 kB/s | 351 kB     00:00    
(47/139): dbus-common-1.12.8-14.el8.noarch.rpm   85 kB/s |  46 kB     00:00    
(48/139): dbus-daemon-1.12.8-14.el8.x86_64.rpm  443 kB/s | 240 kB     00:00    
(49/139): coreutils-single-8.30-12.el8.x86_64.r 315 kB/s | 629 kB     00:01    
(50/139): dbus-libs-1.12.8-14.el8.x86_64.rpm    317 kB/s | 184 kB     00:00    
(51/139): dbus-tools-1.12.8-14.el8.x86_64.rpm   138 kB/s |  85 kB     00:00    
(52/139): device-mapper-1.02.177-10.el8.x86_64. 592 kB/s | 377 kB     00:00    
(53/139): dhcp-client-4.3.6-45.el8.x86_64.rpm   514 kB/s | 318 kB     00:00    
(54/139): dhcp-common-4.3.6-45.el8.noarch.rpm   388 kB/s | 207 kB     00:00    
(55/139): device-mapper-libs-1.02.177-10.el8.x8 377 kB/s | 409 kB     00:01    
(56/139): dhcp-libs-4.3.6-45.el8.x86_64.rpm     260 kB/s | 148 kB     00:00    
(57/139): dnf-data-4.7.0-4.el8.noarch.rpm       271 kB/s | 154 kB     00:00    
(58/139): dracut-049-191.git20210920.el8.x86_64 655 kB/s | 374 kB     00:00    
(59/139): dnf-4.7.0-4.el8.noarch.rpm            491 kB/s | 544 kB     00:01    
(60/139): dracut-network-049-191.git20210920.el 195 kB/s | 108 kB     00:00    
(61/139): dracut-squash-049-191.git20210920.el8 114 kB/s |  61 kB     00:00    
(62/139): elfutils-default-yama-scope-0.185-1.e  92 kB/s |  49 kB     00:00    
(63/139): elfutils-libelf-0.185-1.el8.x86_64.rp 411 kB/s | 221 kB     00:00    
(64/139): elfutils-libs-0.185-1.el8.x86_64.rpm  478 kB/s | 292 kB     00:00    
(65/139): ethtool-5.8-7.el8.x86_64.rpm          301 kB/s | 209 kB     00:00    
(66/139): file-libs-5.33-20.el8.x86_64.rpm      825 kB/s | 543 kB     00:00    
(67/139): filesystem-3.8-6.el8.x86_64.rpm       1.3 MB/s | 1.1 MB     00:00    
(68/139): glibc-common-2.28-164.el8.x86_64.rpm  393 kB/s | 1.3 MB     00:03    
(69/139): glibc-2.28-164.el8.x86_64.rpm         893 kB/s | 3.6 MB     00:04    
(70/139): glib2-2.56.4-156.el8.x86_64.rpm       563 kB/s | 2.5 MB     00:04    
(71/139): glibc-minimal-langpack-2.28-164.el8.x 107 kB/s |  58 kB     00:00    
(72/139): gnutls-3.6.16-4.el8.x86_64.rpm        1.1 MB/s | 1.0 MB     00:00    
(73/139): gpgme-1.13.1-9.el8.x86_64.rpm         257 kB/s | 336 kB     00:01    
(74/139): iptables-libs-1.8.4-20.el8.x86_64.rpm 208 kB/s | 107 kB     00:00    
(75/139): iproute-5.12.0-4.el8.x86_64.rpm       626 kB/s | 775 kB     00:01    
(76/139): json-c-0.13.1-2.el8.x86_64.rpm         76 kB/s |  40 kB     00:00    
(77/139): kexec-tools-2.0.20-57.el8_5.1.x86_64. 749 kB/s | 514 kB     00:00    
(78/139): keyutils-libs-1.5.10-9.el8.x86_64.rpm  64 kB/s |  34 kB     00:00    
(79/139): kmod-25-18.el8.x86_64.rpm             226 kB/s | 126 kB     00:00    
(80/139): kmod-libs-25-18.el8.x86_64.rpm        137 kB/s |  68 kB     00:00    
(81/139): hwdata-0.314-8.10.el8.noarch.rpm      489 kB/s | 1.7 MB     00:03    
(82/139): libblkid-2.32.1-28.el8.x86_64.rpm     385 kB/s | 217 kB     00:00    
(83/139): krb5-libs-1.18.2-14.el8.x86_64.rpm    1.1 MB/s | 840 kB     00:00    
(84/139): libcap-2.26-5.el8.x86_64.rpm          108 kB/s |  60 kB     00:00    
(85/139): libcom_err-1.45.6-2.el8.x86_64.rpm    100 kB/s |  49 kB     00:00    
(86/139): libcap-ng-0.7.11-1.el8.x86_64.rpm      63 kB/s |  33 kB     00:00    
(87/139): libcomps-0.1.16-2.el8.x86_64.rpm      150 kB/s |  82 kB     00:00    
(88/139): libcurl-minimal-7.61.1-22.el8.x86_64. 449 kB/s | 287 kB     00:00    
(89/139): libdb-5.3.28-42.el8_4.x86_64.rpm      1.1 MB/s | 751 kB     00:00    
(90/139): libdb-utils-5.3.28-42.el8_4.x86_64.rp 278 kB/s | 150 kB     00:00    
(91/139): libfdisk-2.32.1-28.el8.x86_64.rpm     435 kB/s | 251 kB     00:00    
(92/139): libgcrypt-1.8.5-6.el8.x86_64.rpm      380 kB/s | 463 kB     00:01    
(93/139): libgcc-8.5.0-4.el8_5.x86_64.rpm        35 kB/s |  79 kB     00:02    
(94/139): libibverbs-35.0-1.el8.x86_64.rpm      507 kB/s | 335 kB     00:00    
(95/139): libmodulemd-2.13.0-1.el8.x86_64.rpm   378 kB/s | 233 kB     00:00    
(96/139): libmount-2.32.1-28.el8.x86_64.rpm     315 kB/s | 234 kB     00:00    
(97/139): librepo-1.14.0-2.el8.x86_64.rpm       166 kB/s |  93 kB     00:00    
(98/139): libsepol-2.9-3.el8.x86_64.rpm         395 kB/s | 340 kB     00:00    
(99/139): libsmartcols-2.32.1-28.el8.x86_64.rpm 297 kB/s | 177 kB     00:00    
(100/139): libsolv-0.7.19-1.el8.x86_64.rpm      554 kB/s | 374 kB     00:00    
(101/139): libstdc++-8.5.0-4.el8_5.x86_64.rpm   459 kB/s | 453 kB     00:00    
(102/139): libtirpc-1.1.4-5.el8.x86_64.rpm      198 kB/s | 112 kB     00:00    
(103/139): libuuid-2.32.1-28.el8.x86_64.rpm     171 kB/s |  96 kB     00:00    
(104/139): libxcrypt-4.1.1-6.el8.x86_64.rpm     129 kB/s |  73 kB     00:00    
(105/139): lua-libs-5.3.4-12.el8.x86_64.rpm     192 kB/s | 118 kB     00:00    
(106/139): libxml2-2.9.7-9.el8_4.2.x86_64.rpm   872 kB/s | 696 kB     00:00    
(107/139): ncurses-base-6.1-9.20180224.el8.noar 161 kB/s |  81 kB     00:00    
(108/139): lz4-libs-1.8.3-3.el8_4.x86_64.rpm    109 kB/s |  66 kB     00:00    
(109/139): ncurses-libs-6.1-9.20180224.el8.x86_ 509 kB/s | 334 kB     00:00    
(110/139): nettle-3.4.1-7.el8.x86_64.rpm        375 kB/s | 301 kB     00:00    
(111/139): openldap-2.4.46-18.el8.x86_64.rpm    532 kB/s | 352 kB     00:00    
(112/139): pam-1.3.1-15.el8.x86_64.rpm          912 kB/s | 739 kB     00:00    
(113/139): openssl-libs-1.1.1k-5.el8_5.x86_64.r 907 kB/s | 1.5 MB     00:01    
(114/139): pcre-8.42-6.el8.x86_64.rpm           349 kB/s | 211 kB     00:00    
(115/139): platform-python-3.6.8-41.el8.x86_64. 153 kB/s |  85 kB     00:00    
(116/139): python3-dnf-4.7.0-4.el8.noarch.rpm   675 kB/s | 545 kB     00:00    
(117/139): python3-gpg-1.13.1-9.el8.x86_64.rpm  398 kB/s | 245 kB     00:00    
(118/139): python3-hawkey-0.63.0-3.el8.x86_64.r 206 kB/s | 116 kB     00:00    
(119/139): python3-libcomps-0.1.16-2.el8.x86_64  99 kB/s |  51 kB     00:00    
(120/139): python3-libdnf-0.63.0-3.el8.x86_64.r 507 kB/s | 777 kB     00:01    
(121/139): python3-pip-wheel-9.0.3-20.el8.noarc 1.1 MB/s | 1.0 MB     00:00    
(122/139): python3-rpm-4.14.3-19.el8.x86_64.rpm 265 kB/s | 154 kB     00:00    
(123/139): python3-libs-3.6.8-41.el8.x86_64.rpm 1.4 MB/s | 7.8 MB     00:05    
(124/139): rdma-core-35.0-1.el8.x86_64.rpm       19 kB/s |  59 kB     00:03    
(125/139): rpm-4.14.3-19.el8.x86_64.rpm         759 kB/s | 543 kB     00:00    
(126/139): rpm-build-libs-4.14.3-19.el8.x86_64. 268 kB/s | 156 kB     00:00    
(127/139): rpm-libs-4.14.3-19.el8.x86_64.rpm    571 kB/s | 344 kB     00:00    
(128/139): shadow-utils-4.6-14.el8.x86_64.rpm   1.3 MB/s | 1.2 MB     00:00    
(129/139): sqlite-libs-3.26.0-15.el8.x86_64.rpm 798 kB/s | 581 kB     00:00    
(130/139): systemd-libs-239-51.el8_5.2.x86_64.r 1.3 MB/s | 1.1 MB     00:00    
(131/139): libdnf-0.63.0-3.el8.x86_64.rpm        35 kB/s | 700 kB     00:20    
(132/139): systemd-239-51.el8_5.2.x86_64.rpm    2.4 MB/s | 3.6 MB     00:01    
(133/139): systemd-pam-239-51.el8_5.2.x86_64.rp 700 kB/s | 477 kB     00:00    
(134/139): tpm2-tss-2.3.2-4.el8.x86_64.rpm      518 kB/s | 275 kB     00:00    
(135/139): tzdata-2021e-1.el8.noarch.rpm        696 kB/s | 474 kB     00:00    
(136/139): util-linux-2.32.1-28.el8.x86_64.rpm  761 kB/s | 2.5 MB     00:03    
(137/139): vim-minimal-8.0.1763-16.el8.x86_64.r 176 kB/s | 573 kB     00:03    
(138/139): yum-4.7.0-4.el8.noarch.rpm           365 kB/s | 205 kB     00:00    
(139/139): systemd-udev-239-51.el8_5.2.x86_64.r 162 kB/s | 1.6 MB     00:09    
--------------------------------------------------------------------------------
Total                                           1.3 MB/s |  77 MB     00:59     
warning: /var/cache/dnf/appstream-d7987f026ef99c82/packages/libxkbcommon-0.9.1-1.el8.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID 8483c65d: NOKEY
CentOS Linux 8 - AppStream                      342 kB/s | 1.6 kB     00:00    
Importing GPG key 0x8483C65D:
 Userid     : "CentOS (CentOS Official Signing Key) <security@centos.org>"
 Fingerprint: 99DB 70FA E1D7 CE22 7FB6 4882 05B5 55B3 8483 C65D
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
Key imported successfully
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Running scriptlet: filesystem-3.8-6.el8.x86_64                            1/1 
  Preparing        :                                                        1/1 
  Running scriptlet: libgcc-8.5.0-4.el8_5.x86_64                            1/1 
  Upgrading        : libgcc-8.5.0-4.el8_5.x86_64                          1/243 
  Running scriptlet: libgcc-8.5.0-4.el8_5.x86_64                          1/243 
  Upgrading        : python3-pip-wheel-9.0.3-20.el8.noarch                2/243 
  Upgrading        : filesystem-3.8-6.el8.x86_64                          3/243 
  Upgrading        : tzdata-2021e-1.el8.noarch                            4/243 
  Upgrading        : ncurses-base-6.1-9.20180224.el8.noarch               5/243 
  Upgrading        : glibc-common-2.28-164.el8.x86_64                     6/243 
  Upgrading        : bash-4.4.20-2.el8.x86_64                             7/243 
  Running scriptlet: bash-4.4.20-2.el8.x86_64                             7/243 
  Upgrading        : ncurses-libs-6.1-9.20180224.el8.x86_64               8/243 
  Running scriptlet: glibc-2.28-164.el8.x86_64                            9/243 
  Upgrading        : glibc-2.28-164.el8.x86_64                            9/243 
  Running scriptlet: glibc-2.28-164.el8.x86_64                            9/243 
  Installing       : glibc-langpack-en-2.28-164.el8.x86_64               10/243 
  Upgrading        : elfutils-libelf-0.185-1.el8.x86_64                  11/243 
  Upgrading        : libcap-2.26-5.el8.x86_64                            12/243 
  Upgrading        : coreutils-single-8.30-12.el8.x86_64                 13/243 
  Upgrading        : sqlite-libs-3.26.0-15.el8.x86_64                    14/243 
  Upgrading        : libxml2-2.9.7-9.el8_4.2.x86_64                      15/243 
  Upgrading        : gpgme-1.13.1-9.el8.x86_64                           16/243 
  Upgrading        : libcom_err-1.45.6-2.el8.x86_64                      17/243 
  Running scriptlet: libcom_err-1.45.6-2.el8.x86_64                      17/243 
  Upgrading        : libstdc++-8.5.0-4.el8_5.x86_64                      18/243 
  Running scriptlet: libstdc++-8.5.0-4.el8_5.x86_64                      18/243 
  Upgrading        : libxcrypt-4.1.1-6.el8.x86_64                        19/243 
  Upgrading        : shadow-utils-2:4.6-14.el8.x86_64                    20/243 
  Upgrading        : lua-libs-5.3.4-12.el8.x86_64                        21/243 
  Upgrading        : file-libs-5.33-20.el8.x86_64                        22/243 
  Upgrading        : libsmartcols-2.32.1-28.el8.x86_64                   23/243 
  Running scriptlet: libsmartcols-2.32.1-28.el8.x86_64                   23/243 
  Upgrading        : libuuid-2.32.1-28.el8.x86_64                        24/243 
  Running scriptlet: libuuid-2.32.1-28.el8.x86_64                        24/243 
  Upgrading        : libblkid-2.32.1-28.el8.x86_64                       25/243 
  Running scriptlet: libblkid-2.32.1-28.el8.x86_64                       25/243 
  Upgrading        : libmount-2.32.1-28.el8.x86_64                       26/243 
  Running scriptlet: libmount-2.32.1-28.el8.x86_64                       26/243 
  Upgrading        : json-c-0.13.1-2.el8.x86_64                          27/243 
  Upgrading        : libcap-ng-0.7.11-1.el8.x86_64                       28/243 
  Upgrading        : libsepol-2.9-3.el8.x86_64                           29/243 
  Running scriptlet: libsepol-2.9-3.el8.x86_64                           29/243 
  Upgrading        : chkconfig-1.19.1-1.el8.x86_64                       30/243 
  Running scriptlet: ca-certificates-2021.2.50-80.0.el8_4.noarch         31/243 
  Upgrading        : ca-certificates-2021.2.50-80.0.el8_4.noarch         31/243 
  Running scriptlet: ca-certificates-2021.2.50-80.0.el8_4.noarch         31/243 
  Installing       : libgomp-8.5.0-4.el8_5.x86_64                        32/243 
  Running scriptlet: libgomp-8.5.0-4.el8_5.x86_64                        32/243 
  Upgrading        : libgcrypt-1.8.5-6.el8.x86_64                        33/243 
  Running scriptlet: libgcrypt-1.8.5-6.el8.x86_64                        33/243 
  Upgrading        : lz4-libs-1.8.3-3.el8_4.x86_64                       34/243 
  Upgrading        : systemd-libs-239-51.el8_5.2.x86_64                  35/243 
  Running scriptlet: systemd-libs-239-51.el8_5.2.x86_64                  35/243 
  Upgrading        : dbus-libs-1:1.12.8-14.el8.x86_64                    36/243 
  Running scriptlet: dbus-libs-1:1.12.8-14.el8.x86_64                    36/243 
  Installing       : grub2-common-1:2.02-106.el8.noarch                  37/243 
  Upgrading        : dbus-tools-1:1.12.8-14.el8.x86_64                   38/243 
  Upgrading        : dhcp-libs-12:4.3.6-45.el8.x86_64                    39/243 
  Upgrading        : rdma-core-35.0-1.el8.x86_64                         40/243 
  Running scriptlet: rdma-core-35.0-1.el8.x86_64                         40/243 
  Upgrading        : libfdisk-2.32.1-28.el8.x86_64                       41/243 
  Running scriptlet: libfdisk-2.32.1-28.el8.x86_64                       41/243 
  Installing       : file-5.33-20.el8.x86_64                             42/243 
  Upgrading        : libcomps-0.1.16-2.el8.x86_64                        43/243 
  Installing       : libbpf-0.4.0-1.el8.x86_64                           44/243 
  Installing       : diffutils-3.6-6.el8.x86_64                          45/243 
  Running scriptlet: diffutils-3.6-6.el8.x86_64                          45/243 
  Installing       : hardlink-1:1.3-6.el8.x86_64                         46/243 
  Installing       : memstrack-0.1.11-1.el8.x86_64                       47/243 
  Installing       : pigz-2.4-4.el8.x86_64                               48/243 
  Installing       : which-2.21-16.el8.x86_64                            49/243 
  Upgrading        : ethtool-2:5.8-7.el8.x86_64                          50/243 
  Upgrading        : keyutils-libs-1.5.10-9.el8.x86_64                   51/243 
  Upgrading        : nettle-3.4.1-7.el8.x86_64                           52/243 
  Running scriptlet: nettle-3.4.1-7.el8.x86_64                           52/243 
  Upgrading        : pcre-8.42-6.el8.x86_64                              53/243 
  Upgrading        : dnf-data-4.7.0-4.el8.noarch                         54/243 
  Upgrading        : dhcp-common-12:4.3.6-45.el8.noarch                  55/243 
  Upgrading        : dbus-common-1:1.12.8-14.el8.noarch                  56/243 
  Running scriptlet: dbus-daemon-1:1.12.8-14.el8.x86_64                  57/243 
  Upgrading        : dbus-daemon-1:1.12.8-14.el8.x86_64                  57/243 
  Running scriptlet: dbus-daemon-1:1.12.8-14.el8.x86_64                  57/243 
  Upgrading        : centos-gpg-keys-1:8-3.el8.noarch                    58/243 
  Upgrading        : centos-linux-release-8.5-1.2111.el8.noarch          59/243 
  Upgrading        : centos-linux-repos-8-3.el8.noarch                   60/243 
  Installing       : kbd-misc-2.0.4-10.el8.noarch                        61/243 
  Installing       : kbd-legacy-2.0.4-10.el8.noarch                      62/243 
  Installing       : xkeyboard-config-2.28-1.el8.noarch                  63/243 
  Installing       : libxkbcommon-0.9.1-1.el8.x86_64                     64/243 
  Installing       : grub2-tools-minimal-1:2.02-106.el8.x86_64           65/243 
  Installing       : platform-python-pip-9.0.3-20.el8.noarch             66/243 
  Upgrading        : python3-libs-3.6.8-41.el8.x86_64                    67/243 
  Upgrading        : platform-python-3.6.8-41.el8.x86_64                 68/243 
  Running scriptlet: platform-python-3.6.8-41.el8.x86_64                 68/243 
  Installing       : grubby-8.40-42.el8.x86_64                           69/243 
  Installing       : openssl-1:1.1.1k-5.el8_5.x86_64                     70/243 
  Upgrading        : krb5-libs-1.18.2-14.el8.x86_64                      71/243 
  Upgrading        : libtirpc-1.1.4-5.el8.x86_64                         72/243 
  Running scriptlet: libtirpc-1.1.4-5.el8.x86_64                         72/243 
  Upgrading        : curl-7.61.1-22.el8.x86_64                           73/243 
  Upgrading        : libcurl-minimal-7.61.1-22.el8.x86_64                74/243 
  Upgrading        : libdb-utils-5.3.28-42.el8_4.x86_64                  75/243 
  Installing       : crypto-policies-scripts-20210617-1.gitc776d3e.el    76/243 
  Upgrading        : crypto-policies-20210617-1.gitc776d3e.el8.noarch    77/243 
  Running scriptlet: crypto-policies-20210617-1.gitc776d3e.el8.noarch    77/243 
  Upgrading        : elfutils-default-yama-scope-0.185-1.el8.noarch      78/243 
  Running scriptlet: elfutils-default-yama-scope-0.185-1.el8.noarch      78/243 
  Installing       : openssl-pkcs11-0.4.10-2.el8.x86_64                  79/243 
  Upgrading        : openssl-libs-1:1.1.1k-5.el8_5.x86_64                80/243 
  Running scriptlet: openssl-libs-1:1.1.1k-5.el8_5.x86_64                80/243 
  Upgrading        : libdb-5.3.28-42.el8_4.x86_64                        81/243 
  Running scriptlet: libdb-5.3.28-42.el8_4.x86_64                        81/243 
  Upgrading        : pam-1.3.1-15.el8.x86_64                             82/243 
  Running scriptlet: pam-1.3.1-15.el8.x86_64                             82/243 
  Upgrading        : util-linux-2.32.1-28.el8.x86_64                     83/243 
  Running scriptlet: util-linux-2.32.1-28.el8.x86_64                     83/243 
  Upgrading        : kmod-25-18.el8.x86_64                               84/243 
  Upgrading        : kmod-libs-25-18.el8.x86_64                          85/243 
  Running scriptlet: kmod-libs-25-18.el8.x86_64                          85/243 
  Installing       : kbd-2.0.4-10.el8.x86_64                             86/243 
  Installing       : trousers-lib-0.3.15-1.el8.x86_64                    87/243 
  Running scriptlet: trousers-lib-0.3.15-1.el8.x86_64                    87/243 
  Installing       : gettext-libs-0.19.8.1-17.el8.x86_64                 88/243 
  Installing       : libcroco-0.6.12-4.el8_2.1.x86_64                    89/243 
  Running scriptlet: libcroco-0.6.12-4.el8_2.1.x86_64                    89/243 
  Installing       : elfutils-debuginfod-client-0.185-1.el8.x86_64       90/243 
  Upgrading        : elfutils-libs-0.185-1.el8.x86_64                    91/243 
  Installing       : kpartx-0.8.4-17.el8.x86_64                          92/243 
  Upgrading        : device-mapper-8:1.02.177-10.el8.x86_64              93/243 
  Upgrading        : device-mapper-libs-8:1.02.177-10.el8.x86_64         94/243 
  Upgrading        : rpm-4.14.3-19.el8.x86_64                            95/243 
  Upgrading        : rpm-libs-4.14.3-19.el8.x86_64                       96/243 
  Running scriptlet: rpm-libs-4.14.3-19.el8.x86_64                       96/243 
  Installing       : gettext-0.19.8.1-17.el8.x86_64                      97/243 
  Running scriptlet: gettext-0.19.8.1-17.el8.x86_64                      97/243 
  Upgrading        : glib2-2.56.4-156.el8.x86_64                         98/243 
  Installing       : shared-mime-info-1.9-3.el8.x86_64                   99/243 
  Running scriptlet: shared-mime-info-1.9-3.el8.x86_64                   99/243 
  Upgrading        : gnutls-3.6.16-4.el8.x86_64                         100/243 
  Upgrading        : systemd-pam-239-51.el8_5.2.x86_64                  101/243 
  Installing       : os-prober-1.74-9.el8.x86_64                        102/243 
  Upgrading        : dracut-049-191.git20210920.el8.x86_64              103/243 
  Running scriptlet: grub2-tools-1:2.02-106.el8.x86_64                  104/243 
  Installing       : grub2-tools-1:2.02-106.el8.x86_64                  104/243 
  Running scriptlet: grub2-tools-1:2.02-106.el8.x86_64                  104/243 
  Upgrading        : dbus-1:1.12.8-14.el8.x86_64                        105/243 
  Running scriptlet: systemd-239-51.el8_5.2.x86_64                      106/243 
  Upgrading        : systemd-239-51.el8_5.2.x86_64                      106/243 
  Running scriptlet: systemd-239-51.el8_5.2.x86_64                      106/243 
  Upgrading        : systemd-udev-239-51.el8_5.2.x86_64                 107/243 
  Running scriptlet: systemd-udev-239-51.el8_5.2.x86_64                 107/243 
  Running scriptlet: trousers-0.3.15-1.el8.x86_64                       108/243 
  Installing       : trousers-0.3.15-1.el8.x86_64                       108/243 
  Running scriptlet: trousers-0.3.15-1.el8.x86_64                       108/243 
  Upgrading        : libmodulemd-2.13.0-1.el8.x86_64                    109/243 
  Upgrading        : librepo-1.14.0-2.el8.x86_64                        110/243 
  Upgrading        : libsolv-0.7.19-1.el8.x86_64                        111/243 
  Upgrading        : libdnf-0.63.0-3.el8.x86_64                         112/243 
  Upgrading        : python3-libdnf-0.63.0-3.el8.x86_64                 113/243 
  Upgrading        : iproute-5.12.0-4.el8.x86_64                        114/243 
  Installing       : libevent-2.1.8-5.el8.x86_64                        115/243 
  Running scriptlet: unbound-libs-1.7.3-17.el8.x86_64                   116/243 
  Installing       : unbound-libs-1.7.3-17.el8.x86_64                   116/243 
  Running scriptlet: unbound-libs-1.7.3-17.el8.x86_64                   116/243 
  Installing       : python3-unbound-1.7.3-17.el8.x86_64                117/243 
  Upgrading        : python3-hawkey-0.63.0-3.el8.x86_64                 118/243 
  Upgrading        : dracut-squash-049-191.git20210920.el8.x86_64       119/243 
  Installing       : rpm-plugin-systemd-inhibit-4.14.3-19.el8.x86_64    120/243 
  Upgrading        : rpm-build-libs-4.14.3-19.el8.x86_64                121/243 
  Running scriptlet: rpm-build-libs-4.14.3-19.el8.x86_64                121/243 
  Upgrading        : python3-rpm-4.14.3-19.el8.x86_64                   122/243 
  Upgrading        : bind-export-libs-32:9.11.26-6.el8.x86_64           123/243 
  Running scriptlet: bind-export-libs-32:9.11.26-6.el8.x86_64           123/243 
  Upgrading        : dhcp-client-12:4.3.6-45.el8.x86_64                 124/243 
  Upgrading        : dracut-network-049-191.git20210920.el8.x86_64      125/243 
  Upgrading        : python3-gpg-1.13.1-9.el8.x86_64                    126/243 
  Upgrading        : python3-libcomps-0.1.16-2.el8.x86_64               127/243 
  Upgrading        : python3-dnf-4.7.0-4.el8.noarch                     128/243 
  Upgrading        : dnf-4.7.0-4.el8.noarch                             129/243 
  Running scriptlet: dnf-4.7.0-4.el8.noarch                             129/243 
  Upgrading        : yum-4.7.0-4.el8.noarch                             130/243 
  Upgrading        : kexec-tools-2.0.20-57.el8_5.1.x86_64               131/243 
  Running scriptlet: kexec-tools-2.0.20-57.el8_5.1.x86_64               131/243 
  Upgrading        : openldap-2.4.46-18.el8.x86_64                      132/243 
  Running scriptlet: tpm2-tss-2.3.2-4.el8.x86_64                        133/243 
  Upgrading        : tpm2-tss-2.3.2-4.el8.x86_64                        133/243 
  Running scriptlet: tpm2-tss-2.3.2-4.el8.x86_64                        133/243 
  Upgrading        : libibverbs-35.0-1.el8.x86_64                       134/243 
  Running scriptlet: libibverbs-35.0-1.el8.x86_64                       134/243 
  Upgrading        : binutils-2.30-108.el8_5.1.x86_64                   135/243 
  Running scriptlet: binutils-2.30-108.el8_5.1.x86_64                   135/243 
  Upgrading        : glibc-minimal-langpack-2.28-164.el8.x86_64         136/243 
  Upgrading        : iptables-libs-1.8.4-20.el8.x86_64                  137/243 
  Upgrading        : vim-minimal-2:8.0.1763-16.el8.x86_64               138/243 
  Upgrading        : hwdata-0.314-8.10.el8.noarch                       139/243 
  Running scriptlet: kexec-tools-2.0.20-46.el8.x86_64                   140/243 
  Cleanup          : kexec-tools-2.0.20-46.el8.x86_64                   140/243 
  Running scriptlet: kexec-tools-2.0.20-46.el8.x86_64                   140/243 
  Running scriptlet: binutils-2.30-93.el8.x86_64                        141/243 
  Cleanup          : binutils-2.30-93.el8.x86_64                        141/243 
  Running scriptlet: binutils-2.30-93.el8.x86_64                        141/243 
  Cleanup          : dracut-network-049-135.git20210121.el8.x86_64      142/243 
  Cleanup          : dhcp-client-12:4.3.6-44.0.1.el8.x86_64             143/243 
  Cleanup          : dhcp-libs-12:4.3.6-44.0.1.el8.x86_64               144/243 
  Cleanup          : dracut-squash-049-135.git20210121.el8.x86_64       145/243 
  Cleanup          : yum-4.4.2-11.el8.noarch                            146/243 
  Running scriptlet: dnf-4.4.2-11.el8.noarch                            147/243 
  Cleanup          : dnf-4.4.2-11.el8.noarch                            147/243 
  Running scriptlet: dnf-4.4.2-11.el8.noarch                            147/243 
  Cleanup          : python3-dnf-4.4.2-11.el8.noarch                    148/243 
  Cleanup          : centos-linux-release-8.4-1.2105.el8.noarch         149/243 
  Cleanup          : python3-hawkey-0.55.0-7.el8.x86_64                 150/243 
  Cleanup          : python3-libdnf-0.55.0-7.el8.x86_64                 151/243 
  Cleanup          : libdnf-0.55.0-7.el8.x86_64                         152/243 
  Cleanup          : dracut-049-135.git20210121.el8.x86_64              153/243 
  Cleanup          : systemd-udev-239-45.el8.x86_64                     154/243 
  Running scriptlet: systemd-udev-239-45.el8.x86_64                     154/243 
  Cleanup          : device-mapper-8:1.02.175-5.el8.x86_64              155/243 
  Cleanup          : centos-linux-repos-8-2.el8.noarch                  156/243 
  Cleanup          : centos-gpg-keys-1:8-2.el8.noarch                   157/243 
  Cleanup          : dnf-data-4.4.2-11.el8.noarch                       158/243 
  Cleanup          : dhcp-common-12:4.3.6-44.0.1.el8.noarch             159/243 
  Cleanup          : hwdata-0.314-8.8.el8.noarch                        160/243 
  Cleanup          : python3-rpm-4.14.3-13.el8.x86_64                   161/243 
  Cleanup          : rpm-build-libs-4.14.3-13.el8.x86_64                162/243 
  Running scriptlet: rpm-build-libs-4.14.3-13.el8.x86_64                162/243 
  Cleanup          : elfutils-libs-0.182-3.el8.x86_64                   163/243 
  Cleanup          : elfutils-default-yama-scope-0.182-3.el8.noarch     164/243 
  Cleanup          : dbus-1:1.12.8-12.el8.x86_64                        165/243 
  Running scriptlet: systemd-239-45.el8.x86_64                          166/243 
  Cleanup          : systemd-239-45.el8.x86_64                          166/243 
  Cleanup          : util-linux-2.32.1-27.el8.x86_64                    167/243 
  Cleanup          : systemd-pam-239-45.el8.x86_64                      168/243 
  Cleanup          : pam-1.3.1-14.el8.x86_64                            169/243 
  Running scriptlet: pam-1.3.1-14.el8.x86_64                            169/243 
  Cleanup          : libfdisk-2.32.1-27.el8.x86_64                      170/243 
  Running scriptlet: libfdisk-2.32.1-27.el8.x86_64                      170/243 
  Running scriptlet: dbus-daemon-1:1.12.8-12.el8.x86_64                 171/243 
  Cleanup          : dbus-daemon-1:1.12.8-12.el8.x86_64                 171/243 
  Running scriptlet: dbus-daemon-1:1.12.8-12.el8.x86_64                 171/243 
  Cleanup          : bind-export-libs-32:9.11.26-3.el8.x86_64           172/243 
  Running scriptlet: bind-export-libs-32:9.11.26-3.el8.x86_64           172/243 
  Cleanup          : librepo-1.12.0-3.el8.x86_64                        173/243 
  Cleanup          : libstdc++-8.4.1-1.el8.x86_64                       174/243 
  Running scriptlet: libstdc++-8.4.1-1.el8.x86_64                       174/243 
  Cleanup          : iproute-5.9.0-4.el8.x86_64                         175/243 
  Cleanup          : libibverbs-32.0-4.el8.x86_64                       176/243 
  Running scriptlet: libibverbs-32.0-4.el8.x86_64                       176/243 
  Cleanup          : device-mapper-libs-8:1.02.175-5.el8.x86_64         177/243 
  Cleanup          : kmod-libs-25-17.el8.x86_64                         178/243 
  Running scriptlet: kmod-libs-25-17.el8.x86_64                         178/243 
  Cleanup          : tpm2-tss-2.3.2-3.el8.x86_64                        179/243 
  Running scriptlet: tpm2-tss-2.3.2-3.el8.x86_64                        179/243 
  Cleanup          : openldap-2.4.46-16.el8.x86_64                      180/243 
  Cleanup          : libsmartcols-2.32.1-27.el8.x86_64                  181/243 
  Running scriptlet: libsmartcols-2.32.1-27.el8.x86_64                  181/243 
  Cleanup          : libsolv-0.7.16-2.el8.x86_64                        182/243 
  Cleanup          : kmod-25-17.el8.x86_64                              183/243 
  Cleanup          : dbus-tools-1:1.12.8-12.el8.x86_64                  184/243 
  Cleanup          : dbus-libs-1:1.12.8-12.el8.x86_64                   185/243 
  Running scriptlet: dbus-libs-1:1.12.8-12.el8.x86_64                   185/243 
  Cleanup          : python3-gpg-1.13.1-7.el8.x86_64                    186/243 
  Cleanup          : rdma-core-32.0-4.el8.x86_64                        187/243 
  Cleanup          : systemd-libs-239-45.el8.x86_64                     188/243 
  Cleanup          : shadow-utils-2:4.6-12.el8.x86_64                   189/243 
  Cleanup          : libmodulemd-2.9.4-2.el8.x86_64                     190/243 
  Cleanup          : glib2-2.56.4-9.el8.x86_64                          191/243 
  Cleanup          : libmount-2.32.1-27.el8.x86_64                      192/243 
  Running scriptlet: libmount-2.32.1-27.el8.x86_64                      192/243 
  Cleanup          : rpm-4.14.3-13.el8.x86_64                           193/243 
  Cleanup          : rpm-libs-4.14.3-13.el8.x86_64                      194/243 
  Running scriptlet: rpm-libs-4.14.3-13.el8.x86_64                      194/243 
  Cleanup          : gnutls-3.6.14-7.el8_3.x86_64                       195/243 
  Cleanup          : libblkid-2.32.1-27.el8.x86_64                      196/243 
  Running scriptlet: libblkid-2.32.1-27.el8.x86_64                      196/243 
  Cleanup          : curl-7.61.1-18.el8.x86_64                          197/243 
  Cleanup          : libcurl-minimal-7.61.1-18.el8.x86_64               198/243 
  Cleanup          : libuuid-2.32.1-27.el8.x86_64                       199/243 
  Running scriptlet: libuuid-2.32.1-27.el8.x86_64                       199/243 
  Cleanup          : lua-libs-5.3.4-11.el8.x86_64                       200/243 
  Cleanup          : libdb-utils-5.3.28-40.el8.x86_64                   201/243 
  Cleanup          : libdb-5.3.28-40.el8.x86_64                         202/243 
  Running scriptlet: libdb-5.3.28-40.el8.x86_64                         202/243 
  Cleanup          : gpgme-1.13.1-7.el8.x86_64                          203/243 
  Cleanup          : iptables-libs-1.8.4-17.el8.x86_64                  204/243 
  Cleanup          : python3-libcomps-0.1.11-5.el8.x86_64               205/243 
  Cleanup          : python3-libs-3.6.8-37.el8.x86_64                   206/243 
  Cleanup          : platform-python-3.6.8-37.el8.x86_64                207/243 
  Running scriptlet: platform-python-3.6.8-37.el8.x86_64                207/243 
  Cleanup          : libtirpc-1.1.4-4.el8.x86_64                        208/243 
  Running scriptlet: libtirpc-1.1.4-4.el8.x86_64                        208/243 
  Cleanup          : krb5-libs-1.18.2-8.el8.x86_64                      209/243 
  Cleanup          : openssl-libs-1:1.1.1g-15.el8_3.x86_64              210/243 
  Running scriptlet: openssl-libs-1:1.1.1g-15.el8_3.x86_64              210/243 
  Cleanup          : libcomps-0.1.11-5.el8.x86_64                       211/243 
  Cleanup          : libxml2-2.9.7-9.el8.x86_64                         212/243 
  Cleanup          : sqlite-libs-3.26.0-13.el8.x86_64                   213/243 
  Cleanup          : libcom_err-1.45.6-1.el8.x86_64                     214/243 
  Running scriptlet: libcom_err-1.45.6-1.el8.x86_64                     214/243 
  Cleanup          : file-libs-5.33-16.el8_3.1.x86_64                   215/243 
  Cleanup          : libgcrypt-1.8.5-4.el8.x86_64                       216/243 
  Running scriptlet: libgcrypt-1.8.5-4.el8.x86_64                       216/243 
  Cleanup          : vim-minimal-2:8.0.1763-15.el8.x86_64               217/243 
  Cleanup          : chkconfig-1.13-2.el8.x86_64                        218/243 
  Cleanup          : libsepol-2.9-2.el8.x86_64                          219/243 
  Running scriptlet: libsepol-2.9-2.el8.x86_64                          219/243 
  Running scriptlet: nettle-3.4.1-2.el8.x86_64                          220/243 
  Cleanup          : nettle-3.4.1-2.el8.x86_64                          220/243 
  Running scriptlet: nettle-3.4.1-2.el8.x86_64                          220/243 
  Cleanup          : libcap-ng-0.7.9-5.el8.x86_64                       221/243 
  Cleanup          : json-c-0.13.1-0.4.el8.x86_64                       222/243 
  Cleanup          : ethtool-2:5.8-5.el8.x86_64                         223/243 
  Cleanup          : ca-certificates-2020.2.41-80.0.el8_2.noarch        224/243 
  Cleanup          : crypto-policies-20210209-1.gitbfb6bed.el8_3.noar   225/243 
  Cleanup          : python3-pip-wheel-9.0.3-19.el8.noarch              226/243 
  Cleanup          : dbus-common-1:1.12.8-12.el8.noarch                 227/243 
  Cleanup          : coreutils-single-8.30-8.el8.x86_64                 228/243 
  Cleanup          : libcap-2.26-4.el8.x86_64                           229/243 
  Cleanup          : pcre-8.42-4.el8.x86_64                             230/243 
  Cleanup          : keyutils-libs-1.5.10-6.el8.x86_64                  231/243 
  Cleanup          : libxcrypt-4.1.1-4.el8.x86_64                       232/243 
  Cleanup          : elfutils-libelf-0.182-3.el8.x86_64                 233/243 
  Cleanup          : lz4-libs-1.8.3-2.el8.x86_64                        234/243 
  Cleanup          : ncurses-libs-6.1-7.20180224.el8.x86_64             235/243 
  Cleanup          : glibc-common-2.28-151.el8.x86_64                   236/243 
  Cleanup          : bash-4.4.19-14.el8.x86_64                          237/243 
  Running scriptlet: bash-4.4.19-14.el8.x86_64                          237/243 
  Cleanup          : glibc-2.28-151.el8.x86_64                          238/243 
  Cleanup          : glibc-minimal-langpack-2.28-151.el8.x86_64         239/243 
  Cleanup          : filesystem-3.8-3.el8.x86_64                        240/243 
  Cleanup          : tzdata-2021a-1.el8.noarch                          241/243 
  Cleanup          : ncurses-base-6.1-7.20180224.el8.noarch             242/243 
  Cleanup          : libgcc-8.4.1-1.el8.x86_64                          243/243 
  Running scriptlet: libgcc-8.4.1-1.el8.x86_64                          243/243 
  Running scriptlet: filesystem-3.8-6.el8.x86_64                        243/243 
  Running scriptlet: ca-certificates-2021.2.50-80.0.el8_4.noarch        243/243 
  Running scriptlet: crypto-policies-scripts-20210617-1.gitc776d3e.el   243/243 
  Running scriptlet: libgcc-8.4.1-1.el8.x86_64                          243/243 
  Running scriptlet: glibc-common-2.28-164.el8.x86_64                   243/243 
  Running scriptlet: glib2-2.56.4-156.el8.x86_64                        243/243 
  Running scriptlet: shared-mime-info-1.9-3.el8.x86_64                  243/243 
  Running scriptlet: systemd-239-51.el8_5.2.x86_64                      243/243 
  Running scriptlet: systemd-udev-239-51.el8_5.2.x86_64                 243/243 
  Verifying        : libxkbcommon-0.9.1-1.el8.x86_64                      1/243 
  Verifying        : python3-unbound-1.7.3-17.el8.x86_64                  2/243 
  Verifying        : unbound-libs-1.7.3-17.el8.x86_64                     3/243 
  Verifying        : xkeyboard-config-2.28-1.el8.noarch                   4/243 
  Verifying        : crypto-policies-scripts-20210617-1.gitc776d3e.el     5/243 
  Verifying        : diffutils-3.6-6.el8.x86_64                           6/243 
  Verifying        : elfutils-debuginfod-client-0.185-1.el8.x86_64        7/243 
  Verifying        : file-5.33-20.el8.x86_64                              8/243 
  Verifying        : gettext-0.19.8.1-17.el8.x86_64                       9/243 
  Verifying        : gettext-libs-0.19.8.1-17.el8.x86_64                 10/243 
  Verifying        : glibc-langpack-en-2.28-164.el8.x86_64               11/243 
  Verifying        : grub2-common-1:2.02-106.el8.noarch                  12/243 
  Verifying        : grub2-tools-1:2.02-106.el8.x86_64                   13/243 
  Verifying        : grub2-tools-minimal-1:2.02-106.el8.x86_64           14/243 
  Verifying        : grubby-8.40-42.el8.x86_64                           15/243 
  Verifying        : hardlink-1:1.3-6.el8.x86_64                         16/243 
  Verifying        : kbd-2.0.4-10.el8.x86_64                             17/243 
  Verifying        : kbd-legacy-2.0.4-10.el8.noarch                      18/243 
  Verifying        : kbd-misc-2.0.4-10.el8.noarch                        19/243 
  Verifying        : kpartx-0.8.4-17.el8.x86_64                          20/243 
  Verifying        : libbpf-0.4.0-1.el8.x86_64                           21/243 
  Verifying        : libcroco-0.6.12-4.el8_2.1.x86_64                    22/243 
  Verifying        : libevent-2.1.8-5.el8.x86_64                         23/243 
  Verifying        : libgomp-8.5.0-4.el8_5.x86_64                        24/243 
  Verifying        : memstrack-0.1.11-1.el8.x86_64                       25/243 
  Verifying        : openssl-1:1.1.1k-5.el8_5.x86_64                     26/243 
  Verifying        : openssl-pkcs11-0.4.10-2.el8.x86_64                  27/243 
  Verifying        : os-prober-1.74-9.el8.x86_64                         28/243 
  Verifying        : pigz-2.4-4.el8.x86_64                               29/243 
  Verifying        : platform-python-pip-9.0.3-20.el8.noarch             30/243 
  Verifying        : rpm-plugin-systemd-inhibit-4.14.3-19.el8.x86_64     31/243 
  Verifying        : shared-mime-info-1.9-3.el8.x86_64                   32/243 
  Verifying        : trousers-0.3.15-1.el8.x86_64                        33/243 
  Verifying        : trousers-lib-0.3.15-1.el8.x86_64                    34/243 
  Verifying        : which-2.21-16.el8.x86_64                            35/243 
  Verifying        : bash-4.4.20-2.el8.x86_64                            36/243 
  Verifying        : bash-4.4.19-14.el8.x86_64                           37/243 
  Verifying        : bind-export-libs-32:9.11.26-6.el8.x86_64            38/243 
  Verifying        : bind-export-libs-32:9.11.26-3.el8.x86_64            39/243 
  Verifying        : binutils-2.30-108.el8_5.1.x86_64                    40/243 
  Verifying        : binutils-2.30-93.el8.x86_64                         41/243 
  Verifying        : ca-certificates-2021.2.50-80.0.el8_4.noarch         42/243 
  Verifying        : ca-certificates-2020.2.41-80.0.el8_2.noarch         43/243 
  Verifying        : centos-gpg-keys-1:8-3.el8.noarch                    44/243 
  Verifying        : centos-gpg-keys-1:8-2.el8.noarch                    45/243 
  Verifying        : centos-linux-release-8.5-1.2111.el8.noarch          46/243 
  Verifying        : centos-linux-release-8.4-1.2105.el8.noarch          47/243 
  Verifying        : centos-linux-repos-8-3.el8.noarch                   48/243 
  Verifying        : centos-linux-repos-8-2.el8.noarch                   49/243 
  Verifying        : chkconfig-1.19.1-1.el8.x86_64                       50/243 
  Verifying        : chkconfig-1.13-2.el8.x86_64                         51/243 
  Verifying        : coreutils-single-8.30-12.el8.x86_64                 52/243 
  Verifying        : coreutils-single-8.30-8.el8.x86_64                  53/243 
  Verifying        : crypto-policies-20210617-1.gitc776d3e.el8.noarch    54/243 
  Verifying        : crypto-policies-20210209-1.gitbfb6bed.el8_3.noar    55/243 
  Verifying        : curl-7.61.1-22.el8.x86_64                           56/243 
  Verifying        : curl-7.61.1-18.el8.x86_64                           57/243 
  Verifying        : dbus-1:1.12.8-14.el8.x86_64                         58/243 
  Verifying        : dbus-1:1.12.8-12.el8.x86_64                         59/243 
  Verifying        : dbus-common-1:1.12.8-14.el8.noarch                  60/243 
  Verifying        : dbus-common-1:1.12.8-12.el8.noarch                  61/243 
  Verifying        : dbus-daemon-1:1.12.8-14.el8.x86_64                  62/243 
  Verifying        : dbus-daemon-1:1.12.8-12.el8.x86_64                  63/243 
  Verifying        : dbus-libs-1:1.12.8-14.el8.x86_64                    64/243 
  Verifying        : dbus-libs-1:1.12.8-12.el8.x86_64                    65/243 
  Verifying        : dbus-tools-1:1.12.8-14.el8.x86_64                   66/243 
  Verifying        : dbus-tools-1:1.12.8-12.el8.x86_64                   67/243 
  Verifying        : device-mapper-8:1.02.177-10.el8.x86_64              68/243 
  Verifying        : device-mapper-8:1.02.175-5.el8.x86_64               69/243 
  Verifying        : device-mapper-libs-8:1.02.177-10.el8.x86_64         70/243 
  Verifying        : device-mapper-libs-8:1.02.175-5.el8.x86_64          71/243 
  Verifying        : dhcp-client-12:4.3.6-45.el8.x86_64                  72/243 
  Verifying        : dhcp-client-12:4.3.6-44.0.1.el8.x86_64              73/243 
  Verifying        : dhcp-common-12:4.3.6-45.el8.noarch                  74/243 
  Verifying        : dhcp-common-12:4.3.6-44.0.1.el8.noarch              75/243 
  Verifying        : dhcp-libs-12:4.3.6-45.el8.x86_64                    76/243 
  Verifying        : dhcp-libs-12:4.3.6-44.0.1.el8.x86_64                77/243 
  Verifying        : dnf-4.7.0-4.el8.noarch                              78/243 
  Verifying        : dnf-4.4.2-11.el8.noarch                             79/243 
  Verifying        : dnf-data-4.7.0-4.el8.noarch                         80/243 
  Verifying        : dnf-data-4.4.2-11.el8.noarch                        81/243 
  Verifying        : dracut-049-191.git20210920.el8.x86_64               82/243 
  Verifying        : dracut-049-135.git20210121.el8.x86_64               83/243 
  Verifying        : dracut-network-049-191.git20210920.el8.x86_64       84/243 
  Verifying        : dracut-network-049-135.git20210121.el8.x86_64       85/243 
  Verifying        : dracut-squash-049-191.git20210920.el8.x86_64        86/243 
  Verifying        : dracut-squash-049-135.git20210121.el8.x86_64        87/243 
  Verifying        : elfutils-default-yama-scope-0.185-1.el8.noarch      88/243 
  Verifying        : elfutils-default-yama-scope-0.182-3.el8.noarch      89/243 
  Verifying        : elfutils-libelf-0.185-1.el8.x86_64                  90/243 
  Verifying        : elfutils-libelf-0.182-3.el8.x86_64                  91/243 
  Verifying        : elfutils-libs-0.185-1.el8.x86_64                    92/243 
  Verifying        : elfutils-libs-0.182-3.el8.x86_64                    93/243 
  Verifying        : ethtool-2:5.8-7.el8.x86_64                          94/243 
  Verifying        : ethtool-2:5.8-5.el8.x86_64                          95/243 
  Verifying        : file-libs-5.33-20.el8.x86_64                        96/243 
  Verifying        : file-libs-5.33-16.el8_3.1.x86_64                    97/243 
  Verifying        : filesystem-3.8-6.el8.x86_64                         98/243 
  Verifying        : filesystem-3.8-3.el8.x86_64                         99/243 
  Verifying        : glib2-2.56.4-156.el8.x86_64                        100/243 
  Verifying        : glib2-2.56.4-9.el8.x86_64                          101/243 
  Verifying        : glibc-2.28-164.el8.x86_64                          102/243 
  Verifying        : glibc-2.28-151.el8.x86_64                          103/243 
  Verifying        : glibc-common-2.28-164.el8.x86_64                   104/243 
  Verifying        : glibc-common-2.28-151.el8.x86_64                   105/243 
  Verifying        : glibc-minimal-langpack-2.28-164.el8.x86_64         106/243 
  Verifying        : glibc-minimal-langpack-2.28-151.el8.x86_64         107/243 
  Verifying        : gnutls-3.6.16-4.el8.x86_64                         108/243 
  Verifying        : gnutls-3.6.14-7.el8_3.x86_64                       109/243 
  Verifying        : gpgme-1.13.1-9.el8.x86_64                          110/243 
  Verifying        : gpgme-1.13.1-7.el8.x86_64                          111/243 
  Verifying        : hwdata-0.314-8.10.el8.noarch                       112/243 
  Verifying        : hwdata-0.314-8.8.el8.noarch                        113/243 
  Verifying        : iproute-5.12.0-4.el8.x86_64                        114/243 
  Verifying        : iproute-5.9.0-4.el8.x86_64                         115/243 
  Verifying        : iptables-libs-1.8.4-20.el8.x86_64                  116/243 
  Verifying        : iptables-libs-1.8.4-17.el8.x86_64                  117/243 
  Verifying        : json-c-0.13.1-2.el8.x86_64                         118/243 
  Verifying        : json-c-0.13.1-0.4.el8.x86_64                       119/243 
  Verifying        : kexec-tools-2.0.20-57.el8_5.1.x86_64               120/243 
  Verifying        : kexec-tools-2.0.20-46.el8.x86_64                   121/243 
  Verifying        : keyutils-libs-1.5.10-9.el8.x86_64                  122/243 
  Verifying        : keyutils-libs-1.5.10-6.el8.x86_64                  123/243 
  Verifying        : kmod-25-18.el8.x86_64                              124/243 
  Verifying        : kmod-25-17.el8.x86_64                              125/243 
  Verifying        : kmod-libs-25-18.el8.x86_64                         126/243 
  Verifying        : kmod-libs-25-17.el8.x86_64                         127/243 
  Verifying        : krb5-libs-1.18.2-14.el8.x86_64                     128/243 
  Verifying        : krb5-libs-1.18.2-8.el8.x86_64                      129/243 
  Verifying        : libblkid-2.32.1-28.el8.x86_64                      130/243 
  Verifying        : libblkid-2.32.1-27.el8.x86_64                      131/243 
  Verifying        : libcap-2.26-5.el8.x86_64                           132/243 
  Verifying        : libcap-2.26-4.el8.x86_64                           133/243 
  Verifying        : libcap-ng-0.7.11-1.el8.x86_64                      134/243 
  Verifying        : libcap-ng-0.7.9-5.el8.x86_64                       135/243 
  Verifying        : libcom_err-1.45.6-2.el8.x86_64                     136/243 
  Verifying        : libcom_err-1.45.6-1.el8.x86_64                     137/243 
  Verifying        : libcomps-0.1.16-2.el8.x86_64                       138/243 
  Verifying        : libcomps-0.1.11-5.el8.x86_64                       139/243 
  Verifying        : libcurl-minimal-7.61.1-22.el8.x86_64               140/243 
  Verifying        : libcurl-minimal-7.61.1-18.el8.x86_64               141/243 
  Verifying        : libdb-5.3.28-42.el8_4.x86_64                       142/243 
  Verifying        : libdb-5.3.28-40.el8.x86_64                         143/243 
  Verifying        : libdb-utils-5.3.28-42.el8_4.x86_64                 144/243 
  Verifying        : libdb-utils-5.3.28-40.el8.x86_64                   145/243 
  Verifying        : libdnf-0.63.0-3.el8.x86_64                         146/243 
  Verifying        : libdnf-0.55.0-7.el8.x86_64                         147/243 
  Verifying        : libfdisk-2.32.1-28.el8.x86_64                      148/243 
  Verifying        : libfdisk-2.32.1-27.el8.x86_64                      149/243 
  Verifying        : libgcc-8.5.0-4.el8_5.x86_64                        150/243 
  Verifying        : libgcc-8.4.1-1.el8.x86_64                          151/243 
  Verifying        : libgcrypt-1.8.5-6.el8.x86_64                       152/243 
  Verifying        : libgcrypt-1.8.5-4.el8.x86_64                       153/243 
  Verifying        : libibverbs-35.0-1.el8.x86_64                       154/243 
  Verifying        : libibverbs-32.0-4.el8.x86_64                       155/243 
  Verifying        : libmodulemd-2.13.0-1.el8.x86_64                    156/243 
  Verifying        : libmodulemd-2.9.4-2.el8.x86_64                     157/243 
  Verifying        : libmount-2.32.1-28.el8.x86_64                      158/243 
  Verifying        : libmount-2.32.1-27.el8.x86_64                      159/243 
  Verifying        : librepo-1.14.0-2.el8.x86_64                        160/243 
  Verifying        : librepo-1.12.0-3.el8.x86_64                        161/243 
  Verifying        : libsepol-2.9-3.el8.x86_64                          162/243 
  Verifying        : libsepol-2.9-2.el8.x86_64                          163/243 
  Verifying        : libsmartcols-2.32.1-28.el8.x86_64                  164/243 
  Verifying        : libsmartcols-2.32.1-27.el8.x86_64                  165/243 
  Verifying        : libsolv-0.7.19-1.el8.x86_64                        166/243 
  Verifying        : libsolv-0.7.16-2.el8.x86_64                        167/243 
  Verifying        : libstdc++-8.5.0-4.el8_5.x86_64                     168/243 
  Verifying        : libstdc++-8.4.1-1.el8.x86_64                       169/243 
  Verifying        : libtirpc-1.1.4-5.el8.x86_64                        170/243 
  Verifying        : libtirpc-1.1.4-4.el8.x86_64                        171/243 
  Verifying        : libuuid-2.32.1-28.el8.x86_64                       172/243 
  Verifying        : libuuid-2.32.1-27.el8.x86_64                       173/243 
  Verifying        : libxcrypt-4.1.1-6.el8.x86_64                       174/243 
  Verifying        : libxcrypt-4.1.1-4.el8.x86_64                       175/243 
  Verifying        : libxml2-2.9.7-9.el8_4.2.x86_64                     176/243 
  Verifying        : libxml2-2.9.7-9.el8.x86_64                         177/243 
  Verifying        : lua-libs-5.3.4-12.el8.x86_64                       178/243 
  Verifying        : lua-libs-5.3.4-11.el8.x86_64                       179/243 
  Verifying        : lz4-libs-1.8.3-3.el8_4.x86_64                      180/243 
  Verifying        : lz4-libs-1.8.3-2.el8.x86_64                        181/243 
  Verifying        : ncurses-base-6.1-9.20180224.el8.noarch             182/243 
  Verifying        : ncurses-base-6.1-7.20180224.el8.noarch             183/243 
  Verifying        : ncurses-libs-6.1-9.20180224.el8.x86_64             184/243 
  Verifying        : ncurses-libs-6.1-7.20180224.el8.x86_64             185/243 
  Verifying        : nettle-3.4.1-7.el8.x86_64                          186/243 
  Verifying        : nettle-3.4.1-2.el8.x86_64                          187/243 
  Verifying        : openldap-2.4.46-18.el8.x86_64                      188/243 
  Verifying        : openldap-2.4.46-16.el8.x86_64                      189/243 
  Verifying        : openssl-libs-1:1.1.1k-5.el8_5.x86_64               190/243 
  Verifying        : openssl-libs-1:1.1.1g-15.el8_3.x86_64              191/243 
  Verifying        : pam-1.3.1-15.el8.x86_64                            192/243 
  Verifying        : pam-1.3.1-14.el8.x86_64                            193/243 
  Verifying        : pcre-8.42-6.el8.x86_64                             194/243 
  Verifying        : pcre-8.42-4.el8.x86_64                             195/243 
  Verifying        : platform-python-3.6.8-41.el8.x86_64                196/243 
  Verifying        : platform-python-3.6.8-37.el8.x86_64                197/243 
  Verifying        : python3-dnf-4.7.0-4.el8.noarch                     198/243 
  Verifying        : python3-dnf-4.4.2-11.el8.noarch                    199/243 
  Verifying        : python3-gpg-1.13.1-9.el8.x86_64                    200/243 
  Verifying        : python3-gpg-1.13.1-7.el8.x86_64                    201/243 
  Verifying        : python3-hawkey-0.63.0-3.el8.x86_64                 202/243 
  Verifying        : python3-hawkey-0.55.0-7.el8.x86_64                 203/243 
  Verifying        : python3-libcomps-0.1.16-2.el8.x86_64               204/243 
  Verifying        : python3-libcomps-0.1.11-5.el8.x86_64               205/243 
  Verifying        : python3-libdnf-0.63.0-3.el8.x86_64                 206/243 
  Verifying        : python3-libdnf-0.55.0-7.el8.x86_64                 207/243 
  Verifying        : python3-libs-3.6.8-41.el8.x86_64                   208/243 
  Verifying        : python3-libs-3.6.8-37.el8.x86_64                   209/243 
  Verifying        : python3-pip-wheel-9.0.3-20.el8.noarch              210/243 
  Verifying        : python3-pip-wheel-9.0.3-19.el8.noarch              211/243 
  Verifying        : python3-rpm-4.14.3-19.el8.x86_64                   212/243 
  Verifying        : python3-rpm-4.14.3-13.el8.x86_64                   213/243 
  Verifying        : rdma-core-35.0-1.el8.x86_64                        214/243 
  Verifying        : rdma-core-32.0-4.el8.x86_64                        215/243 
  Verifying        : rpm-4.14.3-19.el8.x86_64                           216/243 
  Verifying        : rpm-4.14.3-13.el8.x86_64                           217/243 
  Verifying        : rpm-build-libs-4.14.3-19.el8.x86_64                218/243 
  Verifying        : rpm-build-libs-4.14.3-13.el8.x86_64                219/243 
  Verifying        : rpm-libs-4.14.3-19.el8.x86_64                      220/243 
  Verifying        : rpm-libs-4.14.3-13.el8.x86_64                      221/243 
  Verifying        : shadow-utils-2:4.6-14.el8.x86_64                   222/243 
  Verifying        : shadow-utils-2:4.6-12.el8.x86_64                   223/243 
  Verifying        : sqlite-libs-3.26.0-15.el8.x86_64                   224/243 
  Verifying        : sqlite-libs-3.26.0-13.el8.x86_64                   225/243 
  Verifying        : systemd-239-51.el8_5.2.x86_64                      226/243 
  Verifying        : systemd-239-45.el8.x86_64                          227/243 
  Verifying        : systemd-libs-239-51.el8_5.2.x86_64                 228/243 
  Verifying        : systemd-libs-239-45.el8.x86_64                     229/243 
  Verifying        : systemd-pam-239-51.el8_5.2.x86_64                  230/243 
  Verifying        : systemd-pam-239-45.el8.x86_64                      231/243 
  Verifying        : systemd-udev-239-51.el8_5.2.x86_64                 232/243 
  Verifying        : systemd-udev-239-45.el8.x86_64                     233/243 
  Verifying        : tpm2-tss-2.3.2-4.el8.x86_64                        234/243 
  Verifying        : tpm2-tss-2.3.2-3.el8.x86_64                        235/243 
  Verifying        : tzdata-2021e-1.el8.noarch                          236/243 
  Verifying        : tzdata-2021a-1.el8.noarch                          237/243 
  Verifying        : util-linux-2.32.1-28.el8.x86_64                    238/243 
  Verifying        : util-linux-2.32.1-27.el8.x86_64                    239/243 
  Verifying        : vim-minimal-2:8.0.1763-16.el8.x86_64               240/243 
  Verifying        : vim-minimal-2:8.0.1763-15.el8.x86_64               241/243 
  Verifying        : yum-4.7.0-4.el8.noarch                             242/243 
  Verifying        : yum-4.4.2-11.el8.noarch                            243/243 

Upgraded:
  bash-4.4.20-2.el8.x86_64                                                      
  bind-export-libs-32:9.11.26-6.el8.x86_64                                      
  binutils-2.30-108.el8_5.1.x86_64                                              
  ca-certificates-2021.2.50-80.0.el8_4.noarch                                   
  centos-gpg-keys-1:8-3.el8.noarch                                              
  centos-linux-release-8.5-1.2111.el8.noarch                                    
  centos-linux-repos-8-3.el8.noarch                                             
  chkconfig-1.19.1-1.el8.x86_64                                                 
  coreutils-single-8.30-12.el8.x86_64                                           
  crypto-policies-20210617-1.gitc776d3e.el8.noarch                              
  curl-7.61.1-22.el8.x86_64                                                     
  dbus-1:1.12.8-14.el8.x86_64                                                   
  dbus-common-1:1.12.8-14.el8.noarch                                            
  dbus-daemon-1:1.12.8-14.el8.x86_64                                            
  dbus-libs-1:1.12.8-14.el8.x86_64                                              
  dbus-tools-1:1.12.8-14.el8.x86_64                                             
  device-mapper-8:1.02.177-10.el8.x86_64                                        
  device-mapper-libs-8:1.02.177-10.el8.x86_64                                   
  dhcp-client-12:4.3.6-45.el8.x86_64                                            
  dhcp-common-12:4.3.6-45.el8.noarch                                            
  dhcp-libs-12:4.3.6-45.el8.x86_64                                              
  dnf-4.7.0-4.el8.noarch                                                        
  dnf-data-4.7.0-4.el8.noarch                                                   
  dracut-049-191.git20210920.el8.x86_64                                         
  dracut-network-049-191.git20210920.el8.x86_64                                 
  dracut-squash-049-191.git20210920.el8.x86_64                                  
  elfutils-default-yama-scope-0.185-1.el8.noarch                                
  elfutils-libelf-0.185-1.el8.x86_64                                            
  elfutils-libs-0.185-1.el8.x86_64                                              
  ethtool-2:5.8-7.el8.x86_64                                                    
  file-libs-5.33-20.el8.x86_64                                                  
  filesystem-3.8-6.el8.x86_64                                                   
  glib2-2.56.4-156.el8.x86_64                                                   
  glibc-2.28-164.el8.x86_64                                                     
  glibc-common-2.28-164.el8.x86_64                                              
  glibc-minimal-langpack-2.28-164.el8.x86_64                                    
  gnutls-3.6.16-4.el8.x86_64                                                    
  gpgme-1.13.1-9.el8.x86_64                                                     
  hwdata-0.314-8.10.el8.noarch                                                  
  iproute-5.12.0-4.el8.x86_64                                                   
  iptables-libs-1.8.4-20.el8.x86_64                                             
  json-c-0.13.1-2.el8.x86_64                                                    
  kexec-tools-2.0.20-57.el8_5.1.x86_64                                          
  keyutils-libs-1.5.10-9.el8.x86_64                                             
  kmod-25-18.el8.x86_64                                                         
  kmod-libs-25-18.el8.x86_64                                                    
  krb5-libs-1.18.2-14.el8.x86_64                                                
  libblkid-2.32.1-28.el8.x86_64                                                 
  libcap-2.26-5.el8.x86_64                                                      
  libcap-ng-0.7.11-1.el8.x86_64                                                 
  libcom_err-1.45.6-2.el8.x86_64                                                
  libcomps-0.1.16-2.el8.x86_64                                                  
  libcurl-minimal-7.61.1-22.el8.x86_64                                          
  libdb-5.3.28-42.el8_4.x86_64                                                  
  libdb-utils-5.3.28-42.el8_4.x86_64                                            
  libdnf-0.63.0-3.el8.x86_64                                                    
  libfdisk-2.32.1-28.el8.x86_64                                                 
  libgcc-8.5.0-4.el8_5.x86_64                                                   
  libgcrypt-1.8.5-6.el8.x86_64                                                  
  libibverbs-35.0-1.el8.x86_64                                                  
  libmodulemd-2.13.0-1.el8.x86_64                                               
  libmount-2.32.1-28.el8.x86_64                                                 
  librepo-1.14.0-2.el8.x86_64                                                   
  libsepol-2.9-3.el8.x86_64                                                     
  libsmartcols-2.32.1-28.el8.x86_64                                             
  libsolv-0.7.19-1.el8.x86_64                                                   
  libstdc++-8.5.0-4.el8_5.x86_64                                                
  libtirpc-1.1.4-5.el8.x86_64                                                   
  libuuid-2.32.1-28.el8.x86_64                                                  
  libxcrypt-4.1.1-6.el8.x86_64                                                  
  libxml2-2.9.7-9.el8_4.2.x86_64                                                
  lua-libs-5.3.4-12.el8.x86_64                                                  
  lz4-libs-1.8.3-3.el8_4.x86_64                                                 
  ncurses-base-6.1-9.20180224.el8.noarch                                        
  ncurses-libs-6.1-9.20180224.el8.x86_64                                        
  nettle-3.4.1-7.el8.x86_64                                                     
  openldap-2.4.46-18.el8.x86_64                                                 
  openssl-libs-1:1.1.1k-5.el8_5.x86_64                                          
  pam-1.3.1-15.el8.x86_64                                                       
  pcre-8.42-6.el8.x86_64                                                        
  platform-python-3.6.8-41.el8.x86_64                                           
  python3-dnf-4.7.0-4.el8.noarch                                                
  python3-gpg-1.13.1-9.el8.x86_64                                               
  python3-hawkey-0.63.0-3.el8.x86_64                                            
  python3-libcomps-0.1.16-2.el8.x86_64                                          
  python3-libdnf-0.63.0-3.el8.x86_64                                            
  python3-libs-3.6.8-41.el8.x86_64                                              
  python3-pip-wheel-9.0.3-20.el8.noarch                                         
  python3-rpm-4.14.3-19.el8.x86_64                                              
  rdma-core-35.0-1.el8.x86_64                                                   
  rpm-4.14.3-19.el8.x86_64                                                      
  rpm-build-libs-4.14.3-19.el8.x86_64                                           
  rpm-libs-4.14.3-19.el8.x86_64                                                 
  shadow-utils-2:4.6-14.el8.x86_64                                              
  sqlite-libs-3.26.0-15.el8.x86_64                                              
  systemd-239-51.el8_5.2.x86_64                                                 
  systemd-libs-239-51.el8_5.2.x86_64                                            
  systemd-pam-239-51.el8_5.2.x86_64                                             
  systemd-udev-239-51.el8_5.2.x86_64                                            
  tpm2-tss-2.3.2-4.el8.x86_64                                                   
  tzdata-2021e-1.el8.noarch                                                     
  util-linux-2.32.1-28.el8.x86_64                                               
  vim-minimal-2:8.0.1763-16.el8.x86_64                                          
  yum-4.7.0-4.el8.noarch                                                        
Installed:
  crypto-policies-scripts-20210617-1.gitc776d3e.el8.noarch                      
  diffutils-3.6-6.el8.x86_64                                                    
  elfutils-debuginfod-client-0.185-1.el8.x86_64                                 
  file-5.33-20.el8.x86_64                                                       
  gettext-0.19.8.1-17.el8.x86_64                                                
  gettext-libs-0.19.8.1-17.el8.x86_64                                           
  glibc-langpack-en-2.28-164.el8.x86_64                                         
  grub2-common-1:2.02-106.el8.noarch                                            
  grub2-tools-1:2.02-106.el8.x86_64                                             
  grub2-tools-minimal-1:2.02-106.el8.x86_64                                     
  grubby-8.40-42.el8.x86_64                                                     
  hardlink-1:1.3-6.el8.x86_64                                                   
  kbd-2.0.4-10.el8.x86_64                                                       
  kbd-legacy-2.0.4-10.el8.noarch                                                
  kbd-misc-2.0.4-10.el8.noarch                                                  
  kpartx-0.8.4-17.el8.x86_64                                                    
  libbpf-0.4.0-1.el8.x86_64                                                     
  libcroco-0.6.12-4.el8_2.1.x86_64                                              
  libevent-2.1.8-5.el8.x86_64                                                   
  libgomp-8.5.0-4.el8_5.x86_64                                                  
  libxkbcommon-0.9.1-1.el8.x86_64                                               
  memstrack-0.1.11-1.el8.x86_64                                                 
  openssl-1:1.1.1k-5.el8_5.x86_64                                               
  openssl-pkcs11-0.4.10-2.el8.x86_64                                            
  os-prober-1.74-9.el8.x86_64                                                   
  pigz-2.4-4.el8.x86_64                                                         
  platform-python-pip-9.0.3-20.el8.noarch                                       
  python3-unbound-1.7.3-17.el8.x86_64                                           
  rpm-plugin-systemd-inhibit-4.14.3-19.el8.x86_64                               
  shared-mime-info-1.9-3.el8.x86_64                                             
  trousers-0.3.15-1.el8.x86_64                                                  
  trousers-lib-0.3.15-1.el8.x86_64                                              
  unbound-libs-1.7.3-17.el8.x86_64                                              
  which-2.21-16.el8.x86_64                                                      
  xkeyboard-config-2.28-1.el8.noarch                                            

Complete!
[root@bf46371dea89 yum.repos.d]# yum -y install vim
Last metadata expiration check: 0:04:23 ago on Sat 03 Sep 2022 03:50:05 AM UTC.
Dependencies resolved.
================================================================================
 Package             Arch        Version                   Repository      Size
================================================================================
Installing:
 vim-enhanced        x86_64      2:8.0.1763-16.el8         appstream      1.4 M
Installing dependencies:
 gpm-libs            x86_64      1.20.7-17.el8             appstream       39 k
 vim-common          x86_64      2:8.0.1763-16.el8         appstream      6.3 M
 vim-filesystem      noarch      2:8.0.1763-16.el8         appstream       49 k

Transaction Summary
================================================================================
Install  4 Packages

Total download size: 7.8 M
Installed size: 30 M
Downloading Packages:
(1/4): vim-common-8.0.1763-16.el8.x86_64.rpm    2.2 MB/s | 6.3 MB     00:02    
(2/4): vim-filesystem-8.0.1763-16.el8.noarch.rp 139 kB/s |  49 kB     00:00    
(3/4): vim-enhanced-8.0.1763-16.el8.x86_64.rpm  319 kB/s | 1.4 MB     00:04    
(4/4): gpm-libs-1.20.7-17.el8.x86_64.rpm        5.8 kB/s |  39 kB     00:06    
--------------------------------------------------------------------------------
Total                                           1.2 MB/s | 7.8 MB     00:06     
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction

  Preparing        :                                                        1/1 
  Installing       : vim-filesystem-2:8.0.1763-16.el8.noarch                1/4 
  Installing       : vim-common-2:8.0.1763-16.el8.x86_64                    2/4 
  Installing       : gpm-libs-1.20.7-17.el8.x86_64                          3/4 
  Running scriptlet: gpm-libs-1.20.7-17.el8.x86_64                          3/4 
  Installing       : vim-enhanced-2:8.0.1763-16.el8.x86_64                  4/4 
  Running scriptlet: vim-enhanced-2:8.0.1763-16.el8.x86_64                  4/4 
  Running scriptlet: vim-common-2:8.0.1763-16.el8.x86_64                    4/4 
  Verifying        : gpm-libs-1.20.7-17.el8.x86_64                          1/4 
  Verifying        : vim-common-2:8.0.1763-16.el8.x86_64                    2/4 
  Verifying        : vim-enhanced-2:8.0.1763-16.el8.x86_64                  3/4 
  Verifying        : vim-filesystem-2:8.0.1763-16.el8.noarch                4/4 

Installed:
  gpm-libs-1.20.7-17.el8.x86_64         vim-common-2:8.0.1763-16.el8.x86_64    
  vim-enhanced-2:8.0.1763-16.el8.x86_64 vim-filesystem-2:8.0.1763-16.el8.noarch

Complete!
[root@bf46371dea89 yum.repos.d]# 
[root@bf46371dea89 yum.repos.d]# exit
exit
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$
```

---

```shell
# 从容器中拷贝文件到主机
$ docker cp 容器id:容器内路径 宿主机路径
```

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
centos       latest    5d0da3dc9764   11 months ago   231MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -aq
bf46371dea89
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker start bf46371dea89
bf46371dea89
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker attach bf46371dea89
[root@bf46371dea89 /]# ls
bin   dev  home  lib64	     media  opt   root	sbin  sys  usr
boot  etc  lib	 lost+found  mnt    proc  run	srv   tmp  var
[root@bf46371dea89 /]# cd /home/
[root@bf46371dea89 home]# ls
[root@bf46371dea89 home]# vim centos_docker
[root@bf46371dea89 home]# cat centos_docker 
created by centos.
[root@bf46371dea89 home]# exit
exit
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -aq
bf46371dea89
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ ls
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker cp bf46371dea89:/home/centos_docker .
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ ls
centos_docker
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ cat centos_docker 
created by centos.
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker cp --help

Usage:  docker cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH|-
	docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH

Copy files/folders between a container and the local filesystem

Use '-' as the source to read a tar archive from stdin
and extract it to a directory destination in a container.
Use '-' as the destination to stream a tar archive of a
container source to stdout.

Options:
  -a, --archive       Archive mode (copy all uid/gid information)
  -L, --follow-link   Always follow symbol link in SRC_PATH
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$
```

## Docker 部署软件实战

## 结语

第二十七篇博文写完，开心！！！！

今天，也是充满希望的一天。