---
title: Hexo博客补充-ubuntu
tags:
  - Hexo
  - Butterfly
categories: 博客
description: 对第一个搭建博客的博文-Hexo快速搭建一个博客-ubuntu的补充。
cover: >-
  https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220520214849.png
swiper_index: 1
abbrlink: 2759212511
date: 2022-05-31 12:03:52
---

### 前言

第一篇搭建博客的博文-Hexo快速搭建一个博客-ubuntu，虽然已经介绍了方方面面，但是还有一些遗漏之处，并且它包含的内容过多，导致它的加载很缓慢，影响观看。因此本篇博文将作为其补充为大家介绍其他内容。

操作系统：Ubuntu 20.04.4 LTS

### 参考文档

1. [给hexo-theme-hiero添加雪花飘落效果（2020-07-05）](https://www.jianshu.com/p/b726f356e118)

2. [Butterfly 安装文档(三) 主题配置-1](https://butterfly.js.org/posts/4aa8abbe/)

3. [解决 Hexo ButterFly 主题中最新评论功能模块出现无法获取评论的问题](https://dreamhomes.top/posts/202106171704/)

4. [Twikoo 文档](https://twikoo.js.org/)

5. [Twikoo 文档-快速上手](https://twikoo.js.org/quick-start.html)

6. [Butterfly 安裝文檔(四) 主題配置-2](https://butterfly.js.org/posts/ceeb73f/#%E8%A9%95%E8%AB%96)

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

### 雪花动态效果背景进阶

在 blog/themes/butterfly/source/js 目录下新建 snow2.js，并粘贴下面代码

```js
/*样式一*/
(function($){
    $.fn.snow = function(options){
    var $flake = $('<div id="snowbox" />').css({'position': 'absolute','z-index':'9999', 'top': '-50px'}).html('&#10052;'),
    documentHeight  = $(document).height(),
    documentWidth   = $(document).width(),
    defaults = {
        minSize     : 10,
        maxSize     : 20,
        newOn       : 1000,
        flakeColor  : "#AFDAEF" /* 此处可以定义雪花颜色，若要白色可以改为#FFFFFF */
    },
    options = $.extend({}, defaults, options);
    var interval= setInterval( function(){
    var startPositionLeft = Math.random() * documentWidth - 100,
    startOpacity = 0.5 + Math.random(),
    sizeFlake = options.minSize + Math.random() * options.maxSize,
    endPositionTop = documentHeight - 200,
    endPositionLeft = startPositionLeft - 500 + Math.random() * 500,
    durationFall = documentHeight * 10 + Math.random() * 5000;
    $flake.clone().appendTo('body').css({
        left: startPositionLeft,
        opacity: startOpacity,
        'font-size': sizeFlake,
        color: options.flakeColor
    }).animate({
        top: endPositionTop,
        left: endPositionLeft,
        opacity: 0.2
    },durationFall,'linear',function(){
        $(this).remove()
    });
    }, options.newOn);
    };
})(jQuery);
$(function(){
    $.fn.snow({ 
        minSize: 5, /* 定义雪花最小尺寸 */
        maxSize: 50,/* 定义雪花最大尺寸 */
        newOn: 300  /* 定义密集程度，数字越小越密集 */
    });
});
/*样式二*/
/* 控制下雪 */
function snowFall(snow) {
    /* 可配置属性 */
    snow = snow || {};
    this.maxFlake = snow.maxFlake || 200;   /* 最多片数 */
    this.flakeSize = snow.flakeSize || 10;  /* 雪花形状 */
    this.fallSpeed = snow.fallSpeed || 1;   /* 坠落速度 */
}
/* 兼容写法 */
requestAnimationFrame = window.requestAnimationFrame ||
    window.mozRequestAnimationFrame ||
    window.webkitRequestAnimationFrame ||
    window.msRequestAnimationFrame ||
    window.oRequestAnimationFrame ||
    function(callback) { setTimeout(callback, 1000 / 60); };

cancelAnimationFrame = window.cancelAnimationFrame ||
    window.mozCancelAnimationFrame ||
    window.webkitCancelAnimationFrame ||
    window.msCancelAnimationFrame ||
    window.oCancelAnimationFrame;
/* 开始下雪 */
snowFall.prototype.start = function(){
    /* 创建画布 */
    snowCanvas.apply(this);
    /* 创建雪花形状 */
    createFlakes.apply(this);
    /* 画雪 */
    drawSnow.apply(this)
}
/* 创建画布 */
function snowCanvas() {
    /* 添加Dom结点 */
    var snowcanvas = document.createElement("canvas");
    snowcanvas.id = "snowfall";
    snowcanvas.width = window.innerWidth;
    snowcanvas.height = document.body.clientHeight;
    snowcanvas.setAttribute("style", "position:absolute; top: 0; left: 0; z-index: 1; pointer-events: none;");
    document.getElementsByTagName("body")[0].appendChild(snowcanvas);
    this.canvas = snowcanvas;
    this.ctx = snowcanvas.getContext("2d");
    /* 窗口大小改变的处理 */
    window.onresize = function() {
        snowcanvas.width = window.innerWidth;
        /* snowcanvas.height = window.innerHeight */
    }
}
/* 雪运动对象 */
function flakeMove(canvasWidth, canvasHeight, flakeSize, fallSpeed) {
    this.x = Math.floor(Math.random() * canvasWidth);   /* x坐标 */
    this.y = Math.floor(Math.random() * canvasHeight);  /* y坐标 */
    this.size = Math.random() * flakeSize + 2;          /* 形状 */
    this.maxSize = flakeSize;                           /* 最大形状 */
    this.speed = Math.random() * 1 + fallSpeed;         /* 坠落速度 */
    this.fallSpeed = fallSpeed;                         /* 坠落速度 */
    this.velY = this.speed;                             /* Y方向速度 */
    this.velX = 0;                                      /* X方向速度 */
    this.stepSize = Math.random() / 30;                 /* 步长 */
    this.step = 0                                       /* 步数 */
}
flakeMove.prototype.update = function() {
    var x = this.x,
        y = this.y;
    /* 左右摆动(余弦) */
    this.velX *= 0.98;
    if (this.velY <= this.speed) {
        this.velY = this.speed
    }
    this.velX += Math.cos(this.step += .05) * this.stepSize;

    this.y += this.velY;
    this.x += this.velX;
    /* 飞出边界的处理 */
    if (this.x >= canvas.width || this.x <= 0 || this.y >= canvas.height || this.y <= 0) {
        this.reset(canvas.width, canvas.height)
    }
};
/* 飞出边界-放置最顶端继续坠落 */
flakeMove.prototype.reset = function(width, height) {
    this.x = Math.floor(Math.random() * width);
    this.y = 0;
    this.size = Math.random() * this.maxSize + 2;
    this.speed = Math.random() * 1 + this.fallSpeed;
    this.velY = this.speed;
    this.velX = 0;
};
// 渲染雪花-随机形状（此处可修改雪花颜色！！！）
flakeMove.prototype.render = function(ctx) {
    var snowFlake = ctx.createRadialGradient(this.x, this.y, 0, this.x, this.y, this.size);
    snowFlake.addColorStop(0, "rgba(255, 255, 255, 0.9)");  /* 此处是雪花颜色，默认是白色 */
    snowFlake.addColorStop(.5, "rgba(255, 255, 255, 0.5)"); /* 若要改为其他颜色，请自行查 */
    snowFlake.addColorStop(1, "rgba(255, 255, 255, 0)");    /* 找16进制的RGB 颜色代码。 */
    ctx.save();
    ctx.fillStyle = snowFlake;
    ctx.beginPath();
    ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
    ctx.fill();
    ctx.restore();
};
/* 创建雪花-定义形状 */
function createFlakes() {
    var maxFlake = this.maxFlake,
        flakes = this.flakes = [],
        canvas = this.canvas;
    for (var i = 0; i < maxFlake; i++) {
        flakes.push(new flakeMove(canvas.width, canvas.height, this.flakeSize, this.fallSpeed))
    }
}
/* 画雪 */
function drawSnow() {
    var maxFlake = this.maxFlake,
        flakes = this.flakes;
    ctx = this.ctx, canvas = this.canvas, that = this;
    /* 清空雪花 */
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    for (var e = 0; e < maxFlake; e++) {
        flakes[e].update();
        flakes[e].render(ctx);
    }
    /*  一帧一帧的画 */
    this.loop = requestAnimationFrame(function() {
        drawSnow.apply(that);
    });
}
/* 调用及控制方法 */
var snow = new snowFall({maxFlake:60});
snow.start();
```

在 _config.butterfly.yml 文件的 inject 的 bottom 处引入上面的代码

```yaml
- <script defer src="/js/snow2.js"></script>
```

### 修改网站图标

修改 _config.butterfly.yml 文件

```yaml
# Favicon（網站圖標）
favicon: /img/favicon.png
```

效果

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220601162101.png)

### 最新评论

最新评论只会在刷新时才会去读取，并不会实时变化。

由于 API 有 访问次数限制，为了避免调用太多，主题默认存取期限为 10 分钟。也就是説，调用后资料会存在 localStorage 里，10分钟内刷新网站只会去 localStorage 读取资料。 10 分钟期限一过，刷新页面时才会去调取 API 读取新的数据。

在侧边栏显示最新评论板块。

修改 _config.butterfly.yml 文件

```yaml
# Aside widget - Newest Comments
newest_comments:
  enable: true
  sort_order: # Don't modify the setting unless you know how it works
  limit: 6
  storage: 10 # unit: mins, save data to localStorage
  avatar: true
```

本人选择的是 [Valine](https://valine.js.org/) 评论，Valine 诞生于2017年8月7日，是一款基于LeanCloud的快速、简洁且高效的无后端评论系统。关于怎么配置 valine 评论可以参考我的 Hexo快速搭建一个博客-ubuntu 博文。

登录 [LeanCloud](https://leancloud.app/) 进入设置 Valine 那个应用。

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220602221758.png)

点击 设置 > 应用凭证 > 服务器地址 > REST API 服务器地址，复制 `REST APT 服务器地址`。将 `REST APT 服务器地址`填入到 _config.butterfly.yml 文件的 valine 的 serverURLs。

```yaml
# valine
# https://valine.js.org
valine:
  appId:
  appKey:
  avatar: monsterid # gravatar style https://valine.js.org/#/avatar
  serverURLs: # This configuration is suitable for domestic custom domain name users, overseas version will be automatically detected (no need to manually fill in)
  bg: # valine background
  visitor: false
  option:
  lang: zh_CN
```

效果

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220602223237.png)

### Twikoo 和 Valine 双评论

[Twikoo](https://twikoo.js.org/) 是一个简洁、安全、免费的静态网站评论系统，基于腾讯云开发。

>A simple, safe, free comment system based on Tencent CloudBase (tcb).

{% label 特色 pink %}

- 支持回复、{% label 点赞 purple %}

- 无需额外适配、支持搭配浅色主题与深色主题使用

- 支持 API 调用、批量获取文章评论数、最新评论

- 访客在昵称栏输入 QQ 号，会自动补全 QQ 昵称和 QQ 邮箱

- {% span cyan, 访客填写数字 QQ 邮箱，会使用 QQ 头像作为评论头像 %}

- 支持评论框粘贴图片（可禁用）

- 支持插入图片（可禁用）

- 支持 7bu image bed, Tencent CloudBase image bED

- 支持插入表情（可禁用）

- 支持 Ctrl + Enter 快捷回复

- 评论框内容实时保存草稿，刷新不会丢失

- 支持 {% span blue, Katex %} 公式

- {% span cyan, 支持按语言的代码高亮 %}

官方部署文档-[Twikoo 文档-快速上手](https://twikoo.js.org/quick-start.html)

Twikoo 分为云函数和前端两部分，部署时请注意保持二者版本一致。

- 云函数部署有 4 种方式，一键部署、手动部署、命令行部署和 Vercel 部署。

- 前端部署有 2 种方式，如果您的网站主题支持 Twikoo，您只需在配置文件中指定 Twikoo 即可；如果您的网站主题不支持 Twikoo，您需要修改源码手动引入 Twikoo 的 js 文件并初始化。

{% label 云函数部署 pink %}

|部署方式|描述|
|:-:|:-:|
|一键部署|[ 不建议 ] 虽然方便，但是仅支持按量计费环境——也就是说，一键部署的环境，当免费资源用尽后，将会产生费用。且按量计费环境无法切换为包年包月环境。免费额度数据库读操作数只有 500 次 / 天，无法支撑 Twikoo 的运行需求。|
|手动部署|[ 建议 ] 手动部署到腾讯云云开发环境，在中国大陆访问速度较快。由于基础版 1 已从 0 元涨价至 6.9 元 / 月，需要付费购买环境才能部署。|
|命令行部署|[ 不建议 ] 仅针对有 Node.js 经验的开发者。|
|Vercel 部署|[ 建议 ] 适用于想要免费部署的用户，在中国大陆访问速度较慢。|

{% label Vercel部署 pink %}

[查看官方视频教程](https://www.bilibili.com/video/BV1Fh411e7ZH)

1. 申请 [MongoDB](https://www.mongodb.com/cloud/atlas/register) 账号

2. 创建免费 MongoDB 数据库，区域推荐选择 `AWS / N. Virginia (us-east-1)`

3. 在 Clusters 页面点击 CONNECT，按步骤设置允许所有 IP 地址的连接，创建数据库用户，并记录数据库连接字符串，请将连接字符串中的 `<password>` 修改为数据库密码

4. 申请 [Vercel](https://vercel.com/signup) 账号

5. [Twikoo 一键部署到 Vercel](https://vercel.com/import/project?template=https://github.com/imaegoo/twikoo/tree/main/src/vercel-min)

6. 进入 Settings - Environment Variables，添加环境变量 MONGODB_URI，值为第 3 步的数据库连接字符串

7. 进入 Deployments , 然后在任意一项后面点击更多（三个点） , 然后点击 Redeploy , 最后点击下面的 Redeploy

8. 进入 Overview，点击 Domains 下方的链接，如果环境配置正确，可以看到 “Twikoo 云函数运行正常” 的提示

9. Vercel Domains（包含 https:// 前缀，例如 https://xxx.vercel.app）即为您的环境 id，如我的 `https://twikoo-lemon-theta.vercel.app/`

{% label 前端部署 pink %}

[Hexo Butterfly](https://github.com/jerryc127/hexo-theme-butterfly) 主题已经支持 Twikoo 评论系统了，我们只需在 _config.butterfly.yml 文件中配置一下就可以了。

请参考[Butterfly 安裝文檔(四) 主題配置-2](https://butterfly.js.org/posts/ceeb73f/#%E8%A9%95%E8%AB%96)进行配置。

由于之前我们已经有 Valine 评论了，因此我们能够开启双评论了。

配置 _config.butterfly.yml 文件

```yaml
# Comments System
# --------------------------------------

comments:
  # Up to two comments system, the first will be shown as default
  # Choose: Disqus/Disqusjs/Livere/Gitalk/Valine/Waline/Utterances/Facebook Comments/Twikoo/Giscus
  use: Twikoo,Valine # Valine,Disqus
  text: true # Display the comment name next to the button
  # lazyload: The comment system will be load when comment element enters the browser's viewport.
  # If you set it to true, the comment count will be invalid
  lazyload: false
  count: true # Display comment count in post's top_img
  card_post_count: true # Display comment count in Home Page
```

配置 _config.butterfly.yml 文件，环境 ID(envId) 为前面的 Vercel Domains（如 `https://twikoo-lemon-theta.vercel.app/`）

```yaml
# Twikoo
# https://github.com/imaegoo/twikoo
twikoo:
  envId: https://twikoo-lemon-theta.vercel.app/
  region:
  visitor: false
  option:
```

{% label 效果 green %}

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220603212433.png)

### 结语

第十二篇博文写完，开心！！！！

今天，也是充满希望的一天。