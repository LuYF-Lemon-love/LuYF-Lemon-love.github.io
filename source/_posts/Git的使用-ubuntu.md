---
title: Git的使用-ubuntu
tags:
  - Git
  - Github
categories: 计算机基础
description: 介绍 Git 和 Github。
cover: https://cos.luyf-lemon-love.space/images/20220511161508.png
abbrlink: 2854530117
date: 2022-05-07 04:53:32
---

### 写在前面

受到**冯乐乐**的影响，想要搭建个人博客

冯乐乐（ https://candycat1992.github.io/ ）个人介绍：

> Hi，我是冯乐乐，上海交通大学软件学院研究生，数字媒体实验室，师从杨旭波教授，目前投身于游戏行业，就职于上海米哈游，欢迎找我投简历。我喜欢一切用计算机绘画的技术！
>
> 爱好写shader、计算机图形学、写博客；经常在Shadertoy上学习和分享shader；之前一直在CSDN上分享技术博客。个人编写的技术书籍《Unity Shader入门精要》（异步社区、亚马逊、京东、当当）于2016年由人民邮电出版社出版发售。
>
> 想要自己建博客的想法萌生于一两年前，有个IBM的管理人员来交大做讲座，他提到面试的时候如果有个个人博客是很好的事情，但千万不要使用CSDN这种，显得很low（这话不是我说的，不要拍我……）。作为一个使用CDSN博客多年的人来说，我受到了1t的伤害>_<。最近又来了兴趣，所幸花一天时间搞起来吧。

### 前言

Git 是一个**免费、开源**的版本控制软件。

版本控制通过记录一个或若干个文件内容变化，来实现查询特定版本修改详情，具有以下特点：

- **记录文件的所有历史变化**
- **随时可恢复到任何一个历史状态**
- **多人协作开发或修改**

Github 是全球最大的社交编程及代码托管网站（ https://github.com/ ）。

Git 是版本控制软件，Github 是项目代码托管平台，借助 git 来管理项目代码。

操作系统：**Ubuntu 20.04.4 LTS**

### 参考文档

1. [黑马程序员的两小时学会Git玩转Github的视频](https://www.bilibili.com/video/BV1Xx411m7kn?share_source=copy_web)及文档

2. [使用免费的CDN平台jsDelivr搭建个人cdn资源网盘](https://blog.csdn.net/q906270629/article/details/106145109?spm=1001.2014.3001.5506)

### Github的基本概念

仓库（ Repository ）

收藏（ Star ）

克隆项目（ Fork ）：克隆后的仓库会声明源仓库，但是是单独存在的。

发起请求（ Pull Request ）

关注（ Watch ）

事务（ Issue ）：发现代码 BUG，但是目前没有解决代码，需要讨论。在讨论过程中要保持**谦逊**和**礼貌**。

创建开源仓库时尽量使用 **MIT 许可证**（The MIT License），有利于仓库的传播。

在仓库中按 **t** 键可以快速 find 文件。

### 开源项目贡献流程

#### 提出Issue

提交bug或者idea

#### Pull Request

- fork 项目
- 修改 fork 项目仓库的代码
- 新建 pull request
- 等待原作者审核

### Git 管理项目

#### Git 基本工作流程

Git 工作区域：

- 工作区（ Working Directory ）：添加、编辑和修改文件等动作
- 暂存区：暂存已经修改的文件，最后统一提交到仓库中
- 仓库（ Repository ）：最终确定的文件保存到仓库，成为一个新的版本，并对他人可见

向仓库中提交代码的流程：

- 将工作区中的内容提交到暂存区：

  ```shell
  git status
  
  git add a.c
  git add b.cpp
  ```

- 将暂存区的内容提交到仓库中：

  ```shell
  git status
  
  git commit -m "提交描述"
  ```

- 查看状态：

  ```shell
  git status
  ```

#### Git 初始化

```shell
git config --global user.email "3555028709@qq.com"

git config --global user.name "LuYF-Lemon-love"

git config --global core.autocrlf false
```

#### 本地创建一个新的仓库

```shell
mkdir my_repository

cd my_repository
git init

touch a.c

git status
git add a.c

git status
git commit -m '新增 a.c 文件'

git status
```

#### 修改仓库代码

```shell
vi a.c

cat a.c

git status
git add a.c

git status
git commit -m '修改 a.c 文件'

git status
```

#### 删除仓库文件

```shell
rm -rf a.c

git status
git rm a.c

git status
git commit -m '删除 a.c 文件'

git status
```

### Git 管理远程仓库

好处：备份，实现代码共享，集中化管理，**逼格高**。

```shell
git push # 将本地仓库提交到远程仓库
```

#### Personal access tokens

1. 登录 Github
2. 进入 Settings
3. 进入 Developer settings
4. 点击 Personal access tokens
5. 点击 Generate new token
6. 选择生成的个人令牌的访问权限和期限
7. 点击 Generate token
8. 保存生成的token

token使用方法：

```shell
git remote set-url origin https://<your_token>@github.com/<username>/<repo>.git

# <your_token>: 生成的 token
# <username>: 用户名
# <repo>: 仓库名
```



#### Git 克隆

加远程仓库复制到本地

```shell
git clone https://github.com/LuYF-Lemon-love/picture.git # 密码是生成的 token

cd picture

ls -a
```

#### 将本地仓库同步到远程仓库中

```shell
mv 苏苏1.jpeg 苏苏-001.jpeg # 修改图片的名字
ls

git status
git add 苏苏-001.jpeg

git status
git commit -m '修改苏苏图片的名字'

git status
git remote set-url origin https://<your_token>@github.com/LuYF-Lemon-love/picture.git # 防止每次push都需要输入token
git push

git status

#由于我们是修改了文件名，因此我们需要将附带产生的删除操作也提交到远程仓库
git rm 苏苏1.jpeg

git status
git commit -m '删除 苏苏1.jpeg 文件'

git status
git push

git status
```

### Github Pages

个人站点：https://LuYF-Lemon-love.github.io 

格式：https://用户名.github.io

#### 搭建步骤

1. 新建仓库（注：仓库名必须是【用户名.github.io】）
2. 在仓库中新建 index.html 文件
3. 在 index.html 文件搭建你的个人主页
4. 在网址：https://用户名.github.io 访问你的个人主页

注：github pages 仅支持静态网页

### Project Pages 项目站点

项目站点：https://luyf-lemon-love.github.io/susu-artificial-intelligence/

格式：https://用户名.github.io/仓库名

gh-pages branch 用于构建和发布项目站点

#### 搭建步骤

1. 进入相应项目主页
2. 点击 Settings
3. 点击 Pages
4. 点击 Choose a theme 按钮
5. 选择你喜欢的主题，点击 Select theme
6. 修改 index.md 文件中的内容
7. 点击最下方的 Commit changes
8. 在网址：https://用户名.github.io/仓库名 访问你的项目站点

### 结语

第一篇博文写完，开心！！！！

今天，也是充满希望的一天。