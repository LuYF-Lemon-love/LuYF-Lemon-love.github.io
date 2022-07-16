---
title: Hexo博客进一步补充-ubuntu
tags:
  - Hexo
  - Butterfly
  - 百度收录
  - Google收录
  - Bing收录
categories: 博客
description: 对前两篇搭建博客的博文进一步补充。
cover: 'https://cos.luyf-lemon-love.space/images/noxus-bastion..png'
swiper_index: 1
abbrlink: 1285055319
date: 2022-07-16 19:41:36
---

### 前言

前两篇搭建博客的博文—— {% post_link Hexo快速搭建一个博客-ubuntu %} 和 {% post_link Hexo博客补充-ubuntu %}，虽然已经介绍了方方面面，但是还有一些遗漏之处，并且它们包含的内容过多，导致它的加载很缓慢，影响观看。因此本篇博文将作为它们的补充为大家介绍其他内容。

操作系统：Ubuntu 20.04.4 LTS

### 参考文档

1. [注册谷歌账号时手机号码不能验证？（最新解决办法）](https://blog.aftss.cn/1642.html)

### 环境版本

```
git         2.25.1
node        v18.2.0
npm         8.9.0

cnpm -v
cnpm@7.1.1 (/usr/local/lib/node_modules/cnpm/lib/parse_argv.js)
npm@6.14.17 (/usr/local/lib/node_modules/cnpm/node_modules/npm/lib/npm.js)
node@18.2.0 (/usr/bin/node)
npminstall@5.8.1 (/usr/local/lib/node_modules/cnpm/node_modules/npminstall/lib/index.js)
prefix=/usr/local 
linux x64 5.13.0-41-generic 
registry=https://registry.npmmirror.com

hexo -v
INFO  Validating config
INFO  
  ===================================================================
                                                                     
      #####  #    # ##### ##### ###### #####  ###### #      #   #    
      #    # #    #   #     #   #      #    # #      #       # #     
      #####  #    #   #     #   #####  #    # #####  #        #     
      #    # #    #   #     #   #      #####  #      #        #      
      #    # #    #   #     #   #      #   #  #      #        #    
      #####   ####    #     #   ###### #    # #      ######   #  

                            4.2.0
  ===================================================================
hexo: 6.1.0
hexo-cli: 4.3.0
os: linux 5.13.0-41-generic Ubuntu 20.04.4 LTS (Focal Fossa)
node: 18.2.0
v8: 10.1.124.8-node.13
uv: 1.43.0
zlib: 1.2.11
brotli: 1.0.9
ares: 1.18.1
modules: 108
nghttp2: 1.47.0
napi: 8
llhttp: 6.0.6
openssl: 3.0.3+quic
cldr: 41.0
icu: 71.1
tz: 2022a
unicode: 14.0
ngtcp2: 0.1.0-DEV
nghttp3: 0.1.0-DEV

# 轻量应用服务器信息

实例规格                 CPU: 2核 内存: 2GB
系统盘                   40GB SSD云硬盘
带宽                    4Mbps
镜像名称                 宝塔Linux面板
镜像类型                 应用镜像
操作系统                 CentOS 7.9 64bit
预装应用软件              宝塔Linux面板 7.8.0 腾讯云专享版
```

### Google | Bing | Baidu

Google 收录和 Bing 收录的流程与百度收录的流程一样，先使用`文件验证`添加网站，然后添加博客的 sitemap。收录流程请参考 {% post_link Hexo快速搭建一个博客-ubuntu %} 的 `百度收录博客`。

1. [Google Search Console](https://search.google.com/search-console)

2. [Microsoft Bing Webmaster Tools](https://www.bing.com/webmasters/)

注：有可能注册谷歌账号的时候会出现问题，请参考下面这篇文章，也可以直接花 10 多元买一个谷歌账号。

- [注册谷歌账号时手机号码不能验证？（最新解决办法）](https://blog.aftss.cn/1642.html)

### 结语

第十八篇博文写完，开心！！！！

今天，也是充满希望的一天。