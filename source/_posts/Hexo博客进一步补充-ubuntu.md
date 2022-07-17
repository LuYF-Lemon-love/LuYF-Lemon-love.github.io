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
cover: >-
  https://cos.luyf-lemon-love.space/images/noxus-bastion..png
abbrlink: 1285055319
date: 2022-07-16 19:41:36
---

### 前言

前两篇搭建博客的博文—— {% post_link Hexo快速搭建一个博客-ubuntu %} 和 {% post_link Hexo博客补充-ubuntu %}，虽然已经介绍了方方面面，但是还有一些遗漏之处，并且它们包含的内容过多，导致它的加载很缓慢，影响观看。因此本篇博文将作为它们的补充为大家介绍其他内容。

操作系统：Ubuntu 20.04.4 LTS

### 参考文档

1. [注册谷歌账号时手机号码不能验证？（最新解决办法）](https://blog.aftss.cn/1642.html)

2. [Hexo页脚养鱼效果](https://cnhuazhu.top/butterfly/2021/02/19/Hexo%E9%AD%94%E6%94%B9/Hexo%E9%A1%B5%E8%84%9A%E5%85%BB%E9%B1%BC%E6%95%88%E6%9E%9C/)

3. [网站背景](https://butterfly.js.org/posts/ceeb73f/#%E7%B6%B2%E7%AB%99%E8%83%8C%E6%99%AF)

4. [代码框展开/关闭](https://butterfly.js.org/posts/4aa8abbe/#%E4%BB%A3%E7%A2%BC%E6%A1%86%E5%B1%95%E9%96%8B-x2F-%E9%97%9C%E9%96%89)

5. [Hexo在顶部增加天气小部件](https://cnhuazhu.top/butterfly/2021/02/24/Hexo%E9%AD%94%E6%94%B9/Hexo%E5%9C%A8%E9%A1%B6%E9%83%A8%E5%A2%9E%E5%8A%A0%E5%A4%A9%E6%B0%94%E5%B0%8F%E9%83%A8%E4%BB%B6/)

6. [Gitcalendar](https://akilar.top/posts/1f9c68c9/)

7. [Sidebar Card Clock](https://akilar.top/posts/4e39cf4a/)

8. [Hexo侧边栏添加微博热搜](https://cnhuazhu.top/butterfly/2022/06/23/Hexo%E9%AD%94%E6%94%B9/Hexo%E4%BE%A7%E8%BE%B9%E6%A0%8F%E6%B7%BB%E5%8A%A0%E5%BE%AE%E5%8D%9A%E7%83%AD%E6%90%9C/)

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

### 灰色养鱼

本节是在 {% post_link Hexo快速搭建一个博客-ubuntu %} 中养鱼的基础——`5.6 页脚养鱼` 和 `11.2 页脚养鱼` 上实现的。

原教程链接：[Hexo页脚养鱼效果](https://cnhuazhu.top/butterfly/2021/02/19/Hexo%E9%AD%94%E6%94%B9/Hexo%E9%A1%B5%E8%84%9A%E5%85%BB%E9%B1%BC%E6%95%88%E6%9E%9C/)

1. 新建 blog/themes/butterfly/source/js/fish.js 文件，粘贴下面代码。

```js
var RENDERER = {
	POINT_INTERVAL : 5,
	FISH_COUNT : 3,
	MAX_INTERVAL_COUNT : 50,
	INIT_HEIGHT_RATE : 0.5,
	THRESHOLD : 50,
	
	init : function(){
		this.setParameters();
		this.reconstructMethods();
		this.setup();
		this.bindEvent();
		this.render();
	},
	setParameters : function(){
		this.$window = $(window);
		this.$container = $('#jsi-flying-fish-container');
		this.$canvas = $('<canvas />');
		this.context = this.$canvas.appendTo(this.$container).get(0).getContext('2d');
		this.points = [];
		this.fishes = [];
		this.watchIds = [];
	},
	createSurfacePoints : function(){
		var count = Math.round(this.width / this.POINT_INTERVAL);
		this.pointInterval = this.width / (count - 1);
		this.points.push(new SURFACE_POINT(this, 0));
		
		for(var i = 1; i < count; i++){
			var point = new SURFACE_POINT(this, i * this.pointInterval),
				previous = this.points[i - 1];
				
			point.setPreviousPoint(previous);
			previous.setNextPoint(point);
			this.points.push(point);
		}
	},
	reconstructMethods : function(){
		this.watchWindowSize = this.watchWindowSize.bind(this);
		this.jdugeToStopResize = this.jdugeToStopResize.bind(this);
		this.startEpicenter = this.startEpicenter.bind(this);
		this.moveEpicenter = this.moveEpicenter.bind(this);
		this.reverseVertical = this.reverseVertical.bind(this);
		this.render = this.render.bind(this);
	},
	setup : function(){
		this.points.length = 0;
		this.fishes.length = 0;
		this.watchIds.length = 0;
		this.intervalCount = this.MAX_INTERVAL_COUNT;
		this.width = this.$container.width();
		this.height = this.$container.height();
		this.fishCount = this.FISH_COUNT * this.width / 500 * this.height / 500;
		this.$canvas.attr({width : this.width, height : this.height});
		this.reverse = false;
		
		this.fishes.push(new FISH(this));
		this.createSurfacePoints();
	},
	watchWindowSize : function(){
		this.clearTimer();
		this.tmpWidth = this.$window.width();
		this.tmpHeight = this.$window.height();
		this.watchIds.push(setTimeout(this.jdugeToStopResize, this.WATCH_INTERVAL));
	},
	clearTimer : function(){
		while(this.watchIds.length > 0){
			clearTimeout(this.watchIds.pop());
		}
	},
	jdugeToStopResize : function(){
		var width = this.$window.width(),
			height = this.$window.height(),
			stopped = (width == this.tmpWidth && height == this.tmpHeight);
			
		this.tmpWidth = width;
		this.tmpHeight = height;
		
		if(stopped){
			this.setup();
		}
	},
	bindEvent : function(){
		this.$window.on('resize', this.watchWindowSize);
		this.$container.on('mouseenter', this.startEpicenter);
		this.$container.on('mousemove', this.moveEpicenter);
		this.$container.on('click', this.reverseVertical);
	},
	getAxis : function(event){
		var offset = this.$container.offset();
		
		return {
			x : event.clientX - offset.left + this.$window.scrollLeft(),
			y : event.clientY - offset.top + this.$window.scrollTop()
		};
	},
	startEpicenter : function(event){
		this.axis = this.getAxis(event);
	},
	moveEpicenter : function(event){
		var axis = this.getAxis(event);
		
		if(!this.axis){
			this.axis = axis;
		}
		this.generateEpicenter(axis.x, axis.y, axis.y - this.axis.y);
		this.axis = axis;
	},
	generateEpicenter : function(x, y, velocity){
		if(y < this.height / 2 - this.THRESHOLD || y > this.height / 2 + this.THRESHOLD){
			return;
		}
		var index = Math.round(x / this.pointInterval);
		
		if(index < 0 || index >= this.points.length){
			return;
		}
		this.points[index].interfere(y, velocity);
	},
	reverseVertical : function(){
		this.reverse = !this.reverse;
		
		for(var i = 0, count = this.fishes.length; i < count; i++){
			this.fishes[i].reverseVertical();
		}
	},
	controlStatus : function(){
		for(var i = 0, count = this.points.length; i < count; i++){
			this.points[i].updateSelf();
		}
		for(var i = 0, count = this.points.length; i < count; i++){
			this.points[i].updateNeighbors();
		}
		if(this.fishes.length < this.fishCount){
			if(--this.intervalCount == 0){
				this.intervalCount = this.MAX_INTERVAL_COUNT;
				this.fishes.push(new FISH(this));
			}
		}
	},
	render : function(){
		requestAnimationFrame(this.render);
		this.controlStatus();
		this.context.clearRect(0, 0, this.width, this.height);
		this.context.fillStyle = 'hsl(0, 0%, 95%)';
		
		for(var i = 0, count = this.fishes.length; i < count; i++){
			this.fishes[i].render(this.context);
		}
		this.context.save();
		this.context.globalCompositeOperation = 'xor';
		this.context.beginPath();
		this.context.moveTo(0, this.reverse ? 0 : this.height);
		
		for(var i = 0, count = this.points.length; i < count; i++){
			this.points[i].render(this.context);
		}
		this.context.lineTo(this.width, this.reverse ? 0 : this.height);
		this.context.closePath();
		this.context.fill();
		this.context.restore();
	}
};
var SURFACE_POINT = function(renderer, x){
	this.renderer = renderer;
	this.x = x;
	this.init();
};
SURFACE_POINT.prototype = {
	SPRING_CONSTANT : 0.03,
	SPRING_FRICTION : 0.9,
	WAVE_SPREAD : 0.3,
	ACCELARATION_RATE : 0.01,
	
	init : function(){
		this.initHeight = this.renderer.height * this.renderer.INIT_HEIGHT_RATE;
		this.height = this.initHeight;
		this.fy = 0;
		this.force = {previous : 0, next : 0};
	},
	setPreviousPoint : function(previous){
		this.previous = previous;
	},
	setNextPoint : function(next){
		this.next = next;
	},
	interfere : function(y, velocity){
		this.fy = this.renderer.height * this.ACCELARATION_RATE * ((this.renderer.height - this.height - y) >= 0 ? -1 : 1) * Math.abs(velocity);
	},
	updateSelf : function(){
		this.fy += this.SPRING_CONSTANT * (this.initHeight - this.height);
		this.fy *= this.SPRING_FRICTION;
		this.height += this.fy;
	},
	updateNeighbors : function(){
		if(this.previous){
			this.force.previous = this.WAVE_SPREAD * (this.height - this.previous.height);
		}
		if(this.next){
			this.force.next = this.WAVE_SPREAD * (this.height - this.next.height);
		}
	},
	render : function(context){
		if(this.previous){
			this.previous.height += this.force.previous;
			this.previous.fy += this.force.previous;
		}
		if(this.next){
			this.next.height += this.force.next;
			this.next.fy += this.force.next;
		}
		context.lineTo(this.x, this.renderer.height - this.height);
	}
};
var FISH = function(renderer){
	this.renderer = renderer;
	this.init();
};
FISH.prototype = {
	GRAVITY : 0.4,
	
	init : function(){
		this.direction = Math.random() < 0.5;
		this.x = this.direction ? (this.renderer.width + this.renderer.THRESHOLD) : -this.renderer.THRESHOLD;
		this.previousY = this.y;
		this.vx = this.getRandomValue(4, 10) * (this.direction ? -1 : 1);
		
		if(this.renderer.reverse){
			this.y = this.getRandomValue(this.renderer.height * 1 / 10, this.renderer.height * 4 / 10);
			this.vy = this.getRandomValue(2, 5);
			this.ay = this.getRandomValue(0.05, 0.2);
		}else{
			this.y = this.getRandomValue(this.renderer.height * 6 / 10, this.renderer.height * 9 / 10);
			this.vy = this.getRandomValue(-5, -2);
			this.ay = this.getRandomValue(-0.2, -0.05);
		}
		this.isOut = false;
		this.theta = 0;
		this.phi = 0;
	},
	getRandomValue : function(min, max){
		return min + (max - min) * Math.random();
	},
	reverseVertical : function(){
		this.isOut = !this.isOut;
		this.ay *= -1;
	},
	controlStatus : function(context){
		this.previousY = this.y;
		this.x += this.vx;
		this.y += this.vy;
		this.vy += this.ay;
		
		if(this.renderer.reverse){
			if(this.y > this.renderer.height * this.renderer.INIT_HEIGHT_RATE){
				this.vy -= this.GRAVITY;
				this.isOut = true;
			}else{
				if(this.isOut){
					this.ay = this.getRandomValue(0.05, 0.2);
				}
				this.isOut = false;
			}
		}else{
			if(this.y < this.renderer.height * this.renderer.INIT_HEIGHT_RATE){
				this.vy += this.GRAVITY;
				this.isOut = true;
			}else{
				if(this.isOut){
					this.ay = this.getRandomValue(-0.2, -0.05);
				}
				this.isOut = false;
			}
		}
		if(!this.isOut){
			this.theta += Math.PI / 20;
			this.theta %= Math.PI * 2;
			this.phi += Math.PI / 30;
			this.phi %= Math.PI * 2;
		}
		this.renderer.generateEpicenter(this.x + (this.direction ? -1 : 1) * this.renderer.THRESHOLD, this.y, this.y - this.previousY);
		
		if(this.vx > 0 && this.x > this.renderer.width + this.renderer.THRESHOLD || this.vx < 0 && this.x < -this.renderer.THRESHOLD){
			this.init();
		}
	},
	render : function(context){
		context.save();
		context.translate(this.x, this.y);
		context.rotate(Math.PI + Math.atan2(this.vy, this.vx));
		context.scale(1, this.direction ? 1 : -1);
		context.beginPath();
		context.moveTo(-30, 0);
		context.bezierCurveTo(-20, 15, 15, 10, 40, 0);
		context.bezierCurveTo(15, -10, -20, -15, -30, 0);
		context.fill();
		
		context.save();
		context.translate(40, 0);
		context.scale(0.9 + 0.2 * Math.sin(this.theta), 1);
		context.beginPath();
		context.moveTo(0, 0);
		context.quadraticCurveTo(5, 10, 20, 8);
		context.quadraticCurveTo(12, 5, 10, 0);
		context.quadraticCurveTo(12, -5, 20, -8);
		context.quadraticCurveTo(5, -10, 0, 0);
		context.fill();
		context.restore();
		
		context.save();
		context.translate(-3, 0);
		context.rotate((Math.PI / 3 + Math.PI / 10 * Math.sin(this.phi)) * (this.renderer.reverse ? -1 : 1));
		
		context.beginPath();
		
		if(this.renderer.reverse){
			context.moveTo(5, 0);
			context.bezierCurveTo(10, 10, 10, 30, 0, 40);
			context.bezierCurveTo(-12, 25, -8, 10, 0, 0);
		}else{
			context.moveTo(-5, 0);
			context.bezierCurveTo(-10, -10, -10, -30, 0, -40);
			context.bezierCurveTo(12, -25, 8, -10, 0, 0);
		}
		context.closePath();
		context.fill();
		context.restore();
		context.restore();
		this.controlStatus(context);
	}
};
$(function(){
	RENDERER.init();
});
```

2. 修改 _config.butterfly.yml 文件的 inject 的 bottom 处。

```diff
- - <script defer src="/js/colorfishes.js"></script> # 页脚养鱼(彩色)    
+ - <script defer src="/js/fish.js"></script>
```

3. 修改 _config.butterfly.yml 文件。

```yaml
# Footer Background
footer_bg: false
```

### 网站背景

默认显示白色，可设置图片或者颜色。

修改 _config.butterfly.yml 文件。

```yaml
# Website Background (設置網站背景)
# can set it to color or image (可設置圖片 或者 顔色)
# The formal of image: url(http://xxxxxx.com/xxx.jpg)
background: url(https://i.loli.net/2019/09/09/5oDRkWVKctx2b6A.png)
```

### 代码框展开/关闭

在默认情况下，代码框自动展开，可设置是否所有代码框都关闭状态，点击 > 可展开代码

- true: 全部代码框不展开，需点击 > 打开
- false: 代码框展开，有 > 点击按钮
- none: 不显示 > 按钮

修改 _config.butterfly.yml 文件。

```yaml
highlight_shrink: true # true: shrink the code blocks / false: expand the code blocks | none: expand code blocks and hide the button
```

### Hexo在顶部增加天气小部件

原教程链接：[Hexo在顶部增加天气小部件](https://cnhuazhu.top/butterfly/2021/02/24/Hexo%E9%AD%94%E6%94%B9/Hexo%E5%9C%A8%E9%A1%B6%E9%83%A8%E5%A2%9E%E5%8A%A0%E5%A4%A9%E6%B0%94%E5%B0%8F%E9%83%A8%E4%BB%B6/)

1. 在[和风天气插件](https://widget.qweather.com/create-simple)中创建一个模板，点击生成代码。需要登录。

2. 在 blog/themes/butterfly/source/js 目录下创建一个 weather.js 文件，将生成的代码写入。下面代码需要写入自己的 key 值。

```js
WIDGET = {
  "CONFIG": {
    "modules": "01234",
    "background": "5",
    "tmpColor": "FF9900",
    "tmpSize": "16",
    "cityColor": "CCCCCC",
    "citySize": "16",
    "aqiColor": "D9D9D9",
    "aqiSize": "16",
    "weatherIconSize": "24",
    "alertIconSize": "18",
    "padding": "15px 10px 10px 20px",
    "shadow": "0",
    "language": "auto",
    "borderRadius": "5",
    "fixed": "false",
    "vertical": "top",
    "horizontal": "left",
    "key": ""
  }
}
```

3. 修改 _config.butterfly.yml 文件，在 inject 的 bottom 处引入 js 文件。

```yaml
- <script defer src="https://widget.qweather.net/simple/static/js/he-simple-common.js?v=2.0"></script>
- <script defer src="/js/weather.js"></script>
```

4. 修改 blog/themes/butterfly/layout/includes/header/nav.pug 文件。

```diff
nav#nav
  span#blog_name
    a#site-name(href=url_for('/')) #[=config.title]
+  #he-plugin-simple
+  #none_space
    
  #menus
    if (theme.algolia_search.enable || theme.local_search.enable)
      #search-button
        a.site-page.social-icon.search
          i.fas.fa-search.fa-fw
          span=' '+_p('search.title')
    !=partial('includes/header/menu_item', {}, {cache: true})

    #toggle-menu
      a.site-page
        i.fas.fa-bars.fa-fw
```

5. 修改 blog/themes/butterfly/source/css/_layout/head.styl 文件。

```diff
-  #blog_name
+  #none_space
    flex: 1
```

### Gitcalendar

原教程链接：[Gitcalendar](https://akilar.top/posts/1f9c68c9/)

1. 安装插件。

```shell
npm install hexo-filter-gitcalendar --save
```

2. 访问[Vercel官网](https://vercel.com/)，注册登录。点击 `New Project` 按钮。

![](https://cos.luyf-lemon-love.space/images/20220717190519.png)

3. 点击下图按钮，引入第三方 Git 仓库。

![](https://cos.luyf-lemon-love.space/images/20220717190541.png)

4. 输入 `https://github.com/Zfour/python_github_calendar_api.git`，然后点击 `Continue` 按钮。

![](https://cos.luyf-lemon-love.space/images/20220717190736.png)

5. 输入仓库名（任意），取消 `Create private Git Repository` 的勾选，点击 `Create` 按钮。

![](https://cos.luyf-lemon-love.space/images/20220717191641.png)

![](https://cos.luyf-lemon-love.space/images/20220717191723.png)

6. 点击 `Go to Dashboard` 按钮。获得 API，如 `github-calendar-api-nine.vercel.app`。

7. 在 _config.butterfly.yml 文件中，添加下面的代码。`user`：自己的 Github 用户名，`apiurl`：上面的获得的 API。

```yaml
# hexo-filter-gitcalendar
# see https://akilar.top/posts/1f9c68c9/
gitcalendar:
  enable: true # 开关
  priority: 5 #过滤器优先权
  enable_page: / # 应用页面
  # butterfly挂载容器
  layout: # 挂载容器类型
    type: id
    name: recent-posts
    index: 0
  # volantis挂载容器
  # layout:
  #   type: class
  #   name: l_main
  #   index: 0
  # matery挂载容器
  # layout:
  #   type: id
  #   name: indexCard
  #   index: 0
  # mengd挂载容器
  # layout:
  #   type: class
  #   name: content
  #   index: 0
  user: LuYF-Lemon-love #git用户名
  apiurl: 'https://github-calendar-api-nine.vercel.app'
  minheight:
    pc: 280px #桌面端最小高度
    mibile: 0px #移动端最小高度
  color: "['#e4dfd7', '#f9f4dc', '#f7e8aa', '#f7e8aa', '#f8df72', '#fcd217', '#fcc515', '#f28e16', '#fb8b05', '#d85916', '#f43e06']" #橘黄色调
  # color: "['#ebedf0', '#fdcdec', '#fc9bd9', '#fa6ac5', '#f838b2', '#f5089f', '#c4067e', '#92055e', '#540336', '#48022f', '#30021f']" #浅紫色调
  # color: "['#ebedf0', '#f0fff4', '#dcffe4', '#bef5cb', '#85e89d', '#34d058', '#28a745', '#22863a', '#176f2c', '#165c26', '#144620']" #翠绿色调
  # color: "['#ebedf0', '#f1f8ff', '#dbedff', '#c8e1ff', '#79b8ff', '#2188ff', '#0366d6', '#005cc5', '#044289', '#032f62', '#05264c']" #天青色调
  container: .recent-post-item(style='width:100%;height:auto;padding:10px;') #父元素容器，需要使用pug语法
  gitcalendar_css: https://npm.elemecdn.com/hexo-filter-gitcalendar/lib/gitcalendar.css
  gitcalendar_js: https://npm.elemecdn.com/hexo-filter-gitcalendar/lib/gitcalendar.js
```

### Sidebar Card Clock

原教程链接：[Sidebar Card Clock](https://akilar.top/posts/4e39cf4a/)

1. 安装插件。

```shell
npm install hexo-butterfly-clock --save
```

2. 在 _config.butterfly.yml 文件中，添加如下代码。

```yaml
# electric_clock
# see https://akilar.top/posts/4e39cf4a/
electric_clock:
  enable: true # 开关
  priority: 5 #过滤器优先权
  enable_page: all # 应用页面
  exclude:
    # - /posts/
    # - /about/
  layout: # 挂载容器类型
    type: class
    name: sticky_layout
    index: 0
  loading: https://npm.elemecdn.com/hexo-butterfly-clock/lib/loading.gif #加载动画自定义
  clock_css: https://npm.elemecdn.com/hexo-butterfly-clock/lib/clock.min.css
  clock_js: https://npm.elemecdn.com/hexo-butterfly-clock/lib/clock.min.js
  ip_api: https://pv.sohu.com/cityjson?ie=utf-8
```

### Hexo侧边栏添加微博热搜

原教程链接：[Hexo侧边栏添加微博热搜](https://cnhuazhu.top/butterfly/2022/06/23/Hexo%E9%AD%94%E6%94%B9/Hexo%E4%BE%A7%E8%BE%B9%E6%A0%8F%E6%B7%BB%E5%8A%A0%E5%BE%AE%E5%8D%9A%E7%83%AD%E6%90%9C/)

1. 在 blog/themes/butterfly/layout/includes/widget 目录下新建 `card_weibo.pug` 文件，并写入如下代码。

```
if theme.aside.card_weibo.enable
  .card-widget.card-weibo
    .card-content
      .item-headline
        i.fab.fa-weibo
        span 微博热搜
      #weibo-container
        .weibo-list
```

2. 修改 blog/themes/butterfly/layout/includes/widget/index.pug 文件中的 page 项代码。

```diff
else
  //- page
  !=partial('includes/widget/card_author', {}, {cache: true})
  !=partial('includes/widget/card_announcement', {}, {cache: true})
+  !=partial('includes/widget/card_weibo', {}, {cache: true})
  !=partial('includes/widget/card_top_self', {}, {cache: true})
```

3. 在 blog/themes/butterfly/source/js 目录中，新建 `weibo.js` 文件，并写入如下代码。

```js
fetch('https://weibo-9qsvnblo6-pc-study.vercel.app/api').then(data=>data.json()).then(data=>{
    let html = '<style>.weibo-new{background:#ff3852}.weibo-hot{background:#ff9406}.weibo-jyzy{background:#ffc000}.weibo-recommend{background:#00b7ee}.weibo-adrecommend{background:#febd22}.weibo-friend{background:#8fc21e}.weibo-boom{background:#bd0000}.weibo-topic{background:#ff6f49}.weibo-topic-ad{background:#4dadff}.weibo-boil{background:#f86400}#weibo-container{overflow-y:auto;-ms-overflow-style:none;scrollbar-width:none}#weibo-container::-webkit-scrollbar{display:none}.weibo-list-item{display:flex;flex-direction:row;justify-content:space-between;flex-wrap:nowrap}.weibo-title{white-space:nowrap;overflow:hidden;text-overflow:ellipsis;margin-right:auto}.weibo-num{float:right}.weibo-hotness{display:inline-block;padding:0 6px;transform:scale(.8) translateX(-3px);color:#fff;border-radius:8px}</style>'
    html += '<div class="weibo-list">'
    let hotness = {
        '爆': 'weibo-boom',
        '热': 'weibo-hot',
        '沸': 'weibo-boil',
        '新': 'weibo-new',
        '荐': 'weibo-recommend',
        '音': 'weibo-jyzy',
        '影': 'weibo-jyzy',
        '剧': 'weibo-jyzy',
        '综': 'weibo-jyzy'
    }
    for (let item of data) {
        html += '<div class="weibo-list-item"><div class="weibo-hotness ' + hotness[(item.hot || '荐')] + '">' + (item.hot || '荐') + '</div>' + '<span class="weibo-title"><a title="' + item.title + '"href="' + item.url + '" target="_blank" rel="external nofollow noreferrer">' + item.title + '</a></span>' + '<div class="weibo-num"><span>' + item.num + '</span></div></div>'
    }
    html += '</div>'
    document.getElementById('weibo-container').innerHTML = html
}
).catch(function(error) {
    console.log(error);
});
```

4. 在 _config.butterfly.yml 文件 inject 的 bottom 处引入上面的脚本。

```yaml
- <script defer src="/js/weibo.js"></script>
```

5. 在 blog/themes/butterfly/source/css/_custom 亩下创建 `weibo.css` 文件，写入下面代码。

```css
#weibo-container{
  width: 100%; 
  height: 150px;
  font-size: 95%;
}

.weibo-new{
  background:#ff3852
}
.weibo-hot{
  background:#ff9406
}
.weibo-jyzy{
  background:#ffc000
}
.weibo-recommend{
  background:#00b7ee
}
.weibo-adrecommend{
  background:#febd22
}
.weibo-friend{
  background:#8fc21e
}
.weibo-boom{
  background:#bd0000
}
.weibo-topic{
  background:#ff6f49
}
.weibo-topic-ad{
  background:#4dadff
}
.weibo-boil{
  background:#f86400
}
#weibo-container{
  overflow-y:auto;
  -ms-overflow-style:none;
  scrollbar-width:none
}
#weibo-container::-webkit-scrollbar{
  display:none
}
.weibo-list-item{
  display:flex;
  flex-direction:row;
  justify-content:space-between;
  flex-wrap:nowrap
}
.weibo-title{
  white-space:nowrap;
  overflow:hidden;
  text-overflow:ellipsis;
  margin-right:auto
}
.weibo-num{
  float:right
}
.weibo-hotness{
  display:inline-block;
  padding:0 6px;
  transform:scale(.8) translateX(-3px);
  color:#fff;
  border-radius:8px
}
```

6. 在 _config.butterfly.yml 文件的 aside 处添加如下配置。

```diff
  card_webinfo:
    enable: true
    post_count: true
    last_push_date: true
    sort_order: # Don't modify the setting unless you know how it works
+  card_weibo:
+    enable: true
+    sort_order:
```

### 结语

第十八篇博文写完，开心！！！！

今天，也是充满希望的一天。