---
title: PicGo+腾讯云COS搭建图床-ubuntu
tags:
  - 腾讯云
  - 对象存储
  - PicGo
  - Markdown
  - jsdelivr
categories: 实用技巧
description: 利用腾讯云的对象存储（Cloud Object Storage，COS）和 PicGo 搭建 Markdown 图床。
cover: >-
  https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220520215128.png
abbrlink: 2127066589
date: 2022-05-20 21:45:38
---


### 前言

[jsDelivr](https://www.jsdelivr.com/) 是一个快速、可靠、自动化和开源的免费 CDN。支持 cdnjs 和 Github 内容直接加速引用。大到各种门户网站，小到个人博客，乃至去广告规则订阅、图床、插件静态库等等种种衍生场景，都能见到它的身影。

2021 年 12 月 20 日 , jsDelivr 的中国大陆的 CDN 被关闭，几个小时后 ICP 备案号被注销。2022 年 4 月 28 日 和 2022 年 5 月 17 日 遭到 DNS 污染，无法使用。

因此，不能利用 Github 的图床为个人博客服务了，而且由于中国大陆的网站域名需要备案，无法通过域名快速获得免费的 SSL 证书，因此上一篇博客（腾讯云轻量应用服务器搭建图床-ubuntu）中搭建的 Lsky Pro 的图床站点无法提供 HTTPS = HTTP + SSL/TLS 服务，只能提供 HTTP 服务，但像 Github 等提供的 Pages 服务是 HTTPS 的，而且很多博客中的第三方 API 都是 HTTPS服务。HTTPS 服务不可以访问 HTTP 服务。

因此，本文介绍利用 腾讯云的对象存储（Cloud Object Storage，COS）和 PicGo 搭建 Markdown 图床的过程。

操作系统（本地）：Ubuntu 20.04.4 LTS

### 参考文档

1. [jsDelivr域名遭到DNS污染](https://luotianyi.vc/6295.html)

2. [腾讯云对象存储产品概述](https://cloud.tencent.com/document/product/436/6222)

3. [腾讯云对象存储计费示例](https://cloud.tencent.com/document/product/436/6241)

4. [腾讯云对象存储定价](https://buy.cloud.tencent.com/price/cos)

5. [腾讯云对象存储设置防盗链](https://cloud.tencent.com/document/product/436/13319)

6. [Typora+PicGo+腾讯云COS搭建图床](https://blog.csdn.net/xk1835217729/article/details/123958269?spm=1001.2014.3001.5506)

7. [稳定且高性价比！腾讯云图床服务来了！](https://cloud.tencent.com/developer/article/1966294)

8. [开启自定义 CDN 加速域名](https://cloud.tencent.com/document/product/436/36637)

### 搭建 Markdown 图床

#### 腾讯云对象存储

对象存储（Cloud Object Storage，COS）是腾讯云提供的一种存储海量文件的分布式存储服务，用户可通过网络随时存储和查看数据。腾讯云 COS 使所有用户都能使用具备高扩展性、低成本、可靠和安全的数据存储服务。

COS 通过控制台、API、SDK 和工具等多样化方式简单、快速地接入，实现了海量数据存储和管理。通过 COS 可以进行任意格式文件的上传、下载和管理。腾讯云提供了直观的 Web 管理界面，同时遍布全国范围的 CDN 节点可以对文件下载进行加速。

#### 配置腾讯云对象存储

1. 腾讯云对象存储的价格很便宜，具体价格和计算方法可以看这两篇文档：[腾讯云对象存储计费示例](https://cloud.tencent.com/document/product/436/6241)，[腾讯云对象存储定价](https://buy.cloud.tencent.com/price/cos)

2. 进入[腾讯云官网](https://cloud.tencent.com/)，注册登录。在首页中找到 **产品** -> **存储** -> **对象存储**，点击 **对象存储**。

3. 进入到对象存储页面，点击立即使用。

4. 进入对象存储的控制台，如果是第一次使用，这里会显示开通对象存储COS服务，点击开通即可，开通成功后，点击创建存储桶。

5. 进入到存储桶列表页面，在该界面再次点击创建存储桶。

6. 第一步设置基本信息。所属地域选择离自己近的，或者选择价格便宜的（价格可以看[腾讯云对象存储定价](https://buy.cloud.tencent.com/price/cos)）。存储桶命名随意，访问权限设置 公有读私有写。然后点击 **下一步**

7. 第二步，高级可选配置默认，或者按照你的需求填写。

8. 第三步，确认配置，点击创建。

9. 创建成功后，会进入到刚刚创建的存储桶的文件列表中，即我们存放文件的地方，在这里我们可以新建目录来存储相关类型的文件，便于管理；这儿我们新建一个名为images的文件夹，表示存放图片。

10. 点击上方的 **返回桶列表**，然后在左侧菜单栏找到密钥管理，点击访问密钥。

11. 点击访问密钥后，进入到以下界面，在高风险提示中，如果不会子账号的相关操作，点击继续使用主账号也行。

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220520223745.png)

12. 然后，点击 **新建密钥**，新建密钥成功后，我们就得到了需要的 AAPID、SecretId 和 SecretKey 的值。然后，返回到存储桶列表，点击刚刚创建的存储桶，在这个存储桶的概览中找到基本信息，获取到存储桶名称、所属地域。注：一会配置 PicGo 时，会需要存储桶的地域信息，请填写括号中的英文描述，如 所属地域为：南京 （中国）（ap-nanjing），填写的时候填 ap-nanjing。

#### PicGO 配置

PicGo 的安装请参考我的另一篇博文 Github+PicGo搭建Markdowm图床-ubuntu。

1. 打开 PicGo 的详细窗口，点击图床设置 -> 腾讯云COS，COS 版本选择 v5，然后填写上面获得的信息：SecretId、SecretKey、APPID、存储空间名、存储区域。设置存储路径为 `images/`，点击确定，并设为默认图床。

2. 到这里你就可以使用 PicGo 上传图片到你的 存储桶中，并返回 Markdown 格式的 图片链接。

#### 设置防盗链

注：设置防盗链后可能无法通过 PicGo 的相册来浏览你的图片。

为了避免恶意程序使用资源 URL 盗刷公网流量或使用恶意手法盗用资源，给用户带来不必要的损失。腾讯云对象存储支持防盗链配置，建议您通过控制台的防盗链设置配置黑/白名单，来进行安全防护。

1. 登录 [对象存储控制台](https://console.cloud.tencent.com/cos)，在左侧菜单栏中单击存储桶列表，进入存储桶列表页面。
2. 找到您需要设置防盗链的存储桶，单击其名称，进入存储桶管理页面。
3. 单击安全管理 > 防盗链设置，找到防盗链设置，单击编辑进入可编辑状态。

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220520225922.png)

4. 修改当前状态为开启，选择名单类型（黑名单或白名单），设置好相应域名，设置完成后单击保存即可，配置项说明如下：

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220520230009.png)

   - 黑名单：拒绝名单内的域名访问存储桶的默认访问地址，若名单内的域名访问存储桶的默认访问地址，则返回403。
   
   - 白名单：允许名单内的域名访问存储桶的默认访问地址，若名单外的域名访问存储桶的默认访问地址，则返回403。

   - 空 referer：HTTP 请求中，header 为空 referer（即不带 referer 字段或 referer 字段为空）。
   
   - Referer：支持设置最多10条域名且为相同前缀匹配，每条一行，多条请换行；支持域名、IP 和通配符*等形式的地址。示例如下：
      
      1. 配置 `www.example.com`：可限制如 `www.example.com/123、www.example.com.cn等以www.example.com为前缀的地址`。

      2. 支持带端口的域名和 IP，例如 `www.example.com:8080、10.10.10.10:8080等地址`。

      3. 配置 `*.example.com`：可限制 `a.b.example.com/123、a.example.com等地址`。

#### 合理购买

使用 COS 做图床使用，会涉及外网下行流量、存储容量、请求数，三个收费项。

- 存储容量价格：标准存储容量费 0.118 元/GB/每月

- 外网下行流量：外网下行流量费 0.5 元/GB（可以使用 CDN 加速节省流量费用）

- 读写请求数：每 1 万次，只收取 0.01 元请求费用。

- CDN 回源流量 0.15 元/GB。COS 存储桶支持绑定自定义域名并开启 CDN 加速，可以有效提高网站访问图片的质量，下载的流量费用也会更低。[开启自定义 CDN 加速域名](https://cloud.tencent.com/document/product/436/36637)。但是域名需要备案。对于 COS + CDN 场景，会省去 COS 下行流量费用，换成价格更便宜的 CDN 下行流量费用和 CDN 回源流量费用，CDN 加速方案比直接访问 COS 流量成本低很多

其中，外网下行流量费用是最高的。我用了 4 天的截图。

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220524122009.png)

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220524122103.png)

可以购买外网下行流量包缓解。流量包是 7.2 折，平均 0.36 元 / GB。

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220524122254.png)

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220524122648.png)

### 结语

第七篇博文写完，开心！！！！

今天，也是充满希望的一天。