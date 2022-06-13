---
title: Github+PicGo搭建Markdown图床-ubuntu
tags:
  - VSCode
  - Markdown
  - Github
  - PicGo
categories: 实用技巧
description: 利用 Github 和 PicGo 搭建 Markdown 图床。
cover: https://cos.luyf-lemon-love.space/images/20220511161649.png
abbrlink: 2568080348
date: 2022-05-10 17:34:51
---

### 前言

VSCode 通过 Markdown 插件可以很方便的书写 Markdown 文本，并且 VSCode 提供的预览功能能够快速看到 Markdown 的渲染效果。

[Github](https://github.com/) 提供的代码仓库能够当作我们图片的远程仓库，使得我们能够随时随地的访问我们的图片。

[PicGo](https://picgo.github.io/PicGo-Doc/) 能够快速将图片上传到 Github 上，并生成 Markdown 格式的图片链接，方便我们的引用。

操作系统：Ubuntu 20.04.4 LTS

### 参考文档

1. [PicGo文档](https://picgo.github.io/PicGo-Doc/zh/guide/)

2. [VSCode+PicGo+Github搭建Markdown图床](https://blog.csdn.net/qq_35621494/article/details/106432399?spm=1001.2014.3001.5506)

3. [10分钟教你使用Picgo+GitHub+ jsDelivr搭建CDN加速免费图床](https://blog.csdn.net/Rivalsx/article/details/106994195?spm=1001.2014.3001.5506)

4. [如何在 Linux 中使用 AppImage](https://blog.csdn.net/m0_46278037/article/details/120471008?spm=1001.2014.3001.5506)

### 搭建 Markdown 图床

#### 配置 Github

- 在 Github 上创建一个 Public 仓库，如 PicBed
- 在 Github 上生成一个 Personal access token，该 token 包含 repo 权限，生成 token 的方法可以观看[Git的使用-ubuntu](https://luyf-lemon-love.github.io/2022/05/07/Git%E7%9A%84%E4%BD%BF%E7%94%A8-ubuntu/)
- 通过链接 https://github.com/Molunerfinn/PicGo/releases 下载，linux 用户下载 AppImage 文件，本博文写作时版本为：PicGo-2.3.1-beta.3.AppImage，下载得到的文件名为：PicGo-2.3.0.AppImage

不同的 linux 发行版可能有不同的格式的安装文件，如 DEB、RPM，开发人员必须为同一软件发布不同格式的安装文件。

AppImage 是一种通用的软件包格式。可以在不同的 linux 发行版上使用。并且 AppImage 文件不需要安装,不需要卸载，直接点击运行，并且不触发 root 权限。

```shell
# AppImage 默认为只读模式，需要赋予执行权限
chmod u+x PicGo-2.3.0.AppImage 
```

- 点击 PicGo-2.3.0.AppImage 文件运行
- 点击 ubuntu 系统右上 PicGo 的图标，点击 打开详细窗口按钮
- 点击图床设置
- 点击 Github 图床
- 安装下面图片的格式填写
    - Token 就是上面生成的 Token
    - 存储路径按照你的需要指定
    - 我们采用 cdn 加速访问我们图片，因此设定自定义域名为：https://cdn.jsdelivr.net/gh/[用户名]/[仓库名]@[分支名]，例: https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main
- 点击确定和设为默认图床，配置完成

![](https://cos.luyf-lemon-love.space/images/20220510183400.png)


点击上传区,这时就可以上传图片了，上传成功后自动将 Markdown 格式的图片链接复制到剪贴板，这是可以直接复制到 Markdown 文本上。

![](https://cos.luyf-lemon-love.space/images/20220510184501.png)

### 结语

第五篇博文写完，开心！！！！

今天，也是充满希望的一天。