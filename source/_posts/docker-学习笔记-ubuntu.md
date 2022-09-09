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

6. [linux中运行ifconfig出现错误，不能sudo apt install net-tools，Linux不能联网](https://blog.csdn.net/qq_44629109/article/details/109187466)

7. [Ubuntu20.04解决应用中心打不开的问题](https://blog.csdn.net/weixin_43798960/article/details/109391089)

8. [ubuntu 版mysql客户端工具_5大常用MySQL客户端工具，入门数据库必备收藏](https://blog.csdn.net/weixin_42308943/article/details/112493290)

9. [MySQL Workbench](https://www.mysql.com/products/workbench/)

10. [制作Tomcat镜像](https://blog.csdn.net/qq_41021000/article/details/124262796)

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

### Docker 安装 Nginx

```shell
# 搜索 nginx 镜像(docker search nginx)；最好去 docker hub 搜索，因为可以看到帮助文档
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker search nginx
NAME                                              DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
nginx                                             Official build of Nginx.                        17339     [OK]       
linuxserver/nginx                                 An Nginx container, brought to you by LinuxS…   176                  
bitnami/nginx                                     Bitnami nginx Docker Image                      140                  [OK]
ubuntu/nginx                                      Nginx, a high-performance reverse proxy & we…   57                   
bitnami/nginx-ingress-controller                  Bitnami Docker Image for NGINX Ingress Contr…   19                   [OK]
rancher/nginx-ingress-controller                                                                  10                   
webdevops/nginx                                   Nginx container                                 9                    [OK]
ibmcom/nginx-ingress-controller                   Docker Image for IBM Cloud Private-CE (Commu…   4                    
bitnami/nginx-ldap-auth-daemon                                                                    3                    
vmware/nginx                                                                                      2                    
rancher/nginx                                                                                     2                    
bitnami/nginx-exporter                                                                            2                    
kasmweb/nginx                                     An Nginx image based off nginx:alpine and in…   2                    
rancher/nginx-ingress-controller-defaultbackend                                                   2                    
rapidfort/nginx                                   RapidFort optimized, hardened image for NGINX   2                    
wallarm/nginx-ingress-controller                  Kubernetes Ingress Controller with Wallarm e…   1                    
bitnami/nginx-intel                                                                               1                    
vmware/nginx-photon                                                                               1                    
rapidfort/nginx-ib                                RapidFort optimized, hardened image for NGIN…   0                    
rancher/nginx-conf                                                                                0                    
ibmcom/nginx-ingress-controller-ppc64le           Docker Image for IBM Cloud Private-CE (Commu…   0                    
rancher/nginx-ssl                                                                                 0                    
rancher/nginx-ingress-controller-amd64                                                            0                    
continuumio/nginx-ingress-ws                                                                      0                    
ibmcom/nginx-ppc64le                              Docker image for nginx-ppc64le                  0
# 下载镜像(docker pull nginx)                    
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker pull nginx
Using default tag: latest
latest: Pulling from library/nginx
7a6db449b51b: Pull complete 
ca1981974b58: Pull complete 
d4019c921e20: Pull complete 
7cb804d746d4: Pull complete 
e7a561826262: Pull complete 
7247f6e5c182: Pull complete 
Digest: sha256:b95a99feebf7797479e0c5eb5ec0bdfa5d9f504bc94da550c2f58e839ea6914f
Status: Downloaded newer image for nginx:latest
docker.io/library/nginx:latest
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
nginx        latest    2b7d6430f78d   11 days ago     142MB
centos       latest    5d0da3dc9764   11 months ago   231MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -aq
bf46371dea89
# -d 后台运行
# -name 给容器命名
# -p 宿主机端口:容器内部端口
# 后台方式启动镜像
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker run -d --name nginx01 -p 3344:80 nginx
993053824a5a35ac78bb07d6f3d48a29370974b7ded679e538c9931e00472da6
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS         PORTS                                   NAMES
993053824a5a   nginx     "/docker-entrypoint.…"   11 seconds ago   Up 7 seconds   0.0.0.0:3344->80/tcp, :::3344->80/tcp   nginx01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -aq
993053824a5a
bf46371dea89
# 本地访问测试
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ curl localhost:3344
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker exec -it nginx01 /bin/bash
root@993053824a5a:/# whereis nginx
nginx: /usr/sbin/nginx /usr/lib/nginx /etc/nginx /usr/share/nginx
root@993053824a5a:/# cd /etc/nginx/
root@993053824a5a:/etc/nginx# ls
conf.d		mime.types  nginx.conf	 uwsgi_params
fastcgi_params	modules     scgi_params
root@993053824a5a:/etc/nginx# exit
exit
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                                   NAMES
993053824a5a   nginx     "/docker-entrypoint.…"   3 minutes ago   Up 3 minutes   0.0.0.0:3344->80/tcp, :::3344->80/tcp   nginx01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -aq
993053824a5a
bf46371dea89
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$
```

`docker hub` 搜索 `nginx` 获得的官方 `nginx` 主页：https://hub.docker.com/_/nginx 。

`http://localhost:3344/` 的页面如下：

![](https://cos.luyf-lemon-love.space/images/20220903134451.png)

{% label 端口暴露概念 purple %}

![](https://cos.luyf-lemon-love.space/images/20220903134555.png)

---

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                                   NAMES
993053824a5a   nginx     "/docker-entrypoint.…"   38 minutes ago   Up 38 minutes   0.0.0.0:3344->80/tcp, :::3344->80/tcp   nginx01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -aq
993053824a5a
bf46371dea89
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker stop 993053824a5a
993053824a5a
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -aq
993053824a5a
bf46371dea89
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$
```

![](https://cos.luyf-lemon-love.space/images/20220903144233.png)

### Docker 安装 Tomcat

`docker hub` 中 `tomcat` 的主页：https://hub.docker.com/_/tomcat 。

```shell
# 官方的使用
# 我们之前的启动都是后台的，停止了容器之后，容器还是可以查到
# --rm 一般用来测试，用完就删
$ docker run -it --rm tomcat:9.0

# 下载
$ docker pull tomcat

# 启动运行
$ docker run -d -p 3344:8080 --name tomcat01 tomcat

# 测试访问没有问题

# 进入容器
$ docker exec -it tomcat01 /bin/bash

# 发现的问题：
# 该镜像默认是最小的镜像，所有不必要的都删除了，保证最小可运行环境即可
# 1. linux 命令较少
# 2. webapps 下内容为空
```

---

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker run --help

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
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
nginx        latest    2b7d6430f78d   11 days ago     142MB
centos       latest    5d0da3dc9764   11 months ago   231MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -aq
993053824a5a
bf46371dea89
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker run -it --rm tomcat:9.0
Unable to find image 'tomcat:9.0' locally
9.0: Pulling from library/tomcat
2b55860d4c66: Pull complete 
49a58ffb4a94: Pull complete 
8889343dc9d4: Pull complete 
5c321d92dfdb: Pull complete 
65e12e19b4c9: Pull complete 
e3f37adac3fb: Pull complete 
789171da50b5: Pull complete 
Digest: sha256:a4fdb14ce5c97a6e03a825f1d8b381a78d7e93843cd3c71e27363fc07d254cfc
Status: Downloaded newer image for tomcat:9.0
Using CATALINA_BASE:   /usr/local/tomcat
Using CATALINA_HOME:   /usr/local/tomcat
Using CATALINA_TMPDIR: /usr/local/tomcat/temp
Using JRE_HOME:        /opt/java/openjdk
Using CLASSPATH:       /usr/local/tomcat/bin/bootstrap.jar:/usr/local/tomcat/bin/tomcat-juli.jar
Using CATALINA_OPTS:   
NOTE: Picked up JDK_JAVA_OPTIONS:  --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.io=ALL-UNNAMED --add-opens=java.base/java.util=ALL-UNNAMED --add-opens=java.base/java.util.concurrent=ALL-UNNAMED --add-opens=java.rmi/sun.rmi.transport=ALL-UNNAMED
03-Sep-2022 07:06:55.193 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Server version name:   Apache Tomcat/9.0.65
03-Sep-2022 07:06:55.197 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Server built:          Jul 14 2022 12:28:53 UTC
03-Sep-2022 07:06:55.197 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Server version number: 9.0.65.0
03-Sep-2022 07:06:55.197 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log OS Name:               Linux
03-Sep-2022 07:06:55.197 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log OS Version:            5.15.0-46-generic
03-Sep-2022 07:06:55.197 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Architecture:          amd64
03-Sep-2022 07:06:55.197 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Java Home:             /opt/java/openjdk
03-Sep-2022 07:06:55.198 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log JVM Version:           17.0.4.1+1
03-Sep-2022 07:06:55.198 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log JVM Vendor:            Eclipse Adoptium
03-Sep-2022 07:06:55.198 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log CATALINA_BASE:         /usr/local/tomcat
03-Sep-2022 07:06:55.198 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log CATALINA_HOME:         /usr/local/tomcat
03-Sep-2022 07:06:55.203 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: --add-opens=java.base/java.lang=ALL-UNNAMED
03-Sep-2022 07:06:55.204 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: --add-opens=java.base/java.io=ALL-UNNAMED
03-Sep-2022 07:06:55.204 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: --add-opens=java.base/java.util=ALL-UNNAMED
03-Sep-2022 07:06:55.204 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: --add-opens=java.base/java.util.concurrent=ALL-UNNAMED
03-Sep-2022 07:06:55.204 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: --add-opens=java.rmi/sun.rmi.transport=ALL-UNNAMED
03-Sep-2022 07:06:55.204 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: -Djava.util.logging.config.file=/usr/local/tomcat/conf/logging.properties
03-Sep-2022 07:06:55.204 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager
03-Sep-2022 07:06:55.204 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: -Djdk.tls.ephemeralDHKeySize=2048
03-Sep-2022 07:06:55.204 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: -Djava.protocol.handler.pkgs=org.apache.catalina.webresources
03-Sep-2022 07:06:55.204 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: -Dorg.apache.catalina.security.SecurityListener.UMASK=0027
03-Sep-2022 07:06:55.204 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: -Dignore.endorsed.dirs=
03-Sep-2022 07:06:55.204 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: -Dcatalina.base=/usr/local/tomcat
03-Sep-2022 07:06:55.204 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: -Dcatalina.home=/usr/local/tomcat
03-Sep-2022 07:06:55.204 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Command line argument: -Djava.io.tmpdir=/usr/local/tomcat/temp
03-Sep-2022 07:06:55.272 INFO [main] org.apache.catalina.core.AprLifecycleListener.lifecycleEvent Loaded Apache Tomcat Native library [1.2.35] using APR version [1.7.0].
03-Sep-2022 07:06:55.272 INFO [main] org.apache.catalina.core.AprLifecycleListener.lifecycleEvent APR capabilities: IPv6 [true], sendfile [true], accept filters [false], random [true], UDS [true].
03-Sep-2022 07:06:55.272 INFO [main] org.apache.catalina.core.AprLifecycleListener.lifecycleEvent APR/OpenSSL configuration: useAprConnector [false], useOpenSSL [true]
03-Sep-2022 07:06:55.336 INFO [main] org.apache.catalina.core.AprLifecycleListener.initializeSSL OpenSSL successfully initialized [OpenSSL 3.0.2 15 Mar 2022]
03-Sep-2022 07:06:55.629 INFO [main] org.apache.coyote.AbstractProtocol.init Initializing ProtocolHandler ["http-nio-8080"]
03-Sep-2022 07:06:55.647 INFO [main] org.apache.catalina.startup.Catalina.load Server initialization in [593] milliseconds
03-Sep-2022 07:06:55.677 INFO [main] org.apache.catalina.core.StandardService.startInternal Starting service [Catalina]
03-Sep-2022 07:06:55.677 INFO [main] org.apache.catalina.core.StandardEngine.startInternal Starting Servlet engine: [Apache Tomcat/9.0.65]
03-Sep-2022 07:06:55.689 INFO [main] org.apache.coyote.AbstractProtocol.start Starting ProtocolHandler ["http-nio-8080"]
03-Sep-2022 07:06:55.698 INFO [main] org.apache.catalina.startup.Catalina.start Server startup in [50] milliseconds
^C03-Sep-2022 07:17:39.029 INFO [Thread-2] org.apache.coyote.AbstractProtocol.pause Pausing ProtocolHandler ["http-nio-8080"]
03-Sep-2022 07:17:39.065 INFO [Thread-2] org.apache.catalina.core.StandardService.stopInternal Stopping service [Catalina]
03-Sep-2022 07:17:39.066 INFO [Thread-2] org.apache.coyote.AbstractProtocol.stop Stopping ProtocolHandler ["http-nio-8080"]
03-Sep-2022 07:17:39.070 INFO [Thread-2] org.apache.coyote.AbstractProtocol.destroy Destroying ProtocolHandler ["http-nio-8080"]
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -aq
993053824a5a
bf46371dea89
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED       STATUS                         PORTS     NAMES
993053824a5a   nginx     "/docker-entrypoint.…"   2 hours ago   Exited (0) About an hour ago             nginx01
bf46371dea89   centos    "/bin/bash"              4 hours ago   Exited (0) 3 hours ago                   epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker pull tomcat
Using default tag: latest
latest: Pulling from library/tomcat
2b55860d4c66: Already exists 
49a58ffb4a94: Already exists 
8889343dc9d4: Already exists 
5c321d92dfdb: Already exists 
65e12e19b4c9: Already exists 
31c5670ba66a: Pull complete 
4196dee71f9b: Pull complete 
Digest: sha256:bb81645575fef90e48e6f9fff50e06d5b78d4ac9d2683845401164ba1ddfe199
Status: Downloaded newer image for tomcat:latest
docker.io/library/tomcat:latest
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
tomcat       9.0       d4488b7f8c9b   21 hours ago    475MB
tomcat       latest    7a91e6f458bb   21 hours ago    475MB
nginx        latest    2b7d6430f78d   11 days ago     142MB
centos       latest    5d0da3dc9764   11 months ago   231MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED       STATUS                         PORTS     NAMES
993053824a5a   nginx     "/docker-entrypoint.…"   2 hours ago   Exited (0) About an hour ago             nginx01
bf46371dea89   centos    "/bin/bash"              4 hours ago   Exited (0) 3 hours ago                   epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker run -d -p 3344:8080 --name tomcat01 tomcat
b96353caeec5433eeabac81beeacd2e178e15f8e3fbe8cd5cd2480afe517af12
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND             CREATED         STATUS         PORTS                                       NAMES
b96353caeec5   tomcat    "catalina.sh run"   7 seconds ago   Up 4 seconds   0.0.0.0:3344->8080/tcp, :::3344->8080/tcp   tomcat01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS                         PORTS                                       NAMES
b96353caeec5   tomcat    "catalina.sh run"        19 seconds ago   Up 16 seconds                  0.0.0.0:3344->8080/tcp, :::3344->8080/tcp   tomcat01
993053824a5a   nginx     "/docker-entrypoint.…"   2 hours ago      Exited (0) About an hour ago                                               nginx01
bf46371dea89   centos    "/bin/bash"              4 hours ago      Exited (0) (((b((b((((b(b(((b((((b((((((((b((((((((base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker exec -it tomcat01 /bin/bash
root@b96353caeec5:/usr/local/tomcat# ls
bin           conf             lib      logs            NOTICE     RELEASE-NOTES  temp     webapps.dist
BUILDING.txt  CONTRIBUTING.md  LICENSE  native-jni-lib  README.md  RUNNING.txt    webapps  work
root@b96353caeec5:/usr/local/tomcat# cd webapps
root@b96353caeec5:/usr/local/tomcat/webapps# ls
root@b96353caeec5:/usr/local/tomcat/webapps# cd ../webapps.dist/
root@b96353caeec5:/usr/local/tomcat/webapps.dist# ls
docs  examples  host-manager  manager  ROOT
root@b96353caeec5:/usr/local/tomcat/webapps.dist# cd ../webapps
root@b96353caeec5:/usr/local/tomcat/webapps# ls
root@b96353caeec5:/usr/local/tomcat/webapps# cp -r ../webapps.dist/* .
root@b96353caeec5:/usr/local/tomcat/webapps# ls
docs  examples  host-manager  manager  ROOT
root@b96353caeec5:/usr/local/tomcat/webapps# exit
exit
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND             CREATED         STATUS         PORTS                                       NAMES
b96353caeec5   tomcat    "catalina.sh run"   8 minutes ago   Up 8 minutes   0.0.0.0:3344->8080/tcp, :::3344->8080/tcp   tomcat01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS                         PORTS                                       NAMES
b96353caeec5   tomcat    "catalina.sh run"        9 minutes ago   Up 9 minutes                   0.0.0.0:3344->8080/tcp, :::3344->8080/tcp   tomcat01
993053824a5a   nginx     "/docker-entrypoint.…"   2 hours ago     Exited (0) About an hour ago                                               nginx01
bf46371dea89   centos    "/bin/bash"              4 hours ago     Exited (0) 3 hours ago                                                     epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$
```

由于 `/usr/local/tomcat/webapps/` 是空的，所以`测试访问`没有问题，但没有内容。

![](https://cos.luyf-lemon-love.space/images/20220903152335.png)

将 `/usr/local/tomcat/webapps.dist/` 中的内容复制到 `/usr/local/tomcat/webapps/` 中，`测试访问`结果如下图。

![](https://cos.luyf-lemon-love.space/images/20220903153002.png)

---

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
tomcat       9.0       d4488b7f8c9b   22 hours ago    475MB
tomcat       latest    7a91e6f458bb   22 hours ago    475MB
nginx        latest    2b7d6430f78d   11 days ago     142MB
centos       latest    5d0da3dc9764   11 months ago   231MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND             CREATED             STATUS             PORTS                                       NAMES
b96353caeec5   tomcat    "catalina.sh run"   About an hour ago   Up About an hour   0.0.0.0:3344->8080/tcp, :::3344->8080/tcp   tomcat01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -aq
b96353caeec5
993053824a5a
bf46371dea89
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED             STATUS                   PORTS                                       NAMES
b96353caeec5   tomcat    "catalina.sh run"        About an hour ago   Up About an hour         0.0.0.0:3344->8080/tcp, :::3344->8080/tcp   tomcat01
993053824a5a   nginx     "/docker-entrypoint.…"   3 hours ago         Exited (0) 3 hours ago                                               nginx01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker stop tomcat01
tomcat01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED             STATUS                        PORTS     NAMES
b96353caeec5   tomcat    "catalina.sh run"        About an hour ago   Exited (143) 16 seconds ago             tomcat01
993053824a5a   nginx     "/docker-entrypoint.…"   3 hours ago         Exited (0) 3 hours ago                  nginx01
bf46371dea89   centos    "/bin/bash"              5 hours ago         Exited (0) 4 hours ago                  epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$
```

![](https://cos.luyf-lemon-love.space/images/20220903164714.png)

### Docker 部署 elasticsearch

`docker hub` 中 `elasticsearch` 的主页：https://hub.docker.com/_/elasticsearch 。

{% label 官方使用方法 green %}

#### How to use this image

**Note**: Pulling an images requires `using a specific version number tag`. The `latest` tag is not supported.

For Elasticsearch versions prior to `6.4.0` a full list of images, tags, and documentation can be found at [docker.elastic.co](https://www.docker.elastic.co/).

For full Elasticsearch documentation see [here](https://www.elastic.co/guide/en/elasticsearch/reference/index.html).

**The commands below are intended for deploying in a development context only. For production installation and configuration, see [Install Elasticsearch with Docker](https://www.elastic.co/guide/en/elasticsearch/reference/7.5/docker.html)**.

##### Running in Development Mode

Create user defined network (useful for connecting to other services attached to the same network (e.g. `Kibana`)):

```shell
$ docker network create somenetwork
```

Run Elasticsearch:

```shell
$ docker run -d --name elasticsearch --net somenetwork -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:tag
```

##### Running in Production Mode

See [Install Elasticsearch with Docker](https://www.elastic.co/guide/en/elasticsearch/reference/7.5/docker.html)

---

```shell
# es 暴露的端口很多
# es 十分的耗内存
# es 的数据一般需要放置到安全目录！ 挂载
# --net somenetwork 网络配置
 
# 启动 elasticsearch
$ docker run -d --name elasticsearch --net somenetwork -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:7.6.2
 
$ docker run -d --name elasticsearch -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:7.6.2
a920894a940b354d3c867079efada13d96cf9138712c76c8dea58fabd9c7e96f
 
# 启动之后，linux 就卡住了，使用 docker stats 查看 cpu 状态
 
# 测试一下 ，es 成功了
[root@iZ2zeg4ytp0whqtmxbsqiiZ home]# curl localhost:9200
{
  "name" : "a920894a940b",
  "cluster_name" : "docker-cluster",
  "cluster_uuid" : "bxE1TJMEThKgwmk7Aa3fHQ",
  "version" : {
    "number" : "7.6.2",
    "build_flavor" : "default",
    "build_type" : "docker",
    "build_hash" : "ef48eb35cf30adf4db14086e8aabd07ef6fb113f",
    "build_date" : "2020-03-26T06:34:37.794943Z",
    "build_snapshot" : false,
    "lucene_version" : "8.4.0",
    "minimum_wire_compatibility_version" : "6.8.0",
    "minimum_index_compatibility_version" : "6.0.0-beta1"
  },
  "tagline" : "You Know, for Search"
}
 
 
# 增加内存限制，修改配置文件，-e 环境配置修改
docker run -d --name elasticsearch -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -e ES_JAVA_OPTS="-Xms64m -Xmx512m" elasticsearch:7.6.2
```

---

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
tomcat       9.0       d4488b7f8c9b   23 hours ago    475MB
tomcat       latest    7a91e6f458bb   23 hours ago    475MB
nginx        latest    2b7d6430f78d   11 days ago     142MB
centos       latest    5d0da3dc9764   11 months ago   231MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED       STATUS                           PORTS     NAMES
b96353caeec5   tomcat    "catalina.sh run"        3 hours ago   Exited (143) About an hour ago             tomcat01
993053824a5a   nginx     "/docker-entrypoint.…"   5 hours ago   Exited (0) 4 hours ago                     nginx01
bf46371dea89   centos    "/bin/bash"              6 hours ago   Exited (0) 6 hours ago                     epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker run -d --name elasticsearch -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -e ES_JAVA_OPTS="-Xms64m -Xmx512m" elasticsearch:7.6.2
Unable to find image 'elasticsearch:7.6.2' locally
7.6.2: Pulling from library/elasticsearch
ab5ef0e58194: Pull complete 
c4d1ca5c8a25: Pull complete 
941a3cc8e7b8: Pull complete 
43ec483d9618: Pull complete 
c486fd200684: Pull complete 
1b960df074b2: Pull complete 
1719d48d6823: Pull complete 
Digest: sha256:1b09dbd93085a1e7bca34830e77d2981521a7210e11f11eda997add1c12711fa
Status: Downloaded newer image for elasticsearch:7.6.2
f888868cb0f215e1a4cbadcd9ea8a1190aa41c37f6278b85e7934c20b09a71a7
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
tomcat          9.0       d4488b7f8c9b   23 hours ago    475MB
tomcat          latest    7a91e6f458bb   23 hours ago    475MB
nginx           latest    2b7d6430f78d   11 days ago     142MB
centos          latest    5d0da3dc9764   11 months ago   231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS          PORTS                                                                                  NAMES
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   32 seconds ago   Up 22 seconds   0.0.0.0:9200->9200/tcp, :::9200->9200/tcp, 0.0.0.0:9300->9300/tcp, :::9300->9300/tcp   elasticsearch
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED              STATUS                           PORTS                                                                                  NAMES
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   About a minute ago   Up About a minute                0.0.0.0:9200->9200/tcp, :::9200->9200/tcp, 0.0.0.0:9300->9300/tcp, :::9300->9300/tcp   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        3 hours ago          Exited (143) About an hour ago                                                                                          tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   5 hours ago          Exited (0) 4 hours ago                                                                                                  nginx01
bf46371dea89   centos                "/bin/bash"              6 hours ago          Exited (0) 6 hours ago                                                                                                  epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ curl localhost:9200
{
  "name" : "f888868cb0f2",
  "cluster_name" : "docker-cluster",
  "cluster_uuid" : "TCeZo_lyToap2TJt_2EE8w",
  "version" : {
    "number" : "7.6.2",
    "build_flavor" : "default",
    "build_type" : "docker",
    "build_hash" : "ef48eb35cf30adf4db14086e8aabd07ef6fb113f",
    "build_date" : "2020-03-26T06:34:37.794943Z",
    "build_snapshot" : false,
    "lucene_version" : "8.4.0",
    "minimum_wire_compatibility_version" : "6.8.0",
    "minimum_index_compatibility_version" : "6.0.0-beta1"
  },
  "tagline" : "You Know, for Search"
}
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker stats

CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.11%     369.4MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.73%     369.5MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.73%     369.5MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.80%     369.5MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.80%     369.5MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.23%     369.5MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.23%     369.5MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.23%     369.5MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.21%     369.5MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.21%     369.5MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.18%     369.5MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.18%     369.5MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.49%     369.4MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.49%     369.4MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.31%     369.4MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.31%     369.4MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.19%     369.4MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.19%     369.4MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   1.69%     369.4MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   1.69%     369.4MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.20%     369.4MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.20%     369.4MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.74%     369.4MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.74%     369.4MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.47%     369.4MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.47%     369.4MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.43%     369.4MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
























CONTAINER ID   NAME            CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O        PIDS
f888868cb0f2   elasticsearch   0.43%     369.4MiB / 7.659GiB   4.71%     6.95kB / 942B   4.86MB / 729kB   46
^C
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE                 COMMAND                  CREATED         STATUS         PORTS                                                                                  NAMES
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   3 minutes ago   Up 3 minutes   0.0.0.0:9200->9200/tcp, :::9200->9200/tcp, 0.0.0.0:9300->9300/tcp, :::9300->9300/tcp   elasticsearch
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker stop f888868cb0f2
f888868cb0f2
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
tomcat          9.0       d4488b7f8c9b   23 hours ago    475MB
tomcat          latest    7a91e6f458bb   24 hours ago    475MB
nginx           latest    2b7d6430f78d   11 days ago     142MB
centos          latest    5d0da3dc9764   11 months ago   231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -aq
f888868cb0f2
b96353caeec5
993053824a5a
bf46371dea89
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED         STATUS                           PORTS     NAMES
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   4 minutes ago   Exited (143) 36 seconds ago                elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        3 hours ago     Exited (143) About an hour ago             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   5 hours ago     Exited (0) 4 hours ago                     nginx01
bf46371dea89   centos                "/bin/bash"              6 hours ago     Exited (0) 6 hours ago                     epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$
```

### 可视化

`docker hub` 中 `portainer/portainer`( This Repo is now `deprecated`, use `portainer/portainer-ce` instead. ) 的主页：https://hub.docker.com/r/portainer/portainer 。

`docker hub` 中 `portainer/portainer-ce`( `Portainer CE` - a lightweight service delivery platform for containerized applications ) 的主页：https://hub.docker.com/r/portainer/portainer-ce 。

```shell
docker run -d -p 8088:9000 --restart=always -v /var/run/docker.sock:/var/run/docker.sock --privileged=true portainer/portainer
 
# 测试
[root@iZ2zeg4ytp0whqtmxbsqiiZ home]# curl localhost:8088
<!DOCTYPE html
><html lang="en" ng-app="portainer">
 
# 外网访问 http://ip:8088
 
```

![](https://cos.luyf-lemon-love.space/images/20220903210642.png)

## Docker 原理

`Docker` 镜像都是`只读的`，当容器启动时，一个新的`可写层`被加载到镜像的顶部！这一层就是我们通常说的`容器层`，`容器层`之下的都叫做`镜像层`。

![](https://cos.luyf-lemon-love.space/images/20220903222251.png)

**`commit` 镜像**

```shell
# 提交容器成为一个新的镜像
docker commit
 
# 命令和 git 原理类似
docker commit -m="提交的描述信息" -a="作者" 容器id 目标镜像名:[TAG]
 
docker commit -a="xiaofan" -m="add webapps app" d798a5946c1f tomcat007:1.0
```

**实战测试**

```shell
# 1. 启动一个默认的 tomcat
# 2. 发现这个默认的 tomcat 没有 webapps 应用，镜像的原因，官方镜像默认 webapps 下面是没有内容的
# 3. 我自己拷贝进去了基本的文件
# 4. 将我们操作过的容器通过 commit 提交为一个镜像！我们以后就使用我们自己制作的镜像了
```

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker commit --help

Usage:  docker commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]

Create a new image from a container's changes

Options:
  -a, --author string    Author (e.g., "John Hannibal Smith
                         <hannibal@a-team.com>")
  -c, --change list      Apply Dockerfile instruction to the created image
  -m, --message string   Commit message
  -p, --pause            Pause container during commit (default true)
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
tomcat          9.0       d4488b7f8c9b   27 hours ago    475MB
tomcat          latest    7a91e6f458bb   27 hours ago    475MB
nginx           latest    2b7d6430f78d   11 days ago     142MB
centos          latest    5d0da3dc9764   11 months ago   231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                     PORTS     NAMES
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   4 hours ago    Exited (143) 4 hours ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        7 hours ago    Exited (143) 5 hours ago             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   9 hours ago    Exited (0) 8 hours ago               nginx01
bf46371dea89   centos                "/bin/bash"              10 hours ago   Exited (0) 10 hours ago              epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker run -d -p 3344:8080 --name tomcat02 tomcat
3cae46866d9e321f33b2e006828fce76ad3dd2bb8c4d211e4b0b76acad105485
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND             CREATED          STATUS          PORTS                                       NAMES
3cae46866d9e   tomcat    "catalina.sh run"   36 seconds ago   Up 32 seconds   0.0.0.0:3344->8080/tcp, :::3344->8080/tcp   tomcat02
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                     PORTS                                       NAMES
3cae46866d9e   tomcat                "catalina.sh run"        45 seconds ago   Up 41 seconds              0.0.0.0:3344->8080/tcp, :::3344->8080/tcp   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   4 hours ago      Exited (143) 4 hours ago                                               elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        7 hours ago      Exited (143) 5 hours ago                                               tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   9 hours ago      Exited (0) 8 hours ago                                                 nginx01
bf46371dea89   centos                "/bin/bash"              10 hours ago     Exited (0) 10 hours ago                                                epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker exec -it tomcat02 /bin/bash
root@3cae46866d9e:/usr/local/tomcat# ls
bin              lib             NOTICE         temp
BUILDING.txt     LICENSE         README.md      webapps
conf             logs            RELEASE-NOTES  webapps.dist
CONTRIBUTING.md  native-jni-lib  RUNNING.txt    work
root@3cae46866d9e:/usr/local/tomcat# cd webapps
root@3cae46866d9e:/usr/local/tomcat/webapps# ls
root@3cae46866d9e:/usr/local/tomcat/webapps# cd ../webapps.dist/
root@3cae46866d9e:/usr/local/tomcat/webapps.dist# ls
docs  examples  host-manager  manager  ROOT
root@3cae46866d9e:/usr/local/tomcat/webapps.dist# cd ../webapps
root@3cae46866d9e:/usr/local/tomcat/webapps# ls
root@3cae46866d9e:/usr/local/tomcat/webapps# cp -r ../webapps.dist/* .
root@3cae46866d9e:/usr/local/tomcat/webapps# ls
docs  examples  host-manager  manager  ROOT
root@3cae46866d9e:/usr/local/tomcat/webapps# exit
exit
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND             CREATED         STATUS         PORTS                                       NAMES
3cae46866d9e   tomcat    "catalina.sh run"   5 minutes ago   Up 5 minutes   0.0.0.0:3344->8080/tcp, :::3344->8080/tcp   tomcat02
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED         STATUS                     PORTS                                       NAMES
3cae46866d9e   tomcat                "catalina.sh run"        5 minutes ago   Up 5 minutes               0.0.0.0:3344->8080/tcp, :::3344->8080/tcp   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   4 hours ago     Exited (143) 4 hours ago                                               elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        7 hours ago     Exited (143) 5 hours ago                                               tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   9 hours ago     Exited (0) 8 hours ago                                                 nginx01
bf46371dea89   centos                "/bin/bash"              10 hours ago    Exited (0) 10 hours ago                                                epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
tomcat          9.0       d4488b7f8c9b   27 hours ago    475MB
tomcat          latest    7a91e6f458bb   28 hours ago    475MB
nginx           latest    2b7d6430f78d   11 days ago     142MB
centos          latest    5d0da3dc9764   11 months ago   231MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker commit -(base(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker commit -a="lyf" -m="add webapps app" 3cae46866d9e my_tomcat:0.1
sha256:82bf5ce1034c78fd2a93474b33c898b0b9a4bc66c0ed00c9af4a61ce57292d87
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
my_tomcat       0.1       82bf5ce1034c   8 seconds ago   480MB
tomcat          9.0       d4488b7f8c9b   28 hours ago    475MB
tomcat          latest    7a91e6f458bb   28 hours ago    475MB
nginx           latest    2b7d6430f78d   11 days ago     142MB
centos          latest    5d0da3dc9764   11 months ago   231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker stop 3cae46866d9e
3cae46866d9e
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED         STATUS                        PORTS     NAMES
3cae46866d9e   tomcat                "catalina.sh run"        8 minutes ago   Exited (143) 25 seconds ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   4 hours ago     Exited (143) 4 hours ago                elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        7 hours ago     Exited (143) 5 hours ago                tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   9 hours ago     Exited (0) 8 hours ago                  nginx01
bf46371dea89   centos                "/bin/bash"              10 hours ago    Exited (0) 10 hours ago                 epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker run -d -p 3344:8080 --name my_tomcat01 my_tomcat:0.1
7dfe274200321e17870f021fc8e648f8cc68266009679b7e46ca617a76839251
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE           COMMAND             CREATED         STATUS         PORTS                                       NAMES
7dfe27420032   my_tomcat:0.1   "catalina.sh run"   6 seconds ago   Up 4 seconds   0.0.0.0:3344->8080/tcp, :::3344->8080/tcp   my_tomcat01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                       PORTS                                       NAMES
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        12 seconds ago   Up 10 seconds                0.0.0.0:3344->8080/tcp, :::3344->8080/tcp   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        10 minutes ago   Exited (143) 2 minutes ago                                               tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   4 hours ago      Exited (143) 4 hours ago                                                 elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        7 hours ago      Exited (143) 5 hours ago                                                 tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   9 hours ago      Exited (0) 8 hours ago                                                   nginx01
bf46371dea89   centos                "/bin/bash"              10 hours ago     Exited (0) 10 hours ago                                                  epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$
```

![](https://cos.luyf-lemon-love.space/images/20220903225345.png)

---

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED             SIZE
my_tomcat       0.1       82bf5ce1034c   About an hour ago   480MB
tomcat          9.0       d4488b7f8c9b   29 hours ago        475MB
tomcat          latest    7a91e6f458bb   29 hours ago        475MB
nginx           latest    2b7d6430f78d   11 days ago         142MB
centos          latest    5d0da3dc9764   11 months ago       231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago         791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE           COMMAND             CREATED             STATUS             PORTS                                       NAMES
7dfe27420032   my_tomcat:0.1   "catalina.sh run"   About an hour ago   Up About an hour   0.0.0.0:3344->8080/tcp, :::3344->8080/tcp   my_tomcat01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED             STATUS                           PORTS                                       NAMES
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        About an hour ago   Up About an hour                 0.0.0.0:3344->8080/tcp, :::3344->8080/tcp   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        About an hour ago   Exited (143) About an hour ago                                               tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   5 hours ago         Exited (143) 5 hours ago                                                     elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        8 hours ago         Exited (143) 7 hours ago                                                     tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   10 hours ago        Exited (0) 9 hours ago                                                       nginx01
bf46371dea89   centos                "/bin/bash"              12 hours ago        Exited (0) 11 hours ago                                                      epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker stop 7dfe27420032
7dfe27420032
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED             STATUS                           PORTS     NAMES
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        About an hour ago   Exited (143) 18 seconds ago                my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        About an hour ago   Exited (143) About an hour ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   5 hours ago         Exited (143) 5 hours ago                   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        8 hours ago         Exited (143) 7 hours ago                   tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   10 hours ago        Exited (0) 9 hours ago                     nginx01
bf46371dea89   centos                "/bin/bash"              12 hours ago        Exited (0) 11 hours ago                    epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$
```

![](https://cos.luyf-lemon-love.space/images/20220903232325.png)

## 容器数据卷

### 准备

使用 `docker commit` 提交之前使用 `yum -y install vim` 安装 `vim` 的 `centos` 容器为新镜像: `my_centos`。

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
my_tomcat       0.1       82bf5ce1034c   14 hours ago    480MB
tomcat          9.0       d4488b7f8c9b   41 hours ago    475MB
tomcat          latest    7a91e6f458bb   41 hours ago    475MB
nginx           latest    2b7d6430f78d   12 days ago     142MB
centos          latest    5d0da3dc9764   11 months ago   231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                      PORTS     NAMES
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        14 hours ago   Exited (143) 13 hours ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        14 hours ago   Exited (143) 14 hours ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   18 hours ago   Exited (143) 18 hours ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        21 hours ago   Exited (143) 19 hours ago             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   22 hours ago   Exited (0) 22 hours ago               nginx01
bf46371dea89   centos                "/bin/bash"              24 hours ago   Exited (0) 3 minutes ago              epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker start bf46371dea89
bf46371dea89
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED        STATUS          PORTS     NAMES
bf46371dea89   centos    "/bin/bash"   24 hours ago   Up 10 seconds             epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                      PORTS     NAMES
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        14 hours ago   Exited (143) 13 hours ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        14 hours ago   Exited (143) 14 hours ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   18 hours ago   Exited (143) 18 hours ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        21 hours ago   Exited (143) 19 hours ago             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   22 hours ago   Exited (0) 22 hours ago               nginx01
bf46371dea89   centos                "/bin/bash"              24 hours ago   Up 16 seconds                         epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker attach bf46371dea89
[root@bf46371dea89 /]# which vim
/usr/bin/vim
[root@bf46371dea89 /]# ls
bin  boot  dev	etc  home  lib	lib64  lost+found  media  mnt  opt  proc  root	run  sbin  srv	sys  tmp  usr  var
[root@bf46371dea89 /]# cd home/
[root@bf46371dea89 home]# ls
centos_docker
[root@bf46371dea89 home]# cat centos_docker 
created by centos.
[root@bf46371dea89 home]# exit
exit
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                      PORTS     NAMES
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        14 hours ago   Exited (143) 13 hours ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        14 hours ago   Exited (143) 14 hours ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   18 hours ago   Exited (143) 18 hours ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        21 hours ago   Exited (143) 19 hours ago             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   22 hours ago   Exited (0) 22 hours ago               nginx01
bf46371dea89   centos                "/bin/bash"              24 hours ago   Exited (0) 9 seconds ago              epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker commit -a="lyf" -m="yum -y install vim" bf46371dea89 my_centos:0.1
sha256:d3a84994963f87123bed823217972c17a5650a6c99b73b508624cfd920ff3c6c
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED          SIZE
my_centos       0.1       d3a84994963f   41 seconds ago   559MB
my_tomcat       0.1       82bf5ce1034c   14 hours ago     480MB
tomcat          9.0       d4488b7f8c9b   41 hours ago     475MB
tomcat          latest    7a91e6f458bb   41 hours ago     475MB
nginx           latest    2b7d6430f78d   12 days ago      142MB
centos          latest    5d0da3dc9764   11 months ago    231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago      791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                      PORTS     NAMES
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        14 hours ago   Exited (143) 13 hours ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        14 hours ago   Exited (143) 14 hours ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   18 hours ago   Exited (143) 18 hours ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        21 hours ago   Exited (143) 19 hours ago             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   23 hours ago   Exited (0) 22 hours ago               nginx01
bf46371dea89   centos                "/bin/bash"              24 hours ago   Exited (0) 5 minutes ago              epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ pwd
/home/lyfubuntu/my_computer_language/docker
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ ls
centos_docker
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ mkdir my_centos
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ ls
centos_docker  my_centos
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ cd my_centos/
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ ls
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$
```

### docker 的回顾

**`问题`**: 如果将`应用`和`环境`打包成一个`镜像`，那么容器被删除，容器中的`数据`就会丢失！

**需求**: 数据需要持久化。

**MySQL**: 容器删了 `==` **删库跑路**，**需求**: `MySQL` 数据需要存储到本地！

**容器数据卷**: 数据共享技术，`Docker` 容器中产生的数据会`同步到本地`。

**容器数据卷**: 就是目录挂载 -> 将`容器内目录`挂载到`宿主机目录`上面！

**`总结`**: `容器数据卷` -> 数据持久化、同步( 宿主机和容器 )和共享( 容器间 )。

### 数据卷

> 使用 `docker run -v` 挂载目录

```shell
docker run -it -v 主机目录:容器目录

$ docker run -it -v /home/ceshi:/home centos
```

---

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ ls
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ pwd
/home/lyfubuntu/my_computer_language/docker/my_centos
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED          SIZE
my_centos       0.1       d3a84994963f   38 minutes ago   559MB
my_tomcat       0.1       82bf5ce1034c   15 hours ago     480MB
tomcat          9.0       d4488b7f8c9b   42 hours ago     475MB
tomcat          latest    7a91e6f458bb   42 hours ago     475MB
nginx           latest    2b7d6430f78d   12 days ago      142MB
centos          latest    5d0da3dc9764   11 months ago    231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago      791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                      PORTS     NAMES
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        14 hours ago   Exited (143) 13 hours ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        15 hours ago   Exited (143) 15 hours ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   19 hours ago   Exited (143) 19 hours ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        21 hours ago   Exited (143) 20 hours ago             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   23 hours ago   Exited (0) 23 hours ago               nginx01
bf46371dea89   centos                "/bin/bash"              25 hours ago   Exited (0) 43 minutes ago             epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker run -it my_centos:0.1 /bin/bash
[root@e8f9268f0ad5 /]# ls
bin  boot  dev	etc  home  lib	lib64  lost+found  media  mnt  opt  proc  root	run  sbin  srv	sys  tmp  usr  var
[root@e8f9268f0ad5 /]# which vim
/usr/bin/vim
[root@e8f9268f0ad5 /]# cd home/
[root@e8f9268f0ad5 home]# ls
centos_docker
[root@e8f9268f0ad5 home]# cat centos_docker 
created by centos.
[root@e8f9268f0ad5 home]# exit
exit
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED              STATUS                      PORTS     NAMES
e8f9268f0ad5   my_centos:0.1         "/bin/bash"              About a minute ago   Exited (0) 12 seconds ago             priceless_brattain
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        15 hours ago         Exited (143) 13 hours ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        15 hours ago         Exited (143) 15 hours ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   19 hours ago         Exited (143) 19 hours ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        21 hours ago         Exited (143) 20 hours ago             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   23 hours ago         Exited (0) 23 hours ago               nginx01
bf46371dea89   centos                "/bin/bash"              25 hours ago         Exited (0) 46 minutes ago             epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker rm -f e8f9268f0ad5
e8f9268f0ad5
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                      PORTS     NAMES
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        15 hours ago   Exited (143) 13 hours ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        15 hours ago   Exited (143) 15 hours ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   19 hours ago   Exited (143) 19 hours ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        21 hours ago   Exited (143) 20 hours ago             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   23 hours ago   Exited (0) 23 hours ago               nginx01
bf46371dea89   centos                "/bin/bash"              25 hours ago   Exited (0) 47 minutes ago             epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED          SIZE
my_centos       0.1       d3a84994963f   42 minutes ago   559MB
my_tomcat       0.1       82bf5ce1034c   15 hours ago     480MB
tomcat          9.0       d4488b7f8c9b   42 hours ago     475MB
tomcat          latest    7a91e6f458bb   42 hours ago     475MB
nginx           latest    2b7d6430f78d   12 days ago      142MB
centos          latest    5d0da3dc9764   11 months ago    231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago      791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ ls
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker run -it -v /home/lyfubuntu/my_computer_language/docker/my_centos/:/home/ my_centos:0.1 /bin/bash
[root@b8a17c4278ee /]# ls
bin  boot  dev	etc  home  lib	lib64  lost+found  media  mnt  opt  proc  root	run  sbin  srv	sys  tmp  usr  var
[root@b8a17c4278ee /]# cd /home/
[root@b8a17c4278ee home]# ls
[root@b8a17c4278ee home]# which vim
/usr/bin/vim
[root@b8a17c4278ee home]# vim my_centos_docker
[root@b8a17c4278ee home]# cat my_centos_docker 
created by my_centos:0.1.
[root@b8a17c4278ee home]# ls
my_centos_docker
[root@b8a17c4278ee home]# (base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ 
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ ls
my_centos_docker
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ cat my_centos_docker 
created by my_centos:0.1.
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ # 注释
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ # 上面实验结果显示
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ # 1. -v 主机目录->容器目录
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ # 2. 容器第一次启动：数据是从宿主机映射到容器
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ # 3. 容器启动过程中，是可以从容器映射到宿主机中的
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker ps
CONTAINER ID   IMAGE           COMMAND       CREATED         STATUS         PORTS     NAMES
b8a17c4278ee   my_centos:0.1   "/bin/bash"   9 minutes ago   Up 9 minutes             stupefied_ishizaka
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                         PORTS     NAMES
b8a17c4278ee   my_centos:0.1         "/bin/bash"              10 minutes ago   Up 10 minutes                            stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        15 hours ago     Exited (143) 14 hours ago                my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        15 hours ago     Exited (143) 15 hours ago                tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   19 hours ago     Exited (143) 19 hours ago                elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        22 hours ago     Exited (143) 20 hours ago                tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   23 hours ago     Exited (0) 23 hours ago                  nginx01
bf46371dea89   centos                "/bin/bash"              25 hours ago     Exited (0) About an hour ago             epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ ls
my_centos_docker
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ vim my_ubuntu_docker
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ cat my_ubuntu_docker 
created by ubuntu.
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker attach b8a17c4278ee
[root@b8a17c4278ee home]# ls
my_centos_docker  my_ubuntu_docker
[root@b8a17c4278ee home]# cat my_ubuntu_docker 
created by ubuntu.
[root@b8a17c4278ee home]# exit
exit
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ ls
my_centos_docker  my_ubuntu_docker
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ # 注释
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ # 上面实验结果显示
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ # 1. 容器运行过程中，是可以从宿主机映射到容器中的
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ ls
my_centos_docker  my_ubuntu_docker
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ cat my_ubuntu_docker 
created by ubuntu.
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ vim my_ubuntu_docker 
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ cat my_ubuntu_docker 
created by ubuntu.
modify on ubuntu when the container is exited.
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                         PORTS     NAMES
b8a17c4278ee   my_centos:0.1         "/bin/bash"              19 minutes ago   Exited (0) 7 minutes ago                 stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        15 hours ago     Exited (143) 14 hours ago                my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        15 hours ago     Exited (143) 15 hours ago                tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   19 hours ago     Exited (143) 19 hours ago                elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        22 hours ago     Exited (143) 20 hours ago                tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   24 hours ago     Exited (0) 23 hours ago                  nginx01
bf46371dea89   centos                "/bin/bash"              25 hours ago     Exited (0) About an hour ago             epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker attach b8a17c4278ee
You cannot attach to a stopped container, start it first
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker start b8a17c4278ee
b8a17c4278ee
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker attach b8a17c4278ee
[root@b8a17c4278ee /]# ls
bin  boot  dev	etc  home  lib	lib64  lost+found  media  mnt  opt  proc  root	run  sbin  srv	sys  tmp  usr  var
[root@b8a17c4278ee /]# cd /home/
[root@b8a17c4278ee home]# ls
my_centos_docker  my_ubuntu_docker
[root@b8a17c4278ee home]# cat my_ubuntu_docker 
created by ubuntu.
modify on ubuntu when the container is exited.
[root@b8a17c4278ee home]# exit
exit
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                         PORTS     NAMES
b8a17c4278ee   my_centos:0.1         "/bin/bash"              20 minutes ago   Exited (0) 9 seconds ago                 stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        15 hours ago     Exited (143) 14 hours ago                my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        15 hours ago     Exited (143) 15 hours ago                tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   19 hours ago     Exited (143) 19 hours ago                elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        22 hours ago     Exited (143) 20 hours ago                tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   24 hours ago     Exited (0) 23 hours ago                  nginx01
bf46371dea89   centos                "/bin/bash"              25 hours ago     Exited (0) About an hour ago             epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ # 注释
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ # 上面实验结果显示
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ # 1. 容器关闭过程中，依旧是可以从宿主机映射到容器中的
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ ls
my_centos_docker  my_ubuntu_docker
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$
```

---

![](https://cos.luyf-lemon-love.space/images/20220904142005.png)

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
my_centos       0.1       d3a84994963f   2 hours ago     559MB
my_tomcat       0.1       82bf5ce1034c   16 hours ago    480MB
tomcat          9.0       d4488b7f8c9b   44 hours ago    475MB
tomcat          latest    7a91e6f458bb   44 hours ago    475MB
nginx           latest    2b7d6430f78d   12 days ago     142MB
centos          latest    5d0da3dc9764   11 months ago   231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED             STATUS                         PORTS     NAMES
b8a17c4278ee   my_centos:0.1         "/bin/bash"              About an hour ago   Exited (0) About an hour ago             stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        16 hours ago        Exited (143) 15 hours ago                my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        16 hours ago        Exited (143) 16 hours ago                tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   20 hours ago        Exited (143) 20 hours ago                elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        23 hours ago        Exited (143) 22 hours ago                tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   25 hours ago        Exited (0) 24 hours ago                  nginx01
bf46371dea89   centos                "/bin/bash"              26 hours ago        Exited (0) 2 hours ago                   epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$ docker inspect b8a17c4278ee
[
    {
        "Id": "b8a17c4278ee1047bbc95415d70288cad37e3279a3cc1a54e6ab8ad55efacff0",
        "Created": "2022-09-04T04:49:24.138806621Z",
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
            "StartedAt": "2022-09-04T05:09:31.512678417Z",
            "FinishedAt": "2022-09-04T05:10:04.335839958Z"
        },
        "Image": "sha256:d3a84994963f87123bed823217972c17a5650a6c99b73b508624cfd920ff3c6c",
        "ResolvConfPath": "/var/lib/docker/containers/b8a17c4278ee1047bbc95415d70288cad37e3279a3cc1a54e6ab8ad55efacff0/resolv.conf",
        "HostnamePath": "/var/lib/docker/containers/b8a17c4278ee1047bbc95415d70288cad37e3279a3cc1a54e6ab8ad55efacff0/hostname",
        "HostsPath": "/var/lib/docker/containers/b8a17c4278ee1047bbc95415d70288cad37e3279a3cc1a54e6ab8ad55efacff0/hosts",
        "LogPath": "/var/lib/docker/containers/b8a17c4278ee1047bbc95415d70288cad37e3279a3cc1a54e6ab8ad55efacff0/b8a17c4278ee1047bbc95415d70288cad37e3279a3cc1a54e6ab8ad55efacff0-json.log",
        "Name": "/stupefied_ishizaka",
        "RestartCount": 0,
        "Driver": "overlay2",
        "Platform": "linux",
        "MountLabel": "",
        "ProcessLabel": "",
        "AppArmorProfile": "docker-default",
        "ExecIDs": null,
        "HostConfig": {
            "Binds": [
                "/home/lyfubuntu/my_computer_language/docker/my_centos/:/home/"
            ],
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
                "LowerDir": "/var/lib/docker/overlay2/ac0df34d6acb5afbc2213d6333263002aaef25ce6c2d20395b42fe2adfdd5e17-init/diff:/var/lib/docker/overlay2/b360a1fae3d1896ad111cff9989dbff01057628349cefa95f28ec0a855eea506/diff:/var/lib/docker/overlay2/68c0bb331e495f19cce0129c91c6516051d2631b6d53982558d5c700237b7d64/diff",
                "MergedDir": "/var/lib/docker/overlay2/ac0df34d6acb5afbc2213d6333263002aaef25ce6c2d20395b42fe2adfdd5e17/merged",
                "UpperDir": "/var/lib/docker/overlay2/ac0df34d6acb5afbc2213d6333263002aaef25ce6c2d20395b42fe2adfdd5e17/diff",
                "WorkDir": "/var/lib/docker/overlay2/ac0df34d6acb5afbc2213d6333263002aaef25ce6c2d20395b42fe2adfdd5e17/work"
            },
            "Name": "overlay2"
        },
        "Mounts": [
            {
                "Type": "bind",
                "Source": "/home/lyfubuntu/my_computer_language/docker/my_centos",
                "Destination": "/home",
                "Mode": "",
                "RW": true,
                "Propagation": "rprivate"
            }
        ],
        "Config": {
            "Hostname": "b8a17c4278ee",
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
            "Image": "my_centos:0.1",
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
            "SandboxID": "e7966c1334467cd7d80be08487d080343106f4c808f8735c3142b42d1ecbbf3e",
            "HairpinMode": false,
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "Ports": {},
            "SandboxKey": "/var/run/docker/netns/e7966c133446",
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
                    "NetworkID": "7b6d8adfaacfe06394c48dae07f8d16d68cc268937f40f378c5b343c24d84fd8",
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
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_centos$
```

### 实战：安装 MySQL

#### 准备

1. {% label 获得宿主机IP地址 pink %}

```shell
(base) lyfubuntu@lyfubuntu:~$ # 1. 安装 net-tools，之后可以使用 ifconfig 获得 IP 地址
(base) lyfubuntu@lyfubuntu:~$ sudo apt install net-tools
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
net-tools 已经是最新版 (1.60+git20180626.aebd88e-1ubuntu1)。
升级了 0 个软件包，新安装了 0 个软件包，要卸载 0 个软件包，有 8 个软件包未被升级。
(base) lyfubuntu@lyfubuntu:~$ ifconfig
docker0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.17.0.1  netmask 255.255.0.0  broadcast 172.17.255.255
        inet6 fe80::42:85ff:fe0b:dbd6  prefixlen 64  scopeid 0x20<link>
        ether 02:42:85:0b:db:d6  txqueuelen 0  (以太网)
        RX packets 1437  bytes 1649238 (1.6 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2255  bytes 271969 (271.9 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

enp1s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.4.3.151  netmask 255.255.248.0  broadcast 10.4.7.255
        inet6 fe80::39c7:dd87:8b0b:5357  prefixlen 64  scopeid 0x20<link>
        inet6 2001:da8:1030:7::4848  prefixlen 128  scopeid 0x0<global>
        ether 40:b0:34:3e:a2:10  txqueuelen 1000  (以太网)
        RX packets 1305966  bytes 1802546317 (1.8 GB)
        RX errors 0  dropped 1282  overruns 0  frame 0
        TX packets 405627  bytes 50102678 (50.1 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (本地环回)
        RX packets 24694  bytes 3187740 (3.1 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 24694  bytes 3187740 (3.1 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

veth330d41e: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet6 fe80::41d:6bff:fe13:ae92  prefixlen 64  scopeid 0x20<link>
        ether 06:1d:6b:13:ae:92  txqueuelen 0  (以太网)
        RX packets 1437  bytes 1669356 (1.6 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2291  bytes 275923 (275.9 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

(base) lyfubuntu@lyfubuntu:~$ # IP: 10.4.3.151
(base) lyfubuntu@lyfubuntu:~$
```

2. {% label 更换软件中心 green %}

```shell
# Ubuntu 20.04.4 LTS 默认软件中心 snap 经常打不开
# 更换软件中心
$ sudo apt install ubuntu-software
$ sudo snap remove snap-store
```

![](https://cos.luyf-lemon-love.space/images/20220904182513.png)

3. {% label MySQL图形化管理工具 purple %}

   1. `MySQL Workbench` 是 `MySQL` 官方出品的一款客户端工具，`免费`，功能强大，可支持数据库建模和设计、查询开发和测试、服务器配置和监视、用户和安全管理、备份和恢复自动化、审计数据检查以及向导驱动的数据库迁移。

   2. `MySQL Workbench` 可以从该地址 [MySQL Workbench](https://www.mysql.com/products/workbench/) 下载。

   3. 打开上面安装的软件中心，搜索 `MySQL Workbench`。安装 `mysql-workbench-community`。

   ![](https://cos.luyf-lemon-love.space/images/20220904185242.png)

   ![](https://cos.luyf-lemon-love.space/images/20220904185353.png)

   4. 安装 `mysql-workbench-community` 完成后，点击 `权限(P)`，打开 `读取、添加、修改或删除已保存的密码` 按钮。

   ![](https://cos.luyf-lemon-love.space/images/20220904185912.png)

#### 安装 MySQL

`docker hub` 中 `mysql` 的主页：https://hub.docker.com/_/mysql 。

`问题`: `MySQL` 的数据持久化的问题！

```shell
# 获取镜像
$ docker pull mysql:5.7
 
# 运行容器，需要做数据挂载！ 
# 安装启动 mysql，需要配置密码（注意）
# 官方测试
$ docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag

-d      # 后台运行
-p      # 端口映射
-v      # 卷挂载
-e      # 环境配置
--name  # 容器的名字
$ docker run -d -p 3344:3306 -v /home/mysql/conf:/etc/mysql/conf.d -v /home/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 --name mysql01 mysql:5.7
 
# 启动成功之后，我们在本地使用 MySQL Workbench 连接测试一下
# MySQL Workbench 连接到服务器的 3344 --- 3344 和容器的 3306 映射，这个时候我们就可以连接上 mysql 喽！
# 在本地测试创建一个数据库，查看下我们的路径是否 ok！
```

---

```shell
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
my_centos       0.1       d3a84994963f   5 hours ago     559MB
my_tomcat       0.1       82bf5ce1034c   19 hours ago    480MB
tomcat          9.0       d4488b7f8c9b   46 hours ago    475MB
tomcat          latest    7a91e6f458bb   46 hours ago    475MB
nginx           latest    2b7d6430f78d   12 days ago     142MB
centos          latest    5d0da3dc9764   11 months ago   231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                      PORTS     NAMES
b8a17c4278ee   my_centos:0.1         "/bin/bash"              4 hours ago    Exited (0) 4 hours ago                stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        19 hours ago   Exited (143) 17 hours ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        19 hours ago   Exited (143) 19 hours ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   23 hours ago   Exited (143) 23 hours ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        25 hours ago   Exited (143) 24 hours ago             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   27 hours ago   Exited (0) 27 hours ago               nginx01
bf46371dea89   centos                "/bin/bash"              29 hours ago   Exited (0) 5 hours ago                epic_solomon
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
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
my_centos       0.1       d3a84994963f   5 hours ago     559MB
my_tomcat       0.1       82bf5ce1034c   19 hours ago    480MB
tomcat          9.0       d4488b7f8c9b   46 hours ago    475MB
tomcat          latest    7a91e6f458bb   46 hours ago    475MB
mysql           5.7       daff57b7d2d1   10 days ago     430MB
nginx           latest    2b7d6430f78d   12 days ago     142MB
centos          latest    5d0da3dc9764   11 months ago   231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                      PORTS     NAMES
b8a17c4278ee   my_centos:0.1         "/bin/bash"              4 hours ago    Exited (0) 4 hours ago                stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        19 hours ago   Exited (143) 17 hours ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        19 hours ago   Exited (143) 19 hours ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   23 hours ago   Exited (143) 23 hours ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        25 hours ago   Exited (143) 24 hours ago             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   27 hours ago   Exited (0) 27 hours ago               nginx01
bf46371dea89   centos                "/bin/bash"              29 hours ago   Exited (0) 5 hours ago                epic_solomon
(base) lyfubuntu@lyfubuntu:~$ cd my_computer_language/docker/
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ ls
centos_docker  my_centos
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ mkdir mysql
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ cd mysql/
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/mysql$ pwd
/home/lyfubuntu/my_computer_language/docker/mysql
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/mysql$ docker run -d -p 3344:3306 -v /home/lyfubuntu/my_computer_language/docker/mysql/conf:/etc/mysql/conf.d -v /home/lyfubuntu/my_computer_language/docker/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 --name mysql01 mysql:5.7
e4462368fa6f057db66d6ec8ae9e4d4f48a548b1e2c9d6db83871348b6042622
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/mysql$ docker ps
CONTAINER ID   IMAGE       COMMAND                  CREATED          STATUS          PORTS                                                  NAMES
e4462368fa6f   mysql:5.7   "docker-entrypoint.s…"   24 seconds ago   Up 21 seconds   33060/tcp, 0.0.0.0:3344->3306/tcp, :::3344->3306/tcp   mysql01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/mysql$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                      PORTS                                                  NAMES
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   29 seconds ago   Up 26 seconds               33060/tcp, 0.0.0.0:3344->3306/tcp, :::3344->3306/tcp   mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              4 hours ago      Exited (0) 4 hours ago                                                             stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        19 hours ago     Exited (143) 18 hours ago                                                          my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        19 hours ago     Exited (143) 19 hours ago                                                          tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   23 hours ago     Exited (143) 23 hours ago                                                          elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        26 hours ago     Exited (143) 24 hours ago                                                          tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   27 hours ago     Exited (0) 27 hours ago                                                            nginx01
bf46371dea89   centos                "/bin/bash"              29 hours ago     Exited (0) 5 hours ago                                                             epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/mysql$ ls
conf  data
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/mysql$ cd conf/
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/mysql/conf$ ls
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/mysql/conf$ cd ../data/
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/mysql/data$ ls
auto.cnf    client-cert.pem  ibdata1      ibtmp1      performance_schema  server-cert.pem
ca-key.pem  client-key.pem   ib_logfile0  mysql       private_key.pem     server-key.pem
ca.pem      ib_buffer_pool   ib_logfile1  mysql.sock  public_key.pem      sys
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/mysql/data$ ls
auto.cnf    ca.pem           client-key.pem  ibdata1      ib_logfile1  mysql       performance_schema  public_key.pem   server-key.pem
ca-key.pem  client-cert.pem  ib_buffer_pool  ib_logfile0  ibtmp1       mysql.sock  private_key.pem     server-cert.pem  sys
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/mysql/data$ ls
auto.cnf    ca.pem           client-key.pem  ibdata1      ib_logfile1  mysql       performance_schema  public_key.pem   server-key.pem
ca-key.pem  client-cert.pem  ib_buffer_pool  ib_logfile0  ibtmp1       mysql.sock  private_key.pem     server-cert.pem  sys
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/mysql/data$ ls
auto.cnf    ca.pem           client-key.pem  ibdata1      ib_logfile1  mysql       performance_schema  public_key.pem   server-key.pem
ca-key.pem  client-cert.pem  ib_buffer_pool  ib_logfile0  ibtmp1       mysql.sock  private_key.pem     server-cert.pem  sys
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/mysql/data$ ls
auto.cnf    ca.pem           client-key.pem  ibdata1      ib_logfile1  mysql       performance_schema  public_key.pem   server-key.pem
ca-key.pem  client-cert.pem  ib_buffer_pool  ib_logfile0  ibtmp1       mysql.sock  private_key.pem     server-cert.pem  sys
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/mysql/data$ ls
auto.cnf    ca.pem           client-key.pem  ibdata1      ib_logfile1  mysql       performance_schema  public_key.pem   server-key.pem
ca-key.pem  client-cert.pem  ib_buffer_pool  ib_logfile0  ibtmp1       mysql.sock  private_key.pem     server-cert.pem  sys
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/mysql/data$ ls
auto.cnf    ca.pem           client-key.pem  ibdata1      ib_logfile1  mysql       performance_schema  public_key.pem  server-cert.pem  sys
ca-key.pem  client-cert.pem  ib_buffer_pool  ib_logfile0  ibtmp1       mysql.sock  private_key.pem     school          server-key.pem
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/mysql/data$ # 1. 用 mysql-workbench-community 连接上 MySQL 后，创建名为 school 的数据库。
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/mysql/data$ # 2. 我们在 data 目录下发现了 school 数据库目录
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/mysql/data$ ls
auto.cnf    client-cert.pem  ibdata1      ibtmp1      performance_schema  school           sys
ca-key.pem  client-key.pem   ib_logfile0  mysql       private_key.pem     server-cert.pem
ca.pem      ib_buffer_pool   ib_logfile1  mysql.sock  public_key.pem      server-key.pem
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/mysql/data$
```

用 `mysql-workbench-community` 连接 `MySQL` ，如下图。

>`Hostname`: `10.4.3.151`
>
>`Port`: `3344`
>
>`Username`: `root`
>
>`Password`: `123456`

![](https://cos.luyf-lemon-love.space/images/20220904211136.png)

点击如下按钮创建 `school` 数据库。

![](https://cos.luyf-lemon-love.space/images/20220904212642.png)

![](https://cos.luyf-lemon-love.space/images/20220904212717.png)

---

```shell
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
my_centos       0.1       d3a84994963f   10 hours ago    559MB
my_tomcat       0.1       82bf5ce1034c   24 hours ago    480MB
tomcat          9.0       d4488b7f8c9b   2 days ago      475MB
tomcat          latest    7a91e6f458bb   2 days ago      475MB
mysql           5.7       daff57b7d2d1   10 days ago     430MB
nginx           latest    2b7d6430f78d   12 days ago     142MB
centos          latest    5d0da3dc9764   11 months ago   231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE       COMMAND                  CREATED       STATUS       PORTS                                                  NAMES
e4462368fa6f   mysql:5.7   "docker-entrypoint.s…"   5 hours ago   Up 5 hours   33060/tcp, 0.0.0.0:3344->3306/tcp, :::3344->3306/tcp   mysql01
(base) lyfubuntu@lyfubuntu:~$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                      PORTS                                                  NAMES
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   5 hours ago    Up 5 hours                  33060/tcp, 0.0.0.0:3344->3306/tcp, :::3344->3306/tcp   mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              9 hours ago    Exited (0) 9 hours ago                                                             stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        24 hours ago   Exited (143) 23 hours ago                                                          my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        24 hours ago   Exited (143) 24 hours ago                                                          tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   28 hours ago   Exited (143) 28 hours ago                                                          elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        31 hours ago   Exited (143) 29 hours ago                                                          tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   33 hours ago   Exited (0) 32 hours ago                                                            nginx01
bf46371dea89   centos                "/bin/bash"              34 hours ago   Exited (0) 10 hours ago                                                            epic_solomon
(base) lyfubuntu@lyfubuntu:~$ docker stop e4462368fa6f
e4462368fa6f
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                      PORTS     NAMES
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   5 hours ago    Exited (0) 11 seconds ago             mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              9 hours ago    Exited (0) 9 hours ago                stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        24 hours ago   Exited (143) 23 hours ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        24 hours ago   Exited (143) 24 hours ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   28 hours ago   Exited (143) 28 hours ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        31 hours ago   Exited (143) 29 hours ago             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   33 hours ago   Exited (0) 32 hours ago               nginx01
bf46371dea89   centos                "/bin/bash"              34 hours ago   Exited (0) 10 hours ago               epic_solomon
(base) lyfubuntu@lyfubuntu:~$
```

![](https://cos.luyf-lemon-love.space/images/20220904220523.png)

### 匿名和具名挂载

```shell
# 匿名挂载
# -v 容器内路径
# -P 随机指定端口
$ docker run -d -P --name nginx01 -v /etc/nginx nginx
 
# 查看所有 volume 的情况
$ docker volume ls
DRIVER              VOLUME NAME
local               561b81a03506f31d45ada3f9fb7bd8d7c9b5e0f826c877221a17e45d4c80e096
local               36083fb6ca083005094cbd49572a0bffeec6daadfbc5ce772909bb00be760882
 
# 匿名挂载，我们在 -v 后面只写了容器内的路径，没有写容器外的路径！
 
# 具名挂载
$ docker run -d -P --name nginx02 -v juming-nginx:/etc/nginx nginx
26da1ec7d4994c76e80134d24d82403a254a4e1d84ec65d5f286000105c3da17
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                   NAMES
26da1ec7d499        nginx               "/docker-entrypoint.…"   3 seconds ago       Up 2 seconds        0.0.0.0:32769->80/tcp   nginx02
486de1da03cb        nginx               "/docker-entrypoint.…"   3 minutes ago       Up 3 minutes        0.0.0.0:32768->80/tcp   nginx01
$ docker volume ls
DRIVER              VOLUME NAME
local               561b81a03506f31d45ada3f9fb7bd8d7c9b5e0f826c877221a17e45d4c80e096
local               36083fb6ca083005094cbd49572a0bffeec6daadfbc5ce772909bb00be760882
local               juming-nginx
 
# 通过 -v 卷名:容器内的路径
# 查看一下这个卷
# docker volume inspect juming-nginx
 
$ docker volume inspect juming-nginx
[
  {
      "CreatedAt": "2020-08-12T18:15:21+08:00",
      "Driver": "local",
      "Labels": null,
      "Mountpoint": "/var/lib/docker/volumes/juming-nginx/_data",
      "Name": "juming-nginx",
      "Options": null,
      "Scope": "local"
  }
]
```

所有 `docker` 容器内的卷，没有指定目录的情况下都是在 `/var/lib/docker/volumes/xxx/_data` 中。

我们通过`具名挂载`可以方便的找到我们的一个卷，大多数情况下使用的是`具名挂载`。

```shell
# 如何确定是具名挂载还是匿名挂载，还是指定路径挂载！
-v  容器内路径                   # 匿名挂载
-v  卷名:容器内路径               # 具名挂载
-v /主机路径:容器内路径            # 指定路径挂载
```

---

```shell
(base) lyfubuntu@lyfubuntu:~$ cd my_computer_language/docker/
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ ls
centos_docker  my_centos  mysql
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ mkdir nginx
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ ls
centos_docker  my_centos  mysql  nginx
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ cd nginx/
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$ ls
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
my_centos       0.1       d3a84994963f   11 hours ago    559MB
my_tomcat       0.1       82bf5ce1034c   25 hours ago    480MB
tomcat          9.0       d4488b7f8c9b   2 days ago      475MB
tomcat          latest    7a91e6f458bb   2 days ago      475MB
mysql           5.7       daff57b7d2d1   10 days ago     430MB
nginx           latest    2b7d6430f78d   12 days ago     142MB
centos          latest    5d0da3dc9764   11 months ago   231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                      PORTS     NAMES
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   6 hours ago    Exited (0) 46 minutes ago             mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              10 hours ago   Exited (0) 10 hours ago               stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        25 hours ago   Exited (143) 23 hours ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        25 hours ago   Exited (143) 25 hours ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   29 hours ago   Exited (143) 29 hours ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        31 hours ago   Exited (143) 30 hours ago             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   33 hours ago   Exited (0) 33 hours ago               nginx01
bf46371dea89   centos                "/bin/bash"              35 hours ago   Exited (0) 11 hours ago               epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$ docker run -d -P --name nginx02 -v /etc/nginx nginx
880d9b4349bc94ab50ba9c97420e0d4e2039806f81f81de89bc0bf814ac23ffd
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                                     NAMES
880d9b4349bc   nginx     "/docker-entrypoint.…"   9 seconds ago   Up 5 seconds   0.0.0.0:49153->80/tcp, :::49153->80/tcp   nginx02
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                      PORTS                                     NAMES
880d9b4349bc   nginx                 "/docker-entrypoint.…"   19 seconds ago   Up 15 seconds               0.0.0.0:49153->80/tcp, :::49153->80/tcp   nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   6 hours ago      Exited (0) 51 minutes ago                                             mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              10 hours ago     Exited (0) 10 hours ago                                               stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        25 hours ago     Exited (143) 24 hours ago                                             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        25 hours ago     Exited (143) 25 hours ago                                             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   29 hours ago     Exited (143) 29 hours ago                                             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        32 hours ago     Exited (143) 30 hours ago                                             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   33 hours ago     Exited (0) 33 hours ago                                               nginx01
bf46371dea89   centos                "/bin/bash"              35 hours ago     Exited (0) 11 hours ago                                               epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$ docker volume --help

Usage:  docker volume COMMAND

Manage volumes

Commands:
  create      Create a volume
  inspect     Display detailed information on one or more volumes
  ls          List volumes
  prune       Remove all unused local volumes
  rm          Remove one or more volumes

Run 'docker volume COMMAND --help' for more information on a command.
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$ docker volume ls
DRIVER    VOLUME NAME
local     0fc252014e7c36f69b52a5a37bed32d8f1f8e95371019512fbe91ae61c40f988
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$ docker run -d -P --name nginx03 -v juming-nginx:/etc/nginx nginx
6abbcb16d1f629928195d5050eb9624d72322de9e3a7a4fa7f7bb6e466be5f99
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                                     NAMES
6abbcb16d1f6   nginx     "/docker-entrypoint.…"   24 seconds ago   Up 21 seconds   0.0.0.0:49154->80/tcp, :::49154->80/tcp   nginx03
880d9b4349bc   nginx     "/docker-entrypoint.…"   3 minutes ago    Up 3 minutes    0.0.0.0:49153->80/tcp, :::49153->80/tcp   nginx02
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$ docker volume ls
DRIVER    VOLUME NAME
local     0fc252014e7c36f69b52a5a37bed32d8f1f8e95371019512fbe91ae61c40f988
local     juming-nginx
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$ docker volume inspect juming-nginx
[
    {
        "CreatedAt": "2022-09-04T22:56:38+08:00",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/juming-nginx/_data",
        "Name": "juming-nginx",
        "Options": null,
        "Scope": "local"
    }
]
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$ su root
密码： 
root@lyfubuntu:/home/lyfubuntu/my_computer_language/docker/nginx# cd /var/lib/docker/
root@lyfubuntu:/var/lib/docker# ls
buildkit  containers  image  network  overlay2  plugins  runtimes  swarm  tmp  trust  volumes
root@lyfubuntu:/var/lib/docker# cd volumes/
root@lyfubuntu:/var/lib/docker/volumes# ls
0fc252014e7c36f69b52a5a37bed32d8f1f8e95371019512fbe91ae61c40f988  backingFsBlockDev  juming-nginx  metadata.db
root@lyfubuntu:/var/lib/docker/volumes# cd juming-nginx/
root@lyfubuntu:/var/lib/docker/volumes/juming-nginx# ls
_data
root@lyfubuntu:/var/lib/docker/volumes/juming-nginx# cd _data/
root@lyfubuntu:/var/lib/docker/volumes/juming-nginx/_data# ls
conf.d  fastcgi_params  mime.types  modules  nginx.conf  scgi_params  uwsgi_params
root@lyfubuntu:/var/lib/docker/volumes/juming-nginx/_data# exit
exit
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$ ls
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
my_centos       0.1       d3a84994963f   11 hours ago    559MB
my_tomcat       0.1       82bf5ce1034c   25 hours ago    480MB
tomcat          9.0       d4488b7f8c9b   2 days ago      475MB
tomcat          latest    7a91e6f458bb   2 days ago      475MB
mysql           5.7       daff57b7d2d1   10 days ago     430MB
nginx           latest    2b7d6430f78d   12 days ago     142MB
centos          latest    5d0da3dc9764   11 months ago   231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                                     NAMES
6abbcb16d1f6   nginx     "/docker-entrypoint.…"   10 minutes ago   Up 10 minutes   0.0.0.0:49154->80/tcp, :::49154->80/tcp   nginx03
880d9b4349bc   nginx     "/docker-entrypoint.…"   13 minutes ago   Up 13 minutes   0.0.0.0:49153->80/tcp, :::49153->80/tcp   nginx02
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                         PORTS                                     NAMES
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   10 minutes ago   Up 10 minutes                  0.0.0.0:49154->80/tcp, :::49154->80/tcp   nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   14 minutes ago   Up 13 minutes                  0.0.0.0:49153->80/tcp, :::49153->80/tcp   nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   6 hours ago      Exited (0) About an hour ago                                             mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              10 hours ago     Exited (0) 10 hours ago                                                  stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        25 hours ago     Exited (143) 24 hours ago                                                my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        25 hours ago     Exited (143) 25 hours ago                                                tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   29 hours ago     Exited (143) 29 hours ago                                                elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        32 hours ago     Exited (143) 30 hours ago                                                tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   34 hours ago     Exited (0) 33 hours ago                                                  nginx01
bf46371dea89   centos                "/bin/bash"              35 hours ago     Exited (0) 11 hours ago                                                  epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$ docker stop 6abbcb16d1f6 880d9b4349bc
6abbcb16d1f6
880d9b4349bc
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
my_centos       0.1       d3a84994963f   11 hours ago    559MB
my_tomcat       0.1       82bf5ce1034c   25 hours ago    480MB
tomcat          9.0       d4488b7f8c9b   2 days ago      475MB
tomcat          latest    7a91e6f458bb   2 days ago      475MB
mysql           5.7       daff57b7d2d1   10 days ago     430MB
nginx           latest    2b7d6430f78d   12 days ago     142MB
centos          latest    5d0da3dc9764   11 months ago   231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                         PORTS     NAMES
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   12 minutes ago   Exited (0) 17 seconds ago                nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   15 minutes ago   Exited (0) 17 seconds ago                nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   6 hours ago      Exited (0) About an hour ago             mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              10 hours ago     Exited (0) 10 hours ago                  stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        25 hours ago     Exited (143) 24 hours ago                my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        25 hours ago     Exited (143) 25 hours ago                tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   29 hours ago     Exited (143) 29 hours ago                elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        32 hours ago     Exited (143) 30 hours ago                tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   34 hours ago     Exited (0) 33 hours ago                  nginx01
bf46371dea89   centos                "/bin/bash"              35 hours ago     Exited (0) 11 hours ago                  epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/nginx$
```

---

{% label 拓展 pink %}

```shell
# -v 容器内容路径 
# ro rw 改变读写权限
ro  readonly    # 只读
rw  readwrite   # 可读可写
 
docker run -d -P --name nginx02 -v juming-nginx:/etc/nginx:ro nginx
docker run -d -P --name nginx02 -v juming-nginx:/etc/nginx:rw nginx
 
# ro 这个路径只能通过宿主机来操作，容器内部无法操作！
```

## Dockerfile

### 初始 Dockerfile

---

`docker hub` 中 `centos` 的主页：https://hub.docker.com/_/centos 。

**Supported tags and respective Dockerfile links**

- [centos7, 7, centos7.9.2009, 7.9.2009](https://github.com/CentOS/sig-cloud-instance-images/blob/b2d195220e1c5b181427c3172829c23ab9cd27eb/docker/Dockerfile)

```dockerfile
FROM scratch
ADD centos-7-x86_64-docker.tar.xz /

LABEL \
    org.label-schema.schema-version="1.0" \
    org.label-schema.name="CentOS Base Image" \
    org.label-schema.vendor="CentOS" \
    org.label-schema.license="GPLv2" \
    org.label-schema.build-date="20201113" \
    org.opencontainers.image.title="CentOS Base Image" \
    org.opencontainers.image.vendor="CentOS" \
    org.opencontainers.image.licenses="GPL-2.0-only" \
    org.opencontainers.image.created="2020-11-13 00:00:00+00:00"

CMD ["/bin/bash"]
```

---

`Dockerfile`: 用来构建 `docker` 镜像的构建文件！是一个命令脚本！

通过下面的脚本可以生成镜像，镜像是一层层的。脚本也是由一个个的命令组成的，每个命令都是镜像的一层。

```dockerfile
# 创建一个 Dockerfile 文件，名字任意
# 每个命令都是镜像的一层

FROM centos

VOLUME ["volume01", "volume02"]

CMD echo "----end----"
CMD /bin/bash
```

```shell
(base) lyfubuntu@lyfubuntu:~$ cd my_computer_language/docker/
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ ls
centos_docker  my_centos  mysql  nginx
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ mkdir my_Dockerfile
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ ls
centos_docker  my_centos  my_Dockerfile  mysql  nginx
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ cd my_Dockerfile/
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ ls
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ vim dockerfile1
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ cat dockerfile1 
# 创建一个 Dockerfile 文件，名字任意
# 每个命令都是镜像的一层

FROM centos

VOLUME ["volume01", "volume02"]

CMD echo "----end----"
CMD /bin/bash
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker build --help

Usage:  docker build [OPTIONS] PATH | URL | -

Build an image from a Dockerfile

Options:
      --add-host list           Add a custom host-to-IP mapping (host:ip)
      --build-arg list          Set build-time variables
      --cache-from strings      Images to consider as cache sources
      --cgroup-parent string    Optional parent cgroup for the container
      --compress                Compress the build context using gzip
      --cpu-period int          Limit the CPU CFS (Completely Fair
                                Scheduler) period
      --cpu-quota int           Limit the CPU CFS (Completely Fair
                                Scheduler) quota
  -c, --cpu-shares int          CPU shares (relative weight)
      --cpuset-cpus string      CPUs in which to allow execution (0-3, 0,1)
      --cpuset-mems string      MEMs in which to allow execution (0-3, 0,1)
      --disable-content-trust   Skip image verification (default true)
  -f, --file string             Name of the Dockerfile (Default is
                                'PATH/Dockerfile')
      --force-rm                Always remove intermediate containers
      --iidfile string          Write the image ID to the file
      --isolation string        Container isolation technology
      --label list              Set metadata for an image
  -m, --memory bytes            Memory limit
      --memory-swap bytes       Swap limit equal to memory plus swap:
                                '-1' to enable unlimited swap
      --network string          Set the networking mode for the RUN
                                instructions during build (default "default")
      --no-cache                Do not use cache when building the image
      --pull                    Always attempt to pull a newer version
                                of the image
  -q, --quiet                   Suppress the build output and print
                                image ID on success
      --rm                      Remove intermediate containers after a
                                successful build (default true)
      --security-opt strings    Security options
      --shm-size bytes          Size of /dev/shm
  -t, --tag list                Name and optionally a tag in the
                                'name:tag' format
      --target string           Set the target build stage to build.
      --ulimit ulimit           Ulimit options (default [])
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker build -f dockerfile1 -t lyf/centos:1.0 .
Sending build context to Docker daemon  2.048kB
Step 1/4 : FROM centos
 ---> 5d0da3dc9764
Step 2/4 : VOLUME ["volume01", "volume02"]
 ---> Running in c35ff88bf912
Removing intermediate container c35ff88bf912
 ---> 1f95015669bb
Step 3/4 : CMD echo "----end----"
 ---> Running in 70f063888f12
Removing intermediate container 70f063888f12
 ---> 5c988b11074b
Step 4/4 : CMD /bin/bash
 ---> Running in 9216630ec5a8
Removing intermediate container 9216630ec5a8
 ---> 967c603048b0
Successfully built 967c603048b0
Successfully tagged lyf/centos:1.0
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED          SIZE
lyf/centos      1.0       967c603048b0   46 seconds ago   231MB
my_centos       0.1       d3a84994963f   27 hours ago     559MB
my_tomcat       0.1       82bf5ce1034c   41 hours ago     480MB
tomcat          9.0       d4488b7f8c9b   2 days ago       475MB
tomcat          latest    7a91e6f458bb   2 days ago       475MB
mysql           5.7       daff57b7d2d1   11 days ago      430MB
nginx           latest    2b7d6430f78d   13 days ago      142MB
centos          latest    5d0da3dc9764   11 months ago    231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago      791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                      PORTS     NAMES
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   17 hours ago   Exited (0) 16 hours ago               nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   17 hours ago   Exited (0) 16 hours ago               nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   23 hours ago   Exited (0) 17 hours ago               mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              27 hours ago   Exited (0) 26 hours ago               stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        41 hours ago   Exited (143) 40 hours ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        41 hours ago   Exited (143) 41 hours ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   45 hours ago   Exited (143) 45 hours ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        2 days ago     Exited (143) 47 hours ago             tomcat01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                      PORTS     NAMES
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   17 hours ago   Exited (0) 16 hours ago               nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   17 hours ago   Exited (0) 16 hours ago               nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   23 hours ago   Exited (0) 17 hours ago               mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              27 hours ago   Exited (0) 26 hours ago               stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        41 hours ago   Exited (143) 40 hours ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        41 hours ago   Exited (143) 41 hours ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   45 hours ago   Exited (143) 45 hours ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        2 days ago     Exited (143) 47 hours ago             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   2 days ago     Exited (0) 2 days ago                 nginx01
bf46371dea89   centos                "/bin/bash"              2 days ago     Exited (0) 28 hours ago               epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                      PORTS     NAMES
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   17 hours ago   Exited (0) 16 hours ago               nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   17 hours ago   Exited (0) 16 hours ago               nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   23 hours ago   Exited (0) 17 hours ago               mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              27 hours ago   Exited (0) 26 hours ago               stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        41 hours ago   Exited (143) 40 hours ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        41 hours ago   Exited (143) 41 hours ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   45 hours ago   Exited (143) 45 hours ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        2 days ago     Exited (143) 47 hours ago             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   2 days ago     Exited (0) 2 days ago                 nginx01
bf46371dea89   centos                "/bin/bash"              2 days ago     Exited (0) 28 hours ago               epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
lyf/centos      1.0       967c603048b0   6 minutes ago   231MB
my_centos       0.1       d3a84994963f   27 hours ago    559MB
my_tomcat       0.1       82bf5ce1034c   41 hours ago    480MB
tomcat          9.0       d4488b7f8c9b   2 days ago      475MB
tomcat          latest    7a91e6f458bb   2 days ago      475MB
mysql           5.7       daff57b7d2d1   11 days ago     430MB
nginx           latest    2b7d6430f78d   13 days ago     142MB
centos          latest    5d0da3dc9764   11 months ago   231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker run -it lyf/centos:1.0 /bin/bash
[root@489086f92c85 /]# ls 
bin  etc   lib	  lost+found  mnt  proc  run   srv  tmp  var	   volume02
dev  home  lib64  media       opt  root  sbin  sys  usr  volume01
[root@489086f92c85 /]# exit
exit
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                      PORTS     NAMES
489086f92c85   lyf/centos:1.0        "/bin/bash"              44 seconds ago   Exited (0) 10 seconds ago             admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   17 hours ago     Exited (0) 16 hours ago               nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   17 hours ago     Exited (0) 16 hours ago               nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   23 hours ago     Exited (0) 18 hours ago               mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              27 hours ago     Exited (0) 26 hours ago               stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        41 hours ago     Exited (143) 40 hours ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        42 hours ago     Exited (143) 41 hours ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   46 hours ago     Exited (143) 45 hours ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        2 days ago       Exited (143) 47 hours ago             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   2 days ago       Exited (0) 2 days ago                 nginx01
bf46371dea89   centos                "/bin/bash"              2 days ago       Exited (0) 28 hours ago               epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker inspect 489086f92c85
[
    {
        "Id": "489086f92c85352aa4b59248e015e8698b474a9b395b967f1a5a46eac11a8d4e",
        "Created": "2022-09-05T07:35:31.947167545Z",
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
            "StartedAt": "2022-09-05T07:35:34.362946608Z",
            "FinishedAt": "2022-09-05T07:36:05.143760819Z"
        },
        "Image": "sha256:967c603048b0d92fec03e8309d1147db088bfc9ff2e26ac4f174643ed0993f69",
        "ResolvConfPath": "/var/lib/docker/containers/489086f92c85352aa4b59248e015e8698b474a9b395b967f1a5a46eac11a8d4e/resolv.conf",
        "HostnamePath": "/var/lib/docker/containers/489086f92c85352aa4b59248e015e8698b474a9b395b967f1a5a46eac11a8d4e/hostname",
        "HostsPath": "/var/lib/docker/containers/489086f92c85352aa4b59248e015e8698b474a9b395b967f1a5a46eac11a8d4e/hosts",
        "LogPath": "/var/lib/docker/containers/489086f92c85352aa4b59248e015e8698b474a9b395b967f1a5a46eac11a8d4e/489086f92c85352aa4b59248e015e8698b474a9b395b967f1a5a46eac11a8d4e-json.log",
        "Name": "/admiring_dhawan",
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
                "LowerDir": "/var/lib/docker/overlay2/6774b357bae1ee230ab9e2516a8b667fc4cd760db55a640176219144adb09a6b-init/diff:/var/lib/docker/overlay2/68c0bb331e495f19cce0129c91c6516051d2631b6d53982558d5c700237b7d64/diff",
                "MergedDir": "/var/lib/docker/overlay2/6774b357bae1ee230ab9e2516a8b667fc4cd760db55a640176219144adb09a6b/merged",
                "UpperDir": "/var/lib/docker/overlay2/6774b357bae1ee230ab9e2516a8b667fc4cd760db55a640176219144adb09a6b/diff",
                "WorkDir": "/var/lib/docker/overlay2/6774b357bae1ee230ab9e2516a8b667fc4cd760db55a640176219144adb09a6b/work"
            },
            "Name": "overlay2"
        },
        "Mounts": [
            {
                "Type": "volume",
                "Name": "d8e5241795da1452f01a568ed998539ea38636412506e108079fb428e2d5d014",
                "Source": "/var/lib/docker/volumes/d8e5241795da1452f01a568ed998539ea38636412506e108079fb428e2d5d014/_data",
                "Destination": "volume01",
                "Driver": "local",
                "Mode": "",
                "RW": true,
                "Propagation": ""
            },
            {
                "Type": "volume",
                "Name": "a82328860bc07355241e3a4ae3ca30d2aac218c8d7f892101f47f38947bc72cb",
                "Source": "/var/lib/docker/volumes/a82328860bc07355241e3a4ae3ca30d2aac218c8d7f892101f47f38947bc72cb/_data",
                "Destination": "volume02",
                "Driver": "local",
                "Mode": "",
                "RW": true,
                "Propagation": ""
            }
        ],
        "Config": {
            "Hostname": "489086f92c85",
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
            "Image": "lyf/centos:1.0",
            "Volumes": {
                "volume01": {},
                "volume02": {}
            },
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
            "SandboxID": "b45948e64c6cc42888f2cc224f090977b3af053e64a5d1beb8d394160ee9c556",
            "HairpinMode": false,
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "Ports": {},
            "SandboxKey": "/var/run/docker/netns/b45948e64c6c",
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
                    "NetworkID": "ee080f3b5bbe9b14b9badcdb67f600dacd5ddc5a99c4e8fd0629226ad3c36d45",
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
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker start 489086f92c85
489086f92c85
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps 
CONTAINER ID   IMAGE            COMMAND       CREATED         STATUS         PORTS     NAMES
489086f92c85   lyf/centos:1.0   "/bin/bash"   4 minutes ago   Up 2 seconds             admiring_dhawan
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docekr attach 489086f92c85

找不到命令“docekr”，您的意思是：

  command 'docker' from snap docker (20.10.14)
  command 'docker' from deb docker.io (20.10.12-0ubuntu2~20.04.1)

See 'snap info <snapname>' for additional versions.

(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker attach 489086f92c85
[root@489086f92c85 /]# ls
bin  dev  etc  home  lib  lib64  lost+found  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var  volume01	volume02
[root@489086f92c85 /]# cd volume01
[root@489086f92c85 volume01]# ls
[root@489086f92c85 volume01]# touch lyf/centos_v01
touch: cannot touch 'lyf/centos_v01': No such file or directory
[root@489086f92c85 volume01]# ls
[root@489086f92c85 volume01]# touch lyf_centos_v01
[root@489086f92c85 volume01]# ls
lyf_centos_v01
[root@489086f92c85 volume01]# exit
exit
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED         STATUS                      PORTS     NAMES
489086f92c85   lyf/centos:1.0        "/bin/bash"              7 minutes ago   Exited (0) 8 seconds ago              admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   17 hours ago    Exited (0) 17 hours ago               nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   17 hours ago    Exited (0) 17 hours ago               nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   23 hours ago    Exited (0) 18 hours ago               mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              27 hours ago    Exited (0) 27 hours ago               stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        41 hours ago    Exited (143) 40 hours ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        42 hours ago    Exited (143) 42 hours ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   46 hours ago    Exited (143) 46 hours ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        2 days ago      Exited (143) 47 hours ago             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   2 days ago      Exited (0) 2 days ago                 nginx01
bf46371dea89   centos                "/bin/bash"              2 days ago      Exited (0) 28 hours ago               epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ su root
密码： 
root@lyfubuntu:/home/lyfubuntu/my_computer_language/docker/my_Dockerfile# cd /var/lib/docker/volumes/d8e5241795da1452f01a568ed998539ea38636412506e108079fb428e2d5d014/_data
root@lyfubuntu:/var/lib/docker/volumes/d8e5241795da1452f01a568ed998539ea38636412506e108079fb428e2d5d014/_data# ls
lyf_centos_v01
root@lyfubuntu:/var/lib/docker/volumes/d8e5241795da1452f01a568ed998539ea38636412506e108079fb428e2d5d014/_data# exit
exit
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED          SIZE
lyf/centos      1.0       967c603048b0   17 minutes ago   231MB
my_centos       0.1       d3a84994963f   28 hours ago     559MB
my_tomcat       0.1       82bf5ce1034c   42 hours ago     480MB
tomcat          9.0       d4488b7f8c9b   2 days ago       475MB
tomcat          latest    7a91e6f458bb   2 days ago       475MB
mysql           5.7       daff57b7d2d1   11 days ago      430MB
nginx           latest    2b7d6430f78d   13 days ago      142MB
centos          latest    5d0da3dc9764   11 months ago    231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago      791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED         STATUS                          PORTS     NAMES
489086f92c85   lyf/centos:1.0        "/bin/bash"              8 minutes ago   Exited (0) About a minute ago             admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   17 hours ago    Exited (0) 17 hours ago                   nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   17 hours ago    Exited (0) 17 hours ago                   nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   23 hours ago    Exited (0) 18 hours ago                   mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              27 hours ago    Exited (0) 27 hours ago                   stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        41 hours ago    Exited (143) 40 hours ago                 my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        42 hours ago    Exited (143) 42 hours ago                 tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   46 hours ago    Exited (143) 46 hours ago                 elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        2 days ago      Exited (143) 47 hours ago                 tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   2 days ago      Exited (0) 2 days ago                     nginx01
bf46371dea89   centos                "/bin/bash"              2 days ago      Exited (0) 28 hours ago                   epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # 通过上面的 实验得出：
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # volume01 和 volume02 这两个目录就是我们生成镜像的时候自动挂载的数据卷目录
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # volume01 和 volume02 是匿名挂载方式
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # 这两个卷和 外部一定有一个同步的目录！
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # 通过 `docker inspect 容器id` 可以找到与两个卷对应的宿主机目录
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # 最终确定文 件已经同步到宿主机上了
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # 这种方式很 方便，否则需要手动挂载目录 -> `-v 卷名:容器内路径
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$
```

### 数据卷容器

> 多个 `mysql` 同步数据！

![](https://cos.luyf-lemon-love.space/images/20220905174324.png)

> 启动 `3` 个容器，启动我们刚才自己写的镜像

![](https://cos.luyf-lemon-love.space/images/20220905174724.png)

![](https://cos.luyf-lemon-love.space/images/20220905174737.png)

---

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
lyf/centos      1.0       967c603048b0   2 hours ago     231MB
my_centos       0.1       d3a84994963f   29 hours ago    559MB
my_tomcat       0.1       82bf5ce1034c   43 hours ago    480MB
tomcat          9.0       d4488b7f8c9b   2 days ago      475MB
tomcat          latest    7a91e6f458bb   2 days ago      475MB
mysql           5.7       daff57b7d2d1   11 days ago     430MB
nginx           latest    2b7d6430f78d   13 days ago     142MB
centos          latest    5d0da3dc9764   11 months ago   231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                      PORTS     NAMES
489086f92c85   lyf/centos:1.0        "/bin/bash"              2 hours ago    Exited (0) 2 hours ago                admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   19 hours ago   Exited (0) 18 hours ago               nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   19 hours ago   Exited (0) 18 hours ago               nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   25 hours ago   Exited (0) 19 hours ago               mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              29 hours ago   Exited (0) 28 hours ago               stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        43 hours ago   Exited (143) 42 hours ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        43 hours ago   Exited (143) 43 hours ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   47 hours ago   Exited (143) 47 hours ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        2 days ago     Exited (143) 2 days ago               tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   2 days ago     Exited (0) 2 days ago                 nginx01
bf46371dea89   centos                "/bin/bash"              2 days ago     Exited (0) 30 hours ago               epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker run it(base(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker run -it --name docker01 lyf/centos:1.0
[root@bff7cd75704f /]# ls
bin  etc   lib	  lost+found  mnt  proc  run   srv  tmp  var	   volume02
dev  home  lib64  media       opt  root  sbin  sys  usr  volume01
[root@bff7cd75704f /]# cd volume01
[root@bff7cd75704f volume01]# ls
[root@bff7cd75704f volume01]# touch docker01
[root@bff7cd75704f volume01]# l
bash: l: command not found
[root@bff7cd75704f volume01]# ls
docker01
[root@bff7cd75704f volume01]# (base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ 
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
lyf/centos      1.0       967c603048b0   2 hours ago     231MB
my_centos       0.1       d3a84994963f   29 hours ago    559MB
my_tomcat       0.1       82bf5ce1034c   43 hours ago    480MB
tomcat          9.0       d4488b7f8c9b   2 days ago      475MB
tomcat          latest    7a91e6f458bb   2 days ago      475MB
mysql           5.7       daff57b7d2d1   11 days ago     430MB
nginx           latest    2b7d6430f78d   13 days ago     142MB
centos          latest    5d0da3dc9764   11 months ago   231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps
CONTAINER ID   IMAGE            COMMAND                  CREATED              STATUS              PORTS     NAMES
bff7cd75704f   lyf/centos:1.0   "/bin/sh -c /bin/bash"   About a minute ago   Up About a minute             docker01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED              STATUS                      PORTS     NAMES
bff7cd75704f   lyf/centos:1.0        "/bin/sh -c /bin/bash"   About a minute ago   Up About a minute                     docker01
489086f92c85   lyf/centos:1.0        "/bin/bash"              2 hours ago          Exited (0) 2 hours ago                admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   19 hours ago         Exited (0) 18 hours ago               nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   19 hours ago         Exited (0) 18 hours ago               nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   25 hours ago         Exited (0) 19 hours ago               mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              29 hours ago         Exited (0) 28 hours ago               stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        43 hours ago         Exited (143) 42 hours ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        43 hours ago         Exited (143) 43 hours ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   47 hours ago         Exited (143) 47 hours ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        2 days ago           Exited (143) 2 days ago               tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   2 days ago           Exited (0) 2 days ago                 nginx01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker run (base(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker run -it --name docker02 --volumes-from docker01 lyf/centos:1.0
[root@a85d30f34140 /]# ls
bin  etc   lib	  lost+found  mnt  proc  run   srv  tmp  var	   volume02
dev  home  lib64  media       opt  root  sbin  sys  usr  volume01
[root@a85d30f34140 /]# cd volume01
[root@a85d30f34140 volume01]# ls
docker01
[root@a85d30f34140 volume01]# touch docker02
[root@a85d30f34140 volume01]# (base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ 
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker run -it --name docker03 --volumes-from docker01 lyf/centos:1.0
[root@3de864354aec /]# ls
bin  etc   lib	  lost+found  mnt  proc  run   srv  tmp  var	   volume02
dev  home  lib64  media       opt  root  sbin  sys  usr  volume01
[root@3de864354aec /]# cd volume01
[root@3de864354aec volume01]# ls
docker01  docker02
[root@3de864354aec volume01]# touch docker03
[root@3de864354aec volume01]# ls
docker01  docker02  docker03
[root@3de864354aec volume01]# (base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ ls
dockerfile1
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps
CONTAINER ID   IMAGE            COMMAND                  CREATED          STATUS          PORTS     NAMES
3de864354aec   lyf/centos:1.0   "/bin/sh -c /bin/bash"   54 seconds ago   Up 52 seconds             docker03
a85d30f34140   lyf/centos:1.0   "/bin/sh -c /bin/bash"   2 minutes ago    Up 2 minutes              docker02
bff7cd75704f   lyf/centos:1.0   "/bin/sh -c /bin/bash"   5 minutes ago    Up 5 minutes              docker01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED              STATUS                      PORTS     NAMES
3de864354aec   lyf/centos:1.0        "/bin/sh -c /bin/bash"   About a minute ago   Up 59 seconds                         docker03
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   2 minutes ago        Up 2 minutes                          docker02
bff7cd75704f   lyf/centos:1.0        "/bin/sh -c /bin/bash"   6 minutes ago        Up 5 minutes                          docker01
489086f92c85   lyf/centos:1.0        "/bin/bash"              2 hours ago          Exited (0) 2 hours ago                admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   19 hours ago         Exited (0) 18 hours ago               nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   19 hours ago         Exited (0) 18 hours ago               nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   25 hours ago         Exited (0) 20 hours ago               mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              29 hours ago         Exited (0) 28 hours ago               stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        43 hours ago         Exited (143) 42 hours ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        44 hours ago         Exited (143) 43 hours ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   2 days ago           Exited (143) 47 hours ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        2 days ago           Exited (143) 2 days ago               tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   2 days ago           Exited (0) 2 days ago                 nginx01
bf46371dea89   centos                "/bin/bash"              2 days ago           Exited (0) 30 hours ago               epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker attach bff7cd75704f
[root@bff7cd75704f volume01]# ls
docker01  docker02  docker03
[root@bff7cd75704f volume01]# read escape sequence
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker rm -f docker01 docker03
docker01
docker03
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps
CONTAINER ID   IMAGE            COMMAND                  CREATED         STATUS         PORTS     NAMES
a85d30f34140   lyf/centos:1.0   "/bin/sh -c /bin/bash"   3 minutes ago   Up 3 minutes             docker02
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED         STATUS                      PORTS     NAMES
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   3 minutes ago   Up 3 minutes                          docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              2 hours ago     Exited (0) 2 hours ago                admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   19 hours ago    Exited (0) 18 hours ago               nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   19 hours ago    Exited (0) 18 hours ago               nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   25 hours ago    Exited (0) 20 hours ago               mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              29 hours ago    Exited (0) 28 hours ago               stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        43 hours ago    Exited (143) 42 hours ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        44 hours ago    Exited (143) 43 hours ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   2 days ago      Exited (143) 47 hours ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        2 days ago      Exited (143) 2 days ago               tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   2 days ago      Exited (0) 2 days ago                 nginx01
bf46371dea89   centos                "/bin/bash"              2 days ago      Exited (0) 30 hours ago               epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker attach docker02
[root@a85d30f34140 volume01]# ls
docker01  docker02  docker03
[root@a85d30f34140 volume01]# exit
exit
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED         STATUS                      PORTS     NAMES
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   4 minutes ago   Exited (0) 14 seconds ago             docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              2 hours ago     Exited (0) 2 hours ago                admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   19 hours ago    Exited (0) 19 hours ago               nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   19 hours ago    Exited (0) 19 hours ago               nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   25 hours ago    Exited (0) 20 hours ago               mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              29 hours ago    Exited (0) 28 hours ago               stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        43 hours ago    Exited (143) 42 hours ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        44 hours ago    Exited (143) 43 hours ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   2 days ago      Exited (143) 47 hours ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        2 days ago      Exited (143) 2 days ago               tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   2 days ago      Exited (0) 2 days ago                 nginx01
bf46371dea89   centos                "/bin/bash"              2 days ago      Exited (0) 30 hours ago               epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$
```

---

多个 `mysql` 实现数据共享

```shell
$ docker run -d -p 3344:3306 -v /etc/mysql/conf.d -v /var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 --name mysql01 mysql:5.7
 
$ docker run -d -p 3344:3306 -v /etc/mysql/conf.d -v /var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 --name mysql02 --volumes-from mysql01 mysql:5.7
```

**结论**

1. `容器之间的配置信息`可以通过`数据卷容器`传递。

2. `数据卷容器`的`生命周期`一直持续到没有容器使用为止。

3. 一旦你持久化到了`本地`，这个时候，`本地的数据是不会删除的`！

### Dockerfile

`dockerFile` 是用来构建 `docker` 镜像的文件！命令参数脚本！

{% label 构建步骤 purple %}

1. 编写一个 `dockerFile` 文件。

2. `docker build` 使用 `dockerFile` 构建一个`镜像`。

3. `docker run` 运行镜像。

4. `docker push` 发布镜像（ `DockerHub`、`阿里云镜像` ）。

---

![](https://cos.luyf-lemon-love.space/images/20220905231012.png)

![](https://cos.luyf-lemon-love.space/images/20220905231039.png)

---

很多`官方镜像`都是`基础包`，很多功能都不具备，我们通常会自己搭建镜像！

官方既然可以制作镜像，我们一样可以！

### Dockerfile 的构建过程

**基础知识**:

1. 每个`保留关键字`（`指令`）都必须是`大写字母`。

2. `从上到下顺序执行`。

3. `#` 表示注释。

4. 每个`指令`都会创建一个`新的镜像层`。

![](https://cos.luyf-lemon-love.space/images/20220905231827.png)

>`Dockerfile` 是`面向开发的`，我们以后要`发布项目` -> `镜像` -> 编写 `Dockerfile` 文件。
>
>`Docker` 镜像逐渐成为企业的交付标准，必须要掌握！
>
>`步骤`：开发、部署、运维... 缺一不可！
>
>`Dockerfile`: 构建文件，定义了一切的步骤（源代码）。
>
>`DockerImages`: 通过 `Dockerfile` 构建生成的镜像，最终发布的产品！
>
>`DockerContainer`: 容器就是`镜像`运行起来`创建的服务器`。

### Dockerfile 指令说明

![](https://cos.luyf-lemon-love.space/images/20220906111715.png)

```dockerfile
FROM                # 基础镜像，一切从这里开始构建
MAINTAINER          # 镜像的作者，姓名+邮箱
RUN                 # 镜像构建的时候需要运行的命令
ADD                 # COPY 文件，会自动解压
WORKDIR             # 镜像的工作目录
VOLUME              # 挂载的目录
EXPOSE              # 暴露的端口
CMD                 # 指定这个容器启动的时候要运行的命令，只有最后一个会生效，可以被替代
ENTRYPOINT          # 指定这个容器启动的时候要运行的命令，可以追加命令
ONBUILD             # 该 dockerfile 文件创建的镜像被当做基础镜像创建一个新镜像时，会运行 ONBUILD 的指令，是一个触发指令
COPY                # 将文件拷贝到镜像中
ENV                 # 设置环境变量！
```

### 创建一个自己的 centos

```shell
# 1. 编写 Dockerfile
$ cat mydockerfile-centos 
FROM centos
MAINTAINER xiaofan<594042358@qq.com>
 
ENV MYPATH /usr/local
WORKDIR $MYPATH     # 镜像的工作目录
 
RUN yum -y install vim
RUN yum -y install net-tools
 
EXPOSE 80
 
CMD echo $MYPATH
CMD echo "---end---"
CMD /bin/bash
 
# 2. 通过这个文件构建镜像
# 命令 docker build -f dockerfile文件路径 -t 镜像名:[tag] .
 
$ docker build -f mydockerfile-centos -t mycentos:0.1 .
 
Successfully built d2d9f0ea8cb2
Successfully tagged mycentos:0.1
```

![](https://cos.luyf-lemon-love.space/images/20220906141824.png)

我们可以`列出本地进行的变更历史`。

![](https://cos.luyf-lemon-love.space/images/20220906141902.png)

---

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ ls -al
总用量 12
drwxrwxr-x 2 lyfubuntu lyfubuntu 4096 9月   6 13:14 .
drwxrwxr-x 6 lyfubuntu lyfubuntu 4096 9月   5 15:16 ..
-rw-rw-r-- 1 lyfubuntu lyfubuntu  168 9月   5 15:23 dockerfile1
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # 1.  编写 Dockerfile
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ vim mydockerfile-centos
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ ls
dockerfile1  mydockerfile-centos
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ cat mydockerfile-centos 
# centos:8 已经停止维护，无法利用包管理器工具
FROM centos:7
MAINTAINER LuYF-Lemon-love<luyanfeng_nlp@qq.com>

ENV MYPATH /usr/local

# 镜像的工作目录
WORKDIR $MYPATH

RUN yum -y install vim
RUN yum -y install net-tools

EXPOSE 80

CMD echo $MYPATH
CMD echo "---end---"
CMD /bin/bash
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
lyf/centos      1.0       967c603048b0   22 hours ago    231MB
my_centos       0.1       d3a84994963f   2 days ago      559MB
my_tomcat       0.1       82bf5ce1034c   2 days ago      480MB
tomcat          9.0       d4488b7f8c9b   3 days ago      475MB
tomcat          latest    7a91e6f458bb   3 days ago      475MB
mysql           5.7       daff57b7d2d1   12 days ago     430MB
nginx           latest    2b7d6430f78d   2 weeks ago     142MB
centos          latest    5d0da3dc9764   11 months ago   231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                    PORTS     NAMES
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   20 hours ago   Exited (0) 20 hours ago             docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              22 hours ago   Exited (0) 22 hours ago             admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   39 hours ago   Exited (0) 39 hours ago             nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   39 hours ago   Exited (0) 39 hours ago             nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   45 hours ago   Exited (0) 40 hours ago             mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              2 days ago     Exited (0) 2 days ago               stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        2 days ago     Exited (143) 2 days ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        2 days ago     Exited (143) 2 days ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   2 days ago     Exited (143) 2 days ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        2 days ago     Exited (143) 2 days ago             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   3 days ago     Exited (0) 3 days ago               nginx01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile(base(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker build -f mydockerfile-centos -t mycentos:0.2 .
Sending build context to Docker daemon  3.072kB
Step 1/10 : FROM centos:7
7: Pulling from library/centos
2d473b07cdd5: Pull complete 
Digest: sha256:c73f515d06b0fa07bb18d8202035e739a494ce760aa73129f60f4bf2bd22b407
Status: Downloaded newer image for centos:7
 ---> eeb6ee3f44bd
Step 2/10 : MAINTAINER LuYF-Lemon-love<luyanfeng_nlp@qq.com>
 ---> Running in e1d3f3fffd64
Removing intermediate container e1d3f3fffd64
 ---> 2d2197dc0ab2
Step 3/10 : ENV MYPATH /usr/local
 ---> Running in 05258b5abeed
Removing intermediate container 05258b5abeed
 ---> 720923f64370
Step 4/10 : WORKDIR $MYPATH
 ---> Running in a1a8a0812e84
Removing intermediate container a1a8a0812e84
 ---> 594850a3a9cb
Step 5/10 : RUN yum -y install vim
 ---> Running in bd13a06d23b3
Loaded plugins: fastestmirror, ovl
Determining fastest mirrors
 * base: mirrors.nju.edu.cn
 * extras: mirrors.nju.edu.cn
 * updates: mirrors.nju.edu.cn
Resolving Dependencies
--> Running transaction check
---> Package vim-enhanced.x86_64 2:7.4.629-8.el7_9 will be installed
--> Processing Dependency: vim-common = 2:7.4.629-8.el7_9 for package: 2:vim-enhanced-7.4.629-8.el7_9.x86_64
--> Processing Dependency: which for package: 2:vim-enhanced-7.4.629-8.el7_9.x86_64
--> Processing Dependency: perl(:MODULE_COMPAT_5.16.3) for package: 2:vim-enhanced-7.4.629-8.el7_9.x86_64
--> Processing Dependency: libperl.so()(64bit) for package: 2:vim-enhanced-7.4.629-8.el7_9.x86_64
--> Processing Dependency: libgpm.so.2()(64bit) for package: 2:vim-enhanced-7.4.629-8.el7_9.x86_64
--> Running transaction check
---> Package gpm-libs.x86_64 0:1.20.7-6.el7 will be installed
---> Package perl.x86_64 4:5.16.3-299.el7_9 will be installed
--> Processing Dependency: perl(Socket) >= 1.3 for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Scalar::Util) >= 1.10 for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl-macros for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(threads::shared) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(threads) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(constant) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Time::Local) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Time::HiRes) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Storable) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Socket) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Scalar::Util) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Pod::Simple::XHTML) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Pod::Simple::Search) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Getopt::Long) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Filter::Util::Call) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(File::Temp) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(File::Spec::Unix) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(File::Spec::Functions) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(File::Spec) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(File::Path) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Exporter) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Cwd) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Carp) for package: 4:perl-5.16.3-299.el7_9.x86_64
---> Package perl-libs.x86_64 4:5.16.3-299.el7_9 will be installed
---> Package vim-common.x86_64 2:7.4.629-8.el7_9 will be installed
--> Processing Dependency: vim-filesystem for package: 2:vim-common-7.4.629-8.el7_9.x86_64
---> Package which.x86_64 0:2.20-7.el7 will be installed
--> Running transaction check
---> Package perl-Carp.noarch 0:1.26-244.el7 will be installed
---> Package perl-Exporter.noarch 0:5.68-3.el7 will be installed
---> Package perl-File-Path.noarch 0:2.09-2.el7 will be installed
---> Package perl-File-Temp.noarch 0:0.23.01-3.el7 will be installed
---> Package perl-Filter.x86_64 0:1.49-3.el7 will be installed
---> Package perl-Getopt-Long.noarch 0:2.40-3.el7 will be installed
--> Processing Dependency: perl(Pod::Usage) >= 1.14 for package: perl-Getopt-Long-2.40-3.el7.noarch
--> Processing Dependency: perl(Text::ParseWords) for package: perl-Getopt-Long-2.40-3.el7.noarch
---> Package perl-PathTools.x86_64 0:3.40-5.el7 will be installed
---> Package perl-Pod-Simple.noarch 1:3.28-4.el7 will be installed
--> Processing Dependency: perl(Pod::Escapes) >= 1.04 for package: 1:perl-Pod-Simple-3.28-4.el7.noarch
--> Processing Dependency: perl(Encode) for package: 1:perl-Pod-Simple-3.28-4.el7.noarch
---> Package perl-Scalar-List-Utils.x86_64 0:1.27-248.el7 will be installed
---> Package perl-Socket.x86_64 0:2.010-5.el7 will be installed
---> Package perl-Storable.x86_64 0:2.45-3.el7 will be installed
---> Package perl-Time-HiRes.x86_64 4:1.9725-3.el7 will be installed
---> Package perl-Time-Local.noarch 0:1.2300-2.el7 will be installed
---> Package perl-constant.noarch 0:1.27-2.el7 will be installed
---> Package perl-macros.x86_64 4:5.16.3-299.el7_9 will be installed
---> Package perl-threads.x86_64 0:1.87-4.el7 will be installed
---> Package perl-threads-shared.x86_64 0:1.43-6.el7 will be installed
---> Package vim-filesystem.x86_64 2:7.4.629-8.el7_9 will be installed
--> Running transaction check
---> Package perl-Encode.x86_64 0:2.51-7.el7 will be installed
---> Package perl-Pod-Escapes.noarch 1:1.04-299.el7_9 will be installed
---> Package perl-Pod-Usage.noarch 0:1.63-3.el7 will be installed
--> Processing Dependency: perl(Pod::Text) >= 3.15 for package: perl-Pod-Usage-1.63-3.el7.noarch
--> Processing Dependency: perl-Pod-Perldoc for package: perl-Pod-Usage-1.63-3.el7.noarch
---> Package perl-Text-ParseWords.noarch 0:3.29-4.el7 will be installed
--> Running transaction check
---> Package perl-Pod-Perldoc.noarch 0:3.20-4.el7 will be installed
--> Processing Dependency: perl(parent) for package: perl-Pod-Perldoc-3.20-4.el7.noarch
--> Processing Dependency: perl(HTTP::Tiny) for package: perl-Pod-Perldoc-3.20-4.el7.noarch
--> Processing Dependency: groff-base for package: perl-Pod-Perldoc-3.20-4.el7.noarch
---> Package perl-podlators.noarch 0:2.5.1-3.el7 will be installed
--> Running transaction check
---> Package groff-base.x86_64 0:1.22.2-8.el7 will be installed
---> Package perl-HTTP-Tiny.noarch 0:0.033-3.el7 will be installed
---> Package perl-parent.noarch 1:0.225-244.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package                    Arch       Version                Repository   Size
================================================================================
Installing:
 vim-enhanced               x86_64     2:7.4.629-8.el7_9      updates     1.1 M
Installing for dependencies:
 gpm-libs                   x86_64     1.20.7-6.el7           base         32 k
 groff-base                 x86_64     1.22.2-8.el7           base        942 k
 perl                       x86_64     4:5.16.3-299.el7_9     updates     8.0 M
 perl-Carp                  noarch     1.26-244.el7           base         19 k
 perl-Encode                x86_64     2.51-7.el7             base        1.5 M
 perl-Exporter              noarch     5.68-3.el7             base         28 k
 perl-File-Path             noarch     2.09-2.el7             base         26 k
 perl-File-Temp             noarch     0.23.01-3.el7          base         56 k
 perl-Filter                x86_64     1.49-3.el7             base         76 k
 perl-Getopt-Long           noarch     2.40-3.el7             base         56 k
 perl-HTTP-Tiny             noarch     0.033-3.el7            base         38 k
 perl-PathTools             x86_64     3.40-5.el7             base         82 k
 perl-Pod-Escapes           noarch     1:1.04-299.el7_9       updates      52 k
 perl-Pod-Perldoc           noarch     3.20-4.el7             base         87 k
 perl-Pod-Simple            noarch     1:3.28-4.el7           base        216 k
 perl-Pod-Usage             noarch     1.63-3.el7             base         27 k
 perl-Scalar-List-Utils     x86_64     1.27-248.el7           base         36 k
 perl-Socket                x86_64     2.010-5.el7            base         49 k
 perl-Storable              x86_64     2.45-3.el7             base         77 k
 perl-Text-ParseWords       noarch     3.29-4.el7             base         14 k
 perl-Time-HiRes            x86_64     4:1.9725-3.el7         base         45 k
 perl-Time-Local            noarch     1.2300-2.el7           base         24 k
 perl-constant              noarch     1.27-2.el7             base         19 k
 perl-libs                  x86_64     4:5.16.3-299.el7_9     updates     690 k
 perl-macros                x86_64     4:5.16.3-299.el7_9     updates      44 k
 perl-parent                noarch     1:0.225-244.el7        base         12 k
 perl-podlators             noarch     2.5.1-3.el7            base        112 k
 perl-threads               x86_64     1.87-4.el7             base         49 k
 perl-threads-shared        x86_64     1.43-6.el7             base         39 k
 vim-common                 x86_64     2:7.4.629-8.el7_9      updates     5.9 M
 vim-filesystem             x86_64     2:7.4.629-8.el7_9      updates      11 k
 which                      x86_64     2.20-7.el7             base         41 k

Transaction Summary
================================================================================
Install  1 Package (+32 Dependent packages)

Total download size: 19 M
Installed size: 63 M
Downloading packages:
warning: /var/cache/yum/x86_64/7/base/packages/gpm-libs-1.20.7-6.el7.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID f4a80eb5: NOKEY
Public key for gpm-libs-1.20.7-6.el7.x86_64.rpm is not installed
Public key for perl-Pod-Escapes-1.04-299.el7_9.noarch.rpm is not installed
--------------------------------------------------------------------------------
Total                                              8.3 MB/s |  19 MB  00:02     
Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
Importing GPG key 0xF4A80EB5:
 Userid     : "CentOS-7 Key (CentOS 7 Official Signing Key) <security@centos.org>"
 Fingerprint: 6341 ab27 53d7 8a78 a7c2 7bb1 24c6 a8a7 f4a8 0eb5
 Package    : centos-release-7-9.2009.0.el7.centos.x86_64 (@CentOS)
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : gpm-libs-1.20.7-6.el7.x86_64                                1/33 
  Installing : 2:vim-filesystem-7.4.629-8.el7_9.x86_64                     2/33 
  Installing : 2:vim-common-7.4.629-8.el7_9.x86_64                         3/33 
  Installing : which-2.20-7.el7.x86_64                                     4/33 
install-info: No such file or directory for /usr/share/info/which.info.gz
  Installing : groff-base-1.22.2-8.el7.x86_64                              5/33 
  Installing : 1:perl-parent-0.225-244.el7.noarch                          6/33 
  Installing : perl-HTTP-Tiny-0.033-3.el7.noarch                           7/33 
  Installing : perl-podlators-2.5.1-3.el7.noarch                           8/33 
  Installing : perl-Pod-Perldoc-3.20-4.el7.noarch                          9/33 
  Installing : 1:perl-Pod-Escapes-1.04-299.el7_9.noarch                   10/33 
  Installing : perl-Encode-2.51-7.el7.x86_64                              11/33 
  Installing : perl-Text-ParseWords-3.29-4.el7.noarch                     12/33 
  Installing : perl-Pod-Usage-1.63-3.el7.noarch                           13/33 
  Installing : 4:perl-macros-5.16.3-299.el7_9.x86_64                      14/33 
  Installing : perl-Storable-2.45-3.el7.x86_64                            15/33 
  Installing : perl-Exporter-5.68-3.el7.noarch                            16/33 
  Installing : perl-constant-1.27-2.el7.noarch                            17/33 
  Installing : perl-Socket-2.010-5.el7.x86_64                             18/33 
  Installing : perl-Time-Local-1.2300-2.el7.noarch                        19/33 
  Installing : perl-Carp-1.26-244.el7.noarch                              20/33 
  Installing : perl-PathTools-3.40-5.el7.x86_64                           21/33 
  Installing : perl-Scalar-List-Utils-1.27-248.el7.x86_64                 22/33 
  Installing : 1:perl-Pod-Simple-3.28-4.el7.noarch                        23/33 
  Installing : perl-File-Temp-0.23.01-3.el7.noarch                        24/33 
  Installing : perl-File-Path-2.09-2.el7.noarch                           25/33 
  Installing : perl-threads-shared-1.43-6.el7.x86_64                      26/33 
  Installing : perl-threads-1.87-4.el7.x86_64                             27/33 
  Installing : 4:perl-Time-HiRes-1.9725-3.el7.x86_64                      28/33 
  Installing : perl-Filter-1.49-3.el7.x86_64                              29/33 
  Installing : 4:perl-libs-5.16.3-299.el7_9.x86_64                        30/33 
  Installing : perl-Getopt-Long-2.40-3.el7.noarch                         31/33 
  Installing : 4:perl-5.16.3-299.el7_9.x86_64                             32/33 
  Installing : 2:vim-enhanced-7.4.629-8.el7_9.x86_64                      33/33 
  Verifying  : perl-HTTP-Tiny-0.033-3.el7.noarch                           1/33 
  Verifying  : perl-threads-shared-1.43-6.el7.x86_64                       2/33 
  Verifying  : perl-Storable-2.45-3.el7.x86_64                             3/33 
  Verifying  : groff-base-1.22.2-8.el7.x86_64                              4/33 
  Verifying  : perl-Exporter-5.68-3.el7.noarch                             5/33 
  Verifying  : perl-constant-1.27-2.el7.noarch                             6/33 
  Verifying  : perl-PathTools-3.40-5.el7.x86_64                            7/33 
  Verifying  : 4:perl-macros-5.16.3-299.el7_9.x86_64                       8/33 
  Verifying  : 2:vim-enhanced-7.4.629-8.el7_9.x86_64                       9/33 
  Verifying  : 1:perl-parent-0.225-244.el7.noarch                         10/33 
  Verifying  : perl-Socket-2.010-5.el7.x86_64                             11/33 
  Verifying  : which-2.20-7.el7.x86_64                                    12/33 
  Verifying  : 2:vim-filesystem-7.4.629-8.el7_9.x86_64                    13/33 
  Verifying  : perl-File-Temp-0.23.01-3.el7.noarch                        14/33 
  Verifying  : 1:perl-Pod-Simple-3.28-4.el7.noarch                        15/33 
  Verifying  : perl-Time-Local-1.2300-2.el7.noarch                        16/33 
  Verifying  : 1:perl-Pod-Escapes-1.04-299.el7_9.noarch                   17/33 
  Verifying  : perl-Carp-1.26-244.el7.noarch                              18/33 
  Verifying  : 2:vim-common-7.4.629-8.el7_9.x86_64                        19/33 
  Verifying  : perl-Scalar-List-Utils-1.27-248.el7.x86_64                 20/33 
  Verifying  : perl-Pod-Usage-1.63-3.el7.noarch                           21/33 
  Verifying  : perl-Encode-2.51-7.el7.x86_64                              22/33 
  Verifying  : perl-Pod-Perldoc-3.20-4.el7.noarch                         23/33 
  Verifying  : perl-podlators-2.5.1-3.el7.noarch                          24/33 
  Verifying  : 4:perl-5.16.3-299.el7_9.x86_64                             25/33 
  Verifying  : perl-File-Path-2.09-2.el7.noarch                           26/33 
  Verifying  : perl-threads-1.87-4.el7.x86_64                             27/33 
  Verifying  : 4:perl-Time-HiRes-1.9725-3.el7.x86_64                      28/33 
  Verifying  : gpm-libs-1.20.7-6.el7.x86_64                               29/33 
  Verifying  : perl-Filter-1.49-3.el7.x86_64                              30/33 
  Verifying  : perl-Getopt-Long-2.40-3.el7.noarch                         31/33 
  Verifying  : perl-Text-ParseWords-3.29-4.el7.noarch                     32/33 
  Verifying  : 4:perl-libs-5.16.3-299.el7_9.x86_64                        33/33 

Installed:
  vim-enhanced.x86_64 2:7.4.629-8.el7_9                                         

Dependency Installed:
  gpm-libs.x86_64 0:1.20.7-6.el7                                                
  groff-base.x86_64 0:1.22.2-8.el7                                              
  perl.x86_64 4:5.16.3-299.el7_9                                                
  perl-Carp.noarch 0:1.26-244.el7                                               
  perl-Encode.x86_64 0:2.51-7.el7                                               
  perl-Exporter.noarch 0:5.68-3.el7                                             
  perl-File-Path.noarch 0:2.09-2.el7                                            
  perl-File-Temp.noarch 0:0.23.01-3.el7                                         
  perl-Filter.x86_64 0:1.49-3.el7                                               
  perl-Getopt-Long.noarch 0:2.40-3.el7                                          
  perl-HTTP-Tiny.noarch 0:0.033-3.el7                                           
  perl-PathTools.x86_64 0:3.40-5.el7                                            
  perl-Pod-Escapes.noarch 1:1.04-299.el7_9                                      
  perl-Pod-Perldoc.noarch 0:3.20-4.el7                                          
  perl-Pod-Simple.noarch 1:3.28-4.el7                                           
  perl-Pod-Usage.noarch 0:1.63-3.el7                                            
  perl-Scalar-List-Utils.x86_64 0:1.27-248.el7                                  
  perl-Socket.x86_64 0:2.010-5.el7                                              
  perl-Storable.x86_64 0:2.45-3.el7                                             
  perl-Text-ParseWords.noarch 0:3.29-4.el7                                      
  perl-Time-HiRes.x86_64 4:1.9725-3.el7                                         
  perl-Time-Local.noarch 0:1.2300-2.el7                                         
  perl-constant.noarch 0:1.27-2.el7                                             
  perl-libs.x86_64 4:5.16.3-299.el7_9                                           
  perl-macros.x86_64 4:5.16.3-299.el7_9                                         
  perl-parent.noarch 1:0.225-244.el7                                            
  perl-podlators.noarch 0:2.5.1-3.el7                                           
  perl-threads.x86_64 0:1.87-4.el7                                              
  perl-threads-shared.x86_64 0:1.43-6.el7                                       
  vim-common.x86_64 2:7.4.629-8.el7_9                                           
  vim-filesystem.x86_64 2:7.4.629-8.el7_9                                       
  which.x86_64 0:2.20-7.el7                                                     

Complete!
Removing intermediate container bd13a06d23b3
 ---> cdbf32863310
Step 6/10 : RUN yum -y install net-tools
 ---> Running in 25dedc29010e
Loaded plugins: fastestmirror, ovl
Loading mirror speeds from cached hostfile
 * base: mirrors.nju.edu.cn
 * extras: mirrors.nju.edu.cn
 * updates: mirrors.nju.edu.cn
Resolving Dependencies
--> Running transaction check
---> Package net-tools.x86_64 0:2.0-0.25.20131004git.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package         Arch         Version                          Repository  Size
================================================================================
Installing:
 net-tools       x86_64       2.0-0.25.20131004git.el7         base       306 k

Transaction Summary
================================================================================
Install  1 Package

Total download size: 306 k
Installed size: 917 k
Downloading packages:
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : net-tools-2.0-0.25.20131004git.el7.x86_64                    1/1 
  Verifying  : net-tools-2.0-0.25.20131004git.el7.x86_64                    1/1 

Installed:
  net-tools.x86_64 0:2.0-0.25.20131004git.el7                                   

Complete!
Removing intermediate container 25dedc29010e
 ---> b902cd1a4201
Step 7/10 : EXPOSE 80
 ---> Running in 04112dcf7898
Removing intermediate container 04112dcf7898
 ---> e33f98f59fe3
Step 8/10 : CMD echo $MYPATH
 ---> Running in cf539f0a6cea
Removing intermediate container cf539f0a6cea
 ---> 32589249b711
Step 9/10 : CMD echo "---end---"
 ---> Running in f03e8564b0ef
Removing intermediate container f03e8564b0ef
 ---> 5e36ac9809c5
Step 10/10 : CMD /bin/bash
 ---> Running in 595e7683fc52
Removing intermediate container 595e7683fc52
 ---> 5f2260ba4d08
Successfully built 5f2260ba4d08
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerf(base(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ #
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # 2. 通过 mydockerfile-centos 文件构建镜像
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Docker(base(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$(base) lyfubuntu@lyfubuntu(base) l(base) lyfubuntu@lyf(base) lyfubuntu@lyfubuntu:~/my_co(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfi(base) lyfubuntu@(base) lyfubuntu@(base) lyfubuntu@lyfubuntu:~/my_co(base) lyfubuntu@(base) lyfubuntu@(base) lyfubuntu@(base) lyfubuntu@(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # 2. 通过 mydockerfile-centos 文件构建镜像
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
mycentos        0.2       5f2260ba4d08   4 minutes ago   624MB
lyf/centos      1.0       967c603048b0   22 hours ago    231MB
my_centos       0.1       d3a84994963f   2 days ago      559MB
my_tomcat       0.1       82bf5ce1034c   2 days ago      480MB
tomcat          9.0       d4488b7f8c9b   3 days ago      475MB
tomcat          latest    7a91e6f458bb   3 days ago      475MB
mysql           5.7       daff57b7d2d1   12 days ago     430MB
nginx           latest    2b7d6430f78d   2 weeks ago     142MB
centos          7         eeb6ee3f44bd   11 months ago   204MB
centos          latest    5d0da3dc9764   11 months ago   231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                    PORTS     NAMES
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   20 hours ago   Exited (0) 20 hours ago             docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              22 hours ago   Exited (0) 22 hours ago             admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   39 hours ago   Exited (0) 39 hours ago             nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   39 hours ago   Exited (0) 39 hours ago             nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   45 hours ago   Exited (0) 40 hours ago             mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              2 days ago     Exited (0) 2 days ago               stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        2 days ago     Exited (143) 2 days ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        2 days ago     Exited (143) 2 days ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   2 days ago     Exited (143) 2 days ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        2 days ago     Exited (143) 2 days ago             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   3 days ago     Exited (0) 3 days ago               nginx01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker run -it mycentos:0.2
[root@db1c2bf8e3c8 local]# pwd
/usr/local
[root@db1c2bf8e3c8 local]# ifconfig
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.17.0.2  netmask 255.255.0.0  broadcast 172.17.255.255
        ether 02:42:ac:11:00:02  txqueuelen 0  (Ethernet)
        RX packets 34  bytes 4327 (4.2 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

[root@db1c2bf8e3c8 local]# which vim
/usr/bin/vim
[root@db1c2bf8e3c8 local]# vim test.txt
[root@db1c2bf8e3c8 local]# cat test.txt 
create a centos.
[root@db1c2bf8e3c8 local]# exit
exit
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
mycentos        0.2       5f2260ba4d08   9 minutes ago   624MB
lyf/centos      1.0       967c603048b0   23 hours ago    231MB
my_centos       0.1       d3a84994963f   2 days ago      559MB
my_tomcat       0.1       82bf5ce1034c   2 days ago      480MB
tomcat          9.0       d4488b7f8c9b   3 days ago      475MB
tomcat          latest    7a91e6f458bb   3 days ago      475MB
mysql           5.7       daff57b7d2d1   12 days ago     430MB
nginx           latest    2b7d6430f78d   2 weeks ago     142MB
centos          7         eeb6ee3f44bd   11 months ago   204MB
centos          latest    5d0da3dc9764   11 months ago   231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED         STATUS                          PORTS     NAMES
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   3 minutes ago   Exited (0) About a minute ago             stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   20 hours ago    Exited (0) 20 hours ago                   docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              22 hours ago    Exited (0) 22 hours ago                   admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   39 hours ago    Exited (0) 39 hours ago                   nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   39 hours ago    Exited (0) 39 hours ago                   nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   45 hours ago    Exited (0) 40 hours ago                   mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              2 days ago      Exited (0) 2 days ago                     stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        2 days ago      Exited (143) 2 days ago                   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        2 days ago      Exited (143) 2 days ago                   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   2 days ago      Exited (143) 2 days ago                   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        2 days ago      Exited (143) 2 days ago                   tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   3 days ago      Exited (0) 3 days ago                     nginx01
bf46371dea89   centos                "/bin/bash"              3 days ago      Exited (0) 2 days ago                     epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker history --help

Usage:  docker history [OPTIONS] IMAGE

Show the history of an image

Options:
      --format string   Pretty-print images using a Go template
  -H, --human           Print sizes and dates in human readable format (default true)
      --no-trunc        Don't truncate output
  -q, --quiet           Only show image IDs
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker history 5f2260ba4d08
IMAGE          CREATED          CREATED BY                                      SIZE      COMMENT
5f2260ba4d08   12 minutes ago   /bin/sh -c #(nop)  CMD ["/bin/sh" "-c" "/bin…   0B        
5e36ac9809c5   12 minutes ago   /bin/sh -c #(nop)  CMD ["/bin/sh" "-c" "echo…   0B        
32589249b711   12 minutes ago   /bin/sh -c #(nop)  CMD ["/bin/sh" "-c" "echo…   0B        
e33f98f59fe3   12 minutes ago   /bin/sh -c #(nop)  EXPOSE 80                    0B        
b902cd1a4201   12 minutes ago   /bin/sh -c yum -y install net-tools             182MB     
cdbf32863310   13 minutes ago   /bin/sh -c yum -y install vim                   237MB     
594850a3a9cb   14 minutes ago   /bin/sh -c #(nop) WORKDIR /usr/local            0B        
720923f64370   14 minutes ago   /bin/sh -c #(nop)  ENV MYPATH=/usr/local        0B        
2d2197dc0ab2   14 minutes ago   /bin/sh -c #(nop)  MAINTAINER LuYF-Lemon-lov…   0B        
eeb6ee3f44bd   11 months ago    /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B        
<missing>      11 months ago    /bin/sh -c #(nop)  LABEL org.label-schema.sc…   0B        
<missing>      11 months ago    /bin/sh -c #(nop) ADD file:b3ebbe8bd304723d4…   204MB     
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # 创建 一个自己的 centos
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # 1. 编写 Dockerfile
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # 2. 通过上面的 Dockerfile 构建镜像
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$(base(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # 3. 通过 `docker history 镜像id` 可以列出本地进行的变更历史
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$
```

### `CMD` 和 `ENTRYPOINT` 区别

```dockerfile
CMD         # 指定这个容器启动的时候要运行的命令，只有最后一个会生效，可被替代
ENTRYPOINT      # 指定这个容器启动的时候要运行的命令，可以追加命令
```

**测试 `CMD`**

```shell
# 1. 编写 dockerfile
$ vim dockerfile-cmd-test 
FROM centos
CMD ["ls", "-a"]
 
# 2. 构建镜像
$ docker build -f dockerfile-cmd-test -t cmdtest .
 
# 3. run 运行，发现我们的 ls -a 命令生效
$ docker run ebe6a52bb125
.
..
.dockerenv
bin
dev
etc
home
lib
lib64
 
# 想追加一个参数 -l 变成 ls -al
$ docker run ebe6a52bb125 -l
docker: Error response from daemon: OCI runtime create failed: container_linux.go:349: starting container process caused "exec: \"-l\": executable file not found in $PATH": unknown.
$ docker run ebe6a52bb125 ls -l
 
# CMD 的情况下，-l 替换了 CMD ["ls", "-a"] 命令，-l 不是命令，所以报错了
```

**测试 `ENTRYPOINT`**

```shell
# 1. 编写 dockerfile
$ vim dockerfile-entrypoint-test 
FROM centos
ENTRYPOINT ["ls", "-a"]
 
# 2. 构建文件
$ docker build -f dockerfile-entrypoint-test -t entrypoint-test .
 
# 3. run 运行，发现我们的 ls -a 命令同样生效
$ docker run entrypoint-test
.
..
.dockerenv
bin
dev
etc
home
lib
 
# 4. 我们的追加命令，是直接拼接到 ENTRYPOINT 命令后面的！
$ docker run entrypoint-test -l
total 56
drwxr-xr-x  1 root root 4096 Aug 13 07:52 .
drwxr-xr-x  1 root root 4096 Aug 13 07:52 ..
-rwxr-xr-x  1 root root    0 Aug 13 07:52 .dockerenv
lrwxrwxrwx  1 root root    7 May 11  2019 bin -> usr/bin
drwxr-xr-x  5 root root  340 Aug 13 07:52 dev
drwxr-xr-x  1 root root 4096 Aug 13 07:52 etc
drwxr-xr-x  2 root root 4096 May 11  2019 home
lrwxrwxrwx  1 root root    7 May 11  2019 lib -> usr/lib
lrwxrwxrwx  1 root root    9 May 11  2019 lib64 -> usr/lib64
drwx------  2 root root 4096 Aug  9 21:40 lost+found
```

---

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ ls
dockerfile1  mydockerfile-centos
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # 1. 编写 Dockerfile 文件
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ vim dockerfile-cmd-test
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ ls
dockerfile1  dockerfile-cmd-test  mydockerfile-centos
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ cat dockerfile-cmd-test 
FROM centos
CMD ["ls", "-a"]
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # 2. 构建镜像
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker build -f dockerfile-cmd-test -t cmdtest .
Sending build context to Docker daemon  4.096kB
Step 1/2 : FROM centos
 ---> 5d0da3dc9764
Step 2/2 : CMD ["ls", "-a"]
 ---> Running in c0113ecde94c
Removing intermediate container c0113ecde94c
 ---> e507939f0998
Successfully built e507939f0998
Successfully tagged cmdtest:latest
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # 3. run 运行，发现我们的 ls -a 命令生效
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED              SIZE
cmdtest         latest    e507939f0998   About a minute ago   231MB
mycentos        0.2       5f2260ba4d08   2 hours ago          624MB
lyf/centos      1.0       967c603048b0   24 hours ago         231MB
my_centos       0.1       d3a84994963f   2 days ago           559MB
my_tomcat       0.1       82bf5ce1034c   2 days ago           480MB
tomcat          9.0       d4488b7f8c9b   3 days ago           475MB
tomcat          latest    7a91e6f458bb   3 days ago           475MB
mysql           5.7       daff57b7d2d1   12 days ago          430MB
nginx           latest    2b7d6430f78d   2 weeks ago          142MB
centos          7         eeb6ee3f44bd   11 months ago        204MB
centos          latest    5d0da3dc9764   11 months ago        231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago          791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                    PORTS     NAMES
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 hours ago    Exited (0) 2 hours ago              stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   22 hours ago   Exited (0) 22 hours ago             docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              24 hours ago   Exited (0) 24 hours ago             admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   41 hours ago   Exited (0) 41 hours ago             nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   41 hours ago   Exited (0) 41 hours ago             nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   47 hours ago   Exited (0) 42 hours ago             mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              2 days ago     Exited (0) 2 days ago               stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        2 days ago     Exited (143) 2 days ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        2 days ago     Exited (143) 2 days ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   2 days ago     Exited (143) 2 days ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        3 days ago     Exited (143) 2 days ago             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   3 days ago     Exited (0) 3 days ago               nginx01
bf46371dea89   centos                "/bin/bash"              3 days ago     Exited (0) 2 days ago               epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker run cmdtest
.
..
.dockerenv
bin
dev
etc
home
lib
lib64
lost+found
media
mnt
opt
proc
root
run
sbin
srv
sys
tmp
usr
var
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED              STATUS                          PORTS     NAMES
2c58747c312a   cmdtest               "ls -a"                  About a minute ago   Exited (0) About a minute ago             objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 hours ago          Exited (0) 2 hours ago                    stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   22 hours ago         Exited (0) 22 hours ago                   docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              24 hours ago         Exited (0) 24 hours ago                   admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   41 hours ago         Exited (0) 41 hours ago                   nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   41 hours ago         Exited (0) 41 hours ago                   nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   47 hours ago         Exited (0) 42 hours ago                   mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              2 days ago           Exited (0) 2 days ago                     stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        2 days ago           Exited (143) 2 days ago                   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        2 days ago           Exited (143) 2 days ago                   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   2 days ago           Exited (143) 2 days ago                   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        3 days ago           Exited (143) 2 days ago                   tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   3 days ago           Exited (0) 3 days ago                     nginx01
bf46371dea89   centos                "/bin/bash"              3 days ago           Exited (0) 2 days ago                     epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker run 2c58747c312a -l
Unable to find image '2c58747c312a:latest' locally
docker: Error response from daemon: pull access denied for 2c58747c312a, repository does not exist or may require 'docker login': denied: requested access to the resource is denied.
See 'docker run --help'.
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker run cmdtest -l
docker: Error response from daemon: failed to create shim task: OCI runtime create failed: runc create failed: unable to start container process: exec: "-l": executable file not found in $PATH: unknown.
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
cmdtest         latest    e507939f0998   6 minutes ago   231MB
mycentos        0.2       5f2260ba4d08   2 hours ago     624MB
lyf/centos      1.0       967c603048b0   25 hours ago    231MB
my_centos       0.1       d3a84994963f   2 days ago      559MB
my_tomcat       0.1       82bf5ce1034c   2 days ago      480MB
tomcat          9.0       d4488b7f8c9b   3 days ago      475MB
tomcat          latest    7a91e6f458bb   3 days ago      475MB
mysql           5.7       daff57b7d2d1   12 days ago     430MB
nginx           latest    2b7d6430f78d   2 weeks ago     142MB
centos          7         eeb6ee3f44bd   11 months ago   204MB
centos          latest    5d0da3dc9764   11 months ago   231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                     PORTS     NAMES
b01b8b2df80f   cmdtest               "-l"                     48 seconds ago   Created                              wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  4 minutes ago    Exited (0) 4 minutes ago             objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 hours ago      Exited (0) 2 hours ago               stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   22 hours ago     Exited (0) 22 hours ago              docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              24 hours ago     Exited (0) 24 hours ago              admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   41 hours ago     Exited (0) 41 hours ago              nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   41 hours ago     Exited (0) 41 hours ago              nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   47 hours ago     Exited (0) 42 hours ago              mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              2 days ago       Exited (0) 2 days ago                stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        2 days ago       Exited (143) 2 days ago              my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        2 days ago       Exited (143) 2 days ago              tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   2 days ago       Exited (143) 2 days ago              elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        3 days ago       Exited (143) 2 days ago              tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   3 days ago       Exited (0) 3 days ago                nginx01
bf46371dea89   centos                "/bin/bash"              3 days ago       Exited (0) 2 days ago                epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker run cmdtest ls -l
total 48
lrwxrwxrwx   1 root root    7 Nov  3  2020 bin -> usr/bin
drwxr-xr-x   5 root root  340 Sep  6 07:57 dev
drwxr-xr-x   1 root root 4096 Sep  6 07:57 etc
drwxr-xr-x   2 root root 4096 Nov  3  2020 home
lrwxrwxrwx   1 root root    7 Nov  3  2020 lib -> usr/lib
lrwxrwxrwx   1 root root    9 Nov  3  2020 lib64 -> usr/lib64
drwx------   2 root root 4096 Sep 15  2021 lost+found
drwxr-xr-x   2 root root 4096 Nov  3  2020 media
drwxr-xr-x   2 root root 4096 Nov  3  2020 mnt
drwxr-xr-x   2 root root 4096 Nov  3  2020 opt
dr-xr-xr-x 377 root root    0 Sep  6 07:57 proc
dr-xr-x---   2 root root 4096 Sep 15  2021 root
drwxr-xr-x  11 root root 4096 Sep 15  2021 run
lrwxrwxrwx   1 root root    8 Nov  3  2020 sbin -> usr/sbin
drwxr-xr-x   2 root root 4096 Nov  3  2020 srv
dr-xr-xr-x  13 root root    0 Sep  6 07:57 sys
drwxrwxrwt   7 root root 4096 Sep 15  2021 tmp
drwxr-xr-x  12 root root 4096 Sep 15  2021 usr
drwxr-xr-x  20 root root 4096 Sep 15  2021 var
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # 实验结果：
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # 需求：想追加一个命令 -l 变成 ls -al
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # CMD: -l 替换了 CMD ["ls", "-a"], -l 不是命 令, 所以报错了
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ #######################################
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ 
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ #######################################
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # 测试 ENTRYPOINT
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ #######################################
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ 
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ #######################################
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # 1. 编写 Dockerfile 文件
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ ls
dockerfile1  dockerfile-cmd-test  mydockerfile-centos
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ vim dockerfile-entrypoint-test
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ cat dockerfile-entrypoint-test 
FROM centos
ENTRYPOINT ["ls", "-a"]
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # 2. 构建文件
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED          SIZE
cmdtest         latest    e507939f0998   23 minutes ago   231MB
mycentos        0.2       5f2260ba4d08   2 hours ago      624MB
lyf/centos      1.0       967c603048b0   25 hours ago     231MB
my_centos       0.1       d3a84994963f   2 days ago       559MB
my_tomcat       0.1       82bf5ce1034c   2 days ago       480MB
tomcat          9.0       d4488b7f8c9b   3 days ago       475MB
tomcat          latest    7a91e6f458bb   3 days ago       475MB
mysql           5.7       daff57b7d2d1   12 days ago      430MB
nginx           latest    2b7d6430f78d   2 weeks ago      142MB
centos          7         eeb6ee3f44bd   11 months ago    204MB
centos          latest    5d0da3dc9764   11 months ago    231MB
elasticsearch   7.6.2     f29a1ee41030   2 years ago      791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                      PORTS     NAMES
2c00ada1000f   cmdtest               "ls -l"                  16 minutes ago   Exited (0) 16 minutes ago             exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     17 minutes ago   Created                               wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  20 minutes ago   Exited (0) 20 minutes ago             objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 hours ago      Exited (0) 2 hours ago                stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   23 hours ago     Exited (0) 23 hours ago               docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              25 hours ago     Exited (0) 25 hours ago               admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   41 hours ago     Exited (0) 41 hours ago               nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   41 hours ago     Exited (0) 41 hours ago               nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   47 hours ago     Exited (0) 42 hours ago               mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              2 days ago       Exited (0) 2 days ago                 stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        2 days ago       Exited (143) 2 days ago               my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        2 days ago       Exited (143) 2 days ago               tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   2 days ago       Exited (143) 2 days ago               elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        3 days ago       Exited (143) 2 days ago               tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   3 days ago       Exited (0) 3 days ago                 nginx01
bf46371dea89   centos                "/bin/bash"              3 days ago       Exited (0) 2 days ago                 epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker build -f dockerfile-entrypoint-test -t entrypoint-test .
Sending build context to Docker daemon   5.12kB
Step 1/2 : FROM centos
 ---> 5d0da3dc9764
Step 2/2 : ENTRYPOINT ["ls", "-a"]
 ---> Running in 5fa092cdae89
Removing intermediate container 5fa092cdae89
 ---> 293b60111edb
Successfully built 293b60111edb
Successfully tagged entrypoint-test:latest
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker images
REPOSITORY        TAG       IMAGE ID       CREATED          SIZE
entrypoint-test   latest    293b60111edb   2 minutes ago    231MB
cmdtest           latest    e507939f0998   28 minutes ago   231MB
mycentos          0.2       5f2260ba4d08   2 hours ago      624MB
lyf/centos        1.0       967c603048b0   25 hours ago     231MB
my_centos         0.1       d3a84994963f   2 days ago       559MB
my_tomcat         0.1       82bf5ce1034c   2 days ago       480MB
tomcat            9.0       d4488b7f8c9b   3 days ago       475MB
tomcat            latest    7a91e6f458bb   3 days ago       475MB
mysql             5.7       daff57b7d2d1   12 days ago      430MB
nginx             latest    2b7d6430f78d   2 weeks ago      142MB
centos            7         eeb6ee3f44bd   11 months ago    204MB
centos            latest    5d0da3dc9764   11 months ago    231MB
elasticsearch     7.6.2     f29a1ee41030   2 years ago      791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                      PORTS     NAMES
2c00ada1000f   cmdtest               "ls -l"                  21 minutes ago   Exited (0) 21 minutes ago             exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     22 minutes ago   Created                               wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  26 minutes ago   Exited (0) 25 minutes ago             objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 hours ago      Exited (0) 2 hours ago                stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   23 hours ago     Exited (0) 23 hours ago               docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              25 hours ago     Exited (0) 25 hours ago               admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   41 hours ago     Exited (0) 41 hours ago               nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   41 hours ago     Exited (0) 41 hours ago               nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   47 hours ago     Exited (0) 42 hours ago               mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              2 days ago       Exited (0) 2 days ago                 stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        2 days ago       Exited (143) 2 days ago               my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        2 days ago       Exited (143) 2 days ago               tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   2 days ago       Exited (143) 2 days ago               elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        3 days ago       Exited (143) 3 days ago               tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   3 days ago       Exited (0) 3 days ago                 nginx01
bf46371dea89   centos                "/bin/bash"              3 days ago       Exited (0) 2 days ago                 epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # 3. run 运行，发现我们的 ls -a 命令同样生效
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker run entrypoint-test
.
..
.dockerenv
bin
dev
etc
home
lib
lib64
lost+found
media
mnt
opt
proc
root
run
sbin
srv
sys
tmp
usr
var
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                      PORTS     NAMES
90d672f69b18   entrypoint-test       "ls -a"                  43 seconds ago   Exited (0) 41 seconds ago             eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  26 minutes ago   Exited (0) 26 minutes ago             exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     27 minutes ago   Created                               wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  31 minutes ago   Exited (0) 31 minutes ago             objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 hours ago      Exited (0) 2 hours ago                stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   23 hours ago     Exited (0) 23 hours ago               docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              25 hours ago     Exited (0) 25 hours ago               admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   41 hours ago     Exited (0) 41 hours ago               nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   42 hours ago     Exited (0) 41 hours ago               nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   47 hours ago     Exited (0) 42 hours ago               mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              2 days ago       Exited (0) 2 days ago                 stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        2 days ago       Exited (143) 2 days ago               my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        2 days ago       Exited (143) 2 days ago               tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   2 days ago       Exited (143) 2 days ago               elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        3 days ago       Exited (143) 3 days ago               tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   3 days ago       Exited (0) 3 days ago                 nginx01
bf46371dea89   centos                "/bin/bash"              3 days ago       Exited (0) 2 days ago                 epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ # 4. 我们的追加命令，是直接拼接到 ENTRYPOINT 命令的后面的！
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker run entrypoint-test -l
total 56
drwxr-xr-x   1 root root 4096 Sep  6 08:28 .
drwxr-xr-x   1 root root 4096 Sep  6 08:28 ..
-rwxr-xr-x   1 root root    0 Sep  6 08:28 .dockerenv
lrwxrwxrwx   1 root root    7 Nov  3  2020 bin -> usr/bin
drwxr-xr-x   5 root root  340 Sep  6 08:28 dev
drwxr-xr-x   1 root root 4096 Sep  6 08:28 etc
drwxr-xr-x   2 root root 4096 Nov  3  2020 home
lrwxrwxrwx   1 root root    7 Nov  3  2020 lib -> usr/lib
lrwxrwxrwx   1 root root    9 Nov  3  2020 lib64 -> usr/lib64
drwx------   2 root root 4096 Sep 15  2021 lost+found
drwxr-xr-x   2 root root 4096 Nov  3  2020 media
drwxr-xr-x   2 root root 4096 Nov  3  2020 mnt
drwxr-xr-x   2 root root 4096 Nov  3  2020 opt
dr-xr-xr-x 368 root root    0 Sep  6 08:28 proc
dr-xr-x---   2 root root 4096 Sep 15  2021 root
drwxr-xr-x  11 root root 4096 Sep 15  2021 run
lrwxrwxrwx   1 root root    8 Nov  3  2020 sbin -> usr/sbin
drwxr-xr-x   2 root root 4096 Nov  3  2020 srv
dr-xr-xr-x  13 root root    0 Sep  6 08:28 sys
drwxrwxrwt   7 root root 4096 Sep 15  2021 tmp
drwxr-xr-x  12 root root 4096 Sep 15  2021 usr
drwxr-xr-x  20 root root 4096 Sep 15  2021 var
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                      PORTS     NAMES
f876c324441f   entrypoint-test       "ls -a -l"               25 seconds ago   Exited (0) 23 seconds ago             jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  5 minutes ago    Exited (0) 5 minutes ago              eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  31 minutes ago   Exited (0) 31 minutes ago             exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     32 minutes ago   Created                               wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  35 minutes ago   Exited (0) 35 minutes ago             objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   3 hours ago      Exited (0) 2 hours ago                stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   23 hours ago     Exited (0) 23 hours ago               docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              25 hours ago     Exited (0) 25 hours ago               admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   42 hours ago     Exited (0) 41 hours ago               nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   42 hours ago     Exited (0) 41 hours ago               nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   2 days ago       Exited (0) 42 hours ago               mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              2 days ago       Exited (0) 2 days ago                 stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        2 days ago       Exited (143) 2 days ago               my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        2 days ago       Exited (143) 2 days ago               tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   2 days ago       Exited (143) 2 days ago               elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        3 days ago       Exited (143) 3 days ago               tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   3 days ago       Exited (0) 3 days ago                 nginx01
bf46371dea89   centos                "/bin/bash"              3 days ago       Exited (0) 2 days ago                 epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker images
REPOSITORY        TAG       IMAGE ID       CREATED          SIZE
entrypoint-test   latest    293b60111edb   12 minutes ago   231MB
cmdtest           latest    e507939f0998   38 minutes ago   231MB
mycentos          0.2       5f2260ba4d08   3 hours ago      624MB
lyf/centos        1.0       967c603048b0   25 hours ago     231MB
my_centos         0.1       d3a84994963f   2 days ago       559MB
my_tomcat         0.1       82bf5ce1034c   2 days ago       480MB
tomcat            9.0       d4488b7f8c9b   3 days ago       475MB
tomcat            latest    7a91e6f458bb   3 days ago       475MB
mysql             5.7       daff57b7d2d1   12 days ago      430MB
nginx             latest    2b7d6430f78d   2 weeks ago      142MB
centos            7         eeb6ee3f44bd   11 months ago    204MB
centos            latest    5d0da3dc9764   11 months ago    231MB
elasticsearch     7.6.2     f29a1ee41030   2 years ago      791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$
```

---

## `Dockerfile` 制作 `tomcat` 镜像

### `Dockerfile` 制作 `tomcat` 镜像

1. 准备镜像文件：`tomcat` 压缩包和 `jdk` 压缩包。`apache-tomcat-9.0.37.tar.gz` 可以从 https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.37/bin/ 处下载。`jdk-8u341-linux-x64.tar.gz` 可以从 https://www.oracle.com/java/technologies/downloads/ 处下载。

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ ll *.gz
-rw-rw-r-- 1 lyfubuntu lyfubuntu  11211292 9月   6 22:07 apache-tomcat-9.0.37.tar.gz
-rw-rw-r-- 1 lyfubuntu lyfubuntu 148162542 9月   6 21:47 jdk-8u341-linux-x64.tar.gz
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$
```

2. 编写 `Dockerfile` 文件。`官方命名`: `Dockerfile`，`docker build` 会`自动寻找`这个文件，不需要 `-f` 指定。

```dockerfile
FROM centos:7
MAINTAINER LuYF-Lemon-love<luyanfeng_nlp@qq.com>

COPY readme.txt /usr/local/readme.txt

ADD jdk-8u341-linux-x64.tar.gz /usr/local/
ADD apache-tomcat-9.0.37.tar.gz /usr/local/

RUN yum -y install vim

ENV MYPATH /usr/local
WORKDIR $MYPATH

ENV JAVA_HOME /usr/local/jdk1.8.0_341
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV CATALINA_HOME /usr/local/apache-tomcat-9.0.37
ENV CATALINA_BASH /usr/local/apache-tomcat-9.0.37
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/lib:$CATALINA_HOME/bin

EXPOSE 8080

CMD /usr/local/apache-tomcat-9.0.37/bin/startup.sh && tail -F /usr/local/apache-tomcat-9.0.37/bin/logs/catalina.out
```

3. 编写 `readme.txt`。

```
readme.txt
created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>
```

4. 构建镜像。

```shell
docker build -t diytomcat .
```

5. 创建`本地挂载目录`: `diytomcat`。

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ cd ..
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ ls
centos_docker  files  my_centos  my_Dockerfile  mysql  nginx
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ tree
.
├── centos_docker
├── files
│   ├── 无标题文档 1
│   ├── apache-tomcat-9.0.37.tar.gz
│   └── jdk-8u341-linux-x64.tar.gz
├── my_centos
│   ├── my_centos_docker
│   └── my_ubuntu_docker
├── my_Dockerfile
│   ├── apache-tomcat-9.0.37.tar.gz
│   ├── Dockerfile
│   ├── dockerfile1
│   ├── dockerfile-cmd-test
│   ├── dockerfile-entrypoint-test
│   ├── jdk-8u341-linux-x64.tar.gz
│   ├── mydockerfile-centos
│   └── readme.txt
├── mysql
│   ├── conf
│   └── data
│       ├── auto.cnf
│       ├── ca-key.pem
│       ├── ca.pem
│       ├── client-cert.pem
│       ├── client-key.pem
│       ├── ib_buffer_pool
│       ├── ibdata1
│       ├── ib_logfile0
│       ├── ib_logfile1
│       ├── mysql [error opening dir]
│       ├── mysql.sock -> /var/run/mysqld/mysqld.sock
│       ├── performance_schema [error opening dir]
│       ├── private_key.pem
│       ├── public_key.pem
│       ├── school [error opening dir]
│       ├── server-cert.pem
│       ├── server-key.pem
│       └── sys [error opening dir]
└── nginx

11 directories, 28 files
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ mkdir diytomcat
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ cd diytomcat/
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/diytomcat$ pwd
/home/lyfubuntu/my_computer_language/docker/diytomcat
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/diytomcat$ ls
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/diytomcat$
```

6. 启动镜像。

```shell
docker run -d -p 3344:8080 --name luyanfengtomcat1 -v /home/lyfubuntu/my_computer_language/docker/diytomcat/test:/usr/local/apache-tomcat-9.0.37/webapps/test -v /home/lyfubuntu/my_computer_language/docker/diytomcat/tomcatlogs/:/usr/local/apache-tomcat-9.0.37/logs diytomcat
```

7. 访问测试: http://localhost:3344/ 。

![](https://cos.luyf-lemon-love.space/images/20220907134937.png)

8. 由于做了`卷挂载`，因此在本地编写项目。编写 `web.xml` 和 `index.jsp` 文件。编写这些文件需要使用 `root` 用户操作。

`diytomcat/test/index.jsp`

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>hello. xiaofan</title>
</head>
<body>
Hello World!<br/>
<%
System.out.println("-----my test web logs------");
%>
</body>
</html>
```

---

![](https://cos.luyf-lemon-love.space/images/20220907130713.png)

---

`diytomcat/test/WEB-INF/web.xml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app version="2.4" 
    xmlns="http://java.sun.com/xml/ns/j2ee" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee 
        http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd">
        
</web-app>
```

---

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ ls
apache-tomcat-9.0.37.tar.gz  dockerfile-cmd-test         mydockerfile-centos
Dockerfile                   dockerfile-entrypoint-test  readme.txt
dockerfile1                  jdk-8u341-linux-x64.tar.gz
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ ll *.gz
-rw-rw-r-- 1 lyfubuntu lyfubuntu  11211292 9月   6 22:07 apache-tomcat-9.0.37.tar.gz
-rw-rw-r-- 1 lyfubuntu lyfubuntu 148162542 9月   6 21:47 jdk-8u341-linux-x64.tar.gz
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ cat Dockerfile 
FROM centos:7
MAINTAINER LuYF-Lemon-love<luyanfeng_nlp@qq.com>

COPY readme.txt /usr/local/readme.txt

ADD jdk-8u341-linux-x64.tar.gz /usr/local/
ADD apache-tomcat-9.0.37.tar.gz /usr/local/

RUN yum -y install vim

ENV MYPATH /usr/local
WORKDIR $MYPATH

ENV JAVA_HOME /usr/local/jdk1.8.0_341
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV CATALINA_HOME /usr/local/apache-tomcat-9.0.37
ENV CATALINA_BASH /usr/local/apache-tomcat-9.0.37
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/lib:$CATALINA_HOME/bin

EXPOSE 8080

CMD /usr/local/apache-tomcat-9.0.37/bin/startup.sh && tail -F /usr/local/apache-tomcat-9.0.37/bin/logs/catalina.out
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ ls
apache-tomcat-9.0.37.tar.gz  dockerfile-cmd-test         mydockerfile-centos
Dockerfile                   dockerfile-entrypoint-test  readme.txt
dockerfile1                  jdk-8u341-linux-x64.tar.gz
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ cat readme.txt 
readme.txt
created by LuYF-Lemon-love <luyanfeng_nlp@qq.com>
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker images
REPOSITORY        TAG       IMAGE ID       CREATED         SIZE
entrypoint-test   latest    293b60111edb   20 hours ago    231MB
cmdtest           latest    e507939f0998   20 hours ago    231MB
mycentos          0.2       5f2260ba4d08   22 hours ago    624MB
lyf/centos        1.0       967c603048b0   45 hours ago    231MB
my_centos         0.1       d3a84994963f   3 days ago      559MB
my_tomcat         0.1       82bf5ce1034c   3 days ago      480MB
tomcat            9.0       d4488b7f8c9b   4 days ago      475MB
tomcat            latest    7a91e6f458bb   4 days ago      475MB
mysql             5.7       daff57b7d2d1   13 days ago     430MB
nginx             latest    2b7d6430f78d   2 weeks ago     142MB
centos            7         eeb6ee3f44bd   11 months ago   204MB
centos            latest    5d0da3dc9764   11 months ago   231MB
elasticsearch     7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                    PORTS     NAMES
f876c324441f   entrypoint-test       "ls -a -l"               20 hours ago   Exited (0) 20 hours ago             jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  20 hours ago   Exited (0) 20 hours ago             eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  20 hours ago   Exited (0) 20 hours ago             exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     20 hours ago   Created                             wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  20 hours ago   Exited (0) 20 hours ago             objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   22 hours ago   Exited (0) 22 hours ago             stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   43 hours ago   Exited (0) 43 hours ago             docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              45 hours ago   Exited (0) 45 hours ago             admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   2 days ago     Exited (0) 2 days ago               nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   2 days ago     Exited (0) 2 days ago               nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   2 days ago     Exited (0) 2 days ago               mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              3 days ago     Exited (0) 2 days ago               stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        3 days ago     Exited (143) 3 days ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        3 days ago     Exited (143) 3 days ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   3 days ago     Exited (143) 3 days ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        3 days ago     Exited (143) 3 days ago             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   3 days ago     Exited (0) 3 days ago               nginx01
bf46371dea89   centos                "/bin/bash"              4 days ago     Exited (0) 3 days ago               epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker build -t diytomcat .
Sending build context to Docker daemon  159.4MB
Step 1/15 : FROM centos:7
 ---> eeb6ee3f44bd
Step 2/15 : MAINTAINER LuYF-Lemon-love<luyanfeng_nlp@qq.com>
 ---> Using cache
 ---> 2d2197dc0ab2
Step 3/15 : COPY readme.txt /usr/local/readme.txt
 ---> c62e58bd0d8d
Step 4/15 : ADD jdk-8u341-linux-x64.tar.gz /usr/local/
 ---> 9db77dd27ce7
Step 5/15 : ADD apache-tomcat-9.0.37.tar.gz /usr/local/
 ---> 914c93a25c59
Step 6/15 : RUN yum -y install vim
 ---> Running in 6daa761306ac
Loaded plugins: fastestmirror, ovl
Determining fastest mirrors
 * base: mirrors.njupt.edu.cn
 * extras: mirrors.nju.edu.cn
 * updates: mirrors.nju.edu.cn
Resolving Dependencies
--> Running transaction check
---> Package vim-enhanced.x86_64 2:7.4.629-8.el7_9 will be installed
--> Processing Dependency: vim-common = 2:7.4.629-8.el7_9 for package: 2:vim-enhanced-7.4.629-8.el7_9.x86_64
--> Processing Dependency: which for package: 2:vim-enhanced-7.4.629-8.el7_9.x86_64
--> Processing Dependency: perl(:MODULE_COMPAT_5.16.3) for package: 2:vim-enhanced-7.4.629-8.el7_9.x86_64
--> Processing Dependency: libperl.so()(64bit) for package: 2:vim-enhanced-7.4.629-8.el7_9.x86_64
--> Processing Dependency: libgpm.so.2()(64bit) for package: 2:vim-enhanced-7.4.629-8.el7_9.x86_64
--> Running transaction check
---> Package gpm-libs.x86_64 0:1.20.7-6.el7 will be installed
---> Package perl.x86_64 4:5.16.3-299.el7_9 will be installed
--> Processing Dependency: perl(Socket) >= 1.3 for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Scalar::Util) >= 1.10 for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl-macros for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(threads::shared) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(threads) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(constant) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Time::Local) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Time::HiRes) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Storable) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Socket) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Scalar::Util) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Pod::Simple::XHTML) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Pod::Simple::Search) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Getopt::Long) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Filter::Util::Call) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(File::Temp) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(File::Spec::Unix) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(File::Spec::Functions) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(File::Spec) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(File::Path) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Exporter) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Cwd) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Carp) for package: 4:perl-5.16.3-299.el7_9.x86_64
---> Package perl-libs.x86_64 4:5.16.3-299.el7_9 will be installed
---> Package vim-common.x86_64 2:7.4.629-8.el7_9 will be installed
--> Processing Dependency: vim-filesystem for package: 2:vim-common-7.4.629-8.el7_9.x86_64
---> Package which.x86_64 0:2.20-7.el7 will be installed
--> Running transaction check
---> Package perl-Carp.noarch 0:1.26-244.el7 will be installed
---> Package perl-Exporter.noarch 0:5.68-3.el7 will be installed
---> Package perl-File-Path.noarch 0:2.09-2.el7 will be installed
---> Package perl-File-Temp.noarch 0:0.23.01-3.el7 will be installed
---> Package perl-Filter.x86_64 0:1.49-3.el7 will be installed
---> Package perl-Getopt-Long.noarch 0:2.40-3.el7 will be installed
--> Processing Dependency: perl(Pod::Usage) >= 1.14 for package: perl-Getopt-Long-2.40-3.el7.noarch
--> Processing Dependency: perl(Text::ParseWords) for package: perl-Getopt-Long-2.40-3.el7.noarch
---> Package perl-PathTools.x86_64 0:3.40-5.el7 will be installed
---> Package perl-Pod-Simple.noarch 1:3.28-4.el7 will be installed
--> Processing Dependency: perl(Pod::Escapes) >= 1.04 for package: 1:perl-Pod-Simple-3.28-4.el7.noarch
--> Processing Dependency: perl(Encode) for package: 1:perl-Pod-Simple-3.28-4.el7.noarch
---> Package perl-Scalar-List-Utils.x86_64 0:1.27-248.el7 will be installed
---> Package perl-Socket.x86_64 0:2.010-5.el7 will be installed
---> Package perl-Storable.x86_64 0:2.45-3.el7 will be installed
---> Package perl-Time-HiRes.x86_64 4:1.9725-3.el7 will be installed
---> Package perl-Time-Local.noarch 0:1.2300-2.el7 will be installed
---> Package perl-constant.noarch 0:1.27-2.el7 will be installed
---> Package perl-macros.x86_64 4:5.16.3-299.el7_9 will be installed
---> Package perl-threads.x86_64 0:1.87-4.el7 will be installed
---> Package perl-threads-shared.x86_64 0:1.43-6.el7 will be installed
---> Package vim-filesystem.x86_64 2:7.4.629-8.el7_9 will be installed
--> Running transaction check
---> Package perl-Encode.x86_64 0:2.51-7.el7 will be installed
---> Package perl-Pod-Escapes.noarch 1:1.04-299.el7_9 will be installed
---> Package perl-Pod-Usage.noarch 0:1.63-3.el7 will be installed
--> Processing Dependency: perl(Pod::Text) >= 3.15 for package: perl-Pod-Usage-1.63-3.el7.noarch
--> Processing Dependency: perl-Pod-Perldoc for package: perl-Pod-Usage-1.63-3.el7.noarch
---> Package perl-Text-ParseWords.noarch 0:3.29-4.el7 will be installed
--> Running transaction check
---> Package perl-Pod-Perldoc.noarch 0:3.20-4.el7 will be installed
--> Processing Dependency: perl(parent) for package: perl-Pod-Perldoc-3.20-4.el7.noarch
--> Processing Dependency: perl(HTTP::Tiny) for package: perl-Pod-Perldoc-3.20-4.el7.noarch
--> Processing Dependency: groff-base for package: perl-Pod-Perldoc-3.20-4.el7.noarch
---> Package perl-podlators.noarch 0:2.5.1-3.el7 will be installed
--> Running transaction check
---> Package groff-base.x86_64 0:1.22.2-8.el7 will be installed
---> Package perl-HTTP-Tiny.noarch 0:0.033-3.el7 will be installed
---> Package perl-parent.noarch 1:0.225-244.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package                    Arch       Version                Repository   Size
================================================================================
Installing:
 vim-enhanced               x86_64     2:7.4.629-8.el7_9      updates     1.1 M
Installing for dependencies:
 gpm-libs                   x86_64     1.20.7-6.el7           base         32 k
 groff-base                 x86_64     1.22.2-8.el7           base        942 k
 perl                       x86_64     4:5.16.3-299.el7_9     updates     8.0 M
 perl-Carp                  noarch     1.26-244.el7           base         19 k
 perl-Encode                x86_64     2.51-7.el7             base        1.5 M
 perl-Exporter              noarch     5.68-3.el7             base         28 k
 perl-File-Path             noarch     2.09-2.el7             base         26 k
 perl-File-Temp             noarch     0.23.01-3.el7          base         56 k
 perl-Filter                x86_64     1.49-3.el7             base         76 k
 perl-Getopt-Long           noarch     2.40-3.el7             base         56 k
 perl-HTTP-Tiny             noarch     0.033-3.el7            base         38 k
 perl-PathTools             x86_64     3.40-5.el7             base         82 k
 perl-Pod-Escapes           noarch     1:1.04-299.el7_9       updates      52 k
 perl-Pod-Perldoc           noarch     3.20-4.el7             base         87 k
 perl-Pod-Simple            noarch     1:3.28-4.el7           base        216 k
 perl-Pod-Usage             noarch     1.63-3.el7             base         27 k
 perl-Scalar-List-Utils     x86_64     1.27-248.el7           base         36 k
 perl-Socket                x86_64     2.010-5.el7            base         49 k
 perl-Storable              x86_64     2.45-3.el7             base         77 k
 perl-Text-ParseWords       noarch     3.29-4.el7             base         14 k
 perl-Time-HiRes            x86_64     4:1.9725-3.el7         base         45 k
 perl-Time-Local            noarch     1.2300-2.el7           base         24 k
 perl-constant              noarch     1.27-2.el7             base         19 k
 perl-libs                  x86_64     4:5.16.3-299.el7_9     updates     690 k
 perl-macros                x86_64     4:5.16.3-299.el7_9     updates      44 k
 perl-parent                noarch     1:0.225-244.el7        base         12 k
 perl-podlators             noarch     2.5.1-3.el7            base        112 k
 perl-threads               x86_64     1.87-4.el7             base         49 k
 perl-threads-shared        x86_64     1.43-6.el7             base         39 k
 vim-common                 x86_64     2:7.4.629-8.el7_9      updates     5.9 M
 vim-filesystem             x86_64     2:7.4.629-8.el7_9      updates      11 k
 which                      x86_64     2.20-7.el7             base         41 k

Transaction Summary
================================================================================
Install  1 Package (+32 Dependent packages)

Total download size: 19 M
Installed size: 63 M
Downloading packages:
warning: /var/cache/yum/x86_64/7/base/packages/perl-Carp-1.26-244.el7.noarch.rpm: Header V3 RSA/SHA256 Signature, key ID f4a80eb5: NOKEY
Public key for perl-Carp-1.26-244.el7.noarch.rpm is not installed
Public key for perl-Pod-Escapes-1.04-299.el7_9.noarch.rpm is not installed
http://mirrors.nju.edu.cn/centos/7.9.2009/updates/x86_64/Packages/perl-5.16.3-299.el7_9.x86_64.rpm: [Errno 14] curl#7 - "Failed to connect to 2001:da8:1007:4011::3: Cannot assign requested address"
Trying other mirror.
--------------------------------------------------------------------------------
Total                                              1.2 MB/s |  19 MB  00:15     
Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
Importing GPG key 0xF4A80EB5:
 Userid     : "CentOS-7 Key (CentOS 7 Official Signing Key) <security@centos.org>"
 Fingerprint: 6341 ab27 53d7 8a78 a7c2 7bb1 24c6 a8a7 f4a8 0eb5
 Package    : centos-release-7-9.2009.0.el7.centos.x86_64 (@CentOS)
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : gpm-libs-1.20.7-6.el7.x86_64                                1/33 
  Installing : 2:vim-filesystem-7.4.629-8.el7_9.x86_64                     2/33 
  Installing : 2:vim-common-7.4.629-8.el7_9.x86_64                         3/33 
  Installing : which-2.20-7.el7.x86_64                                     4/33 
install-info: No such file or directory for /usr/share/info/which.info.gz
  Installing : groff-base-1.22.2-8.el7.x86_64                              5/33 
  Installing : 1:perl-parent-0.225-244.el7.noarch                          6/33 
  Installing : perl-HTTP-Tiny-0.033-3.el7.noarch                           7/33 
  Installing : perl-podlators-2.5.1-3.el7.noarch                           8/33 
  Installing : perl-Pod-Perldoc-3.20-4.el7.noarch                          9/33 
  Installing : 1:perl-Pod-Escapes-1.04-299.el7_9.noarch                   10/33 
  Installing : perl-Encode-2.51-7.el7.x86_64                              11/33 
  Installing : perl-Text-ParseWords-3.29-4.el7.noarch                     12/33 
  Installing : perl-Pod-Usage-1.63-3.el7.noarch                           13/33 
  Installing : 4:perl-macros-5.16.3-299.el7_9.x86_64                      14/33 
  Installing : perl-Storable-2.45-3.el7.x86_64                            15/33 
  Installing : perl-Exporter-5.68-3.el7.noarch                            16/33 
  Installing : perl-constant-1.27-2.el7.noarch                            17/33 
  Installing : perl-Socket-2.010-5.el7.x86_64                             18/33 
  Installing : perl-Time-Local-1.2300-2.el7.noarch                        19/33 
  Installing : perl-Carp-1.26-244.el7.noarch                              20/33 
  Installing : perl-PathTools-3.40-5.el7.x86_64                           21/33 
  Installing : perl-Scalar-List-Utils-1.27-248.el7.x86_64                 22/33 
  Installing : 1:perl-Pod-Simple-3.28-4.el7.noarch                        23/33 
  Installing : perl-File-Temp-0.23.01-3.el7.noarch                        24/33 
  Installing : perl-File-Path-2.09-2.el7.noarch                           25/33 
  Installing : perl-threads-shared-1.43-6.el7.x86_64                      26/33 
  Installing : perl-threads-1.87-4.el7.x86_64                             27/33 
  Installing : 4:perl-Time-HiRes-1.9725-3.el7.x86_64                      28/33 
  Installing : perl-Filter-1.49-3.el7.x86_64                              29/33 
  Installing : 4:perl-libs-5.16.3-299.el7_9.x86_64                        30/33 
  Installing : perl-Getopt-Long-2.40-3.el7.noarch                         31/33 
  Installing : 4:perl-5.16.3-299.el7_9.x86_64                             32/33 
  Installing : 2:vim-enhanced-7.4.629-8.el7_9.x86_64                      33/33 
  Verifying  : perl-HTTP-Tiny-0.033-3.el7.noarch                           1/33 
  Verifying  : perl-threads-shared-1.43-6.el7.x86_64                       2/33 
  Verifying  : perl-Storable-2.45-3.el7.x86_64                             3/33 
  Verifying  : groff-base-1.22.2-8.el7.x86_64                              4/33 
  Verifying  : perl-Exporter-5.68-3.el7.noarch                             5/33 
  Verifying  : perl-constant-1.27-2.el7.noarch                             6/33 
  Verifying  : perl-PathTools-3.40-5.el7.x86_64                            7/33 
  Verifying  : 4:perl-macros-5.16.3-299.el7_9.x86_64                       8/33 
  Verifying  : 2:vim-enhanced-7.4.629-8.el7_9.x86_64                       9/33 
  Verifying  : 1:perl-parent-0.225-244.el7.noarch                         10/33 
  Verifying  : perl-Socket-2.010-5.el7.x86_64                             11/33 
  Verifying  : which-2.20-7.el7.x86_64                                    12/33 
  Verifying  : 2:vim-filesystem-7.4.629-8.el7_9.x86_64                    13/33 
  Verifying  : perl-File-Temp-0.23.01-3.el7.noarch                        14/33 
  Verifying  : 1:perl-Pod-Simple-3.28-4.el7.noarch                        15/33 
  Verifying  : perl-Time-Local-1.2300-2.el7.noarch                        16/33 
  Verifying  : 1:perl-Pod-Escapes-1.04-299.el7_9.noarch                   17/33 
  Verifying  : perl-Carp-1.26-244.el7.noarch                              18/33 
  Verifying  : 2:vim-common-7.4.629-8.el7_9.x86_64                        19/33 
  Verifying  : perl-Scalar-List-Utils-1.27-248.el7.x86_64                 20/33 
  Verifying  : perl-Pod-Usage-1.63-3.el7.noarch                           21/33 
  Verifying  : perl-Encode-2.51-7.el7.x86_64                              22/33 
  Verifying  : perl-Pod-Perldoc-3.20-4.el7.noarch                         23/33 
  Verifying  : perl-podlators-2.5.1-3.el7.noarch                          24/33 
  Verifying  : 4:perl-5.16.3-299.el7_9.x86_64                             25/33 
  Verifying  : perl-File-Path-2.09-2.el7.noarch                           26/33 
  Verifying  : perl-threads-1.87-4.el7.x86_64                             27/33 
  Verifying  : 4:perl-Time-HiRes-1.9725-3.el7.x86_64                      28/33 
  Verifying  : gpm-libs-1.20.7-6.el7.x86_64                               29/33 
  Verifying  : perl-Filter-1.49-3.el7.x86_64                              30/33 
  Verifying  : perl-Getopt-Long-2.40-3.el7.noarch                         31/33 
  Verifying  : perl-Text-ParseWords-3.29-4.el7.noarch                     32/33 
  Verifying  : 4:perl-libs-5.16.3-299.el7_9.x86_64                        33/33 

Installed:
  vim-enhanced.x86_64 2:7.4.629-8.el7_9                                         

Dependency Installed:
  gpm-libs.x86_64 0:1.20.7-6.el7                                                
  groff-base.x86_64 0:1.22.2-8.el7                                              
  perl.x86_64 4:5.16.3-299.el7_9                                                
  perl-Carp.noarch 0:1.26-244.el7                                               
  perl-Encode.x86_64 0:2.51-7.el7                                               
  perl-Exporter.noarch 0:5.68-3.el7                                             
  perl-File-Path.noarch 0:2.09-2.el7                                            
  perl-File-Temp.noarch 0:0.23.01-3.el7                                         
  perl-Filter.x86_64 0:1.49-3.el7                                               
  perl-Getopt-Long.noarch 0:2.40-3.el7                                          
  perl-HTTP-Tiny.noarch 0:0.033-3.el7                                           
  perl-PathTools.x86_64 0:3.40-5.el7                                            
  perl-Pod-Escapes.noarch 1:1.04-299.el7_9                                      
  perl-Pod-Perldoc.noarch 0:3.20-4.el7                                          
  perl-Pod-Simple.noarch 1:3.28-4.el7                                           
  perl-Pod-Usage.noarch 0:1.63-3.el7                                            
  perl-Scalar-List-Utils.x86_64 0:1.27-248.el7                                  
  perl-Socket.x86_64 0:2.010-5.el7                                              
  perl-Storable.x86_64 0:2.45-3.el7                                             
  perl-Text-ParseWords.noarch 0:3.29-4.el7                                      
  perl-Time-HiRes.x86_64 4:1.9725-3.el7                                         
  perl-Time-Local.noarch 0:1.2300-2.el7                                         
  perl-constant.noarch 0:1.27-2.el7                                             
  perl-libs.x86_64 4:5.16.3-299.el7_9                                           
  perl-macros.x86_64 4:5.16.3-299.el7_9                                         
  perl-parent.noarch 1:0.225-244.el7                                            
  perl-podlators.noarch 0:2.5.1-3.el7                                           
  perl-threads.x86_64 0:1.87-4.el7                                              
  perl-threads-shared.x86_64 0:1.43-6.el7                                       
  vim-common.x86_64 2:7.4.629-8.el7_9                                           
  vim-filesystem.x86_64 2:7.4.629-8.el7_9                                       
  which.x86_64 0:2.20-7.el7                                                     

Complete!
Removing intermediate container 6daa761306ac
 ---> 385c463cae22
Step 7/15 : ENV MYPATH /usr/local
 ---> Running in 581452cd1ddd
Removing intermediate container 581452cd1ddd
 ---> 588719a7a072
Step 8/15 : WORKDIR $MYPATH
 ---> Running in 24bbc61298f1
Removing intermediate container 24bbc61298f1
 ---> 990dbcdaee73
Step 9/15 : ENV JAVA_HOME /usr/local/jdk1.8.0_341
 ---> Running in e8cb4dfc433e
Removing intermediate container e8cb4dfc433e
 ---> 941ca6d85234
Step 10/15 : ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
 ---> Running in 6d21f1238ccd
Removing intermediate container 6d21f1238ccd
 ---> b599bd987423
Step 11/15 : ENV CATALINA_HOME /usr/local/apache-tomcat-9.0.37
 ---> Running in 4ad0392f30d9
Removing intermediate container 4ad0392f30d9
 ---> 2f1f4cf776c3
Step 12/15 : ENV CATALINA_BASH /usr/local/apache-tomcat-9.0.37
 ---> Running in b1a66f213375
Removing intermediate container b1a66f213375
 ---> f1ef859c3a6c
Step 13/15 : ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/lib:$CATALINA_HOME/bin
 ---> Running in dd8e1f69133a
Removing intermediate container dd8e1f69133a
 ---> 3223e2025e90
Step 14/15 : EXPOSE 8080
 ---> Running in fa842714f0af
Removing intermediate container fa842714f0af
 ---> 8e19301a1d35
Step 15/15 : CMD /usr/local/apache-tomcat-9.0.37/bin/startup.sh && tail -F /usr/local/apache-tomcat-9.0.37/bin/logs/catalina.out
 ---> Running in 8f75efc30c80
Removing intermediate container 8f75efc30c80
 ---> 531449811312
Successfully built 531449811312
Successfully tagged diytomcat:latest
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker images
REPOSITORY        TAG       IMAGE ID       CREATED              SIZE
diytomcat         latest    531449811312   About a minute ago   827MB
entrypoint-test   latest    293b60111edb   20 hours ago         231MB
cmdtest           latest    e507939f0998   21 hours ago         231MB
mycentos          0.2       5f2260ba4d08   23 hours ago         624MB
lyf/centos        1.0       967c603048b0   45 hours ago         231MB
my_centos         0.1       d3a84994963f   3 days ago           559MB
my_tomcat         0.1       82bf5ce1034c   3 days ago           480MB
tomcat            9.0       d4488b7f8c9b   4 days ago           475MB
tomcat            latest    7a91e6f458bb   4 days ago           475MB
mysql             5.7       daff57b7d2d1   13 days ago          430MB
nginx             latest    2b7d6430f78d   2 weeks ago          142MB
centos            7         eeb6ee3f44bd   11 months ago        204MB
centos            latest    5d0da3dc9764   11 months ago        231MB
elasticsearch     7.6.2     f29a1ee41030   2 years ago          791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                    PORTS     NAMES
f876c324441f   entrypoint-test       "ls -a -l"               20 hours ago   Exited (0) 20 hours ago             jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  20 hours ago   Exited (0) 20 hours ago             eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  21 hours ago   Exited (0) 21 hours ago             exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     21 hours ago   Created                             wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  21 hours ago   Exited (0) 21 hours ago             objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   23 hours ago   Exited (0) 23 hours ago             stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   43 hours ago   Exited (0) 43 hours ago             docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              45 hours ago   Exited (0) 45 hours ago             admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   2 days ago     Exited (0) 2 days ago               nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   2 days ago     Exited (0) 2 days ago               nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   2 days ago     Exited (0) 2 days ago               mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              3 days ago     Exited (0) 2 days ago               stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        3 days ago     Exited (143) 3 days ago             my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        3 days ago     Exited (143) 3 days ago             tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   3 days ago     Exited (143) 3 days ago             elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        3 days ago     Exited (143) 3 days ago             tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   3 days ago     Exited (0) 3 days ago               nginx01
bf46371dea89   centos                "/bin/bash"              4 days ago     Exited (0) 3 days ago               epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/my_Dockerfile$ cd ..
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ ls
centos_docker  files  my_centos  my_Dockerfile  mysql  nginx
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ tree
.
├── centos_docker
├── files
│   ├── 无标题文档 1
│   ├── apache-tomcat-9.0.37.tar.gz
│   └── jdk-8u341-linux-x64.tar.gz
├── my_centos
│   ├── my_centos_docker
│   └── my_ubuntu_docker
├── my_Dockerfile
│   ├── apache-tomcat-9.0.37.tar.gz
│   ├── Dockerfile
│   ├── dockerfile1
│   ├── dockerfile-cmd-test
│   ├── dockerfile-entrypoint-test
│   ├── jdk-8u341-linux-x64.tar.gz
│   ├── mydockerfile-centos
│   └── readme.txt
├── mysql
│   ├── conf
│   └── data
│       ├── auto.cnf
│       ├── ca-key.pem
│       ├── ca.pem
│       ├── client-cert.pem
│       ├── client-key.pem
│       ├── ib_buffer_pool
│       ├── ibdata1
│       ├── ib_logfile0
│       ├── ib_logfile1
│       ├── mysql [error opening dir]
│       ├── mysql.sock -> /var/run/mysqld/mysqld.sock
│       ├── performance_schema [error opening dir]
│       ├── private_key.pem
│       ├── public_key.pem
│       ├── school [error opening dir]
│       ├── server-cert.pem
│       ├── server-key.pem
│       └── sys [error opening dir]
└── nginx

11 directories, 28 files
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ mkdir diytomcat
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ cd diytomcat/
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/diytomcat$ pwd
/home/lyfubuntu/my_computer_language/docker/diytomcat
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/diytomcat$ ls
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/diytomcat$ docker run -d -p 3344:8080 --name luyanfengtomcat1 -v /home/lyfubuntu/my_computer_language/docker/diytomcat/test:/usr/local/apache-tomcat-9.0.37/webapps/test -v /home/lyfubuntu/my_computer_language/docker/diytomcat/tomcatlogs/:/usr/local/apache-tomcat-9.0.37/logs diytomcat
aa57776789cae348f5f8136620f4dec5f1b57454798e57c97517e099677a8b2c
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/diytomcat$ docker images
REPOSITORY        TAG       IMAGE ID       CREATED          SIZE
diytomcat         latest    531449811312   18 minutes ago   827MB
entrypoint-test   latest    293b60111edb   21 hours ago     231MB
cmdtest           latest    e507939f0998   21 hours ago     231MB
mycentos          0.2       5f2260ba4d08   23 hours ago     624MB
lyf/centos        1.0       967c603048b0   45 hours ago     231MB
my_centos         0.1       d3a84994963f   3 days ago       559MB
my_tomcat         0.1       82bf5ce1034c   3 days ago       480MB
tomcat            9.0       d4488b7f8c9b   4 days ago       475MB
tomcat            latest    7a91e6f458bb   4 days ago       475MB
mysql             5.7       daff57b7d2d1   13 days ago      430MB
nginx             latest    2b7d6430f78d   2 weeks ago      142MB
centos            7         eeb6ee3f44bd   11 months ago    204MB
centos            latest    5d0da3dc9764   11 months ago    231MB
elasticsearch     7.6.2     f29a1ee41030   2 years ago      791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/diytomcat$ docker ps
CONTAINER ID   IMAGE       COMMAND                  CREATED         STATUS         PORTS                                       NAMES
aa57776789ca   diytomcat   "/bin/sh -c '/usr/lo…"   2 minutes ago   Up 2 minutes   0.0.0.0:3344->8080/tcp, :::3344->8080/tcp   luyanfengtomcat1
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/diytomcat$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED         STATUS                    PORTS                                       NAMES
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   2 minutes ago   Up 2 minutes              0.0.0.0:3344->8080/tcp, :::3344->8080/tcp   luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               20 hours ago    Exited (0) 20 hours ago                                               jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  20 hours ago    Exited (0) 20 hours ago                                               eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  21 hours ago    Exited (0) 21 hours ago                                               exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     21 hours ago    Created                                                               wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  21 hours ago    Exited (0) 21 hours ago                                               objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   23 hours ago    Exited (0) 23 hours ago                                               stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   43 hours ago    Exited (0) 43 hours ago                                               docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              45 hours ago    Exited (0) 45 hours ago                                               admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   2 days ago      Exited (0) 2 days ago                                                 nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   2 days ago      Exited (0) 2 days ago                                                 nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   2 days ago      Exited (0) 2 days ago                                                 mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              3 days ago      Exited (0) 3 days ago                                                 stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        3 days ago      Exited (143) 3 days ago                                               my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        3 days ago      Exited (143) 3 days ago                                               tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   3 days ago      Exited (143) 3 days ago                                               elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        3 days ago      Exited (143) 3 days ago                                               tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   3 days ago      Exited (0) 3 days ago                                                 nginx01
bf46371dea89   centos                "/bin/bash"              4 days ago      Exited (0) 3 days ago                                                 epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/diytomcat$ ls
test  tomcatlogs
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/diytomcat$ tree
.
├── test
└── tomcatlogs
    ├── catalina.2022-09-07.log
    ├── catalina.out
    ├── host-manager.2022-09-07.log
    ├── localhost.2022-09-07.log
    ├── localhost_access_log.2022-09-07.txt
    └── manager.2022-09-07.log

2 directories, 6 files
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/diytomcat$ su root
密码： 
root@lyfubuntu:/home/lyfubuntu/my_computer_language/docker/diytomcat# ls
test  tomcatlogs
root@lyfubuntu:/home/lyfubuntu/my_computer_language/docker/diytomcat# cd test/
root@lyfubuntu:/home/lyfubuntu/my_computer_language/docker/diytomcat/test# vim index.jsp
root@lyfubuntu:/home/lyfubuntu/my_computer_language/docker/diytomcat/test# cat index.jsp 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>hello. xiaofan</title>
</head>
<body>
Hello World!<br/>
<%
System.out.println("-----my test web logs------");
%>
</body>
</html>
root@lyfubuntu:/home/lyfubuntu/my_computer_language/docker/diytomcat/test# ls
index.jsp
root@lyfubuntu:/home/lyfubuntu/my_computer_language/docker/diytomcat/test# mkdir WEB-INF
root@lyfubuntu:/home/lyfubuntu/my_computer_language/docker/diytomcat/test# LS
LS：未找到命令
root@lyfubuntu:/home/lyfubuntu/my_computer_language/docker/diytomcat/test# ls
index.jsp  WEB-INF
root@lyfubuntu:/home/lyfubuntu/my_computer_language/docker/diytomcat/test# cd WEB-INF/
root@lyfubuntu:/home/lyfubuntu/my_computer_language/docker/diytomcat/test/WEB-INF# ls
root@lyfubuntu:/home/lyfubuntu/my_computer_language/docker/diytomcat/test/WEB-INF# vim web.xml
root@lyfubuntu:/home/lyfubuntu/my_computer_language/docker/diytomcat/test/WEB-INF# ls
web.xml
root@lyfubuntu:/home/lyfubuntu/my_computer_language/docker/diytomcat/test/WEB-INF# cat web.xml 
<?xml version="1.0" encoding="UTF-8"?>
<web-app version="2.4" 
    xmlns="http://java.sun.com/xml/ns/j2ee" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee 
        http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd">
        
root@lyfubuntu:/home/lyfubuntu/my_computer_language/docker/diytomcat/test/WEB-INF# ls
web.xml
root@lyfubuntu:/home/lyfubuntu/my_computer_language/docker/diytomcat/test/WEB-INF# cd ../..
root@lyfubuntu:/home/lyfubuntu/my_computer_language/docker/diytomcat# ls
test  tomcatlogs
root@lyfubuntu:/home/lyfubuntu/my_computer_language/docker/diytomcat# exit
exit
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/diytomcat$ cd ..
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ ls
centos_docker  diytomcat  files  my_centos  my_Dockerfile  mysql  nginx
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY        TAG       IMAGE ID       CREATED          SIZE
diytomcat         latest    531449811312   50 minutes ago   827MB
entrypoint-test   latest    293b60111edb   21 hours ago     231MB
cmdtest           latest    e507939f0998   22 hours ago     231MB
mycentos          0.2       5f2260ba4d08   24 hours ago     624MB
lyf/centos        1.0       967c603048b0   46 hours ago     231MB
my_centos         0.1       d3a84994963f   3 days ago       559MB
my_tomcat         0.1       82bf5ce1034c   3 days ago       480MB
tomcat            9.0       d4488b7f8c9b   4 days ago       475MB
tomcat            latest    7a91e6f458bb   4 days ago       475MB
mysql             5.7       daff57b7d2d1   13 days ago      430MB
nginx             latest    2b7d6430f78d   2 weeks ago      142MB
centos            7         eeb6ee3f44bd   11 months ago    204MB
centos            latest    5d0da3dc9764   11 months ago    231MB
elasticsearch     7.6.2     f29a1ee41030   2 years ago      791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE       COMMAND                  CREATED          STATUS          PORTS                                       NAMES
aa57776789ca   diytomcat   "/bin/sh -c '/usr/lo…"   34 minutes ago   Up 34 minutes   0.0.0.0:3344->8080/tcp, :::3344->8080/tcp   luyanfengtomcat1
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                    PORTS                                       NAMES
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   34 minutes ago   Up 34 minutes             0.0.0.0:3344->8080/tcp, :::3344->8080/tcp   luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               21 hours ago     Exited (0) 21 hours ago                                               jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  21 hours ago     Exited (0) 21 hours ago                                               eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  21 hours ago     Exited (0) 21 hours ago                                               exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     21 hours ago     Created                                                               wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  21 hours ago     Exited (0) 21 hours ago                                               objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   23 hours ago     Exited (0) 23 hours ago                                               stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   44 hours ago     Exited (0) 44 hours ago                                               docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              46 hours ago     Exited (0) 46 hours ago                                               admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   2 days ago       Exited (0) 2 days ago                                                 nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   2 days ago       Exited (0) 2 days ago                                                 nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   2 days ago       Exited (0) 2 days ago                                                 mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              3 days ago       Exited (0) 3 days ago                                                 stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        3 days ago       Exited (143) 3 days ago                                               my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        3 days ago       Exited (143) 3 days ago                                               tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   3 days ago       Exited (143) 3 days ago                                               elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        3 days ago       Exited (143) 3 days ago                                               tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   4 days ago       Exited (0) 3 days ago                                                 nginx01
bf46371dea89   centos                "/bin/bash"              4 days ago       Exited (0) 3 days ago                                                 epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$
```

---

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ ls
centos_docker  diytomcat  files  my_centos  my_Dockerfile  mysql  nginx
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY        TAG       IMAGE ID       CREATED         SIZE
diytomcat         latest    531449811312   2 hours ago     827MB
entrypoint-test   latest    293b60111edb   22 hours ago    231MB
cmdtest           latest    e507939f0998   23 hours ago    231MB
mycentos          0.2       5f2260ba4d08   25 hours ago    624MB
lyf/centos        1.0       967c603048b0   47 hours ago    231MB
my_centos         0.1       d3a84994963f   3 days ago      559MB
my_tomcat         0.1       82bf5ce1034c   3 days ago      480MB
tomcat            9.0       d4488b7f8c9b   4 days ago      475MB
tomcat            latest    7a91e6f458bb   4 days ago      475MB
mysql             5.7       daff57b7d2d1   13 days ago     430MB
nginx             latest    2b7d6430f78d   2 weeks ago     142MB
centos            7         eeb6ee3f44bd   11 months ago   204MB
centos            latest    5d0da3dc9764   11 months ago   231MB
elasticsearch     7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE       COMMAND                  CREATED       STATUS       PORTS                                       NAMES
aa57776789ca   diytomcat   "/bin/sh -c '/usr/lo…"   2 hours ago   Up 2 hours   0.0.0.0:3344->8080/tcp, :::3344->8080/tcp   luyanfengtomcat1
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                    PORTS                                       NAMES
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   2 hours ago    Up 2 hours                0.0.0.0:3344->8080/tcp, :::3344->8080/tcp   luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               22 hours ago   Exited (0) 22 hours ago                                               jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  22 hours ago   Exited (0) 22 hours ago                                               eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  23 hours ago   Exited (0) 23 hours ago                                               exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     23 hours ago   Created                                                               wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  23 hours ago   Exited (0) 23 hours ago                                               objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   25 hours ago   Exited (0) 25 hours ago                                               stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   45 hours ago   Exited (0) 45 hours ago                                               docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              47 hours ago   Exited (0) 47 hours ago                                               admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   2 days ago     Exited (0) 2 days ago                                                 nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   2 days ago     Exited (0) 2 days ago                                                 nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   2 days ago     Exited (0) 2 days ago                                                 mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              3 days ago     Exited (0) 3 days ago                                                 stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        3 days ago     Exited (143) 3 days ago                                               my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        3 days ago     Exited (143) 3 days ago                                               tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   3 days ago     Exited (143) 3 days ago                                               elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        3 days ago     Exited (143) 3 days ago                                               tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   4 days ago     Exited (0) 4 days ago                                                 nginx01
bf46371dea89   centos                "/bin/bash"              4 days ago     Exited (0) 3 days ago                                                 epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker stop aa57776789ca
aa57776789ca
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY        TAG       IMAGE ID       CREATED         SIZE
diytomcat         latest    531449811312   2 hours ago     827MB
entrypoint-test   latest    293b60111edb   22 hours ago    231MB
cmdtest           latest    e507939f0998   23 hours ago    231MB
mycentos          0.2       5f2260ba4d08   25 hours ago    624MB
lyf/centos        1.0       967c603048b0   47 hours ago    231MB
my_centos         0.1       d3a84994963f   3 days ago      559MB
my_tomcat         0.1       82bf5ce1034c   3 days ago      480MB
tomcat            9.0       d4488b7f8c9b   4 days ago      475MB
tomcat            latest    7a91e6f458bb   4 days ago      475MB
mysql             5.7       daff57b7d2d1   13 days ago     430MB
nginx             latest    2b7d6430f78d   2 weeks ago     142MB
centos            7         eeb6ee3f44bd   11 months ago   204MB
centos            latest    5d0da3dc9764   11 months ago   231MB
elasticsearch     7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                        PORTS     NAMES
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   2 hours ago    Exited (137) 40 seconds ago             luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               22 hours ago   Exited (0) 22 hours ago                 jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  22 hours ago   Exited (0) 22 hours ago                 eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  23 hours ago   Exited (0) 23 hours ago                 exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     23 hours ago   Created                                 wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  23 hours ago   Exited (0) 23 hours ago                 objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   25 hours ago   Exited (0) 25 hours ago                 stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   45 hours ago   Exited (0) 45 hours ago                 docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              47 hours ago   Exited (0) 47 hours ago                 admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   2 days ago     Exited (0) 2 days ago                   nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   2 days ago     Exited (0) 2 days ago                   nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   2 days ago     Exited (0) 2 days ago                   mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              3 days ago     Exited (0) 3 days ago                   stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        3 days ago     Exited (143) 3 days ago                 my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        3 days ago     Exited (143) 3 days ago                 tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   3 days ago     Exited (143) 3 days ago                 elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        3 days ago     Exited (143) 3 days ago                 tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   4 days ago     Exited (0) 4 days ago                   nginx01
bf46371dea89   centos                "/bin/bash"              4 days ago     Exited (0) 3 days ago                   epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$
```

![](https://cos.luyf-lemon-love.space/images/20220907144641.png)

![](https://cos.luyf-lemon-love.space/images/20220907144736.png)

### 发布自己的镜像到 `Docker Hub`

1. `注册登录` `Docker Hub`: https://hub.docker.com/ 。

![](https://cos.luyf-lemon-love.space/images/20220907153333.png)

![](https://cos.luyf-lemon-love.space/images/20220907153357.png)

2. 登录 `Docker Hub`。

```shell
$ docker login -u luyanfeng123
Password: 
WARNING! Your password will be stored unencrypted in /home/lyfubuntu/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```

3. 将我们的镜像提交到 `Docker Hub` 上。

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY        TAG       IMAGE ID       CREATED         SIZE
diytomcat         latest    531449811312   3 hours ago     827MB
entrypoint-test   latest    293b60111edb   24 hours ago    231MB
cmdtest           latest    e507939f0998   24 hours ago    231MB
mycentos          0.2       5f2260ba4d08   26 hours ago    624MB
lyf/centos        1.0       967c603048b0   2 days ago      231MB
my_centos         0.1       d3a84994963f   3 days ago      559MB
my_tomcat         0.1       82bf5ce1034c   3 days ago      480MB
tomcat            9.0       d4488b7f8c9b   4 days ago      475MB
tomcat            latest    7a91e6f458bb   4 days ago      475MB
mysql             5.7       daff57b7d2d1   13 days ago     430MB
nginx             latest    2b7d6430f78d   2 weeks ago     142MB
centos            7         eeb6ee3f44bd   11 months ago   204MB
centos            latest    5d0da3dc9764   11 months ago   231MB
elasticsearch     7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker tag diytomcat luyanfeng123/diytomcat:1.0
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
diytomcat                latest    531449811312   3 hours ago     827MB
luyanfeng123/diytomcat   1.0       531449811312   3 hours ago     827MB
entrypoint-test          latest    293b60111edb   24 hours ago    231MB
cmdtest                  latest    e507939f0998   24 hours ago    231MB
mycentos                 0.2       5f2260ba4d08   26 hours ago    624MB
lyf/centos               1.0       967c603048b0   2 days ago      231MB
my_centos                0.1       d3a84994963f   3 days ago      559MB
my_tomcat                0.1       82bf5ce1034c   3 days ago      480MB
tomcat                   9.0       d4488b7f8c9b   4 days ago      475MB
tomcat                   latest    7a91e6f458bb   4 days ago      475MB
mysql                    5.7       daff57b7d2d1   13 days ago     430MB
nginx                    latest    2b7d6430f78d   2 weeks ago     142MB
centos                   7         eeb6ee3f44bd   11 months ago   204MB
centos                   latest    5d0da3dc9764   11 months ago   231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker push luyanfeng123/diytomcat:1.0
The push refers to repository [docker.io/luyanfeng123/diytomcat]
73c5982fe8f5: Pushed 
7471dd5f44a7: Pushed 
838281d0086f: Pushed 
4af9aa88955b: Pushed 
174f56854903: Mounted from library/centos 
1.0: digest: sha256:188e4bb260c7db6c48187e8793d07187b9b1a0094d3cef1c78bf0e34d1130fab size: 1373
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$
```

>注意：提交到 `Docker Hub` 上的镜像的前缀一定要是你的 `Docker Hub` `账号名`（ `docker push luyanfeng123/diytomcat:1.0` ）。镜像的 `TAG` 可以通过 `docker tag` 修改。

![](https://cos.luyf-lemon-love.space/images/20220907161113.png)

![](https://cos.luyf-lemon-love.space/images/20220907161342.png)

---

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker login --help

Usage:  docker login [OPTIONS] [SERVER]

Log in to a Docker registry.
If no server is specified, the default is defined by the daemon.

Options:
  -p, --password string   Password
      --password-stdin    Take the password from stdin
  -u, --username string   Username
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY        TAG       IMAGE ID       CREATED         SIZE
diytomcat         latest    531449811312   3 hours ago     827MB
entrypoint-test   latest    293b60111edb   23 hours ago    231MB
cmdtest           latest    e507939f0998   24 hours ago    231MB
mycentos          0.2       5f2260ba4d08   26 hours ago    624MB
lyf/centos        1.0       967c603048b0   2 days ago      231MB
my_centos         0.1       d3a84994963f   3 days ago      559MB
my_tomcat         0.1       82bf5ce1034c   3 days ago      480MB
tomcat            9.0       d4488b7f8c9b   4 days ago      475MB
tomcat            latest    7a91e6f458bb   4 days ago      475MB
mysql             5.7       daff57b7d2d1   13 days ago     430MB
nginx             latest    2b7d6430f78d   2 weeks ago     142MB
centos            7         eeb6ee3f44bd   11 months ago   204MB
centos            latest    5d0da3dc9764   11 months ago   231MB
elasticsearch     7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                           PORTS     NAMES
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   3 hours ago    Exited (137) About an hour ago             luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               23 hours ago   Exited (0) 23 hours ago                    jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  23 hours ago   Exited (0) 23 hours ago                    eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  24 hours ago   Exited (0) 24 hours ago                    exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     24 hours ago   Created                                    wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  24 hours ago   Exited (0) 24 hours ago                    objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   26 hours ago   Exited (0) 26 hours ago                    stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   46 hours ago   Exited (0) 46 hours ago                    docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              2 days ago     Exited (0) 2 days ago                      admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   2 days ago     Exited (0) 2 days ago                      nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   2 days ago     Exited (0) 2 days ago                      nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   2 days ago     Exited (0) 2 days ago                      mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              3 days ago     Exited (0) 3 days ago                      stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        3 days ago     Exited (143) 3 days ago                    my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        3 days ago     Exited (143) 3 days ago                    tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   3 days ago     Exited (143) 3 days ago                    elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        4 days ago     Exited (143) 3 days ago                    tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   4 days ago     Exited (0) 4 days ago                      nginx01
bf46371dea89   centos                "/bin/bash"              4 days ago     Exited (0) 3 days ago                      epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker login -u luyanfeng123
Password: 
WARNING! Your password will be stored unencrypted in /home/lyfubuntu/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker push --help

Usage:  docker push [OPTIONS] NAME[:TAG]

Push an image or a repository to a registry

Options:
  -a, --all-tags                Push all tagged images in the repository
      --disable-content-trust   Skip image signing (default true)
  -q, --quiet                   Suppress verbose output
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker tag --help

Usage:  docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]

Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY        TAG       IMAGE ID       CREATED         SIZE
diytomcat         latest    531449811312   3 hours ago     827MB
entrypoint-test   latest    293b60111edb   24 hours ago    231MB
cmdtest           latest    e507939f0998   24 hours ago    231MB
mycentos          0.2       5f2260ba4d08   26 hours ago    624MB
lyf/centos        1.0       967c603048b0   2 days ago      231MB
my_centos         0.1       d3a84994963f   3 days ago      559MB
my_tomcat         0.1       82bf5ce1034c   3 days ago      480MB
tomcat            9.0       d4488b7f8c9b   4 days ago      475MB
tomcat            latest    7a91e6f458bb   4 days ago      475MB
mysql             5.7       daff57b7d2d1   13 days ago     430MB
nginx             latest    2b7d6430f78d   2 weeks ago     142MB
centos            7         eeb6ee3f44bd   11 months ago   204MB
centos            latest    5d0da3dc9764   11 months ago   231MB
elasticsearch     7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker tag diytomcat luyanfeng123/diytomcat:1.0
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
diytomcat                latest    531449811312   3 hours ago     827MB
luyanfeng123/diytomcat   1.0       531449811312   3 hours ago     827MB
entrypoint-test          latest    293b60111edb   24 hours ago    231MB
cmdtest                  latest    e507939f0998   24 hours ago    231MB
mycentos                 0.2       5f2260ba4d08   26 hours ago    624MB
lyf/centos               1.0       967c603048b0   2 days ago      231MB
my_centos                0.1       d3a84994963f   3 days ago      559MB
my_tomcat                0.1       82bf5ce1034c   3 days ago      480MB
tomcat                   9.0       d4488b7f8c9b   4 days ago      475MB
tomcat                   latest    7a91e6f458bb   4 days ago      475MB
mysql                    5.7       daff57b7d2d1   13 days ago     430MB
nginx                    latest    2b7d6430f78d   2 weeks ago     142MB
centos                   7         eeb6ee3f44bd   11 months ago   204MB
centos                   latest    5d0da3dc9764   11 months ago   231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ docker push luyanfeng123/diytomcat:1.0
The push refers to repository [docker.io/luyanfeng123/diytomcat]
73c5982fe8f5: Pushed 
7471dd5f44a7: Pushed 
838281d0086f: Pushed 
4af9aa88955b: Pushed 
174f56854903: Mounted from library/centos 
1.0: digest: sha256:188e4bb260c7db6c48187e8793d07187b9b1a0094d3cef1c78bf0e34d1130fab size: 1373
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$
```

### 总结

![](https://cos.luyf-lemon-love.space/images/20220907171452.png)

![](https://cos.luyf-lemon-love.space/images/20220907171513.png)

## `Docker` 网络

### 连接 `Docker0`

```shell
$ ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 40:b0:34:3e:a2:10 brd ff:ff:ff:ff:ff:ff
    inet 10.4.3.151/21 brd 10.4.7.255 scope global dynamic noprefixroute enp1s0
       valid_lft 74583sec preferred_lft 74583sec
    inet6 fe80::39c7:dd87:8b0b:5357/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
    link/ether 02:42:be:ba:dd:40 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
$ # 1. lo: 127.0.0.1 -> 本地回环地址
$ # 2. enp1s0: 10.4.3.151 -> IP 地址
$ # 3. docker0: 172.17.0.1 -> docker0 地址
```

---

由于 `docker hub` 官网的基础镜像 `tomcat` 只包含`简单的操作系统`，相当于裸机状态，需要手动安装需要的命令。所以我们需要手动构建镜像。

```dockerfile
FROM tomcat
MAINTAINER LuYF-Lemon-love<luyanfeng_nlp@qq.com>

RUN apt update

# ip addr
RUN apt install -y iproute2

# ping
RUN apt install iputils-ping
```

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ ls
Dockerfile
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ cat Dockerfile 
FROM tomcat
MAINTAINER LuYF-Lemon-love<luyanfeng_nlp@qq.com>

RUN apt update

# ip addr
RUN apt install -y iproute2

# ping
RUN apt install iputils-ping
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker build -t tomcat_ip_ping .
Sending build context to Docker daemon  2.048kB
Step 1/5 : FROM tomcat
 ---> 7a91e6f458bb
Step 2/5 : MAINTAINER LuYF-Lemon-love<luyanfeng_nlp@qq.com>
 ---> Running in d5071441a68e
Removing intermediate container d5071441a68e
 ---> 8035a6352267
Step 3/5 : RUN apt update
 ---> Running in 1db691317097

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Get:1 http://archive.ubuntu.com/ubuntu jammy InRelease [270 kB]
Get:2 http://security.ubuntu.com/ubuntu jammy-security InRelease [110 kB]
Get:3 http://archive.ubuntu.com/ubuntu jammy-updates InRelease [114 kB]
Get:4 http://security.ubuntu.com/ubuntu jammy-security/main amd64 Packages [369 kB]
Get:5 http://archive.ubuntu.com/ubuntu jammy-backports InRelease [99.8 kB]
Get:6 http://archive.ubuntu.com/ubuntu jammy/restricted amd64 Packages [164 kB]
Get:7 http://archive.ubuntu.com/ubuntu jammy/multiverse amd64 Packages [266 kB]
Get:8 http://archive.ubuntu.com/ubuntu jammy/universe amd64 Packages [17.5 MB]
Get:9 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 Packages [148 kB]
Get:10 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 Packages [4,644 B]
Get:11 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 Packages [353 kB]
Get:12 http://archive.ubuntu.com/ubuntu jammy/main amd64 Packages [1,792 kB]
Get:13 http://archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 Packages [394 kB]
Get:14 http://archive.ubuntu.com/ubuntu jammy-updates/universe amd64 Packages [319 kB]
Get:15 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages [686 kB]
Get:16 http://archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 Packages [7,791 B]
Get:17 http://archive.ubuntu.com/ubuntu jammy-backports/universe amd64 Packages [7,275 B]
Get:18 http://archive.ubuntu.com/ubuntu jammy-backports/main amd64 Packages [3,175 B]
Fetched 22.6 MB in 13s (1,769 kB/s)
Reading package lists...
Building dependency tree...
Reading state information...
All packages are up to date.
Removing intermediate container 1db691317097
 ---> 478f572a7767
Step 4/5 : RUN apt install -y iproute2
 ---> Running in 9d3dc01a3cd1

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  libatm1 libbpf0 libbsd0 libcap2-bin libelf1 libmd0 libmnl0 libpam-cap
  libxtables12
Suggested packages:
  iproute2-doc
The following NEW packages will be installed:
  iproute2 libatm1 libbpf0 libbsd0 libcap2-bin libelf1 libmd0 libmnl0
  libpam-cap libxtables12
0 upgraded, 10 newly installed, 0 to remove and 0 not upgraded.
Need to get 1,430 kB of archives.
After this operation, 4,151 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu jammy/main amd64 libelf1 amd64 0.186-1build1 [51.0 kB]
Get:2 http://archive.ubuntu.com/ubuntu jammy/main amd64 libbpf0 amd64 1:0.5.0-1 [140 kB]
Get:3 http://archive.ubuntu.com/ubuntu jammy/main amd64 libmd0 amd64 1.0.4-1build1 [23.0 kB]
Get:4 http://archive.ubuntu.com/ubuntu jammy/main amd64 libbsd0 amd64 0.11.5-1 [44.8 kB]
Get:5 http://archive.ubuntu.com/ubuntu jammy/main amd64 libmnl0 amd64 1.0.4-3build2 [13.2 kB]
Get:6 http://archive.ubuntu.com/ubuntu jammy/main amd64 libxtables12 amd64 1.8.7-1ubuntu5 [31.2 kB]
Get:7 http://archive.ubuntu.com/ubuntu jammy/main amd64 libcap2-bin amd64 1:2.44-1build3 [26.0 kB]
Get:8 http://archive.ubuntu.com/ubuntu jammy/main amd64 iproute2 amd64 5.15.0-1ubuntu2 [1,070 kB]
Get:9 http://archive.ubuntu.com/ubuntu jammy/main amd64 libatm1 amd64 1:2.5.1-4build2 [22.8 kB]
Get:10 http://archive.ubuntu.com/ubuntu jammy/main amd64 libpam-cap amd64 1:2.44-1build3 [7,932 B]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 1,430 kB in 3s (551 kB/s)
Selecting previously unselected package libelf1:amd64.
(Reading database ... 7926 files and directories currently installed.)
Preparing to unpack .../0-libelf1_0.186-1build1_amd64.deb ...
Unpacking libelf1:amd64 (0.186-1build1) ...
Selecting previously unselected package libbpf0:amd64.
Preparing to unpack .../1-libbpf0_1%3a0.5.0-1_amd64.deb ...
Unpacking libbpf0:amd64 (1:0.5.0-1) ...
Selecting previously unselected package libmd0:amd64.
Preparing to unpack .../2-libmd0_1.0.4-1build1_amd64.deb ...
Unpacking libmd0:amd64 (1.0.4-1build1) ...
Selecting previously unselected package libbsd0:amd64.
Preparing to unpack .../3-libbsd0_0.11.5-1_amd64.deb ...
Unpacking libbsd0:amd64 (0.11.5-1) ...
Selecting previously unselected package libmnl0:amd64.
Preparing to unpack .../4-libmnl0_1.0.4-3build2_amd64.deb ...
Unpacking libmnl0:amd64 (1.0.4-3build2) ...
Selecting previously unselected package libxtables12:amd64.
Preparing to unpack .../5-libxtables12_1.8.7-1ubuntu5_amd64.deb ...
Unpacking libxtables12:amd64 (1.8.7-1ubuntu5) ...
Selecting previously unselected package libcap2-bin.
Preparing to unpack .../6-libcap2-bin_1%3a2.44-1build3_amd64.deb ...
Unpacking libcap2-bin (1:2.44-1build3) ...
Selecting previously unselected package iproute2.
Preparing to unpack .../7-iproute2_5.15.0-1ubuntu2_amd64.deb ...
Unpacking iproute2 (5.15.0-1ubuntu2) ...
Selecting previously unselected package libatm1:amd64.
Preparing to unpack .../8-libatm1_1%3a2.5.1-4build2_amd64.deb ...
Unpacking libatm1:amd64 (1:2.5.1-4build2) ...
Selecting previously unselected package libpam-cap:amd64.
Preparing to unpack .../9-libpam-cap_1%3a2.44-1build3_amd64.deb ...
Unpacking libpam-cap:amd64 (1:2.44-1build3) ...
Setting up libatm1:amd64 (1:2.5.1-4build2) ...
Setting up libcap2-bin (1:2.44-1build3) ...
Setting up libmnl0:amd64 (1.0.4-3build2) ...
Setting up libxtables12:amd64 (1.8.7-1ubuntu5) ...
Setting up libmd0:amd64 (1.0.4-1build1) ...
Setting up libbsd0:amd64 (0.11.5-1) ...
Setting up libelf1:amd64 (0.186-1build1) ...
Setting up libpam-cap:amd64 (1:2.44-1build3) ...
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.34.0 /usr/local/share/perl/5.34.0 /usr/lib/x86_64-linux-gnu/perl5/5.34 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl-base /usr/lib/x86_64-linux-gnu/perl/5.34 /usr/share/perl/5.34 /usr/local/lib/site_perl) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
debconf: falling back to frontend: Teletype
Setting up libbpf0:amd64 (1:0.5.0-1) ...
Setting up iproute2 (5.15.0-1ubuntu2) ...
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.34.0 /usr/local/share/perl/5.34.0 /usr/lib/x86_64-linux-gnu/perl5/5.34 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl-base /usr/lib/x86_64-linux-gnu/perl/5.34 /usr/share/perl/5.34 /usr/local/lib/site_perl) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
debconf: falling back to frontend: Teletype
Processing triggers for libc-bin (2.35-0ubuntu3.1) ...
Removing intermediate container 9d3dc01a3cd1
 ---> c13ca967b2a4
Step 5/5 : RUN apt install iputils-ping
 ---> Running in b2f1f0b10862

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
The following NEW packages will be installed:
  iputils-ping
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 42.9 kB of archives.
After this operation, 116 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu jammy/main amd64 iputils-ping amd64 3:20211215-1 [42.9 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 42.9 kB in 1s (41.1 kB/s)
Selecting previously unselected package iputils-ping.
(Reading database ... 8170 files and directories currently installed.)
Preparing to unpack .../iputils-ping_3%3a20211215-1_amd64.deb ...
Unpacking iputils-ping (3:20211215-1) ...
Setting up iputils-ping (3:20211215-1) ...
Removing intermediate container b2f1f0b10862
 ---> 49e7365dc2c9
Successfully built 49e7365dc2c9
Successfully tagged tomcat_ip_ping:latest
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
tomcat_ip_ping           latest    49e7365dc2c9   7 seconds ago   519MB
diytomcat                latest    531449811312   27 hours ago    827MB
luyanfeng123/diytomcat   1.0       531449811312   27 hours ago    827MB
entrypoint-test          latest    293b60111edb   47 hours ago    231MB
cmdtest                  latest    e507939f0998   47 hours ago    231MB
mycentos                 0.2       5f2260ba4d08   2 days ago      624MB
lyf/centos               1.0       967c603048b0   3 days ago      231MB
my_centos                0.1       d3a84994963f   4 days ago      559MB
my_tomcat                0.1       82bf5ce1034c   4 days ago      480MB
tomcat                   9.0       d4488b7f8c9b   5 days ago      475MB
tomcat                   latest    7a91e6f458bb   5 days ago      475MB
mysql                    5.7       daff57b7d2d1   2 weeks ago     430MB
nginx                    latest    2b7d6430f78d   2 weeks ago     142MB
centos                   7         eeb6ee3f44bd   11 months ago   204MB
centos                   latest    5d0da3dc9764   11 months ago   231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                      PORTS     NAMES
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   26 hours ago   Exited (137) 24 hours ago             luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               47 hours ago   Exited (0) 47 hours ago               jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  47 hours ago   Exited (0) 47 hours ago               eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  47 hours ago   Exited (0) 47 hours ago               exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     47 hours ago   Created                               wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  47 hours ago   Exited (0) 47 hours ago               objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 days ago     Exited (0) 2 days ago                 stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   2 days ago     Exited (0) 2 days ago                 docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              3 days ago     Exited (0) 2 days ago                 admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   3 days ago     Exited (0) 3 days ago                 nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   3 days ago     Exited (0) 3 days ago                 nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   3 days ago     Exited (0) 3 days ago                 mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              4 days ago     Exited (0) 4 days ago                 stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        4 days ago     Exited (143) 4 days ago               my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        4 days ago     Exited (143) 4 days ago               tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   4 days ago     Exited (143) 4 days ago               elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        5 days ago     Exited (143) 4 days ago               tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   5 days ago     Exited (0) 5 days ago                 nginx01
bf46371dea89   centos                "/bin/bash"              5 days ago     Exited (0) 4 days ago                 epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$
```

---

`问题`: `docker` 是如何处理`容器网络访问`的？

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker run -d -P --name tomcat_ip_ping01 tomcat_ip_ping
0b4ad39162568878ce57127efd68f499d1ca2db758e1a10b75848ec733f5d068
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
tomcat_ip_ping           latest    49e7365dc2c9   8 minutes ago   519MB
diytomcat                latest    531449811312   27 hours ago    827MB
luyanfeng123/diytomcat   1.0       531449811312   27 hours ago    827MB
entrypoint-test          latest    293b60111edb   47 hours ago    231MB
cmdtest                  latest    e507939f0998   47 hours ago    231MB
mycentos                 0.2       5f2260ba4d08   2 days ago      624MB
lyf/centos               1.0       967c603048b0   3 days ago      231MB
my_centos                0.1       d3a84994963f   4 days ago      559MB
my_tomcat                0.1       82bf5ce1034c   4 days ago      480MB
tomcat                   9.0       d4488b7f8c9b   5 days ago      475MB
tomcat                   latest    7a91e6f458bb   5 days ago      475MB
mysql                    5.7       daff57b7d2d1   2 weeks ago     430MB
nginx                    latest    2b7d6430f78d   2 weeks ago     142MB
centos                   7         eeb6ee3f44bd   11 months ago   204MB
centos                   latest    5d0da3dc9764   11 months ago   231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED              STATUS              PORTS                                         NAMES
0b4ad3916256   tomcat_ip_ping   "catalina.sh run"   About a minute ago   Up About a minute   0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED              STATUS                      PORTS                                         NAMES
0b4ad3916256   tomcat_ip_ping        "catalina.sh run"        About a minute ago   Up About a minute           0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   26 hours ago         Exited (137) 25 hours ago                                                 luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               47 hours ago         Exited (0) 47 hours ago                                                   jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  47 hours ago         Exited (0) 47 hours ago                                                   eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  47 hours ago         Exited (0) 47 hours ago                                                   exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     47 hours ago         Created                                                                   wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  47 hours ago         Exited (0) 47 hours ago                                                   objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 days ago           Exited (0) 2 days ago                                                     stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   2 days ago           Exited (0) 2 days ago                                                     docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              3 days ago           Exited (0) 3 days ago                                                     admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   3 days ago           Exited (0) 3 days ago                                                     nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   3 days ago           Exited (0) 3 days ago                                                     nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   3 days ago           Exited (0) 3 days ago                                                     mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              4 days ago           Exited (0) 4 days ago                                                     stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        4 days ago           Exited (143) 4 days ago                                                   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        4 days ago           Exited (143) 4 days ago                                                   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   4 days ago           Exited (143) 4 days ago                                                   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        5 days ago           Exited (143) 4 days ago                                                   tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   5 days ago           Exited (0) 5 days ago                                                     nginx01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat(base(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu(base) lyfubuntu@lyfubuntu:(base) lyfubuntu@lyfubuntu:(base) lyfubuntu@l(base) lyfubuntu@lyfubuntu:~/my_computer_language/dock(base) lyfubuntu@lyfubuntu:~/my_comp(base) lyfubuntu@l(base) lyfubuntu@l(base) lyfubuntu@l(base) lyfubuntu@l(base) lyfubuntu@lyfubuntu:~/my_comp(base) lyfubuntu@l(base) lyfubuntu@l(base) lyfubuntu@l(b(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
tomcat_ip_ping           latest    49e7365dc2c9   9 minutes ago   519MB
diytomcat                latest    531449811312   27 hours ago    827MB
luyanfeng123/diytomcat   1.0       531449811312   27 hours ago    827MB
entrypoint-test          latest    293b60111edb   47 hours ago    231MB
cmdtest                  latest    e507939f0998   47 hours ago    231MB
mycentos                 0.2       5f2260ba4d08   2 days ago      624MB
lyf/centos               1.0       967c603048b0   3 days ago      231MB
my_centos                0.1       d3a84994963f   4 days ago      559MB
my_tomcat                0.1       82bf5ce1034c   4 days ago      480MB
tomcat                   9.0       d4488b7f8c9b   5 days ago      475MB
tomcat                   latest    7a91e6f458bb   5 days ago      475MB
mysql                    5.7       daff57b7d2d1   2 weeks ago     430MB
nginx                    latest    2b7d6430f78d   2 weeks ago     142MB
centos                   7         eeb6ee3f44bd   11 months ago   204MB
centos                   latest    5d0da3dc9764   11 months ago   231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED              STATUS              PORTS                                         NAMES
0b4ad3916256   tomcat_ip_ping   "catalina.sh run"   About a minute ago   Up About a minute   0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED         STATUS                      PORTS                                         NAMES
0b4ad3916256   tomcat_ip_ping        "catalina.sh run"        2 minutes ago   Up 2 minutes                0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   27 hours ago    Exited (137) 25 hours ago                                                 luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               47 hours ago    Exited (0) 47 hours ago                                                   jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  47 hours ago    Exited (0) 47 hours ago                                                   eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  47 hours ago    Exited (0) 47 hours ago                                                   exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     47 hours ago    Created                                                                   wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  47 hours ago    Exited (0) 47 hours ago                                                   objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 days ago      Exited (0) 2 days ago                                                     stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   2 days ago      Exited (0) 2 days ago                                                     docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              3 days ago      Exited (0) 3 days ago                                                     admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   3 days ago      Exited (0) 3 days ago                                                     nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   3 days ago      Exited (0) 3 days ago                                                     nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   3 days ago      Exited (0) 3 days ago                                                     mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              4 days ago      Exited (0) 4 days ago                                                     stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        4 days ago      Exited (143) 4 days ago                                                   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        4 days ago      Exited (143) 4 days ago                                                   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   4 days ago      Exited (143) 4 days ago                                                   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        5 days ago      Exited (143) 4 days ago                                                   tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   5 days ago      Exited (0) 5 days ago                                                     nginx01
bf46371dea89   centos                "/bin/bash"              5 days ago      Exited (0) 4 days ago                                                     epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 查看容器内部的网络地址 ip addr
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # docker exec -it tomcat_ip_ping01 ip addr
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker exec -it tomcat_ip_ping01 ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
10: eth0@if11: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:ac:11:00:02 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 172.17.0.2/16 brd 172.17.255.255 scope global eth0
       valid_lft forever preferred_lft forever
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 发现容器启动的时候，docker 分配了一个 eth0@if11 ip 地址
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # linux 可以 ping 通 docker 容器内部！
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ ping 172.17.0.2
PING 172.17.0.2 (172.17.0.2) 56(84) bytes of data.
64 字节，来自 172.17.0.2: icmp_seq=1 ttl=64 时间=0.088 毫秒
64 字节，来自 172.17.0.2: icmp_seq=2 ttl=64 时间=0.052 毫秒
64 字节，来自 172.17.0.2: icmp_seq=3 ttl=64 时间=0.048 毫秒
64 字节，来自 172.17.0.2: icmp_seq=4 ttl=64 时间=0.049 毫秒
64 字节，来自 172.17.0.2: icmp_seq=5 ttl=64 时间=0.057 毫秒
64 字节，来自 172.17.0.2: icmp_seq=6 ttl=64 时间=0.050 毫秒
64 字节，来自 172.17.0.2: icmp_seq=7 ttl=64 时间=0.048 毫秒
64 字节，来自 172.17.0.2: icmp_seq=8 ttl=64 时间=0.047 毫秒
64 字节，来自 172.17.0.2: icmp_seq=9 ttl=64 时间=0.047 毫秒
^C
--- 172.17.0.2 ping 统计 ---
已发送 9 个包， 已接收 9 个包, 0% 包丢失, 耗时 8171 毫秒
rtt min/avg/max/mdev = 0.047/0.054/0.088/0.012 ms
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$
```

---

我们每启动一个 `docker` 容器，`docker` 就会给 `docker` 容器分配一个 `IP` 地址。我们只要安装了 `docker`，就会有一个 `docker0` 网卡，该网卡使用的技术是 `veth-pair` 技术！

再次运行 `ip addr` 。

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 每启动一个 docker 容器，docker 会分配给 docker 容器一个 ip 地址，我们只要安装了 docker，就会有一个网卡 docker0 桥接模式，使用的技术是 veth-pair 技术！
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 40:b0:34:3e:a2:10 brd ff:ff:ff:ff:ff:ff
    inet 10.4.3.151/21 brd 10.4.7.255 scope global dynamic noprefixroute enp1s0
       valid_lft 71771sec preferred_lft 71771sec
    inet6 fe80::39c7:dd87:8b0b:5357/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
3: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:be:ba:dd:40 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
    inet6 fe80::42:beff:feba:dd40/64 scope link 
       valid_lft forever preferred_lft forever
11: veth482e1ed@if10: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP group default 
    link/ether fa:ac:86:85:fe:5d brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet6 fe80::f8ac:86ff:fe85:fe5d/64 scope link 
       valid_lft forever preferred_lft forever
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$
```

---

再次启动一个容器，运行 `ip addr`，发现又多了一对网卡。

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 再启动一个容器，发现又多了一对网卡
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                                         NAMES
0b4ad3916256   tomcat_ip_ping   "catalina.sh run"   19 minutes ago   Up 19 minutes   0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker run -d -P --name tomcat_ip_ping02 tomcat_ip_ping
934ca1c9a8829821534c4accb389b73349091d57012778d390f9d703a5f948c9
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED          SIZE
tomcat_ip_ping           latest    49e7365dc2c9   27 minutes ago   519MB
diytomcat                latest    531449811312   27 hours ago     827MB
luyanfeng123/diytomcat   1.0       531449811312   27 hours ago     827MB
entrypoint-test          latest    293b60111edb   47 hours ago     231MB
cmdtest                  latest    e507939f0998   2 days ago       231MB
mycentos                 0.2       5f2260ba4d08   2 days ago       624MB
lyf/centos               1.0       967c603048b0   3 days ago       231MB
my_centos                0.1       d3a84994963f   4 days ago       559MB
my_tomcat                0.1       82bf5ce1034c   4 days ago       480MB
tomcat                   9.0       d4488b7f8c9b   5 days ago       475MB
tomcat                   latest    7a91e6f458bb   5 days ago       475MB
mysql                    5.7       daff57b7d2d1   2 weeks ago      430MB
nginx                    latest    2b7d6430f78d   2 weeks ago      142MB
centos                   7         eeb6ee3f44bd   11 months ago    204MB
centos                   latest    5d0da3dc9764   11 months ago    231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago      791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                                         NAMES
934ca1c9a882   tomcat_ip_ping   "catalina.sh run"   9 seconds ago    Up 7 seconds    0.0.0.0:49154->8080/tcp, :::49154->8080/tcp   tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping   "catalina.sh run"   20 minutes ago   Up 20 minutes   0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                      PORTS                                         NAMES
934ca1c9a882   tomcat_ip_ping        "catalina.sh run"        14 seconds ago   Up 12 seconds               0.0.0.0:49154->8080/tcp, :::49154->8080/tcp   tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping        "catalina.sh run"        20 minutes ago   Up 20 minutes               0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   27 hours ago     Exited (137) 25 hours ago                                                 luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               47 hours ago     Exited (0) 47 hours ago                                                   jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  47 hours ago     Exited (0) 47 hours ago                                                   eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  2 days ago       Exited (0) 2 days ago                                                     exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     2 days ago       Created                                                                   wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  2 days ago       Exited (0) 2 days ago                                                     objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 days ago       Exited (0) 2 days ago                                                     stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   2 days ago       Exited (0) 2 days ago                                                     docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              3 days ago       Exited (0) 3 days ago                                                     admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   3 days ago       Exited (0) 3 days ago                                                     nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   3 days ago       Exited (0) 3 days ago                                                     nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   3 days ago       Exited (0) 3 days ago                                                     mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              4 days ago       Exited (0) 4 days ago                                                     stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        4 days ago       Exited (143) 4 days ago                                                   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        4 days ago       Exited (143) 4 days ago                                                   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   4 days ago       Exited (143) 4 days ago                                                   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        5 days ago       Exited (143) 4 days ago                                                   tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   5 days ago       Exited (0) 5 days ago                                                     nginx01
bf46371dea89   centos                "/bin/bash"              5 days ago       Exited (0) 4 days ago                                                     epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 40:b0:34:3e:a2:10 brd ff:ff:ff:ff:ff:ff
    inet 10.4.3.151/21 brd 10.4.7.255 scope global dynamic noprefixroute enp1s0
       valid_lft 71575sec preferred_lft 71575sec
    inet6 fe80::39c7:dd87:8b0b:5357/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
3: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:be:ba:dd:40 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
    inet6 fe80::42:beff:feba:dd40/64 scope link 
       valid_lft forever preferred_lft forever
11: veth482e1ed@if10: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP group default 
    link/ether fa:ac:86:85:fe:5d brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet6 fe80::f8ac:86ff:fe85:fe5d/64 scope link 
       valid_lft forever preferred_lft forever
13: veth1faea59@if12: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP group default 
    link/ether d2:19:d1:23:69:3a brd ff:ff:ff:ff:ff:ff link-netnsid 1
    inet6 fe80::d019:d1ff:fe23:693a/64 scope link 
       valid_lft forever preferred_lft forever
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$
```

---

>我们发现容器的网卡，都是一对对的。
>
>`veth-pair` 是一对虚拟设备接口，都是成对出现的，一端连着协议，一端彼此相连。
>
>`veth-pair` 充当一个桥梁，连接着各种虚拟网络设备
>
>`OpenStac`、`Docker 容器之间的连接` 和 `OVS 的连接`，都是使用 `veth-pair` 技术。

`tomcat_ip_ping01` 和 `tomcat_ip_ping01` 之间可以 `ping` 通！

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 我们发现容器带来网卡，都是一对对的
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # veth-pair 是一对虚拟设备接口，一端连接协议，一端彼此相连(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 正因为有这个特性， veth-pair 充当一个桥梁，连接各种虚拟 网络设备
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # OpenStac, Docker 容器之间的连接，OVS 的连接，都是使用 veth-pair 技术
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                                         NAMES
934ca1c9a882   tomcat_ip_ping   "catalina.sh run"   8 minutes ago    Up 8 minutes    0.0.0.0:49154->8080/tcp, :::49154->8080/tcp   tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping   "catalina.sh run"   28 minutes ago   Up 28 minutes   0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 测试一下 tomcat_ip_ping01 和 tomcat_ip_ping02 之间是否可以 ping 通！
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker exec -it tomcat_ip_ping01 ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
10: eth0@if11: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:ac:11:00:02 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 172.17.0.2/16 brd 172.17.255.255 scope global eth0
       valid_lft forever preferred_lft forever
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker exec -it tomcat_ip_ping02 ping 172.17.0.2
PING 172.17.0.2 (172.17.0.2) 56(84) bytes of data.
64 bytes from 172.17.0.2: icmp_seq=1 ttl=64 time=0.109 ms
64 bytes from 172.17.0.2: icmp_seq=2 ttl=64 time=0.074 ms
64 bytes from 172.17.0.2: icmp_seq=3 ttl=64 time=0.061 ms
64 bytes from 172.17.0.2: icmp_seq=4 ttl=64 time=0.047 ms
64 bytes from 172.17.0.2: icmp_seq=5 ttl=64 time=0.060 ms
^C
--- 172.17.0.2 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4095ms
rtt min/avg/max/mdev = 0.047/0.070/0.109/0.021 ms
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$
```

---

`结论`: 容器与容器之间是可以相互 `ping` 通的！

**绘制一个网络模型图**

![](https://cos.luyf-lemon-love.space/images/20220908172232.png)

`结论`: `tomcat01` 和 `tomcat02` 共用一个路由器: `docker0`。

所有容器在`不指定网络`的情况下，都是使用 `docker0` 路由的。`docker` 会给我们的容器分配一个默认的可用 `IP` 地址。

---

`docker` 使用的是 `linux` 的桥接，`宿主机`有一个 `docker` 容器的网桥 `docker0`。

![](https://cos.luyf-lemon-love.space/images/20220908173128.png)

---

`docker` 中所有的网络接口都是`虚拟`的，虚拟的转化效率高！( 内网传递文件 )

只要容器删除，对应的网桥也被删除。

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 结论: 容器与容器之间是可以相互 ping 通的
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # tomcat_ip_ping01 和 tomcat_ip_ping02 是共用一个路由器，docker0
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 所有容器不指定网络的情况下，都是使用 docker0 的。
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # docker 使用的是 linux 桥接的，宿主机有一个 docker 容器的网桥 docker0
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # docker 中所有的网桥接口都是虚拟的，虚拟的转发效率高！
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
f28dbaf8eb28   bridge    bridge    local
d7654904ecb4   host      host      local
ea359b44df52   none      null      local
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker network inspect f28dbaf8eb28
[
    {
        "Name": "bridge",
        "Id": "f28dbaf8eb286ea84cce094a08aa3a7d8acafacb919361f43695d192b6fb3e17",
        "Created": "2022-09-08T11:29:55.472155874+08:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "0b4ad39162568878ce57127efd68f499d1ca2db758e1a10b75848ec733f5d068": {
                "Name": "tomcat_ip_ping01",
                "EndpointID": "28e2e10a29dad227604631495cf77dae04f9f1c37675d5d4f14a0f964c946ce8",
                "MacAddress": "02:42:ac:11:00:02",
                "IPv4Address": "172.17.0.2/16",
                "IPv6Address": ""
            },
            "934ca1c9a8829821534c4accb389b73349091d57012778d390f9d703a5f948c9": {
                "Name": "tomcat_ip_ping02",
                "EndpointID": "7d661a1908580932b6688e1099f87c868f3c2e44da69d35848ea113324ae4c0b",
                "MacAddress": "02:42:ac:11:00:03",
                "IPv4Address": "172.17.0.3/16",
                "IPv6Address": ""
            }
        },
        "Options": {
            "com.docker.network.bridge.default_bridge": "true",
            "com.docker.network.bridge.enable_icc": "true",
            "com.docker.network.bridge.enable_ip_masquerade": "true",
            "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
            "com.docker.network.bridge.name": "docker0",
            "com.docker.network.driver.mtu": "1500"
        },
        "Labels": {}
    }
]
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED             STATUS             PORTS                                         NAMES
934ca1c9a882   tomcat_ip_ping   "catalina.sh run"   59 minutes ago      Up 58 minutes      0.0.0.0:49154->8080/tcp, :::49154->8080/tcp   tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping   "catalina.sh run"   About an hour ago   Up About an hour   0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker rm -f tomcat_ip_ping02
tomcat_ip_ping02
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED             STATUS             PORTS                                         NAMES
0b4ad3916256   tomcat_ip_ping   "catalina.sh run"   About an hour ago   Up About an hour   0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED             STATUS                      PORTS                                         NAMES
0b4ad3916256   tomcat_ip_ping        "catalina.sh run"        About an hour ago   Up About an hour            0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   28 hours ago        Exited (137) 26 hours ago                                                 luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               2 days ago          Exited (0) 2 days ago                                                     jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  2 days ago          Exited (0) 2 days ago                                                     eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  2 days ago          Exited (0) 2 days ago                                                     exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     2 days ago          Created                                                                   wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  2 days ago          Exited (0) 2 days ago                                                     objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 days ago          Exited (0) 2 days ago                                                     stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   2 days ago          Exited (0) 2 days ago                                                     docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              3 days ago          Exited (0) 3 days ago                                                     admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   3 days ago          Exited (0) 3 days ago                                                     nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   3 days ago          Exited (0) 3 days ago                                                     nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   4 days ago          Exited (0) 3 days ago                                                     mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              4 days ago          Exited (0) 4 days ago                                                     stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        4 days ago          Exited (143) 4 days ago                                                   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        4 days ago          Exited (143) 4 days ago                                                   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   4 days ago          Exited (143) 4 days ago                                                   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        5 days ago          Exited (143) 5 days ago                                                   tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   5 days ago          Exited (0) 5 days ago                                                     nginx01
bf46371dea89   centos                "/bin/bash"              5 days ago          Exited (0) 4 days ago                                                     epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker network inspect f28dbaf8eb28
[
    {
        "Name": "bridge",
        "Id": "f28dbaf8eb286ea84cce094a08aa3a7d8acafacb919361f43695d192b6fb3e17",
        "Created": "2022-09-08T11:29:55.472155874+08:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "0b4ad39162568878ce57127efd68f499d1ca2db758e1a10b75848ec733f5d068": {
                "Name": "tomcat_ip_ping01",
                "EndpointID": "28e2e10a29dad227604631495cf77dae04f9f1c37675d5d4f14a0f964c946ce8",
                "MacAddress": "02:42:ac:11:00:02",
                "IPv4Address": "172.17.0.2/16",
                "IPv6Address": ""
            }
        },
        "Options": {
            "com.docker.network.bridge.default_bridge": "true",
            "com.docker.network.bridge.enable_icc": "true",
            "com.docker.network.bridge.enable_ip_masquerade": "true",
            "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
            "com.docker.network.bridge.name": "docker0",
            "com.docker.network.driver.mtu": "1500"
        },
        "Labels": {}
    }
]
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$
```

---

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 40:b0:34:3e:a2:10 brd ff:ff:ff:ff:ff:ff
    inet 10.4.3.151/21 brd 10.4.7.255 scope global dynamic noprefixroute enp1s0
       valid_lft 74583sec preferred_lft 74583sec
    inet6 fe80::39c7:dd87:8b0b:5357/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
    link/ether 02:42:be:ba:dd:40 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ # 1. lo: 127.0.0.1 -> 本地回环地址
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ # 2. enp1s0: 10.4.3.151 -> IP 地址
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ # 3. docker0: 172.17.0.1 -> docker0 地址
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ ####################
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ # 由于 docker hub 官网的基础镜像 tomcat 只包含简单的操作系统，相当于裸机状态，需要手动安装需要的命令。(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ ####################
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ # apt update
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ # apt install -y iproute2 -> ip addr
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ # apt install iputils-ping -> ping
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ ls
centos_docker  files      my_Dockerfile  nginx
diytomcat      my_centos  mysql          tomcat_ip_ping
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ # 创建 tomcat_ip_ping 目录
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker$ cd tomcat_ip_ping/
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ ls
Dockerfile
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 创建 新的 tomcat 镜像
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
diytomcat                latest    531449811312   27 hours ago    827MB
luyanfeng123/diytomcat   1.0       531449811312   27 hours ago    827MB
entrypoint-test          latest    293b60111edb   47 hours ago    231MB
cmdtest                  latest    e507939f0998   47 hours ago    231MB
mycentos                 0.2       5f2260ba4d08   2 days ago      624MB
lyf/centos               1.0       967c603048b0   3 days ago      231MB
my_centos                0.1       d3a84994963f   4 days ago      559MB
my_tomcat                0.1       82bf5ce1034c   4 days ago      480MB
tomcat                   9.0       d4488b7f8c9b   5 days ago      475MB
tomcat                   latest    7a91e6f458bb   5 days ago      475MB
mysql                    5.7       daff57b7d2d1   2 weeks ago     430MB
nginx                    latest    2b7d6430f78d   2 weeks ago     142MB
centos                   7         eeb6ee3f44bd   11 months ago   204MB
centos                   latest    5d0da3dc9764   11 months ago   231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                      PORTS     NAMES
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   26 hours ago   Exited (137) 24 hours ago             luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               47 hours ago   Exited (0) 47 hours ago               jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  47 hours ago   Exited (0) 47 hours ago               eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  47 hours ago   Exited (0) 47 hours ago               exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     47 hours ago   Created                               wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  47 hours ago   Exited (0) 47 hours ago               objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 days ago     Exited (0) 2 days ago                 stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   2 days ago     Exited (0) 2 days ago                 docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              3 days ago     Exited (0) 2 days ago                 admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   3 days ago     Exited (0) 3 days ago                 nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   3 days ago     Exited (0) 3 days ago                 nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   3 days ago     Exited (0) 3 days ago                 mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              4 days ago     Exited (0) 4 days ago                 stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        4 days ago     Exited (143) 4 days ago               my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        4 days ago     Exited (143) 4 days ago               tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   4 days ago     Exited (143) 4 days ago               elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        5 days ago     Exited (143) 4 days ago               tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   5 days ago     Exited (0) 5 days ago                 nginx01
bf46371dea89   centos                "/bin/bash"              5 days ago     Exited (0) 4 days ago                 epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ ls
Dockerfile
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ cat Dockerfile 
FROM tomcat
MAINTAINER LuYF-Lemon-love<luyanfeng_nlp@qq.com>

RUN apt update

# ip addr
RUN apt install -y iproute2

# ping
RUN apt install iputils-ping
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker build -t tomcat_ip_ping .
Sending build context to Docker daemon  2.048kB
Step 1/5 : FROM tomcat
 ---> 7a91e6f458bb
Step 2/5 : MAINTAINER LuYF-Lemon-love<luyanfeng_nlp@qq.com>
 ---> Running in d5071441a68e
Removing intermediate container d5071441a68e
 ---> 8035a6352267
Step 3/5 : RUN apt update
 ---> Running in 1db691317097

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Get:1 http://archive.ubuntu.com/ubuntu jammy InRelease [270 kB]
Get:2 http://security.ubuntu.com/ubuntu jammy-security InRelease [110 kB]
Get:3 http://archive.ubuntu.com/ubuntu jammy-updates InRelease [114 kB]
Get:4 http://security.ubuntu.com/ubuntu jammy-security/main amd64 Packages [369 kB]
Get:5 http://archive.ubuntu.com/ubuntu jammy-backports InRelease [99.8 kB]
Get:6 http://archive.ubuntu.com/ubuntu jammy/restricted amd64 Packages [164 kB]
Get:7 http://archive.ubuntu.com/ubuntu jammy/multiverse amd64 Packages [266 kB]
Get:8 http://archive.ubuntu.com/ubuntu jammy/universe amd64 Packages [17.5 MB]
Get:9 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 Packages [148 kB]
Get:10 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 Packages [4,644 B]
Get:11 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 Packages [353 kB]
Get:12 http://archive.ubuntu.com/ubuntu jammy/main amd64 Packages [1,792 kB]
Get:13 http://archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 Packages [394 kB]
Get:14 http://archive.ubuntu.com/ubuntu jammy-updates/universe amd64 Packages [319 kB]
Get:15 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages [686 kB]
Get:16 http://archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 Packages [7,791 B]
Get:17 http://archive.ubuntu.com/ubuntu jammy-backports/universe amd64 Packages [7,275 B]
Get:18 http://archive.ubuntu.com/ubuntu jammy-backports/main amd64 Packages [3,175 B]
Fetched 22.6 MB in 13s (1,769 kB/s)
Reading package lists...
Building dependency tree...
Reading state information...
All packages are up to date.
Removing intermediate container 1db691317097
 ---> 478f572a7767
Step 4/5 : RUN apt install -y iproute2
 ---> Running in 9d3dc01a3cd1

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  libatm1 libbpf0 libbsd0 libcap2-bin libelf1 libmd0 libmnl0 libpam-cap
  libxtables12
Suggested packages:
  iproute2-doc
The following NEW packages will be installed:
  iproute2 libatm1 libbpf0 libbsd0 libcap2-bin libelf1 libmd0 libmnl0
  libpam-cap libxtables12
0 upgraded, 10 newly installed, 0 to remove and 0 not upgraded.
Need to get 1,430 kB of archives.
After this operation, 4,151 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu jammy/main amd64 libelf1 amd64 0.186-1build1 [51.0 kB]
Get:2 http://archive.ubuntu.com/ubuntu jammy/main amd64 libbpf0 amd64 1:0.5.0-1 [140 kB]
Get:3 http://archive.ubuntu.com/ubuntu jammy/main amd64 libmd0 amd64 1.0.4-1build1 [23.0 kB]
Get:4 http://archive.ubuntu.com/ubuntu jammy/main amd64 libbsd0 amd64 0.11.5-1 [44.8 kB]
Get:5 http://archive.ubuntu.com/ubuntu jammy/main amd64 libmnl0 amd64 1.0.4-3build2 [13.2 kB]
Get:6 http://archive.ubuntu.com/ubuntu jammy/main amd64 libxtables12 amd64 1.8.7-1ubuntu5 [31.2 kB]
Get:7 http://archive.ubuntu.com/ubuntu jammy/main amd64 libcap2-bin amd64 1:2.44-1build3 [26.0 kB]
Get:8 http://archive.ubuntu.com/ubuntu jammy/main amd64 iproute2 amd64 5.15.0-1ubuntu2 [1,070 kB]
Get:9 http://archive.ubuntu.com/ubuntu jammy/main amd64 libatm1 amd64 1:2.5.1-4build2 [22.8 kB]
Get:10 http://archive.ubuntu.com/ubuntu jammy/main amd64 libpam-cap amd64 1:2.44-1build3 [7,932 B]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 1,430 kB in 3s (551 kB/s)
Selecting previously unselected package libelf1:amd64.
(Reading database ... 7926 files and directories currently installed.)
Preparing to unpack .../0-libelf1_0.186-1build1_amd64.deb ...
Unpacking libelf1:amd64 (0.186-1build1) ...
Selecting previously unselected package libbpf0:amd64.
Preparing to unpack .../1-libbpf0_1%3a0.5.0-1_amd64.deb ...
Unpacking libbpf0:amd64 (1:0.5.0-1) ...
Selecting previously unselected package libmd0:amd64.
Preparing to unpack .../2-libmd0_1.0.4-1build1_amd64.deb ...
Unpacking libmd0:amd64 (1.0.4-1build1) ...
Selecting previously unselected package libbsd0:amd64.
Preparing to unpack .../3-libbsd0_0.11.5-1_amd64.deb ...
Unpacking libbsd0:amd64 (0.11.5-1) ...
Selecting previously unselected package libmnl0:amd64.
Preparing to unpack .../4-libmnl0_1.0.4-3build2_amd64.deb ...
Unpacking libmnl0:amd64 (1.0.4-3build2) ...
Selecting previously unselected package libxtables12:amd64.
Preparing to unpack .../5-libxtables12_1.8.7-1ubuntu5_amd64.deb ...
Unpacking libxtables12:amd64 (1.8.7-1ubuntu5) ...
Selecting previously unselected package libcap2-bin.
Preparing to unpack .../6-libcap2-bin_1%3a2.44-1build3_amd64.deb ...
Unpacking libcap2-bin (1:2.44-1build3) ...
Selecting previously unselected package iproute2.
Preparing to unpack .../7-iproute2_5.15.0-1ubuntu2_amd64.deb ...
Unpacking iproute2 (5.15.0-1ubuntu2) ...
Selecting previously unselected package libatm1:amd64.
Preparing to unpack .../8-libatm1_1%3a2.5.1-4build2_amd64.deb ...
Unpacking libatm1:amd64 (1:2.5.1-4build2) ...
Selecting previously unselected package libpam-cap:amd64.
Preparing to unpack .../9-libpam-cap_1%3a2.44-1build3_amd64.deb ...
Unpacking libpam-cap:amd64 (1:2.44-1build3) ...
Setting up libatm1:amd64 (1:2.5.1-4build2) ...
Setting up libcap2-bin (1:2.44-1build3) ...
Setting up libmnl0:amd64 (1.0.4-3build2) ...
Setting up libxtables12:amd64 (1.8.7-1ubuntu5) ...
Setting up libmd0:amd64 (1.0.4-1build1) ...
Setting up libbsd0:amd64 (0.11.5-1) ...
Setting up libelf1:amd64 (0.186-1build1) ...
Setting up libpam-cap:amd64 (1:2.44-1build3) ...
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.34.0 /usr/local/share/perl/5.34.0 /usr/lib/x86_64-linux-gnu/perl5/5.34 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl-base /usr/lib/x86_64-linux-gnu/perl/5.34 /usr/share/perl/5.34 /usr/local/lib/site_perl) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
debconf: falling back to frontend: Teletype
Setting up libbpf0:amd64 (1:0.5.0-1) ...
Setting up iproute2 (5.15.0-1ubuntu2) ...
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.34.0 /usr/local/share/perl/5.34.0 /usr/lib/x86_64-linux-gnu/perl5/5.34 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl-base /usr/lib/x86_64-linux-gnu/perl/5.34 /usr/share/perl/5.34 /usr/local/lib/site_perl) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
debconf: falling back to frontend: Teletype
Processing triggers for libc-bin (2.35-0ubuntu3.1) ...
Removing intermediate container 9d3dc01a3cd1
 ---> c13ca967b2a4
Step 5/5 : RUN apt install iputils-ping
 ---> Running in b2f1f0b10862

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
The following NEW packages will be installed:
  iputils-ping
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 42.9 kB of archives.
After this operation, 116 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu jammy/main amd64 iputils-ping amd64 3:20211215-1 [42.9 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 42.9 kB in 1s (41.1 kB/s)
Selecting previously unselected package iputils-ping.
(Reading database ... 8170 files and directories currently installed.)
Preparing to unpack .../iputils-ping_3%3a20211215-1_amd64.deb ...
Unpacking iputils-ping (3:20211215-1) ...
Setting up iputils-ping (3:20211215-1) ...
Removing intermediate container b2f1f0b10862
 ---> 49e7365dc2c9
Successfully built 49e7365dc2c9
Successfully tagged tomcat_ip_ping:latest
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
tomcat_ip_ping           latest    49e7365dc2c9   7 seconds ago   519MB
diytomcat                latest    531449811312   27 hours ago    827MB
luyanfeng123/diytomcat   1.0       531449811312   27 hours ago    827MB
entrypoint-test          latest    293b60111edb   47 hours ago    231MB
cmdtest                  latest    e507939f0998   47 hours ago    231MB
mycentos                 0.2       5f2260ba4d08   2 days ago      624MB
lyf/centos               1.0       967c603048b0   3 days ago      231MB
my_centos                0.1       d3a84994963f   4 days ago      559MB
my_tomcat                0.1       82bf5ce1034c   4 days ago      480MB
tomcat                   9.0       d4488b7f8c9b   5 days ago      475MB
tomcat                   latest    7a91e6f458bb   5 days ago      475MB
mysql                    5.7       daff57b7d2d1   2 weeks ago     430MB
nginx                    latest    2b7d6430f78d   2 weeks ago     142MB
centos                   7         eeb6ee3f44bd   11 months ago   204MB
centos                   latest    5d0da3dc9764   11 months ago   231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                      PORTS     NAMES
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   26 hours ago   Exited (137) 24 hours ago             luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               47 hours ago   Exited (0) 47 hours ago               jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  47 hours ago   Exited (0) 47 hours ago               eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  47 hours ago   Exited (0) 47 hours ago               exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     47 hours ago   Created                               wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  47 hours ago   Exited (0) 47 hours ago               objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 days ago     Exited (0) 2 days ago                 stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   2 days ago     Exited (0) 2 days ago                 docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              3 days ago     Exited (0) 2 days ago                 admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   3 days ago     Exited (0) 3 days ago                 nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   3 days ago     Exited (0) 3 days ago                 nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   3 days ago     Exited (0) 3 days ago                 mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              4 days ago     Exited (0) 4 days ago                 stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        4 days ago     Exited (143) 4 days ago               my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        4 days ago     Exited (143) 4 days ago               tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   4 days ago     Exited (143) 4 days ago               elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        5 days ago     Exited (143) 4 days ago               tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   5 days ago     Exited (0) 5 days ago                 nginx01
bf46371dea89   centos                "/bin/bash"              5 days ago     Exited (0) 4 days ago                 epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ 
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ 
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_(base(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_pin
g$ ls
Dockerfile
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker run -d -P --name tomcat_ip_ping01 tomcat_ip_ping
0b4ad39162568878ce57127efd68f499d1ca2db758e1a10b75848ec733f5d068
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
tomcat_ip_ping           latest    49e7365dc2c9   8 minutes ago   519MB
diytomcat                latest    531449811312   27 hours ago    827MB
luyanfeng123/diytomcat   1.0       531449811312   27 hours ago    827MB
entrypoint-test          latest    293b60111edb   47 hours ago    231MB
cmdtest                  latest    e507939f0998   47 hours ago    231MB
mycentos                 0.2       5f2260ba4d08   2 days ago      624MB
lyf/centos               1.0       967c603048b0   3 days ago      231MB
my_centos                0.1       d3a84994963f   4 days ago      559MB
my_tomcat                0.1       82bf5ce1034c   4 days ago      480MB
tomcat                   9.0       d4488b7f8c9b   5 days ago      475MB
tomcat                   latest    7a91e6f458bb   5 days ago      475MB
mysql                    5.7       daff57b7d2d1   2 weeks ago     430MB
nginx                    latest    2b7d6430f78d   2 weeks ago     142MB
centos                   7         eeb6ee3f44bd   11 months ago   204MB
centos                   latest    5d0da3dc9764   11 months ago   231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED              STATUS              PORTS                                         NAMES
0b4ad3916256   tomcat_ip_ping   "catalina.sh run"   About a minute ago   Up About a minute   0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED              STATUS                      PORTS                                         NAMES
0b4ad3916256   tomcat_ip_ping        "catalina.sh run"        About a minute ago   Up About a minute           0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   26 hours ago         Exited (137) 25 hours ago                                                 luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               47 hours ago         Exited (0) 47 hours ago                                                   jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  47 hours ago         Exited (0) 47 hours ago                                                   eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  47 hours ago         Exited (0) 47 hours ago                                                   exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     47 hours ago         Created                                                                   wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  47 hours ago         Exited (0) 47 hours ago                                                   objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 days ago           Exited (0) 2 days ago                                                     stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   2 days ago           Exited (0) 2 days ago                                                     docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              3 days ago           Exited (0) 3 days ago                                                     admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   3 days ago           Exited (0) 3 days ago                                                     nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   3 days ago           Exited (0) 3 days ago                                                     nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   3 days ago           Exited (0) 3 days ago                                                     mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              4 days ago           Exited (0) 4 days ago                                                     stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        4 days ago           Exited (143) 4 days ago                                                   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        4 days ago           Exited (143) 4 days ago                                                   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   4 days ago           Exited (143) 4 days ago                                                   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        5 days ago           Exited (143) 4 days ago                                                   tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   5 days ago           Exited (0) 5 days ago                                                     nginx01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat(base(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_p(base) lyfubuntu@lyfubuntu(base) lyfubuntu@lyfubuntu:(base) lyfubuntu@lyfubuntu:(base) lyfubuntu@l(base) lyfubuntu@lyfubuntu:~/my_computer_language/dock(base) lyfubuntu@lyfubuntu:~/my_comp(base) lyfubuntu@l(base) lyfubuntu@l(base) lyfubuntu@l(base) lyfubuntu@l(base) lyfubuntu@lyfubuntu:~/my_comp(base) lyfubuntu@l(base) lyfubuntu@l(base) lyfubuntu@l(b(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
tomcat_ip_ping           latest    49e7365dc2c9   9 minutes ago   519MB
diytomcat                latest    531449811312   27 hours ago    827MB
luyanfeng123/diytomcat   1.0       531449811312   27 hours ago    827MB
entrypoint-test          latest    293b60111edb   47 hours ago    231MB
cmdtest                  latest    e507939f0998   47 hours ago    231MB
mycentos                 0.2       5f2260ba4d08   2 days ago      624MB
lyf/centos               1.0       967c603048b0   3 days ago      231MB
my_centos                0.1       d3a84994963f   4 days ago      559MB
my_tomcat                0.1       82bf5ce1034c   4 days ago      480MB
tomcat                   9.0       d4488b7f8c9b   5 days ago      475MB
tomcat                   latest    7a91e6f458bb   5 days ago      475MB
mysql                    5.7       daff57b7d2d1   2 weeks ago     430MB
nginx                    latest    2b7d6430f78d   2 weeks ago     142MB
centos                   7         eeb6ee3f44bd   11 months ago   204MB
centos                   latest    5d0da3dc9764   11 months ago   231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED              STATUS              PORTS                                         NAMES
0b4ad3916256   tomcat_ip_ping   "catalina.sh run"   About a minute ago   Up About a minute   0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED         STATUS                      PORTS                                         NAMES
0b4ad3916256   tomcat_ip_ping        "catalina.sh run"        2 minutes ago   Up 2 minutes                0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   27 hours ago    Exited (137) 25 hours ago                                                 luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               47 hours ago    Exited (0) 47 hours ago                                                   jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  47 hours ago    Exited (0) 47 hours ago                                                   eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  47 hours ago    Exited (0) 47 hours ago                                                   exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     47 hours ago    Created                                                                   wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  47 hours ago    Exited (0) 47 hours ago                                                   objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 days ago      Exited (0) 2 days ago                                                     stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   2 days ago      Exited (0) 2 days ago                                                     docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              3 days ago      Exited (0) 3 days ago                                                     admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   3 days ago      Exited (0) 3 days ago                                                     nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   3 days ago      Exited (0) 3 days ago                                                     nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   3 days ago      Exited (0) 3 days ago                                                     mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              4 days ago      Exited (0) 4 days ago                                                     stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        4 days ago      Exited (143) 4 days ago                                                   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        4 days ago      Exited (143) 4 days ago                                                   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   4 days ago      Exited (143) 4 days ago                                                   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        5 days ago      Exited (143) 4 days ago                                                   tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   5 days ago      Exited (0) 5 days ago                                                     nginx01
bf46371dea89   centos                "/bin/bash"              5 days ago      Exited (0) 4 days ago                                                     epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 查看容器内部的网络地址 ip addr
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # docker exec -it tomcat_ip_ping01 ip addr
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker exec -it tomcat_ip_ping01 ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
10: eth0@if11: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:ac:11:00:02 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 172.17.0.2/16 brd 172.17.255.255 scope global eth0
       valid_lft forever preferred_lft forever
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 发现容器启动的时候，docker 分配了一个 eth0@if11 ip 地址
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # linux 可以 ping 通 docker 容器内部！
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ ping 172.17.0.2
PING 172.17.0.2 (172.17.0.2) 56(84) bytes of data.
64 字节，来自 172.17.0.2: icmp_seq=1 ttl=64 时间=0.088 毫秒
64 字节，来自 172.17.0.2: icmp_seq=2 ttl=64 时间=0.052 毫秒
64 字节，来自 172.17.0.2: icmp_seq=3 ttl=64 时间=0.048 毫秒
64 字节，来自 172.17.0.2: icmp_seq=4 ttl=64 时间=0.049 毫秒
64 字节，来自 172.17.0.2: icmp_seq=5 ttl=64 时间=0.057 毫秒
64 字节，来自 172.17.0.2: icmp_seq=6 ttl=64 时间=0.050 毫秒
64 字节，来自 172.17.0.2: icmp_seq=7 ttl=64 时间=0.048 毫秒
64 字节，来自 172.17.0.2: icmp_seq=8 ttl=64 时间=0.047 毫秒
64 字节，来自 172.17.0.2: icmp_seq=9 ttl=64 时间=0.047 毫秒
^C
--- 172.17.0.2 ping 统计 ---
已发送 9 个包， 已接收 9 个包, 0% 包丢失, 耗时 8171 毫秒
rtt min/avg/max/mdev = 0.047/0.054/0.088/0.012 ms
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 每启动一个 docker 容器，docker 会分配给 docker 容器一个 ip 地址，我们只要安装了 docker，就会有一个网卡 docker0 桥接模式，使用的技术是 veth-pair 技术！
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 40:b0:34:3e:a2:10 brd ff:ff:ff:ff:ff:ff
    inet 10.4.3.151/21 brd 10.4.7.255 scope global dynamic noprefixroute enp1s0
       valid_lft 71771sec preferred_lft 71771sec
    inet6 fe80::39c7:dd87:8b0b:5357/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
3: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:be:ba:dd:40 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
    inet6 fe80::42:beff:feba:dd40/64 scope link 
       valid_lft forever preferred_lft forever
11: veth482e1ed@if10: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP group default 
    link/ether fa:ac:86:85:fe:5d brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet6 fe80::f8ac:86ff:fe85:fe5d/64 scope link 
       valid_lft forever preferred_lft forever
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 再启动一个容器，发现又多了一对网卡
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                                         NAMES
0b4ad3916256   tomcat_ip_ping   "catalina.sh run"   19 minutes ago   Up 19 minutes   0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker run -d -P --name tomcat_ip_ping02 tomcat_ip_ping
934ca1c9a8829821534c4accb389b73349091d57012778d390f9d703a5f948c9
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED          SIZE
tomcat_ip_ping           latest    49e7365dc2c9   27 minutes ago   519MB
diytomcat                latest    531449811312   27 hours ago     827MB
luyanfeng123/diytomcat   1.0       531449811312   27 hours ago     827MB
entrypoint-test          latest    293b60111edb   47 hours ago     231MB
cmdtest                  latest    e507939f0998   2 days ago       231MB
mycentos                 0.2       5f2260ba4d08   2 days ago       624MB
lyf/centos               1.0       967c603048b0   3 days ago       231MB
my_centos                0.1       d3a84994963f   4 days ago       559MB
my_tomcat                0.1       82bf5ce1034c   4 days ago       480MB
tomcat                   9.0       d4488b7f8c9b   5 days ago       475MB
tomcat                   latest    7a91e6f458bb   5 days ago       475MB
mysql                    5.7       daff57b7d2d1   2 weeks ago      430MB
nginx                    latest    2b7d6430f78d   2 weeks ago      142MB
centos                   7         eeb6ee3f44bd   11 months ago    204MB
centos                   latest    5d0da3dc9764   11 months ago    231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago      791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                                         NAMES
934ca1c9a882   tomcat_ip_ping   "catalina.sh run"   9 seconds ago    Up 7 seconds    0.0.0.0:49154->8080/tcp, :::49154->8080/tcp   tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping   "catalina.sh run"   20 minutes ago   Up 20 minutes   0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                      PORTS                                         NAMES
934ca1c9a882   tomcat_ip_ping        "catalina.sh run"        14 seconds ago   Up 12 seconds               0.0.0.0:49154->8080/tcp, :::49154->8080/tcp   tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping        "catalina.sh run"        20 minutes ago   Up 20 minutes               0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   27 hours ago     Exited (137) 25 hours ago                                                 luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               47 hours ago     Exited (0) 47 hours ago                                                   jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  47 hours ago     Exited (0) 47 hours ago                                                   eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  2 days ago       Exited (0) 2 days ago                                                     exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     2 days ago       Created                                                                   wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  2 days ago       Exited (0) 2 days ago                                                     objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 days ago       Exited (0) 2 days ago                                                     stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   2 days ago       Exited (0) 2 days ago                                                     docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              3 days ago       Exited (0) 3 days ago                                                     admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   3 days ago       Exited (0) 3 days ago                                                     nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   3 days ago       Exited (0) 3 days ago                                                     nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   3 days ago       Exited (0) 3 days ago                                                     mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              4 days ago       Exited (0) 4 days ago                                                     stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        4 days ago       Exited (143) 4 days ago                                                   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        4 days ago       Exited (143) 4 days ago                                                   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   4 days ago       Exited (143) 4 days ago                                                   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        5 days ago       Exited (143) 4 days ago                                                   tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   5 days ago       Exited (0) 5 days ago                                                     nginx01
bf46371dea89   centos                "/bin/bash"              5 days ago       Exited (0) 4 days ago                                                     epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 40:b0:34:3e:a2:10 brd ff:ff:ff:ff:ff:ff
    inet 10.4.3.151/21 brd 10.4.7.255 scope global dynamic noprefixroute enp1s0
       valid_lft 71575sec preferred_lft 71575sec
    inet6 fe80::39c7:dd87:8b0b:5357/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
3: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:be:ba:dd:40 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
    inet6 fe80::42:beff:feba:dd40/64 scope link 
       valid_lft forever preferred_lft forever
11: veth482e1ed@if10: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP group default 
    link/ether fa:ac:86:85:fe:5d brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet6 fe80::f8ac:86ff:fe85:fe5d/64 scope link 
       valid_lft forever preferred_lft forever
13: veth1faea59@if12: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP group default 
    link/ether d2:19:d1:23:69:3a brd ff:ff:ff:ff:ff:ff link-netnsid 1
    inet6 fe80::d019:d1ff:fe23:693a/64 scope link 
       valid_lft forever preferred_lft forever
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 我们发现容器带来网卡，都是一对对的
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # veth-pair 是一对虚拟设备接口，一端连接协议，一端彼此相连(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 正因为有这个特性， veth-pair 充当一个桥梁，连接各种虚拟 网络设备
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # OpenStac, Docker 容器之间的连接，OVS 的连接，都是使用 veth-pair 技术
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                                         NAMES
934ca1c9a882   tomcat_ip_ping   "catalina.sh run"   8 minutes ago    Up 8 minutes    0.0.0.0:49154->8080/tcp, :::49154->8080/tcp   tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping   "catalina.sh run"   28 minutes ago   Up 28 minutes   0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 测试一下 tomcat_ip_ping01 和 tomcat_ip_ping02 之间是否可以 ping 通！
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker exec -it tomcat_ip_ping01 ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
10: eth0@if11: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:ac:11:00:02 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 172.17.0.2/16 brd 172.17.255.255 scope global eth0
       valid_lft forever preferred_lft forever
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker exec -it tomcat_ip_ping02 ping 172.17.0.2
PING 172.17.0.2 (172.17.0.2) 56(84) bytes of data.
64 bytes from 172.17.0.2: icmp_seq=1 ttl=64 time=0.109 ms
64 bytes from 172.17.0.2: icmp_seq=2 ttl=64 time=0.074 ms
64 bytes from 172.17.0.2: icmp_seq=3 ttl=64 time=0.061 ms
64 bytes from 172.17.0.2: icmp_seq=4 ttl=64 time=0.047 ms
64 bytes from 172.17.0.2: icmp_seq=5 ttl=64 time=0.060 ms
^C
--- 172.17.0.2 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4095ms
rtt min/avg/max/mdev = 0.047/0.070/0.109/0.021 ms
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 结论: 容器与容器之间是可以相互 ping 通的
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # tomcat_ip_ping01 和 tomcat_ip_ping02 是共用一个路由器，docker0
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 所有容器不指定网络的情况下，都是使用 docker0 的。
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # docker 使用的是 linux 桥接的，宿主机有一个 docker 容器的网桥 docker0
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # docker 中所有的网桥接口都是虚拟的，虚拟的转发效率高！
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
f28dbaf8eb28   bridge    bridge    local
d7654904ecb4   host      host      local
ea359b44df52   none      null      local
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker network inspect f28dbaf8eb28
[
    {
        "Name": "bridge",
        "Id": "f28dbaf8eb286ea84cce094a08aa3a7d8acafacb919361f43695d192b6fb3e17",
        "Created": "2022-09-08T11:29:55.472155874+08:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "0b4ad39162568878ce57127efd68f499d1ca2db758e1a10b75848ec733f5d068": {
                "Name": "tomcat_ip_ping01",
                "EndpointID": "28e2e10a29dad227604631495cf77dae04f9f1c37675d5d4f14a0f964c946ce8",
                "MacAddress": "02:42:ac:11:00:02",
                "IPv4Address": "172.17.0.2/16",
                "IPv6Address": ""
            },
            "934ca1c9a8829821534c4accb389b73349091d57012778d390f9d703a5f948c9": {
                "Name": "tomcat_ip_ping02",
                "EndpointID": "7d661a1908580932b6688e1099f87c868f3c2e44da69d35848ea113324ae4c0b",
                "MacAddress": "02:42:ac:11:00:03",
                "IPv4Address": "172.17.0.3/16",
                "IPv6Address": ""
            }
        },
        "Options": {
            "com.docker.network.bridge.default_bridge": "true",
            "com.docker.network.bridge.enable_icc": "true",
            "com.docker.network.bridge.enable_ip_masquerade": "true",
            "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
            "com.docker.network.bridge.name": "docker0",
            "com.docker.network.driver.mtu": "1500"
        },
        "Labels": {}
    }
]
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED             STATUS             PORTS                                         NAMES
934ca1c9a882   tomcat_ip_ping   "catalina.sh run"   59 minutes ago      Up 58 minutes      0.0.0.0:49154->8080/tcp, :::49154->8080/tcp   tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping   "catalina.sh run"   About an hour ago   Up About an hour   0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker rm -f tomcat_ip_ping02
tomcat_ip_ping02
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED             STATUS             PORTS                                         NAMES
0b4ad3916256   tomcat_ip_ping   "catalina.sh run"   About an hour ago   Up About an hour   0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED             STATUS                      PORTS                                         NAMES
0b4ad3916256   tomcat_ip_ping        "catalina.sh run"        About an hour ago   Up About an hour            0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   28 hours ago        Exited (137) 26 hours ago                                                 luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               2 days ago          Exited (0) 2 days ago                                                     jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  2 days ago          Exited (0) 2 days ago                                                     eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  2 days ago          Exited (0) 2 days ago                                                     exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     2 days ago          Created                                                                   wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  2 days ago          Exited (0) 2 days ago                                                     objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 days ago          Exited (0) 2 days ago                                                     stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   2 days ago          Exited (0) 2 days ago                                                     docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              3 days ago          Exited (0) 3 days ago                                                     admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   3 days ago          Exited (0) 3 days ago                                                     nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   3 days ago          Exited (0) 3 days ago                                                     nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   4 days ago          Exited (0) 3 days ago                                                     mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              4 days ago          Exited (0) 4 days ago                                                     stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        4 days ago          Exited (143) 4 days ago                                                   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        4 days ago          Exited (143) 4 days ago                                                   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   4 days ago          Exited (143) 4 days ago                                                   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        5 days ago          Exited (143) 5 days ago                                                   tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   5 days ago          Exited (0) 5 days ago                                                     nginx01
bf46371dea89   centos                "/bin/bash"              5 days ago          Exited (0) 4 days ago                                                     epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker network inspect f28dbaf8eb28
[
    {
        "Name": "bridge",
        "Id": "f28dbaf8eb286ea84cce094a08aa3a7d8acafacb919361f43695d192b6fb3e17",
        "Created": "2022-09-08T11:29:55.472155874+08:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "0b4ad39162568878ce57127efd68f499d1ca2db758e1a10b75848ec733f5d068": {
                "Name": "tomcat_ip_ping01",
                "EndpointID": "28e2e10a29dad227604631495cf77dae04f9f1c37675d5d4f14a0f964c946ce8",
                "MacAddress": "02:42:ac:11:00:02",
                "IPv4Address": "172.17.0.2/16",
                "IPv6Address": ""
            }
        },
        "Options": {
            "com.docker.network.bridge.default_bridge": "true",
            "com.docker.network.bridge.enable_icc": "true",
            "com.docker.network.bridge.enable_ip_masquerade": "true",
            "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
            "com.docker.network.bridge.name": "docker0",
            "com.docker.network.driver.mtu": "1500"
        },
        "Labels": {}
    }
]
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED             SIZE
tomcat_ip_ping           latest    49e7365dc2c9   About an hour ago   519MB
diytomcat                latest    531449811312   28 hours ago        827MB
luyanfeng123/diytomcat   1.0       531449811312   28 hours ago        827MB
entrypoint-test          latest    293b60111edb   2 days ago          231MB
cmdtest                  latest    e507939f0998   2 days ago          231MB
mycentos                 0.2       5f2260ba4d08   2 days ago          624MB
lyf/centos               1.0       967c603048b0   3 days ago          231MB
my_centos                0.1       d3a84994963f   4 days ago          559MB
my_tomcat                0.1       82bf5ce1034c   4 days ago          480MB
tomcat                   9.0       d4488b7f8c9b   5 days ago          475MB
tomcat                   latest    7a91e6f458bb   5 days ago          475MB
mysql                    5.7       daff57b7d2d1   2 weeks ago         430MB
nginx                    latest    2b7d6430f78d   2 weeks ago         142MB
centos                   7         eeb6ee3f44bd   11 months ago       204MB
centos                   latest    5d0da3dc9764   11 months ago       231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago         791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED             STATUS             PORTS                                         NAMES
0b4ad3916256   tomcat_ip_ping   "catalina.sh run"   About an hour ago   Up About an hour   0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED             STATUS                      PORTS                                         NAMES
0b4ad3916256   tomcat_ip_ping        "catalina.sh run"        About an hour ago   Up About an hour            0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   28 hours ago        Exited (137) 26 hours ago                                                 luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               2 days ago          Exited (0) 2 days ago                                                     jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  2 days ago          Exited (0) 2 days ago                                                     eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  2 days ago          Exited (0) 2 days ago                                                     exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     2 days ago          Created                                                                   wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  2 days ago          Exited (0) 2 days ago                                                     objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 days ago          Exited (0) 2 days ago                                                     stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   2 days ago          Exited (0) 2 days ago                                                     docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              3 days ago          Exited (0) 3 days ago                                                     admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   3 days ago          Exited (0) 3 days ago                                                     nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   3 days ago          Exited (0) 3 days ago                                                     nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   4 days ago          Exited (0) 3 days ago                                                     mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              4 days ago          Exited (0) 4 days ago                                                     stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        4 days ago          Exited (143) 4 days ago                                                   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        4 days ago          Exited (143) 4 days ago                                                   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   4 days ago          Exited (143) 4 days ago                                                   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        5 days ago          Exited (143) 5 days ago                                                   tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   5 days ago          Exited (0) 5 days ago                                                     nginx01
bf46371dea89   centos                "/bin/bash"              5 days ago          Exited (0) 4 days ago                                                     epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$
```

### link

>`问题`: 有一个`微服务`，`database url = ip`；`ip` 更换了。我们希望可以按照`名字`进行访问容器。

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker exec -it tomcat_ip_ping02 ping tomcat_ip_ping01
ping: tomcat_ip_ping01: Name or service not known
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 如何解决呢？
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 通过 --link 可以解决网络连通问题
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker run -d -P --name tomcat_ip_ping03 --link tomcat_ip_ping02 tomcat_ip_ping
c921ea0a887ba99ed875b4b553f99fffbe19c6d4bc6e314259ad532a96341944
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED         STATUS         PORTS                                         NAMES
c921ea0a887b   tomcat_ip_ping   "catalina.sh run"   8 seconds ago   Up 6 seconds   0.0.0.0:49156->8080/tcp, :::49156->8080/tcp   tomcat_ip_ping03
027b83bd07b4   tomcat_ip_ping   "catalina.sh run"   5 minutes ago   Up 5 minutes   0.0.0.0:49155->8080/tcp, :::49155->8080/tcp   tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping   "catalina.sh run"   5 hours ago     Up 5 hours     0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker exec -it tomcat_ip_ping03 ping tomcat_ip_ping02
PING tomcat_ip_ping02 (172.17.0.3) 56(84) bytes of data.
64 bytes from tomcat_ip_ping02 (172.17.0.3): icmp_seq=1 ttl=64 time=0.103 ms
64 bytes from tomcat_ip_ping02 (172.17.0.3): icmp_seq=2 ttl=64 time=0.053 ms
64 bytes from tomcat_ip_ping02 (172.17.0.3): icmp_seq=3 ttl=64 time=0.061 ms
64 bytes from tomcat_ip_ping02 (172.17.0.3): icmp_seq=4 ttl=64 time=0.061 ms
64 bytes from tomcat_ip_ping02 (172.17.0.3): icmp_seq=5 ttl=64 time=0.053 ms
64 bytes from tomcat_ip_ping02 (172.17.0.3): icmp_seq=6 ttl=64 time=0.061 ms
64 bytes from tomcat_ip_ping02 (172.17.0.3): icmp_seq=7 ttl=64 time=0.047 ms
^C
--- tomcat_ip_ping02 ping statistics ---
7 packets transmitted, 7 received, 0% packet loss, time 6126ms
rtt min/avg/max/mdev = 0.047/0.062/0.103/0.017 ms
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 反向不可以 ping 通
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker exec -it tomcat_ip_ping02 ping tomcat_ip_ping03
ping: tomcat_ip_ping03: Name or service not known
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$
```

{% label inspect green %}

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
f28dbaf8eb28   bridge    bridge    local
d7654904ecb4   host      host      local
ea359b44df52   none      null      local
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker inspect f28dbaf8eb28
[
    {
        "Name": "bridge",
        "Id": "f28dbaf8eb286ea84cce094a08aa3a7d8acafacb919361f43695d192b6fb3e17",
        "Created": "2022-09-08T11:29:55.472155874+08:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "027b83bd07b4aed228d66ffe8baea0c6d11fc4756daeefdea9c92ea24dab7b2f": {
                "Name": "tomcat_ip_ping02",
                "EndpointID": "55c0b292c2899a835e5eae4b4aff8a76076c64cb957d4ff5cb3fc03ee105735b",
                "MacAddress": "02:42:ac:11:00:03",
                "IPv4Address": "172.17.0.3/16",
                "IPv6Address": ""
            },
            "0b4ad39162568878ce57127efd68f499d1ca2db758e1a10b75848ec733f5d068": {
                "Name": "tomcat_ip_ping01",
                "EndpointID": "28e2e10a29dad227604631495cf77dae04f9f1c37675d5d4f14a0f964c946ce8",
                "MacAddress": "02:42:ac:11:00:02",
                "IPv4Address": "172.17.0.2/16",
                "IPv6Address": ""
            },
            "c921ea0a887ba99ed875b4b553f99fffbe19c6d4bc6e314259ad532a96341944": {
                "Name": "tomcat_ip_ping03",
                "EndpointID": "5fe1a6055a1ee2cda21791fb5dae9d5a8df8760c872bbd4c653b7495aeccc9d1",
                "MacAddress": "02:42:ac:11:00:04",
                "IPv4Address": "172.17.0.4/16",
                "IPv6Address": ""
            }
        },
        "Options": {
            "com.docker.network.bridge.default_bridge": "true",
            "com.docker.network.bridge.enable_icc": "true",
            "com.docker.network.bridge.enable_ip_masquerade": "true",
            "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
            "com.docker.network.bridge.name": "docker0",
            "com.docker.network.driver.mtu": "1500"
        },
        "Labels": {}
    }
]
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$
```

---

`--link` -> `tomcat_ip_ping03` 本地配置了 `tomcat_ip_ping02` 。

```shell
$ docker exec -it tomcat_ip_ping03 cat /etc/hosts
127.0.0.1	localhost
::1	localhost ip6-localhost ip6-loopback
fe00::0	ip6-localnet
ff00::0	ip6-mcastprefix
ff02::1	ip6-allnodes
ff02::2	ip6-allrouters
172.17.0.3	tomcat_ip_ping02 027b83bd07b4
172.17.0.4	c921ea0a887b
```

`本质探究`: `--link` 在 `host` 配置中增加了一个 `172.17.0.3	tomcat_ip_ping02 027b83bd07b4`

`docker` 不建议使用 `--link` 。也不建议使用 `docker0`，因为 `docker0` 不支持容器名连接访问。建议使用`自定义网络`。

---

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
tomcat_ip_ping           latest    49e7365dc2c9   5 hours ago     519MB
diytomcat                latest    531449811312   32 hours ago    827MB
luyanfeng123/diytomcat   1.0       531449811312   32 hours ago    827MB
entrypoint-test          latest    293b60111edb   2 days ago      231MB
cmdtest                  latest    e507939f0998   2 days ago      231MB
mycentos                 0.2       5f2260ba4d08   2 days ago      624MB
lyf/centos               1.0       967c603048b0   3 days ago      231MB
my_centos                0.1       d3a84994963f   4 days ago      559MB
my_tomcat                0.1       82bf5ce1034c   4 days ago      480MB
tomcat                   9.0       d4488b7f8c9b   6 days ago      475MB
tomcat                   latest    7a91e6f458bb   6 days ago      475MB
mysql                    5.7       daff57b7d2d1   2 weeks ago     430MB
nginx                    latest    2b7d6430f78d   2 weeks ago     142MB
centos                   7         eeb6ee3f44bd   11 months ago   204MB
centos                   latest    5d0da3dc9764   11 months ago   231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED       STATUS       PORTS                                         NAMES
0b4ad3916256   tomcat_ip_ping   "catalina.sh run"   5 hours ago   Up 5 hours   0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                      PORTS                                         NAMES
0b4ad3916256   tomcat_ip_ping        "catalina.sh run"        5 hours ago    Up 5 hours                  0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   32 hours ago   Exited (137) 30 hours ago                                                 luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               2 days ago     Exited (0) 2 days ago                                                     jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  2 days ago     Exited (0) 2 days ago                                                     eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  2 days ago     Exited (0) 2 days ago                                                     exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     2 days ago     Created                                                                   wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  2 days ago     Exited (0) 2 days ago                                                     objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 days ago     Exited (0) 2 days ago                                                     stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   3 days ago     Exited (0) 3 days ago                                                     docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              3 days ago     Exited (0) 3 days ago                                                     admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   3 days ago     Exited (0) 3 days ago                                                     nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   3 days ago     Exited (0) 3 days ago                                                     nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   4 days ago     Exited (0) 3 days ago                                                     mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              4 days ago     Exited (0) 4 days ago                                                     stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        4 days ago     Exited (143) 4 days ago                                                   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        4 days ago     Exited (143) 4 days ago                                                   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   5 days ago     Exited (143) 5 days ago                                                   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        5 days ago     Exited (143) 5 days ago                                                   tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   5 days ago     Exited (0) 5 days ago                                                     nginx01
bf46371dea89   centos                "/bin/bash"              5 days ago     Exited (0) 4 days ago                                                     epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker run -d -P --name tomcat_ip_ping02 tomcat_ip_ping
027b83bd07b4aed228d66ffe8baea0c6d11fc4756daeefdea9c92ea24dab7b2f
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED         STATUS         PORTS                                         NAMES
027b83bd07b4   tomcat_ip_ping   "catalina.sh run"   9 seconds ago   Up 5 seconds   0.0.0.0:49155->8080/tcp, :::49155->8080/tcp   tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping   "catalina.sh run"   5 hours ago     Up 5 hours     0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                      PORTS                                         NAMES
027b83bd07b4   tomcat_ip_ping        "catalina.sh run"        14 seconds ago   Up 11 seconds               0.0.0.0:49155->8080/tcp, :::49155->8080/tcp   tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping        "catalina.sh run"        5 hours ago      Up 5 hours                  0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   32 hours ago     Exited (137) 30 hours ago                                                 luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               2 days ago       Exited (0) 2 days ago                                                     jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  2 days ago       Exited (0) 2 days ago                                                     eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  2 days ago       Exited (0) 2 days ago                                                     exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     2 days ago       Created                                                                   wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  2 days ago       Exited (0) 2 days ago                                                     objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 days ago       Exited (0) 2 days ago                                                     stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   3 days ago       Exited (0) 3 days ago                                                     docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              3 days ago       Exited (0) 3 days ago                                                     admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   3 days ago       Exited (0) 3 days ago                                                     nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   3 days ago       Exited (0) 3 days ago                                                     nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   4 days ago       Exited (0) 3 days ago                                                     mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              4 days ago       Exited (0) 4 days ago                                                     stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        4 days ago       Exited (143) 4 days ago                                                   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        4 days ago       Exited (143) 4 days ago                                                   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   5 days ago       Exited (143) 5 days ago                                                   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        5 days ago       Exited (143) 5 days ago                                                   tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   5 days ago       Exited (0) 5 days ago                                                     nginx01
bf46371dea89   centos                "/bin/bash"              5 days ago       Exited (0) 4 days ago                                                     epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker exec -it tomcat_ip_ping02 ping tomcat_ip_ping01
ping: tomcat_ip_ping01: Name or service not known
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 如何解决呢？
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 通过 --link 可以解决网络连通问题
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker run -d -P --name tomcat_ip_ping03 --link tomcat_ip_ping02 tomcat_ip_ping
c921ea0a887ba99ed875b4b553f99fffbe19c6d4bc6e314259ad532a96341944
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED         STATUS         PORTS                                         NAMES
c921ea0a887b   tomcat_ip_ping   "catalina.sh run"   8 seconds ago   Up 6 seconds   0.0.0.0:49156->8080/tcp, :::49156->8080/tcp   tomcat_ip_ping03
027b83bd07b4   tomcat_ip_ping   "catalina.sh run"   5 minutes ago   Up 5 minutes   0.0.0.0:49155->8080/tcp, :::49155->8080/tcp   tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping   "catalina.sh run"   5 hours ago     Up 5 hours     0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker exec -it tomcat_ip_ping03 ping tomcat_ip_ping02
PING tomcat_ip_ping02 (172.17.0.3) 56(84) bytes of data.
64 bytes from tomcat_ip_ping02 (172.17.0.3): icmp_seq=1 ttl=64 time=0.103 ms
64 bytes from tomcat_ip_ping02 (172.17.0.3): icmp_seq=2 ttl=64 time=0.053 ms
64 bytes from tomcat_ip_ping02 (172.17.0.3): icmp_seq=3 ttl=64 time=0.061 ms
64 bytes from tomcat_ip_ping02 (172.17.0.3): icmp_seq=4 ttl=64 time=0.061 ms
64 bytes from tomcat_ip_ping02 (172.17.0.3): icmp_seq=5 ttl=64 time=0.053 ms
64 bytes from tomcat_ip_ping02 (172.17.0.3): icmp_seq=6 ttl=64 time=0.061 ms
64 bytes from tomcat_ip_ping02 (172.17.0.3): icmp_seq=7 ttl=64 time=0.047 ms
^C
--- tomcat_ip_ping02 ping statistics ---
7 packets transmitted, 7 received, 0% packet loss, time 6126ms
rtt min/avg/max/mdev = 0.047/0.062/0.103/0.017 ms
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # 反向不可以 ping 通
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker exec -it tomcat_ip_ping02 ping tomcat_ip_ping03
ping: tomcat_ip_ping03: Name or service not known
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
f28dbaf8eb28   bridge    bridge    local
d7654904ecb4   host      host      local
ea359b44df52   none      null      local
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker inspect f28dbaf8eb28
[
    {
        "Name": "bridge",
        "Id": "f28dbaf8eb286ea84cce094a08aa3a7d8acafacb919361f43695d192b6fb3e17",
        "Created": "2022-09-08T11:29:55.472155874+08:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "027b83bd07b4aed228d66ffe8baea0c6d11fc4756daeefdea9c92ea24dab7b2f": {
                "Name": "tomcat_ip_ping02",
                "EndpointID": "55c0b292c2899a835e5eae4b4aff8a76076c64cb957d4ff5cb3fc03ee105735b",
                "MacAddress": "02:42:ac:11:00:03",
                "IPv4Address": "172.17.0.3/16",
                "IPv6Address": ""
            },
            "0b4ad39162568878ce57127efd68f499d1ca2db758e1a10b75848ec733f5d068": {
                "Name": "tomcat_ip_ping01",
                "EndpointID": "28e2e10a29dad227604631495cf77dae04f9f1c37675d5d4f14a0f964c946ce8",
                "MacAddress": "02:42:ac:11:00:02",
                "IPv4Address": "172.17.0.2/16",
                "IPv6Address": ""
            },
            "c921ea0a887ba99ed875b4b553f99fffbe19c6d4bc6e314259ad532a96341944": {
                "Name": "tomcat_ip_ping03",
                "EndpointID": "5fe1a6055a1ee2cda21791fb5dae9d5a8df8760c872bbd4c653b7495aeccc9d1",
                "MacAddress": "02:42:ac:11:00:04",
                "IPv4Address": "172.17.0.4/16",
                "IPv6Address": ""
            }
        },
        "Options": {
            "com.docker.network.bridge.default_bridge": "true",
            "com.docker.network.bridge.enable_icc": "true",
            "com.docker.network.bridge.enable_ip_masquerade": "true",
            "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
            "com.docker.network.bridge.name": "docker0",
            "com.docker.network.driver.mtu": "1500"
        },
        "Labels": {}
    }
]
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ # --link -> tomcat_ip_ping03 本地配置了 tomcat_ip_ping02
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker exec -it tomcat_ip_ping03 cat /etc/hosts
127.0.0.1	localhost
::1	localhost ip6-localhost ip6-loopback
fe00::0	ip6-localnet
ff00::0	ip6-mcastprefix
ff02::1	ip6-allnodes
ff02::2	ip6-allrouters
172.17.0.3	tomcat_ip_ping02 027b83bd07b4
172.17.0.4	c921ea0a887b
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
tomcat_ip_ping           latest    49e7365dc2c9   6 hours ago     519MB
diytomcat                latest    531449811312   32 hours ago    827MB
luyanfeng123/diytomcat   1.0       531449811312   32 hours ago    827MB
entrypoint-test          latest    293b60111edb   2 days ago      231MB
cmdtest                  latest    e507939f0998   2 days ago      231MB
mycentos                 0.2       5f2260ba4d08   2 days ago      624MB
lyf/centos               1.0       967c603048b0   3 days ago      231MB
my_centos                0.1       d3a84994963f   4 days ago      559MB
my_tomcat                0.1       82bf5ce1034c   4 days ago      480MB
tomcat                   9.0       d4488b7f8c9b   6 days ago      475MB
tomcat                   latest    7a91e6f458bb   6 days ago      475MB
mysql                    5.7       daff57b7d2d1   2 weeks ago     430MB
nginx                    latest    2b7d6430f78d   2 weeks ago     142MB
centos                   7         eeb6ee3f44bd   11 months ago   204MB
centos                   latest    5d0da3dc9764   11 months ago   231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                                         NAMES
c921ea0a887b   tomcat_ip_ping   "catalina.sh run"   8 minutes ago    Up 8 minutes    0.0.0.0:49156->8080/tcp, :::49156->8080/tcp   tomcat_ip_ping03
027b83bd07b4   tomcat_ip_ping   "catalina.sh run"   13 minutes ago   Up 13 minutes   0.0.0.0:49155->8080/tcp, :::49155->8080/tcp   tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping   "catalina.sh run"   5 hours ago      Up 5 hours      0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                      PORTS                                         NAMES
c921ea0a887b   tomcat_ip_ping        "catalina.sh run"        9 minutes ago    Up 9 minutes                0.0.0.0:49156->8080/tcp, :::49156->8080/tcp   tomcat_ip_ping03
027b83bd07b4   tomcat_ip_ping        "catalina.sh run"        14 minutes ago   Up 14 minutes               0.0.0.0:49155->8080/tcp, :::49155->8080/tcp   tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping        "catalina.sh run"        5 hours ago      Up 5 hours                  0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   32 hours ago     Exited (137) 30 hours ago                                                 luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               2 days ago       Exited (0) 2 days ago                                                     jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  2 days ago       Exited (0) 2 days ago                                                     eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  2 days ago       Exited (0) 2 days ago                                                     exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     2 days ago       Created                                                                   wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  2 days ago       Exited (0) 2 days ago                                                     objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 days ago       Exited (0) 2 days ago                                                     stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   3 days ago       Exited (0) 3 days ago                                                     docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              3 days ago       Exited (0) 3 days ago                                                     admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   3 days ago       Exited (0) 3 days ago                                                     nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   3 days ago       Exited (0) 3 days ago                                                     nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   4 days ago       Exited (0) 3 days ago                                                     mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              4 days ago       Exited (0) 4 days ago                                                     stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        4 days ago       Exited (143) 4 days ago                                                   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        4 days ago       Exited (143) 4 days ago                                                   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   5 days ago       Exited (143) 5 days ago                                                   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        5 days ago       Exited (143) 5 days ago                                                   tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   5 days ago       Exited (0) 5 days ago                                                     nginx01
bf46371dea89   centos                "/bin/bash"              5 days ago       Exited (0) 4 days ago                                                     epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$
```

---

```shell
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
tomcat_ip_ping           latest    49e7365dc2c9   8 hours ago     519MB
diytomcat                latest    531449811312   34 hours ago    827MB
luyanfeng123/diytomcat   1.0       531449811312   34 hours ago    827MB
entrypoint-test          latest    293b60111edb   2 days ago      231MB
cmdtest                  latest    e507939f0998   2 days ago      231MB
mycentos                 0.2       5f2260ba4d08   2 days ago      624MB
lyf/centos               1.0       967c603048b0   3 days ago      231MB
my_centos                0.1       d3a84994963f   4 days ago      559MB
my_tomcat                0.1       82bf5ce1034c   5 days ago      480MB
tomcat                   9.0       d4488b7f8c9b   6 days ago      475MB
tomcat                   latest    7a91e6f458bb   6 days ago      475MB
mysql                    5.7       daff57b7d2d1   2 weeks ago     430MB
nginx                    latest    2b7d6430f78d   2 weeks ago     142MB
centos                   7         eeb6ee3f44bd   11 months ago   204MB
centos                   latest    5d0da3dc9764   11 months ago   231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED       STATUS       PORTS                                         NAMES
c921ea0a887b   tomcat_ip_ping   "catalina.sh run"   2 hours ago   Up 2 hours   0.0.0.0:49156->8080/tcp, :::49156->8080/tcp   tomcat_ip_ping03
027b83bd07b4   tomcat_ip_ping   "catalina.sh run"   2 hours ago   Up 2 hours   0.0.0.0:49155->8080/tcp, :::49155->8080/tcp   tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping   "catalina.sh run"   7 hours ago   Up 7 hours   0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                      PORTS                                         NAMES
c921ea0a887b   tomcat_ip_ping        "catalina.sh run"        2 hours ago    Up 2 hours                  0.0.0.0:49156->8080/tcp, :::49156->8080/tcp   tomcat_ip_ping03
027b83bd07b4   tomcat_ip_ping        "catalina.sh run"        2 hours ago    Up 2 hours                  0.0.0.0:49155->8080/tcp, :::49155->8080/tcp   tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping        "catalina.sh run"        7 hours ago    Up 7 hours                  0.0.0.0:49153->8080/tcp, :::49153->8080/tcp   tomcat_ip_ping01
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   34 hours ago   Exited (137) 32 hours ago                                                 luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               2 days ago     Exited (0) 2 days ago                                                     jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  2 days ago     Exited (0) 2 days ago                                                     eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  2 days ago     Exited (0) 2 days ago                                                     exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     2 days ago     Created                                                                   wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  2 days ago     Exited (0) 2 days ago                                                     objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 days ago     Exited (0) 2 days ago                                                     stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   3 days ago     Exited (0) 3 days ago                                                     docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              3 days ago     Exited (0) 3 days ago                                                     admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   4 days ago     Exited (0) 4 days ago                                                     nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   4 days ago     Exited (0) 4 days ago                                                     nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   4 days ago     Exited (0) 4 days ago                                                     mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              4 days ago     Exited (0) 4 days ago                                                     stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        5 days ago     Exited (143) 4 days ago                                                   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        5 days ago     Exited (143) 5 days ago                                                   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   5 days ago     Exited (143) 5 days ago                                                   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        5 days ago     Exited (143) 5 days ago                                                   tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   5 days ago     Exited (0) 5 days ago                                                     nginx01
bf46371dea89   centos                "/bin/bash"              5 days ago     Exited (0) 4 days ago                                                     epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker stop c921ea0a887b 027b83bd07b4 0b4ad3916256
c921ea0a887b
027b83bd07b4
0b4ad3916256
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
tomcat_ip_ping           latest    49e7365dc2c9   8 hours ago     519MB
diytomcat                latest    531449811312   34 hours ago    827MB
luyanfeng123/diytomcat   1.0       531449811312   34 hours ago    827MB
entrypoint-test          latest    293b60111edb   2 days ago      231MB
cmdtest                  latest    e507939f0998   2 days ago      231MB
mycentos                 0.2       5f2260ba4d08   2 days ago      624MB
lyf/centos               1.0       967c603048b0   3 days ago      231MB
my_centos                0.1       d3a84994963f   4 days ago      559MB
my_tomcat                0.1       82bf5ce1034c   5 days ago      480MB
tomcat                   9.0       d4488b7f8c9b   6 days ago      475MB
tomcat                   latest    7a91e6f458bb   6 days ago      475MB
mysql                    5.7       daff57b7d2d1   2 weeks ago     430MB
nginx                    latest    2b7d6430f78d   2 weeks ago     142MB
centos                   7         eeb6ee3f44bd   11 months ago   204MB
centos                   latest    5d0da3dc9764   11 months ago   231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                        PORTS     NAMES
c921ea0a887b   tomcat_ip_ping        "catalina.sh run"        2 hours ago    Exited (143) 27 seconds ago             tomcat_ip_ping03
027b83bd07b4   tomcat_ip_ping        "catalina.sh run"        2 hours ago    Exited (143) 27 seconds ago             tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping        "catalina.sh run"        8 hours ago    Exited (143) 27 seconds ago             tomcat_ip_ping01
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   34 hours ago   Exited (137) 32 hours ago               luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               2 days ago     Exited (0) 2 days ago                   jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  2 days ago     Exited (0) 2 days ago                   eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  2 days ago     Exited (0) 2 days ago                   exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     2 days ago     Created                                 wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  2 days ago     Exited (0) 2 days ago                   objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   2 days ago     Exited (0) 2 days ago                   stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   3 days ago     Exited (0) 3 days ago                   docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              3 days ago     Exited (0) 3 days ago                   admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   4 days ago     Exited (0) 4 days ago                   nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   4 days ago     Exited (0) 4 days ago                   nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   4 days ago     Exited (0) 4 days ago                   mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              4 days ago     Exited (0) 4 days ago                   stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        5 days ago     Exited (143) 4 days ago                 my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        5 days ago     Exited (143) 5 days ago                 tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   5 days ago     Exited (143) 5 days ago                 elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        5 days ago     Exited (143) 5 days ago                 tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   5 days ago     Exited (0) 5 days ago                   nginx01
bf46371dea89   centos                "/bin/bash"              5 days ago     Exited (0) 4 days ago                   epic_solomon
(base) lyfubuntu@lyfubuntu:~/my_computer_language/docker/tomcat_ip_ping$
```

### 自定义网络

**查看所有 `docker` 网络**

```shell
$ # 产看所有 docker 网络
$ docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
97d8bd3a09c6   bridge    bridge    local
d7654904ecb4   host      host      local
ea359b44df52   none      null      local
```

**网络模式**

- `bridge`: 桥接模式，`docker` 默认使用`桥接模式`，自己创建的网络也是使用 `bridge` 模式。

- `none`: 不配置网络。

- `host`: 和宿主机共享网络。

- `container`: 容器网络连通！（ 用的少，局限很大 ）

`测试`

---

```shell
(base) lyfubuntu@lyfubuntu:~$ # 网络模式
(base) lyfubuntu@lyfubuntu:~$ # bridge: 桥接模式，docker 默认使用桥接模 式，自己创建的网络也是使用 bridge 模式
(base) lyfubuntu@lyfubuntu:~$ # none: 不配置网络
(base) lyfubuntu@lyfubuntu:~$ # host: 和宿主机共享网络
(base) lyfubuntu@lyfubuntu:~$ # container: 容器网络连通！（用的少，局限 很大）
(base) lyfubuntu@lyfubuntu:~$ # 直接启动镜像的命令默认有一个 --net bridge 参数，这个就是 docker0
(base) lyfubuntu@lyfubuntu:~$ docker run -d -P --name tomcat_net01(base(base) lyfubuntu@lyfubuntu:~$ docker run -d -P --name tomcat_net01 tomcat_ip_ping
239795cbc8a40c4742eef268e30497cbf5ffd9c8ca32aec16778b4970cab7714
(base) lyfubuntu@lyfubuntu:~$ docker run -d -P --name tomcat_net02 tomcat_ip_ping
c14bfab1fc0fa60002ba5daa01f2edcaa31042b13d01e9a0db1bf012ce0842d8
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
tomcat_ip_ping           latest    49e7365dc2c9   25 hours ago    519MB
diytomcat                latest    531449811312   2 days ago      827MB
luyanfeng123/diytomcat   1.0       531449811312   2 days ago      827MB
entrypoint-test          latest    293b60111edb   3 days ago      231MB
cmdtest                  latest    e507939f0998   3 days ago      231MB
mycentos                 0.2       5f2260ba4d08   3 days ago      624MB
lyf/centos               1.0       967c603048b0   4 days ago      231MB
my_centos                0.1       d3a84994963f   5 days ago      559MB
my_tomcat                0.1       82bf5ce1034c   5 days ago      480MB
tomcat                   9.0       d4488b7f8c9b   6 days ago      475MB
tomcat                   latest    7a91e6f458bb   6 days ago      475MB
mysql                    5.7       daff57b7d2d1   2 weeks ago     430MB
nginx                    latest    2b7d6430f78d   2 weeks ago     142MB
centos                   7         eeb6ee3f44bd   11 months ago   204MB
centos                   latest    5d0da3dc9764   11 months ago   231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                                         NAMES
c14bfab1fc0f   tomcat_ip_ping   "catalina.sh run"   18 seconds ago   Up 16 seconds   0.0.0.0:49156->8080/tcp, :::49156->8080/tcp   tomcat_net02
239795cbc8a4   tomcat_ip_ping   "catalina.sh run"   48 seconds ago   Up 45 seconds   0.0.0.0:49155->8080/tcp, :::49155->8080/tcp   tomcat_net01
(base) lyfubuntu@lyfubuntu:~$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                      PORTS                                         NAMES
c14bfab1fc0f   tomcat_ip_ping        "catalina.sh run"        21 seconds ago   Up 20 seconds               0.0.0.0:49156->8080/tcp, :::49156->8080/tcp   tomcat_net02
239795cbc8a4   tomcat_ip_ping        "catalina.sh run"        51 seconds ago   Up 49 seconds               0.0.0.0:49155->8080/tcp, :::49155->8080/tcp   tomcat_net01
c921ea0a887b   tomcat_ip_ping        "catalina.sh run"        19 hours ago     Exited (143) 17 hours ago                                                 tomcat_ip_ping03
027b83bd07b4   tomcat_ip_ping        "catalina.sh run"        19 hours ago     Exited (143) 17 hours ago                                                 tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping        "catalina.sh run"        25 hours ago     Exited (143) 17 hours ago                                                 tomcat_ip_ping01
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   2 days ago       Exited (137) 2 days ago                                                   luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               2 days ago       Exited (0) 2 days ago                                                     jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  2 days ago       Exited (0) 2 days ago                                                     eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  3 days ago       Exited (0) 3 days ago                                                     exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     3 days ago       Created                                                                   wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  3 days ago       Exited (0) 3 days ago                                                     objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   3 days ago       Exited (0) 3 days ago                                                     stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   3 days ago       Exited (0) 3 days ago                                                     docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              4 days ago       Exited (0) 4 days ago                                                     admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   4 days ago       Exited (0) 4 days ago                                                     nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   4 days ago       Exited (0) 4 days ago                                                     nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   4 days ago       Exited (0) 4 days ago                                                     mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              5 days ago       Exited (0) 5 days ago                                                     stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        5 days ago       Exited (143) 5 days ago                                                   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        5 days ago       Exited (143) 5 days ago                                                   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   5 days ago       Exited (143) 5 days ago                                                   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        6 days ago       Exited (143) 5 days ago                                                   tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   6 days ago       Exited (0) 6 days ago                                                     nginx01
bf46371dea89   centos                "/bin/bash"              6 days ago       Exited (0) 5 days ago                                                     epic_solomon
(base) lyfubuntu@lyfubuntu:~$ docker network inspect bridge 
[
    {
        "Name": "bridge",
        "Id": "97d8bd3a09c68632f36a4cd367384a2fabb398bf8f8c4680a6ebaf6192ed9a3c",
        "Created": "2022-09-09T15:09:52.087458644+08:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "239795cbc8a40c4742eef268e30497cbf5ffd9c8ca32aec16778b4970cab7714": {
                "Name": "tomcat_net01",
                "EndpointID": "d118f4354b82ee8ad48632d5c076e58e316d5d23b28d0ea51623205988465490",
                "MacAddress": "02:42:ac:11:00:02",
                "IPv4Address": "172.17.0.2/16",
                "IPv6Address": ""
            },
            "c14bfab1fc0fa60002ba5daa01f2edcaa31042b13d01e9a0db1bf012ce0842d8": {
                "Name": "tomcat_net02",
                "EndpointID": "26f64b6509ce8a290c9d6de3d90dab28fea3f3715ca5758a7934ebe01d71d88c",
                "MacAddress": "02:42:ac:11:00:03",
                "IPv4Address": "172.17.0.3/16",
                "IPv6Address": ""
            }
        },
        "Options": {
            "com.docker.network.bridge.default_bridge": "true",
            "com.docker.network.bridge.enable_icc": "true",
            "com.docker.network.bridge.enable_ip_masquerade": "true",
            "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
            "com.docker.network.bridge.name": "docker0",
            "com.docker.network.driver.mtu": "1500"
        },
        "Labels": {}
    }
]
(base) lyfubuntu@lyfubuntu:~$ docker network --help

Usage:  docker network COMMAND

Manage networks

Commands:
  connect     Connect a container to a network
  create      Create a network
  disconnect  Disconnect a container from a network
  inspect     Display detailed information on one or more networks
  ls          List networks
  prune       Remove all unused networks
  rm          Remove one or more networks

Run 'docker network COMMAND --help' for more information on a command.
(base) lyfubuntu@lyfubuntu:~$ docker exec -it tomcat_net01 ping 172.17.0.3
PING 172.17.0.3 (172.17.0.3) 56(84) bytes of data.
64 bytes from 172.17.0.3: icmp_seq=1 ttl=64 time=0.132 ms
64 bytes from 172.17.0.3: icmp_seq=2 ttl=64 time=0.074 ms
64 bytes from 172.17.0.3: icmp_seq=3 ttl=64 time=0.047 ms
64 bytes from 172.17.0.3: icmp_seq=4 ttl=64 time=0.053 ms
64 bytes from 172.17.0.3: icmp_seq=5 ttl=64 time=0.062 ms
^C
--- 172.17.0.3 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4103ms
rtt min/avg/max/mdev = 0.047/0.073/0.132/0.030 ms
(base) lyfubuntu@lyfubuntu:~$ docker exec -it tomcat_net01 ping tomcat_net02
ping: tomcat_net02: Name or service not known
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
tomcat_ip_ping           latest    49e7365dc2c9   25 hours ago    519MB
diytomcat                latest    531449811312   2 days ago      827MB
luyanfeng123/diytomcat   1.0       531449811312   2 days ago      827MB
entrypoint-test          latest    293b60111edb   3 days ago      231MB
cmdtest                  latest    e507939f0998   3 days ago      231MB
mycentos                 0.2       5f2260ba4d08   3 days ago      624MB
lyf/centos               1.0       967c603048b0   4 days ago      231MB
my_centos                0.1       d3a84994963f   5 days ago      559MB
my_tomcat                0.1       82bf5ce1034c   5 days ago      480MB
tomcat                   9.0       d4488b7f8c9b   6 days ago      475MB
tomcat                   latest    7a91e6f458bb   6 days ago      475MB
mysql                    5.7       daff57b7d2d1   2 weeks ago     430MB
nginx                    latest    2b7d6430f78d   2 weeks ago     142MB
centos                   7         eeb6ee3f44bd   11 months ago   204MB
centos                   latest    5d0da3dc9764   11 months ago   231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED         STATUS         PORTS                                         NAMES
c14bfab1fc0f   tomcat_ip_ping   "catalina.sh run"   3 minutes ago   Up 3 minutes   0.0.0.0:49156->8080/tcp, :::49156->8080/tcp   tomcat_net02
239795cbc8a4   tomcat_ip_ping   "catalina.sh run"   4 minutes ago   Up 4 minutes   0.0.0.0:49155->8080/tcp, :::49155->8080/tcp   tomcat_net01
(base) lyfubuntu@lyfubuntu:~$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED         STATUS                      PORTS                                         NAMES
c14bfab1fc0f   tomcat_ip_ping        "catalina.sh run"        3 minutes ago   Up 3 minutes                0.0.0.0:49156->8080/tcp, :::49156->8080/tcp   tomcat_net02
239795cbc8a4   tomcat_ip_ping        "catalina.sh run"        4 minutes ago   Up 4 minutes                0.0.0.0:49155->8080/tcp, :::49155->8080/tcp   tomcat_net01
c921ea0a887b   tomcat_ip_ping        "catalina.sh run"        19 hours ago    Exited (143) 17 hours ago                                                 tomcat_ip_ping03
027b83bd07b4   tomcat_ip_ping        "catalina.sh run"        19 hours ago    Exited (143) 17 hours ago                                                 tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping        "catalina.sh run"        25 hours ago    Exited (143) 17 hours ago                                                 tomcat_ip_ping01
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   2 days ago      Exited (137) 2 days ago                                                   luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               2 days ago      Exited (0) 2 days ago                                                     jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  2 days ago      Exited (0) 2 days ago                                                     eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  3 days ago      Exited (0) 3 days ago                                                     exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     3 days ago      Created                                                                   wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  3 days ago      Exited (0) 3 days ago                                                     objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   3 days ago      Exited (0) 3 days ago                                                     stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   3 days ago      Exited (0) 3 days ago                                                     docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              4 days ago      Exited (0) 4 days ago                                                     admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   4 days ago      Exited (0) 4 days ago                                                     nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   4 days ago      Exited (0) 4 days ago                                                     nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   4 days ago      Exited (0) 4 days ago                                                     mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              5 days ago      Exited (0) 5 days ago                                                     stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        5 days ago      Exited (143) 5 days ago                                                   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        5 days ago      Exited (143) 5 days ago                                                   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   5 days ago      Exited (143) 5 days ago                                                   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        6 days ago      Exited (143) 5 days ago                                                   tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   6 days ago      Exited (0) 6 days ago                                                     nginx01
bf46371dea89   centos                "/bin/bash"              6 days ago      Exited (0) 5 days ago                                                     epic_solomon
(base) lyfubuntu@lyfubuntu:~$ # docker0 特点：默认，容器名不能访问， --link 可以打通连接！
(base) lyfubuntu@lyfubuntu:~$ # 自定义一个网络
(base) lyfubuntu@lyfubuntu:~$ # --driver bridge
(base) lyfubuntu@lyfubuntu:~$ # --subnet 192.168.0.0/16 支持 255 * 255 个网络，192.168.0.2 ~ 192.168.255.254
(base) lyfubuntu@lyfubuntu:~$ # --gateway 192.168.0.1
(base) lyfubuntu@lyfubuntu:~$ docker network create --help

Usage:  docker network create [OPTIONS] NETWORK

Create a network

Options:
      --attachable           Enable manual container attachment
      --aux-address map      Auxiliary IPv4 or IPv6
                             addresses used by Network
                             driver (default map[])
      --config-from string   The network from which to copy
                             the configuration
      --config-only          Create a configuration only network
  -d, --driver string        Driver to manage the Network
                             (default "bridge")
      --gateway strings      IPv4 or IPv6 Gateway for the
                             master subnet
      --ingress              Create swarm routing-mesh network
      --internal             Restrict external access to
                             the network
      --ip-range strings     Allocate container ip from a
                             sub-range
      --ipam-driver string   IP Address Management Driver
                             (default "default")
      --ipam-opt map         Set IPAM driver specific
                             options (default map[])
      --ipv6                 Enable IPv6 networking
      --label list           Set metadata on a network
  -o, --opt map              Set driver specific options
                             (default map[])
      --scope string         Control the network's scope
      --subnet strings       Subnet in CIDR format that
                             represents a network segment
(base) lyfubuntu@lyfubuntu:~$ docker network create --driver bridge --subnet 192.168.0.0/16 --gateway 192.168.0.1 mynet
3a1f3caf97a6e635a0c31227b7a19b6b100f990591ea68e8b463de18da619b6e
(base) lyfubuntu@lyfubuntu:~$ docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
97d8bd3a09c6   bridge    bridge    local
d7654904ecb4   host      host      local
3a1f3caf97a6   mynet     bridge    local
ea359b44df52   none      null      local
(base) lyfubuntu@lyfubuntu:~$ docker network inspect mynet 
[
    {
        "Name": "mynet",
        "Id": "3a1f3caf97a6e635a0c31227b7a19b6b100f990591ea68e8b463de18da619b6e",
        "Created": "2022-09-09T16:02:33.067386187+08:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "192.168.0.0/16",
                    "Gateway": "192.168.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {},
        "Options": {},
        "Labels": {}
(base) lyfubuntu@lyfubuntu:~$
```

---

在自己`创建的网络`里面启动两个容器。

```shell
(base) lyfubuntu@lyfubuntu:~$ docker run -d -P --name tomcat-net-01 --net mynet tomcat_ip_ping
27a5e5c233d63273d87f209f6e6b70a21179abfeb29488842be40cef5e05164f
(base) lyfubuntu@lyfubuntu:~$ docker run -d -P --name tomcat-net-02 --net mynet tomcat_ip_ping
756c9c351b2e2081ac7445c9f6c9cd1bd683dce64d497471a4662fc4dc17b04a
(base) lyfubuntu@lyfubuntu:~$ docker network inspect mynet 
[
    {
        "Name": "mynet",
        "Id": "3a1f3caf97a6e635a0c31227b7a19b6b100f990591ea68e8b463de18da619b6e",
        "Created": "2022-09-09T16:02:33.067386187+08:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "192.168.0.0/16",
                    "Gateway": "192.168.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "27a5e5c233d63273d87f209f6e6b70a21179abfeb29488842be40cef5e05164f": {
                "Name": "tomcat-net-01",
                "EndpointID": "4199acc6c4d4be4dfe1cc6cb5ebd7fb57442b6265651141d76892ededf3ba79b",
                "MacAddress": "02:42:c0:a8:00:02",
                "IPv4Address": "192.168.0.2/16",
                "IPv6Address": ""
            },
            "756c9c351b2e2081ac7445c9f6c9cd1bd683dce64d497471a4662fc4dc17b04a": {
                "Name": "tomcat-net-02",
                "EndpointID": "5fe0a53471b43d7ee900cc03f5f6b3920af68f7cd058e469f7fd61fd72d89778",
                "MacAddress": "02:42:c0:a8:00:03",
                "IPv4Address": "192.168.0.3/16",
                "IPv6Address": ""
            }
        },
        "Options": {},
        "Labels": {}
    }
]
(base) lyfubuntu@lyfubuntu:~$ docker exec -it tomcat-net-01 ping 192.168.0.3
PING 192.168.0.3 (192.168.0.3) 56(84) bytes of data.
64 bytes from 192.168.0.3: icmp_seq=1 ttl=64 time=0.106 ms
64 bytes from 192.168.0.3: icmp_seq=2 ttl=64 time=0.062 ms
64 bytes from 192.168.0.3: icmp_seq=3 ttl=64 time=0.069 ms
64 bytes from 192.168.0.3: icmp_seq=4 ttl=64 time=0.064 ms
^C
--- 192.168.0.3 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3051ms
rtt min/avg/max/mdev = 0.062/0.075/0.106/0.017 ms
(base) lyfubuntu@lyfubuntu:~$ # 现在不使用 --link 也可以 ping 名字
(base) lyfubuntu@lyfubuntu:~$ docker exec -it tomcat-net-01 ping tomcat-net-02
PING tomcat-net-02 (192.168.0.3) 56(84) bytes of data.
64 bytes from tomcat-net-02.mynet (192.168.0.3): icmp_seq=1 ttl=64 time=0.083 ms
64 bytes from tomcat-net-02.mynet (192.168.0.3): icmp_seq=2 ttl=64 time=0.061 ms
64 bytes from tomcat-net-02.mynet (192.168.0.3): icmp_seq=3 ttl=64 time=0.066 ms
64 bytes from tomcat-net-02.mynet (192.168.0.3): icmp_seq=4 ttl=64 time=0.069 ms
64 bytes from tomcat-net-02.mynet (192.168.0.3): icmp_seq=5 ttl=64 time=0.064 ms
64 bytes from tomcat-net-02.mynet (192.168.0.3): icmp_seq=6 ttl=64 time=0.067 ms
^C
--- tomcat-net-02 ping statistics ---
6 packets transmitted, 6 received, 0% packet loss, time 5109ms
rtt min/avg/max/mdev = 0.061/0.068/0.083/0.007 ms
(base) lyfubuntu@lyfubuntu:~$ # docker 自定义网 络已经维护了对应的关系，使用自定义网络的好处：
(base) lyfubuntu@lyfubuntu:~$ # 1. redis - 不同 的集群使用不同的网络，保证集群是安全和健康的
(base) lyfubuntu@lyfubuntu:~$ # 2. mysql - 不同 的集群使用不同的网络，保证集群是安全和健康的
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
tomcat_ip_ping           latest    49e7365dc2c9   25 hours ago    519MB
diytomcat                latest    531449811312   2 days ago      827MB
luyanfeng123/diytomcat   1.0       531449811312   2 days ago      827MB
entrypoint-test          latest    293b60111edb   3 days ago      231MB
cmdtest                  latest    e507939f0998   3 days ago      231MB
mycentos                 0.2       5f2260ba4d08   3 days ago      624MB
lyf/centos               1.0       967c603048b0   4 days ago      231MB
my_centos                0.1       d3a84994963f   5 days ago      559MB
my_tomcat                0.1       82bf5ce1034c   5 days ago      480MB
tomcat                   9.0       d4488b7f8c9b   6 days ago      475MB
tomcat                   latest    7a91e6f458bb   6 days ago      475MB
mysql                    5.7       daff57b7d2d1   2 weeks ago     430MB
nginx                    latest    2b7d6430f78d   2 weeks ago     142MB
centos                   7         eeb6ee3f44bd   11 months ago   204MB
centos                   latest    5d0da3dc9764   11 months ago   231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                                         NAMES
756c9c351b2e   tomcat_ip_ping   "catalina.sh run"   23 minutes ago   Up 23 minutes   0.0.0.0:49158->8080/tcp, :::49158->8080/tcp   tomcat-net-02
27a5e5c233d6   tomcat_ip_ping   "catalina.sh run"   24 minutes ago   Up 24 minutes   0.0.0.0:49157->8080/tcp, :::49157->8080/tcp   tomcat-net-01
c14bfab1fc0f   tomcat_ip_ping   "catalina.sh run"   43 minutes ago   Up 43 minutes   0.0.0.0:49156->8080/tcp, :::49156->8080/tcp   tomcat_net02
239795cbc8a4   tomcat_ip_ping   "catalina.sh run"   43 minutes ago   Up 43 minutes   0.0.0.0:49155->8080/tcp, :::49155->8080/tcp   tomcat_net01
(base) lyfubuntu@lyfubuntu:~$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                      PORTS                                         NAMES
756c9c351b2e   tomcat_ip_ping        "catalina.sh run"        23 minutes ago   Up 23 minutes               0.0.0.0:49158->8080/tcp, :::49158->8080/tcp   tomcat-net-02
27a5e5c233d6   tomcat_ip_ping        "catalina.sh run"        24 minutes ago   Up 24 minutes               0.0.0.0:49157->8080/tcp, :::49157->8080/tcp   tomcat-net-01
c14bfab1fc0f   tomcat_ip_ping        "catalina.sh run"        43 minutes ago   Up 43 minutes               0.0.0.0:49156->8080/tcp, :::49156->8080/tcp   tomcat_net02
239795cbc8a4   tomcat_ip_ping        "catalina.sh run"        43 minutes ago   Up 43 minutes               0.0.0.0:49155->8080/tcp, :::49155->8080/tcp   tomcat_net01
c921ea0a887b   tomcat_ip_ping        "catalina.sh run"        20 hours ago     Exited (143) 18 hours ago                                                 tomcat_ip_ping03
027b83bd07b4   tomcat_ip_ping        "catalina.sh run"        20 hours ago     Exited (143) 18 hours ago                                                 tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping        "catalina.sh run"        25 hours ago     Exited (143) 18 hours ago                                                 tomcat_ip_ping01
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   2 days ago       Exited (137) 2 days ago                                                   luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               3 days ago       Exited (0) 3 days ago                                                     jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  3 days ago       Exited (0) 3 days ago                                                     eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  3 days ago       Exited (0) 3 days ago                                                     exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     3 days ago       Created                                                                   wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  3 days ago       Exited (0) 3 days ago                                                     objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   3 days ago       Exited (0) 3 days ago                                                     stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   3 days ago       Exited (0) 3 days ago                                                     docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              4 days ago       Exited (0) 4 days ago                                                     admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   4 days ago       Exited (0) 4 days ago                                                     nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   4 days ago       Exited (0) 4 days ago                                                     nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   5 days ago       Exited (0) 4 days ago                                                     mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              5 days ago       Exited (0) 5 days ago                                                     stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        5 days ago       Exited (143) 5 days ago                                                   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        5 days ago       Exited (143) 5 days ago                                                   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   5 days ago       Exited (143) 5 days ago                                                   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        6 days ago       Exited (143) 6 days ago                                                   tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   6 days ago       Exited (0) 6 days ago                                                     nginx01
bf46371dea89   centos                "/bin/bash"              6 days ago       Exited (0) 5 days ago                                                     epic_solomon
(base) lyfubuntu@lyfubuntu:~$
```

---

`docker` 自定义网络已经维护了对应的关系，使用`自定义网络`的好处：

1. `redis` - 不同的集群使用不同的网络，保证集群是安全和健康的。

2. `mysql` - 不同的集群使用不同的网络，保证集群是安全和健康的。

---

```shell
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
tomcat_ip_ping           latest    49e7365dc2c9   24 hours ago    519MB
diytomcat                latest    531449811312   2 days ago      827MB
luyanfeng123/diytomcat   1.0       531449811312   2 days ago      827MB
entrypoint-test          latest    293b60111edb   2 days ago      231MB
cmdtest                  latest    e507939f0998   3 days ago      231MB
mycentos                 0.2       5f2260ba4d08   3 days ago      624MB
lyf/centos               1.0       967c603048b0   4 days ago      231MB
my_centos                0.1       d3a84994963f   5 days ago      559MB
my_tomcat                0.1       82bf5ce1034c   5 days ago      480MB
tomcat                   9.0       d4488b7f8c9b   6 days ago      475MB
tomcat                   latest    7a91e6f458bb   6 days ago      475MB
mysql                    5.7       daff57b7d2d1   2 weeks ago     430MB
nginx                    latest    2b7d6430f78d   2 weeks ago     142MB
centos                   7         eeb6ee3f44bd   11 months ago   204MB
centos                   latest    5d0da3dc9764   11 months ago   231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
(base) lyfubuntu@lyfubuntu:~$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED        STATUS                      PORTS     NAMES
c921ea0a887b   tomcat_ip_ping        "catalina.sh run"        19 hours ago   Exited (143) 17 hours ago             tomcat_ip_ping03
027b83bd07b4   tomcat_ip_ping        "catalina.sh run"        19 hours ago   Exited (143) 17 hours ago             tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping        "catalina.sh run"        24 hours ago   Exited (143) 17 hours ago             tomcat_ip_ping01
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   2 days ago     Exited (137) 2 days ago               luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               2 days ago     Exited (0) 2 days ago                 jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  2 days ago     Exited (0) 2 days ago                 eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  3 days ago     Exited (0) 3 days ago                 exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     3 days ago     Created                               wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  3 days ago     Exited (0) 3 days ago                 objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   3 days ago     Exited (0) 3 days ago                 stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   3 days ago     Exited (0) 3 days ago                 docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              4 days ago     Exited (0) 4 days ago                 admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   4 days ago     Exited (0) 4 days ago                 nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   4 days ago     Exited (0) 4 days ago                 nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   4 days ago     Exited (0) 4 days ago                 mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              5 days ago     Exited (0) 5 days ago                 stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        5 days ago     Exited (143) 5 days ago               my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        5 days ago     Exited (143) 5 days ago               tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   5 days ago     Exited (143) 5 days ago               elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        6 days ago     Exited (143) 5 days ago               tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   6 days ago     Exited (0) 6 days ago                 nginx01
bf46371dea89   centos                "/bin/bash"              6 days ago     Exited (0) 5 days ago                 epic_solomon
(base) lyfubuntu@lyfubuntu:~$ # 产看所有 docker 网络
(base) lyfubuntu@lyfubuntu:~$ docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
97d8bd3a09c6   bridge    bridge    local
d7654904ecb4   host      host      local
ea359b44df52   none      null      local
(base) lyfubuntu@lyfubuntu:~$ # 网络模式
(base) lyfubuntu@lyfubuntu:~$ # bridge: 桥接模式，docker 默认使用桥接模 式，自己创建的网络也是使用 bridge 模式
(base) lyfubuntu@lyfubuntu:~$ # none: 不配置网络
(base) lyfubuntu@lyfubuntu:~$ # host: 和宿主机共享网络
(base) lyfubuntu@lyfubuntu:~$ # container: 容器网络连通！（用的少，局限 很大）
(base) lyfubuntu@lyfubuntu:~$ # 直接启动镜像的命令默认有一个 --net bridge 参数，这个就是 docker0
(base) lyfubuntu@lyfubuntu:~$ docker run -d -P --name tomcat_net01(base(base) lyfubuntu@lyfubuntu:~$ docker run -d -P --name tomcat_net01 tomcat_ip_ping
239795cbc8a40c4742eef268e30497cbf5ffd9c8ca32aec16778b4970cab7714
(base) lyfubuntu@lyfubuntu:~$ docker run -d -P --name tomcat_net02 tomcat_ip_ping
c14bfab1fc0fa60002ba5daa01f2edcaa31042b13d01e9a0db1bf012ce0842d8
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
tomcat_ip_ping           latest    49e7365dc2c9   25 hours ago    519MB
diytomcat                latest    531449811312   2 days ago      827MB
luyanfeng123/diytomcat   1.0       531449811312   2 days ago      827MB
entrypoint-test          latest    293b60111edb   3 days ago      231MB
cmdtest                  latest    e507939f0998   3 days ago      231MB
mycentos                 0.2       5f2260ba4d08   3 days ago      624MB
lyf/centos               1.0       967c603048b0   4 days ago      231MB
my_centos                0.1       d3a84994963f   5 days ago      559MB
my_tomcat                0.1       82bf5ce1034c   5 days ago      480MB
tomcat                   9.0       d4488b7f8c9b   6 days ago      475MB
tomcat                   latest    7a91e6f458bb   6 days ago      475MB
mysql                    5.7       daff57b7d2d1   2 weeks ago     430MB
nginx                    latest    2b7d6430f78d   2 weeks ago     142MB
centos                   7         eeb6ee3f44bd   11 months ago   204MB
centos                   latest    5d0da3dc9764   11 months ago   231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                                         NAMES
c14bfab1fc0f   tomcat_ip_ping   "catalina.sh run"   18 seconds ago   Up 16 seconds   0.0.0.0:49156->8080/tcp, :::49156->8080/tcp   tomcat_net02
239795cbc8a4   tomcat_ip_ping   "catalina.sh run"   48 seconds ago   Up 45 seconds   0.0.0.0:49155->8080/tcp, :::49155->8080/tcp   tomcat_net01
(base) lyfubuntu@lyfubuntu:~$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                      PORTS                                         NAMES
c14bfab1fc0f   tomcat_ip_ping        "catalina.sh run"        21 seconds ago   Up 20 seconds               0.0.0.0:49156->8080/tcp, :::49156->8080/tcp   tomcat_net02
239795cbc8a4   tomcat_ip_ping        "catalina.sh run"        51 seconds ago   Up 49 seconds               0.0.0.0:49155->8080/tcp, :::49155->8080/tcp   tomcat_net01
c921ea0a887b   tomcat_ip_ping        "catalina.sh run"        19 hours ago     Exited (143) 17 hours ago                                                 tomcat_ip_ping03
027b83bd07b4   tomcat_ip_ping        "catalina.sh run"        19 hours ago     Exited (143) 17 hours ago                                                 tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping        "catalina.sh run"        25 hours ago     Exited (143) 17 hours ago                                                 tomcat_ip_ping01
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   2 days ago       Exited (137) 2 days ago                                                   luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               2 days ago       Exited (0) 2 days ago                                                     jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  2 days ago       Exited (0) 2 days ago                                                     eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  3 days ago       Exited (0) 3 days ago                                                     exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     3 days ago       Created                                                                   wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  3 days ago       Exited (0) 3 days ago                                                     objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   3 days ago       Exited (0) 3 days ago                                                     stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   3 days ago       Exited (0) 3 days ago                                                     docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              4 days ago       Exited (0) 4 days ago                                                     admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   4 days ago       Exited (0) 4 days ago                                                     nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   4 days ago       Exited (0) 4 days ago                                                     nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   4 days ago       Exited (0) 4 days ago                                                     mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              5 days ago       Exited (0) 5 days ago                                                     stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        5 days ago       Exited (143) 5 days ago                                                   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        5 days ago       Exited (143) 5 days ago                                                   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   5 days ago       Exited (143) 5 days ago                                                   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        6 days ago       Exited (143) 5 days ago                                                   tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   6 days ago       Exited (0) 6 days ago                                                     nginx01
bf46371dea89   centos                "/bin/bash"              6 days ago       Exited (0) 5 days ago                                                     epic_solomon
(base) lyfubuntu@lyfubuntu:~$ docker network inspect bridge 
[
    {
        "Name": "bridge",
        "Id": "97d8bd3a09c68632f36a4cd367384a2fabb398bf8f8c4680a6ebaf6192ed9a3c",
        "Created": "2022-09-09T15:09:52.087458644+08:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "239795cbc8a40c4742eef268e30497cbf5ffd9c8ca32aec16778b4970cab7714": {
                "Name": "tomcat_net01",
                "EndpointID": "d118f4354b82ee8ad48632d5c076e58e316d5d23b28d0ea51623205988465490",
                "MacAddress": "02:42:ac:11:00:02",
                "IPv4Address": "172.17.0.2/16",
                "IPv6Address": ""
            },
            "c14bfab1fc0fa60002ba5daa01f2edcaa31042b13d01e9a0db1bf012ce0842d8": {
                "Name": "tomcat_net02",
                "EndpointID": "26f64b6509ce8a290c9d6de3d90dab28fea3f3715ca5758a7934ebe01d71d88c",
                "MacAddress": "02:42:ac:11:00:03",
                "IPv4Address": "172.17.0.3/16",
                "IPv6Address": ""
            }
        },
        "Options": {
            "com.docker.network.bridge.default_bridge": "true",
            "com.docker.network.bridge.enable_icc": "true",
            "com.docker.network.bridge.enable_ip_masquerade": "true",
            "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
            "com.docker.network.bridge.name": "docker0",
            "com.docker.network.driver.mtu": "1500"
        },
        "Labels": {}
    }
]
(base) lyfubuntu@lyfubuntu:~$ docker network --help

Usage:  docker network COMMAND

Manage networks

Commands:
  connect     Connect a container to a network
  create      Create a network
  disconnect  Disconnect a container from a network
  inspect     Display detailed information on one or more networks
  ls          List networks
  prune       Remove all unused networks
  rm          Remove one or more networks

Run 'docker network COMMAND --help' for more information on a command.
(base) lyfubuntu@lyfubuntu:~$ docker exec -it tomcat_net01 ping 172.17.0.3
PING 172.17.0.3 (172.17.0.3) 56(84) bytes of data.
64 bytes from 172.17.0.3: icmp_seq=1 ttl=64 time=0.132 ms
64 bytes from 172.17.0.3: icmp_seq=2 ttl=64 time=0.074 ms
64 bytes from 172.17.0.3: icmp_seq=3 ttl=64 time=0.047 ms
64 bytes from 172.17.0.3: icmp_seq=4 ttl=64 time=0.053 ms
64 bytes from 172.17.0.3: icmp_seq=5 ttl=64 time=0.062 ms
^C
--- 172.17.0.3 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4103ms
rtt min/avg/max/mdev = 0.047/0.073/0.132/0.030 ms
(base) lyfubuntu@lyfubuntu:~$ docker exec -it tomcat_net01 ping tomcat_net02
ping: tomcat_net02: Name or service not known
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
tomcat_ip_ping           latest    49e7365dc2c9   25 hours ago    519MB
diytomcat                latest    531449811312   2 days ago      827MB
luyanfeng123/diytomcat   1.0       531449811312   2 days ago      827MB
entrypoint-test          latest    293b60111edb   3 days ago      231MB
cmdtest                  latest    e507939f0998   3 days ago      231MB
mycentos                 0.2       5f2260ba4d08   3 days ago      624MB
lyf/centos               1.0       967c603048b0   4 days ago      231MB
my_centos                0.1       d3a84994963f   5 days ago      559MB
my_tomcat                0.1       82bf5ce1034c   5 days ago      480MB
tomcat                   9.0       d4488b7f8c9b   6 days ago      475MB
tomcat                   latest    7a91e6f458bb   6 days ago      475MB
mysql                    5.7       daff57b7d2d1   2 weeks ago     430MB
nginx                    latest    2b7d6430f78d   2 weeks ago     142MB
centos                   7         eeb6ee3f44bd   11 months ago   204MB
centos                   latest    5d0da3dc9764   11 months ago   231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED         STATUS         PORTS                                         NAMES
c14bfab1fc0f   tomcat_ip_ping   "catalina.sh run"   3 minutes ago   Up 3 minutes   0.0.0.0:49156->8080/tcp, :::49156->8080/tcp   tomcat_net02
239795cbc8a4   tomcat_ip_ping   "catalina.sh run"   4 minutes ago   Up 4 minutes   0.0.0.0:49155->8080/tcp, :::49155->8080/tcp   tomcat_net01
(base) lyfubuntu@lyfubuntu:~$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED         STATUS                      PORTS                                         NAMES
c14bfab1fc0f   tomcat_ip_ping        "catalina.sh run"        3 minutes ago   Up 3 minutes                0.0.0.0:49156->8080/tcp, :::49156->8080/tcp   tomcat_net02
239795cbc8a4   tomcat_ip_ping        "catalina.sh run"        4 minutes ago   Up 4 minutes                0.0.0.0:49155->8080/tcp, :::49155->8080/tcp   tomcat_net01
c921ea0a887b   tomcat_ip_ping        "catalina.sh run"        19 hours ago    Exited (143) 17 hours ago                                                 tomcat_ip_ping03
027b83bd07b4   tomcat_ip_ping        "catalina.sh run"        19 hours ago    Exited (143) 17 hours ago                                                 tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping        "catalina.sh run"        25 hours ago    Exited (143) 17 hours ago                                                 tomcat_ip_ping01
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   2 days ago      Exited (137) 2 days ago                                                   luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               2 days ago      Exited (0) 2 days ago                                                     jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  2 days ago      Exited (0) 2 days ago                                                     eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  3 days ago      Exited (0) 3 days ago                                                     exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     3 days ago      Created                                                                   wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  3 days ago      Exited (0) 3 days ago                                                     objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   3 days ago      Exited (0) 3 days ago                                                     stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   3 days ago      Exited (0) 3 days ago                                                     docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              4 days ago      Exited (0) 4 days ago                                                     admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   4 days ago      Exited (0) 4 days ago                                                     nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   4 days ago      Exited (0) 4 days ago                                                     nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   4 days ago      Exited (0) 4 days ago                                                     mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              5 days ago      Exited (0) 5 days ago                                                     stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        5 days ago      Exited (143) 5 days ago                                                   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        5 days ago      Exited (143) 5 days ago                                                   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   5 days ago      Exited (143) 5 days ago                                                   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        6 days ago      Exited (143) 5 days ago                                                   tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   6 days ago      Exited (0) 6 days ago                                                     nginx01
bf46371dea89   centos                "/bin/bash"              6 days ago      Exited (0) 5 days ago                                                     epic_solomon
(base) lyfubuntu@lyfubuntu:~$ # docker0 特点：默认，容器名不能访问， --link 可以打通连接！
(base) lyfubuntu@lyfubuntu:~$ # 自定义一个网络
(base) lyfubuntu@lyfubuntu:~$ # --driver bridge
(base) lyfubuntu@lyfubuntu:~$ # --subnet 192.168.0.0/16 支持 255 * 255 个网络，192.168.0.2 ~ 192.168.255.254
(base) lyfubuntu@lyfubuntu:~$ # --gateway 192.168.0.1
(base) lyfubuntu@lyfubuntu:~$ docker network create --help

Usage:  docker network create [OPTIONS] NETWORK

Create a network

Options:
      --attachable           Enable manual container attachment
      --aux-address map      Auxiliary IPv4 or IPv6
                             addresses used by Network
                             driver (default map[])
      --config-from string   The network from which to copy
                             the configuration
      --config-only          Create a configuration only network
  -d, --driver string        Driver to manage the Network
                             (default "bridge")
      --gateway strings      IPv4 or IPv6 Gateway for the
                             master subnet
      --ingress              Create swarm routing-mesh network
      --internal             Restrict external access to
                             the network
      --ip-range strings     Allocate container ip from a
                             sub-range
      --ipam-driver string   IP Address Management Driver
                             (default "default")
      --ipam-opt map         Set IPAM driver specific
                             options (default map[])
      --ipv6                 Enable IPv6 networking
      --label list           Set metadata on a network
  -o, --opt map              Set driver specific options
                             (default map[])
      --scope string         Control the network's scope
      --subnet strings       Subnet in CIDR format that
                             represents a network segment
(base) lyfubuntu@lyfubuntu:~$ docker network create --driver bridge --subnet 192.168.0.0/16 --gateway 192.168.0.1 mynet
3a1f3caf97a6e635a0c31227b7a19b6b100f990591ea68e8b463de18da619b6e
(base) lyfubuntu@lyfubuntu:~$ docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
97d8bd3a09c6   bridge    bridge    local
d7654904ecb4   host      host      local
3a1f3caf97a6   mynet     bridge    local
ea359b44df52   none      null      local
(base) lyfubuntu@lyfubuntu:~$ docker network inspect mynet 
[
    {
        "Name": "mynet",
        "Id": "3a1f3caf97a6e635a0c31227b7a19b6b100f990591ea68e8b463de18da619b6e",
        "Created": "2022-09-09T16:02:33.067386187+08:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "192.168.0.0/16",
                    "Gateway": "192.168.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {},
        "Options": {},
        "Labels": {}
(base) lyfubuntu@lyfubuntu:~$ docker run -d -P --name tomcat-net-01 --net mynet tomcat_ip_ping
27a5e5c233d63273d87f209f6e6b70a21179abfeb29488842be40cef5e05164f
(base) lyfubuntu@lyfubuntu:~$ docker run -d -P --name tomcat-net-02 --net mynet tomcat_ip_ping
756c9c351b2e2081ac7445c9f6c9cd1bd683dce64d497471a4662fc4dc17b04a
(base) lyfubuntu@lyfubuntu:~$ docker network inspect mynet 
[
    {
        "Name": "mynet",
        "Id": "3a1f3caf97a6e635a0c31227b7a19b6b100f990591ea68e8b463de18da619b6e",
        "Created": "2022-09-09T16:02:33.067386187+08:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "192.168.0.0/16",
                    "Gateway": "192.168.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "27a5e5c233d63273d87f209f6e6b70a21179abfeb29488842be40cef5e05164f": {
                "Name": "tomcat-net-01",
                "EndpointID": "4199acc6c4d4be4dfe1cc6cb5ebd7fb57442b6265651141d76892ededf3ba79b",
                "MacAddress": "02:42:c0:a8:00:02",
                "IPv4Address": "192.168.0.2/16",
                "IPv6Address": ""
            },
            "756c9c351b2e2081ac7445c9f6c9cd1bd683dce64d497471a4662fc4dc17b04a": {
                "Name": "tomcat-net-02",
                "EndpointID": "5fe0a53471b43d7ee900cc03f5f6b3920af68f7cd058e469f7fd61fd72d89778",
                "MacAddress": "02:42:c0:a8:00:03",
                "IPv4Address": "192.168.0.3/16",
                "IPv6Address": ""
            }
        },
        "Options": {},
        "Labels": {}
    }
]
(base) lyfubuntu@lyfubuntu:~$ docker exec -it tomcat-net-01 ping 192.168.0.3
PING 192.168.0.3 (192.168.0.3) 56(84) bytes of data.
64 bytes from 192.168.0.3: icmp_seq=1 ttl=64 time=0.106 ms
64 bytes from 192.168.0.3: icmp_seq=2 ttl=64 time=0.062 ms
64 bytes from 192.168.0.3: icmp_seq=3 ttl=64 time=0.069 ms
64 bytes from 192.168.0.3: icmp_seq=4 ttl=64 time=0.064 ms
^C
--- 192.168.0.3 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3051ms
rtt min/avg/max/mdev = 0.062/0.075/0.106/0.017 ms
(base) lyfubuntu@lyfubuntu:~$ # 现在不使用 --link 也可以 ping 名字
(base) lyfubuntu@lyfubuntu:~$ docker exec -it tomcat-net-01 ping tomcat-net-02
PING tomcat-net-02 (192.168.0.3) 56(84) bytes of data.
64 bytes from tomcat-net-02.mynet (192.168.0.3): icmp_seq=1 ttl=64 time=0.083 ms
64 bytes from tomcat-net-02.mynet (192.168.0.3): icmp_seq=2 ttl=64 time=0.061 ms
64 bytes from tomcat-net-02.mynet (192.168.0.3): icmp_seq=3 ttl=64 time=0.066 ms
64 bytes from tomcat-net-02.mynet (192.168.0.3): icmp_seq=4 ttl=64 time=0.069 ms
64 bytes from tomcat-net-02.mynet (192.168.0.3): icmp_seq=5 ttl=64 time=0.064 ms
64 bytes from tomcat-net-02.mynet (192.168.0.3): icmp_seq=6 ttl=64 time=0.067 ms
^C
--- tomcat-net-02 ping statistics ---
6 packets transmitted, 6 received, 0% packet loss, time 5109ms
rtt min/avg/max/mdev = 0.061/0.068/0.083/0.007 ms
(base) lyfubuntu@lyfubuntu:~$ # docker 自定义网 络已经维护了对应的关系，使用自定义网络的好处：
(base) lyfubuntu@lyfubuntu:~$ # 1. redis - 不同 的集群使用不同的网络，保证集群是安全和健康的
(base) lyfubuntu@lyfubuntu:~$ # 2. mysql - 不同 的集群使用不同的网络，保证集群是安全和健康的
(base) lyfubuntu@lyfubuntu:~$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
tomcat_ip_ping           latest    49e7365dc2c9   25 hours ago    519MB
diytomcat                latest    531449811312   2 days ago      827MB
luyanfeng123/diytomcat   1.0       531449811312   2 days ago      827MB
entrypoint-test          latest    293b60111edb   3 days ago      231MB
cmdtest                  latest    e507939f0998   3 days ago      231MB
mycentos                 0.2       5f2260ba4d08   3 days ago      624MB
lyf/centos               1.0       967c603048b0   4 days ago      231MB
my_centos                0.1       d3a84994963f   5 days ago      559MB
my_tomcat                0.1       82bf5ce1034c   5 days ago      480MB
tomcat                   9.0       d4488b7f8c9b   6 days ago      475MB
tomcat                   latest    7a91e6f458bb   6 days ago      475MB
mysql                    5.7       daff57b7d2d1   2 weeks ago     430MB
nginx                    latest    2b7d6430f78d   2 weeks ago     142MB
centos                   7         eeb6ee3f44bd   11 months ago   204MB
centos                   latest    5d0da3dc9764   11 months ago   231MB
elasticsearch            7.6.2     f29a1ee41030   2 years ago     791MB
(base) lyfubuntu@lyfubuntu:~$ docker ps
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                                         NAMES
756c9c351b2e   tomcat_ip_ping   "catalina.sh run"   23 minutes ago   Up 23 minutes   0.0.0.0:49158->8080/tcp, :::49158->8080/tcp   tomcat-net-02
27a5e5c233d6   tomcat_ip_ping   "catalina.sh run"   24 minutes ago   Up 24 minutes   0.0.0.0:49157->8080/tcp, :::49157->8080/tcp   tomcat-net-01
c14bfab1fc0f   tomcat_ip_ping   "catalina.sh run"   43 minutes ago   Up 43 minutes   0.0.0.0:49156->8080/tcp, :::49156->8080/tcp   tomcat_net02
239795cbc8a4   tomcat_ip_ping   "catalina.sh run"   43 minutes ago   Up 43 minutes   0.0.0.0:49155->8080/tcp, :::49155->8080/tcp   tomcat_net01
(base) lyfubuntu@lyfubuntu:~$ docker ps -a
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS                      PORTS                                         NAMES
756c9c351b2e   tomcat_ip_ping        "catalina.sh run"        23 minutes ago   Up 23 minutes               0.0.0.0:49158->8080/tcp, :::49158->8080/tcp   tomcat-net-02
27a5e5c233d6   tomcat_ip_ping        "catalina.sh run"        24 minutes ago   Up 24 minutes               0.0.0.0:49157->8080/tcp, :::49157->8080/tcp   tomcat-net-01
c14bfab1fc0f   tomcat_ip_ping        "catalina.sh run"        43 minutes ago   Up 43 minutes               0.0.0.0:49156->8080/tcp, :::49156->8080/tcp   tomcat_net02
239795cbc8a4   tomcat_ip_ping        "catalina.sh run"        43 minutes ago   Up 43 minutes               0.0.0.0:49155->8080/tcp, :::49155->8080/tcp   tomcat_net01
c921ea0a887b   tomcat_ip_ping        "catalina.sh run"        20 hours ago     Exited (143) 18 hours ago                                                 tomcat_ip_ping03
027b83bd07b4   tomcat_ip_ping        "catalina.sh run"        20 hours ago     Exited (143) 18 hours ago                                                 tomcat_ip_ping02
0b4ad3916256   tomcat_ip_ping        "catalina.sh run"        25 hours ago     Exited (143) 18 hours ago                                                 tomcat_ip_ping01
aa57776789ca   diytomcat             "/bin/sh -c '/usr/lo…"   2 days ago       Exited (137) 2 days ago                                                   luyanfengtomcat1
f876c324441f   entrypoint-test       "ls -a -l"               3 days ago       Exited (0) 3 days ago                                                     jolly_shaw
90d672f69b18   entrypoint-test       "ls -a"                  3 days ago       Exited (0) 3 days ago                                                     eager_burnell
2c00ada1000f   cmdtest               "ls -l"                  3 days ago       Exited (0) 3 days ago                                                     exciting_mahavira
b01b8b2df80f   cmdtest               "-l"                     3 days ago       Created                                                                   wonderful_dewdney
2c58747c312a   cmdtest               "ls -a"                  3 days ago       Exited (0) 3 days ago                                                     objective_leakey
db1c2bf8e3c8   mycentos:0.2          "/bin/sh -c /bin/bash"   3 days ago       Exited (0) 3 days ago                                                     stupefied_swanson
a85d30f34140   lyf/centos:1.0        "/bin/sh -c /bin/bash"   3 days ago       Exited (0) 3 days ago                                                     docker02
489086f92c85   lyf/centos:1.0        "/bin/bash"              4 days ago       Exited (0) 4 days ago                                                     admiring_dhawan
6abbcb16d1f6   nginx                 "/docker-entrypoint.…"   4 days ago       Exited (0) 4 days ago                                                     nginx03
880d9b4349bc   nginx                 "/docker-entrypoint.…"   4 days ago       Exited (0) 4 days ago                                                     nginx02
e4462368fa6f   mysql:5.7             "docker-entrypoint.s…"   5 days ago       Exited (0) 4 days ago                                                     mysql01
b8a17c4278ee   my_centos:0.1         "/bin/bash"              5 days ago       Exited (0) 5 days ago                                                     stupefied_ishizaka
7dfe27420032   my_tomcat:0.1         "catalina.sh run"        5 days ago       Exited (143) 5 days ago                                                   my_tomcat01
3cae46866d9e   tomcat                "catalina.sh run"        5 days ago       Exited (143) 5 days ago                                                   tomcat02
f888868cb0f2   elasticsearch:7.6.2   "/usr/local/bin/dock…"   5 days ago       Exited (143) 5 days ago                                                   elasticsearch
b96353caeec5   tomcat                "catalina.sh run"        6 days ago       Exited (143) 6 days ago                                                   tomcat01
993053824a5a   nginx                 "/docker-entrypoint.…"   6 days ago       Exited (0) 6 days ago                                                     nginx01
bf46371dea89   centos                "/bin/bash"              6 days ago       Exited (0) 5 days ago                                                     epic_solomon
(base) lyfubuntu@lyfubuntu:~$
```

### 网络连通

## 结语

第二十七篇博文写完，开心！！！！

今天，也是充满希望的一天。