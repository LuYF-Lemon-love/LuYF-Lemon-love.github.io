---
title: 腾讯云轻量应用服务器搭建图床-ubuntu
tags:
  - 腾讯云
  - 轻量应用服务器
  - 宝塔Linux面板
  - PicGo
  - Markdown
  - LskyPro
  - SCP
  - jsdelivr
categories: 实用技巧
description: 利用 腾讯云轻量应用服务器、LskyPro 和 PicGo 搭建 Markdown 图床。
cover: https://cos.luyf-lemon-love.space/images/20220513125213.png
abbrlink: 3910128244
date: 2022-05-20 18:32:11
---

### 前言

[jsDelivr](https://www.jsdelivr.com/) 是一个快速、可靠、自动化和开源的免费 CDN。支持 cdnjs 和 Github 内容直接加速引用。大到各种门户网站，小到个人博客，乃至去广告规则订阅、图床、插件静态库等等种种衍生场景，都能见到它的身影。

2021 年 12 月 20 日 , jsDelivr 的中国大陆的 CDN 被关闭，几个小时后 ICP 备案号被注销。2022 年 4 月 28 日 和 2022 年 5 月 17 日 遭到 DNS 污染，无法使用。

因此，不能利用 Github 的图床为个人博客服务了，因此，本文介绍利用 腾讯云轻量应用服务器、LskyPro 和 PicGo 搭建 Markdown 图床的过程。

操作系统（本地）：Ubuntu 20.04.4 LTS

### 参考文档

1. [jsDelivr域名遭到DNS污染](https://luotianyi.vc/6295.html)

2. [如何使用腾讯云轻量应用服务器快速搭建一个图床](https://computeinit.com/archives/3591)

3. [Lsky Pro 使用手册](https://www.kancloud.cn/wispx/lsky-pro)

4. [Linux 或 Mac OS 系统通过 SCP 上传文件到 Linux 轻量应用服务器](https://cloud.tencent.com/document/product/1207/53215)

5. [腾讯云轻量应用服务器搭建lsky图床并使用KODO云存储](https://blog.csdn.net/weixin_46250483/article/details/120538797?spm=1001.2014.3001.5506)

6. [Typora+PicGo+LskyPro打造舒适写作环境](https://blog.csdn.net/qq_42349306/article/details/119642314?spm=1001.2014.3001.5506)

7. [如何一个公网IP搭建多个网站？](https://blog.csdn.net/lianghuajunone/article/details/123980466?spm=1001.2014.3001.5506)

### 搭建 Markdown 图床

#### Lsky Pro

项目仓库地址：https://github.com/wisp-x/lsky-pro

主要特性

{% note success flat %}
支持第三方云储存，本地、阿里云 OSS、腾讯云 COS、七牛云、又拍云、FTP
{% endnote %}

{% note success flat %}
多图上传、拖拽上传、粘贴上传、上传预览、全屏预览、页面响应式布局
{% endnote %}

{% note success flat %}
简洁的图片管理功能，支持鼠标右键、单选多选、重命名等操作
{% endnote %}

{% note success flat %}
全局配置用户初始剩余储存空间、设置指定用户剩余储存空间
{% endnote %}

{% note success flat %}
一键复制图片外链、二维码扫描链接、图片鉴黄功能
{% endnote %}

{% note success flat %}
设置上传文件、文件夹路径命名规则、文件夹分类功能
{% endnote %}

{% note success flat %}
接口上传、图片软删除
{% endnote %}

{% note success flat %}
OTA 平滑升级系统
{% endnote %}

{% note success flat %}
(Dark)暗黑主题
{% endnote %}

{% note success flat %}
IP 封禁功能
{% endnote %}

{% note success flat %}
自定义链接参数
{% endnote %}

{% note success flat %}
单用户模式
{% endnote %}

安装需求

- PHP 版本 ≥ 5.6(≤ 7.3)

- mysql 版本 ≥ 5.5

- PDO 拓展

- ZipArchive 支持

- fileinfo 拓展

- curl 拓展

注：如果使用 FTP 功能，需要开启 PHP 的 FTP 拓展，推荐使用 PHP 7.1。

#### Lsky Pro 搭建步骤

注：本案例采用腾讯云轻量应用服务器的宝塔面板搭建。

环境：Nginx 1.20.2，MySQL 5.6.50，PHP-7.1。如果环境不对可以去宝塔面板的软件商店进行安装。

PHP-7.1 需要安装 fileInfo 扩展，可以在宝塔软件商店点击 PHP-7.1 ，在弹出的窗口上选择安装扩展，然后点击 fileInfo 的安装按钮进行安装。

1. 点击宝塔面板的网站，然后点击添加网站，域名填写域名或者 IP 地址，由于宝塔面板除了 80 端口外不支持其他端口使用 IP 地址创建，但是支持后面修改为其他端口，因此如果没有域名，可以随意填写，这里我们填写为 picbed.com。选择创建一个 MySQL 数据库，PHP 版本为 PHP-7.1。上面三个选择完成后，点击提交按钮。

2. 点击 picbed.com 的设置按钮，在弹出的窗口上点击域名管理，新建一个带端口的 IP 地址域名，如 43.142.31.247:82。然后删除之前乱写的 picbed.com 域名。注：如果你没在防火墙开放选择的端口，请在轻量应用服务器的控制台界面的防火墙处开放该端口。

3. 在本地的浏览器网址区输入 `https://github.com/wisp-x/lsky-pro/archive/v1.6.3.zip` 下载 Lsky Pro。下载的文件为 lsky-pro-1.6.3.zip。

4. 使用 SCP命令 上传文件到 Linux 轻量应用服务器中。

```shell
# 上传文件
scp 本地文件地址 轻量应用服务器帐号@轻量应用服务器实例公网 IP/域名:轻量应用服务器文件地址

# 下载文件
scp 轻量应用服务器帐号@轻量应用服务器实例公网 IP/域名:轻量应用服务器文件地址 本地文件地址 

# 本博文：在 lsky-pro-1.6.3.zip 文件所在目录应用，IP 地址替换你的服务器的 IP 地址
scp lsky-pro-1.6.3.zip root@43.142.31.247:/www/wwwroot/lsky-pro-1.6.3.zip
```

5. 解压:在宝塔面板的文件页面的 /www/wwwroot/ 目录下，点击 lsky-pro-1.6.3.zip 文件的解压按钮将其解压到 /www/wwwroot/picbed 目录下，如果解压完成后，picbed 目录里是 lsky-pro-1.6.3 目录（即中间套了一层打包目录），将 lsky-pro-1.6.3 里面的文件剪切到 picbed 目录里，并将 lsky-pro-1.6.3 目录删掉。

6. 如果你的服务器中没有 /public 目录，请新建该目录。点击之前创建的 picbed.com 站点的设置，然后点击 网站目录 按钮，设置运行目录为 /public，点击保存按钮。然后点击 伪静态 按钮，在代码框中填入下面代码,然后点击保存按钮。

```
location / {
    if (!-e $request_filename) {
        rewrite ^(.*)$ /index.php?s=$1 last; break;
    }
}
```

7. 在本地计算机的浏览器中输入你的站点的地址，会出现一个检测环境的页面，如果没有问题，点击下一步。

8. 然后配置数据库，可以到宝塔面板的数据库页面，选择你第一步中创建的数据库。你只需要修改 数据库名、数据库用户名和数据库密码，其他的默认就可以。

9. 然后是设置管理账号，你按照要求填写就可以了。

10. 然后你就可以在浏览器中输入站点地址进行玩耍了。在登录后，你可以在系统设置页面，关闭注册、不允许访客上传图片、设置文件的最大上传大小、单次同时上传的文件数量。

11. 注：由于后面我们会用到 Lsky Pro 的 API ，请在系统设置页面的其他配置中，开启 API。

#### PicGO 配置

PicGo 的安装请参考我的另一篇博文 Github+PicGo搭建Markdowm图床-ubuntu。

1. 用管理员登录你之前创建的 Lsky Pro 的站点，点击 API，如图

![](https://cos.luyf-lemon-love.space/images/20220520211759.png)

你将看见你的 URL 如图

![](https://cos.luyf-lemon-love.space/images/20220520212045.png)

然后你手动拼接你的 URL、端口、email、password 形成一个链接，然后将其放到浏览器的地址栏里会返回一些信息，其中会有 token 值，将其记录下来。链接的形式如下

```
http://43.132.156.226:4080/api/token?email=itwxe@qq.com&password=123456
```

2. 打开 PicGo 的详细窗口，搜索 lskypro 安装插件

![](https://cos.luyf-lemon-love.space/images/20220520214129.png)

3. 安装成功后点击图床设置，设置为 Lsky Pro 为默认图床，输入 Url 和 Token 后确定即可。

4. 到这里你就可以使用 PicGo 上传图片到你的 轻量服务器中，并返回 Markdown 格式的 图片链接。

### 结语

第六篇博文写完，开心！！！！

今天，也是充满希望的一天。