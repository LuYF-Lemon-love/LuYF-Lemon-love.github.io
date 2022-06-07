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

7. [部署Twikoo评论系统及其邮件推送(Vercel)](https://blog.csdn.net/weixin_58068682/article/details/122770936?spm=1001.2014.3001.5506)

8. [hexo搭建个人博客（提高篇）](https://zhuanlan.zhihu.com/p/134242598)

9. [Hexo 官方文档-引用文章](https://hexo.bootcss.com/docs/tag-plugins.html#%E5%BC%95%E7%94%A8%E6%96%87%E7%AB%A0)

10. [信笺样式留言板](https://akilar.top/posts/e2d3c450/)

11. [添加白天夜间模式转换动画](https://akilar.top/posts/d9550c81/)

12. [给博客添加个性名片](https://akilar.top/posts/5ff2da64/)

13. [twikoo评论块气泡风格魔改美化](https://akilar.top/posts/d99b5f01/)

14. [Butterfly comment board beautify](https://akilar.top/posts/397b8b90/)

15. [如何快速备案您的网站](https://cloud.tencent.com/document/product/243/39038)

16. [Butterfly 安装文档(三) 主题配置-1-页脚自定义文本](https://butterfly.js.org/posts/4aa8abbe/#%E9%A0%81%E8%85%B3%E8%87%AA%E5%AE%9A%E7%BE%A9%E6%96%87%E6%9C%AC)

17. [html语法大全](https://blog.csdn.net/weixin_44954230/article/details/124298478?spm=1001.2014.3001.5506)

18. [Butterfly 安裝文檔(四) 主題配置-2-footer 背景](https://butterfly.js.org/posts/ceeb73f/#footer-%E8%83%8C%E6%99%AF)

19. [二级域名的活用方法](https://akilar.top/posts/8250e594/)

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

- 支持 7bu image bed, Tencent CloudBase image bed

- 支持插入表情（可禁用）

- 支持 Ctrl + Enter 快捷回复

- 评论框内容实时保存草稿，刷新不会丢失

- 支持 {% span blue, Katex %} 公式

- 支持邮件提醒（访客和博主）

- 支持自定义{% label “博主” pink %}标识文字

- 内嵌式管理面板，通过密码登录，可以方便地查看评论、隐藏评论、删除评论、修改配置

- 支持隐藏管理入口，通过输入暗号显示

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

9. Vercel Domains（包含 https:// 前缀，例如 `https://xxx.vercel.app` ）即为您的环境 id，如我的 `https://twikoo-lemon-theta.vercel.app/`

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

配置 _config.butterfly.yml 文件，环境 ID(envId) 为前面的 Vercel Domains（如 `https://twikoo-lemon-theta.vercel.app/`），开启 visitor 后，文章页的访问人数将改为 Twikoo 提供，而不是 不蒜子。

```yaml
# Twikoo
# https://github.com/imaegoo/twikoo
twikoo:
  envId: https://twikoo-lemon-theta.vercel.app/
  region:
  visitor: true #false
  option:
```

{% label 效果 green %}

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220603212433.png)

{% label 开通POP3/SMTP服务 pink %}

以 QQ 邮箱为例，登录 QQ 邮箱 > 设置 > 账号 > POP3/IMAP/SMTP/Exchange/CardDAV/CalDAV服务，开启 POP3/SMTP 服务

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220603230320.png)

需要用 QQ 绑定的手机发送短信，获得授权码（{% label 需要留存，后面要用 green %}）。

进入你的博客的评论区，点击右下角的设置按钮，注册账号并登录，你就可以配置你的评论区了。

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220603230715.png)

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220603230840.png)

点击配置管理，进行常规配置，点击保存。

```
通用

BLOGGER_NICK：博主的昵称。
BLOGGER_EMAIL：博主的邮箱地址，用于邮件通知、博主标识。
MASTER_TAG：博主标识自定义文字，默认为 “博主”。
HIDE_ADMIN_CRYPT：隐藏管理面板入口。可设置一个“暗号”，只有在“昵称”一栏输入相同的“暗号”时，管理面板入口才会显示，留空则不隐藏管理入口
```

效果如下，只有在昵称输入暗号才能显示管理面板入口。

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220603231854.png)

{% label 配置邮件通知服务 orange %}

配置管理 > 邮件通知

```
SENDER_EMAIL: <你的QQ邮箱地址>
SMTP_SERVICE: <你的邮件服务提供商>
SMTP_HOST: <自定义 SMTP 服务器地址>
SMTP_PORT: <自定义 SMTP 端口>
SMTP_SECURE: <自定义 SMTP 是否使用 TLS>
SMTP_USER: <邮件通知邮箱用户名>(需与SENDER_EMAIL一致)
SMTP_PASS: <邮件通知邮箱密码>(授权码)
```

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220603232406.png)

拉到最下方点击保存后，打开邮件通知测试，输入你的邮箱，点击发送测试邮件，如果能成功收到邮件即说明邮件通知服务设置成功！

然后用其他的 QQ 在你的博客的评论区评论，你会收到邮件通知。

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220603232733.png)

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220603232805.png)

{% label 按语言的代码高亮 pink %}

Twikoo 管理面板 > 插件，如下图设置，点击保存。

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220604150346.png)

在评论框输入下面代码（按 Markdown 格式)，这里加了括号是为了防止转义，因为这篇博文是使用 Markdown 写的。

```markdown
(```)html
<script>
    // Just a lil’ script to show off that inline JS gets highlighted
    window.console && console.log('foo');
</script>
<meta charset="utf-8" />
<link rel="icon" href="assets/favicon.png" />
<title>Prism</title>
<link rel="stylesheet" href="assets/style.css" />
<link rel="stylesheet" href="themes/prism.css" data-noprefix />
<script src="assets/vendor/prefixfree.min.js"></script>
(```)
```

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220604150045.png)

{% label 效果 pink %}

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220604150307.png)

{% label 显示用户系统、浏览器和用户IP到省 pink %}

Twikoo 管理面板 > 隐私，如下图设置，点击保存。

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220605223433.png)

{% label 设置前 pink %}

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220605223743.png)

{% label 设置后(需要新添一个评论，刷新评论系统) pink %}

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220605223926.png)

### 引用站内文章

[Hexo 官方文档-引用文章](https://hexo.bootcss.com/docs/tag-plugins.html#%E5%BC%95%E7%94%A8%E6%96%87%E7%AB%A0)

```markdown
{% post_link filename [title] [escape] %}
```

在使用此标签时可以忽略文章文件所在的路径或者文章的永久链接信息、如语言、日期。

例如，在文章中使用 `{% post_link how-to-bake-a-cake %}` 时，只需有一个名为 how-to-bake-a-cake.md 的文章文件即可。

默认链接文字是文章的标题，你也可以自定义要显示的文本。

默认对文章的标题和自定义标题里的特殊字符进行转义。可以使用 escape 选项，禁止对特殊字符进行转义。

```markdown
{% post_link C-11新特性初探-ubuntu %}

{% post_link C-11新特性初探-ubuntu 'C++11 新特性' %}

{% post_link C-11新特性初探-ubuntu '<b> C++11 </b> 新特性' %}

{% post_link C-11新特性初探-ubuntu '<b> C++11 </b> 新特性' false %}
```

{% label 效果 pink %}

---

{% post_link C-11新特性初探-ubuntu %}

---

{% post_link C-11新特性初探-ubuntu 'C++11 新特性' %}

---

{% post_link C-11新特性初探-ubuntu '<b> C++11 </b> 新特性' %}

---

{% post_link C-11新特性初探-ubuntu '<b> C++11 </b> 新特性' false %}

---

### 信笺样式留言板

原作者的教程：[信笺样式留言板](https://akilar.top/posts/e2d3c450/)

1. 安装插件

```shell
npm install hexo-butterfly-envelope --save
```

2. 在 _config.butterfly.yml 文件添加配置项

```yaml
# envelope_comment
# see https://akilar.top/posts/e2d3c450/
envelope_comment:
  enable: true #控制开关
  custom_pic:      
    cover: https://npm.elemecdn.com/hexo-butterfly-envelope/lib/violet.jpg #信笺头部图片
    line: https://npm.elemecdn.com/hexo-butterfly-envelope/lib/line.png #信笺底部图片
    beforeimg: https://npm.elemecdn.com/hexo-butterfly-envelope/lib/before.png # 信封前半部分
    afterimg: https://npm.elemecdn.com/hexo-butterfly-envelope/lib/after.png # 信封后半部分
  message: #信笺正文，多行文本，写法如下
    - 有什么想问的？
    - 有什么想说的？
    - 有什么想吐槽的？
    - 哪怕是有什么想吃的，都可以告诉我哦~
  bottom: 自动书记人偶竭诚为您服务！ #仅支持单行文本
  height: #1050px，信封划出的高度
  path: Message #【可选】comments 的路径名称。默认为 comments，生成的页面为 comments/index.html
  front_matter: #【可选】comments页面的 front_matter 配置
    title: 留言板
    comments: true
    top_img: https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220511162303.png
```

path: 是你留言板所在的目录，如我的为 `blog/source/Message/index.md`，因此我填写 Message。

下图是原作者关于这个问题的回答。

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220604213335.png)

{% label 效果 pink %}

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220605115803.png)

### 代码框展开/关闭

在默认情况下，代码框自动展开，可设置是否所有代码框都关闭状态，点击>可展开代码

- true 全部代码框不展开，需点击 > 打开

- false 代码框展开，有 > 点击按钮

- none 不显示 > 按钮

修改 _config.butterfly.yml 文件

```yaml
highlight_shrink: true #代码框不展开，需点击 '>' 打开
```

### 添加白天夜间模式转换动画

原作者的教程：[添加白天夜间模式转换动画](https://akilar.top/posts/d9550c81/)

注：原作者很优秀，还有很多魔改内容，相信会让你满意，可以多多访问他的博客来支持他的创作。原作者的博客地址：[Akilarの糖果屋](https://akilar.top/)

1. 新建 blog/themes/butterfly/layout/includes/custom/sun_moon.pug 文件（如果没有路径中的 custom 目录，请新建 custom 目录），粘贴下面代码。

```pug
svg(aria-hidden='true', style='position:absolute; overflow:hidden; width:0; height:0')
  symbol#icon-sun(viewBox='0 0 1024 1024')
    path(d='M960 512l-128 128v192h-192l-128 128-128-128H192v-192l-128-128 128-128V192h192l128-128 128 128h192v192z', fill='#FFD878', p-id='8420')
    path(d='M736 512a224 224 0 1 0-448 0 224 224 0 1 0 448 0z', fill='#FFE4A9', p-id='8421')
    path(d='M512 109.248L626.752 224H800v173.248L914.752 512 800 626.752V800h-173.248L512 914.752 397.248 800H224v-173.248L109.248 512 224 397.248V224h173.248L512 109.248M512 64l-128 128H192v192l-128 128 128 128v192h192l128 128 128-128h192v-192l128-128-128-128V192h-192l-128-128z', fill='#4D5152', p-id='8422')
    path(d='M512 320c105.888 0 192 86.112 192 192s-86.112 192-192 192-192-86.112-192-192 86.112-192 192-192m0-32a224 224 0 1 0 0 448 224 224 0 0 0 0-448z', fill='#4D5152', p-id='8423')
  symbol#icon-moon(viewBox='0 0 1024 1024')
    path(d='M611.370667 167.082667a445.013333 445.013333 0 0 1-38.4 161.834666 477.824 477.824 0 0 1-244.736 244.394667 445.141333 445.141333 0 0 1-161.109334 38.058667 85.077333 85.077333 0 0 0-65.066666 135.722666A462.08 462.08 0 1 0 747.093333 102.058667a85.077333 85.077333 0 0 0-135.722666 65.024z', fill='#FFB531', p-id='11345')
    path(d='M329.728 274.133333l35.157333-35.157333a21.333333 21.333333 0 1 0-30.165333-30.165333l-35.157333 35.157333-35.114667-35.157333a21.333333 21.333333 0 0 0-30.165333 30.165333l35.114666 35.157333-35.114666 35.157334a21.333333 21.333333 0 1 0 30.165333 30.165333l35.114667-35.157333 35.157333 35.157333a21.333333 21.333333 0 1 0 30.165333-30.165333z', fill='#030835', p-id='11346')
```

2. 新建 blog/themes/butterfly/source/css/_layout/sun_moon.styl 文件，粘贴下面代码

```stylus
.Cuteen_DarkSky,
.Cuteen_DarkSky:before
  content ''
  position fixed
  left 0
  right 0
  top 0
  bottom 0
  z-index 88888888

.Cuteen_DarkSky
  background linear-gradient(#feb8b0, #fef9db)
  &:before
    transition 2s ease all
    opacity 0
    background linear-gradient(#4c3f6d, #6c62bb, #93b1ed)

.DarkMode
  .Cuteen_DarkSky
    &:before
      opacity 1

.Cuteen_DarkPlanet
  z-index 99999999
  position fixed
  left -50%
  top -50%
  width 200%
  height 200%
  -webkit-animation CuteenPlanetMove 2s cubic-bezier(0.7, 0, 0, 1)
  animation CuteenPlanetMove 2s cubic-bezier(0.7, 0, 0, 1)
  transform-origin center bottom


@-webkit-keyframes CuteenPlanetMove {
  0% {
    transform: rotate(0);
  }
  to {
    transform: rotate(360deg);
  }
}
@keyframes CuteenPlanetMove {
  0% {
    transform: rotate(0);
  }
  to {
    transform: rotate(360deg);
  }
}
.Cuteen_DarkPlanet
  &:after
    position absolute
    left 35%
    top 40%
    width 9.375rem
    height 9.375rem
    border-radius 50%
    content ''
    background linear-gradient(#fefefe, #fffbe8)

.search
  span
    display none

.menus_item
  a
    text-decoration none!important
//按钮相关，对侧栏按钮做过魔改的可以调整这里的数值
.icon-V
  padding 5px
```

3. 新建 blog/themes/butterfly/source/js/sun_moon.js 文件，粘贴下面代码

```js
function switchNightMode() {
  document.querySelector('body').insertAdjacentHTML('beforeend', '<div class="Cuteen_DarkSky"><div class="Cuteen_DarkPlanet"></div></div>'),
    setTimeout(function() {
      document.querySelector('body').classList.contains('DarkMode') ? (document.querySelector('body').classList.remove('DarkMode'), localStorage.setItem('isDark', '0'), document.getElementById('modeicon').setAttribute('xlink:href', '#icon-moon')) : (document.querySelector('body').classList.add('DarkMode'), localStorage.setItem('isDark', '1'), document.getElementById('modeicon').setAttribute('xlink:href', '#icon-sun')),
        setTimeout(function() {
          document.getElementsByClassName('Cuteen_DarkSky')[0].style.transition = 'opacity 3s';
          document.getElementsByClassName('Cuteen_DarkSky')[0].style.opacity = '0';
          setTimeout(function() {
            document.getElementsByClassName('Cuteen_DarkSky')[0].remove();
          }, 1e3);
        }, 2e3)
    })
  const nowMode = document.documentElement.getAttribute('data-theme') === 'dark' ? 'dark' : 'light'
  if (nowMode === 'light') {
    activateDarkMode()
    saveToLocal.set('theme', 'dark', 2)
    GLOBAL_CONFIG.Snackbar !== undefined && btf.snackbarShow(GLOBAL_CONFIG.Snackbar.day_to_night)
    document.getElementById('modeicon').setAttribute('xlink:href', '#icon-sun')
  } else {
    activateLightMode()
    saveToLocal.set('theme', 'light', 2)
    document.querySelector('body').classList.add('DarkMode'), document.getElementById('modeicon').setAttribute('xlink:href', '#icon-moon')
  }
  // handle some cases
  typeof utterancesTheme === 'function' && utterancesTheme()
  typeof FB === 'object' && window.loadFBComment()
  window.DISQUS && document.getElementById('disqus_thread').children.length && setTimeout(() => window.disqusReset(), 200)
}
```

4. 修改 blog/themes/butterfly/layout/includes/head.pug 文件，在文件末添加一行代码：

```diff
  //- global config
  !=partial('includes/head/config', {}, {cache: true})

  include ./head/config_site.pug
  include ./head/noscript.pug

  !=fragment_cache('injectHeadJs', function(){return inject_head_js()})

  !=fragment_cache('injectHead', function(){return injectHtml(theme.inject.head)})
+ include ./custom/sun_moon.pug
```

5. 修改 blog/themes/butterfly/layout/includes/rightside.pug 文件，替换原本的昼夜切换（注：每一行代码都比上一行往里缩进两个 space bar）

```diff
  when 'translate'
    if translate.enable
      button#translateLink(type="button" title=_p('rightside.translate_title'))= translate.default
  when 'darkmode'
    if darkmode.enable && darkmode.button
-     button#darkmode(type="button" title=_p('rightside.night_mode_title'))
-       i.fas.fa-adjust
+     a.icon-V.hidden(onclick='switchNightMode()',  title=_p('rightside.night_mode_title'))
+       svg(width='25', height='25', viewBox='0 0 1024 1024')
+         use#modeicon(xlink:href='#icon-moon')
```

如下图

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220606132725.png)

6. 在 _config.butterfly.yml 文件中的 inject 的 bottom 处添加

```yaml
- <script src="/js/sun_moon.js" async></script>
```

{% label 效果 pink %}

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220606133203.png)

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220606133301.png)

### 给博客添加个性化名片

原作者的教程：[给博客添加个性名片](https://akilar.top/posts/5ff2da64/)

注：原作者很优秀，还有很多魔改内容，相信会让你满意，可以多多访问他的博客来支持他的创作。原作者的博客地址：[Akilarの糖果屋](https://akilar.top/)

1. 新建 blog/themes/butterfly/layout/includes/custom/businesscard.pug 文件，粘贴下面代码

```pug
.business-center
  .business-card
    .business-flip
      .business-front
        .business-strip-bottom
        .business-strip-top
        img.business-logo(width="80" height="80" src=url_for(theme.businesscard.QR_code) alt="cardcode")

        .business-Invitation Invitation
        .business-chip
          .business-chip-line
          .business-chip-line
          .business-chip-line
          .business-chip-line
          .business-chip-main

        svg.business-wave(viewBox="0 3.71 26.959 38.787" width="26.959" height="38.787" fill="white")
          path(d="M19.709 3.719c.266.043.5.187.656.406 4.125 5.207 6.594 11.781 6.594 18.938 0 7.156-2.469 13.73-6.594 18.937-.195.336-.57.531-.957.492a.9946.9946 0 0 1-.851-.66c-.129-.367-.035-.777.246-1.051 3.855-4.867 6.156-11.023 6.156-17.718 0-6.696-2.301-12.852-6.156-17.719-.262-.317-.301-.762-.102-1.121.204-.36.602-.559 1.008-.504z")
          path(d="M13.74 7.563c.231.039.442.164.594.343 3.508 4.059 5.625 9.371 5.625 15.157 0 5.785-2.113 11.097-5.625 15.156-.363.422-1 .472-1.422.109-.422-.363-.472-1-.109-1.422 3.211-3.711 5.156-8.551 5.156-13.843 0-5.293-1.949-10.133-5.156-13.844-.27-.309-.324-.75-.141-1.114.188-.367.578-.582.985-.542h.093z")
          path(d="M7.584 11.438c.227.031.438.144.594.312 2.953 2.863 4.781 6.875 4.781 11.313 0 4.433-1.828 8.449-4.781 11.312-.398.387-1.035.383-1.422-.016-.387-.398-.383-1.035.016-1.421 2.582-2.504 4.187-5.993 4.187-9.875 0-3.883-1.605-7.372-4.187-9.875-.321-.282-.426-.739-.266-1.133.164-.395.559-.641.984-.617h.094zM1.178 15.531c.121.02.238.063.344.125 2.633 1.414 4.437 4.215 4.437 7.407 0 3.195-1.797 5.996-4.437 7.406-.492.258-1.102.07-1.36-.422-.257-.492-.07-1.102.422-1.359 2.012-1.075 3.375-3.176 3.375-5.625 0-2.446-1.371-4.551-3.375-5.625-.441-.204-.676-.692-.551-1.165.122-.468.567-.785 1.051-.742h.094z")

        .business-card-number
          .business-section=theme.businesscard.master

          .business-section=theme.businesscard.group

        .business-end
          span.business-end-text created:
          span.business-end-date=theme.businesscard.created

        .business-card-holder!=`${theme.businesscard.front}`
        .business-master
          .business-circle.business-master-red
          .business-circle.business-master-yellow    
      .business-back
        .business-strip-black
        .business-ccv
          label!=`${theme.businesscard.back1}`
          div!=`${theme.businesscard.back2}`
        .business-terms
          p!=`${theme.businesscard.back3}`
          p!=`${theme.businesscard.back4}`
```

2. 新建 blog/themes/butterfly/source/css/_layout/businesscard.styl 文件，粘贴下面代码

```stylus
//媒体选择，屏幕过窄则隐藏，需要则取消注释
// @media screen and (max-width: 450px)
//  .business-center
//  display: none!important
.business-center
  position: relative
  margin: 20px auto
  display: block
  left: calc(50% - 200px)

.business-card
  width: 400px
  height: 250px

@keyframes business-flip
  0%
  100%
    transform: rotateY(0deg)
  50%
    transform: rotateY(180deg)

.business-flip
  width: inherit
  height: inherit
  transition: 0.7s
  transform-style: preserve-3d
  animation: business-flip 2.5s ease

.business-front
.business-back
  position: absolute
  width: inherit
  height: inherit
  border-radius: 15px
  color: #fff
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.3)
  box-shadow: 0 1px 10px 1px rgba(0,0,0,0.3)
  backface-visibility: hidden
  background-image: linear-gradient(to right, #111, #555)
  overflow: hidden

.business-front
  transform: translateZ(0)

.business-strip-bottom
.business-strip-top
  position: absolute
  right: 0
  height: inherit
  background-image: linear-gradient(to bottom, #ff6767, #ff4545)
  box-shadow: 0 0 10px 0px rgba(0,0,0,0.5)

.business-strip-bottom
  width: 200px
  transform: skewX(-15deg) translateX(50px)

.business-strip-top
  width: 180px
  transform: skewX(20deg) translateX(50px)

.business-logo
  position: absolute
  top: 30px
  right: 25px

.business-Invitation
  position: relative
  top: 20px
  left: 25px
  text-transform: uppercase

.business-chip
  position: relative
  top: 30px
  left: 25px
  display: flex
  align-items: center
  justify-content: center
  width: 50px
  height: 40px
  border-radius: 5px
  background-image: linear-gradient(to bottom left, #ffecc7, #d0b978)
  overflow: hidden

  .business-chip-line
    position: absolute
    width: 100%
    height: 1px
    background-color: #333

    &:nth-child(1)
      top: 13px

    &:nth-child(2)
      top: 20px

    &:nth-child(3)
      top: 28px

    &:nth-child(4)
      left: 25px
      width: 1px
      height: 50px

  .business-chip-main
    width: 20px
    height: 25px
    border: 1px solid #333
    border-radius: 3px
    background-image: linear-gradient(to bottom left, #efdbab, #e1cb94)
    z-index: 1

.business-wave
  position: relative
  top: -10px
  left: 100px

.business-card-number
  position: relative
  display: flex
  justify-content: space-between
  align-items: center
  margin: 0px 25px 0px
  font-size: 23px
  font-family: 'cc font', monospace

.business-end
  margin-left: 25px
  text-transform: uppercase
  font-family: 'cc font', monospace

  .business-end-text
    font-size: 9px
    color: rgba(255, 255, 255, 0.8)

.business-card-holder
  margin: 5px 25px
  font-size: 14px
  text-transform: uppercase
  font-family: 'cc font', monospace

.business-master
  position: absolute
  right: 20px
  bottom: 20px
  display: flex

  .business-circle
    width: 25px
    height: 25px
    border-radius: 50%

  .business-master-red
    background-color: #eb001b
  .business-master-yellow
    margin-left: -10px
    background-color: rgba(255, 209, 0, 0.7)

.business-card
  perspective: 1000

  &:hover .business-flip
    transform: rotateY(180deg)

.business-back
  transform: rotateY(180deg) translateZ(0)
  background: #9e9e9e

.business-back
  .business-strip-black
    position: absolute
    top: 30px
    left: 0
    width: 100%
    height: 50px
    background: black

  .business-ccv
    position: absolute
    top: 110px
    left: 0
    right: 0
    height: 36px
    width: 90%
    padding: 10px
    margin: 0 auto
    border-radius: 5px
    text-align: right
    letter-spacing: 1px
    color: #000
    background: white

    label
      display: block
      margin: -30px 0 5px
      font-size: 10px
      text-transform: uppercase
      color: white
    div
      position: relative
      top: -5px
  .business-terms
    position: absolute
    top: 130px
    padding: 20px
    font-size: 10px
    text-align: justify

@font-face
  font-family: 'cc font'
  src: url("data:application/font-woff2;charset=utf-8;base64,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") format("woff2")
  font-weight: normal
  font-style: normal
```

3. 修改 blog/themes/butterfly/layout/post.pug 文件

```diff
  extends includes/layout.pug

  block content
    #post
      if top_img === false
        include includes/header/post-info.pug
      article#article-container.post-content!=page.content
+     if page.businesscard ? page.businesscard : theme.businesscard.enable
+       include includes/custom/businesscard.pug
      include includes/post/post-copyright.pug
      .tag_share
```

如下图

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220606150628.png)

4. 在 _config.butterfly.yml 文件中添加如下配置

```yaml
businesscard:
  enable: true #总开关
  QR_code: https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220606142536.png #加群二维码
  master: LuYF #群主ID
  group: 千万别在森林里迷路！ #QQ群号
  created: 06/19/2008 #建群时间
  front: 欢迎来到阿拉德！ #卡面正面描述语
  back1: 吾王之怒，响彻星辰；吾王之力，光照万世 #背面从上到下四行文字内容自定义
  back2: 战国空余恨，旧王泪无痕
  back3: 万物生自守恒，源力破则失正。莫以为敌消彼长，然乾坤逆之天崩。
  back4: 带着这样一把武器，绝对很有挑战性！
```

{% label 效果 pink %}

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220606150933.png)

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220606151008.png)

### Twikoo评论块气泡风格魔改美化

原作者的教程：[twikoo评论块气泡风格魔改美化](https://akilar.top/posts/d99b5f01/)

注：原作者很优秀，还有很多魔改内容，相信会让你满意，可以多多访问他的博客来支持他的创作。原作者的博客地址：[Akilarの糖果屋](https://akilar.top/)

1. 新建 blog/themes/butterfly/source/css/custom/twikoo_beautify.css 文件（如果没有路径中的 custom 目录，请新建），粘贴下面代码

```css
/* 自定义twikoo评论输入框高度 */
.tk-input[data-v-619b4c52] .el-textarea__inner {
  height: 130px !important;
}
/* 输入评论时自动隐藏输入框背景图片 */
.tk-input[data-v-619b4c52] .el-textarea__inner:focus {
  background-image: none !important;
}
/* 调整楼中楼样式 ，整体左移，贴合气泡化效果 */
.tk-replies {
  left: -70px;
  width: calc(100% + 70px);
}
/* 头像宽度调整 rem单位与全局字体大小挂钩，需配合自己情况调整大小以保证头像显示完整*/
.tk-replies .tk-avatar {
  width: 2.5rem !important;
  height: 2.5rem !important;
}
.tk-replies .tk-avatar img {
  width: 2.5rem !important;
  height: 2.5rem !important;
}
/* 回复框左移，避免窄屏时出框 */
.tk-comments-container .tk-submit {
  position: relative;
  left: -70px;
}
/* 评论块气泡化修改 */
.tk-content {
  background: #00a6ff; /*默认模式访客气泡配色*/
  padding: 10px;
  color: #fff; /*默认模式访客气泡字体配色*/
  border-radius: 10px;
  font-size: 16px !important;
  width: fit-content;
  max-width: 100%;
  position: relative !important;
  overflow: visible !important;
  max-height: none !important;
}
/* 修复图片出框 */
.tk-content img {
  max-width: 100% !important;
}
/* 修复过长文本出框 */
.tk-content pre {
  white-space: pre-wrap;
  word-wrap: break-word;
}
.tk-content a {
  color: #eeecaa; /*默认模式超链接配色*/
}
.tk-content::before {
  content: '';
  width: 0;
  height: 0;
  position: absolute;
  top: 20px;
  left: -13px;
  border-top: 2px solid transparent;
  border-bottom: 20px solid transparent;
  border-right: 15px solid #00a6ff; /*默认模式访客气泡小三角配色*/
  border-left: 0px solid transparent;
}
.tk-master .tk-content {
  background: #ff8080; /*默认模式博主气泡配色*/
  color: #fff; /*默认模式博主气泡字体配色*/
  width: fit-content;
  max-width: 100%;
}
.tk-master .tk-content a {
  color: #eeecaa;
}
.tk-master .tk-content::before {
  content: '';
  width: 0;
  height: 0;
  position: absolute;
  top: 20px;
  left: -13px;
  border-top: 2px solid transparent;
  border-bottom: 20px solid transparent;
  border-right: 15px solid #ff8080; /*默认模式博主气泡小三角配色*/
  border-left: 0px solid transparent;
}
.tk-row[data-v-d82ce9a0] {
  max-width: 100%;
  width: fit-content;
}
.tk-avatar {
  border-radius: 50%;
  margin-top: 10px;
}

/* 夜间模式配色，具体比照上方默认模式class */
[data-theme="dark"] .tk-content {
  background: #000;
  color: #fff;
}
[data-theme="dark"] .tk-content a {
  color: #dfa036;
}
[data-theme="dark"] .tk-content::before {
  border-right: 15px solid #000;
}
[data-theme="dark"] .tk-master .tk-content {
  background: #000;
  color: #fff;
}
[data-theme="dark"] .tk-master .tk-content a {
  color: #dfa036;
}
[data-theme="dark"] .tk-master .tk-content::before {
  border-top: 2px solid transparent;
  border-bottom: 20px solid transparent;
  border-right: 15px solid #000;
  border-left: 0px solid transparent;
}
/* 自适应内容 */
@media screen and (min-width: 1024px) {
  /* 设置宽度上限，避免挤压博主头像 */
  .tk-content {
    max-width: 75%;
    width: fit-content;
  }
  .tk-master .tk-content {
    width: 75%;
  }
  .tk-master .tk-content::before {
    left: 100%;
    border-left: 15px solid #ff8080;
    border-right: 0px solid transparent;
  }
  .tk-master .tk-avatar {
    position: relative;
    left: calc(75% + 70px);
  }
  .tk-master .tk-row[data-v-d82ce9a0] {
    position: relative;
    top: 0px;
    left: calc(75% - 230px);
  }
  [data-theme="dark"] .tk-master .tk-content::before {
    border-left: 15px solid #000;
    border-right: 0px solid transparent;
  }
}
/* 设备名称常态隐藏，悬停评论时显示 */
.tk-extras {
  opacity: 0;
  -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
  filter: alpha(opacity=0);
}
.tk-content:hover + .tk-extras {
  -webkit-animation: tk-extras-fadeIn 0.5s linear;
  -moz-animation: tk-extras-fadeIn 0.5s linear;
  -o-animation: tk-extras-fadeIn 0.5s linear;
  -ms-animation: tk-extras-fadeIn 0.5s linear;
  animation: tk-extras-fadeIn 0.5s linear;
  -webkit-animation-fill-mode: forwards;
  -moz-animation-fill-mode: forwards;
  -o-animation-fill-mode: forwards;
  -ms-animation-fill-mode: forwards;
  animation-fill-mode: forwards;
}
@-moz-keyframes tk-extras-fadeIn {
  from {
    opacity: 0;
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
    filter: alpha(opacity=0);
  }
  to {
    opacity: 1;
    -ms-filter: none;
    filter: none;
  }
}
@-webkit-keyframes tk-extras-fadeIn {
  from {
    opacity: 0;
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
    filter: alpha(opacity=0);
  }
  to {
    opacity: 1;
    -ms-filter: none;
    filter: none;
  }
}
@-o-keyframes tk-extras-fadeIn {
  from {
    opacity: 0;
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
    filter: alpha(opacity=0);
  }
  to {
    opacity: 1;
    -ms-filter: none;
    filter: none;
  }
}
@keyframes tk-extras-fadeIn {
  from {
    opacity: 0;
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
    filter: alpha(opacity=0);
  }
  to {
    opacity: 1;
    -ms-filter: none;
    filter: none;
  }
}
```

2. 在 _config.butterfly.yml 文件中的 inject 的 head 处引用样式表

```yaml
- <link rel="stylesheet" href="/css/custom/twikoo_beautify.css"  media="defer" onload="this.media='all'">
```

{% label 修改前 pink %}

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220606161522.png)

{% label 修改后 pink %}

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220606161608.png)

### Butterfly comment board beautify

原作者的教程：[Butterfly comment board beautify](https://akilar.top/posts/397b8b90/)

注：原作者很优秀，还有很多魔改内容，相信会让你满意，可以多多访问他的博客来支持他的创作。原作者的博客地址：[Akilarの糖果屋](https://akilar.top/)

1. 新建 blog/themes/butterfly/source/css/custom/fixed_comment.css 文件，粘贴下面代码

```css
div#post-comment.fixedcomment {
    position: fixed;
    top: 0;
    width: 60%;
    right: 0;
    padding: 25px 30px 20px 20px;
    height: 100vh;
    overflow: scroll;
    z-index: 90;
    background: rgba(222, 222, 222, 0.95);
    box-shadow:3px 2px 14px #464340;
    animation: fixedright 0.5s linear;
}
div#post-comment.fixedcomment::-webkit-scrollbar {
width: 0;
}
div#quit-board{
  display: none;
}
div#quit-board.fixedcomment {
  position: fixed;
  display:block!important;
  left: 0;
  top: 0;
  width: 40%;
  height: 100vh;
  z-index: 89!important;
  background: rgba(25,25,25,0.3);
  filter: blur(4px) !important;
  animation: fixedleft 0.5s linear;
}
/*手机端样式适配*/
@media screen and (max-width: 768px) {
  div#post-comment.fixedcomment {
      width: 90%;
      right: 0;
  }
  div#quit-board.fixedcomment {
    width: 10%;
  }
}
/*动画效果*/
@keyframes fixedright {
  from {right:-50%;}
  to {right:0;}
}
@keyframes fixedleft {
  from {left:-50%;}
  to {left:0;}
}
/* 夜间模式匹配 */
[data-theme="dark"]
  div#post-comment.fixedcomment {
      background: rgba(35, 35, 35, 0.95);
      box-shadow:3px 2px 12px #90a1a4;
  }
[data-theme="dark"]
  div#quit-board.fixedcomment {
    background: rgba(147, 146, 128, 0.3);
  }
```

2. 新建 blog/themes/butterfly/source/js/custom/fixed_comment.js 文件（如果没有路径中的 custom 目录，请新建），粘贴下面代码

```js
//移除FixedComment类，保持原生样式，确保不与最新评论跳转冲突
function RemoveFixedComment() {
  var activedItems = document.querySelectorAll('.fixedcomment');
  if (activedItems) {
    for (i = 0; i < activedItems.length; i++) {
      activedItems[i].classList.remove('fixedcomment');
    }
  }
}
//给post-comment添加fixedcomment类
function AddFixedComment(){
  var commentBoard = document.getElementById('post-comment');
  var quitBoard = document.getElementById('quit-board');
  commentBoard.classList.add('fixedcomment');
  quitBoard.classList.add('fixedcomment');
}
//创建一个蒙版，作为退出键使用
function CreateQuitBoard(){
  var quitBoard = `<div id="quit-board" onclick="RemoveFixedComment()"></div>`
  var commentBoard = document.getElementById('post-comment');
  commentBoard.insertAdjacentHTML("beforebegin",quitBoard)
}

function FixedCommentBtn(){
  //第一步，判断当前是否存在FixedComment类，存在则移除，不存在则添加
  // 获取评论区对象
  var commentBoard = document.getElementById('post-comment');
  // 若评论区存在
  if (commentBoard) {
      // 判断是否存在fixedcomment类
      if (commentBoard.className.indexOf('fixedcomment') > -1){
        // 存在则移除
        RemoveFixedComment();
      }
      else{
        // 不存在则添加
        CreateQuitBoard();
        AddFixedComment();
      }
  }
  // 若不存在评论区则跳转至留言板(留言板路径记得改为自己的)
  else{
    // 判断是否开启了pjax，尽量不破坏全局吸底音乐刷新
      if (pjax){
        pjax.loadUrl("/comments/#post-comment");
      }
      else{
        window.location.href = "/comments/#post-comment";
      }
  }
}
//切换页面先初始化一遍，确保开始时是原生状态。所以要加pjax重载。
RemoveFixedComment();
```

3. 在 _config.butterfly.yml 的 inject 处引入上面的 css 和 js

```diff
  inject:
    head:
+     - <link rel="stylesheet" href="/css/custom/fixed_comment.css"  media="defer" onload="this.media='all'">
    bottom:
+     - <script data-pjax defer src="/js/custom/fixed_comment.js"></script>
```

4. 修改 blog/themes/butterfly/layout/includes/rightside.pug 文件

```diff
  if commentsJsLoad
-   a#to_comment(href="#post-comment" title=_p("rightside.scroll_to_comment"))
+   button#to_comment(type="button" title=_p("rightside.scroll_to_comment") onclick="FixedCommentBtn();")
```

{% label 请按右下角的直达评论按钮 pink %}

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220606164848.png)

{% label 效果 pink %}

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220606164945.png)

### 腾讯云备案

由于我是从腾讯云上买的域名和轻量应用服务器，所以可以从腾讯云上免费备案。关于如何使用和配置轻量应用服务器可以参考之前博文 {% post_link Hexo快速搭建一个博客-ubuntu %}

>如果您使用中国大陆境内的服务器开办网站，则必须先办理网站备案，备案成功并获取通信管理局下发的 ICP 备案号后才能开通访问。

腾讯云官方备案教程：[如何快速备案您的网站](https://cloud.tencent.com/document/product/243/39038)

备案可以使用微信小程序，个人博客备案比较简单，只需要身份证。

从 5 月 25 日晚在小程序上提交备案到 6 月 6 日下午备案成功，一共花了 12 天。

注：前两天，腾讯云客服会和你进行电话沟通你之前提交信息的问题。然后就是管局审核。细节问题都会短信或者电话通知。服务态度都特别好。

备案成功后 工业和信息化部（早一点） 和 腾讯云 都会给你发短信和电子邮件通知你。

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220606184048.png)

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220606184259.png)

在备案成功后，也请您按照管局要求将网站备案号展示在网站首页底部，并链接到[工信部首页](https://beian.miit.gov.cn)。

修改 _config.butterfly.yml 文件的页脚设置

```yaml
# Footer Settings
# --------------------------------------
footer:
  owner:
    enable: true
    since: 2022
  custom_text: 
    - <a href="https://beian.miit.gov.cn"><span>冀ICP备2022012632号-1</span></a><br/><span>感谢光临小破站，欢迎您提出宝贵的意见！</span>
  copyright: true # Copyright of theme and framework
```

由于用 普通的页脚养鱼会遮挡住 备案/许可证编号，所以我们将 页脚养鱼设置为 页脚彩色养鱼

修改 _config.butterfly.yml 文件的 inject 的 bottom 处

```diff
+ - <script defer src="/js/colorfishes.js"></script> # 页脚养鱼(彩色)    
- - <script defer src="/js/fishes.js"></script>
```

由于 页脚彩色养鱼 在页脚底部会有很大的空白，因此可以在页脚添加背景图片。

修改 _config.butterfly.yml 文件

```yaml
# Footer Background
footer_bg: https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220607151451.png #false
```

{% label 效果 pink %}

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220607220645.png)

### 建立分站-绑定域名（Github-Vercel-轻量应用服务器）

前言：阿里云的免费 DNS 解析套餐 线路类型支持境外，可以做到境外访问的是 Github 的服务器，境内访问的是自己的轻量应用服务器，但是腾讯云的免费 DNS 解析套餐不支持境外线路类型，因此无法做到自动分流，我们只能在顶部的菜单栏建立分站，来使得用户可以选择不同线路类型来加速访问。

{% label 腾讯云域名绑定到 Github 上 pink %}

1. 然后进入[腾讯云 DNS 解析控制台](https://console.cloud.tencent.com/cns)，点击你的域名的解析按钮，点击 前往 DNSPod 控制台点击添加记录按钮，如图

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220607222452.png)

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220607222739.png)

```
主机记录：填写子域名。例如，添加 www.123.com 的解析，您在 “主机记录” 处选择 “www” 即可。如果只是想添加 123.com 的解析，您在 “主机记录” 处选择 “@” 即可。“@” 的 CNAME 会影响到 MX 记录的正常解析，添加时请您慎重考虑。
```

<table>
<tr>
<th>记录类型</th>
<th>使用目的</th>
</tr>
<tr>
<td><a href="https://cloud.tencent.com/document/product/302/3449">A 记录</a></td>
<td>将域名指向一个 IP 地址（外网地址）。</td>
</tr>
<tr>
<td><a href="https://cloud.tencent.com/document/product/302/3450">CNAME 记录</a></td>
<td>将域名指向另一个域名，再由另一个域名提供 IP 地址（外网地址）。</td>
</tr>
<tr>
<td><a href="https://cloud.tencent.com/document/product/302/3451">MX 记录</a></td>
<td>设置邮箱，让邮箱能收到邮件。</td>
</tr>
<tr>
<td><a href="https://cloud.tencent.com/document/product/302/3452">NS 记录</a></td>
<td>将子域名交给其他 DNS 服务商解析。</td>
</tr>
<tr>
<td><a href="https://cloud.tencent.com/document/product/302/3453">AAAA 记录</a></td>
<td>将域名指向一个 IPv6 地址。</td>
</tr>
<tr>
<td><a href="https://cloud.tencent.com/document/product/302/12647">SRV 记录</a></td>
<td>用来标识某台服务器使用了某个服务，常见于微软系统的目录管理。</td>
</tr>
<tr>
<td><a href="https://cloud.tencent.com/document/product/302/12648">TXT 记录</a></td>
<td>对域名进行标识和说明，绝大多数的 TXT 记录是用来做 SPF 记录（反垃圾邮件）。</td>
</tr>
</tr>
<tr>
<td><a href="https://cloud.tencent.com/document/product/302/12649">隐、显性 URL 记录</a></td>
<td>将一个域名指向另外一个已经存在的站点。</td>
</tr>
</table>

2. 为了使访客用不用 www 都可以访问博客，我们添加两条记录，注意：我们选择 CNAME 记录类型，记录值填写 **你的 Github 用户名.github.io**，如图（下面的第二张图是 DNSPod 控制台的这一节配置完成的最终图，本步添加的记录仅有第一张图的两条 Github 记录）

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220521205412.png)

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220607222928.png)

3. 进入你的 Github 博客所在仓库的设置页面，点击 Pages，在 Custom domain 处修改域名为你之前买的域名，并勾选 Enforce HTTPS，然后点击 Save。如图

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220521210424.png)

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220521210459.png)

4. 在 blog/source 目录下新建一个 CNAME 文件，填入你的域名。

```
luyf-lemon-love.space
```

5. 然后一键三连，过不了多久，再打开你的浏览器，输入你自己的域名，就可以看到搭建的网站啦！

```shell
hexo clean
hexo g
hexo d
```

6. 在 DNSPod 控制台，你可以点击下图的 @ 记录的 SSL 按钮申请免费的 SSL 证书，该证书能让用户以 HTTPS 的方式访问该网站。（由于我已经申请过了，所以按钮是绿色，如果没有申请是灰色，申请过程是傻瓜式操作，10 分钟就可以完成，Github 会自动安装，我们只需要申请就可以了。我们给 @ 记录申请 SSL 证书，www 记录会获得 SSL 证书的）

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220607224623.png)

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220607224351.png)

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220607224314.png)

{% label 腾讯云域名绑定到 Vercel 上 pink %}

### 结语

第十二篇博文写完，开心！！！！

今天，也是充满希望的一天。