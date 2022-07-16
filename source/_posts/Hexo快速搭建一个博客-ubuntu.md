---
title: Hexo快速搭建一个博客-ubuntu
tags:
- Hexo
- Butterfly
- Github
- Gitee
- Coding
- 腾讯云
- 轻量应用服务器
- 宝塔Linux面板
- jsdelivr
- Vercel
- 域名
- 百度收录
categories: 博客
description: 搭建一个 Hexo 博客，进行 Butterfly 主题魔改，且解决遇到的各种各样的部署问题。
cover: https://cos.luyf-lemon-love.space/images/20220513124600.png
abbrlink: 1500512943
date: 2022-05-08 23:22:38
---

### 前言

个人博客对于每个程序员都相当重要。

这里选择 [Hexo](https://hexo.io/ "Hexo") 作为搭建博客的框架。

>A fast, simple & powerful blog framework

Hexo 是一款基于 [Node.js](https://nodejs.org/) 的静态博客框架，依赖少易于安装使用，可以方便的生成静态网页托管在 [GitHub](https://github.com/) 上，是搭建博客的首选框架。

操作系统：Ubuntu 20.04.4 LTS

### 参考文档

1. [Hexo](https://hexo.io/)

2. [Butterfly](https://butterfly.js.org/)

3. [Volantis](https://volantis.js.org/)

4. [Vercel](https://vercel.com/)

5. [花猪大佬的博客](https://cnhuazhu.top/)

6. [Akilarの糖果屋](https://akilar.top/)

7. [卓越科技](https://zykj.js.org/)

8. [DreamyTZK](https://www.antmoe.com/)

9. [Ln's Blog](https://weilining.github.io/)

10. [John Doe](https://uuuuu.cf/)

11. [天泽岁月](https://surpsec.cn/)

12. [腾讯云服务器登录宝塔面板](https://blog.csdn.net/niuguobao/article/details/124065225?spm=1001.2014.3001.5506)

13. [Hexo部署至云服务器的宝塔面板](https://blog.csdn.net/oXiaoLingTong/article/details/123473069?spm=1001.2014.3001.5506)

14. [JsDelivr CDN缓存刷新工具-缓存清除-缓存更新](https://blog.csdn.net/qq_27862223/article/details/108506349?spm=1001.2014.3001.5506)

15. [Hexo自动为站内链接加上nofollow插件](https://blog.csdn.net/qq_41793001/article/details/102925602?spm=1001.2014.3001.5506)

16. [为你的个人博客添加访客地图](https://shichen.blog.csdn.net/article/details/99649555?spm=1001.2014.3001.5506)

17. [使用免费的CDN平台jsDelivr搭建个人cdn资源网盘](https://blog.csdn.net/q906270629/article/details/106145109?spm=1001.2014.3001.5506)

18. [Gitee(码云)、Github同时配置ssh key](https://blog.csdn.net/qq_40323256/article/details/104091775?spm=1001.2014.3001.5506)

19. [Git使用出现git@github.com: Permission denied (publickey). 处理](https://blog.csdn.net/qq_43768946/article/details/90411154?spm=1001.2014.3001.5506)

20. [github：master提交项目到远程仓库出现“There isn’t anything to compare.”](https://blog.csdn.net/Zero_Wong/article/details/123882159?spm=1001.2014.3001.5506)

21. [关于Support for password authentication was removed on August 13, 2021报错的解决方案](https://blog.csdn.net/chuyouyinghe/article/details/122203309?spm=1001.2014.3001.5506)

22. [Valine 文档](https://valine.js.org/quickstart.html)

23. [Hexo博客如何加入B站视频/How to add bilibili shared video in Hexo](https://www.jianshu.com/p/9b4d5903dfc8)

24. [Hexo 个人博客快速部署到Gitee&Coding详细教程](https://zhuanlan.zhihu.com/p/427786395)

25. [腾讯云轻量应用服务器文档](https://cloud.tencent.com/document/product/1207)

26. [jsDelivr域名遭到DNS污染](https://luotianyi.vc/6295.html)

27. [github设置某个分支为默认主支](https://xiao7.blog.csdn.net/article/details/109357897?spm=1001.2014.3001.5506)

28. [.styl格式的CSS样式文件是什么文件](https://blog.csdn.net/qq_35393869/article/details/83444272?spm=1001.2014.3001.5506)

29. [hexo史上最全搭建教程](https://blog.csdn.net/sinat_37781304/article/details/82729029?spm=1001.2014.3001.5506)

30. [腾讯云CNAME 记录](https://cloud.tencent.com/document/product/302/3450)

31. [域名解析之绑定github](https://www.jianshu.com/p/f4a65dccddcd?utm_campaign=maleskine&utm_content=note&utm_medium=seo_notes&utm_source=recommendation)

32. [域名解析到GitHub上](https://www.jianshu.com/p/c982b10efe48)

33. [GitHub Pages 绑定个人域名](https://blog.csdn.net/lijing742180/article/details/85549978?spm=1001.2101.3001.6650.7&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-7-85549978-blog-53142450.pc_relevant_antiscanv3&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-7-85549978-blog-53142450.pc_relevant_antiscanv3&utm_relevant_index=14)

34. [DNS 解析 DNSPod 各记录类型说明及规则](https://cloud.tencent.com/document/product/302/38661)

35. [全网独家-hexo-seo优化之关键词和简介的优化](https://blog.csdn.net/u011759205/article/details/104990219)

36. [怎么样让自己的博客被谷歌和百度快速收录？](https://blog.csdn.net/zengfanwei1990/article/details/112343332?spm=1001.2014.3001.5506)

37. [如何让百度收录 GitHub Pages 个人博客](https://zhuanlan.zhihu.com/p/111773896)

38. [Hexo + Github Page 搭建技术博客教程系列(四) 之 设置 SEO 优化百度、谷歌收录](https://www.jianshu.com/p/6b0963512507)

39. [Hexo插件之百度主动提交链接](https://hui-wang.info/2016/10/23/Hexo插件之百度主动提交链接/)

40. [Valine评论失效 由于LeanCloud国际版通用域名失效](https://blog.csdn.net/qq_35977139/article/details/108768439)

41. [在 Hexo 中使用 artitalk 新增说说功能](https://blog.csdn.net/qq_38157825/article/details/112783238)

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

### 搭建博客

#### 安装 Git

```shell
# ubuntu
sudo apt-get install git

git --version
```

#### 安装 nodejs

```shell
# 安装最新版本的 nodejs
# 去官网查看最新的版本号，这篇博文创作时，版本为：16.15.0 LTS，18.1.0 Current
# 所以最新版本的源为 https://deb.nodesource.com/setup_18.x
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -

sudo apt-get install -y nodejs
sudo apt-get install npm

node -v
npm -v

# 将 npm 改为淘宝镜像
npm config list
npm config set registry https://registry.npm.taobao.org
npm config get registry
npm install -g cnpm --registry=https://registry.npm.taobao.org
cnpm -v
```

#### 安装 hexo

```shell
sudo cnpm install -g hexo-cli

hexo -v

# 创建 blog 目录
mkdir blog
cd blog

hexo init
npm install

# 启动本地博客服务
hexo s
```

通过 http://localhost:4000/ 访问你的博客

```shell
# 关闭本地化服务
Ctrl + C

# 以后的 hexo s, hexo clean, hexo g, hexo d 等命令都是在博客目录下运行

# 尝试写第一篇文章，会在 source/_posts 目录下，生成一个 .md 文件，该文件即是你的博文
hexo new "第一篇博客文章" # new 可以简写为 n
hexo clean # 可以缩写为 hexo cl
hexo g

# 每次修改完博客都要运行 hexo cl, hexo g
hexo s
```

#### 部署到 Github

在 Github 上创建一个名字为 你的用户名.github.io （ 如 LuYF-Lemon-love.github.io ）的 Public 仓库，用户名一定要和你的用户名相同。

```shell
# 在 blog 目录下安装 git 部署的插件
cnpm install --save hexo-deployer-git

# yourname 是你的 Github 的用户名，youremail 是你注册 Github 的邮箱
git config --global user.name "yourname"
git config --global user.email "youremail"
git config --global core.autocrlf false

# 例子
git config --global user.email "3555028709@qq.com"
git config --global user.name "LuYF-Lemon-love"
git config --global core.autocrlf false

# 检查
git config user.name
git config user.email

# 创建 SSH，一路回车
ssh-keygen -t rsa -C "youremail"

# 例子
ssh-keygen -t rsa -C "3555028709@qq.com"

# 在当前用户的 home 目录下生成了 .ssh 目录，里面包含 id_rsa，id_rsa.pub，known_hosts 三个文件
```

SSH，是一个密钥，id_rsa 是这台电脑的私人密钥，不能给别人看，id_rsa.pub 是公共密钥，可以随便给别人看。把这个公钥放到 Github 上，这样当你链接到 Github 自己的用户时，它就会根据公钥匹配你的私钥匙，当匹配成功时，就可以通过 git 上传文件到 Github上了。

```shell
cat ~/.ssh/id_rsa.pub

# 复制 cat 输出的文本

# 第一步：点击 Github 的 Setting
# 第二步：点击 SSH and GPG Keys
# 第三步：点击 New SSH key
# 第四步：把上面复制的内容粘贴 Key 中，Title 随便填
# 第五步：点击 Add SSH key，输入 Github 密码进行验证

# 验证
ssh -T git@github.com

# 进入 blog 目录
vim _config.yml
```

将 _config.yml 文件中的最底部的 # Deployment 模块修改为下面内容

```yaml
# Deployment
## Docs: https://hexo.io/docs/one-command-deployment
deploy:
  type: git
  repo: git@github.com:用户名/用户名.github.io.git
  branch: master

# 例子
# Deployment
## Docs: https://hexo.io/docs/one-command-deployment
deploy:
  type: git
  repo: git@github.com:LuYF-Lemon-love/LuYF-Lemon-love.github.io.git
  branch: master
```

部署到 Github 上

```shell
hexo cl
hexo generate # 可以缩写为 hexo g
hexo deploy # 可以缩写为 hexo d
```

现在 Github 中默认分支改为 main，因此我们需要到上面创建的仓库主页的 Setting 中的 Branches 中修改默认分支为 master，然后回到仓库主页，点击 branch，删除掉 main 分支。 

之后可以在 https://yourname.github.io 访问你的博客，用户名的大小写没有影响，如：https://luyf-lemon-love.github.io/

#### 删除博客

直接在 source/_posts 目录下删除你想要删除的博客即可。

然后重新生成部署

```shell
hexo cl
hexo g
hexo d
```

#### 基本设置

_config.yml 文件是 hexo 的配置文件，官方配置文件的链接：https://hexo.io/zh-cn/docs/configuration

|参数|title|subtitle|description|keywords|author|language|url|theme|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|描述|网站标题|网站副标题|网站描述|网站关键词（多个关键词如：LuYF-Lemon-love, Blog, 博客）|您的名字|zh-CN代表简体中文|网址:你的首页网址|主题名称，false 禁用主题|

每一篇博文的 .md 文件开头 tags 可以设置多个标签

```markdown
tags:
- Github
- Git
```

#### 更换主题

hexo 有很多种主题，链接：https://hexo.io/themes/

进入到 blog 目录，下载主题，git clone 主题地址.git themes/目录， 这里以 yilia 主题为例：

```shell
git clone https://github.com/litten/hexo-theme-yilia.git themes/yilia
```

修改 blog 目录下的 _config.yml 文件，找到 # Extensions 模块下的theme 标签（默认为 landscape），修改为 yilia

```yaml
theme: yilia
```

然后运行下面命令

```shell
hexo cl
hexo g
hexo d
```

添加目录

```shell
# 在 blog 目录下运行
npm i hexo-generator-json-content --save
```

在 _config.yml 文件中添加

```yaml
jsonContent:
  meta: false
  pages: false
  posts:
    title: true
    date: true
    path: true
    text: false
    raw: false
    content: false
    slug: false
    updated: false
    comments: false
    link: false
    permalink: false
    excerpt: false
    categories: false
    tags: true
```

### 基于 Butterfly 的魔改（ version: 4.2.0 ，有些魔改需要清空浏览器缓存数据才能立即看到效果)

[Butterfly](https://butterfly.js.org/) 是一个非常优秀的 Hexo 主题

```shell
# 在 blog 目录下
git clone -b master https://github.com/jerryc127/hexo-theme-butterfly.git themes/butterfly

# 配置 blog 目录下的 _config.yml 文件
theme: butterfly

# 安装插件
npm install hexo-renderer-pug hexo-renderer-stylus --save

hexo cl
hexo g
hexo d
```

#### 升级建议（防止 Butterfly 的配置文件和 Hexo 配置文件冲突）

在 blog 目录创建一个文件 _config.butterfly.yml，并把 blog/themes/bufferfly 目录下的 _config.yml 内容复制到 _config.butterfly.yml 中去。

注意:

- 不要把主题目录的 _config.yml 删掉
- 以后只需配置 _config.butterfly.yml 文件即可。
- 主题目录下的 _config.yml 不会产生效果
- Hexo 自动合并 blog 目录下的 _config.yml 文件和 _config.butterfly.yml 文件，后者优先级更高

#### 导航菜单

格式链接：https://fontawesome.com/icons

修改 _config.butterfly.yml 文件

```yaml
Home: / || fas fa-home
Archives: /archives/ || fas fa-archive
Tags: /tags/ || fas fa-tags
Categories: /categories/ || fas fa-folder-open
List||fas fa-list:
  Music: /music/ || fas fa-music
  Image: /Gallery/ || fas fa-images
  Movie: /movies/ || fas fa-video
Link: /link/ || fas fa-link
About: /about/ || fas fa-heart
```

导航的文字也可以修改如：

```yaml
menu:
  首页: / || fas fa-home
  时间轴: /archives/ || fas fa-archive
  标签: /tags/ || fas fa-tags
  分类: /categories/ || fas fa-folder-open
  清单||fa fa-heartbeat:
    音乐: /music/ || fas fa-music
    照片: /Gallery/ || fas fa-images
    电影: /movies/ || fas fa-video
  友链: /link/ || fas fa-link
  关于: /about/ || fas fa-heart
```

#### 代码

Butterfly 支持6种代码高亮样式：

```yaml
darker
pale night
light
ocean
mac
mac light

# 修改 _config.butterfly.yml 文件
highlight_theme: mac
```

Butterfly 支持代码复制功能

```yaml
# 修改 _config.butterfly.yml 文件
highlight_copy: true
```

Butterfly 支持代码高度限制

- 单位是 px，直接添加数字，如 200
- 实际限制高度为 highlight_height_limit + 30 px， 多增加 30px 限制，目的是避免代码高度只超出 highlight_height_limit 一点时，出现展开按钮，展开没内容
- 不适用于隐藏后的代码块( css 设置 display: none )

```yaml
# 修改 _config.butterfly.yml 文件
# 可配置代码高度限制，超出部分会隐藏，并显示展开按钮
highlight_height_limit: 200
```

#### 头像

修改 _config.butterfly.yml 文件为

```yaml
# Avatar (頭像)
avatar:
  # 头像图片
  img: https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed/blogs/pictures/苏苏1.jpeg
  effect: false # true 头像会一直转圈
```

#### 页脚看板娘

修改 _config.butterfly.yml 文件

找到下面配置内容：

```yaml
# Inject
# Insert the code to head (before '</head>' tag) and the bottom (before '</body>' tag)
# 插入代码到头部 </head> 之前 和 底部 </body> 之前
inject:
  head:
    # - <link rel="stylesheet" href="/xxx.css">
  bottom:
    # - <script src="xxxx"></script>
```

修改为：

```yaml
# Inject
# Insert the code to head (before '</head>' tag) and the bottom (before '</body>' tag)
# 插入代码到头部 </head> 之前 和 底部 </body> 之前
inject:
   head:
     - <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css">
   bottom:
     - <script src="https://cdn.jsdelivr.net/gh/stevenjoezhang/live2d-widget@latest/autoload.js"></script>
```

#### 页脚养鱼

- 找到 blog/themes/butterfly/layout/include/footer.pug 文件，写入下面内容

```yaml
#jsi-flying-fish-container.container
   script(src='js/fish.js')
style.
   
       @media only screen and (max-width: 767px){
       #sidebar_search_box input[type=text]{width:calc(100% - 24px)}
    }
```

- 打开 _config.butterfly.yml，找到 inject，在 bottom 下面引入

```yaml
# 引入 js 需要依赖 jquery，在 bottom 下面最开始引入 jquery
- <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>

# 引入 js
- <script src="https://cdn.jsdelivr.net/gh/xiabo2/CDN@latest/fishes.js"></script>
```

- 修改 blog/themes/butterfly/source/css/_layout/footer.styl 为

```yaml
#footer
  position: relative
  background: $light-blue
  background-attachment: local
  background-position: bottom
  background-size: cover

  if hexo-config('footer_bg') != false
    &:before
      position: absolute
      width: 100%
      height: 100%
      background-color: alpha($dark-black, .1) 
      content: ''

#footer-wrap
  position: absolute
  padding: 1.2rem 1rem 1.4rem
  color: var(--light-grey)
  text-align: center
  left: 0
  right: 0
  top: 0
  bottom: 0

  a
    color: var(--light-grey)

    &:hover
      text-decoration: underline

  .footer-separator
    margin: 0 .2rem

  .icp-icon
    padding: 0 4px
    vertical-align: text-bottom
    max-height: 1.4em
    width auto
```

- 在 blog/themes/butterfly/source/css 目录下创建一个 myCreate.css 文件，在文件中添加如下代码：

```css
/* 页脚半透明 */
#footer {
    background: rgba(255, 255, 255, 0);
    color: #000;
    border-top-right-radius: 20px;
    border-top-left-radius: 20px;
    backdrop-filter: saturate(100%) blur(5px)
}

#footer::before {
    background: rgba(255,255,255,0)
}

#footer #footer-wrap {
    color: var(--font-color);
}

#footer #footer-wrap a {
    color: var(--font-color);
}

/* 页脚透明 */
#footer {
    background: transparent !important;
}
```

- 然后将该文件引入到 _config.butterfly.yml 文件 inject 的 head 处

```yaml
- <link rel="stylesheet" href="/css/myCreate.css">
```

- 彩色的鱼，在 _config.butterfly.yml 文件 inject 的 bottom 处直接引入下面的内容

```yaml
- <script defer src="https://uuuuu.cf/js/fishes.js"></script> # 页脚养鱼(彩色)
```

#### 樱花动态效果背景

在 blog/themes/butterfly/source/js 路径下创建一个 sakura.js 文件，在文件中添加如下代码：

```js
var stop, staticx;
var img = new Image();
img.src = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAUgAAAEwCAYAAADVZeifAAAACXBIWXMAAACYAAAAmAGiyIKYAAAHG2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMxNDIgNzkuMTYwOTI0LCAyMDE3LzA3LzEzLTAxOjA2OjM5ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXBSaWdodHM9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9yaWdodHMvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtbG5zOnN0RXZ0PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VFdmVudCMiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIiB4bWxuczpwaG90b3Nob3A9Imh0dHA6Ly9ucy5hZG9iZS5jb20vcGhvdG9zaG9wLzEuMC8iIHhtcFJpZ2h0czpNYXJrZWQ9IkZhbHNlIiB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9InhtcC5kaWQ6NDFDMjQxQjYyNjIwNjgxMTgwODNEMjE2MDAzOTU1NDQiIHhtcE1NOkRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDozNDVjOWViOC04NDc4LTFkNDctOGRjMi0yZDkyOGNhYTYxZWQiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6YjAzN2ZiMGItNTU5Mi0xYjRkLWJjZGQtOWU4NGExMDJiMGM2IiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDQyAoV2luZG93cykiIHhtcDpDcmVhdGVEYXRlPSIyMDE4LTA1LTA5VDE0OjQ5OjM3KzA4OjAwIiB4bXA6TW9kaWZ5RGF0ZT0iMjAxOC0wNS0wOVQxNDo1MToyNSswODowMCIgeG1wOk1ldGFkYXRhRGF0ZT0iMjAxOC0wNS0wOVQxNDo1MToyNSswODowMCIgZGM6Zm9ybWF0PSJpbWFnZS9wbmciIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjEyMjVlZWE3LTEyY2QtMTY0NC04ZDAzLWFjOTE2ZTAxZDQ1YyIgc3RSZWY6ZG9jdW1lbnRJRD0idXVpZDoxRDIwNUFGNjZCRDlFNTExOUM5REMwMzg2RjlEQjFGNyIvPiA8eG1wTU06SGlzdG9yeT4gPHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDphYmMzNjIzMy1hOWNkLWNiNDQtODViYi0zZTgyMjEwYmIxMjYiIHN0RXZ0OndoZW49IjIwMTgtMDUtMDlUMTQ6NTE6MjUrMDg6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE4IChXaW5kb3dzKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6YjAzN2ZiMGItNTU5Mi0xYjRkLWJjZGQtOWU4NGExMDJiMGM2IiBzdEV2dDp3aGVuPSIyMDE4LTA1LTA5VDE0OjUxOjI1KzA4OjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgQ0MgMjAxOCAoV2luZG93cykiIHN0RXZ0OmNoYW5nZWQ9Ii8iLz4gPC9yZGY6U2Vx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";

function Sakura(x, y, s, r, fn) {
    this.x = x;
    this.y = y;
    this.s = s;
    this.r = r;
    this.fn = fn;
}
Sakura.prototype.draw = function (cxt) {
    cxt.save();
    var xc = 40 * this.s / 4;
    cxt.translate(this.x, this.y);
    cxt.rotate(this.r);
    cxt.drawImage(img, 0, 0, 40 * this.s, 40 * this.s)
    cxt.restore();
}
Sakura.prototype.update = function () {
    this.x = this.fn.x(this.x, this.y);
    this.y = this.fn.y(this.y, this.y);
    this.r = this.fn.r(this.r);
    if (this.x > window.innerWidth || this.x < 0 || this.y > window.innerHeight || this.y < 0) {
        this.r = getRandom('fnr');
        if (Math.random() > 0.4) {
            this.x = getRandom('x');
            this.y = 0;
            this.s = getRandom('s');
            this.r = getRandom('r');
        } else {
            this.x = window.innerWidth;
            this.y = getRandom('y');
            this.s = getRandom('s');
            this.r = getRandom('r');
        }
    }
}
SakuraList = function () {
    this.list = [];
}
SakuraList.prototype.push = function (sakura) {
    this.list.push(sakura);
}
SakuraList.prototype.update = function () {
    for (var i = 0, len = this.list.length; i < len; i++) {
        this.list[i].update();
    }
}
SakuraList.prototype.draw = function (cxt) {
    for (var i = 0, len = this.list.length; i < len; i++) {
        this.list[i].draw(cxt);
    }
}
SakuraList.prototype.get = function (i) {
    return this.list[i];
}
SakuraList.prototype.size = function () {
    return this.list.length;
}

function getRandom(option) {
    var ret, random;
    switch (option) {
        case 'x':
            ret = Math.random() * window.innerWidth;
            break;
        case 'y':
            ret = Math.random() * window.innerHeight;
            break;
        case 's':
            ret = Math.random();
            break;
        case 'r':
            ret = Math.random() * 6;
            break;
        case 'fnx':
            random = -0.5 + Math.random() * 1;
            ret = function (x, y) {
                return x + 0.5 * random - 1.7;
            };
            break;
        case 'fny':
            random = 1.5 + Math.random() * 0.7
            ret = function (x, y) {
                return y + random;
            };
            break;
        case 'fnr':
            random = Math.random() * 0.03;
            ret = function (r) {
                return r + random;
            };
            break;
    }
    return ret;
}

function startSakura() {
    requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame || window.oRequestAnimationFrame;
    var canvas = document.createElement('canvas'),
        cxt;
    staticx = true;
    canvas.height = window.innerHeight;
    canvas.width = window.innerWidth;
    canvas.setAttribute('style', 'position: fixed;left: 0;top: 0;pointer-events: none;');
    canvas.setAttribute('id', 'canvas_sakura');
    document.getElementsByTagName('body')[0].appendChild(canvas);
    cxt = canvas.getContext('2d');
    var sakuraList = new SakuraList();
    for (var i = 0; i < 50; i++) {
        var sakura, randomX, randomY, randomS, randomR, randomFnx, randomFny;
        randomX = getRandom('x');
        randomY = getRandom('y');
        randomR = getRandom('r');
        randomS = getRandom('s');
        randomFnx = getRandom('fnx');
        randomFny = getRandom('fny');
        randomFnR = getRandom('fnr');
        sakura = new Sakura(randomX, randomY, randomS, randomR, {
            x: randomFnx,
            y: randomFny,
            r: randomFnR
        });
        sakura.draw(cxt);
        sakuraList.push(sakura);
    }
    stop = requestAnimationFrame(function () {
        cxt.clearRect(0, 0, canvas.width, canvas.height);
        sakuraList.update();
        sakuraList.draw(cxt);
        stop = requestAnimationFrame(arguments.callee);
    })
}
window.onresize = function () {
    var canvasSnow = document.getElementById('canvas_snow');
}
img.onload = function () {
    startSakura();
}

function stopp() {
    if (staticx) {
        var child = document.getElementById("canvas_sakura");
        child.parentNode.removeChild(child);
        window.cancelAnimationFrame(stop);
        staticx = false;
    } else {
        startSakura();
    }
}
```

然后将该文件引入到 _config.butterfly.yml 文件的 inject 的 bottom 处

```yaml
- <script src="/js/sakura.js"></script>
```

#### 动态线条效果背景

在  _config.butterfly.yml 文件的 inject 的 bottom 处引入

```yaml
- <script src="https://cdn.bootcss.com/canvas-nest.js/1.0.0/canvas-nest.min.js"></script> # 背景动态线条
```

#### 文章页透明效果

在 blog/themes/butterfly/source/css 目录下创建一个 transparent.css 文件，在该文件下添加如下代码：

```css
/* 首页文章栏背景透明 */
#recent-posts>.recent-post-item,.layout_page>div:first-child:not(.recent-posts),.layout_post>#page,.layout_post>#post,.read-mode .layout_post>#post {
    background: var(--light_bg_color)
}

/* 侧边栏透明 */
#aside-content .card-widget {
    background: var(--light_bg_color)
}
```

然后将该文件引入到 _config.butterfly.yml 文件的 inject 的 head 处：

```yaml
- <link rel="stylesheet" href="/css/transparent.css">
```

#### 雪花动态效果背景

在 blog/themes/butterfly/source/js 目录下新建一个 snow.js 文件，然后将以下内容写入该文件

```js
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
```

将该 js 文件引入主题配置文件 _config.butterfly.yml 的 inject 的 bottom 处

```yaml
- <script src="/js/snow.js"></script> # 下雪动效
```

#### 小标题旋转风车

将 _config.butterfly.yml 的 # Beautify (美化頁面顯示) 处修改为

```yaml
# Beautify (美化頁面顯示)
beautify:
  enable: true
  field: post # site/post
  title-prefix-icon: '\f863' # '\f0c1'
  title-prefix-icon-color: # '#F47466'
```

在 _config.butterfly.yml 的 inject 的 head 处引入一下文件

```yaml
- "<style>#article-container.post-content h1:before, h2:before, h3:before, h4:before, h5:before, h6:before { -webkit-animation: avatar_turn_around 1s linear infinite; -moz-animation: avatar_turn_around 1s linear infinite; -o-animation: avatar_turn_around 1s linear infinite; -ms-animation: avatar_turn_around 1s linear infinite; animation: avatar_turn_around 1s linear infinite; }</style>"
```

#### 公告栏计时器

在 blog/themes/butterfly/source/js 目录下创建一个 timing.js 文件，并将如下代码写入该文件

```js
let oSpan = document.getElementsByTagName("timing")[0];
let localhostTime = new Date();//获取页面打开的时间
function tow(n) {
    return n >= 0 && n < 10 ? '0' + n : '' + n;
}
setInterval(function () {
    let goTime = new Date();//获取动态时间
    let diffTime = goTime.getTime() - localhostTime.getTime();
    var second = Math.floor(diffTime / 1000);//未来时间距离现在的秒数
    var day = Math.floor(second / 86400);//整数部分代表的是天；一天有24*60*60=86400秒 ；
    second = second % 86400;//余数代表剩下的秒数；
    var hour = Math.floor(second / 3600);//整数部分代表小时；
    second %= 3600; //余数代表 剩下的秒数；
    var minute = Math.floor(second / 60);
    second %= 60;
    // var str = tow(day) + '<span class="time">天</span>'
    //     + tow(hour) + '<span class="time">小时</span>'
    //     + tow(minute) + '<span class="time">分钟</span>'
    //     + tow(second) + '<span class="time">秒</span>';
    var str = tow(hour) + '<span class="time">小时</span>'
        + tow(minute) + '<span class="time">分钟</span>'
        + tow(second) + '<span class="time">秒</span>';
    oSpan.innerHTML = "您已浏览网页" + str;
}, 1000)
```

在 _config.butterfly.yml 文件的 inject 的 bottom 处引入该 js 文件

```yaml
- <script src="/js/timing.js"></script> # 公告栏计时器插件
```

在 blog/themes/butterfly/layout/includes/widget 目录下找到 card_announcement.pug 文件，添加 timing（注意缩进）

![](https://cos.luyf-lemon-love.space/images/20220510195528.png)

#### 页脚美化

1. 在 blog/themes/butterfly/source/js 目录下创建一个 footerbea.js 文件，将下面代码写入该文件，可以修改文件的内容，如本站创建的时间 BirthDay。

```js
// 动态心跳
$(document).ready(function(e){
    $('.copyright').html('©2022 <i class="fa-fw fas fa-heartbeat card-announcement-animation cc_pointer"></i> By LuYF-Lemon-love');
})

$(document).ready(function(e){
    show_date_time();
})

//本站运行时间
function show_date_time(){
$('.framework-info').html('本站已运行<span id="span_dt_dt" style="color: #fff;"></span>');
window.setTimeout("show_date_time()", 1000);
BirthDay=new Date("5/6/2022 0:0:0");
today=new Date();
timeold=(today.getTime()-BirthDay.getTime());
sectimeold=timeold/1000
secondsold=Math.floor(sectimeold);
msPerDay=24*60*60*1000
e_daysold=timeold/msPerDay
daysold=Math.floor(e_daysold);
e_hrsold=(e_daysold-daysold)*24;
hrsold=Math.floor(e_hrsold);
e_minsold=(e_hrsold-hrsold)*60;
minsold=Math.floor((e_hrsold-hrsold)*60);
seconds=Math.floor((e_minsold-minsold)*60);
span_dt_dt.innerHTML='<font style=color:#afb4db>'+daysold+'</font> 天 <font style=color:#f391a9>'+hrsold+'</font> 时 <font style=color:#fdb933>'+minsold+'</font> 分 <font style=color:#a3cf62>'+seconds+'</font> 秒';
}
```

2. 在 _config.butterfly.yml 文件的 inject 的 bottom 处引入该 js 文件。

```yaml
- <script src="/js/footerbea.js"></script>
```

#### 水波荡漾效果

1. 在 blog/themes/butterfly/source/js 目录下创键一个 ripples.js 文件，并将如下代码写入该文件

```js
$(document).ready(function () {
  try {
    $("#page-header").ripples({
      resolution: 512,
      dropRadius: 10, //px
      perturbance: 0.04,
    });
  } catch (e) {
    $(".error").show().text(e);
  }
});
```

2. 在 _config.butterfly.yml 文件的 inject 的 bottom 处引入下面代码

```yaml
- <script defer src="https://rmt.dogedoge.com/fetch/~/source/jsdelivr/npm/jquery@latest/dist/jquery.min.js"></script>
- <script defer data-pjax src="https://cdn.jsdelivr.net/gh/sirxemic/jquery.ripples/dist/jquery.ripples.js"></script>
- <script defer data-pjax src="/js/ripples.js"></script>
```

#### 上升气泡效果

在 _config.butterfly.yml 文件的 inject 的 bottom 处引入以下代码

```yaml
- <script defer src="https://cdn.jsdelivr.net/combine/npm/jquery@latest/dist/jquery.min.js,gh/weilining/jsdelivr/jquery/circlemagic/circlemagic.min.js,gh/weilining/jsdelivr@latest/jquery/circlemagic/butterflycirclemagic.js"></script>
```
注：由于气泡过多，导致其他 js 动态效果有可能渲染不出来。

#### 站点加载动画修改（齿轮效果）

1. blog/themes/butterfly/layout/includes/loading 目录下创建一个名为 loaded.ejs 的文件，并将如下内容写入该文件

```html
<% if (theme.preloader.enable) { %>
<div id='loader'>
    <% if(theme.preloader.layout == 'gear' ) {%>
    <div class="outer_box">
    <div class='loader_overlay'></div>
    <div class='loader_cogs'>
        <div class='loader_cogs__top'>
            <div class='top_part'></div>
            <div class='top_part'></div>
            <div class='top_part'></div>
            <div class='top_hole'></div>
        </div>
        <div class='loader_cogs__left'>
            <div class='left_part'></div>
            <div class='left_part'></div>
            <div class='left_part'></div>
            <div class='left_hole'></div>
        </div>
        <div class='loader_cogs__bottom'>
            <div class='bottom_part'></div>
            <div class='bottom_part'></div>
            <div class='bottom_part'></div>
            <div class='bottom_hole'></div>
        </div>
        <p style="text-align:center">&nbsp;&nbsp;&nbsp;loading...</p>
    </div>
    </div>
    <% } else if(theme.preloader.layout == 'spinner-box') { %>
    <div class="loading-left-bg"></div>
    <div class="loading-right-bg"></div>
    <div class="spinner-box">
        <div class="configure-border-1">
            <div class="configure-core"></div>
        </div>
        <div class="configure-border-2">
            <div class="configure-core"></div>
        </div>
        <div class="loading-word">加载中...</div>
    </div>
    <% } %>
</div>
    
<script>
    var endLoading = function () {
    document.body.style.overflow = 'auto';
    document.getElementById('loader').classList.add("loading");
    }
    window.addEventListener('load',endLoading);
</script>
<% } %>
```

2. 在 _config.butterfly.yml 文件的 inject 的 head 处引入如下两个 css 文件

```yaml
- <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/zyoushuo/Blog@latest/hexo/css/loading_style_1.css" > # spinner-box风格样式文件
- <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/zyoushuo/Blog@latest/hexo/css/loading_style_2.css" > # gear风格样式文件
```

3. 在 blogs/themes/butterfly/layout/includes 的目录下，找到 layout.pug 文件。

将下面代码

```code
if theme.preloader
  !=partial('includes/loading/loading', {}, {cache: true})
```

修改为

```code
if theme.preloader
  !=partial('includes/loading/loaded.ejs', {}, {cache: true})
```

4. 在 _config.butterfly.yml 文件中

将下面代码

```yaml
preloader: true
```

修改为

```yaml
# Loading Animation (加載動畫)
preloader:
  enable: true
  layout: gear # gear, spinner-box 两种样式可选
```

#### 友链界面

##### Butterfly 默认样式

1. 前往 blog 目录
2. 输入下面命令

```shell
hexo new page link
```

3. 编辑 blog/source/link.md 文件的开头为

```markdown
---
title: link
date: 2022-05-11 13:05:16
type: "link"
---
```

4. 进入 blog 目录，运行下面命令添加友链

```shell
mkdir source/_data

vim source/_data/link.yml
```

5. 在 link.yml 添加如下内容

```yaml
- class_name: 友情链接
  class_desc: 那些人，那些事
  link_list:
    - name: Hexo
      link: https://hexo.io/zh-tw/
      avatar: https://d33wubrfki0l68.cloudfront.net/6657ba50e702d84afb32fe846bed54fba1a77add/827ae/logo.svg
      descr: A fast, simple & powerful blog framework
    - name: Butterfly
      link: https://butterfly.js.org/
      avatar: https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main/blogs/pictures/20220511153142.png
      descr: A Simple and Card UI Design theme for Hexo

- class_name: 网站
  class_desc: 值得推荐的网站
  link_list:
    - name: 哔哩哔哩
      link: https://www.bilibili.com/
      avatar: https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main/blogs/pictures/20220511134022.png
      descr: 中国优秀的学习网站
    - name: Github
      link: https://github.com/
      avatar: https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main/blogs/pictures/20220511134710.png
      descr: 全球最大的社交编程及代码托管网站
```

##### 进阶样式

注：先完成默认样式

1. 在 blog/themes/butterfly/layout/includes/page 目录下，找到 flink.pug 文件并将其内容全部做如下替换

```js
#article-container
  if top_img === false
    h1.page-title= page.title

  if (theme.flink_style === 'butterfly')
    .flink
      if site.data.link
        each i in site.data.link
          if i.class_name
            h2!= i.class_name
          if i.class_desc
            .flink-desc!=i.class_desc
          .flink-list
            each item in i.link_list
              .flink-list-item
                a(href=url_for(item.link)  title=item.name target="_blank")
                  if theme.lazyload.enable
                    img(data-lazy-src=url_for(item.avatar) onerror=`this.onerror=null;this.src='` + url_for(theme.error_img.flink) + `'` alt=item.name )
                  else
                    img(src=url_for(item.avatar) onerror=`this.onerror=null;this.src='` + url_for(theme.error_img.flink) + `'` alt=item.name )
                  span.flink-item-name= item.name
                  span.flink-item-desc(title=item.descr)= item.descr
      != page.content
  else if (theme.flink_style === 'volantis')
    .flink
      if site.data.link
        each i in site.data.link
          if i.class_name
            h2!= i.class_name
          if i.class_desc
            .flink-desc!=i.class_desc
          .site-card-group
            each item in i.link_list
              a.site-card(target='_blank' rel='noopener' href=url_for(item.link))
                .img
                  - var siteshot = item.siteshot ? url_for(item.siteshot) : 'https://image.thum.io/get/width/400/crop/800/allowJPG/wait/20/noanimate/' + item.link
                  if theme.lazyload.enable
                    img(data-lazy-src=siteshot onerror=`this.onerror=null;this.src='` + url_for(theme.error_img.post_page) + `'` alt='' )
                  else
                    img(src=siteshot onerror=`this.onerror=null;this.src='` + url_for(theme.error_img.flink) + `'` alt='' )
                .info
                  if theme.lazyload.enable
                    img(data-lazy-src=url_for(item.avatar) onerror=`this.onerror=null;this.src='` + url_for(theme.error_img.flink) + `'` alt='' )
                  else
                    img(src=url_for(item.avatar) onerror=`this.onerror=null;this.src='` + url_for(theme.error_img.flink) + `'` alt='' )
                  span.title= item.name
                  span.desc(title=item.descr)= item.descr
      != page.content
  else if (theme.flink_style === 'flexcard')
    .flink
      if site.data.link
        each i in site.data.link
          if i.class_name
            h2!= i.class_name
          if i.class_desc
            .flink-desc!=i.class_desc
          .flink-list
            each item in i.link_list
              a.flink-list-card(href=url_for(item.link) target='_blank' data-title=item.descr)
                .wrapper.cover
                  - var siteshot = item.siteshot ? url_for(item.siteshot) : 'https://image.thum.io/get/width/400/crop/800/allowJPG/wait/20/noanimate/' + item.link
                  if theme.lazyload.enable
                    img.cover.fadeIn(data-lazy-src=siteshot onerror=`this.onerror=null;this.src='` + url_for(theme.error_img.post_page) + `'` alt='' )
                  else
                    img.cover.fadeIn(src=siteshot onerror=`this.onerror=null;this.src='` + url_for(theme.error_img.flink) + `'` alt='' )    
                .info
                  if theme.lazyload.enable
                    img.flink-avatar(data-lazy-src=url_for(item.avatar) onerror=`this.onerror=null;this.src='` + url_for(theme.error_img.flink) + `'` alt='' )
                  else
                    img(src=url_for(item.avatar) onerror=`this.onerror=null;this.src='` + url_for(theme.error_img.flink) + `'` alt='' )
                  span.flink-sitename= item.name
      != page.content
```

2. 在 blog/themes/butterfly/source/css/_page 目录下，找到 flink.styl 文件并将其内容全部做如下替换

```stylus
if hexo-config('flink_style') == 'butterfly'
  .flink#article-container
    .flink-desc
      margin: .2rem 0 .5rem

    .flink-list
      overflow: auto
      padding: 10px 10px 0
      text-align: center

      & > .flink-list-item
        position: relative
        float: left
        overflow: hidden
        margin: 15px 7px
        width: calc(100% / 3 - 15px)
        height: 90px
        border-radius: 8px
        line-height: 17px
        -webkit-transform: translateZ(0)

        +maxWidth1024()
          width: calc(50% - 15px) !important

        +maxWidth600()
          width: calc(100% - 15px) !important

        &:hover
          img
            transform: rotate(360deg)

        &:before
          position: absolute
          top: 0
          right: 0
          bottom: 0
          left: 0
          z-index: -1
          background: var(--text-bg-hover)
          content: ''
          transition: transform .3s ease-out
          transform: scale(0)

        &:hover:before,
        &:focus:before,
        &:active:before
          transform: scale(1)

        a
          color: var(--font-color)
          text-decoration: none

          img
            float: left
            margin: 15px 10px
            width: 60px
            height: 60px
            border-radius: 35px
            transition: all .3s

          .img-alt
            display: none

          .flink-item-name
            @extend .limit-one-line
            display: block
            padding: 16px 10px 0 0
            height: 40px
            font-weight: bold
            font-size: 1.43em

          .flink-item-desc
            @extend .limit-one-line
            display: block
            padding: 16px 10px 16px 0
            height: 50px
            font-size: .93em
else if hexo-config('flink_style') == 'volantis'
  trans($time = 0.28s)
    transition: all $time ease
    -moz-transition: all $time ease
    -webkit-transition: all $time ease
    -o-transition: all $time ease
  .site-card-group
    display: flex
    flex-wrap: wrap
    justify-content: flex-start
    margin: -0.5 * 16px
    align-items: stretch
  .site-card
    margin: 16px * 0.5
    width: "calc(100% / 4 - %s)" % 16px
    @media screen and (min-width: 2048px)
        width: "calc(100% / 5 - %s)" % 16px
    @media screen and (max-width: 768px)
        width: "calc(100% / 3 - %s)" % 16px
    @media screen and (max-width: 500px)
        width: "calc(100% / 2 - %s)" % 16px
    display: block
    line-height: 1.4
    height 100%
    .img
      width: 100%
      height 120px
      @media screen and (max-width: 500px)
        height 100px
      overflow: hidden
      border-radius: 12px * 0.5
      box-shadow: 0 1px 2px 0px rgba(0, 0, 0, 0.2)
      background: #f6f6f6
      img
        width: 100%
        height 100%
        // trans(.75s)
        transition: transform 2s ease
        object-fit: cover

    .info
      margin-top: 16px * 0.5
      img
        width: 32px
        height: 32px
        border-radius: 16px
        float: left
        margin-right: 8px
        margin-top: 2px
      span
        display: block
      .title
        font-weight: 600
        font-size: $fontsize-list
        color: #444
        display: -webkit-box
        -webkit-box-orient: vertical
        overflow: hidden
        -webkit-line-clamp: 1
        trans()
      .desc
        font-size: $fontsize-footnote
        word-wrap: break-word;
        line-height: 1.2
        color: #888
        display: -webkit-box
        -webkit-box-orient: vertical
        overflow: hidden
        -webkit-line-clamp: 2
    .img
      trans()
    &:hover
      .img
        box-shadow: 0 4px 8px 0px rgba(0, 0, 0, 0.1), 0 2px 4px 0px rgba(0, 0, 0, 0.1), 0 4px 8px 0px rgba(0, 0, 0, 0.1), 0 8px 16px 0px rgba(0, 0, 0, 0.1)
      .info .title
        color: #ff5722
else if hexo-config('flink_style') == 'flexcard'
  #article-container img
        margin 0 auto!important
  .flink-list
    overflow auto
    & > a
      width calc(25% - 15px)
      height 130px
      position relative
      display block
      margin 15px 7px
      float left
      overflow hidden
      border-radius 10px
      transition all .3s ease 0s, transform .6s cubic-bezier(.6, .2, .1, 1) 0s
      box-shadow 0 14px 38px rgba(0, 0, 0, .08), 0 3px 8px rgba(0, 0, 0, .06)
      &:hover
        .info
          transform translateY(-100%)
        .wrapper
          img
            transform scale(1.2)
        &:before
          position: fixed
          width:inherit
          margin:auto
          left:0
          right:0
          top:10%
          border-radius: 10px
          text-align: center
          z-index: 100
          content: attr(data-title)
          font-size: 20px
          color: #fff
          padding: 10px
          background-color: rgba($theme-color,0.8)
      .cover
        width 100%
        transition transform .5s ease-out
      .wrapper
        position relative
        .fadeIn
          animation coverIn .8s ease-out forwards
        img
          height 130px
          pointer-events none
      .info
        display flex
        flex-direction column
        justify-content center
        align-items center
        width 100%
        height 100%
        overflow hidden
        border-radius 3px
        background-color hsla(0, 0%, 100%, .7)
        transition transform .5s cubic-bezier(.6, .2, .1, 1) 0s
        img
          position relative
          top 22px //因为字体大小不同，可能导致头像偏高，可以在此处通过修改top的值来微调头像框的位置至卡片正中。
          width 66px
          height 66px
          border-radius 50%
          box-shadow 0 0 10px rgba(0, 0, 0, .3)
          z-index 1
          text-align center
          pointer-events none
        span
          padding 20px 10% 60px 10%
          font-size 16px
          width 100%
          text-align center
          box-shadow 0 0 10px rgba(0, 0, 0, .3)
          background-color hsla(0, 0%, 100%, .7)
          color var(--font-color)
          white-space nowrap
          overflow hidden
          text-overflow ellipsis
  .flink-list>a .info,
  .flink-list>a .wrapper .cover
    position absolute
    top 0
    left 0

  @media screen and (max-width:1024px)
    .flink-list
      & > a
        width calc(33.33333% - 15px)

  @media screen and (max-width:600px)
    .flink-list
      & > a
        width calc(50% - 15px)

  [data-theme=dark]
    .flink-list a .info,
    .flink-list a .info span
      background-color rgba(0, 0, 0, .6)
    .flink-list
      & > a
        &:hover
          &:before
            background-color: rgba(#121212,0.8);
```

3. 在 blog/source/_data/link.yml 文件中增加一条名为 siteshot 的配置选项

```yaml
- name: 花猪
  link: https://cnhuazhu.top/
  avatar: https://cdn.jsdelivr.net/gh/CNhuazhu/Image/avatar.jpg
  descr: 佛系青年
  siteshot: https://cdn.jsdelivr.net/gh/CNhuazhu/Image/WPcover.png # 站点缩略图
```

4. 在 _config.butterfly.yml 文件中新增一条配置

```yaml
# 友链样式，butterfly为默认样式，volantis为站点卡片样式，flexcard为弹性卡片样式
flink_style: volantis # butterfly | volantis | flexcard
```

5. 可以在 _config.butterfly.yml 文件中修改无法显示的图片

```yaml
# Replace Broken Images (替換無法顯示的圖片)
error_img:
  flink: /img/friend_404.gif
  post_page: /img/404.jpg
```

#### Swiper Bar

1. 安装插件，在 blog 目录运行下面指令

```shell
npm install hexo-butterfly-swiper --save
```

2. 在 _config.butterfly.yml 文件添加配置信息

```yaml
# hexo-butterfly-swiper
# see https://akilar.top/posts/8e1264d1/
swiper:
  enable: true # 开关
  priority: 5 #过滤器优先权
  enable_page: all # 应用页面
  timemode: date #date/updated
  layout: # 挂载容器类型
    type: id
    name: recent-posts
    index: 0
  default_descr: 再怎么看我也不知道怎么描述它的啦！
  swiper_css: https://npm.elemecdn.com/hexo-butterfly-swiper/lib/swiper.min.css #swiper css依赖
  swiper_js: https://npm.elemecdn.com/hexo-butterfly-swiper/lib/swiper.min.js #swiper js依赖
  custom_css: https://npm.elemecdn.com/hexo-butterfly-swiper/lib/swiperstyle.css # 适配主题样式补丁
  custom_js: https://npm.elemecdn.com/hexo-butterfly-swiper/lib/swiper_init.js # swiper初始化方法
```

3. 在需要置顶的文章 Markdown 文件的 front_matter 添加 swiper_index 配置项即可

```markdown
swiper_index: 1 #置顶轮播图顺序，非负整数，数字越大越靠前
```

#### 自定义静态网页

1. 在 blog/source 目录下新建一个 blog-LeadPage 文件夹，在其中添加写好的 index.html 文件。

2. 在 _config.butterfly.yml 文件的 menu 位置添加页面的链接

```yaml
LeadPage: /blog-LeadPage/ || fas fa-gift
```

3. 在 config.yml 文件的 skip_render 位置添加属性

```yaml
skip_render: 
    - blog-LeadPage/**  # 表示blog-LeadPage文件里面的内容不会被站点渲染
```

#### 标签外挂

1. 在 blog/themes/Butterfly/source/css 路径下创建 tag.css 文件，并写入下面内容：

```css
span.btn {
  display: inline;
}

span.btn > a {
  display: inline-block;
  background: #2196f3;
  color: #fff;
  padding: 4px 4px 2px 4px;
  margin: 2px;
  line-height: 1.1;
  border-radius: 2px;
  transition: all 0.28s ease;
  -moz-transition: all 0.28s ease;
  -webkit-transition: all 0.28s ease;
  -o-transition: all 0.28s ease;
}

span.btn > a i {
  margin-right: 2px;
}

span.btn > a:hover {
  color: #fff;
  background: #ff5722;
}

span.btn > a:not([href]) {
  opacity: 0.5;
}

span.btn > a:not([href]):hover {
  cursor: not-allowed;
}

span.btn.regular > a {
  padding: 8px 12px 6px 12px;
}

span.btn.regular > a i {
  margin-right: 4px;
}

span.btn.large > a {
  padding: 12px 36px 10px 36px;
}

span.btn.large > a i {
  margin-right: 8px;
}

span.btn.center {
  display: block;
  text-align: center;
}

[data-theme="dark"] div.btns {
  filter: brightness(0.7);
}

[data-theme="dark"] div.btns a {
  background: 0 0;
}

div.btns {
  margin: 0 -8px;
  display: flex;
  flex-wrap: wrap;
  align-items: flex-start;
  overflow: visible;
  line-height: 1.8;
}

div.btns,
div.btns p,
div.btns a {
  font-size: 0.8125rem;
  color: #555;
}

div.btns b {
  font-size: 0.875rem;
}

div.btns.wide > a {
  padding-left: 32px;
  padding-right: 32px;
}

div.btns.fill > a {
  flex-grow: 1;
  width: auto;
}

div.btns.around {
  justify-content: space-around;
}

div.btns.center {
  justify-content: center;
}

div.btns.grid2 > a {
  width: calc(100% / 2 - 16px);
}

@media screen and (max-width: 1024px) {
  div.btns.grid2 > a {
	width: calc(100% / 2 - 16px);
  }
}

@media screen and (max-width: 768px) {
  div.btns.grid2 > a {
	width: calc(100% / 2 - 16px);
  }
}

@media screen and (max-width: 500px) {
  div.btns.grid2 > a {
	width: calc(100% / 1 - 16px);
  }
}

div.btns.grid3 > a {
  width: calc(100% / 3 - 16px);
}

@media screen and (max-width: 1024px) {
  div.btns.grid3 > a {
	width: calc(100% / 3 - 16px);
  }
}

@media screen and (max-width: 768px) {
  div.btns.grid3 > a {
	width: calc(100% / 3 - 16px);
  }
}

@media screen and (max-width: 500px) {
  div.btns.grid3 > a {
	width: calc(100% / 1 - 16px);
  }
}

div.btns.grid4 > a {
  width: calc(100% / 4 - 16px);
}

@media screen and (max-width: 1024px) {
  div.btns.grid4 > a {
	width: calc(100% / 3 - 16px);
  }
}

@media screen and (max-width: 768px) {
  div.btns.grid4 > a {
	width: calc(100% / 3 - 16px);
  }
}

@media screen and (max-width: 500px) {
  div.btns.grid4 > a {
	width: calc(100% / 2 - 16px);
  }
}

div.btns.grid5 > a {
  width: calc(100% / 5 - 16px);
}

@media screen and (max-width: 1024px) {
  div.btns.grid5 > a {
	width: calc(100% / 4 - 16px);
  }
}

@media screen and (max-width: 768px) {
  div.btns.grid5 > a {
	width: calc(100% / 3 - 16px);
  }
}

@media screen and (max-width: 500px) {
  div.btns.grid5 > a {
	width: calc(100% / 2 - 16px);
  }
}

div.btns a {
  transition: all 0.28s ease;
  -moz-transition: all 0.28s ease;
  -webkit-transition: all 0.28s ease;
  -o-transition: all 0.28s ease;
  margin: 8px;
  margin-top: calc(1.25 * 16px + 32px);
  min-width: 120px;
  font-weight: bold;
  display: flex;
  justify-content: flex-start;
  align-content: center;
  align-items: center;
  flex-direction: column;
  padding: 8px;
  text-align: center;
  background: #f6f6f6;
  border-radius: 4px;
}

div.btns a > img:first-child,
div.btns a > i:first-child {
  transition: all 0.28s ease;
  -moz-transition: all 0.28s ease;
  -webkit-transition: all 0.28s ease;
  -o-transition: all 0.28s ease;
  height: 64px;
  width: 64px;
  box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.1);
  margin: 16px 8px 4px 8px;
  margin-top: calc(-1.25 * 16px - 32px);
  border: 2px solid #fff;
  background: #fff;
  line-height: 60px;
  font-size: 28px;
}

div.btns a > img:first-child.auto,
div.btns a > i:first-child.auto {
  width: auto;
}

div.btns a > i:first-child {
  color: #fff;
  background: #2196f3;
}

div.btns a p,
div.btns a b {
  margin: 0.25em;
  font-weight: normal;
  line-height: 1.25;
  word-wrap: break-word;
}

div.btns a b {
  font-weight: bold;
  line-height: 1.3;
}

div.btns a img {
  margin: 0.4em auto;
}

div.btns a:not([href]) {
  cursor: default;
  color: inherit;
}

div.btns a[href]:hover {
  background: rgba(255, 87, 34, 0.15);
}

div.btns a[href]:hover,
div.btns a[href]:hover b {
  color: #ff5722;
}

div.btns a[href]:hover > img:first-child,
div.btns a[href]:hover > i:first-child {
  transform: scale(1.1) translateY(-8px);
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1);
}

div.btns a[href]:hover > i:first-child {
  background: #ff5722;
}

div.btns.circle a > img:first-child,
div.btns.circle a > i:first-child {
  border-radius: 32px;
}

div.btns.rounded a > img:first-child,
div.btns.rounded a > i:first-child {
  border-radius: 16px;
}

[data-theme="dark"] .checkbox {
  filter: brightness(0.7);
}

.checkbox {
  display: flex;
  align-items: center;
}

.checkbox input {
  -webkit-appearance: none;
  -moz-appearance: none;
  -ms-appearance: none;
  -o-appearance: none;
  appearance: none;
  position: relative;
  height: 16px;
  width: 16px;
  transition: all 0.15s ease-out 0s;
  cursor: pointer;
  display: inline-block;
  outline: none;
  border-radius: 2px;
  flex-shrink: 0;
  margin-right: 8px;
}

.checkbox input[type="checkbox"]:before,
.checkbox input[type="checkbox"]:after {
  position: absolute;
  content: "";
  background: #fff;
}

.checkbox input[type="checkbox"]:before {
  left: 1px;
  top: 5px;
  width: 0;
  height: 2px;
  transition: all 0.2s ease-in;
  transform: rotate(45deg);
  -webkit-transform: rotate(45deg);
  -moz-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  -o-transform: rotate(45deg);
}

.checkbox input[type="checkbox"]:after {
  right: 7px;
  bottom: 3px;
  width: 2px;
  height: 0;
  transition: all 0.2s ease-out;
  transform: rotate(40deg);
  -webkit-transform: rotate(40deg);
  -moz-transform: rotate(40deg);
  -ms-transform: rotate(40deg);
  -o-transform: rotate(40deg);
  transition-delay: 0.25s;
}

.checkbox input[type="checkbox"]:checked:before {
  left: 0;
  top: 7px;
  width: 6px;
  height: 2px;
}

.checkbox input[type="checkbox"]:checked:after {
  right: 3px;
  bottom: 1px;
  width: 2px;
  height: 10px;
}

.checkbox.minus input[type="checkbox"]:before {
  transform: rotate(0);
  left: 1px;
  top: 5px;
  width: 0;
  height: 2px;
}

.checkbox.minus input[type="checkbox"]:after {
  transform: rotate(0);
  left: 1px;
  top: 5px;
  width: 0;
  height: 2px;
}

.checkbox.minus input[type="checkbox"]:checked:before {
  left: 1px;
  top: 5px;
  width: 10px;
  height: 2px;
}

.checkbox.minus input[type="checkbox"]:checked:after {
  left: 1px;
  top: 5px;
  width: 10px;
  height: 2px;
}

.checkbox.plus input[type="checkbox"]:before {
  transform: rotate(0);
  left: 1px;
  top: 5px;
  width: 0;
  height: 2px;
}

.checkbox.plus input[type="checkbox"]:after {
  transform: rotate(0);
  left: 5px;
  top: 1px;
  width: 2px;
  height: 0;
}

.checkbox.plus input[type="checkbox"]:checked:before {
  left: 1px;
  top: 5px;
  width: 10px;
  height: 2px;
}

.checkbox.plus input[type="checkbox"]:checked:after {
  left: 5px;
  top: 1px;
  width: 2px;
  height: 10px;
}

.checkbox.times input[type="checkbox"]:before {
  transform: rotate(45deg);
  left: 3px;
  top: 1px;
  width: 0;
  height: 2px;
}

.checkbox.times input[type="checkbox"]:after {
  transform: rotate(135deg);
  right: 3px;
  top: 1px;
  width: 0;
  height: 2px;
}

.checkbox.times input[type="checkbox"]:checked:before {
  left: 1px;
  top: 5px;
  width: 10px;
  height: 2px;
}

.checkbox.times input[type="checkbox"]:checked:after {
  right: 1px;
  top: 5px;
  width: 10px;
  height: 2px;
}

.checkbox input[type="radio"] {
  border-radius: 50%;
}

.checkbox input[type="radio"]:before {
  content: "";
  display: block;
  width: 8px;
  height: 8px;
  border-radius: 50%;
  margin: 2px;
  transform: scale(0);
  transition: all 0.25s ease-out;
}

.checkbox input[type="radio"]:checked:before {
  transform: scale(1);
}

.checkbox input {
  border: 2px solid #2196f3;
}

.checkbox input[type="checkbox"]:checked {
  background: #2196f3;
}

.checkbox input[type="radio"]:checked:before {
  background: #2196f3;
}

.checkbox.red input {
  border-color: #fe5f58;
}

.checkbox.red input[type="checkbox"]:checked {
  background: #fe5f58;
}

.checkbox.red input[type="radio"]:checked:before {
  background: #fe5f58;
}

.checkbox.green input {
  border-color: #3dc550;
}

.checkbox.green input[type="checkbox"]:checked {
  background: #3dc550;
}

.checkbox.green input[type="radio"]:checked:before {
  background: #3dc550;
}

.checkbox.yellow input {
  border-color: #ffbd2b;
}

.checkbox.yellow input[type="checkbox"]:checked {
  background: #ffbd2b;
}

.checkbox.yellow input[type="radio"]:checked:before {
  background: #ffbd2b;
}

.checkbox.cyan input {
  border-color: #1bcdfc;
}

.checkbox.cyan input[type="checkbox"]:checked {
  background: #1bcdfc;
}

.checkbox.cyan input[type="radio"]:checked:before {
  background: #1bcdfc;
}

.checkbox.blue input {
  border-color: #2196f3;
}

.checkbox.blue input[type="checkbox"]:checked {
  background: #2196f3;
}

.checkbox.blue input[type="radio"]:checked:before {
  background: #2196f3;
}

.checkbox p {
  display: inline-block;
  margin-top: 2px !important;
  margin-bottom: 0 !important;
}

[data-theme="dark"] details {
  filter: brightness(0.7);
}

details {
  display: block;
  padding: 16px;
  margin: 0.5rem 0;
  border-radius: 4px;
  font-size: 0.7375rem;
  transition: all 0.28s ease;
  -moz-transition: all 0.28s ease;
  -webkit-transition: all 0.28s ease;
  -o-transition: all 0.28s ease;
  border: 1px solid #f6f6f6;
}

details summary {
  cursor: pointer;
  padding: 16px;
  margin: -16px;
  border-radius: 4px;
  color: rgba(85, 85, 85, 0.7);
  font-size: 0.7375rem;
  font-weight: bold;
  position: relative;
  line-height: normal;
}

details summary > p,
details summary > h1,
details summary > h2,
details summary > h3,
details summary > h4,
details summary > h5,
details summary > h6 {
  display: inline;
  border-bottom: none !important;
}

details summary:hover {
  color: #555;
}

details summary:hover:after {
  position: absolute;
  content: "+";
  text-align: center;
  top: 50%;
  transform: translateY(-50%);
  right: 16px;
}

details > summary {
  background: #f6f6f6;
}

details[blue] {
  border-color: #e8f4fd;
}

details[blue] > summary {
  background: #e8f4fd;
}

details[cyan] {
  border-color: #e8fafe;
}

details[cyan] > summary {
  background: #e8fafe;
}

details[green] {
  border-color: #ebf9ed;
}

details[green] > summary {
  background: #ebf9ed;
}

details[yellow] {
  border-color: #fff8e9;
}

details[yellow] > summary {
  background: #fff8e9;
}

details[red] {
  border-color: #feefee;
}

details[red] > summary {
  background: #feefee;
}

details[open] {
  border-color: rgba(85, 85, 85, 0.2);
}

details[open] > summary {
  border-bottom: 1px solid rgba(85, 85, 85, 0.2);
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
}

details[open][blue] {
  border-color: rgba(33, 150, 243, 0.3);
}

details[open][blue] > summary {
  border-bottom-color: rgba(33, 150, 243, 0.3);
}

details[open][cyan] {
  border-color: rgba(27, 205, 252, 0.3);
}

details[open][cyan] > summary {
  border-bottom-color: rgba(27, 205, 252, 0.3);
}

details[open][green] {
  border-color: rgba(61, 197, 80, 0.3);
}

details[open][green] > summary {
  border-bottom-color: rgba(61, 197, 80, 0.3);
}

details[open][yellow] {
  border-color: rgba(255, 189, 43, 0.3);
}

details[open][yellow] > summary {
  border-bottom-color: rgba(255, 189, 43, 0.3);
}

details[open][red] {
  border-color: rgba(254, 95, 88, 0.3);
}

details[open][red] > summary {
  border-bottom-color: rgba(254, 95, 88, 0.3);
}

details[open] > summary {
  color: #555;
  margin-bottom: 0;
}

details[open] > summary:hover:after {
  content: "-";
}

details[open] > div.content {
  padding: 16px;
  margin: -16px;
  margin-top: 0;
}

details[open] > div.content p > a:hover {
  text-decoration: underline;
}

[data-theme="dark"] span.p {
  filter: brightness(0.7);
}

p.p.subtitle {
  font-weight: bold;
  color: #2196f3;
  padding-top: 1rem;
}

p.p.subtitle:first-child {
  padding-top: 0.5rem;
}

span.p.code,
p.p.code {
  font-family: Menlo, Monaco, monospace, courier, sans-serif;
}

span.p.left,
p.p.left {
  display: block;
  text-align: left;
}

span.p.center,
p.p.center {
  display: block;
  text-align: center;
}

span.p.right,
p.p.right {
  display: block;
  text-align: right;
}

span.p.small,
p.p.small {
  font-size: 0.575rem;
}

span.p.large,
p.p.large {
  font-size: 2rem;
  line-height: 1.4;
}

span.p.huge,
p.p.huge {
  font-size: 4rem;
  line-height: 1.4;
}

span.p.ultra,
p.p.ultra {
  font-size: 6rem;
  line-height: 1.4;
}

span.p.small,
p.p.small,
span.p.large,
p.p.large,
span.p.huge,
p.p.huge,
span.p.ultra,
p.p.ultra {
  font-family: UbuntuMono, "PingFang SC", "Microsoft YaHei", Helvetica, Arial,
	Menlo, Monaco, monospace, sans-serif;
  margin: 0;
  padding: 0;
}

span.p.bold,
p.p.bold {
  font-weight: bold;
}

span.p.h1,
p.p.h1 {
  font-size: 1.625rem;
  color: #555;
  padding-top: 1rem;
}

span.p.h2,
p.p.h2 {
  font-size: 1.375rem;
  color: var(--font-color);
  padding-top: 1rem;
  border-bottom: 1px solid var(--hr-border);
}

span.p.h3,
p.p.h3 {
  font-size: 1.25rem;
  color: #2196f3;
  padding-top: 1rem;
}

span.p.h4,
p.p.h4 {
  font-size: 1.125rem;
  color: #555;
  padding-top: 1rem;
}

span.p.red,
p.p.red {
  color: #fe5f58;
}

span.p.yellow,
p.p.yellow {
  color: #ffbd2b;
}

span.p.green,
p.p.green {
  color: #3dc550;
}

span.p.cyan,
p.p.cyan {
  color: #1bcdfc;
}

span.p.blue,
p.p.blue {
  color: #2196f3;
}

span.p.gray,
p.p.gray {
  color: #666;
}
/*tag end*/

/*note标签 https://lovelijunyi.gitee.io/posts/c898.html*/
div.note.red::before {
  content: "\f054";
}

div.note.quote {
  background: #e8f4fd;
  border-color: #2196f3;
}

div.note.quote::before {
  color: #2196f3;
  content: "\f10d";
}

div.note.radiation::before {
  content: "\f7b9";
}

div.note.bug::before {
  content: "\f188";
}

div.note.idea::before {
  content: "\f0eb";
}

div.note.link::before {
  content: "\f0c1";
}

div.note.paperclip::before {
  content: "\f0c6";
}

div.note.todo::before {
  content: "\f0ae";
}

div.note.message::before {
  content: "\f4ad";
}

div.note.guide::before {
  content: "\f277";
}

div.note.download::before {
  content: "\f019";
}

div.note.up::before {
  content: "\f102";
}

div.note.undo::before {
  content: "\f2ea";
}

div.note.play::before {
  content: "\f144";
}

div.note.message::before {
  content: '\f4ad';
}

div.note.clear {
  background: none;
  border-color: none;
}

div.note.light {
  background: #f6f6f6;
  border-color: #aaa;
}

div.note.light::before {
  color: #aaa;
}

div.note.gray {
  background: #f6f6f6;
  border-color: #767676;
}

div.note.gray::before {
  color: #767676;
}

div.note.red {
  background: #feefee;
  border-color: #fe5f58;
}

div.note.red::before {
  color: #fe5f58;
}

div.note.yellow {
  background: #fff8e9;
  border-color: #ffbd2b;
}

div.note.yellow::before {
  color: #ffbd2b;
}

div.note.green {
  background: #ebf9ed;
  border-color: #3dc550;
}

div.note.green::before {
  color: #3dc550;
}

div.note.cyan::before {
  color: #1bcdfc;
}

div.note.blue::before {
  color: #2196f3;
}

div.note.blue {
  background: #e8f4fd;
  border-color: #2196f3;
}

[data-theme="dark"] .note p{
  color: #000;
}
/*note标签结束*/

/* 标签显影 */
#article-container psw:hover {
  color: #333;
  background: none;
}

#article-container psw {
  color: transparent;
  background: #666;
  border-radius: 2px;
  transition: all 0.28s ease;
  -moz-transition: all 0.28s ease;
  -webkit-transition: all 0.28s ease;
  -o-transition: all 0.28s ease;
}

[data-theme="dark"] #article-container psw:hover {
  color: #fff;
  filter: brightness(0.7);
}
/* 标签显影END */

/* 时间线 */
div.timenode {
  position: relative;
}
div.timenode:before,
div.timenode:after {
  content: "";
  z-index: 1;
  position: absolute;
  background: rgba(68, 215, 182, 0.5);
  width: 2px;
  left: 7px;
}
div.timenode:before {
  top: 0;
  height: 6px;
}
div.timenode:after {
  top: 26px;
  height: calc(100% - 26px);
}
div.timenode:last-child:after {
  height: calc(100% - 26px - 16px);
  border-bottom-left-radius: 2px;
  border-bottom-right-radius: 2px;
}
div.timenode .meta,
div.timenode .body {
  max-width: calc(100% - 24px);
}
div.timenode .meta {
  position: relative;
  color: var(--tab-botton-color);
  font-size: 0.375rem;
  line-height: 32px;
  height: 32px;
}
div.timenode .meta:before,
div.timenode .meta:after {
  content: "";
  position: absolute;
  top: 8px;
  z-index: 2;
}
div.timenode .meta:before {
  background: rgba(68, 215, 182, 0.5);
  width: 16px;
  height: 16px;
  border-radius: 8px;
}
div.timenode .meta:after {
  background: #44d7b6;
  margin-left: 2px;
  margin-top: 2px;
  width: 12px;
  height: 12px;
  border-radius: 6px;
  transform: scale(0.5);
}
div.timenode .meta p {
  font-weight: bold !important;
  margin: 0 0 0 24px !important;
}
div.timenode .body {
  margin: 4px 0 10px 24px;
  padding: 10px;
  border-radius: 12px;
  background: #efeded;
  display: inline-block;
}
div.timenode .body p:first-child {
  margin-top: 0 !important;
}
div.timenode .body p:last-child {
  margin-bottom: 0 !important;
}
div.timenode .body .highlight {
  background: #fff7ea;
  filter: grayscale(0%);
}
div.timenode .body .highlight figcaption {
  background: #ffeed2;
}
div.timenode .body .highlight .gutter {
  background: #ffedd0;
}
div.timenode:hover .meta {
  color: #444;
}
div.timenode:hover .meta:before {
  background: rgba(255, 87, 34, 0.5);
}
div.timenode:hover .meta:after {
  background: #ff5722;
  transform: scale(1);
}

[data-theme="dark"] div.timenode .body {
  background: #2c2c2c;
}

[data-theme="dark"] div.timenode:hover .meta {
  color: #ccd0d7;
}

[data-theme="dark"] div.timenode .meta {
  color: rgba(255, 255, 255, 0.6);
}

[data-theme="dark"] div.timeline p.p.h2 {
  color: rgba(255, 255, 255, 0.6);
}

/* link */
#article-container a.link-card {
  margin: 0.25rem auto;
  background: #f6f6f6;
  display: inline-flex;
  align-items: center;
  cursor: pointer;
  text-align: center;
  min-width: 200px;
  max-width: 361px;
  color: #444;
  border-radius: 12px;
  text-decoration: none;
}
@media screen and (max-width: 425px) {
  #article-container a.link-card {
	max-width: 100%;
  }
}
@media screen and (max-width: 375px) {
  #article-container a.link-card {
	width: 100%;
  }
}
#article-container a.link-card:hover {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1);
}
#article-container a.link-card div.left,
#article-container a.link-card div.right {
  pointer-events: none;
}
#article-container a.link-card div.left {
  width: 48px;
  height: 48px;
  margin: 12px;
  overflow: hidden;
  flex-shrink: 0;
  position: relative;
}
#article-container a.link-card div.left i {
  font-size: 32px;
  line-height: 48px;
  margin-left: 4px;
}
#article-container a.link-card div.left img {
  display: block;
  position: absolute;
  border-radius: 8px / 4;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
#article-container a.link-card div.right {
  overflow: hidden;
  margin-right: 12px;
}
#article-container a.link-card p {
  margin: 0;
}
#article-container a.link-card p.text {
  font-weight: bold;
}
#article-container a.link-card p.url {
  flex-shrink: 0;
  color: rgba(68, 68, 68, 0.65);
  font-size: 13px;
}

[data-theme="dark"] #article-container a.link-card img {
  filter: brightness(1);
}

[data-theme="dark"] #article-container a.link-card {
  filter: brightness(0.7);
}
```

2. 在 _config.butterfly.yml 文件的 inject 的 head 处引入上一步创建的 css 文件

```yaml
- <link rel="stylesheet" href="/css/tag.css">
```

3. 下载 [hexo-theme-volantis](https://github.com/volantis-x/hexo-theme-volantis/tree/dev/scripts/tags) 主题，复制 scripts\tags 下的主题到 blog/themes/Butterfly/scripts/tag 中，仅复制以下内容即可：

```
btns.js
checkbox.js
folding.js
link.js
span.js
timeline.js
```

4. 使用效果

```code
# 语法格式
{% note 样式参数 %}
文本内容
{% endnote %}

# 参数列表
info	  蓝色叹号
warning   黄色叹号
done      绿色打钩
success   绿色打钩
error     红色禁止
danger    红色打叉

# 示例
{% note default %}
default 标签外挂
{% endnote %}

{% note primary %}
primary 标签外挂
{% endnote %}

{% note success %}
success 标签外挂
{% endnote %}

{% note danger %}
danger 标签外挂
{% endnote %}

{% note info %}
info 标签外挂
{% endnote %}

{% note warning %}
warning 标签外挂
{% endnote %}
```

效果

{% note default %}
default 标签外挂
{% endnote %}

{% note primary %}
primary 标签外挂
{% endnote %}

{% note success %}
success 标签外挂
{% endnote %}

{% note danger %}
danger 标签外挂
{% endnote %}

{% note info %}
info 标签外挂
{% endnote %}

{% note warning %}
warning 标签外挂
{% endnote %}

#### 彩色文本段落

注：配置同标签外挂

```code
# 语法格式
# 行内文本
{% span 样式参数, 文本内容 %}

# 独立段落
{% p 样式参数, 文本内容 %}

# 参数列表
# 样式参数位置可以写颜色、大小和对齐方向，多个样式参数用空格隔开
# 字体
logo, code

# 颜色
red, yellow, green, cyan, blue, gray

# 大小
small, h4, h3, h2, h1, large, huge, ultra

# 对齐方向
left, center, right

# 示例
# 彩色文本
在一段话中方便插入各种颜色的标签，包括：{% span red, 红色 %}、{% span yellow, 黄色 %}、{% span green, 绿色 %}、{% span cyan, 青色 %}、{% span blue, 蓝色 %}、{% span gray, 灰色 %}。

# 超大文字
文档「开始」页面中的标题部分就是超大文字。

{% p center logo large, Volantis %}
{% p center small, A Wonderful Theme for Hexo %}
```

效果

在一段话中方便插入各种颜色的标签，包括：{% span red, 红色 %}、{% span yellow, 黄色 %}、{% span green, 绿色 %}、{% span cyan, 青色 %}、{% span blue, 蓝色 %}、{% span gray, 灰色 %}。


文档「开始」页面中的标题部分就是超大文字。

{% p center logo large, Volantis %}
{% p center small, A Wonderful Theme for Hexo %}

#### 复选框

注：配置同标签外挂

```code
# 语法格式
{% checkbox 样式参数（可选）, 文本（支持简单md） %}

# 参数列表
# 颜色
red, yellow, green, cyan, blue

# 样式
plus, minus, times

# 选中状态
checked

# 示例
# Checkbox
{% checkbox 纯文本测试 %}
{% checkbox checked, 支持简单的 [markdown](https://guides.github.com/features/mastering-markdown/) 语法 %}
{% checkbox red, 支持自定义颜色 %}
{% checkbox green checked, 绿色 + 默认选中 %}
{% checkbox yellow checked, 黄色 + 默认选中 %}
{% checkbox cyan checked, 青色 + 默认选中 %}
{% checkbox blue checked, 蓝色 + 默认选中 %}
{% checkbox plus green checked, 增加 %}
{% checkbox minus yellow checked, 减少 %}
{% checkbox times red checked, 叉 %}

# Radio
{% radio 纯文本测试 %}
{% radio checked, 支持简单的 [markdown](https://guides.github.com/features/mastering-markdown/) 语法 %}
{% radio red, 支持自定义颜色 %}
{% radio green, 绿色 %}
{% radio yellow, 黄色 %}
{% radio cyan, 青色 %}
{% radio blue, 蓝色 %}
```

效果

{% checkbox 纯文本测试 %}
{% checkbox checked, 支持简单的 [markdown](https://guides.github.com/features/mastering-markdown/) 语法 %}
{% checkbox red, 支持自定义颜色 %}
{% checkbox green checked, 绿色 + 默认选中 %}
{% checkbox yellow checked, 黄色 + 默认选中 %}
{% checkbox cyan checked, 青色 + 默认选中 %}
{% checkbox blue checked, 蓝色 + 默认选中 %}
{% checkbox plus green checked, 增加 %}
{% checkbox minus yellow checked, 减少 %}
{% checkbox times red checked, 叉 %}

{% radio 纯文本测试 %}
{% radio checked, 支持简单的 [markdown](https://guides.github.com/features/mastering-markdown/) 语法 %}
{% radio red, 支持自定义颜色 %}
{% radio green, 绿色 %}
{% radio yellow, 黄色 %}
{% radio cyan, 青色 %}
{% radio blue, 蓝色 %}

#### 富文本按钮

注：配置同标签外挂

```code
# 参数列表
# 样式参数位置可以写图片样式、布局方式，多个样式参数用空格隔开。
# 圆角样式，默认为方形
rounded, circle


# 布局方式
# 默认为自动宽度，适合视野内只有一两个的情况。
wide    # 宽一点的按钮
fill    # 填充布局，自动铺满至少一行，多了会换行。
center  # 居中，按钮之间是固定间距。
around  # 居中分散
grid2   # 等宽最多 2 列，屏幕变窄会适当减少列数。
grid3   # 等宽最多 3 列，屏幕变窄会适当减少列数。
grid4   # 等宽最多 4 列，屏幕变窄会适当减少列数。
grid5   # 等宽最多 5 列，屏幕变窄会适当减少列数。

# 增加文字样式
# 可以在容器内增加 <b>标题</b> 和 <p>描述文字</p>

# 示例

# 圆形图标 + 标题 + 描述 + 图片 + 网格 5 列 + 居中
{% btns circle center grid5 %}
<a href='https://apps.apple.com/cn/app/heart-mate-pro-hrm-utility/id1463348922?ls=1'>
  <i class='fab fa-apple'></i>
  <b>心率管家</b>
  {% p red, 专业版 %}
  <img src='https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main/blogs/pictures/20220511162345.png'>
</a>
<a href='https://apps.apple.com/cn/app/heart-mate-lite-hrm-utility/id1475747930?ls=1'>
  <i class='fab fa-apple'></i>
  <b>心率管家</b>
  {% p green, 免费版 %}
  <img src='https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main/blogs/pictures/20220511162303.png'>
</a>
{% endbtns %}
```

效果

{% btns circle center grid5 %}
<a href='https://apps.apple.com/cn/app/heart-mate-pro-hrm-utility/id1463348922?ls=1'>
  <i class='fab fa-apple'></i>
  <b>心率管家</b>
  {% p red, 专业版 %}
  <img src='https://cos.luyf-lemon-love.space/images/20220511162345.png'>
</a>
<a href='https://apps.apple.com/cn/app/heart-mate-lite-hrm-utility/id1475747930?ls=1'>
  <i class='fab fa-apple'></i>
  <b>心率管家</b>
  {% p green, 免费版 %}
  <img src='https://cos.luyf-lemon-love.space/images/20220511162303.png'>
</a>
{% endbtns %}

#### Folding

注：配置同标签外挂

```code
# 语法格式
{% folding 参数（可选）, 标题 %}

![](https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main/blogs/pictures/20220511162220.png)

{% endfolding %}

# 参数列表
# 参数位置可以填写颜色和状态，多个参数用空格隔开
# 颜色
blue, cyan, green, yellow, red

# 状态
状态填写 open 代表默认打开

# 示例
{% folding 查看图片测试 %}

![](https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main/blogs/pictures/20220511162004.png)

{% endfolding %}

{% folding cyan open, 查看默认打开的折叠框 %}

这是一个默认打开的折叠框。

{% endfolding %}

{% folding green, 查看代码测试 %}

(```python)
# 代码块语法：使用一对```将代码块包围起来。（这里加了括号是为了防止转义，因为这篇博文是使用 Markdown 写的）
print("hello world)
(```)

{% endfolding %}

{% folding yellow, 查看列表测试 %}

- haha
- hehe

{% endfolding %}

{% folding red, 查看嵌套测试 %}

{% folding blue, 查看嵌套测试2 %}

{% folding 查看嵌套测试3 %}

![](https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main/blogs/pictures/20220511161739.png)

{% endfolding %}

{% endfolding %}

{% endfolding %}
```

效果

{% folding 查看图片测试 %}

![](https://cos.luyf-lemon-love.space/images/20220511162004.png)

{% endfolding %}

{% folding cyan open, 查看默认打开的折叠框 %}

这是一个默认打开的折叠框。

{% endfolding %}

{% folding green, 查看代码测试 %}

```python
# 代码块语法：使用一对```将代码块包围起来。（这里加了括号是为了防止转义，因为这篇博文是使用 Markdown 写的）
print("hello world)
```

{% endfolding %}

{% folding yellow, 查看列表测试 %}

- haha
- hehe

{% endfolding %}

{% folding red, 查看嵌套测试 %}

{% folding blue, 查看嵌套测试2 %}

{% folding 查看嵌套测试3 %}

![](https://cos.luyf-lemon-love.space/images/20220511161739.png)

{% endfolding %}

{% endfolding %}

{% endfolding %}

#### 密码样式的文本

注：配置同标签外挂

```code
# 语法格式
<psw>你要隐藏的内容</psw>

# 示例
<psw>你能看见我吗？</psw>
```

效果

<psw>你能看见我吗？</psw>

#### Link

注：配置同标签外挂

```code
# 语法格式
{% link 标题, 链接, 图片 %}

# 示例
{% link 苏苏镇可爱, https://luyf-lemon-love.github.io/, https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main/blogs/pictures/20220511161856.png %}
```

效果

{% link 苏苏真可爱, https://luyf-lemon-love.github.io/, https://cos.luyf-lemon-love.space/images/20220511161856.png %}

#### 访客信息

1. 必须确保使用了**彩色文本段落**

2. 在 blog/themes/butterfly/layout/includes/widget 目录下创建 card_ip.pug 文件，并写入以下内容

```code
.card-widget.card-ip
  .card-content
  .item-headline
    i.fa.fa-user(aria-hidden="true")
    span= _p('aside.card_ip')
  .ip_content
   = _p('欢迎来自 ')
   span(class="p red")= _p('未知区域')
   = _p(' 的小伙伴')
   br
   = _p('访问IP为： ')
   span(class="p cyan")= _p('未知IP')
   br
   = _p('浏览器版本：')
   span(class="p blue")= _p('未知浏览器')
```

3. 在 blog/themes/butterfly/layout/includes/widget/index.pug 文件中添加如下内容

```code
if theme.aside.card_ip
  !=partial('includes/widget/card_ip', {}, { cache:true })
```

具体位置如下图所示

![](https://cos.luyf-lemon-love.space/images/20220511223806.png)

4. 编辑 blog/themes/butterfly/languages/zh-CN.yml 文件， 在 aside 处添加 `card_ip: 当前访问用户` 代码，如下图所示

![](https://cos.luyf-lemon-love.space/images/20220511224229.png)

5. 在 _config.butterfly.yml 文件的 aside 处添加代码 `card_ip: true`，如下图所示

![](https://cos.luyf-lemon-love.space/images/20220511224521.png)

6. 在 blog/themes/butterfly/source/js 下创建 ip_content.js，并添加如下代码

```js
//获取当前IP地址和浏览器标识
function getBrowserInfo() {
    var agent = navigator.userAgent.toLowerCase();

    var regStr_ie = /msie [\d.]+;/gi;
    var regStr_ff = /firefox\/[\d.]+/gi
    var regStr_chrome = /chrome\/[\d.]+/gi;
    var regStr_saf = /safari\/[\d.]+/gi;

    //IE
    if (agent.indexOf("msie") > 0) {
        return agent.match(regStr_ie);
    }

    //firefox
    if (agent.indexOf("firefox") > 0) {
        return agent.match(regStr_ff);
    }

    //Chrome
    if (agent.indexOf("chrome") > 0) {
        return agent.match(regStr_chrome);
    }

    //Safari
    if (agent.indexOf("safari") > 0 && agent.indexOf("chrome") < 0) {
        return agent.match(regStr_saf);
    }
}

var ip_content = document.querySelector(".ip_content");

if (ip_content != null && typeof (returnCitySN) != undefined) {
    ip_content.innerHTML = '欢迎来自 <span class="p red">' + returnCitySN["cname"] + "</span> 的小伙伴<br>" + "访问IP为： <span class='p cyan'>" + returnCitySN["cip"] + "</span><br>浏览器版本：<span class='p blue'>" + getBrowserInfo() + '</span>';
}
```

7. 在 _config.butterfly.yml 文件的 inject 的 bottom 处引入以下内容

```yaml
- <script src="https://pv.sohu.com/cityjson?ie=utf-8"></script>
- <script src="/js/ip_content.js"></script>
```

#### 随机诗词展示

1. 在 blog 目录下运行下面的命令

```shell
hexo n page "Message"
mkdir ./source/Message
```

2. 在 blog/source/Message/index.md 文件中，添加如下代码

```markdown
---
title: Message
date: 2022-05-11 23:03:38
type: "Message"
---
<div class="poem-wrap">
  <div class="poem-border poem-left"></div>
  <div class="poem-border poem-right"></div>
    <h>念两句诗</h>
    <p id="poem">挑选中...</p>
    <p id="info">
  <script src="https://sdk.jinrishici.com/v2/browser/jinrishici.js" charset="utf-8"></script>
  <script type="text/javascript">
    jinrishici.load(function(result) {
      poem.innerHTML = result.data.content
      info.innerHTML = '【' + result.data.origin.dynasty + '】' + result.data.origin.author + '《' + result.data.origin.title + '》'
      document.getElementById("poem").value(poem);
      document.getElementById("info").value(info);  
  });
  </script>
</div>
```

3. 在 blog/themes/butterfly/source/css/index.styl 文件中添加如下代码（直接在底部添加）

```stylus
/*诗*/
.poem-wrap {
    position: relative;
    width: 730px;
    max-width: 80%;
    border: 2px solid #797979;
    border-top: none;
    text-align: center;
    margin: 80px auto;
}
 
.poem-wrap h {
    font-size: 40px;
    font-style:oblique;
    position: relative;
    margin-top: -40px;
    display: inline-block;
    letter-spacing: 4px;
    color: #797979
}
 
.poem-wrap p {
    width: 70%;
    margin: auto;
    line-height: 30px;
    color: #797979;
}
 
.poem-wrap p#poem {
    font-size: 22px;
    margin: 15px auto;
}
 
.poem-wrap p#info {
    font-size: 15px;
    margin: 15px auto;
}
 
.poem-border {
    position: absolute;
    height: 2px;
    width: 27%;
    background-color: #797979;
}
 
.poem-right {
    right: 0;
}
 
.poem-left {
    left: 0;
}
 
@media (max-width: 685px) {
    .poem-border {
        width: 18%;
    }
}
 
@media (max-width: 500px) {
    .poem-wrap {
        margin-top: 60px;
        margin-bottom: 20px;
        border-top: 2px solid #797979;
    }
 
    .poem-wrap h {
        margin: 20px 6px;
    }
 
    .poem-border {
        display: none;
    }
}
```

4. 在 _config.butterfly.yml 文件的 menu 位置添加如下代码

```yaml
Message: /Message/ || fas fa-comment
```

所在位置如下图所示

![](https://cos.luyf-lemon-love.space/images/20220511232203.png)

#### 鼠标样式修改

1. 在 blog/themes/butterfly/source/css 目录下创建一个 mouse.css 文件，在文件中添加如下代码

```css
body {
    cursor: url(https://cdn.jsdelivr.net/gh/sviptzk/HexoStaticFile@latest/Hexo/img/default.cur),
        default;
}
a,
img {
    cursor: url(https://cdn.jsdelivr.net/gh/sviptzk/HexoStaticFile@latest/Hexo/img/pointer.cur),
        default;
}
```

2. 在 _config.butterfly.yml 文件的 inject 的 head 处引入该文件

```yaml
- <link rel="stylesheet" href="/css/mouse.css">
```

#### Mac 代码框样式美化

在 _config.butterfly.yml 文件的 inject 的 head 处直接引入下面代码

- Mac 黑色

```yaml
- <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/sviptzk/StaticFile_HEXO@latest/butterfly/css/macblack.css">
```

- Mac 白色

```yaml
- <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/sviptzk/StaticFile_HEXO@latest/butterfly/css/macWhite.css">
```

#### 哔哩哔哩视频代码块

点击 bilibili 视频分享按钮，复制嵌入代码，复制的例子如下

```html
<iframe src="//player.bilibili.com/player.html?aid=209733780&bvid=BV17a411r7AV&cid=462112443&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"> </iframe>
```

效果

<iframe src="//player.bilibili.com/player.html?aid=209733780&bvid=BV17a411r7AV&cid=462112443&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"> </iframe>

#### 黑客帝国特效

注：尽量关闭文章页透明效果，否则效果很糟糕

在 _config.butterfly.yml 文件的 inject 的 bottom 处引入

```yaml
- <script defer src="https://cdn.jsdelivr.net/npm/canvas-matrix.js@0/canvas-matrix.min.js" size="20" font="arial"></script>
```

#### 点亮网站标题和副标题

1. 在 blog/themes/butterfly/source/css 目录下创建 title.css 文件，写入下面内容

```css
/* 网站标题、副标题闪光 */
#page-header #site-title,
#page-header #site-subtitle {
  color: rgb(255, 255, 255);
  text-shadow: rgb(255, 255, 255) 0px 0px 10px, rgb(255, 255, 255) 0px 0px 20px,
    rgb(255, 0, 222) 0px 0px 30px, rgb(255, 0, 222) 0px 0px 40px,
    rgb(255, 0, 222) 0px 0px 70px, rgb(255, 0, 222) 0px 0px 80px,
    rgb(255, 0, 222) 0px 0px 100px;
}
#page-header #site-title:hover,
#page-header #site-subtitle:hover {
  color: rgb(255, 255, 255);
  text-shadow: rgb(255, 255, 255) 0px 0px 10px, rgb(255, 255, 255) 0px 0px 20px,
    rgb(255, 255, 255) 0px 0px 30px, rgb(0, 255, 255) 0px 0px 40px,
    rgb(0, 255, 255) 0px 0px 70px, rgb(0, 255, 255) 0px 0px 80px,
    rgb(0, 255, 255) 0px 0px 100px;
}
```

2. 在 _config.butterfly.yml 文件的 inject 的 head 处引入下面代码

```yaml
- <link rel="stylesheet" href="/css/title.css">
```

#### 进度弹球

在 _config.butterfly.yml 文件中相应位置修改

```yaml
inject:
  head:
    - <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/CodeByZach/pace/themes/pink/pace-theme-bounce.css">
  bottom:
    - <script async src="https://rmt.dogedoge.com/fetch/~/source/jsdelivr/gh/CodeByZach/pace/pace.min.js"></script>
```

#### 完善导航

##### 创建页面

需要创建的基本页面有：tags、categories、about 和 link，由于 link 页面之前，所以这里没有它的命令

```shell
hexo new page tags
hexo new page categories
hexo new page about
```

新创建页面对应的 md 文件（从 blog/source 目录下对应的同名目录下找），开头必须指明类型，如 type: “tags”。

##### 首页 banner 图

在 _config.butterfly.yml 文件设置

```yaml
# The banner image of home page
index_img: https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main/blogs/pictures/20220511162220.png
```

##### 标签页等 banner 图

在 blog/source 目录下各个页面对应的目录里的 md 文件的 Front-matter 加上（图片链接可以各个页面不同）：

```markdown
top_img: https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main/blogs/pictures/20220511162004.png
```

在 _config.butterfly.yml 文件中设置

```yaml
# Disable all banner image
disable_top_img: false
```

在 _config.butterfly.yml 文件中设置

```yml
# If the banner of page not setting, it will show the top_img
default_top_img: https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main/blogs/pictures/20220513171423.png

# The banner image of archive page
archive_img: https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main/blogs/pictures/20220511161739.png
```

##### 搜索系统

在 blog 目录下运行下面命令

```shell
npm install hexo-generator-search --save
```

在 _config.butterfly.yml 文件中设置

```yaml
# Local search
local_search:
  enable: true
  labels:
    input_placeholder: Search for Posts
    hits_empty: "We didn't find any results for the search: ${query}" # if there are no result
  preload: false
  CDN:
```

#### 文章相关

##### 文章置顶

在文章的 front-matter 区域里添加 sticky: 1 属性来把这篇文章置顶。数值越大，置顶的优先级越大。

##### 概要节选

在 _config.butterfly.yml 文件配置

```yaml
index_post_content:
  method: 2
  length: 500 
```
method 的值

- 1： description： 只显示 description
- 2：both： 优先选择 description，如果没有配置 description，则显示自动节选的内容
- 3：auto_excerpt：只显示自动节选
- 4：false： 不显示文章内容

#### 404 页面

在 _config.butterfly.yml 文件配置

```yaml
# A simple 404 page
error_404:
  enable: true
  subtitle: 'Page Not Found'
  background: https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main/blogs/pictures/20220511161336.png
```

#### 文章封面

文章的 markdown 文档上，在 Front-matter 添加 cover, 并填上要显示的图片地址。

在 _config.butterfly.yml 文件中设置，当配置多张默认图片时，会随机选择一张作为 cover。

```yaml
cover:
  # display the cover or not (是否顯示文章封面)
  index_enable: true
  aside_enable: true
  archives_enable: true
  # the position of cover in home page (封面顯示的位置)
  # left/right/both
  position: both
  # When cover is not set, the default cover is displayed (當沒有設置cover時，默認的封面顯示)
  default_cover:
    - https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main/blogs/pictures/20220511161548.png
```

#### 文章 meta 信息

在 _config.butterfly.yml 文件中设置

```yaml
post_meta:
  page: # Home Page
    date_type: both # created or updated or both 主頁文章日期是創建日或者更新日或都顯示
    date_format: relative # date/relative 顯示日期還是相對日期
    categories: true # true or false 主頁是否顯示分類
    tags: true # true or false 主頁是否顯示標籤
    label: true # true or false 顯示描述性文字
  post:
    date_type: both # created or updated or both 文章頁日期是創建日或者更新日或都顯示
    date_format: relative # date/relative 顯示日期還是相對日期
    categories: true # true or false 文章頁是否顯示分類
    tags: true # true or false 文章頁是否顯示標籤
    label: true # true or false 顯示描述性文字
```

#### 评论系统

在 _config.butterfly.yml 文件中搜索 # Comments System，使用 valine

```yaml
comments:
  # Up to two comments system, the first will be shown as default
  # Choose: Disqus/Disqusjs/Livere/Gitalk/Valine/Waline/Utterances/Facebook Comments/Twikoo/Giscus
  use: Valine # Valine,Disqus
  text: true # Display the comment name next to the button
  # lazyload: The comment system will be load when comment element enters the browser's viewport.
  # If you set it to true, the comment count will be invalid
  lazyload: false
  count: true # Display comment count in post's top_img
  card_post_count: true # Display comment count in Home Page
```

选择 [Valine](https://valine.js.org/) 评论，按照 [Valine官方文档-快速开始](https://valine.js.org/quickstart.html)注册，选择 {% label LeanCloud(https://leancloud.app/)国际版 green %}，选择国内版会出现各种各样的问题。并获取 appid、appkey 和 serverURLs 的值:

1. 获取 APP ID 和 APP Key，请先登录或注册 [LeanCloud](https://console.leancloud.app/), 进入控制台后点击左下角创建应用：

![](https://cos.luyf-lemon-love.space/images/20220603141503.png)

2. 应用创建好以后，进入刚刚创建的应用，选择左下角的设置>应用Key，然后就能看到你的 APP ID、APP Key 和 serverURLs（REST API 服务器地址）了：

![](https://cos.luyf-lemon-love.space/images/20220603141538.png)

![](https://cos.luyf-lemon-love.space/images/20220603145241.png)

在 _config.butterfly.yml 文件设置 valine 的属性，开启 visitor 后，文章页的访问人数将改为 Valine 提供，而不是 不蒜子。

```yaml
appId: 
appKey:
serverURLs:
visitor: true
lang: zh_CN 
```

#### 打赏

在 _config.butterfly.yml 文件中设置

```yaml
# Sponsor/reward
reward:
  enable: true
  QR_code:
    - img: https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main/blogs/pictures/20220511162303.png
      link:
      text: wechat
    - img: https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main/blogs/pictures/20220511162220.png
      link:
      text: alipay
```

#### 分享

在 _config.butterfly.yml 文件中设置

```yaml
# Share.js
# https://github.com/overtrue/share.js
sharejs:
  enable: true
  sites: wechat,weibo,qq
```

#### 社交

在 _config.butterfly.yml 文件中设置

```yaml
social:
  fab fa-github: https://github.com/LuYF-Lemon-love || Github
  fas fa-envelope: luyanfeng_nlp@qq.com || Email
```

#### RSS

安装插件

```shell
npm install hexo-generator-feed --save
```

在 _config.yml 文件中，加入以下配置

```yaml
# rss订阅
feed:
  enable: true
  type: atom
  path: atom.xml
  limit: 20
  hub:
  content:
  content_limit: 140
  content_limit_delim: ' '
  order_by: -date
  icon: icon.png
  autodiscovery: true
  template:
```

在 _config.butterfly.yml 文件中设置 RSS 地址

```yaml
# aside (側邊欄)
# --------------------------------------

aside:
  enable: true
  card_ip: true
  hide: false
  button: true
  mobile: true # display on mobile
  position: right # left or right
  archives: true
  card_author:
    enable: true
    description:
    button:
      enable: true
      icon: fa fa-rss
      text: 订阅RSS
      link: https://luyf-lemon-love.space/atom.xml #atom.xml
```

#### 简繁 - 阅读 - 夜间

在 _config.butterfly.yml 文件中设置

```yaml
# Conversion between Traditional and Simplified Chinese (簡繁轉換)
translate:
  enable: true
  # The text of a button
  default: 繁
  # the language of website (1 - Traditional Chinese/ 2 - Simplified Chinese）
  defaultEncoding: 2
  # Time delay
  translateDelay: 0
  # The text of the button when the language is Simplified Chinese
  msgToTraditionalChinese: '繁'
  # The text of the button when the language is Traditional Chinese
  msgToSimplifiedChinese: '簡'

# Read Mode (閲讀模式)
readmode: true

# dark mode
darkmode:
  enable: true
  # Toggle Button to switch dark/light mode
  button: true
  # Switch dark/light mode automatically (自動切換 dark mode和 light mode)
  # autoChangeMode: 1  Following System Settings, if the system doesn't support dark mode, it will switch dark mode between 6 pm to 6 am
  # autoChangeMode: 2  Switch dark mode between 6 pm to 6 am
  # autoChangeMode: false
  autoChangeMode: 2
```

#### 站点起始时间

在 _config.butterfly.yml 文件中设置

```yaml
# Footer Settings
# --------------------------------------
footer:
  owner:
    enable: true
    since: 2022
  custom_text: 感谢光临小破站，欢迎您提出宝贵的意见！
  copyright: true # Copyright of theme and framework
```

#### 文章永久链接

1. 安装插件

```shell
npm install hexo-abbrlink --save
```

2. 在 _config.yml 文件中添加如下配置

```yaml
#abbrlink配置
abbrlink:
  alg: crc32  # suanfa：crc16(default) and crc32
  rep: dec    # jinzhi：dec(default) and hex
```

3. 在 _config.yml 文件设置

```yaml
permalink: :abbrlink/ #:year/:month/:day/:title/
```

#### 文章计数

1. 安装插件

```shell
npm install hexo-wordcount --save
```

2. 在 _config.butterfly.yml 文件中设置

```yaml
# wordcount (字數統計)
# see https://butterfly.js.org/posts/ceeb73f/#字數統計
wordcount:
  enable: true
  post_wordcount: true
  min2read: true
  total_wordcount: true
```

#### Vercel 加速博客

1. 进入[Vercel官网](https://vercel.com)，选择 Github 登录

2. 点击 New Project，导入所有仓库，

3. Import 你的博客所在的仓库

4. 然后傻瓜式操作，直至部署成功

一共提供很多域名，如下

```
Vercel 加速域名
https://lu-yf-lemon-love-github-io.vercel.app/
https://lu-yf-lemon-love-github-io-luyf-lemon-love.vercel.app/
https://lu-yf-lemon-love-github-io-git-master-luyf-lemon-love.vercel.app/
```

在 _config.butterfly.yml 文件中设置

```yaml
card_announcement:
  enable: true
  content: 本站部署到了几个地方，对应的域名请看顶部的 Domains 页
```

```shell
# 创建 Domains 页
hexo n page "Domains"
```

在 blog/source/Domains/index.md 替换下面内容

```markdown
---
title: Domains
date: 2022-05-13 17:04:06
type: "Domains"
top_img: https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main/blogs/pictures/20220513171728.png
---

### Vercel 加速域名

https://lu-yf-lemon-love-github-io.vercel.app/

https://lu-yf-lemon-love-github-io-luyf-lemon-love.vercel.app/

https://lu-yf-lemon-love-github-io-git-master-luyf-lemon-love.vercel.app/
```

在 _config.butterfly.yml 文件的 menu 处添加 Domains 的配置

```yaml
Domains: /Domains/ || fas fa-gift
```

#### Loading Animation( 进阶 )

注：建议先去掉前面做过**站点加载动画修改（齿轮效果）**的修改。

1. 修改 blog/themes/butterfly/layout/includes/loading/loading.pug 文件为

```html
if theme.preloader.enable
  case theme.preloader.load_style    
    when 'gear'
      include ./load_style/gear.pug
    when 'ironheart'
      include ./load_style/ironheart.pug
    when 'scarecrow'
      include ./load_style/scarecrow.pug
    when 'triangles'
      include ./load_style/triangles.pug
    when 'wizard'
      include ./load_style/wizard.pug
    when 'image'
      include ./load_style/image.pug
    default
      include ./load_style/default.pug
```

2. 在 blog/themes/butterfly/layout/includes/loading 目录下新建 load_style 目录，在下面新建下面七个文件

##### default.pug 文件

```html
#loading-box
  .loading-left-bg
  .loading-right-bg
  .spinner-box
    .configure-border-1
      .configure-core
    .configure-border-2
      .configure-core
    .loading-word= _p('loading')
```

##### gear.pug 文件

```html
#loading-box
  .gear-loader
    .gear-loader_overlay
    .gear-loader_cogs
      .gear-loader_cogs__top
        .gear-top_part
        .gear-top_part
        .gear-top_part
        .gear-top_hole
      .gear-loader_cogs__left
        .gear-left_part
        .gear-left_part
        .gear-left_part
        .gear-left_hole
      .gear-loader_cogs__bottom
        .gear-bottom_part
        .gear-bottom_part
        .gear-bottom_part
        .gear-bottom_hole
```

##### image.pug 文件

```html
- var loadimage = theme.preloader.load_image ? theme.preloader.load_image : theme.error_img.post_page
#loading-box
  .loading-left-bg
  .loading-right-bg
  img.load-image(src=url_for(loadimage) alt='')
```

##### ironheart.pug 文件

```html
#loading-box
  .loading-left-bg
  .loading-right-bg
  .iron-container.iron-circle
    .iron-box1.iron-circle.iron-center
    .iron-box2.iron-circle.iron-center
    .iron-box3.iron-circle.iron-center
    .iron-box4.iron-circle.iron-center
    .iron-box5.iron-circle.iron-center
    .iron-box6.iron-circle
      .iron-coil(style='--i: 0')
      .iron-coil(style='--i: 1')
      .iron-coil(style='--i: 2')
      .iron-coil(style='--i: 3')
      .iron-coil(style='--i: 4')
      .iron-coil(style='--i: 5')
      .iron-coil(style='--i: 6')
      .iron-coil(style='--i: 7')
```

##### scarecrow.pug 文件

```html
#loading-box
  .loading-left-bg
  .loading-right-bg
  .scarecrow
    .scarecrow__hat
      .scarecrow__ribbon
    .scarecrow__head
      .scarecrow__eye
      .scarecrow__eye
      .scarecrow__mouth
      .scarecrow__pipe
    .scarecrow__body
      .scarecrow__glove.scarecrow__glove--l
      .scarecrow__sleeve.scarecrow__sleeve--l
      .scarecrow__bow
      .scarecrow__shirt
      .scarecrow__coat
      .scarecrow__waistcoat
      .scarecrow__sleeve.scarecrow__sleeve--r
      .scarecrow__glove.scarecrow__glove--r
      .scarecrow__coattails
      .scarecrow__pants
    .scarecrow__arms
    .scarecrow__leg
```

##### triangles.pug 文件

```html
#loading-box
  .triangles-wrap
    .triangles-eiz
    .triangles-seiz
    .triangles-sei
    .triangles-fei
    .triangles-feir
    .triangles-trei
    .triangles-dvai
    .triangles-ein
    .triangles-zero
```

##### wizard.pug 文件

```html
#loading-box
  .loading-left-bg
  .loading-right-bg
  .wizard-scene
    .wizard-objects
      .wizard-square
      .wizard-circle
      .wizard-triangle
    .wizard
      .wizard-body
      .wizard-right-arm
        .wizard-right-hand
      .wizard-left-arm
        .wizard-left-hand
      .wizard-head
        .wizard-beard
        .wizard-face
          .wizard-adds
        .wizard-hat
          .wizard-hat-of-the-hat
          .wizard-four-point-star.--first
          .wizard-four-point-star.--second
          .wizard-four-point-star.--third
```

3. 修改 blog/themes/butterfly/source/css/_layout/loading.styl 文件，全部替换为下面的代码

```stylus
if hexo-config('preloader.enable')
  if hexo-config('preloader.load_style') == 'gear'
    @import './_load_style/gear'
  else if hexo-config('preloader.load_style') == 'ironheart'
    @import './_load_style/ironheart'
  else if hexo-config('preloader.load_style') == 'scarecrow'
    @import './_load_style/scarecrow'
  else if hexo-config('preloader.load_style') == 'triangles'
    @import './_load_style/triangles'
  else if hexo-config('preloader.load_style') == 'wizard'
    @import './_load_style/wizard'
  else if hexo-config('preloader.load_style') == 'image'
    @import './_load_style/image'
  else
    @import './_load_style/default'
```

4. 在 blog/themes/butterfly/source/css 目录下新建 _load_style 目录，在下面新建下面七个文件

##### default.styl 文件

```stylus
.loading-bg
  position fixed
  z-index 1000
  width 50%
  height 100%
  background var(--preloader-bg)
#loading-box
  .loading-left-bg
    @extend .loading-bg
    left 0
  .loading-right-bg
    @extend .loading-bg
    right 0
  &.loaded
    z-index -1000
    .loading-left-bg
      transition all 1.0s
      transform translate(-100%, 0)
    .loading-right-bg
      transition all 1.0s
      transform translate(100%, 0)
#loading-box
  .spinner-box
    position fixed
    z-index 1001
    display flex
    justify-content center
    align-items center
    width 100%
    height 100vh

    .configure-border-1
      position absolute
      padding 3px
      width 115px
      height 115px
      background #ffab91
      animation configure-clockwise 3s ease-in-out 0s infinite alternate

    .configure-border-2
      left -115px
      padding 3px
      width 115px
      height 115px
      background rgb(63, 249, 220)
      transform rotate(45deg)
      animation configure-xclockwise 3s ease-in-out 0s infinite alternate

    .loading-word
      position absolute
      color var(--preloader-color)
      font-size 16px

    .configure-core
      width 100%
      height 100%
      background-color var(--preloader-bg)

  &.loaded
    .spinner-box
      display none

@keyframes configure-clockwise
  0%
    transform rotate(0)

  25%
    transform rotate(90deg)

  50%
    transform rotate(180deg)

  75%
    transform rotate(270deg)

  100%
    transform rotate(360deg)

@keyframes configure-xclockwise
  0%
    transform rotate(45deg)

  25%
    transform rotate(-45deg)

  50%
    transform rotate(-135deg)

  75%
    transform rotate(-225deg)

  100%
    transform rotate(-315deg)
```

##### gear.styl 文件

```stylus
#loading-box
  position fixed
  z-index 1000
  width 100vw
  height 100vh
  overflow hidden
  text-align center
  &.loaded
    z-index -1000
    .gear-loader
      display none
  .gear-loader
    height 100%
    position relative
    margin auto
    width 400px
  .gear-loader_overlay
    width 150px
    height 150px
    background transparent
    box-shadow 0px 0px 0px 1000px rgba(255, 255, 255, 0.67), 0px 0px 19px 0px rgba(0, 0, 0, 0.16) inset
    border-radius 100%
    z-index -1
    position absolute
    left 0
    right 0
    top 0
    bottom 0
    margin auto
  .gear-loader_cogs
    z-index -2
    width 100px
    height 100px
    top -120px !important
    position absolute
    left 0
    right 0
    top 0
    bottom 0
    margin auto
  .gear-loader_cogs__top
    position relative
    width 100px
    height 100px
    transform-origin 50px 50px
    -webkit-animation rotate 10s infinite linear
    animation rotate 10s infinite linear
    div
      &:nth-of-type(1)
        transform rotate(30deg)
      &:nth-of-type(2)
        transform rotate(60deg)
      &:nth-of-type(3)
        transform rotate(90deg)
      &.gear-top_part
        width 100px
        border-radius 10px
        position absolute
        height 100px
        background #f98db9
      &.gear-top_hole
        width 50px
        height 50px
        border-radius 100%
        background white
        position absolute
        position absolute
        left 0
        right 0
        top 0
        bottom 0
        margin auto
  .gear-loader_cogs__left
    position relative
    width 80px
    transform rotate(16deg)
    top 28px
    transform-origin 40px 40px
    animation rotate_left 10s 0.1s infinite reverse linear
    left -24px
    height 80px
    div
      &:nth-of-type(1)
        transform rotate(30deg)
      &:nth-of-type(2)
        transform rotate(60deg)
      &:nth-of-type(3)
        transform rotate(90deg)
      &.gear-left_part
        width 80px
        border-radius 6px
        position absolute
        height 80px
        background #97ddff
      &.gear-left_hole
        width 40px
        height 40px
        border-radius 100%
        background white
        position absolute
        position absolute
        left 0
        right 0
        top 0
        bottom 0
        margin auto
  .gear-loader_cogs__bottom
    position relative
    width 60px
    top -65px
    transform-origin 30px 30px
    -webkit-animation rotate_left 10.2s 0.4s infinite linear
    animation rotate_left 10.2s 0.4s infinite linear
    transform rotate(4deg)
    left 79px
    height 60px
    div
      &:nth-of-type(1)
        transform rotate(30deg)
      &:nth-of-type(2)
        transform rotate(60deg)
      &:nth-of-type(3)
        transform rotate(90deg)
      &.gear-bottom_part
        width 60px
        border-radius 5px
        position absolute
        height 60px
        background #ffcd66
      &.gear-bottom_hole
        width 30px
        height 30px
        border-radius 100%
        background white
        position absolute
        position absolute
        left 0
        right 0
        top 0
        bottom 0
        margin auto



/* Animations */
@-webkit-keyframes rotate {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}
@keyframes rotate {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}
@-webkit-keyframes rotate_left {
  from {
    transform: rotate(16deg);
  }
  to {
    transform: rotate(376deg);
  }
}
@keyframes rotate_left {
  from {
    transform: rotate(16deg);
  }
  to {
    transform: rotate(376deg);
  }
}
@-webkit-keyframes rotate_right {
  from {
    transform: rotate(4deg);
  }
  to {
    transform: rotate(364deg);
  }
}
@keyframes rotate_right {
  from {
    transform: rotate(4deg);
  }
  to {
    transform: rotate(364deg);
  }
}
```

##### image.styl 文件

```stylus
.loading-bg
  position fixed
  z-index 1000
  width 50%
  height 100%
  background var(--preloader-bg)
#loading-box
  .loading-left-bg
    @extend .loading-bg
    left 0
  .loading-right-bg
    @extend .loading-bg
    right 0
  &.loaded
    z-index -1000
    .loading-left-bg
      transition all 1.0s
      transform translate(-100%, 0)
    .loading-right-bg
      transition all 1.0s
      transform translate(100%, 0)
#loading-box
  position fixed
  z-index 1000
  display -webkit-box
  display flex
  -webkit-box-align center
  align-items center
  -webkit-box-pack center
  justify-content center
  -webkit-box-orient vertical
  -webkit-box-direction normal
  flex-direction column
  flex-wrap wrap
  width 100vw
  height 100vh
  overflow hidden

  .load-image
    position fixed
    z-index 1001
    display flex

  &.loaded
    .load-image
      display none
```

##### ironheart.styl 文件

```stylus
.loading-bg
  position fixed
  z-index 1000
  width 50%
  height 100%
  background var(--preloader-bg)
#loading-box
  .loading-left-bg
    @extend .loading-bg
    left 0
  .loading-right-bg
    @extend .loading-bg
    right 0
  &.loaded
    z-index -1000
    .loading-left-bg
      transition all 1.0s
      transform translate(-100%, 0)
    .loading-right-bg
      transition all 1.0s
      transform translate(100%, 0)
#loading-box
  position fixed
  z-index 1000
  display -webkit-box
  display flex
  -webkit-box-align center
  align-items center
  -webkit-box-pack center
  justify-content center
  -webkit-box-orient vertical
  -webkit-box-direction normal
  flex-direction column
  flex-wrap wrap
  width 100vw
  height 100vh
  overflow hidden

  &.loaded
    .iron-container
      display none

  .iron-circle
    border-radius 50%

  .iron-center
    position absolute
    top 50%
    left 50%
    transform translate(-50%, -50%)

  .iron-container
    z-index 1001
    position relative
    width 300px
    height 300px
    border 1px solid rgb(18, 20, 20)
    background-color #384c50
    box-shadow 0 0 32px 8px rgb(18, 20, 20), 0 0 4px 1px rgb(18, 20, 20) inset
    .iron-box1
      width 238px
      height 238px
      background-color rgb(22, 26, 27)
      box-shadow 0 0 4px 1px #52fefe
    .iron-box2
      width 220px
      height 220px
      background-color #fff
      box-shadow 0 0 5px 1px #52fefe, 0 0 5px 4px #52fefe inset
    .iron-box3
      width 180px
      height 180px
      background-color #073c4b
      box-shadow 0 0 5px 4px #52fefe, 0 0 6px 2px #52fefe inset
    .iron-box4
      width 120px
      height 120px
      border 1px solid #52fefe
      background-color #fff
      box-shadow 0 0 2px 1px #52fefe, 0 0 10px 5px #52fefe inset
    .iron-box5
      width 70px
      height 70px
      border 5px solid #1b4e5f
      box-shadow 0 0 7px 5px #52fefe, 0 0 10px 10px #52fefe inset
    .iron-box6
      position relative
      width 100%
      height 100%
      animation ironrotate 3s linear infinite
      .iron-coil
        position absolute
        width 30px
        height 20px
        top calc(50% - 110px)
        left calc(50% - 15px)
        background-color #073c4b
        box-shadow 0 0 5px #52fefe inset
        transform rotate(calc(var(--i) * 45deg))
        transform-origin center 110px
@keyframes ironrotate
	0%
		transform rotate(0)
	100%
		transform rotate(360deg)
```

##### scarecrow.styl 文件

```stylus
.loading-bg
  position fixed
  z-index 1000
  width 50%
  height 100%
  background var(--preloader-bg)
#loading-box
  .loading-left-bg
    @extend .loading-bg
    left 0
  .loading-right-bg
    @extend .loading-bg
    right 0
  &.loaded
    z-index -1000
    .loading-left-bg
      transition all 1.0s
      transform translate(-100%, 0)
    .loading-right-bg
      transition all 1.0s
      transform translate(100%, 0)

#loading-box
  position fixed
  z-index 1000
  display -webkit-box
  display flex
  -webkit-box-align center
  align-items center
  -webkit-box-pack center
  justify-content center
  -webkit-box-orient vertical
  -webkit-box-direction normal
  flex-direction column
  flex-wrap wrap
  width 100vw
  height 100vh
  overflow hidden
  &.loaded
    .scarecrow
      display none
  .scarecrow
    z-index 1001
    position relative
    animation hop 0.2s ease-in alternate infinite

  .scarecrow__hat
    position relative
    border-top-left-radius 5px
    border-top-right-radius 5px
    border-top 45px solid #515559
    border-left 1px solid transparent
    border-right 1px solid transparent
    width 55px
    margin 0 auto -3px
    z-index 1
    &:before
      content ""
      position absolute
      top -87px
      right -23px
      background-color #515559
      width 9px
      height 55px
      border-radius 100%
      transform rotate(50deg)
    &:after
      content ""
      position absolute
      top 12px
      left -15px
      background-color #515559
      width 85px
      height 10px
      border-radius 40% 40% 70% 70%

  .scarecrow__ribbon
    width 55px
    height 12px
    background-color #d996b5
    margin 0 auto

  .scarecrow__head
    position relative
    background-color #f2f2f2
    width 70px
    height 55px
    margin 0 auto
    border-radius 50%
    display flex
    justify-content space-around
    flex-flow row wrap

  .scarecrow__eye
    width 6px
    height 6px
    background-color #000
    border-radius 50%
    margin 20px 5px 0

  .scarecrow__mouth
    width 45px
    height 15px
    background-color #fff
    border-radius 50%

  .scarecrow__pipe
    position absolute
    top 40px
    left 60px
    width 40px
    height 2px
    background-color #8c8070
    &:before
      content ""
      position absolute
      width 9px
      height 17px
      background-color #8c8070
      border-radius 3px
      left 40px
      top -7px

  .scarecrow__body
    position relative
    width 250px
    z-index 1

  .scarecrow__coat
    position absolute
    top 15px
    left 0
    right 0
    margin-left auto
    margin-right auto
    border-top 100px solid #515559
    border-left 5px solid transparent
    border-right 5px solid transparent
    width 75px

  .scarecrow__bow
    position absolute
    top 20px
    left 0
    right 0
    margin-left auto
    margin-right auto
    background-color #3a485d
    width 10px
    height 10px
    z-index 3
    border-radius 2px
    &:before
      content ""
      position absolute
      top -10px
      left -25px
      width 0
      height 10px
      border-top 10px solid transparent
      border-left 25px solid #5a6b8c
      border-bottom 10px solid transparent
      border-radius 8px
    &:after
      content ""
      position absolute
      top -10px
      right -25px
      width 0
      height 10px
      border-top 10px solid transparent
      border-right 25px solid #5a6b8c
      border-bottom 10px solid transparent
      border-radius 8px

  .scarecrow__shirt
    position absolute
    top 8px
    left 0
    right 0
    margin-left auto
    margin-right auto
    width 30px
    height 35px
    z-index 2
    &:before
      content ""
      position absolute
      top 0
      left -5px
      height 100%
      width 70%
      background-color #dbb2c2
      transform skew(1deg, 35deg)
      border-bottom-left-radius 90px
      border-top-left-radius 15px
      border-bottom-right-radius 15px
      border-top-right-radius 10px
    &:after
      content ""
      position absolute
      top 0
      right -5px
      height 100%
      width 70%
      background-color #dbb2c2
      transform skew(-1deg, -35deg)
      border-top-right-radius 15px
      border-bottom-right-radius 90px
      border-bottom-left-radius 15px
      border-top-left-radius 10px

  .scarecrow__waistcoat
    position absolute
    top 15px
    left -1px
    right 0
    margin-left auto
    margin-right auto
    width 35px
    height 50px
    &:before
      content ""
      position absolute
      top 0
      left -4px
      height 100%
      width 65%
      background-color #83a6bc
      transform skew(0deg, 40deg)
      border-bottom-left-radius 90px
      border-top-left-radius 90px
      border-bottom-right-radius 15px
    &:after
      content ""
      position absolute
      top 0
      right -5px
      height 100%
      width 65%
      background-color #83a6bc
      transform skew(0deg, -40deg)
      border-top-right-radius 90px
      border-bottom-right-radius 90px
      border-bottom-left-radius 15px

  .scarecrow__coattails
    position absolute
    top 105px
    left 0
    right 0
    margin-left auto
    margin-right auto
    width 75px
    height 120px
    z-index 1
    &:before
      content ""
      position absolute
      top 0
      left 8px
      height 100%
      width 60%
      background-color #515559
      transform-origin top
      transform skew(-25deg, 30deg) rotate(0deg)
      border-bottom-left-radius 50px
      border-bottom-right-radius 5px
      animation coattails-left 0.2s ease-in alternate infinite
    &:after
      content ""
      position absolute
      top 0
      right 8px
      height 100%
      width 60%
      background-color #515559
      transform-origin top
      transform skew(25deg, -30deg) rotate(0deg)
      border-bottom-right-radius 50px
      border-bottom-left-radius 5px
      animation coattails-right 0.2s ease-in alternate infinite

  .scarecrow__pants
    position absolute
    top 115px
    left 0
    right 0
    margin-left auto
    margin-right auto
    width 50px
    height 150px
    &:before
      content ""
      position absolute
      top 0
      left -8px
      height 100%
      width 60%
      background-color #393c3e
      transform rotate(0deg)
      transform-origin top
      animation pants 0.5s linear alternate infinite
    &:after
      content ""
      position absolute
      top 0
      right -8px
      height 100%
      width 60%
      background-color #393c3e
      transform rotate(0deg)
      transform-origin top
      animation pants 0.3s linear alternate infinite

  .scarecrow__sleeve
    position absolute
    top 15px
    background-color #515559
    width 80px
    height 25px

  .scarecrow__sleeve--l
    left 10px
    &:before
      content ""
      position absolute
      top -3px
      left -22px
      width 0
      height 25px
      border-top 3px solid transparent
      border-left 25px solid #515559
      border-bottom 3px solid transparent
      border-radius 3px

  .scarecrow__sleeve--r
    right 10px
    &:before
      content ""
      position absolute
      top -3px
      right -22px
      width 0
      height 25px
      border-top 3px solid transparent
      border-right 25px solid #515559
      border-bottom 3px solid transparent
      border-radius 3px

  .scarecrow__glove
    position absolute
    top 12px
    width 0px
    height 12px
    &:before
      content ""
      position absolute
      top -7px
      border-radius 100%
      background-color #f2f2f2
      width 35px
      height 15px

  .scarecrow__glove--l
    border-top 3px solid transparent
    border-right 20px solid #f2f2f2
    border-bottom 3px solid transparent
    left -50px
    &:before
      transform-origin right
      left -30px
      transform rotate(0deg)
      animation glove-l 0.2s linear alternate infinite

  .scarecrow__glove--r
    border-top 3px solid transparent
    border-left 20px solid #f2f2f2
    border-bottom 3px solid transparent
    right -50px
    &:before
      transform-origin left
      right -30px
      transform rotate(0deg)
      animation glove-r 0.2s linear alternate infinite

  .scarecrow__arms
    position absolute
    left 50%
    transform translate(-50%, -50%)
    background-color #8c8070
    width 350px
    height 8px
    border-radius 5px
    margin 20px auto

  .scarecrow__leg
    position relative
    background-color #8c8070
    width 8px
    height 380px
    border-bottom-left-radius 5px
    border-bottom-right-radius 5px
    margin 0 auto

@keyframes hop
  0%
    transform translateY(-10px)
  100%
    transform translateY(10px)

@keyframes coattails-left
  0%
    transform skew(-25deg, 30deg) rotate(-3deg)
  100%
    transform skew(-25deg, 30deg) rotate(3deg)

@keyframes coattails-right
  0%
    transform skew(25deg, -30deg) rotate(3deg)
  100%
    transform skew(25deg, -30deg) rotate(-3deg)

@keyframes pants
  0%
    transform rotate(3deg)
  100%
    transform rotate(-3deg)

@keyframes glove-l
  0%
    transform rotate(-50deg)
  100%
    transform rotate(-30deg)

@keyframes glove-r
  0%
    transform rotate(50deg)
  100%
    transform rotate(30deg)
```

##### triangles 文件

```stylus
#loading-box
  position fixed
  z-index 1000
  width 100vw
  height 100vh
  overflow hidden
  &.loaded
    z-index -1000
    .triangles-wrap
      display none

.triangles-wrap
  position absolute
  top 50%
  left 50%
  transform translate(-50%,-66.6666666666666666%)
  -ms-transform translate(-50%,-66.6666666666666666%)
  -webkit-transform translate(-50%,-66.6666666666666666%)
  -webkit-animation animascale 2s linear alternate infinite
  animation animascale 2s linear alternate both infinite



.triangles-zero, .triangles-ein, .triangles-dvai, .triangles-trei, .triangles-feir, .triangles-fei, .triangles-sei, .triangles-seiz, .triangles-eiz
  width 0px
  height 0px
  position absolute
  top 50%
  left 50%
  transform translate(-50%,-66.6666666666666666%)
  -ms-transform translate(-50%,-66.6666666666666666%)
  -webkit-transform translate(-50%,-66.6666666666666666%)

.triangles-zero
  border-style solid
  border-width 0 5px 8.7px 5px
  border-color transparent transparent #1274b6 transparent
  -webkit-animation anima 2s linear reverse both infinite 4s, animacolorzero 2s linear alternate both infinite
  animation anima 2s linear reverse both infinite 4s, animacolorzero 2s linear alternate both infinite
  -webkit-transform-origin top left

.triangles-ein
  border-style solid
  border-width 0 10px 17.3px 10px
  border-color transparent transparent #167bbf transparent
  -webkit-animation anima 2s linear both infinite 4.2s, animacolorein 2s linear alternate both infinite
  animation anima 2s linear both infinite 4.2s, animacolorein 2s linear alternate both infinite
  -webkit-transform-origin top left

.triangles-dvai
  border-style solid
  border-width 0 20px 34.6px 20px
  border-color transparent transparent #1b82c8 transparent
  -webkit-animation anima 2s linear reverse both infinite 4.4s, animacolordvai 2s linear alternate both infinite
  animation anima 2s linear reverse both infinite 4.4s, animacolordvai 2s linear alternate both infinite
  -webkit-transform-origin top left

.triangles-trei
  border-style solid
  border-width 0 40px 69.3px 40px
  border-color transparent transparent #228bd2 transparent
  -webkit-animation anima 2s linear  both infinite 4.6s, animacolortrei 2s linear alternate both infinite
  animation anima 2s linear  both infinite 4.6s, animacolortrei 2s linear alternate both infinite
  -webkit-transform-origin top left

.triangles-feir
  border-style solid
  border-width 0 80px 138.6px 80px
  border-color transparent transparent #2992d9 transparent
  -webkit-animation anima 2s linear reverse  both infinite 4.8s, animacolorfeir 2s linear alternate both infinite
  animation anima 2s linear reverse  both infinite 4.8s, animacolorfeir 2s linear alternate both infinite
  -webkit-transform-origin top left

.triangles-fei
  border-style solid
  border-width 0 160px 277.1px 160px
  border-color transparent transparent #3498db transparent
  -webkit-animation anima 2s linear  both infinite 5s, animacolorfei 2s linear alternate both infinite
  animation anima 2s linear  both infinite 5s, animacolorfei 2s linear alternate both infinite
  -webkit-transform-origin top left

.triangles-sei
  border-style solid
  border-width 0 320px 554.3px 320px
  border-color transparent transparent #3f9edd transparent
  -webkit-animation anima 2s linear reverse  both infinite 5.2s, animacolorsei 2s linear alternate both infinite
  animation anima 2s linear reverse  both infinite 5.2s, animacolorsei 2s linear alternate both infinite
  -webkit-transform-origin top left

.triangles-seiz
  border-style solid
  border-width 0 640px 1108.5px 640px
  border-color transparent transparent #48a2de transparent
  -webkit-animation anima 2s linear  both infinite 5.4s, animacolorseiz 2s linear alternate both infinite
  animation anima 2s linear  both infinite 5.4s, animacolorseiz 2s linear alternate both infinite
  -webkit-transform-origin top left

.triangles-eiz
  border-style solid
  border-width 0 1280px 2217.0px 1280px
  border-color transparent transparent #59aae0 transparent
  -webkit-animation anima 2s linear reverse  both infinite 5.6s, animacoloreiz 2s linear alternate both infinite
  animation anima 2s linear reverse  both infinite 5.6s, animacoloreiz 2s linear alternate both infinite
  -webkit-transform-origin top left


@-webkit-keyframes anima
  from
    -webkit-transform: rotate(0deg) translate(-50%,-66.6666666666666666%)
  to
    -webkit-transform: rotate(360deg) translate(-50%,-66.6666666666666666%)


@keyframes anima
    from
      transform rotate(0deg) translate(-50%,-66.6666666666666666%)
    to
      transform rotate(360deg) translate(-50%,-66.6666666666666666%)



/*
@-webkit-keyframes animacolorzero
{
0%{border-color: transparent transparent #602520 transparent;}
16.6%{border-color: transparent transparent #672922 transparent;}
33.3%{border-color: transparent transparent #6F2E25 transparent;}
50%{border-color: transparent transparent #772F28 transparent;}
66.6%{border-color: transparent transparent #82332B transparent;}
83.3%{border-color: transparent transparent #8A372E transparent;}
100%{border-color: transparent transparent #A14436 transparent;}
}

@keyframes animacolorzero
{
0%{border-color: transparent transparent #602520 transparent;}
16.6%{border-color: transparent transparent #672922 transparent;}
33.3%{border-color: transparent transparent #6F2E25 transparent;}
50%{border-color: transparent transparent #772F28 transparent;}
66.6%{border-color: transparent transparent #82332B transparent;}
83.3%{border-color: transparent transparent #8A372E transparent;}
100%{border-color: transparent transparent #A14436 transparent;}
}


@-webkit-keyframes animacolorein
{
0%{border-color: transparent transparent #672922 transparent;}
16.6%{border-color: transparent transparent #6F2E25 transparent;}
33.3%{border-color: transparent transparent #772F28 transparent;}
50%{border-color: transparent transparent #82332B transparent;}
66.6%{border-color: transparent transparent #8A372E transparent;}
83.3%{border-color: transparent transparent #A14436 transparent;}
100%{border-color: transparent transparent #602520 transparent;}
}

@keyframes animacolorein
{
0%{border-color: transparent transparent #672922 transparent;}
16.6%{border-color: transparent transparent #6F2E25 transparent;}
33.3%{border-color: transparent transparent #772F28 transparent;}
50%{border-color: transparent transparent #82332B transparent;}
66.6%{border-color: transparent transparent #8A372E transparent;}
83.3%{border-color: transparent transparent #A14436 transparent;}
100%{border-color: transparent transparent #602520 transparent;}
}


@-webkit-keyframes animacolordvai
{
0%{border-color: transparent transparent #6F2E25 transparent;}
16.6%{border-color: transparent transparent #772F28 transparent;}
33.3%{border-color: transparent transparent #82332B transparent;}
50%{border-color: transparent transparent #8A372E transparent;}
66.6%{border-color: transparent transparent #A14436 transparent;}
83.3%{border-color: transparent transparent #602520 transparent;}
100%{border-color: transparent transparent #672922 transparent;}
}

@keyframes animacolordvai
{
0%{border-color: transparent transparent #6F2E25 transparent;}
16.6%{border-color: transparent transparent #772F28 transparent;}
33.3%{border-color: transparent transparent #82332B transparent;}
50%{border-color: transparent transparent #8A372E transparent;}
66.6%{border-color: transparent transparent #A14436 transparent;}
83.3%{border-color: transparent transparent #602520 transparent;}
100%{border-color: transparent transparent #672922 transparent;}
}


@-webkit-keyframes animacolortrei
{
0%{border-color: transparent transparent #772F28 transparent;}
16.6%{border-color: transparent transparent #82332B transparent;}
33.3%{border-color: transparent transparent #8A372E transparent;}
50%{border-color: transparent transparent #A14436 transparent;}
66.6%{border-color: transparent transparent #602520 transparent;}
83.3%{border-color: transparent transparent #672922 transparent;}
100%{border-color: transparent transparent #6F2E25 transparent;}
}

@keyframes animacolortrei
{
0%{border-color: transparent transparent #772F28 transparent;}
16.6%{border-color: transparent transparent #82332B transparent;}
33.3%{border-color: transparent transparent #8A372E transparent;}
50%{border-color: transparent transparent #A14436 transparent;}
66.6%{border-color: transparent transparent #602520 transparent;}
83.3%{border-color: transparent transparent #672922 transparent;}
100%{border-color: transparent transparent #6F2E25 transparent;}
}


@-webkit-keyframes animacolorfeir
{
0%{border-color: transparent transparent #82332B transparent;}
16.6%{border-color: transparent transparent #8A372E transparent;}
33.3%{border-color: transparent transparent #A14436 transparent;}
50%{border-color: transparent transparent #602520 transparent;}
66.6%{border-color: transparent transparent #672922 transparent;}
83.3%{border-color: transparent transparent #6F2E25 transparent;}
100%{border-color: transparent transparent #772F28 transparent;}
}

@keyframes animacolorfeir
{
0%{border-color: transparent transparent #82332B transparent;}
16.6%{border-color: transparent transparent #8A372E transparent;}
33.3%{border-color: transparent transparent #A14436 transparent;}
50%{border-color: transparent transparent #602520 transparent;}
66.6%{border-color: transparent transparent #672922 transparent;}
83.3%{border-color: transparent transparent #6F2E25 transparent;}
100%{border-color: transparent transparent #772F28 transparent;}
}



@-webkit-keyframes animacolorfei
{
0%{border-color: transparent transparent #8A372E transparent;}
16.6%{border-color: transparent transparent #A14436 transparent;}
33.3%{border-color: transparent transparent #602520 transparent;}
50%{border-color: transparent transparent #672922 transparent;}
66.6%{border-color: transparent transparent #6F2E25 transparent;}
83.3%{border-color: transparent transparent #772F28 transparent;}
100%{border-color: transparent transparent #82332B transparent;}
}

@keyframes animacolorfei
{
0%{border-color: transparent transparent #8A372E transparent;}
16.6%{border-color: transparent transparent #A14436 transparent;}
33.3%{border-color: transparent transparent #602520 transparent;}
50%{border-color: transparent transparent #672922 transparent;}
66.6%{border-color: transparent transparent #6F2E25 transparent;}
83.3%{border-color: transparent transparent #772F28 transparent;}
100%{border-color: transparent transparent #82332B transparent;}
}




@-webkit-keyframes animacolorsei
{
0%{border-color: transparent transparent #A14436 transparent;}
16.6%{border-color: transparent transparent #602520 transparent;}
33.3%{border-color: transparent transparent #672922 transparent;}
50%{border-color: transparent transparent #6F2E25 transparent;}
66.6%{border-color: transparent transparent #772F28 transparent;}
83.3%{border-color: transparent transparent #82332B transparent;}
100%{border-color: transparent transparent #8A372E transparent;}
}

@keyframes animacolorsei
{
0%{border-color: transparent transparent #A14436 transparent;}
16.6%{border-color: transparent transparent #602520 transparent;}
33.3%{border-color: transparent transparent #672922 transparent;}
50%{border-color: transparent transparent #6F2E25 transparent;}
66.6%{border-color: transparent transparent #772F28 transparent;}
83.3%{border-color: transparent transparent #82332B transparent;}
100%{border-color: transparent transparent #8A372E transparent;}
}*/

@-webkit-keyframes animacolorzero
{
0%{border-color: transparent transparent #1274b6 transparent;}
12.5%{border-color: transparent transparent #167bbf transparent;}
25%{border-color: transparent transparent #1b82c8 transparent;}
37.5%{border-color: transparent transparent #228bd2 transparent;}
50%{border-color: transparent transparent #2992d9 transparent;}
62.5%{border-color: transparent transparent #3498db transparent;}
75%{border-color: transparent transparent #3f9edd transparent;}
87.5%{border-color: transparent transparent #48a2de transparent;}
100%{border-color: transparent transparent #59aae0 transparent;}
}

@keyframes animacolorzero
{
0%{border-color: transparent transparent #1274b6 transparent;}
12.5%{border-color: transparent transparent #167bbf transparent;}
25%{border-color: transparent transparent #1b82c8 transparent;}
37.5%{border-color: transparent transparent #228bd2 transparent;}
50%{border-color: transparent transparent #2992d9 transparent;}
62.5%{border-color: transparent transparent #3498db transparent;}
75%{border-color: transparent transparent #3f9edd transparent;}
87.5%{border-color: transparent transparent #48a2de transparent;}
100%{border-color: transparent transparent #59aae0 transparent;}
}

@-webkit-keyframes animacolorein
{
0%{border-color: transparent transparent #167bbf transparent;}
12.5%{border-color: transparent transparent #1b82c8 transparent;}
25%{border-color: transparent transparent #228bd2 transparent;}
37.5%{border-color: transparent transparent #2992d9 transparent;}
50%{border-color: transparent transparent #3498db transparent;}
62.5%{border-color: transparent transparent #3f9edd transparent;}
75%{border-color: transparent transparent #48a2de transparent;}
87.5%{border-color: transparent transparent #59aae0 transparent;}
100%{border-color: transparent transparent #1274b6 transparent;}
}

@keyframes animacolorein
{
0%{border-color: transparent transparent #167bbf transparent;}
12.5%{border-color: transparent transparent #1b82c8 transparent;}
25%{border-color: transparent transparent #228bd2 transparent;}
37.5%{border-color: transparent transparent #2992d9 transparent;}
50%{border-color: transparent transparent #3498db transparent;}
62.5%{border-color: transparent transparent #3f9edd transparent;}
75%{border-color: transparent transparent #48a2de transparent;}
87.5%{border-color: transparent transparent #59aae0 transparent;}
100%{border-color: transparent transparent #1274b6 transparent;}
}

@-webkit-keyframes animacolordvai
{
0%{border-color: transparent transparent #1b82c8 transparent;}
12.5%{border-color: transparent transparent #228bd2 transparent;}
25%{border-color: transparent transparent #2992d9 transparent;}
37.5%{border-color: transparent transparent #3498db transparent;}
50%{border-color: transparent transparent #3f9edd transparent;}
62.5%{border-color: transparent transparent #48a2de transparent;}
75%{border-color: transparent transparent #59aae0 transparent;}
87.5%{border-color: transparent transparent #1274b6 transparent;}
100%{border-color: transparent transparent #167bbf transparent;}
}

@keyframes animacolordvai
{
0%{border-color: transparent transparent #1b82c8 transparent;}
12.5%{border-color: transparent transparent #228bd2 transparent;}
25%{border-color: transparent transparent #2992d9 transparent;}
37.5%{border-color: transparent transparent #3498db transparent;}
50%{border-color: transparent transparent #3f9edd transparent;}
62.5%{border-color: transparent transparent #48a2de transparent;}
75%{border-color: transparent transparent #59aae0 transparent;}
87.5%{border-color: transparent transparent #1274b6 transparent;}
100%{border-color: transparent transparent #167bbf transparent;}
}

@-webkit-keyframes animacolortrei
{
0%{border-color: transparent transparent #228bd2 transparent;}
12.5%{border-color: transparent transparent #2992d9 transparent;}
25%{border-color: transparent transparent #3498db transparent;}
37.5%{border-color: transparent transparent #3f9edd transparent;}
50%{border-color: transparent transparent #48a2de transparent;}
62.5%{border-color: transparent transparent #59aae0 transparent;}
75%{border-color: transparent transparent #1274b6 transparent;}
87.5%{border-color: transparent transparent #167bbf transparent;}
100%{border-color: transparent transparent #1b82c8 transparent;}
}

@keyframes animacolortrei
{
0%{border-color: transparent transparent #228bd2 transparent;}
12.5%{border-color: transparent transparent #2992d9 transparent;}
25%{border-color: transparent transparent #3498db transparent;}
37.5%{border-color: transparent transparent #3f9edd transparent;}
50%{border-color: transparent transparent #48a2de transparent;}
62.5%{border-color: transparent transparent #59aae0 transparent;}
75%{border-color: transparent transparent #1274b6 transparent;}
87.5%{border-color: transparent transparent #167bbf transparent;}
100%{border-color: transparent transparent #1b82c8 transparent;}
}

@-webkit-keyframes animacolorfeir
{
0%{border-color: transparent transparent #2992d9 transparent;}
12.5%{border-color: transparent transparent #3498db transparent;}
25%{border-color: transparent transparent #3f9edd transparent;}
37.5%{border-color: transparent transparent #48a2de transparent;}
50%{border-color: transparent transparent #59aae0 transparent;}
62.5%{border-color: transparent transparent #1274b6 transparent;}
75%{border-color: transparent transparent #167bbf transparent;}
87.5%{border-color: transparent transparent #1b82c8 transparent;}
100%{border-color: transparent transparent #228bd2 transparent;}
}

@keyframes animacolorfeir
{
0%{border-color: transparent transparent #2992d9 transparent;}
12.5%{border-color: transparent transparent #3498db transparent;}
25%{border-color: transparent transparent #3f9edd transparent;}
37.5%{border-color: transparent transparent #48a2de transparent;}
50%{border-color: transparent transparent #59aae0 transparent;}
62.5%{border-color: transparent transparent #1274b6 transparent;}
75%{border-color: transparent transparent #167bbf transparent;}
87.5%{border-color: transparent transparent #1b82c8 transparent;}
100%{border-color: transparent transparent #228bd2 transparent;}
}

@-webkit-keyframes animacolorfei
{
0%{border-color: transparent transparent #3498db transparent;}
12.5%{border-color: transparent transparent #3f9edd transparent;}
25%{border-color: transparent transparent #48a2de transparent;}
37.5%{border-color: transparent transparent #59aae0 transparent;}
50%{border-color: transparent transparent #1274b6 transparent;}
62.5%{border-color: transparent transparent #167bbf transparent;}
75%{border-color: transparent transparent #1b82c8 transparent;}
87.5%{border-color: transparent transparent #228bd2 transparent;}
100%{border-color: transparent transparent #2992d9 transparent;}
}

@keyframes animacolorfei
{
0%{border-color: transparent transparent #3498db transparent;}
12.5%{border-color: transparent transparent #3f9edd transparent;}
25%{border-color: transparent transparent #48a2de transparent;}
37.5%{border-color: transparent transparent #59aae0 transparent;}
50%{border-color: transparent transparent #1274b6 transparent;}
62.5%{border-color: transparent transparent #167bbf transparent;}
75%{border-color: transparent transparent #1b82c8 transparent;}
87.5%{border-color: transparent transparent #228bd2 transparent;}
100%{border-color: transparent transparent #2992d9 transparent;}
}

@-webkit-keyframes animacolorsei
{
0%{border-color: transparent transparent #3f9edd transparent;}
12.5%{border-color: transparent transparent #48a2de transparent;}
25%{border-color: transparent transparent #59aae0 transparent;}
37.5%{border-color: transparent transparent #1274b6 transparent;}
50%{border-color: transparent transparent #167bbf transparent;}
62.5%{border-color: transparent transparent #1b82c8 transparent;}
75%{border-color: transparent transparent #228bd2 transparent;}
87.5%{border-color: transparent transparent #2992d9 transparent;}
100%{border-color: transparent transparent #3498db transparent;}
}

@keyframes animacolorsei
{
0%{border-color: transparent transparent #3f9edd transparent;}
12.5%{border-color: transparent transparent #48a2de transparent;}
25%{border-color: transparent transparent #59aae0 transparent;}
37.5%{border-color: transparent transparent #1274b6 transparent;}
50%{border-color: transparent transparent #167bbf transparent;}
62.5%{border-color: transparent transparent #1b82c8 transparent;}
75%{border-color: transparent transparent #228bd2 transparent;}
87.5%{border-color: transparent transparent #2992d9 transparent;}
100%{border-color: transparent transparent #3498db transparent;}
}

@-webkit-keyframes animacolorseiz
{
0%{border-color: transparent transparent #48a2de transparent;}
12.5%{border-color: transparent transparent #59aae0 transparent;}
25%{border-color: transparent transparent #1274b6 transparent;}
37.5%{border-color: transparent transparent #167bbf transparent;}
50%{border-color: transparent transparent #1b82c8 transparent;}
62.5%{border-color: transparent transparent #228bd2 transparent;}
75%{border-color: transparent transparent #2992d9 transparent;}
87.5%{border-color: transparent transparent #3498db transparent;}
100%{border-color: transparent transparent #3f9edd transparent;}
}

@keyframes animacolorseiz
{
0%{border-color: transparent transparent #48a2de transparent;}
12.5%{border-color: transparent transparent #59aae0 transparent;}
25%{border-color: transparent transparent #1274b6 transparent;}
37.5%{border-color: transparent transparent #167bbf transparent;}
50%{border-color: transparent transparent #1b82c8 transparent;}
62.5%{border-color: transparent transparent #228bd2 transparent;}
75%{border-color: transparent transparent #2992d9 transparent;}
87.5%{border-color: transparent transparent #3498db transparent;}
100%{border-color: transparent transparent #3f9edd transparent;}
}

@-webkit-keyframes animacoloreiz
{
0%{border-color: transparent transparent #59aae0 transparent;}
12.5%{border-color: transparent transparent #1274b6 transparent;}
25%{border-color: transparent transparent #167bbf transparent;}
37.5%{border-color: transparent transparent #1b82c8 transparent;}
50%{border-color: transparent transparent #228bd2 transparent;}
62.5%{border-color: transparent transparent #2992d9 transparent;}
75%{border-color: transparent transparent #3498db transparent;}
87.5%{border-color: transparent transparent #3f9edd transparent;}
100%{border-color: transparent transparent #48a2de transparent;}
}

@keyframes animacoloreiz
{
0%{border-color: transparent transparent #59aae0 transparent;}
12.5%{border-color: transparent transparent #1274b6 transparent;}
25%{border-color: transparent transparent #167bbf transparent;}
37.5%{border-color: transparent transparent #1b82c8 transparent;}
50%{border-color: transparent transparent #228bd2 transparent;}
62.5%{border-color: transparent transparent #2992d9 transparent;}
75%{border-color: transparent transparent #3498db transparent;}
87.5%{border-color: transparent transparent #3f9edd transparent;}
100%{border-color: transparent transparent #48a2de transparent;}
}

@-webkit-keyframes animascale
{
0%{-webkit-transform: scale(1);}
100%{-webkit-transform: scale(1.2);}
}

@keyframes animascale
{
0%{-webkit-transform: scale(1);}
100%{-webkit-transform: scale(1.2);}
}
```

##### wizard 文件

```stylus
.loading-bg
  position fixed
  z-index 1000
  width 50%
  height 100%
  background var(--preloader-bg)
#loading-box
  .loading-left-bg
    @extend .loading-bg
    left 0
  .loading-right-bg
    @extend .loading-bg
    right 0
  &.loaded
    z-index -1000
    .loading-left-bg
      transition all 1.0s
      transform translate(-100%, 0)
    .loading-right-bg
      transition all 1.0s
      transform translate(100%, 0)
#loading-box
  position fixed
  z-index 1000
  display -webkit-box
  display flex
  -webkit-box-align center
  align-items center
  -webkit-box-pack center
  justify-content center
  -webkit-box-orient vertical
  -webkit-box-direction normal
  flex-direction column
  flex-wrap wrap
  width 100vw
  height 100vh
  overflow hidden

  &.loaded
    .wizard-scene
      display none

.wizard-scene
  position fixed
  z-index 1001
  display -webkit-box
  display flex

.wizard
  position relative
  width 190px
  height 240px

.wizard-body
  position absolute
  bottom 0
  left 68px
  height 100px
  width 60px
  background #3f64ce
  &::after
    content ""
    position absolute
    bottom 0
    left 20px
    height 100px
    width 60px
    background #3f64ce
    -webkit-transform skewX(14deg)
    transform skewX(14deg)

.wizard-right-arm
  position absolute
  bottom 74px
  left 110px
  height 44px
  width 90px
  background #3f64ce
  border-radius 22px
  -webkit-transform-origin 16px 22px
  transform-origin 16px 22px
  -webkit-transform rotate(70deg)
  transform rotate(70deg)
  -webkit-animation right_arm 10s ease-in-out infinite
  animation right_arm 10s ease-in-out infinite
  .right-hand
    position absolute
    right 8px
    bottom 8px
    width 30px
    height 30px
    border-radius 50%
    background #f1c5b4
    -webkit-transform-origin center center
    transform-origin center center
    -webkit-transform rotate(-40deg)
    transform rotate(-40deg)
    -webkit-animation right_hand 10s ease-in-out infinite
    animation right_hand 10s ease-in-out infinite
  .wizard-right-hand
    &::after
      content ""
      position absolute
      right 0px
      top -8px
      width 15px
      height 30px
      border-radius 10px
      background #f1c5b4
      -webkit-transform translateY(16px)
      transform translateY(16px)
      -webkit-animation right_finger 10s ease-in-out infinite
      animation right_finger 10s ease-in-out infinite

.wizard-left-arm
  position absolute
  bottom 74px
  left 26px
  height 44px
  width 70px
  background #3f64ce
  border-bottom-left-radius 8px
  -webkit-transform-origin 60px 26px
  transform-origin 60px 26px
  -webkit-transform rotate(-70deg)
  transform rotate(-70deg)
  -webkit-animation left_arm 10s ease-in-out infinite
  animation left_arm 10s ease-in-out infinite
  .wizard-left-hand
    position absolute
    left -18px
    top 0
    width 18px
    height 30px
    border-top-left-radius 35px
    border-bottom-left-radius 35px
    background #f1c5b4
    &::after
      content ""
      position absolute
      right 0
      top 0
      width 30px
      height 15px
      border-radius 20px
      background #f1c5b4
      -webkit-transform-origin right bottom
      transform-origin right bottom
      -webkit-transform scaleX(0)
      transform scaleX(0)
      -webkit-animation left_finger 10s ease-in-out infinite
      animation left_finger 10s ease-in-out infinite

.wizard-head
  position absolute
  top 0
  left 14px
  width 160px
  height 210px
  -webkit-transform-origin center center
  transform-origin center center
  -webkit-transform rotate(-3deg)
  transform rotate(-3deg)
  -webkit-animation head 10s ease-in-out infinite
  animation head 10s ease-in-out infinite
  .wizard-beard
    position absolute
    bottom 0
    left 38px
    height 106px
    width 80px
    border-bottom-right-radius 55%
    background #ffffff
    &::after
      content ""
      position absolute
      top 16px
      left -10px
      width 40px
      height 20px
      border-radius 20px
      background #ffffff
  .wizard-face
    position absolute
    bottom 76px
    left 38px
    height 30px
    width 60px
    background #f1c5b4
    &::before
      content ""
      position absolute
      top 0px
      left 40px
      width 20px
      height 40px
      border-bottom-right-radius 20px
      border-bottom-left-radius 20px
      background #f1c5b4
    &::after
      content ""
      position absolute
      top 16px
      left -10px
      width 50px
      height 20px
      border-radius 20px
      border-bottom-right-radius 0px
      background #ffffff
    .wizard-adds
      position absolute
      top 0px
      left -10px
      width 40px
      height 20px
      border-radius 20px
      background #f1c5b4
      &::after
        content ""
        position absolute
        top 5px
        left 80px
        width 15px
        height 20px
        border-bottom-right-radius 20px
        border-top-right-radius 20px
        background #f1c5b4
  .wizard-hat
    position absolute
    bottom 106px
    left 0
    width 160px
    height 20px
    border-radius 20px
    background #3f64ce
    &::before
      content ""
      position absolute
      top -70px
      left 50%
      -webkit-transform translatex(-50%)
      transform translatex(-50%)
      width 0
      height 0
      border-style solid
      border-width 0 34px 70px 50px
      border-color transparent transparent #3f64ce transparent
    &::after
      content ""
      position absolute
      top 0
      left 0
      width 160px
      height 20px
      background #3f64ce
      border-radius 20px
    .wizard-hat-of-the-hat
      position absolute
      bottom 78px
      left 79px
      width 0
      height 0
      border-style solid
      border-width 0 25px 25px 19px
      border-color transparent transparent #3f64ce transparent
      &::after
        content ""
        position absolute
        top 6px
        left -4px
        width 35px
        height 10px
        border-radius 10px
        border-bottom-left-radius 0px
        background #3f64ce
        -webkit-transform rotate(40deg)
        transform rotate(40deg)
    .wizard-four-point-star
      position absolute
      width 12px
      height 12px
      &::after
        -webkit-transform rotate(156.66deg) skew(45deg)
        transform rotate(156.66deg) skew(45deg)
      &.--first
        bottom 28px
        left 46px
      &.--second
        bottom 40px
        left 80px
      &.--third
        bottom 15px
        left 108px

.wizard-head .wizard-hat .wizard-four-point-star::after, .wizard-head .wizard-hat .wizard-four-point-star::before
  content ""
  position absolute
  background #ffffff
  display block
  left 0
  width 141.4213%
  top 0
  bottom 0
  border-radius 10%
  -webkit-transform rotate(66.66deg) skewX(45deg)
  transform rotate(66.66deg) skewX(45deg)

.wizard-objects
  position relative
  width 200px
  height 240px

.wizard-square
  position absolute
  bottom -60px
  left -5px
  width 120px
  height 120px
  border-radius 50%
  -webkit-transform rotate(-360deg)
  transform rotate(-360deg)
  -webkit-animation path_square 10s ease-in-out infinite
  animation path_square 10s ease-in-out infinite
  &::after
    content ""
    position absolute
    top 10px
    left 0
    width 50px
    height 50px
    background #9ab3f5

.wizard-circle
  position absolute
  bottom 10px
  left 0
  width 100px
  height 100px
  border-radius 50%
  -webkit-transform rotate(-360deg)
  transform rotate(-360deg)
  -webkit-animation path_circle 10s ease-in-out infinite
  animation path_circle 10s ease-in-out infinite
  &::after
    content ""
    position absolute
    bottom -10px
    left 25px
    width 50px
    height 50px
    border-radius 50%
    background #c56183

.wizard-triangle
  position absolute
  bottom -62px
  left -10px
  width 110px
  height 110px
  border-radius 50%
  -webkit-transform rotate(-360deg)
  transform rotate(-360deg)
  -webkit-animation path_triangle 10s ease-in-out infinite
  animation path_triangle 10s ease-in-out infinite
  &::after
    content ""
    position absolute
    top 0
    right -10px
    width 0
    height 0
    border-style solid
    border-width 0 28px 48px 28px
    border-color transparent transparent #89beb3 transparent


/** 10s animation - 10% = 1s */
@-webkit-keyframes right_arm
  0%
    -webkit-transform rotate(70deg)
    transform rotate(70deg)
  10%
    -webkit-transform rotate(8deg)
    transform rotate(8deg)
  15%
    -webkit-transform rotate(20deg)
    transform rotate(20deg)
  20%
    -webkit-transform rotate(10deg)
    transform rotate(10deg)
  25%
    -webkit-transform rotate(26deg)
    transform rotate(26deg)
  30%
    -webkit-transform rotate(10deg)
    transform rotate(10deg)
  35%
    -webkit-transform rotate(28deg)
    transform rotate(28deg)
  40%
    -webkit-transform rotate(9deg)
    transform rotate(9deg)
  45%
    -webkit-transform rotate(28deg)
    transform rotate(28deg)
  50%
    -webkit-transform rotate(8deg)
    transform rotate(8deg)
  58%
    -webkit-transform rotate(74deg)
    transform rotate(74deg)
  62%
    -webkit-transform rotate(70deg)
    transform rotate(70deg)

@keyframes right_arm
  0%
    -webkit-transform rotate(70deg)
    transform rotate(70deg)
  10%
    -webkit-transform rotate(8deg)
    transform rotate(8deg)
  15%
    -webkit-transform rotate(20deg)
    transform rotate(20deg)
  20%
    -webkit-transform rotate(10deg)
    transform rotate(10deg)
  25%
    -webkit-transform rotate(26deg)
    transform rotate(26deg)
  30%
    -webkit-transform rotate(10deg)
    transform rotate(10deg)
  35%
    -webkit-transform rotate(28deg)
    transform rotate(28deg)
  40%
    -webkit-transform rotate(9deg)
    transform rotate(9deg)
  45%
    -webkit-transform rotate(28deg)
    transform rotate(28deg)
  50%
    -webkit-transform rotate(8deg)
    transform rotate(8deg)
  58%
    -webkit-transform rotate(74deg)
    transform rotate(74deg)
  62%
    -webkit-transform rotate(70deg)
    transform rotate(70deg)

@-webkit-keyframes left_arm
  0%
    -webkit-transform rotate(-70deg)
    transform rotate(-70deg)
  10%
    -webkit-transform rotate(6deg)
    transform rotate(6deg)
  15%
    -webkit-transform rotate(-18deg)
    transform rotate(-18deg)
  20%
    -webkit-transform rotate(5deg)
    transform rotate(5deg)
  25%
    -webkit-transform rotate(-18deg)
    transform rotate(-18deg)
  30%
    -webkit-transform rotate(5deg)
    transform rotate(5deg)
  35%
    -webkit-transform rotate(-17deg)
    transform rotate(-17deg)
  40%
    -webkit-transform rotate(5deg)
    transform rotate(5deg)
  45%
    -webkit-transform rotate(-18deg)
    transform rotate(-18deg)
  50%
    -webkit-transform rotate(6deg)
    transform rotate(6deg)
  58%
    -webkit-transform rotate(-74deg)
    transform rotate(-74deg)
  62%
    -webkit-transform rotate(-70deg)
    transform rotate(-70deg)

@keyframes left_arm
  0%
    -webkit-transform rotate(-70deg)
    transform rotate(-70deg)
  10%
    -webkit-transform rotate(6deg)
    transform rotate(6deg)
  15%
    -webkit-transform rotate(-18deg)
    transform rotate(-18deg)
  20%
    -webkit-transform rotate(5deg)
    transform rotate(5deg)
  25%
    -webkit-transform rotate(-18deg)
    transform rotate(-18deg)
  30%
    -webkit-transform rotate(5deg)
    transform rotate(5deg)
  35%
    -webkit-transform rotate(-17deg)
    transform rotate(-17deg)
  40%
    -webkit-transform rotate(5deg)
    transform rotate(5deg)
  45%
    -webkit-transform rotate(-18deg)
    transform rotate(-18deg)
  50%
    -webkit-transform rotate(6deg)
    transform rotate(6deg)
  58%
    -webkit-transform rotate(-74deg)
    transform rotate(-74deg)
  62%
    -webkit-transform rotate(-70deg)
    transform rotate(-70deg)

@-webkit-keyframes right_hand
  0%
    -webkit-transform rotate(-40deg)
    transform rotate(-40deg)
  10%
    -webkit-transform rotate(-20deg)
    transform rotate(-20deg)
  15%
    -webkit-transform rotate(-5deg)
    transform rotate(-5deg)
  20%
    -webkit-transform rotate(-60deg)
    transform rotate(-60deg)
  25%
    -webkit-transform rotate(0deg)
    transform rotate(0deg)
  30%
    -webkit-transform rotate(-60deg)
    transform rotate(-60deg)
  35%
    -webkit-transform rotate(0deg)
    transform rotate(0deg)
  40%
    -webkit-transform rotate(-40deg)
    transform rotate(-40deg)
  45%
    -webkit-transform rotate(-60deg)
    transform rotate(-60deg)
  50%
    -webkit-transform rotate(10deg)
    transform rotate(10deg)
  60%
    -webkit-transform rotate(-40deg)
    transform rotate(-40deg)


@keyframes right_hand
  0%
    -webkit-transform rotate(-40deg)
    transform rotate(-40deg)
  10%
    -webkit-transform rotate(-20deg)
    transform rotate(-20deg)
  15%
    -webkit-transform rotate(-5deg)
    transform rotate(-5deg)
  20%
    -webkit-transform rotate(-60deg)
    transform rotate(-60deg)
  25%
    -webkit-transform rotate(0deg)
    transform rotate(0deg)
  30%
    -webkit-transform rotate(-60deg)
    transform rotate(-60deg)
  35%
    -webkit-transform rotate(0deg)
    transform rotate(0deg)
  40%
    -webkit-transform rotate(-40deg)
    transform rotate(-40deg)
  45%
    -webkit-transform rotate(-60deg)
    transform rotate(-60deg)
  50%
    -webkit-transform rotate(10deg)
    transform rotate(10deg)
  60%
    -webkit-transform rotate(-40deg)
    transform rotate(-40deg)

@-webkit-keyframes right_finger
  0%
    -webkit-transform translateY(16px)
    transform translateY(16px)
  10%
    -webkit-transform none
    transform none
  50%
    -webkit-transform none
    transform none
  60%
    -webkit-transform translateY(16px)
    transform translateY(16px)

@keyframes right_finger
  0%
    -webkit-transform translateY(16px)
    transform translateY(16px)
  10%
    -webkit-transform none
    transform none
  50%
    -webkit-transform none
    transform none
  60%
    -webkit-transform translateY(16px)
    transform translateY(16px)

@-webkit-keyframes left_finger
  0%
    -webkit-transform scaleX(0)
    transform scaleX(0)
  10%
    -webkit-transform scaleX(1) rotate(6deg)
    transform scaleX(1) rotate(6deg)
  15%
    -webkit-transform scaleX(1) rotate(0deg)
    transform scaleX(1) rotate(0deg)
  20%
    -webkit-transform scaleX(1) rotate(8deg)
    transform scaleX(1) rotate(8deg)
  25%
    -webkit-transform scaleX(1) rotate(0deg)
    transform scaleX(1) rotate(0deg)
  30%
    -webkit-transform scaleX(1) rotate(7deg)
    transform scaleX(1) rotate(7deg)
  35%
    -webkit-transform scaleX(1) rotate(0deg)
    transform scaleX(1) rotate(0deg)
  40%
    -webkit-transform scaleX(1) rotate(5deg)
    transform scaleX(1) rotate(5deg)
  45%
    -webkit-transform scaleX(1) rotate(0deg)
    transform scaleX(1) rotate(0deg)
  50%
    -webkit-transform scaleX(1) rotate(6deg)
    transform scaleX(1) rotate(6deg)
  58%
    -webkit-transform scaleX(0)
    transform scaleX(0)

@keyframes left_finger
  0%
    -webkit-transform scaleX(0)
    transform scaleX(0)
  10%
    -webkit-transform scaleX(1) rotate(6deg)
    transform scaleX(1) rotate(6deg)
  15%
    -webkit-transform scaleX(1) rotate(0deg)
    transform scaleX(1) rotate(0deg)
  20%
    -webkit-transform scaleX(1) rotate(8deg)
    transform scaleX(1) rotate(8deg)
  25%
    -webkit-transform scaleX(1) rotate(0deg)
    transform scaleX(1) rotate(0deg)
  30%
    -webkit-transform scaleX(1) rotate(7deg)
    transform scaleX(1) rotate(7deg)
  35%
    -webkit-transform scaleX(1) rotate(0deg)
    transform scaleX(1) rotate(0deg)
  40%
    -webkit-transform scaleX(1) rotate(5deg)
    transform scaleX(1) rotate(5deg)
  45%
    -webkit-transform scaleX(1) rotate(0deg)
    transform scaleX(1) rotate(0deg)
  50%
    -webkit-transform scaleX(1) rotate(6deg)
    transform scaleX(1) rotate(6deg)
  58%
    -webkit-transform scaleX(0)
    transform scaleX(0)

@-webkit-keyframes head
  0%
    -webkit-transform rotate(-3deg)
    transform rotate(-3deg)
  10%
    -webkit-transform translatex(10px) rotate(7deg)
    transform translatex(10px) rotate(7deg)
  50%
    -webkit-transform translatex(0px) rotate(0deg)
    transform translatex(0px) rotate(0deg)
  56%
    -webkit-transform rotate(-3deg)
    transform rotate(-3deg)

@keyframes head
  0%
    -webkit-transform rotate(-3deg)
    transform rotate(-3deg)
  10%
    -webkit-transform translatex(10px) rotate(7deg)
    transform translatex(10px) rotate(7deg)
  50%
    -webkit-transform translatex(0px) rotate(0deg)
    transform translatex(0px) rotate(0deg)
  56%
    -webkit-transform rotate(-3deg)
    transform rotate(-3deg)
/** 10s animation - 10% = 1s */
@-webkit-keyframes path_circle
  0%
    -webkit-transform translateY(0)
    transform translateY(0)
  10%
    -webkit-transform translateY(-100px) rotate(-5deg)
    transform translateY(-100px) rotate(-5deg)
  55%
    -webkit-transform translateY(-100px) rotate(-360deg)
    transform translateY(-100px) rotate(-360deg)
  58%
    -webkit-transform translateY(-100px) rotate(-360deg)
    transform translateY(-100px) rotate(-360deg)
  63%
    -webkit-transform rotate(-360deg)
    transform rotate(-360deg)

@keyframes path_circle
  0%
    -webkit-transform translateY(0)
    transform translateY(0)
  10%
    -webkit-transform translateY(-100px) rotate(-5deg)
    transform translateY(-100px) rotate(-5deg)
  55%
    -webkit-transform translateY(-100px) rotate(-360deg)
    transform translateY(-100px) rotate(-360deg)
  58%
    -webkit-transform translateY(-100px) rotate(-360deg)
    transform translateY(-100px) rotate(-360deg)
  63%
    -webkit-transform rotate(-360deg)
    transform rotate(-360deg)

@-webkit-keyframes path_square
  0%
    -webkit-transform translateY(0)
    transform translateY(0)
  10%
    -webkit-transform translateY(-155px) translatex(-15px) rotate(10deg)
    transform translateY(-155px) translatex(-15px) rotate(10deg)
  55%
    -webkit-transform translateY(-155px) translatex(-15px) rotate(-350deg)
    transform translateY(-155px) translatex(-15px) rotate(-350deg)
  57%
    -webkit-transform translateY(-155px) translatex(-15px) rotate(-350deg)
    transform translateY(-155px) translatex(-15px) rotate(-350deg)
  63%
    -webkit-transform rotate(-360deg)
    transform rotate(-360deg)

@keyframes path_square
  0%
    -webkit-transform translateY(0)
    transform translateY(0)
  10%
    -webkit-transform translateY(-155px) translatex(-15px) rotate(10deg)
    transform translateY(-155px) translatex(-15px) rotate(10deg)
  55%
    -webkit-transform translateY(-155px) translatex(-15px) rotate(-350deg)
    transform translateY(-155px) translatex(-15px) rotate(-350deg)
  57%
    -webkit-transform translateY(-155px) translatex(-15px) rotate(-350deg)
    transform translateY(-155px) translatex(-15px) rotate(-350deg)
  63%
    -webkit-transform rotate(-360deg)
    transform rotate(-360deg)

@-webkit-keyframes path_triangle
  0%
    -webkit-transform translateY(0)
    transform translateY(0)
  10%
    -webkit-transform translateY(-172px) translatex(10px) rotate(-10deg)
    transform translateY(-172px) translatex(10px) rotate(-10deg)
  55%
    -webkit-transform translateY(-172px) translatex(10px) rotate(-365deg)
    transform translateY(-172px) translatex(10px) rotate(-365deg)
  58%
    -webkit-transform translateY(-172px) translatex(10px) rotate(-365deg)
    transform translateY(-172px) translatex(10px) rotate(-365deg)
  63%
    -webkit-transform rotate(-360deg)
    transform rotate(-360deg)

@keyframes path_triangle
  0%
    -webkit-transform translateY(0)
    transform translateY(0)
  10%
    -webkit-transform translateY(-172px) translatex(10px) rotate(-10deg)
    transform translateY(-172px) translatex(10px) rotate(-10deg)
  55%
    -webkit-transform translateY(-172px) translatex(10px) rotate(-365deg)
    transform translateY(-172px) translatex(10px) rotate(-365deg)
  58%
    -webkit-transform translateY(-172px) translatex(10px) rotate(-365deg)
    transform translateY(-172px) translatex(10px) rotate(-365deg)
  63%
    -webkit-transform rotate(-360deg)
    transform rotate(-360deg)
```

5. 修改 blog/themes/butterfly/layout/includes/layout.pug 文件

```diff
    body
-     if theme.preloader
+     if theme.preloader.enable
        !=partial('includes/loading/loading', {}, {cache: true})
```

6. 修改 blog/themes/butterfly/source/css/var.styl 文件

```diff
      // preloader
-     $preloader-bg = #37474f
+     $preloader-bg = hexo-config('preloader.enable') && hexo-config('preloader.load_color') ? convert(hexo-config('preloader.load_color')) : #37474f
      $preloader-word-color = #fff
```

7. 修改 _config.butterfly.yml 文件的 preloader 配置项

```diff
    # Loading Animation (加載動畫)
-   preloader: true
+   preloader:
+     enable: true # true|false
+     load_color: '#000000' # '#37474f'
+     load_style: wizard # default|gear|ironheart|scarecrow|triangles|wizard|image
+     load_image:  # url
```

8. 修改 blog/themes/butterfly/source/css/_mode/darkmode.styl 文件

```diff
    --search-input-color: alpha(#FFFFFF, .7)
    --search-result-title: alpha(#FFFFFF, .9)
-   --preloader-bg: darken(#121212, 2)
+   --preloader-bg: darken(#ca3b3e, -2)
    --preloader-color: alpha(#FFFFFF, .7)
    --tab-border-color: #2c2c2c
```

9. 加入超时自动结束和手动点击结束

注：超时自动结束和手动点击结束，两者兼容。

修改 blog/themes/butterfly/layout/includes/loading/loading-js.pug

##### 超时自动结束

```diff
-   script.
+   script(async).
      var preloader = {
        endLoading: () => {
          document.body.style.overflow = 'auto';
          document.getElementById('loading-box').classList.add("loaded")
        },
        initLoading: () => {
          document.body.style.overflow = '';
          document.getElementById('loading-box').classList.remove("loaded")

        }
      }
      window.addEventListener('load',()=> {preloader.endLoading()})
+     setTimeout(function(){preloader.endLoading();}, 5000);
```

##### 手动点击结束

```diff
-   script.
+   script(async).
      var preloader = {
        endLoading: () => {
          document.body.style.overflow = 'auto';
          document.getElementById('loading-box').classList.add("loaded")
        },
        initLoading: () => {
          document.body.style.overflow = '';
          document.getElementById('loading-box').classList.remove("loaded")

        }
      }
      window.addEventListener('load',()=> {preloader.endLoading()})
+     document.getElementById('loading-box').addEventListener('click',()=> {preloader.endLoading()})
```

##### 两者结合

```html
script(async).
  var preloader = {
    endLoading: () => {
      document.body.style.overflow = 'auto';
      document.getElementById('loading-box').classList.add("loaded")
    },
    initLoading: () => {
      document.body.style.overflow = '';
      document.getElementById('loading-box').classList.remove("loaded")

    }
  }
  window.addEventListener('load',preloader.endLoading())
  setTimeout(function(){preloader.endLoading();}, 5000);
  document.getElementById('loading-box').addEventListener('click',()=> {preloader.endLoading()})
```

#### Live2d Widget( 进阶 )

注：建议先去掉前面做过**页脚看板娘**的修改。

1. 进入 blog/themes/butterfly/source/ 目录下，运行下面命令

```shell
git clone https://github.com/stevenjoezhang/live2d-widget.git live2d-widget
```

2. 修改 blog/themes/butterfly/source/live2d-widget/autoload.js 文件

```diff
- const live2d_path = "https://cdn.jsdelivr.net/gh/stevenjoezhang/live2d-widget/";
+ const live2d_path = "/live2d-widget/";
```

3. 在 _config.butterfly.yml 文件的 inject 的 bottom 处引入

```diff
    # Inject
    # Insert the code to head (before '</head>' tag) and the bottom (before '</body>' tag)
    # 插入代码到头部 </head> 之前 和 底部 </body> 之前
    inject:
      head:
        # - <link rel="stylesheet" href="/xxx.css">
      bottom:
        # - <script src="xxxx"></script>
+       - <script defer src="/live2d-widget/autoload.js"></script>
```

4. 本地化 API 配置，修改 blog/themes/butterfly/source/live2d-widget/autoload.js 文件

```diff
  // 加载 waifu.css live2d.min.js waifu-tips.js
  if (screen.width >= 768) {
  	Promise.all([
  		loadExternalResource(live2d_path + "waifu.css", "css"),
  		loadExternalResource(live2d_path + "live2d.min.js", "js"),
  		loadExternalResource(live2d_path + "waifu-tips.js", "js")
  	]).then(() => {
  		initWidget({
  			waifuPath: live2d_path + "waifu-tips.json",
  			//apiPath: "https://live2d.fghrsh.net/api/",
-  			cdnPath: "https://cdn.jsdelivr.net/gh/fghrsh/live2d_api/"
+  			cdnPath: "https://npm.elemecdn.com/akilar-live2dapi@latest/"
//因为jsdelivr不支持50MB以上的包的加速，可能报403错误，所以用的vercel的CDN服务。
//可以考虑clone我配置好的live2d_api仓库自己部署到其他更快的cdn服务上。
  		});
  	});
  }
```

#### Hexo 异步加载方案

总的 HTML 加载时间，下载脚本的时间，执行脚本的时间是固定的。不同之处在于 HTML 阻塞的时间以及执行脚本的次序。

1. 不加任何 async 和 defer 的情况，页面总加载时间最长，是 HTML 加载时间 + 下载脚本时间 + 执行脚本时间

2. 加了 async 和 defer 的时间，在加载 HTML 时间足够长的情况下，所有静态资源总的加载时间都是 HTML 加载时间 + 执行脚本时间

3. defer 特性除了告诉浏览器不要阻塞页面之外，还可以确保脚本执行的相对顺序。这个很适合使用到 Vue 和 jquery 等 js 框架的 js 脚本，给它们添加 defer 属性以后，可以确保 HTML 加载完毕，且 js 下载完毕后，各个 js 脚本继续按照引入的顺序执行，从而确保不会因为依赖缺失而报错。

4. 其他脚本不会等待 async 脚本加载完成，同样，async 脚本也不会等待其他脚本。这个适合使用原生 js， 没有引用任何 js 框架，自己独立就能运行，且体量相对较小的 js 脚本，随页面加载同步下载执行。

在 _config.butterfly.yml 文件的 inject 的 bottom 的 JS 脚本加上 defer，如

```yaml
- <script defer src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
- <script defer src="/live2d-widget/autoload.js"></script> # 页脚看板娘2
#- <script defer src="https://cdn.jsdelivr.net/gh/stevenjoezhang/live2d-widget@latest/autoload.js"></script> # 页脚看板娘
#- <script defer src="https://uuuuu.cf/js/fishes.js"></script> # 页脚养鱼(彩色)    
- <script defer src="https://cdn.jsdelivr.net/gh/xiabo2/CDN@latest/fishes.js"></script>
- <script defer src="/js/sakura.js"></script>
- <script defer src="https://cdn.bootcss.com/canvas-nest.js/1.0.0/canvas-nest.min.js"></script> # 背景动态线条
#- <script defer src="/js/snow.js"></script> # 下雪动效
- <script defer src="/js/timing.js"></script> # 公告栏计时器插件
- <script defer src="/js/footerbea.js"></script>
- <script defer src="https://rmt.dogedoge.com/fetch/~/source/jsdelivr/npm/jquery@latest/dist/jquery.min.js"></script>
- <script defer data-pjax src="https://cdn.jsdelivr.net/gh/sirxemic/jquery.ripples/dist/jquery.ripples.js"></script>
- <script defer data-pjax src="/js/ripples.js"></script>
- <script defer src="https://pv.sohu.com/cityjson?ie=utf-8"></script>
- <script defer src="/js/ip_content.js"></script>
#- <script defer src="https://cdn.jsdelivr.net/npm/canvas-matrix.js@0/canvas-matrix.min.js" size="20" font="arial"></script>
#- <script async src="https://rmt.dogedoge.com/fetch/~/source/jsdelivr/gh/CodeByZach/pace/pace.min.js"></script> # 进度弹球
#- <script defer src="https://cdn.jsdelivr.net/combine/npm/jquery@latest/dist/jquery.min.js,gh/weilining/jsdelivr/jquery/circlemagic/circlemagic.min.js,gh/weilining/jsdelivr@latest/jquery/circlemagic/butterflycirclemagic.js"></script>
```

相比于给 CSS 添加异步加载，不如将我们的魔改样式整合到 index.css 文件内，减少对服务器的请求次数。这样更能节省加载时间。

1. 在 blog/themes/butterfly/source/css 目录下创建 _custom 目录，然后把魔改样式的 CSS 文件拖动进取，文件目录层级可以表示为以下情况：

```yaml
source
  |__ css
     |__ _custom
        ├── mouse.css
        ├── tag.css
        ├── title.css
        └── transparent.css
     |__ index.styl
```

2. 在 blog/themes/butterfly/source/css/index.styl 中新增一行代码：`@import '_custom/*.css'` (放在最底下)

```styl
if hexo-config('css_prefix')
  @import 'nib'

@import '_third-party/normalize.min.css'
// project
@import 'var'
@import '_global/*'
@import '_highlight/highlight'
@import '_page/*'
@import '_layout/*'
@import '_tags/*'
@import '_mode/*'
@import '_custom/*.css'
```

3. 在 blog/themes/butterfly/source/css/index.styl 中增加外联 css，使用 `@import` 逐行引入（放在最地下）

```styl
if hexo-config('css_prefix')
  @import 'nib'

@import '_third-party/normalize.min.css'
// project
@import 'var'
@import '_global/*'
@import '_highlight/highlight'
@import '_page/*'
@import '_layout/*'
@import '_tags/*'
@import '_mode/*'
@import '_custom/*.css'
@import 'https://cdn.jsdelivr.net/gh/sviptzk/StaticFile_HEXO@latest/butterfly/css/macblack.css'
```

4. 最终 _config.butterfly.yml 文件的 inject 的 head 处的样子如下

```yaml
#- <link rel="stylesheet" href="/css/myCreate.css">
#- <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/CodeByZach/pace/themes/pink/pace-theme-bounce.css"> # 进度弹球
#- <link rel="stylesheet" href="/css/title.css">
#- <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/sviptzk/StaticFile_HEXO@latest/butterfly/css/macblack.css">
#- <link rel="stylesheet" href="/css/mouse.css">
#- <link rel="stylesheet" href="/css/tag.css">
#- <link rel="stylesheet" href="/css/transparent.css">
#- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css">
- "<style>#article-container.post-content h1:before, h2:before, h3:before, h4:before, h5:before, h6:before { -webkit-animation: avatar_turn_around 1s linear infinite; -moz-animation: avatar_turn_around 1s linear infinite; -o-animation: avatar_turn_around 1s linear infinite; -ms-animation: avatar_turn_around 1s linear infinite; animation: avatar_turn_around 1s linear infinite; }</style>"
#- <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/zyoushuo/Blog@latest/hexo/css/loading_style_1.css" > # spinner-box风格样式文件
#- <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/zyoushuo/Blog@latest/hexo/css/loading_style_2.css" > # gear风格样式文件
```

#### 访客地图

1. 注册和登录 [ClustrMaps](https://clustrmaps.com/) 网站

2. 点击 Get Map Widget 按钮

3. 输入博客网址，如：https://luyf-lemon-love.github.io/

4. 选择 Map widget 静态地图

5. 点击 Customize widget

6. 然后设置参数，如下图

![](https://cos.luyf-lemon-love.space/images/访客地图.png)

7. 复制代码到你想要展示的地方，如放在 About 界面的 index.md 文件。

#### 修改副标题

在 config.butterfly.yml 文件中设置

```yaml
# the subtitle on homepage (主頁subtitle)
subtitle:
  enable: true
  # Typewriter Effect (打字效果)
  effect: true
  # loop (循環打字)
  loop: true
  # source 調用第三方服務
  # source: false 關閉調用
  # source: 1  調用一言網的一句話（簡體） https://hitokoto.cn/
  # source: 2  調用一句網（簡體） http://yijuzhan.com/
  # source: 3  調用今日詩詞（簡體） https://www.jinrishici.com/
  # subtitle 會先顯示 source , 再顯示 sub 的內容
  source: false
  # 如果關閉打字效果，subtitle 只會顯示 sub 的第一行文字
  sub:
    - 我宁愿犯错，也不愿什么都不做。
    - I'd rather make a mistake than do nothing.
```

### Butterfly 官方文档精要

#### Front-matter

Front-matter 是 Markdown 文件最上方以 --- 分隔的区域，用于指定个别档案的变数

- Page Front-matter 用于**页面**配置
- Post Front-matter 用于**文章页**配置

##### Page Front-matter

|参数|title|date|type|updated|description|top_img|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|解释|[必]页面标题|[必]页面创建日期|[必]标签、分类和友情链接三个页面需要配置|页面更新日期|页面描述|页面顶部图片|

##### Post Front-matter

|参数|title|date|updated|tags|categories|description|top_img|cover|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|解释|[必]文章标题|[必]文章创建日期|文章更新日期|文章标签|文章分类|文章描述|文章顶部图片|缩略图|

#### 图库

在 blog 目录下运行下面命令

```shell
hexo n page Gallery
```

然后打开 blog/source/Gallery/index.md 文件，写入下面内容

```markdown
---
title: Gallery
date: 2022-05-14 21:29:55
type: "Gallery"
top_img: https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main/blogs/pictures/20220511161548.png
---

<div class="gallery-group-main">
{% galleryGroup '壁纸' '收藏的一些壁纸' '/Gallery/wallpaper' https://i.loli.net/2019/11/10/T7Mu8Aod3egmC4Q.png %}
{% galleryGroup 'OH MY GIRL' '关于OH MY GIRL的图片' '/Gallery/ohmygirl' https://i.loli.net/2019/12/25/hOqbQ3BIwa6KWpo.jpg %}
</div>
```

在 blog 目录下运行下面命令

```shell
hexo n page ohmygirl

mv ./source/ohmygirl/ ./source/Gallery/
```

然后打开 blog/source/Gallery/ohmygirl/index.md 文件，写入下面内容

```markdown
---
title: Ohmygirl
date: 2022-05-14 21:55:30
---

{% gallery %}
![](https://i.loli.net/2019/12/25/Fze9jchtnyJXMHN.jpg)
![](https://i.loli.net/2019/12/25/ryLVePaqkYm4TEK.jpg)
![](https://i.loli.net/2019/12/25/gEy5Zc1Ai6VuO4N.jpg)
![](https://i.loli.net/2019/12/25/d6QHbytlSYO4FBG.jpg)
![](https://i.loli.net/2019/12/25/6nepIJ1xTgufatZ.jpg)
![](https://i.loli.net/2019/12/25/E7Jvr4eIPwUNmzq.jpg)
![](https://i.loli.net/2019/12/25/mh19anwBSWIkGlH.jpg)
![](https://i.loli.net/2019/12/25/2tu9JC8ewpBFagv.jpg)
{% endgallery %}
```

#### 复制相关设置

在 _config.butterfly.yml 文件中设置

```yaml
# copy settings
# copyright: Add the copyright information after copied content (複製的內容後面加上版權信息)
copy:
  enable: true
  copyright:
    enable: true
    limit_count: 50
```

#### 页脚设置

在 _config.butterfly.yml 文件设置

```yaml
# Footer Settings
# --------------------------------------
footer:
  owner:
    enable: true
    since: 2022
  custom_text: 感谢光临小破站，欢迎您提出宝贵的意见！
  copyright: true # Copyright of theme and framework
```

#### 主页标签彩色

在 _config.butterfly.yml 文件设置

```yaml
card_tags:
  enable: true
  limit: 40 # if set 0 will show all
  color: true
  sort_order: # Don't modify the setting unless you know how it works
```

#### 访问人数 busuanzi (UV 和 PV)

在 _config.butterfly.yml 文件中，设置

```yaml
# busuanzi count for PV / UV in site
# 訪問人數
busuanzi:
  site_uv: true
  site_pv: true
  page_pv: true
```

#### 运行时间

在 _config.butterfly.yml 文件中，设置

```yaml
runtimeshow:
  enable: true
  publish_date: 5/6/2022 00:00:00  
  ##网页开通时间
  #格式: 月/日/年 时间
  #也可以写成 年/月/日 时间
```

#### 访客地图（进阶）

1. 获取访客地图的 html 代码

```html
<script type="text/javascript" id="clstr_globe" src="//clustrmaps.com/globe.js?d=tZmOqhEgNYZZabN7nRUd-2bAEXcDNOKlXd4dKdcaF6Y"></script>
```

2. 在 blog/source/_data 目录下创建一个 widget.yml 文件，写入下面代码

```yaml
bottom:
    - class_name: user-map
      id_name: user-map
      name: 访客地图
      icon: fas fa-heartbeat
      order:
      html: '<script type="text/javascript" id="clstr_globe" src="//clustrmaps.com/globe.js?d=tZmOqhEgNYZZabN7nRUd-2bAEXcDNOKlXd4dKdcaF6Y"></script>'
```

#### 标签外挂

##### 用法 1

```markdown
{% note [class] [no-icon] [style] %}
Any content (support inline tags too.io).
{% endnote %}
```

|名称|class|no-icon|style|
|:-:|:-:|:-:|:-:|
|用法|【可选】标识，不同的标识有不同的配色（ default / primary / success / info / warning / danger ）|【可选】不显示 icon |【可选】可以覆盖配置中的 style（simple/modern/flat/disabled）|

**simple**

```markdown
{% note simple %}
默认 提示块标籤
{% endnote %}

{% note default simple %}
default 提示块标籤
{% endnote %}

{% note primary simple %}
primary 提示块标籤
{% endnote %}

{% note success simple %}
success 提示块标籤
{% endnote %}

{% note info simple %}
info 提示块标籤
{% endnote %}

{% note warning simple %}
warning 提示块标籤
{% endnote %}

{% note danger simple %}
danger 提示块标籤
{% endnote %}
```

**效果**

{% note simple %}
默认 提示块标籤
{% endnote %}

{% note default simple %}
default 提示块标籤
{% endnote %}

{% note primary simple %}
primary 提示块标籤
{% endnote %}

{% note success simple %}
success 提示块标籤
{% endnote %}

{% note info simple %}
info 提示块标籤
{% endnote %}

{% note warning simple %}
warning 提示块标籤
{% endnote %}

{% note danger simple %}
danger 提示块标籤
{% endnote %}

**modern**

```markdown
{% note modern %}
默认 提示块标籤
{% endnote %}

{% note default modern %}
default 提示块标籤
{% endnote %}

{% note primary modern %}
primary 提示块标籤
{% endnote %}

{% note success modern %}
success 提示块标籤
{% endnote %}

{% note info modern %}
info 提示块标籤
{% endnote %}

{% note warning modern %}
warning 提示块标籤
{% endnote %}

{% note danger modern %}
danger 提示块标籤
{% endnote %}
```

**效果**

{% note modern %}
默认 提示块标籤
{% endnote %}

{% note default modern %}
default 提示块标籤
{% endnote %}

{% note primary modern %}
primary 提示块标籤
{% endnote %}

{% note success modern %}
success 提示块标籤
{% endnote %}

{% note info modern %}
info 提示块标籤
{% endnote %}

{% note warning modern %}
warning 提示块标籤
{% endnote %}

{% note danger modern %}
danger 提示块标籤
{% endnote %}

**flat**

```markdown
{% note flat %}
默认 提示块标籤
{% endnote %}

{% note default flat %}
default 提示块标籤
{% endnote %}

{% note primary flat %}
primary 提示块标籤
{% endnote %}

{% note success flat %}
success 提示块标籤
{% endnote %}

{% note info flat %}
info 提示块标籤
{% endnote %}

{% note warning flat %}
warning 提示块标籤
{% endnote %}

{% note danger flat %}
danger 提示块标籤
{% endnote %}
```

**效果**

{% note flat %}
默认 提示块标籤
{% endnote %}

{% note default flat %}
default 提示块标籤
{% endnote %}

{% note primary flat %}
primary 提示块标籤
{% endnote %}

{% note success flat %}
success 提示块标籤
{% endnote %}

{% note info flat %}
info 提示块标籤
{% endnote %}

{% note warning flat %}
warning 提示块标籤
{% endnote %}

{% note danger flat %}
danger 提示块标籤
{% endnote %}

**disabled**

```markdown
{% note disabled %}
默认 提示块标籤
{% endnote %}

{% note default disabled %}
default 提示块标籤
{% endnote %}

{% note primary disabled %}
primary 提示块标籤
{% endnote %}

{% note success disabled %}
success 提示块标籤
{% endnote %}

{% note info disabled %}
info 提示块标籤
{% endnote %}

{% note warning disabled %}
warning 提示块标籤
{% endnote %}

{% note danger disabled %}
danger 提示块标籤
{% endnote %}
```

**效果**

{% note disabled %}
默认 提示块标籤
{% endnote %}

{% note default disabled %}
default 提示块标籤
{% endnote %}

{% note primary disabled %}
primary 提示块标籤
{% endnote %}

{% note success disabled %}
success 提示块标籤
{% endnote %}

{% note info disabled %}
info 提示块标籤
{% endnote %}

{% note warning disabled %}
warning 提示块标籤
{% endnote %}

{% note danger disabled %}
danger 提示块标籤
{% endnote %}

**no-icon**

```markdown
{% note no-icon %}
默认 提示块标籤
{% endnote %}

{% note default no-icon %}
default 提示块标籤
{% endnote %}

{% note primary no-icon %}
primary 提示块标籤
{% endnote %}

{% note success no-icon %}
success 提示块标籤
{% endnote %}

{% note info no-icon %}
info 提示块标籤
{% endnote %}

{% note warning no-icon %}
warning 提示块标籤
{% endnote %}

{% note danger no-icon %}
danger 提示块标籤
{% endnote %}
```

**效果**

{% note no-icon %}
默认 提示块标籤
{% endnote %}

{% note default no-icon %}
default 提示块标籤
{% endnote %}

{% note primary no-icon %}
primary 提示块标籤
{% endnote %}

{% note success no-icon %}
success 提示块标籤
{% endnote %}

{% note info no-icon %}
info 提示块标籤
{% endnote %}

{% note warning no-icon %}
warning 提示块标籤
{% endnote %}

{% note danger no-icon %}
danger 提示块标籤
{% endnote %}

##### 用法 2（自定义 icon)

```markdown
{% note [color] [icon] [style] %}
Any content (support inline tags too.io).
{% endnote %}
```

|名称|color|icon|style|
|:-:|:-:|:-:|:-:|
|用法|【可选】顔色 (default / blue / pink / red / purple / orange / green)|【可选】可配置自定义 icon (只支持 fontawesome 图标, 也可以配置 no-icon )|【可选】可以覆盖配置中的 style（simple/modern/flat/disabled）|

**simple**

```markdown
{% note 'fab fa-cc-visa' simple %}
你是刷 Visa 还是 UnionPay
{% endnote %}
{% note blue 'fas fa-bullhorn' simple %}
2021年快到了....
{% endnote %}
{% note pink 'fas fa-car-crash' simple %}
小心开车 安全至上
{% endnote %}
{% note red 'fas fa-fan' simple%}
这是三片呢？还是四片？
{% endnote %}
{% note orange 'fas fa-battery-half' simple %}
你是刷 Visa 还是 UnionPay
{% endnote %}
{% note purple 'far fa-hand-scissors' simple %}
剪刀石头布
{% endnote %}
{% note green 'fab fa-internet-explorer' simple %}
前端最讨厌的浏览器
{% endnote %}
```

**效果**

{% note 'fab fa-cc-visa' simple %}
你是刷 Visa 还是 UnionPay
{% endnote %}
{% note blue 'fas fa-bullhorn' simple %}
2021年快到了....
{% endnote %}
{% note pink 'fas fa-car-crash' simple %}
小心开车 安全至上
{% endnote %}
{% note red 'fas fa-fan' simple%}
这是三片呢？还是四片？
{% endnote %}
{% note orange 'fas fa-battery-half' simple %}
你是刷 Visa 还是 UnionPay
{% endnote %}
{% note purple 'far fa-hand-scissors' simple %}
剪刀石头布
{% endnote %}
{% note green 'fab fa-internet-explorer' simple %}
前端最讨厌的浏览器
{% endnote %}

**modern**

```markdown
{% note 'fab fa-cc-visa' modern %}
你是刷 Visa 还是 UnionPay
{% endnote %}
{% note blue 'fas fa-bullhorn' modern %}
2021年快到了....
{% endnote %}
{% note pink 'fas fa-car-crash' modern %}
小心开车 安全至上
{% endnote %}
{% note red 'fas fa-fan' modern%}
这是三片呢？还是四片？
{% endnote %}
{% note orange 'fas fa-battery-half' modern %}
你是刷 Visa 还是 UnionPay
{% endnote %}
{% note purple 'far fa-hand-scissors' modern %}
剪刀石头布
{% endnote %}
{% note green 'fab fa-internet-explorer' modern %}
前端最讨厌的浏览器
{% endnote %}
```

**效果**

{% note 'fab fa-cc-visa' modern %}
你是刷 Visa 还是 UnionPay
{% endnote %}
{% note blue 'fas fa-bullhorn' modern %}
2021年快到了....
{% endnote %}
{% note pink 'fas fa-car-crash' modern %}
小心开车 安全至上
{% endnote %}
{% note red 'fas fa-fan' modern%}
这是三片呢？还是四片？
{% endnote %}
{% note orange 'fas fa-battery-half' modern %}
你是刷 Visa 还是 UnionPay
{% endnote %}
{% note purple 'far fa-hand-scissors' modern %}
剪刀石头布
{% endnote %}
{% note green 'fab fa-internet-explorer' modern %}
前端最讨厌的浏览器
{% endnote %}

**flat**

```markdown
{% note 'fab fa-cc-visa' flat %}
你是刷 Visa 还是 UnionPay
{% endnote %}
{% note blue 'fas fa-bullhorn' flat %}
2021年快到了....
{% endnote %}
{% note pink 'fas fa-car-crash' flat %}
小心开车 安全至上
{% endnote %}
{% note red 'fas fa-fan' flat%}
这是三片呢？还是四片？
{% endnote %}
{% note orange 'fas fa-battery-half' flat %}
你是刷 Visa 还是 UnionPay
{% endnote %}
{% note purple 'far fa-hand-scissors' flat %}
剪刀石头布
{% endnote %}
{% note green 'fab fa-internet-explorer' flat %}
前端最讨厌的浏览器
{% endnote %}
```

**效果**

{% note 'fab fa-cc-visa' flat %}
你是刷 Visa 还是 UnionPay
{% endnote %}
{% note blue 'fas fa-bullhorn' flat %}
2021年快到了....
{% endnote %}
{% note pink 'fas fa-car-crash' flat %}
小心开车 安全至上
{% endnote %}
{% note red 'fas fa-fan' flat%}
这是三片呢？还是四片？
{% endnote %}
{% note orange 'fas fa-battery-half' flat %}
你是刷 Visa 还是 UnionPay
{% endnote %}
{% note purple 'far fa-hand-scissors' flat %}
剪刀石头布
{% endnote %}
{% note green 'fab fa-internet-explorer' flat %}
前端最讨厌的浏览器
{% endnote %}

**disabled**

```markdown
{% note 'fab fa-cc-visa' disabled %}
你是刷 Visa 还是 UnionPay
{% endnote %}
{% note blue 'fas fa-bullhorn' disabled %}
2021年快到了....
{% endnote %}
{% note pink 'fas fa-car-crash' disabled %}
小心开车 安全至上
{% endnote %}
{% note red 'fas fa-fan' disabled %}
这是三片呢？还是四片？
{% endnote %}
{% note orange 'fas fa-battery-half' disabled %}
你是刷 Visa 还是 UnionPay
{% endnote %}
{% note purple 'far fa-hand-scissors' disabled %}
剪刀石头布
{% endnote %}
{% note green 'fab fa-internet-explorer' disabled %}
前端最讨厌的浏览器
{% endnote %}
```

**效果**

{% note 'fab fa-cc-visa' disabled %}
你是刷 Visa 还是 UnionPay
{% endnote %}
{% note blue 'fas fa-bullhorn' disabled %}
2021年快到了....
{% endnote %}
{% note pink 'fas fa-car-crash' disabled %}
小心开车 安全至上
{% endnote %}
{% note red 'fas fa-fan' disabled %}
这是三片呢？还是四片？
{% endnote %}
{% note orange 'fas fa-battery-half' disabled %}
你是刷 Visa 还是 UnionPay
{% endnote %}
{% note purple 'far fa-hand-scissors' disabled %}
剪刀石头布
{% endnote %}
{% note green 'fab fa-internet-explorer' disabled %}
前端最讨厌的浏览器
{% endnote %}

**no-icon**

```markdown
{% note no-icon %}
你是刷 Visa 还是 UnionPay
{% endnote %}
{% note blue no-icon %}
2021年快到了....
{% endnote %}
{% note pink no-icon %}
小心开车 安全至上
{% endnote %}
{% note red no-icon %}
这是三片呢？还是四片？
{% endnote %}
{% note orange no-icon %}
你是刷 Visa 还是 UnionPay
{% endnote %}
{% note purple no-icon %}
剪刀石头布
{% endnote %}
{% note green no-icon %}
前端最讨厌的浏览器
{% endnote %}
```

**效果**

{% note no-icon %}
你是刷 Visa 还是 UnionPay
{% endnote %}
{% note blue no-icon %}
2021年快到了....
{% endnote %}
{% note pink no-icon %}
小心开车 安全至上
{% endnote %}
{% note red no-icon %}
这是三片呢？还是四片？
{% endnote %}
{% note orange no-icon %}
你是刷 Visa 还是 UnionPay
{% endnote %}
{% note purple no-icon %}
剪刀石头布
{% endnote %}
{% note green no-icon %}
前端最讨厌的浏览器
{% endnote %}

#### Gallery 相册图库

**语法**

```markdown
<div class="gallery-group-main">
{% galleryGroup name description link img-url %}
{% galleryGroup name description link img-url %}
{% galleryGroup name description link img-url %}
</div>
```

```markdown
<div class="gallery-group-main">
{% galleryGroup '壁纸' '收藏的一些壁纸' '/Gallery/wallpaper' https://i.loli.net/2019/11/10/T7Mu8Aod3egmC4Q.png %}
{% galleryGroup '漫威' '关于漫威的图片' '/Gallery/marvel' https://i.loli.net/2019/12/25/8t97aVlp4hgyBGu.jpg %}
{% galleryGroup 'OH MY GIRL' '关于OH MY GIRL的图片' '/Gallery/ohmygirl' https://i.loli.net/2019/12/25/hOqbQ3BIwa6KWpo.jpg %}
</div>
```

**效果**

<div class="gallery-group-main">
{% galleryGroup '壁纸' '收藏的一些壁纸' '/Gallery/wallpaper' https://i.loli.net/2019/11/10/T7Mu8Aod3egmC4Q.png %}
{% galleryGroup '漫威' '关于漫威的图片' '/Gallery/marvel' https://i.loli.net/2019/12/25/8t97aVlp4hgyBGu.jpg %}
{% galleryGroup 'OH MY GIRL' '关于OH MY GIRL的图片' '/Gallery/ohmygirl' https://i.loli.net/2019/12/25/hOqbQ3BIwa6KWpo.jpg %}
</div>

#### Gallery 相册

**语法**

```markdown
{% gallery %}
markdown 图片格式
{% endgallery %}
```

```markdown
{% gallery %}
![](https://i.loli.net/2019/12/25/Fze9jchtnyJXMHN.jpg)
![](https://i.loli.net/2019/12/25/ryLVePaqkYm4TEK.jpg)
![](https://i.loli.net/2019/12/25/gEy5Zc1Ai6VuO4N.jpg)
![](https://i.loli.net/2019/12/25/d6QHbytlSYO4FBG.jpg)
![](https://i.loli.net/2019/12/25/6nepIJ1xTgufatZ.jpg)
![](https://i.loli.net/2019/12/25/E7Jvr4eIPwUNmzq.jpg)
![](https://i.loli.net/2019/12/25/mh19anwBSWIkGlH.jpg)
![](https://i.loli.net/2019/12/25/2tu9JC8ewpBFagv.jpg)
{% endgallery %}
```

**效果**

{% gallery %}
![](https://i.loli.net/2019/12/25/Fze9jchtnyJXMHN.jpg)
![](https://i.loli.net/2019/12/25/ryLVePaqkYm4TEK.jpg)
![](https://i.loli.net/2019/12/25/gEy5Zc1Ai6VuO4N.jpg)
![](https://i.loli.net/2019/12/25/d6QHbytlSYO4FBG.jpg)
![](https://i.loli.net/2019/12/25/6nepIJ1xTgufatZ.jpg)
![](https://i.loli.net/2019/12/25/E7Jvr4eIPwUNmzq.jpg)
![](https://i.loli.net/2019/12/25/mh19anwBSWIkGlH.jpg)
![](https://i.loli.net/2019/12/25/2tu9JC8ewpBFagv.jpg)
{% endgallery %}

#### tag-hide

**inline**

```markdown
inline 在文本里面添加按钮隐藏内容，只限文字( content不能包含英文逗号，可用&sbquo;)
```

```markdown
{% hideInline content,display,bg,color %}
```

- content: 文本内容
- display: 按钮显示的文字（可选）
- bg: 按钮的背景颜色（可选）
- color: 按钮文字的颜色（可选）

**Demo**

```markdown
哪个英文字母最酷？ {% hideInline 因为西装裤(C装酷),查看答案,#FF7242,#fff %}

门里站着一个人? {% hideInline 闪 %}
```

哪个英文字母最酷？ {% hideInline 因为西装裤(C装酷),查看答案,#FF7242,#fff %}

门里站着一个人? {% hideInline 闪 %}

**block**

```markdown
block 独立的 block 隐藏内容，可以隐藏很多内容，包括图片，代码块等等

( display 不能包含英文逗号，可用&sbquo;)
```

```markdown
{% hideBlock display,bg,color %}
content
{% endhideBlock %}
```

- content: 文本内容
- display: 按钮显示的文字（可选）
- bg: 按钮的背景颜色（可选）
- color: 按钮文字的颜色（可选）

**Demo**

```markdown
{% hideBlock display,bg,color %}
content
{% endhideBlock %}
```

{% hideBlock display,bg,color %}
content
{% endhideBlock %}

**Toggle**

```markdown
如果你需要展示的内容太多，可以把它隐藏在收缩框里，需要时再把它展开。

( display 不能包含英文逗号，可用&sbquo;)
```

```markdown
{% hideToggle display,bg,color %}
content
{% endhideToggle %}
```

- content: 文本内容
- display: 按钮显示的文字（可选）
- bg: 按钮的背景颜色（可选）
- color: 按钮文字的颜色（可选）

**Demo**

```markdown
{% hideToggle Butterfly安装方法 %}
在你的博客根目录里

git clone -b master https://github.com/jerryc127/hexo-theme-butterfly.git themes/Butterfly

如果想要安装比较新的dev分支，可以

git clone -b dev https://github.com/jerryc127/hexo-theme-butterfly.git themes/Butterfly

{% endhideToggle %}
```

**效果**

{% hideToggle Butterfly安装方法 %}
在你的博客根目录里

git clone -b master https://github.com/jerryc127/hexo-theme-butterfly.git themes/Butterfly

如果想要安装比较新的dev分支，可以

git clone -b dev https://github.com/jerryc127/hexo-theme-butterfly.git themes/Butterfly

{% endhideToggle %}

#### mermaid

使用 mermaid 标签可以绘制 Flowchart（流程图）、Sequence diagram（时序图 ）、Class Diagram（类别图）、State Diagram（状态图）、Gantt（甘特图）和Pie Chart（圆形图）。

[mermaid 文档](https://mermaid-js.github.io/mermaid/)

配置 _config.butterfly.yml 文件

```yaml
# mermaid
# see https://github.com/mermaid-js/mermaid
mermaid:
  enable: true
  # built-in themes: default/forest/dark/neutral
  theme:
    light: default
    dark: dark
```

**写法**

```markdown
{% mermaid %}
内容
{% endmermaid %}
```

```markdown
{% mermaid %}
pie
    title Key elements in Product X
    "Calcium" : 42.96
    "Potassium" : 50.05
    "Magnesium" : 10.01
    "Iron" :  5
{% endmermaid %}
```

**效果**

{% mermaid %}
pie
    title Key elements in Product X
    "Calcium" : 42.96
    "Potassium" : 50.05
    "Magnesium" : 10.01
    "Iron" :  5
{% endmermaid %}

#### Tabs

**使用方法**

```markdown
{% tabs Unique name, [index] %}
<!-- tab [Tab caption] [@icon] -->
Any content (support inline tags too).
<!-- endtab -->
{% endtabs %}

Unique name   : Unique name of tabs block tag without comma.
                Will be used in #id's as prefix for each tab with their index numbers.
                If there are whitespaces in name, for generate #id all whitespaces will replaced by dashes.
                Only for current url of post/page must be unique!
[index]       : Index number of active tab.
                If not specified, first tab (1) will be selected.
                If index is -1, no tab will be selected. It's will be something like spoiler.
                Optional parameter.
[Tab caption] : Caption of current tab.
                If not caption specified, unique name with tab index suffix will be used as caption of tab.
                If not caption specified, but specified icon, caption will empty.
                Optional parameter.
[@icon]       : FontAwesome icon name (full-name, look like 'fas fa-font')
                Can be specified with or without space; e.g. 'Tab caption @icon' similar to 'Tab caption@icon'.
                Optional parameter.
```

**Demo 1 - 预设选择第一个【默认】**

```markdown
{% tabs test1 %}
<!-- tab -->
**This is Tab 1.**
<!-- endtab -->

<!-- tab -->
**This is Tab 2.**
<!-- endtab -->

<!-- tab -->
**This is Tab 3.**
<!-- endtab -->
{% endtabs %}
```

**效果**

{% tabs test1 %}
<!-- tab -->
**This is Tab 1.**
<!-- endtab -->

<!-- tab -->
**This is Tab 2.**
<!-- endtab -->

<!-- tab -->
**This is Tab 3.**
<!-- endtab -->
{% endtabs %}

**Demo 2 - 预设选择 tabs**

```markdown
{% tabs test2, 3 %}
<!-- tab -->
**This is Tab 1.**
<!-- endtab -->

<!-- tab -->
**This is Tab 2.**
<!-- endtab -->

<!-- tab -->
**This is Tab 3.**
<!-- endtab -->
{% endtabs %}
```

**效果**

{% tabs test2, 3 %}
<!-- tab -->
**This is Tab 1.**
<!-- endtab -->

<!-- tab -->
**This is Tab 2.**
<!-- endtab -->

<!-- tab -->
**This is Tab 3.**
<!-- endtab -->
{% endtabs %}

**Demo 3 - 没有预设值**

```markdown
{% tabs test3, -1 %}
<!-- tab -->
**This is Tab 1.**
<!-- endtab -->

<!-- tab -->
**This is Tab 2.**
<!-- endtab -->

<!-- tab -->
**This is Tab 3.**
<!-- endtab -->
{% endtabs %}
```

**效果**

{% tabs test3, -1 %}
<!-- tab -->
**This is Tab 1.**
<!-- endtab -->

<!-- tab -->
**This is Tab 2.**
<!-- endtab -->

<!-- tab -->
**This is Tab 3.**
<!-- endtab -->
{% endtabs %}

**Demo 4 - 自定义Tab名 + 只有icon + icon和Tab名**

```markdown
{% tabs test4 %}
<!-- tab 第一个Tab -->
**tab名字为第一个Tab**
<!-- endtab -->

<!-- tab @fab fa-apple-pay -->
**只有图标 没有Tab名字**
<!-- endtab -->

<!-- tab 炸弹@fas fa-bomb -->
**名字+icon**
<!-- endtab -->
{% endtabs %}
```

**效果**

{% tabs test4 %}
<!-- tab 第一个Tab -->
**tab名字为第一个Tab**
<!-- endtab -->

<!-- tab @fab fa-apple-pay -->
**只有图标 没有Tab名字**
<!-- endtab -->

<!-- tab 炸弹@fas fa-bomb -->
**名字+icon**
<!-- endtab -->
{% endtabs %}

#### inlineImg

```markdown
{% inlineImg [src] [height] %}

[src]      :    图片链接
[height]   ：   图片高度限制【可选】
```

**Demon**

```markdown
你看我长得漂亮不

![](https://i.loli.net/2021/03/19/2P6ivUGsdaEXSFI.png)

我觉得很漂亮 {% inlineImg https://i.loli.net/2021/03/19/5M4jUB3ynq7ePgw.png 150px %}
```

**效果**

你看我长得漂亮不

![](https://i.loli.net/2021/03/19/2P6ivUGsdaEXSFI.png)

我觉得很漂亮 {% inlineImg https://i.loli.net/2021/03/19/5M4jUB3ynq7ePgw.png 150px %}


#### label

```markdown
{% label text color %}
```

- text: 文字
- color: 【可选】背景颜色，默认为 default default/blue/pink/red/purple/orange/green

**Demo**

```markdown
臣亮言：{% label 先帝 %}创业未半，而{% label 中道崩殂 blue %}。今天下三分，{% label 益州疲敝 pink %}，此诚{% label 危急存亡之秋 red %}也！然侍衞之臣，不懈于内；{% label 忠志之士 purple %}，忘身于外者，盖追先帝之殊遇，欲报之于陛下也。诚宜开张圣听，以光先帝遗德，恢弘志士之气；不宜妄自菲薄，引喻失义，以塞忠谏之路也。
宫中、府中，俱为一体；陟罚臧否，不宜异同。若有{% label 作奸 orange %}、{% label 犯科 green %}，及为忠善者，宜付有司，论其刑赏，以昭陛下平明之治；不宜偏私，使内外异法也。
```

**效果**

臣亮言：{% label 先帝 %}创业未半，而{% label 中道崩殂 blue %}。今天下三分，{% label 益州疲敝 pink %}，此诚{% label 危急存亡之秋 red %}也！然侍衞之臣，不懈于内；{% label 忠志之士 purple %}，忘身于外者，盖追先帝之殊遇，欲报之于陛下也。诚宜开张圣听，以光先帝遗德，恢弘志士之气；不宜妄自菲薄，引喻失义，以塞忠谏之路也。
宫中、府中，俱为一体；陟罚臧否，不宜异同。若有{% label 作奸 orange %}、{% label 犯科 green %}，及为忠善者，宜付有司，论其刑赏，以昭陛下平明之治；不宜偏私，使内外异法也。

#### timeline

```markdown
{% timeline title,color %}
<!-- timeline title -->
xxxxx
<!-- endtimeline -->
<!-- timeline title -->
xxxxx
<!-- endtimeline -->
{% endtimeline %}
```

- title: 标题/时间线
- color: timeline 颜色 default(留空) / blue / pink / red / purple / orange / green

```markdown
{% timeline 2022 %}
<!-- timeline 01-02 -->
这是测试页面
<!-- endtimeline -->
{% endtimeline %}
```

**效果**

{% timeline 2022 %}
<!-- timeline 01-02 -->
这是测试页面
<!-- endtimeline -->
{% endtimeline %}

```markdown
{% timeline 2022,blue %}
<!-- timeline 01-02 -->
这是测试页面
<!-- endtimeline -->
{% endtimeline %}
```

**效果**

{% timeline 2022,blue %}
<!-- timeline 01-02 -->
这是测试页面
<!-- endtimeline -->
{% endtimeline %}

```markdown
{% timeline 2022,green %}
<!-- timeline 01-02 -->
这是测试页面
<!-- endtimeline -->
{% endtimeline %}
```

**效果**

{% timeline 2022,green %}
<!-- timeline 01-02 -->
这是测试页面
<!-- endtimeline -->
{% endtimeline %}

#### flink

```markdown
{% flink %}
xxxxxx
{% endflink %}
```

```markdown
{% flink %}
- class_name: 友情链接
  class_desc: 那些人，那些事
  link_list:
    - name: JerryC
      link: https://jerryc.me/
      avatar: https://jerryc.me/img/avatar.png
      descr: 今日事,今日毕
    - name: Hexo
      link: https://hexo.io/zh-tw/
      avatar: https://d33wubrfki0l68.cloudfront.net/6657ba50e702d84afb32fe846bed54fba1a77add/827ae/logo.svg
      descr: 快速、简单且强大的网誌框架

- class_name: 网站
  class_desc: 值得推荐的网站
  link_list:
    - name: Youtube
      link: https://www.youtube.com/
      avatar: https://i.loli.net/2020/05/14/9ZkGg8v3azHJfM1.png
      descr: 视频网站
    - name: Weibo
      link: https://www.weibo.com/
      avatar: https://i.loli.net/2020/05/14/TLJBum386vcnI1P.png
      descr: 中国最大社交分享平台
    - name: Twitter
      link: https://twitter.com/
      avatar: https://i.loli.net/2020/05/14/5VyHPQqR6LWF39a.png
      descr: 社交分享平台
{% endflink %}
```

**效果**

{% flink %}
- class_name: 友情链接
  class_desc: 那些人，那些事
  link_list:
    - name: JerryC
      link: https://jerryc.me/
      avatar: https://jerryc.me/img/avatar.png
      descr: 今日事,今日毕
    - name: Hexo
      link: https://hexo.io/zh-tw/
      avatar: https://d33wubrfki0l68.cloudfront.net/6657ba50e702d84afb32fe846bed54fba1a77add/827ae/logo.svg
      descr: 快速、简单且强大的网誌框架

- class_name: 网站
  class_desc: 值得推荐的网站
  link_list:
    - name: Youtube
      link: https://www.youtube.com/
      avatar: https://i.loli.net/2020/05/14/9ZkGg8v3azHJfM1.png
      descr: 视频网站
    - name: Weibo
      link: https://www.weibo.com/
      avatar: https://i.loli.net/2020/05/14/TLJBum386vcnI1P.png
      descr: 中国最大社交分享平台
    - name: Twitter
      link: https://twitter.com/
      avatar: https://i.loli.net/2020/05/14/5VyHPQqR6LWF39a.png
      descr: 社交分享平台
{% endflink %}

#### 打字特效

修改 _config.butterfly.yml 文件

```yaml
# Typewriter Effect (打字效果)
# https://github.com/disjukr/activate-power-mode
activate_power_mode:
  enable: true
  colorful: true # open particle animation (冒光特效)
  shake: false #  open shake (抖動特效)
  mobile: true
```

#### 背景特效

修改 _config.butterfly.yml 文件

**静止条带**

```yaml
# canvas_ribbon (靜止彩帶背景)
# See: https://github.com/hustcc/ribbon.js
canvas_ribbon:
  enable: false
  size: 150
  alpha: 0.6
  zIndex: -1
  click_to_change: false
  mobile: false
```

**动态条带**

```yaml
# Fluttering Ribbon (動態彩帶)
canvas_fluttering_ribbon:
  enable: true
  mobile: false
```

**canvas-nest**

注：建议去掉之前加的动态线条效果

```yaml
# canvas_nest
# https://github.com/hustcc/canvas-nest.js
canvas_nest:
  enable: true
  color: '0,0,255' #color of lines, default: '0,0,0'; RGB values: (R,G,B).(note: use ',' to separate.)
  opacity: 0.7 # the opacity of line (0~1), default: 0.5.
  zIndex: -1 # z-index property of the background, default: -1.
  count: 99 # the number of lines, default: 99.
  mobile: false
```

#### 鼠标点击效果

修改 _config.butterfly.yml 文件

```yaml
# Mouse click effects: fireworks (鼠標點擊效果: 煙火特效)
fireworks:
  enable: true
  zIndex: 9999 # -1 or 9999
  mobile: false

# Mouse click effects: Heart symbol (鼠標點擊效果: 愛心)
click_heart:
  enable: false
  mobile: false

# Mouse click effects: words (鼠標點擊效果: 文字)
ClickShowText:
  enable: false
  text:
    # - I
    # - LOVE
    # - YOU
  fontSize: 15px
  random: false
  mobile: false
```

#### 页面美化

会改变ol、ul、h1-h5的样式

修改 _config.butterfly.yml 文件

```yaml
# Beautify (美化頁面顯示)
beautify:
  enable: true
  field: site # site/post
  title-prefix-icon: '\f0c1' # '\f863'
  title-prefix-icon-color: '#F47466'
```

#### Snackbar 弹窗

修改 _config.butterfly.yml 文件

```yaml
# Snackbar (Toast Notification 彈窗)
# https://github.com/polonel/SnackBar
# position 彈窗位置
# 可選 top-left / top-center / top-right / bottom-left / bottom-center / bottom-right
snackbar:
  enable: true
  position: bottom-left
  bg_light: '#49b1f5' # The background color of Toast Notification in light mode
  bg_dark: '#1f1f1f' # The background color of Toast Notification in dark mode
```

#### Instantpage

当鼠标悬停到链接上超过 65 毫秒时，Instantpage 会对该链接进行预加载，可以提升访问速度。

修改 _config.butterfly.yml 文件

```yaml
# https://instant.page/
# prefetch (預加載)
instantpage: true
```

#### 全局 Aplayer 播放

1. 进入 blog 目录进行**插件安装**

```shell
npm install --save hexo-tag-aplayer
```

2. 关闭 asset_inject

在 _config.yml 文件中添加

```yaml
aplayer:
  meting: true
  asset_inject: false
```

3. 开启主题的 aplayerInject

在 _config.butterfly.yml 文件中设置

```yaml
# Inject the css and script (aplayer/meting)
aplayerInject:
  enable: true
  per_page: true
```

4. 插入 Aplayer html

分享歌单的链接的最后一串数字是 id 号，如

```
https://y.qq.com/n/ryqq/playlist/8476474722
```

|参数|data-id|data-server|data-type|data-fixed|data-autoplay|
|:-:|:-:|:-:|:-:|:-:|:-:|
|解释|song id / playlist id / album id / search keyword|music platform: netease, tencent, kugou, xiami, baidu|song, playlist, album, search, artist|enable fixed mode|audio autoplay|

在 _config.butterfly.yml 文件的 inject 的 bottom 导入

```yml
- <div class="aplayer no-destroy" data-id="8476474722" data-server="tencent" data-type="playlist" data-fixed="true" data-autoplay="true"> </div>
```

注：歌单中不要有 vip 音乐，如果你想切换页面时，音乐不会中断。请把主题配置文件的 pjax 设为 true。如果使用 Pjax，则在 class 里需添加 no-destroy，这样防止切换页面时 Aplayer 被销毁

```yaml
# Pjax
# It may contain bugs and unstable, give feedback when you find the bugs.
# https://github.com/MoOx/pjax
pjax:
  enable: true
  exclude:
    # - xxxx
    # - xxxx
```

5. 创建页面

```shell
hexo n page "music"
```

6. MeingJS 支持（3.0 新功能）

```markdown
<!-- 简单示例 (id, server, type)  -->
{% meting "60198" "netease" "playlist" %}

<!-- 进阶示例 -->
{% meting "60198" "netease" "playlist" "autoplay" "mutex:false" "listmaxheight:340px" "preload:none" "theme:#ad7a86"%}
```

| 选项          | 默认值     | 描述                                                        |
| ------------- | ---------- | ----------------------------------------------------------- |
| id            | **必须值** | 歌曲 id / 播放列表 id / 相册 id / 搜索关键字                |
| server        | **必须值** | 音乐平台: `netease`, `tencent`, `kugou`, `xiami`, `baidu`   |
| type          | **必须值** | `song`, `playlist`, `album`, `search`, `artist`             |
| fixed         | `false`    | 开启固定模式                                                |
| mini          | `false`    | 开启迷你模式                                                |
| loop          | `all`      | 列表循环模式：`all`, `one`,`none`                           |
| order         | `list`     | 列表播放模式： `list`, `random`                             |
| volume        | 0.7        | 播放器音量                                                  |
| lrctype       | 0          | 歌词格式类型                                                |
| listfolded    | `false`    | 指定音乐播放列表是否折叠                                    |
| storagename   | `metingjs` | LocalStorage 中存储播放器设定的键名                         |
| autoplay      | `true`     | 自动播放，移动端浏览器暂时不支持此功能                      |
| mutex         | `true`     | 该选项开启时，如果同页面有其他 aplayer 播放，该播放器会暂停 |
| listmaxheight | `340px`    | 播放列表的最大长度                                          |
| preload       | `auto`     | 音乐文件预载入模式，可选项： `none`, `metadata`, `auto`     |
| theme         | `#ad7a86`  | 播放器风格色彩设置                                          |

7. 修改 blog/source/music/index.md 内容为

```markdown
---
title: Music
date: 2022-05-16 11:50:58
type: "music"
top_img: https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main/blogs/pictures/20220513171354.png
---

{% meting "8476474722" "tencent" "playlist" "theme:#3F51B5" "mutex:true" "preload:auto" %}
```

#### 说说

1. 在 blog 目录下安装插件

```shell
npm install hexo-butterfly-artitalk
```

2. 配置数据库

   参考[官方配置教程](https://artitalk.js.org/doc.html#%F0%9F%8C%88-leancloud-%E7%9A%84%E7%9B%B8%E5%85%B3%E5%87%86%E5%A4%87)

   {% span green, 建议使用国际版的 LeanCloud %}

   因为国际版的 LeanCloud 不需要配置 serverurl，所以推荐使用国际版，速度没有区别，如果使用国内版的 LeanCloud 别忘了填写 serverurl 即可。

```
1. 前往 [LeanCloud国际版](https://leancloud.app/) ，注册账号。
2. 注册完成之后根据 LeanCloud 的提示绑定手机号和邮箱。
3. 绑定完成之后点击创建应用，应用名称随意，接着在结构化数据中创建 class，命名为 shuoshuo。
4. 在你新建的应用中，内建账号 > 用户管理 > 添加用户。点击添加用户，输入想用的用户名及密码。
5. 回到结构化数据中，点击 class 下的 shuoshuo。找到权限，在 Class 访问权限中将 add_fields 以及 create 权限设置为指定用户，输入你刚才输入的用户名会自动匹配。为了安全起见，将 delete 和 update 也设置为跟它们一样的权限。
6. 然后新建一个名为 atComment 的 class，权限什么的使用默认的即可。
7. 点击 class 下的 _User 添加列，列名称为 img，默认值填上你这个账号想要用的发布说说的头像 url，这一项不进行配置，说说头像会显示为默认头像 —— Artitalk 的 logo。
8. 在最菜单栏中找到设置-> 应用 keys，记下来 AppID 和 AppKey ，一会会用。
9. 最后将 _User 中的权限全部调为指定用户，或者数据创建者，为了保证不被篡改用户数据以达到强制发布说说。
```

3. 在 _config.butterfly.yml 文件中添加

```yaml
# Artitalk
# see https://artitalk.js.org/
artitalk:
  enable: true
  appId: #LeanCloud 创建的应用中的 AppID
  appKey: #LeanCloud 创建的应用中的 AppKEY
  path:
  js:
  option:
  front_matter:
```

4. 在 _config.butterfly.yml 文件中的 menu 处添加

```yaml
ShuoShuo: /artitalk/ || fas fa-comment
```

5. 创建页面

```yaml
hexo new page "artitalk"
```

6. 在 blog/source/artitalk/index.md 文件中写入下面内容 

```markdown
---
title: artitalk
date: 2022-05-16 14:15:40
type: 'artitalk'
top_img: https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main/blogs/pictures/20220513171423.png
---

<!-- 引用 artitalk -->
<script type="text/javascript" src="https://unpkg.com/artitalk"></script>
<!-- 存放说说的容器 -->
<div id="artitalk_main"></div>
<script>
new Artitalk({
    appId: '', // Your LeanCloud appId
    appKey: '' // Your LeanCloud appKey
})
</script>
```

7. 因为 Artitalk 对 Pjax 的支持不友善，如果使用 Valine 评论的话，请把说说页面添加到主题配置文件中的 Pjax 的 exclude 去，不然会引起 Artitalk 和 Valine 都加载出错。修改 _config.butterfly.yml 文件

```yaml
pjax:
  enable: true
  exclude:
    - /artitalk/
```

8. 成功页面

![](https://cos.luyf-lemon-love.space/images/20220516145612.png)

![](https://cos.luyf-lemon-love.space/images/20220516145910.png)

#### hexo-filter-nofollow

自动向所有外部链接添加 nofollow 属性。

hexo-filter-nofollow添加到所有外部链接，以确保安全，隐私和SEO。

```shell
npm i hexo-filter-nofollow --save
```

在 _config.yml 文件中配置

```yaml
nofollow:
  enable: true
  field: site
  exclude:
    - 'exclude1.com'
    - 'exclude2.com'
```

#### jsdelivr 刷新缓存

```
https://cdn.jsdelivr.net/...
```

换成

```
https://purge.jsdelivr.net/...
```

#### 图片懒加载

注：图片的懒加载可能导致图片加载不出来。

配置 _config.butterfly.yml 文件

```yaml
# Lazyload (圖片懶加載)
# https://github.com/verlok/vanilla-lazyload
lazyload:
  enable: true
  field: site # site/post
  placeholder:
  blur: false
```

### Github 和 Gitee 分流

#### 设置 Gitee 的 SSH 公钥

1. 首先登录 [Gitee](https://gitee.com)

2. 进入设置页面

3. 点击 SSH 公钥

4. 将 Github 的 id_rsa.pub 粘贴到公钥区域，标题随便填，点击确定

验证

```shell
ssh -T git@github.com
ssh -T git@gitee.com
```

#### 部署到 Gitee 

1. 创建仓库 LuYF-Lemon-love，路径是 用户名（如：LuYF-Lemon-love）

2. 修改 _config.yml 文件 Deployment 部分为

```yaml
# Deployment
## Docs: https://hexo.io/docs/one-command-deployment
deploy:
  type: git
  repo: 
    github: git@github.com:LuYF-Lemon-love/LuYF-Lemon-love.github.io.git
    gitee: git@gitee.com:LuYF-Lemon-love/LuYF-Lemon-love.git
  branch: master
```

3. 部署到 Github 和 Gitee 上

```shell
hexo cl
hexo g
hexo d
```

4. 点击 LuYF-Lemon-love.gitee.io 仓库主页的管理按钮

5. 点击开源，点击保存

6. 进入到仓库中，选择服务下拉框中的Gitee Pages选项，进入后点击部署，勾选 强制使用 HTTPS。

注：审核时需要身份证，并且需要至少一天时间。每次重新部署代码到gitee时，都需要点击下方的更新按钮重启page服务。

7. 登录： https://luyf-lemon-love.gitee.io 访问

### Github 和 Coding 分流

1. 登录[Coding](https://coding.net/)

2. 创建项目 LuYF-Lemon-love

3. 点击 代码仓库，创建名为 LuYF-Lemon-love 的公有仓库

4. 复制 ssh 链接地址，`git@e.coding.net:luyanfeng-nlp/luyf-lemon-love/LuYF-Lemon-love.git`

5. 点击快速初始化仓库

6. 配置 _config.yml 文件

```yaml
# Deployment
## Docs: https://hexo.io/docs/one-command-deployment
deploy:
  type: git
  repo: 
    github: git@github.com:LuYF-Lemon-love/LuYF-Lemon-love.github.io.git
    gitee: git@gitee.com:LuYF-Lemon-love/LuYF-Lemon-love.git
    coding: git@e.coding.net:luyanfeng-nlp/luyf-lemon-love/LuYF-Lemon-love.git
  branch: master
```

7. 点击个人账号设置，点击 SSH 公钥，添加 Github 的公钥

验证

```shell
ssh -T git@e.coding.net
```

8. 部署

```shell
hexo cl
hexo g
hexo d
```

注：coding 已经于 2021 年 12 月 30 日起关闭网站托管服务。

### 腾讯云部署

#### 轻量云服务器配置

1. 登录[腾讯云官网](https://cloud.tencent.com/)

2. 选择轻量应用服务器，购买时可以看看有没有合适的活动,操作系统选择宝塔Linux面板 7.8.0 腾讯云专享版

轻量应用服务器（TencentCloud Lighthouse）是新一代开箱即用、面向轻量应用场景的云服务器产品，助力中小企业和开发者便捷高效的在云端构建网站、Web应用、小程序/小游戏、APP、电商应用、云盘/图床和各类开发测试环境，相比普通云服务器更加简单易用且更贴近应用，以套餐形式整体售卖基础云资源并提供高带宽流量包，将热门开源软件融合打包实现一键构建应用，提供极简上云体验。

3. 登录 轻量应用服务器控制台 后，选择实例卡片右上角的更多 > 重置密码。

4. 使用密码登录 轻量应用服务器控制台

```shell
ssh <username>@<IP address or domain name>

#例子
ssh root@43.142.31.247
```

5. 创建密钥

```
1. 登录轻量应用服务器控制台，并单击左侧导航栏中的 密钥。
2. 在密钥列表页面，单击创建密钥。
3. 在弹出的“创建SSH密钥”窗口中，设置密钥的所属地域，选择密钥的创建方式，单击确定。

注：创建完成后将自动下载私钥，腾讯云不会保管您的私钥信息，请在10分钟内下载和获取私钥。密钥仅有一次下载机会，请您妥善保管。
```

6. 密钥绑定/解绑实例

```
1. 登录 轻量应用服务器控制台。
2. 在左侧导航栏中，单击密钥列表。
3. 在密钥列表页面，选择需要绑定/解绑实例的 SSH 密钥，单击绑定/解绑实例。
4. 在弹出的绑定/解绑实例窗口中，勾选需绑定/解绑的 Linux 实例，单击确定。
5. 为提高轻量应用服务器实例的安全性，Linux 实例绑定密钥后，会默认会禁止通过密码登录 root 用户。如您仍需保留密码登录方式，可参考 修改 SSH 进行修改。
```

7. 使用密钥登录

```shell
chmod 400 <已下载的与实例关联的私钥的绝对路径>

ssh -i <已下载的与实例关联的私钥文件的路径> <username>@<IP address or domain name>

#例子
chmod 400 ssh 
ssh -i ssh root@43.142.31.247
```

#### Hexo部署至轻量应用服务器的宝塔面板

1. 登录服务器后输入下面命令，记住宝塔面板地址，用户名和密码（面板地址访问需要控制面板的防火墙处开放8888端口）

```shell
sudo /etc/init.d/bt default
```

2. 登录宝塔面板，傻瓜式配置完成。注：选择 lnmp，不要选择 lamp

3. 登录 轻量应用服务器，运行下面命令

```shell
sudo su root

yum install git

adduser git
chmod 740 /etc/sudoers

vim /etc/sudoers
```

按i键进入编辑模式，找到root ALL=(ALL) ALL，在其下方加入：

```vim
git     ALL=(ALL)       ALL
```

```shell
chmod 400 /etc/sudoers
sudo passwd git
su git
mkdir ~/.ssh
vim ~/.ssh/authorized_keys
```

进入编辑模式，把之前 Github 的id_rsa.pub文件中的公钥粘贴进去，按esc后，输入:wq保存。(注意!!! 最后一行要加回车)

```shell
chmod 600 /home/git/.ssh/authorized_keys
chmod 700 /home/git/.ssh

# 本地测试
ssh -v git@服务器ip地址或域名

#例子
ssh -v git@43.142.31.247

sudo su root

mkdir /www/wwwroot/repo
chown -R git:git /www/wwwroot/repo
chmod -R 755 /www/wwwroot/repo

mkdir /www/wwwroot/hexo
chown -R git:git /www/wwwroot/hexo
chmod -R 755 /www/wwwroot/hexo

cd /www/wwwroot/repo/
git init --bare hexo.git
vim /www/wwwroot/repo/hexo.git/hooks/post-receive
```

按i进入编辑模式，添加下面的代码，按esc输入:wq 保存

```vim
#!/bin/bash
git --work-tree=/www/wwwroot/hexo --git-dir=/www/wwwroot/repo/hexo.git checkout -f
```

```shell
chown -R git:git /www/wwwroot/repo/hexo.git/hooks/post-receive
chmod +x /www/wwwroot/repo/hexo.git/hooks/post-receive
```

4. 宝塔面板配置

```
1. 登录宝塔面板

2. 点击网站，然后添加一个 PHP 项目的站点

3. 域名填写：本服务器的IP 地址或者 域名，根目录：/www/wwwroot/hexo，其他的默认，点击提交
```

5. 配置博客的 _config.yml 文件

```yaml
deploy:
  type: git
  repo: git@服务器ip或域名:/www/wwwroot/repo/hexo.git
  branch: master

#例子
# Deployment
## Docs: https://hexo.io/docs/one-command-deployment
deploy:
  type: git
  repo: 
    github: git@github.com:LuYF-Lemon-love/LuYF-Lemon-love.github.io.git
    gitee: git@gitee.com:LuYF-Lemon-love/LuYF-Lemon-love.git
    coding: git@e.coding.net:luyanfeng-nlp/luyf-lemon-love/LuYF-Lemon-love.git
    baota: git@43.142.31.247:/www/wwwroot/repo/hexo.git
  branch: master
```

```shell
hexo cl
hexo g
hexo d
```

6. 如果报错，请删除/www/wwwroot/hexo下的所有文件. 包括.user.ini(需要通过宝塔面板的文件页面删除)

```shell
# 注意通过宝塔面板的文件页面删除 .user.ini文件
rm /www/wwwroot/hexo/*

chown -R git:git /www/wwwroot/repo
chmod -R 755 /www/wwwroot/repo

chown -R git:git /www/wwwroot/hexo
chmod -R 755 /www/wwwroot/hexo
```

### Bilibili 页面

#### 获取 Bilibili 图标

1. 注册登录 [iconfont](https://www.iconfont.cn/)

2. 添加图标到购物车

3. 点击购物车，将图标添加进项目，如果没有项目点击下面的按钮，新建一个项目

4. 点击 Font class 和 View the Online Link

6. 将显示的链接补全成 css，然后添加到 _config.butterfly.yml 文件的 inject 的 head 处

7. 可以在 _config.butterfly.yml 文件的 menu 处引用，引用的格式为 `iconfont icon名字`，如 iconfont icon-bilibili

#### 新建 Bilibili 主页

```shell
hexo n page "bilibili"
```

修改 blog/source/bilibili/index.md 文件为：

```markdown
---
title: Bilibili
date: 2022-05-18 18:22:09
type: "bilibili"
top_img: https://cdn.jsdelivr.net/gh/LuYF-Lemon-love/PicBed@main/blogs/pictures/20220513171931.png
---

### 斗破苍穹

{% raw %}
<div style="position: relative; width: 100%; height: 0; padding-bottom: 75%;">
<iframe src="//player.bilibili.com/player.html?aid=209733780&bvid=BV17a411r7AV&cid=462112443&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" style="position: absolute; width: 100%; height: 100%; Left: 0; top: 0;" ></iframe>
</div>
{% endraw %}
```

注：注意上面视频的 style，否则 Bilibili 窗口非常小。

### 去掉对 jsDelivr 引用

[jsDelivr](https://www.jsdelivr.com/) 是一个快速、可靠、自动化和开源的免费 CDN。支持 cdnjs 和 Github 内容直接加速引用。大到各种门户网站，小到个人博客，乃至去广告规则订阅、图床、插件静态库等等种种衍生场景，都能见到它的身影。

2021 年 12 月 20 日 , jsDelivr 的中国大陆的 CDN 被关闭，几个小时后 ICP 备案号被注销。2022 年 4 月 28 日 和 2022 年 5 月 17 日 遭到 DNS 污染，无法使用。

由于之前很多对 Butterfly 魔改时建立在引用 jsDelivr 的基础上，因此我们需要去掉对 jsDelivr 引用，防止博客访问异常。

#### 初级页脚看板娘

由于我们已经应用了进阶版的页脚看板娘，因此可以直接在 _config.butterfly.yml 文件中去掉对初级页脚看板娘的引用。

```diff
# Inject
# Insert the code to head (before '</head>' tag) and the bottom (before '</body>' tag)
# 插入代码到头部 </head> 之前 和 底部 </body> 之前
inject:
   head:
-     - <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css">
   bottom:
-     - <script defer src="https://cdn.jsdelivr.net/gh/stevenjoezhang/live2d-widget@latest/autoload.js"></script> # 页脚看板娘
```

#### 页脚养鱼

1. 在浏览器中输入下面的链接 `https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js`，获得 jquery.min.js 文件中的内容，在 blog/themes/butterfly/source/js 目录下创建 jquery.min.js 文件，并写入上面在浏览器中获得的内容。

```js
/*! jQuery v3.4.1 | (c) JS Foundation and other contributors | jquery.org/license */
!function(e,t){"use strict";"object"==typeof module&&"object"==typeof module.exports?module.exports=e.document?t(e,!0):function(e){if(!e.document)throw new Error("jQuery requires a window with a document");return t(e)}:t(e)}("undefined"!=typeof window?window:this,function(C,e){"use strict";var t=[],E=C.document,r=Object.getPrototypeOf,s=t.slice,g=t.concat,u=t.push,i=t.indexOf,n={},o=n.toString,v=n.hasOwnProperty,a=v.toString,l=a.call(Object),y={},m=function(e){return"function"==typeof e&&"number"!=typeof e.nodeType},x=function(e){return null!=e&&e===e.window},c={type:!0,src:!0,nonce:!0,noModule:!0};function b(e,t,n){var r,i,o=(n=n||E).createElement("script");if(o.text=e,t)for(r in c)(i=t[r]||t.getAttribute&&t.getAttribute(r))&&o.setAttribute(r,i);n.head.appendChild(o).parentNode.removeChild(o)}function w(e){return null==e?e+"":"object"==typeof e||"function"==typeof e?n[o.call(e)]||"object":typeof e}var f="3.4.1",k=function(e,t){return new k.fn.init(e,t)},p=/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;function d(e){var t=!!e&&"length"in e&&e.length,n=w(e);return!m(e)&&!x(e)&&("array"===n||0===t||"number"==typeof t&&0<t&&t-1 in e)}k.fn=k.prototype={jquery:f,constructor:k,length:0,toArray:function(){return s.call(this)},get:function(e){return null==e?s.call(this):e<0?this[e+this.length]:this[e]},pushStack:function(e){var t=k.merge(this.constructor(),e);return t.prevObject=this,t},each:function(e){return k.each(this,e)},map:function(n){return this.pushStack(k.map(this,function(e,t){return n.call(e,t,e)}))},slice:function(){return this.pushStack(s.apply(this,arguments))},first:function(){return this.eq(0)},last:function(){return this.eq(-1)},eq:function(e){var t=this.length,n=+e+(e<0?t:0);return this.pushStack(0<=n&&n<t?[this[n]]:[])},end:function(){return this.prevObject||this.constructor()},push:u,sort:t.sort,splice:t.splice},k.extend=k.fn.extend=function(){var e,t,n,r,i,o,a=arguments[0]||{},s=1,u=arguments.length,l=!1;for("boolean"==typeof a&&(l=a,a=arguments[s]||{},s++),"object"==typeof a||m(a)||(a={}),s===u&&(a=this,s--);s<u;s++)if(null!=(e=arguments[s]))for(t in e)r=e[t],"__proto__"!==t&&a!==r&&(l&&r&&(k.isPlainObject(r)||(i=Array.isArray(r)))?(n=a[t],o=i&&!Array.isArray(n)?[]:i||k.isPlainObject(n)?n:{},i=!1,a[t]=k.extend(l,o,r)):void 0!==r&&(a[t]=r));return a},k.extend({expando:"jQuery"+(f+Math.random()).replace(/\D/g,""),isReady:!0,error:function(e){throw new Error(e)},noop:function(){},isPlainObject:function(e){var t,n;return!(!e||"[object Object]"!==o.call(e))&&(!(t=r(e))||"function"==typeof(n=v.call(t,"constructor")&&t.constructor)&&a.call(n)===l)},isEmptyObject:function(e){var t;for(t in e)return!1;return!0},globalEval:function(e,t){b(e,{nonce:t&&t.nonce})},each:function(e,t){var n,r=0;if(d(e)){for(n=e.length;r<n;r++)if(!1===t.call(e[r],r,e[r]))break}else for(r in e)if(!1===t.call(e[r],r,e[r]))break;return e},trim:function(e){return null==e?"":(e+"").replace(p,"")},makeArray:function(e,t){var n=t||[];return null!=e&&(d(Object(e))?k.merge(n,"string"==typeof e?[e]:e):u.call(n,e)),n},inArray:function(e,t,n){return null==t?-1:i.call(t,e,n)},merge:function(e,t){for(var n=+t.length,r=0,i=e.length;r<n;r++)e[i++]=t[r];return e.length=i,e},grep:function(e,t,n){for(var r=[],i=0,o=e.length,a=!n;i<o;i++)!t(e[i],i)!==a&&r.push(e[i]);return r},map:function(e,t,n){var r,i,o=0,a=[];if(d(e))for(r=e.length;o<r;o++)null!=(i=t(e[o],o,n))&&a.push(i);else for(o in e)null!=(i=t(e[o],o,n))&&a.push(i);return g.apply([],a)},guid:1,support:y}),"function"==typeof Symbol&&(k.fn[Symbol.iterator]=t[Symbol.iterator]),k.each("Boolean Number String Function Array Date RegExp Object Error Symbol".split(" "),function(e,t){n["[object "+t+"]"]=t.toLowerCase()});var h=function(n){var e,d,b,o,i,h,f,g,w,u,l,T,C,a,E,v,s,c,y,k="sizzle"+1*new Date,m=n.document,S=0,r=0,p=ue(),x=ue(),N=ue(),A=ue(),D=function(e,t){return e===t&&(l=!0),0},j={}.hasOwnProperty,t=[],q=t.pop,L=t.push,H=t.push,O=t.slice,P=function(e,t){for(var n=0,r=e.length;n<r;n++)if(e[n]===t)return n;return-1},R="checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped",M="[\\x20\\t\\r\\n\\f]",I="(?:\\\\.|[\\w-]|[^\0-\\xa0])+",W="\\["+M+"*("+I+")(?:"+M+"*([*^$|!~]?=)"+M+"*(?:'((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\"|("+I+"))|)"+M+"*\\]",$=":("+I+")(?:\\((('((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\")|((?:\\\\.|[^\\\\()[\\]]|"+W+")*)|.*)\\)|)",F=new RegExp(M+"+","g"),B=new RegExp("^"+M+"+|((?:^|[^\\\\])(?:\\\\.)*)"+M+"+$","g"),_=new RegExp("^"+M+"*,"+M+"*"),z=new RegExp("^"+M+"*([>+~]|"+M+")"+M+"*"),U=new RegExp(M+"|>"),X=new RegExp($),V=new RegExp("^"+I+"$"),G={ID:new RegExp("^#("+I+")"),CLASS:new RegExp("^\\.("+I+")"),TAG:new RegExp("^("+I+"|[*])"),ATTR:new RegExp("^"+W),PSEUDO:new RegExp("^"+$),CHILD:new RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\("+M+"*(even|odd|(([+-]|)(\\d*)n|)"+M+"*(?:([+-]|)"+M+"*(\\d+)|))"+M+"*\\)|)","i"),bool:new RegExp("^(?:"+R+")$","i"),needsContext:new RegExp("^"+M+"*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\("+M+"*((?:-\\d)?\\d*)"+M+"*\\)|)(?=[^-]|$)","i")},Y=/HTML$/i,Q=/^(?:input|select|textarea|button)$/i,J=/^h\d$/i,K=/^[^{]+\{\s*\[native \w/,Z=/^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/,ee=/[+~]/,te=new RegExp("\\\\([\\da-f]{1,6}"+M+"?|("+M+")|.)","ig"),ne=function(e,t,n){var r="0x"+t-65536;return r!=r||n?t:r<0?String.fromCharCode(r+65536):String.fromCharCode(r>>10|55296,1023&r|56320)},re=/([\0-\x1f\x7f]|^-?\d)|^-$|[^\0-\x1f\x7f-\uFFFF\w-]/g,ie=function(e,t){return t?"\0"===e?"\ufffd":e.slice(0,-1)+"\\"+e.charCodeAt(e.length-1).toString(16)+" ":"\\"+e},oe=function(){T()},ae=be(function(e){return!0===e.disabled&&"fieldset"===e.nodeName.toLowerCase()},{dir:"parentNode",next:"legend"});try{H.apply(t=O.call(m.childNodes),m.childNodes),t[m.childNodes.length].nodeType}catch(e){H={apply:t.length?function(e,t){L.apply(e,O.call(t))}:function(e,t){var n=e.length,r=0;while(e[n++]=t[r++]);e.length=n-1}}}function se(t,e,n,r){var i,o,a,s,u,l,c,f=e&&e.ownerDocument,p=e?e.nodeType:9;if(n=n||[],"string"!=typeof t||!t||1!==p&&9!==p&&11!==p)return n;if(!r&&((e?e.ownerDocument||e:m)!==C&&T(e),e=e||C,E)){if(11!==p&&(u=Z.exec(t)))if(i=u[1]){if(9===p){if(!(a=e.getElementById(i)))return n;if(a.id===i)return n.push(a),n}else if(f&&(a=f.getElementById(i))&&y(e,a)&&a.id===i)return n.push(a),n}else{if(u[2])return H.apply(n,e.getElementsByTagName(t)),n;if((i=u[3])&&d.getElementsByClassName&&e.getElementsByClassName)return H.apply(n,e.getElementsByClassName(i)),n}if(d.qsa&&!A[t+" "]&&(!v||!v.test(t))&&(1!==p||"object"!==e.nodeName.toLowerCase())){if(c=t,f=e,1===p&&U.test(t)){(s=e.getAttribute("id"))?s=s.replace(re,ie):e.setAttribute("id",s=k),o=(l=h(t)).length;while(o--)l[o]="#"+s+" "+xe(l[o]);c=l.join(","),f=ee.test(t)&&ye(e.parentNode)||e}try{return H.apply(n,f.querySelectorAll(c)),n}catch(e){A(t,!0)}finally{s===k&&e.removeAttribute("id")}}}return g(t.replace(B,"$1"),e,n,r)}function ue(){var r=[];return function e(t,n){return r.push(t+" ")>b.cacheLength&&delete e[r.shift()],e[t+" "]=n}}function le(e){return e[k]=!0,e}function ce(e){var t=C.createElement("fieldset");try{return!!e(t)}catch(e){return!1}finally{t.parentNode&&t.parentNode.removeChild(t),t=null}}function fe(e,t){var n=e.split("|"),r=n.length;while(r--)b.attrHandle[n[r]]=t}function pe(e,t){var n=t&&e,r=n&&1===e.nodeType&&1===t.nodeType&&e.sourceIndex-t.sourceIndex;if(r)return r;if(n)while(n=n.nextSibling)if(n===t)return-1;return e?1:-1}function de(t){return function(e){return"input"===e.nodeName.toLowerCase()&&e.type===t}}function he(n){return function(e){var t=e.nodeName.toLowerCase();return("input"===t||"button"===t)&&e.type===n}}function ge(t){return function(e){return"form"in e?e.parentNode&&!1===e.disabled?"label"in e?"label"in e.parentNode?e.parentNode.disabled===t:e.disabled===t:e.isDisabled===t||e.isDisabled!==!t&&ae(e)===t:e.disabled===t:"label"in e&&e.disabled===t}}function ve(a){return le(function(o){return o=+o,le(function(e,t){var n,r=a([],e.length,o),i=r.length;while(i--)e[n=r[i]]&&(e[n]=!(t[n]=e[n]))})})}function ye(e){return e&&"undefined"!=typeof e.getElementsByTagName&&e}for(e in d=se.support={},i=se.isXML=function(e){var t=e.namespaceURI,n=(e.ownerDocument||e).documentElement;return!Y.test(t||n&&n.nodeName||"HTML")},T=se.setDocument=function(e){var t,n,r=e?e.ownerDocument||e:m;return r!==C&&9===r.nodeType&&r.documentElement&&(a=(C=r).documentElement,E=!i(C),m!==C&&(n=C.defaultView)&&n.top!==n&&(n.addEventListener?n.addEventListener("unload",oe,!1):n.attachEvent&&n.attachEvent("onunload",oe)),d.attributes=ce(function(e){return e.className="i",!e.getAttribute("className")}),d.getElementsByTagName=ce(function(e){return e.appendChild(C.createComment("")),!e.getElementsByTagName("*").length}),d.getElementsByClassName=K.test(C.getElementsByClassName),d.getById=ce(function(e){return a.appendChild(e).id=k,!C.getElementsByName||!C.getElementsByName(k).length}),d.getById?(b.filter.ID=function(e){var t=e.replace(te,ne);return function(e){return e.getAttribute("id")===t}},b.find.ID=function(e,t){if("undefined"!=typeof t.getElementById&&E){var n=t.getElementById(e);return n?[n]:[]}}):(b.filter.ID=function(e){var n=e.replace(te,ne);return function(e){var t="undefined"!=typeof e.getAttributeNode&&e.getAttributeNode("id");return t&&t.value===n}},b.find.ID=function(e,t){if("undefined"!=typeof t.getElementById&&E){var n,r,i,o=t.getElementById(e);if(o){if((n=o.getAttributeNode("id"))&&n.value===e)return[o];i=t.getElementsByName(e),r=0;while(o=i[r++])if((n=o.getAttributeNode("id"))&&n.value===e)return[o]}return[]}}),b.find.TAG=d.getElementsByTagName?function(e,t){return"undefined"!=typeof t.getElementsByTagName?t.getElementsByTagName(e):d.qsa?t.querySelectorAll(e):void 0}:function(e,t){var n,r=[],i=0,o=t.getElementsByTagName(e);if("*"===e){while(n=o[i++])1===n.nodeType&&r.push(n);return r}return o},b.find.CLASS=d.getElementsByClassName&&function(e,t){if("undefined"!=typeof t.getElementsByClassName&&E)return t.getElementsByClassName(e)},s=[],v=[],(d.qsa=K.test(C.querySelectorAll))&&(ce(function(e){a.appendChild(e).innerHTML="<a id='"+k+"'></a><select id='"+k+"-\r\\' msallowcapture=''><option selected=''></option></select>",e.querySelectorAll("[msallowcapture^='']").length&&v.push("[*^$]="+M+"*(?:''|\"\")"),e.querySelectorAll("[selected]").length||v.push("\\["+M+"*(?:value|"+R+")"),e.querySelectorAll("[id~="+k+"-]").length||v.push("~="),e.querySelectorAll(":checked").length||v.push(":checked"),e.querySelectorAll("a#"+k+"+*").length||v.push(".#.+[+~]")}),ce(function(e){e.innerHTML="<a href='' disabled='disabled'></a><select disabled='disabled'><option/></select>";var t=C.createElement("input");t.setAttribute("type","hidden"),e.appendChild(t).setAttribute("name","D"),e.querySelectorAll("[name=d]").length&&v.push("name"+M+"*[*^$|!~]?="),2!==e.querySelectorAll(":enabled").length&&v.push(":enabled",":disabled"),a.appendChild(e).disabled=!0,2!==e.querySelectorAll(":disabled").length&&v.push(":enabled",":disabled"),e.querySelectorAll("*,:x"),v.push(",.*:")})),(d.matchesSelector=K.test(c=a.matches||a.webkitMatchesSelector||a.mozMatchesSelector||a.oMatchesSelector||a.msMatchesSelector))&&ce(function(e){d.disconnectedMatch=c.call(e,"*"),c.call(e,"[s!='']:x"),s.push("!=",$)}),v=v.length&&new RegExp(v.join("|")),s=s.length&&new RegExp(s.join("|")),t=K.test(a.compareDocumentPosition),y=t||K.test(a.contains)?function(e,t){var n=9===e.nodeType?e.documentElement:e,r=t&&t.parentNode;return e===r||!(!r||1!==r.nodeType||!(n.contains?n.contains(r):e.compareDocumentPosition&&16&e.compareDocumentPosition(r)))}:function(e,t){if(t)while(t=t.parentNode)if(t===e)return!0;return!1},D=t?function(e,t){if(e===t)return l=!0,0;var n=!e.compareDocumentPosition-!t.compareDocumentPosition;return n||(1&(n=(e.ownerDocument||e)===(t.ownerDocument||t)?e.compareDocumentPosition(t):1)||!d.sortDetached&&t.compareDocumentPosition(e)===n?e===C||e.ownerDocument===m&&y(m,e)?-1:t===C||t.ownerDocument===m&&y(m,t)?1:u?P(u,e)-P(u,t):0:4&n?-1:1)}:function(e,t){if(e===t)return l=!0,0;var n,r=0,i=e.parentNode,o=t.parentNode,a=[e],s=[t];if(!i||!o)return e===C?-1:t===C?1:i?-1:o?1:u?P(u,e)-P(u,t):0;if(i===o)return pe(e,t);n=e;while(n=n.parentNode)a.unshift(n);n=t;while(n=n.parentNode)s.unshift(n);while(a[r]===s[r])r++;return r?pe(a[r],s[r]):a[r]===m?-1:s[r]===m?1:0}),C},se.matches=function(e,t){return se(e,null,null,t)},se.matchesSelector=function(e,t){if((e.ownerDocument||e)!==C&&T(e),d.matchesSelector&&E&&!A[t+" "]&&(!s||!s.test(t))&&(!v||!v.test(t)))try{var n=c.call(e,t);if(n||d.disconnectedMatch||e.document&&11!==e.document.nodeType)return n}catch(e){A(t,!0)}return 0<se(t,C,null,[e]).length},se.contains=function(e,t){return(e.ownerDocument||e)!==C&&T(e),y(e,t)},se.attr=function(e,t){(e.ownerDocument||e)!==C&&T(e);var n=b.attrHandle[t.toLowerCase()],r=n&&j.call(b.attrHandle,t.toLowerCase())?n(e,t,!E):void 0;return void 0!==r?r:d.attributes||!E?e.getAttribute(t):(r=e.getAttributeNode(t))&&r.specified?r.value:null},se.escape=function(e){return(e+"").replace(re,ie)},se.error=function(e){throw new Error("Syntax error, unrecognized expression: "+e)},se.uniqueSort=function(e){var t,n=[],r=0,i=0;if(l=!d.detectDuplicates,u=!d.sortStable&&e.slice(0),e.sort(D),l){while(t=e[i++])t===e[i]&&(r=n.push(i));while(r--)e.splice(n[r],1)}return u=null,e},o=se.getText=function(e){var t,n="",r=0,i=e.nodeType;if(i){if(1===i||9===i||11===i){if("string"==typeof e.textContent)return e.textContent;for(e=e.firstChild;e;e=e.nextSibling)n+=o(e)}else if(3===i||4===i)return e.nodeValue}else while(t=e[r++])n+=o(t);return n},(b=se.selectors={cacheLength:50,createPseudo:le,match:G,attrHandle:{},find:{},relative:{">":{dir:"parentNode",first:!0}," ":{dir:"parentNode"},"+":{dir:"previousSibling",first:!0},"~":{dir:"previousSibling"}},preFilter:{ATTR:function(e){return e[1]=e[1].replace(te,ne),e[3]=(e[3]||e[4]||e[5]||"").replace(te,ne),"~="===e[2]&&(e[3]=" "+e[3]+" "),e.slice(0,4)},CHILD:function(e){return e[1]=e[1].toLowerCase(),"nth"===e[1].slice(0,3)?(e[3]||se.error(e[0]),e[4]=+(e[4]?e[5]+(e[6]||1):2*("even"===e[3]||"odd"===e[3])),e[5]=+(e[7]+e[8]||"odd"===e[3])):e[3]&&se.error(e[0]),e},PSEUDO:function(e){var t,n=!e[6]&&e[2];return G.CHILD.test(e[0])?null:(e[3]?e[2]=e[4]||e[5]||"":n&&X.test(n)&&(t=h(n,!0))&&(t=n.indexOf(")",n.length-t)-n.length)&&(e[0]=e[0].slice(0,t),e[2]=n.slice(0,t)),e.slice(0,3))}},filter:{TAG:function(e){var t=e.replace(te,ne).toLowerCase();return"*"===e?function(){return!0}:function(e){return e.nodeName&&e.nodeName.toLowerCase()===t}},CLASS:function(e){var t=p[e+" "];return t||(t=new RegExp("(^|"+M+")"+e+"("+M+"|$)"))&&p(e,function(e){return t.test("string"==typeof e.className&&e.className||"undefined"!=typeof e.getAttribute&&e.getAttribute("class")||"")})},ATTR:function(n,r,i){return function(e){var t=se.attr(e,n);return null==t?"!="===r:!r||(t+="","="===r?t===i:"!="===r?t!==i:"^="===r?i&&0===t.indexOf(i):"*="===r?i&&-1<t.indexOf(i):"$="===r?i&&t.slice(-i.length)===i:"~="===r?-1<(" "+t.replace(F," ")+" ").indexOf(i):"|="===r&&(t===i||t.slice(0,i.length+1)===i+"-"))}},CHILD:function(h,e,t,g,v){var y="nth"!==h.slice(0,3),m="last"!==h.slice(-4),x="of-type"===e;return 1===g&&0===v?function(e){return!!e.parentNode}:function(e,t,n){var r,i,o,a,s,u,l=y!==m?"nextSibling":"previousSibling",c=e.parentNode,f=x&&e.nodeName.toLowerCase(),p=!n&&!x,d=!1;if(c){if(y){while(l){a=e;while(a=a[l])if(x?a.nodeName.toLowerCase()===f:1===a.nodeType)return!1;u=l="only"===h&&!u&&"nextSibling"}return!0}if(u=[m?c.firstChild:c.lastChild],m&&p){d=(s=(r=(i=(o=(a=c)[k]||(a[k]={}))[a.uniqueID]||(o[a.uniqueID]={}))[h]||[])[0]===S&&r[1])&&r[2],a=s&&c.childNodes[s];while(a=++s&&a&&a[l]||(d=s=0)||u.pop())if(1===a.nodeType&&++d&&a===e){i[h]=[S,s,d];break}}else if(p&&(d=s=(r=(i=(o=(a=e)[k]||(a[k]={}))[a.uniqueID]||(o[a.uniqueID]={}))[h]||[])[0]===S&&r[1]),!1===d)while(a=++s&&a&&a[l]||(d=s=0)||u.pop())if((x?a.nodeName.toLowerCase()===f:1===a.nodeType)&&++d&&(p&&((i=(o=a[k]||(a[k]={}))[a.uniqueID]||(o[a.uniqueID]={}))[h]=[S,d]),a===e))break;return(d-=v)===g||d%g==0&&0<=d/g}}},PSEUDO:function(e,o){var t,a=b.pseudos[e]||b.setFilters[e.toLowerCase()]||se.error("unsupported pseudo: "+e);return a[k]?a(o):1<a.length?(t=[e,e,"",o],b.setFilters.hasOwnProperty(e.toLowerCase())?le(function(e,t){var n,r=a(e,o),i=r.length;while(i--)e[n=P(e,r[i])]=!(t[n]=r[i])}):function(e){return a(e,0,t)}):a}},pseudos:{not:le(function(e){var r=[],i=[],s=f(e.replace(B,"$1"));return s[k]?le(function(e,t,n,r){var i,o=s(e,null,r,[]),a=e.length;while(a--)(i=o[a])&&(e[a]=!(t[a]=i))}):function(e,t,n){return r[0]=e,s(r,null,n,i),r[0]=null,!i.pop()}}),has:le(function(t){return function(e){return 0<se(t,e).length}}),contains:le(function(t){return t=t.replace(te,ne),function(e){return-1<(e.textContent||o(e)).indexOf(t)}}),lang:le(function(n){return V.test(n||"")||se.error("unsupported lang: "+n),n=n.replace(te,ne).toLowerCase(),function(e){var t;do{if(t=E?e.lang:e.getAttribute("xml:lang")||e.getAttribute("lang"))return(t=t.toLowerCase())===n||0===t.indexOf(n+"-")}while((e=e.parentNode)&&1===e.nodeType);return!1}}),target:function(e){var t=n.location&&n.location.hash;return t&&t.slice(1)===e.id},root:function(e){return e===a},focus:function(e){return e===C.activeElement&&(!C.hasFocus||C.hasFocus())&&!!(e.type||e.href||~e.tabIndex)},enabled:ge(!1),disabled:ge(!0),checked:function(e){var t=e.nodeName.toLowerCase();return"input"===t&&!!e.checked||"option"===t&&!!e.selected},selected:function(e){return e.parentNode&&e.parentNode.selectedIndex,!0===e.selected},empty:function(e){for(e=e.firstChild;e;e=e.nextSibling)if(e.nodeType<6)return!1;return!0},parent:function(e){return!b.pseudos.empty(e)},header:function(e){return J.test(e.nodeName)},input:function(e){return Q.test(e.nodeName)},button:function(e){var t=e.nodeName.toLowerCase();return"input"===t&&"button"===e.type||"button"===t},text:function(e){var t;return"input"===e.nodeName.toLowerCase()&&"text"===e.type&&(null==(t=e.getAttribute("type"))||"text"===t.toLowerCase())},first:ve(function(){return[0]}),last:ve(function(e,t){return[t-1]}),eq:ve(function(e,t,n){return[n<0?n+t:n]}),even:ve(function(e,t){for(var n=0;n<t;n+=2)e.push(n);return e}),odd:ve(function(e,t){for(var n=1;n<t;n+=2)e.push(n);return e}),lt:ve(function(e,t,n){for(var r=n<0?n+t:t<n?t:n;0<=--r;)e.push(r);return e}),gt:ve(function(e,t,n){for(var r=n<0?n+t:n;++r<t;)e.push(r);return e})}}).pseudos.nth=b.pseudos.eq,{radio:!0,checkbox:!0,file:!0,password:!0,image:!0})b.pseudos[e]=de(e);for(e in{submit:!0,reset:!0})b.pseudos[e]=he(e);function me(){}function xe(e){for(var t=0,n=e.length,r="";t<n;t++)r+=e[t].value;return r}function be(s,e,t){var u=e.dir,l=e.next,c=l||u,f=t&&"parentNode"===c,p=r++;return e.first?function(e,t,n){while(e=e[u])if(1===e.nodeType||f)return s(e,t,n);return!1}:function(e,t,n){var r,i,o,a=[S,p];if(n){while(e=e[u])if((1===e.nodeType||f)&&s(e,t,n))return!0}else while(e=e[u])if(1===e.nodeType||f)if(i=(o=e[k]||(e[k]={}))[e.uniqueID]||(o[e.uniqueID]={}),l&&l===e.nodeName.toLowerCase())e=e[u]||e;else{if((r=i[c])&&r[0]===S&&r[1]===p)return a[2]=r[2];if((i[c]=a)[2]=s(e,t,n))return!0}return!1}}function we(i){return 1<i.length?function(e,t,n){var r=i.length;while(r--)if(!i[r](e,t,n))return!1;return!0}:i[0]}function Te(e,t,n,r,i){for(var o,a=[],s=0,u=e.length,l=null!=t;s<u;s++)(o=e[s])&&(n&&!n(o,r,i)||(a.push(o),l&&t.push(s)));return a}function Ce(d,h,g,v,y,e){return v&&!v[k]&&(v=Ce(v)),y&&!y[k]&&(y=Ce(y,e)),le(function(e,t,n,r){var i,o,a,s=[],u=[],l=t.length,c=e||function(e,t,n){for(var r=0,i=t.length;r<i;r++)se(e,t[r],n);return n}(h||"*",n.nodeType?[n]:n,[]),f=!d||!e&&h?c:Te(c,s,d,n,r),p=g?y||(e?d:l||v)?[]:t:f;if(g&&g(f,p,n,r),v){i=Te(p,u),v(i,[],n,r),o=i.length;while(o--)(a=i[o])&&(p[u[o]]=!(f[u[o]]=a))}if(e){if(y||d){if(y){i=[],o=p.length;while(o--)(a=p[o])&&i.push(f[o]=a);y(null,p=[],i,r)}o=p.length;while(o--)(a=p[o])&&-1<(i=y?P(e,a):s[o])&&(e[i]=!(t[i]=a))}}else p=Te(p===t?p.splice(l,p.length):p),y?y(null,t,p,r):H.apply(t,p)})}function Ee(e){for(var i,t,n,r=e.length,o=b.relative[e[0].type],a=o||b.relative[" "],s=o?1:0,u=be(function(e){return e===i},a,!0),l=be(function(e){return-1<P(i,e)},a,!0),c=[function(e,t,n){var r=!o&&(n||t!==w)||((i=t).nodeType?u(e,t,n):l(e,t,n));return i=null,r}];s<r;s++)if(t=b.relative[e[s].type])c=[be(we(c),t)];else{if((t=b.filter[e[s].type].apply(null,e[s].matches))[k]){for(n=++s;n<r;n++)if(b.relative[e[n].type])break;return Ce(1<s&&we(c),1<s&&xe(e.slice(0,s-1).concat({value:" "===e[s-2].type?"*":""})).replace(B,"$1"),t,s<n&&Ee(e.slice(s,n)),n<r&&Ee(e=e.slice(n)),n<r&&xe(e))}c.push(t)}return we(c)}return me.prototype=b.filters=b.pseudos,b.setFilters=new me,h=se.tokenize=function(e,t){var n,r,i,o,a,s,u,l=x[e+" "];if(l)return t?0:l.slice(0);a=e,s=[],u=b.preFilter;while(a){for(o in n&&!(r=_.exec(a))||(r&&(a=a.slice(r[0].length)||a),s.push(i=[])),n=!1,(r=z.exec(a))&&(n=r.shift(),i.push({value:n,type:r[0].replace(B," ")}),a=a.slice(n.length)),b.filter)!(r=G[o].exec(a))||u[o]&&!(r=u[o](r))||(n=r.shift(),i.push({value:n,type:o,matches:r}),a=a.slice(n.length));if(!n)break}return t?a.length:a?se.error(e):x(e,s).slice(0)},f=se.compile=function(e,t){var n,v,y,m,x,r,i=[],o=[],a=N[e+" "];if(!a){t||(t=h(e)),n=t.length;while(n--)(a=Ee(t[n]))[k]?i.push(a):o.push(a);(a=N(e,(v=o,m=0<(y=i).length,x=0<v.length,r=function(e,t,n,r,i){var o,a,s,u=0,l="0",c=e&&[],f=[],p=w,d=e||x&&b.find.TAG("*",i),h=S+=null==p?1:Math.random()||.1,g=d.length;for(i&&(w=t===C||t||i);l!==g&&null!=(o=d[l]);l++){if(x&&o){a=0,t||o.ownerDocument===C||(T(o),n=!E);while(s=v[a++])if(s(o,t||C,n)){r.push(o);break}i&&(S=h)}m&&((o=!s&&o)&&u--,e&&c.push(o))}if(u+=l,m&&l!==u){a=0;while(s=y[a++])s(c,f,t,n);if(e){if(0<u)while(l--)c[l]||f[l]||(f[l]=q.call(r));f=Te(f)}H.apply(r,f),i&&!e&&0<f.length&&1<u+y.length&&se.uniqueSort(r)}return i&&(S=h,w=p),c},m?le(r):r))).selector=e}return a},g=se.select=function(e,t,n,r){var i,o,a,s,u,l="function"==typeof e&&e,c=!r&&h(e=l.selector||e);if(n=n||[],1===c.length){if(2<(o=c[0]=c[0].slice(0)).length&&"ID"===(a=o[0]).type&&9===t.nodeType&&E&&b.relative[o[1].type]){if(!(t=(b.find.ID(a.matches[0].replace(te,ne),t)||[])[0]))return n;l&&(t=t.parentNode),e=e.slice(o.shift().value.length)}i=G.needsContext.test(e)?0:o.length;while(i--){if(a=o[i],b.relative[s=a.type])break;if((u=b.find[s])&&(r=u(a.matches[0].replace(te,ne),ee.test(o[0].type)&&ye(t.parentNode)||t))){if(o.splice(i,1),!(e=r.length&&xe(o)))return H.apply(n,r),n;break}}}return(l||f(e,c))(r,t,!E,n,!t||ee.test(e)&&ye(t.parentNode)||t),n},d.sortStable=k.split("").sort(D).join("")===k,d.detectDuplicates=!!l,T(),d.sortDetached=ce(function(e){return 1&e.compareDocumentPosition(C.createElement("fieldset"))}),ce(function(e){return e.innerHTML="<a href='#'></a>","#"===e.firstChild.getAttribute("href")})||fe("type|href|height|width",function(e,t,n){if(!n)return e.getAttribute(t,"type"===t.toLowerCase()?1:2)}),d.attributes&&ce(function(e){return e.innerHTML="<input/>",e.firstChild.setAttribute("value",""),""===e.firstChild.getAttribute("value")})||fe("value",function(e,t,n){if(!n&&"input"===e.nodeName.toLowerCase())return e.defaultValue}),ce(function(e){return null==e.getAttribute("disabled")})||fe(R,function(e,t,n){var r;if(!n)return!0===e[t]?t.toLowerCase():(r=e.getAttributeNode(t))&&r.specified?r.value:null}),se}(C);k.find=h,k.expr=h.selectors,k.expr[":"]=k.expr.pseudos,k.uniqueSort=k.unique=h.uniqueSort,k.text=h.getText,k.isXMLDoc=h.isXML,k.contains=h.contains,k.escapeSelector=h.escape;var T=function(e,t,n){var r=[],i=void 0!==n;while((e=e[t])&&9!==e.nodeType)if(1===e.nodeType){if(i&&k(e).is(n))break;r.push(e)}return r},S=function(e,t){for(var n=[];e;e=e.nextSibling)1===e.nodeType&&e!==t&&n.push(e);return n},N=k.expr.match.needsContext;function A(e,t){return e.nodeName&&e.nodeName.toLowerCase()===t.toLowerCase()}var D=/^<([a-z][^\/\0>:\x20\t\r\n\f]*)[\x20\t\r\n\f]*\/?>(?:<\/\1>|)$/i;function j(e,n,r){return m(n)?k.grep(e,function(e,t){return!!n.call(e,t,e)!==r}):n.nodeType?k.grep(e,function(e){return e===n!==r}):"string"!=typeof n?k.grep(e,function(e){return-1<i.call(n,e)!==r}):k.filter(n,e,r)}k.filter=function(e,t,n){var r=t[0];return n&&(e=":not("+e+")"),1===t.length&&1===r.nodeType?k.find.matchesSelector(r,e)?[r]:[]:k.find.matches(e,k.grep(t,function(e){return 1===e.nodeType}))},k.fn.extend({find:function(e){var t,n,r=this.length,i=this;if("string"!=typeof e)return this.pushStack(k(e).filter(function(){for(t=0;t<r;t++)if(k.contains(i[t],this))return!0}));for(n=this.pushStack([]),t=0;t<r;t++)k.find(e,i[t],n);return 1<r?k.uniqueSort(n):n},filter:function(e){return this.pushStack(j(this,e||[],!1))},not:function(e){return this.pushStack(j(this,e||[],!0))},is:function(e){return!!j(this,"string"==typeof e&&N.test(e)?k(e):e||[],!1).length}});var q,L=/^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]+))$/;(k.fn.init=function(e,t,n){var r,i;if(!e)return this;if(n=n||q,"string"==typeof e){if(!(r="<"===e[0]&&">"===e[e.length-1]&&3<=e.length?[null,e,null]:L.exec(e))||!r[1]&&t)return!t||t.jquery?(t||n).find(e):this.constructor(t).find(e);if(r[1]){if(t=t instanceof k?t[0]:t,k.merge(this,k.parseHTML(r[1],t&&t.nodeType?t.ownerDocument||t:E,!0)),D.test(r[1])&&k.isPlainObject(t))for(r in t)m(this[r])?this[r](t[r]):this.attr(r,t[r]);return this}return(i=E.getElementById(r[2]))&&(this[0]=i,this.length=1),this}return e.nodeType?(this[0]=e,this.length=1,this):m(e)?void 0!==n.ready?n.ready(e):e(k):k.makeArray(e,this)}).prototype=k.fn,q=k(E);var H=/^(?:parents|prev(?:Until|All))/,O={children:!0,contents:!0,next:!0,prev:!0};function P(e,t){while((e=e[t])&&1!==e.nodeType);return e}k.fn.extend({has:function(e){var t=k(e,this),n=t.length;return this.filter(function(){for(var e=0;e<n;e++)if(k.contains(this,t[e]))return!0})},closest:function(e,t){var n,r=0,i=this.length,o=[],a="string"!=typeof e&&k(e);if(!N.test(e))for(;r<i;r++)for(n=this[r];n&&n!==t;n=n.parentNode)if(n.nodeType<11&&(a?-1<a.index(n):1===n.nodeType&&k.find.matchesSelector(n,e))){o.push(n);break}return this.pushStack(1<o.length?k.uniqueSort(o):o)},index:function(e){return e?"string"==typeof e?i.call(k(e),this[0]):i.call(this,e.jquery?e[0]:e):this[0]&&this[0].parentNode?this.first().prevAll().length:-1},add:function(e,t){return this.pushStack(k.uniqueSort(k.merge(this.get(),k(e,t))))},addBack:function(e){return this.add(null==e?this.prevObject:this.prevObject.filter(e))}}),k.each({parent:function(e){var t=e.parentNode;return t&&11!==t.nodeType?t:null},parents:function(e){return T(e,"parentNode")},parentsUntil:function(e,t,n){return T(e,"parentNode",n)},next:function(e){return P(e,"nextSibling")},prev:function(e){return P(e,"previousSibling")},nextAll:function(e){return T(e,"nextSibling")},prevAll:function(e){return T(e,"previousSibling")},nextUntil:function(e,t,n){return T(e,"nextSibling",n)},prevUntil:function(e,t,n){return T(e,"previousSibling",n)},siblings:function(e){return S((e.parentNode||{}).firstChild,e)},children:function(e){return S(e.firstChild)},contents:function(e){return"undefined"!=typeof e.contentDocument?e.contentDocument:(A(e,"template")&&(e=e.content||e),k.merge([],e.childNodes))}},function(r,i){k.fn[r]=function(e,t){var n=k.map(this,i,e);return"Until"!==r.slice(-5)&&(t=e),t&&"string"==typeof t&&(n=k.filter(t,n)),1<this.length&&(O[r]||k.uniqueSort(n),H.test(r)&&n.reverse()),this.pushStack(n)}});var R=/[^\x20\t\r\n\f]+/g;function M(e){return e}function I(e){throw e}function W(e,t,n,r){var i;try{e&&m(i=e.promise)?i.call(e).done(t).fail(n):e&&m(i=e.then)?i.call(e,t,n):t.apply(void 0,[e].slice(r))}catch(e){n.apply(void 0,[e])}}k.Callbacks=function(r){var e,n;r="string"==typeof r?(e=r,n={},k.each(e.match(R)||[],function(e,t){n[t]=!0}),n):k.extend({},r);var i,t,o,a,s=[],u=[],l=-1,c=function(){for(a=a||r.once,o=i=!0;u.length;l=-1){t=u.shift();while(++l<s.length)!1===s[l].apply(t[0],t[1])&&r.stopOnFalse&&(l=s.length,t=!1)}r.memory||(t=!1),i=!1,a&&(s=t?[]:"")},f={add:function(){return s&&(t&&!i&&(l=s.length-1,u.push(t)),function n(e){k.each(e,function(e,t){m(t)?r.unique&&f.has(t)||s.push(t):t&&t.length&&"string"!==w(t)&&n(t)})}(arguments),t&&!i&&c()),this},remove:function(){return k.each(arguments,function(e,t){var n;while(-1<(n=k.inArray(t,s,n)))s.splice(n,1),n<=l&&l--}),this},has:function(e){return e?-1<k.inArray(e,s):0<s.length},empty:function(){return s&&(s=[]),this},disable:function(){return a=u=[],s=t="",this},disabled:function(){return!s},lock:function(){return a=u=[],t||i||(s=t=""),this},locked:function(){return!!a},fireWith:function(e,t){return a||(t=[e,(t=t||[]).slice?t.slice():t],u.push(t),i||c()),this},fire:function(){return f.fireWith(this,arguments),this},fired:function(){return!!o}};return f},k.extend({Deferred:function(e){var o=[["notify","progress",k.Callbacks("memory"),k.Callbacks("memory"),2],["resolve","done",k.Callbacks("once memory"),k.Callbacks("once memory"),0,"resolved"],["reject","fail",k.Callbacks("once memory"),k.Callbacks("once memory"),1,"rejected"]],i="pending",a={state:function(){return i},always:function(){return s.done(arguments).fail(arguments),this},"catch":function(e){return a.then(null,e)},pipe:function(){var i=arguments;return k.Deferred(function(r){k.each(o,function(e,t){var n=m(i[t[4]])&&i[t[4]];s[t[1]](function(){var e=n&&n.apply(this,arguments);e&&m(e.promise)?e.promise().progress(r.notify).done(r.resolve).fail(r.reject):r[t[0]+"With"](this,n?[e]:arguments)})}),i=null}).promise()},then:function(t,n,r){var u=0;function l(i,o,a,s){return function(){var n=this,r=arguments,e=function(){var e,t;if(!(i<u)){if((e=a.apply(n,r))===o.promise())throw new TypeError("Thenable self-resolution");t=e&&("object"==typeof e||"function"==typeof e)&&e.then,m(t)?s?t.call(e,l(u,o,M,s),l(u,o,I,s)):(u++,t.call(e,l(u,o,M,s),l(u,o,I,s),l(u,o,M,o.notifyWith))):(a!==M&&(n=void 0,r=[e]),(s||o.resolveWith)(n,r))}},t=s?e:function(){try{e()}catch(e){k.Deferred.exceptionHook&&k.Deferred.exceptionHook(e,t.stackTrace),u<=i+1&&(a!==I&&(n=void 0,r=[e]),o.rejectWith(n,r))}};i?t():(k.Deferred.getStackHook&&(t.stackTrace=k.Deferred.getStackHook()),C.setTimeout(t))}}return k.Deferred(function(e){o[0][3].add(l(0,e,m(r)?r:M,e.notifyWith)),o[1][3].add(l(0,e,m(t)?t:M)),o[2][3].add(l(0,e,m(n)?n:I))}).promise()},promise:function(e){return null!=e?k.extend(e,a):a}},s={};return k.each(o,function(e,t){var n=t[2],r=t[5];a[t[1]]=n.add,r&&n.add(function(){i=r},o[3-e][2].disable,o[3-e][3].disable,o[0][2].lock,o[0][3].lock),n.add(t[3].fire),s[t[0]]=function(){return s[t[0]+"With"](this===s?void 0:this,arguments),this},s[t[0]+"With"]=n.fireWith}),a.promise(s),e&&e.call(s,s),s},when:function(e){var n=arguments.length,t=n,r=Array(t),i=s.call(arguments),o=k.Deferred(),a=function(t){return function(e){r[t]=this,i[t]=1<arguments.length?s.call(arguments):e,--n||o.resolveWith(r,i)}};if(n<=1&&(W(e,o.done(a(t)).resolve,o.reject,!n),"pending"===o.state()||m(i[t]&&i[t].then)))return o.then();while(t--)W(i[t],a(t),o.reject);return o.promise()}});var $=/^(Eval|Internal|Range|Reference|Syntax|Type|URI)Error$/;k.Deferred.exceptionHook=function(e,t){C.console&&C.console.warn&&e&&$.test(e.name)&&C.console.warn("jQuery.Deferred exception: "+e.message,e.stack,t)},k.readyException=function(e){C.setTimeout(function(){throw e})};var F=k.Deferred();function B(){E.removeEventListener("DOMContentLoaded",B),C.removeEventListener("load",B),k.ready()}k.fn.ready=function(e){return F.then(e)["catch"](function(e){k.readyException(e)}),this},k.extend({isReady:!1,readyWait:1,ready:function(e){(!0===e?--k.readyWait:k.isReady)||(k.isReady=!0)!==e&&0<--k.readyWait||F.resolveWith(E,[k])}}),k.ready.then=F.then,"complete"===E.readyState||"loading"!==E.readyState&&!E.documentElement.doScroll?C.setTimeout(k.ready):(E.addEventListener("DOMContentLoaded",B),C.addEventListener("load",B));var _=function(e,t,n,r,i,o,a){var s=0,u=e.length,l=null==n;if("object"===w(n))for(s in i=!0,n)_(e,t,s,n[s],!0,o,a);else if(void 0!==r&&(i=!0,m(r)||(a=!0),l&&(a?(t.call(e,r),t=null):(l=t,t=function(e,t,n){return l.call(k(e),n)})),t))for(;s<u;s++)t(e[s],n,a?r:r.call(e[s],s,t(e[s],n)));return i?e:l?t.call(e):u?t(e[0],n):o},z=/^-ms-/,U=/-([a-z])/g;function X(e,t){return t.toUpperCase()}function V(e){return e.replace(z,"ms-").replace(U,X)}var G=function(e){return 1===e.nodeType||9===e.nodeType||!+e.nodeType};function Y(){this.expando=k.expando+Y.uid++}Y.uid=1,Y.prototype={cache:function(e){var t=e[this.expando];return t||(t={},G(e)&&(e.nodeType?e[this.expando]=t:Object.defineProperty(e,this.expando,{value:t,configurable:!0}))),t},set:function(e,t,n){var r,i=this.cache(e);if("string"==typeof t)i[V(t)]=n;else for(r in t)i[V(r)]=t[r];return i},get:function(e,t){return void 0===t?this.cache(e):e[this.expando]&&e[this.expando][V(t)]},access:function(e,t,n){return void 0===t||t&&"string"==typeof t&&void 0===n?this.get(e,t):(this.set(e,t,n),void 0!==n?n:t)},remove:function(e,t){var n,r=e[this.expando];if(void 0!==r){if(void 0!==t){n=(t=Array.isArray(t)?t.map(V):(t=V(t))in r?[t]:t.match(R)||[]).length;while(n--)delete r[t[n]]}(void 0===t||k.isEmptyObject(r))&&(e.nodeType?e[this.expando]=void 0:delete e[this.expando])}},hasData:function(e){var t=e[this.expando];return void 0!==t&&!k.isEmptyObject(t)}};var Q=new Y,J=new Y,K=/^(?:\{[\w\W]*\}|\[[\w\W]*\])$/,Z=/[A-Z]/g;function ee(e,t,n){var r,i;if(void 0===n&&1===e.nodeType)if(r="data-"+t.replace(Z,"-$&").toLowerCase(),"string"==typeof(n=e.getAttribute(r))){try{n="true"===(i=n)||"false"!==i&&("null"===i?null:i===+i+""?+i:K.test(i)?JSON.parse(i):i)}catch(e){}J.set(e,t,n)}else n=void 0;return n}k.extend({hasData:function(e){return J.hasData(e)||Q.hasData(e)},data:function(e,t,n){return J.access(e,t,n)},removeData:function(e,t){J.remove(e,t)},_data:function(e,t,n){return Q.access(e,t,n)},_removeData:function(e,t){Q.remove(e,t)}}),k.fn.extend({data:function(n,e){var t,r,i,o=this[0],a=o&&o.attributes;if(void 0===n){if(this.length&&(i=J.get(o),1===o.nodeType&&!Q.get(o,"hasDataAttrs"))){t=a.length;while(t--)a[t]&&0===(r=a[t].name).indexOf("data-")&&(r=V(r.slice(5)),ee(o,r,i[r]));Q.set(o,"hasDataAttrs",!0)}return i}return"object"==typeof n?this.each(function(){J.set(this,n)}):_(this,function(e){var t;if(o&&void 0===e)return void 0!==(t=J.get(o,n))?t:void 0!==(t=ee(o,n))?t:void 0;this.each(function(){J.set(this,n,e)})},null,e,1<arguments.length,null,!0)},removeData:function(e){return this.each(function(){J.remove(this,e)})}}),k.extend({queue:function(e,t,n){var r;if(e)return t=(t||"fx")+"queue",r=Q.get(e,t),n&&(!r||Array.isArray(n)?r=Q.access(e,t,k.makeArray(n)):r.push(n)),r||[]},dequeue:function(e,t){t=t||"fx";var n=k.queue(e,t),r=n.length,i=n.shift(),o=k._queueHooks(e,t);"inprogress"===i&&(i=n.shift(),r--),i&&("fx"===t&&n.unshift("inprogress"),delete o.stop,i.call(e,function(){k.dequeue(e,t)},o)),!r&&o&&o.empty.fire()},_queueHooks:function(e,t){var n=t+"queueHooks";return Q.get(e,n)||Q.access(e,n,{empty:k.Callbacks("once memory").add(function(){Q.remove(e,[t+"queue",n])})})}}),k.fn.extend({queue:function(t,n){var e=2;return"string"!=typeof t&&(n=t,t="fx",e--),arguments.length<e?k.queue(this[0],t):void 0===n?this:this.each(function(){var e=k.queue(this,t,n);k._queueHooks(this,t),"fx"===t&&"inprogress"!==e[0]&&k.dequeue(this,t)})},dequeue:function(e){return this.each(function(){k.dequeue(this,e)})},clearQueue:function(e){return this.queue(e||"fx",[])},promise:function(e,t){var n,r=1,i=k.Deferred(),o=this,a=this.length,s=function(){--r||i.resolveWith(o,[o])};"string"!=typeof e&&(t=e,e=void 0),e=e||"fx";while(a--)(n=Q.get(o[a],e+"queueHooks"))&&n.empty&&(r++,n.empty.add(s));return s(),i.promise(t)}});var te=/[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source,ne=new RegExp("^(?:([+-])=|)("+te+")([a-z%]*)$","i"),re=["Top","Right","Bottom","Left"],ie=E.documentElement,oe=function(e){return k.contains(e.ownerDocument,e)},ae={composed:!0};ie.getRootNode&&(oe=function(e){return k.contains(e.ownerDocument,e)||e.getRootNode(ae)===e.ownerDocument});var se=function(e,t){return"none"===(e=t||e).style.display||""===e.style.display&&oe(e)&&"none"===k.css(e,"display")},ue=function(e,t,n,r){var i,o,a={};for(o in t)a[o]=e.style[o],e.style[o]=t[o];for(o in i=n.apply(e,r||[]),t)e.style[o]=a[o];return i};function le(e,t,n,r){var i,o,a=20,s=r?function(){return r.cur()}:function(){return k.css(e,t,"")},u=s(),l=n&&n[3]||(k.cssNumber[t]?"":"px"),c=e.nodeType&&(k.cssNumber[t]||"px"!==l&&+u)&&ne.exec(k.css(e,t));if(c&&c[3]!==l){u/=2,l=l||c[3],c=+u||1;while(a--)k.style(e,t,c+l),(1-o)*(1-(o=s()/u||.5))<=0&&(a=0),c/=o;c*=2,k.style(e,t,c+l),n=n||[]}return n&&(c=+c||+u||0,i=n[1]?c+(n[1]+1)*n[2]:+n[2],r&&(r.unit=l,r.start=c,r.end=i)),i}var ce={};function fe(e,t){for(var n,r,i,o,a,s,u,l=[],c=0,f=e.length;c<f;c++)(r=e[c]).style&&(n=r.style.display,t?("none"===n&&(l[c]=Q.get(r,"display")||null,l[c]||(r.style.display="")),""===r.style.display&&se(r)&&(l[c]=(u=a=o=void 0,a=(i=r).ownerDocument,s=i.nodeName,(u=ce[s])||(o=a.body.appendChild(a.createElement(s)),u=k.css(o,"display"),o.parentNode.removeChild(o),"none"===u&&(u="block"),ce[s]=u)))):"none"!==n&&(l[c]="none",Q.set(r,"display",n)));for(c=0;c<f;c++)null!=l[c]&&(e[c].style.display=l[c]);return e}k.fn.extend({show:function(){return fe(this,!0)},hide:function(){return fe(this)},toggle:function(e){return"boolean"==typeof e?e?this.show():this.hide():this.each(function(){se(this)?k(this).show():k(this).hide()})}});var pe=/^(?:checkbox|radio)$/i,de=/<([a-z][^\/\0>\x20\t\r\n\f]*)/i,he=/^$|^module$|\/(?:java|ecma)script/i,ge={option:[1,"<select multiple='multiple'>","</select>"],thead:[1,"<table>","</table>"],col:[2,"<table><colgroup>","</colgroup></table>"],tr:[2,"<table><tbody>","</tbody></table>"],td:[3,"<table><tbody><tr>","</tr></tbody></table>"],_default:[0,"",""]};function ve(e,t){var n;return n="undefined"!=typeof e.getElementsByTagName?e.getElementsByTagName(t||"*"):"undefined"!=typeof e.querySelectorAll?e.querySelectorAll(t||"*"):[],void 0===t||t&&A(e,t)?k.merge([e],n):n}function ye(e,t){for(var n=0,r=e.length;n<r;n++)Q.set(e[n],"globalEval",!t||Q.get(t[n],"globalEval"))}ge.optgroup=ge.option,ge.tbody=ge.tfoot=ge.colgroup=ge.caption=ge.thead,ge.th=ge.td;var me,xe,be=/<|&#?\w+;/;function we(e,t,n,r,i){for(var o,a,s,u,l,c,f=t.createDocumentFragment(),p=[],d=0,h=e.length;d<h;d++)if((o=e[d])||0===o)if("object"===w(o))k.merge(p,o.nodeType?[o]:o);else if(be.test(o)){a=a||f.appendChild(t.createElement("div")),s=(de.exec(o)||["",""])[1].toLowerCase(),u=ge[s]||ge._default,a.innerHTML=u[1]+k.htmlPrefilter(o)+u[2],c=u[0];while(c--)a=a.lastChild;k.merge(p,a.childNodes),(a=f.firstChild).textContent=""}else p.push(t.createTextNode(o));f.textContent="",d=0;while(o=p[d++])if(r&&-1<k.inArray(o,r))i&&i.push(o);else if(l=oe(o),a=ve(f.appendChild(o),"script"),l&&ye(a),n){c=0;while(o=a[c++])he.test(o.type||"")&&n.push(o)}return f}me=E.createDocumentFragment().appendChild(E.createElement("div")),(xe=E.createElement("input")).setAttribute("type","radio"),xe.setAttribute("checked","checked"),xe.setAttribute("name","t"),me.appendChild(xe),y.checkClone=me.cloneNode(!0).cloneNode(!0).lastChild.checked,me.innerHTML="<textarea>x</textarea>",y.noCloneChecked=!!me.cloneNode(!0).lastChild.defaultValue;var Te=/^key/,Ce=/^(?:mouse|pointer|contextmenu|drag|drop)|click/,Ee=/^([^.]*)(?:\.(.+)|)/;function ke(){return!0}function Se(){return!1}function Ne(e,t){return e===function(){try{return E.activeElement}catch(e){}}()==("focus"===t)}function Ae(e,t,n,r,i,o){var a,s;if("object"==typeof t){for(s in"string"!=typeof n&&(r=r||n,n=void 0),t)Ae(e,s,n,r,t[s],o);return e}if(null==r&&null==i?(i=n,r=n=void 0):null==i&&("string"==typeof n?(i=r,r=void 0):(i=r,r=n,n=void 0)),!1===i)i=Se;else if(!i)return e;return 1===o&&(a=i,(i=function(e){return k().off(e),a.apply(this,arguments)}).guid=a.guid||(a.guid=k.guid++)),e.each(function(){k.event.add(this,t,i,r,n)})}function De(e,i,o){o?(Q.set(e,i,!1),k.event.add(e,i,{namespace:!1,handler:function(e){var t,n,r=Q.get(this,i);if(1&e.isTrigger&&this[i]){if(r.length)(k.event.special[i]||{}).delegateType&&e.stopPropagation();else if(r=s.call(arguments),Q.set(this,i,r),t=o(this,i),this[i](),r!==(n=Q.get(this,i))||t?Q.set(this,i,!1):n={},r!==n)return e.stopImmediatePropagation(),e.preventDefault(),n.value}else r.length&&(Q.set(this,i,{value:k.event.trigger(k.extend(r[0],k.Event.prototype),r.slice(1),this)}),e.stopImmediatePropagation())}})):void 0===Q.get(e,i)&&k.event.add(e,i,ke)}k.event={global:{},add:function(t,e,n,r,i){var o,a,s,u,l,c,f,p,d,h,g,v=Q.get(t);if(v){n.handler&&(n=(o=n).handler,i=o.selector),i&&k.find.matchesSelector(ie,i),n.guid||(n.guid=k.guid++),(u=v.events)||(u=v.events={}),(a=v.handle)||(a=v.handle=function(e){return"undefined"!=typeof k&&k.event.triggered!==e.type?k.event.dispatch.apply(t,arguments):void 0}),l=(e=(e||"").match(R)||[""]).length;while(l--)d=g=(s=Ee.exec(e[l])||[])[1],h=(s[2]||"").split(".").sort(),d&&(f=k.event.special[d]||{},d=(i?f.delegateType:f.bindType)||d,f=k.event.special[d]||{},c=k.extend({type:d,origType:g,data:r,handler:n,guid:n.guid,selector:i,needsContext:i&&k.expr.match.needsContext.test(i),namespace:h.join(".")},o),(p=u[d])||((p=u[d]=[]).delegateCount=0,f.setup&&!1!==f.setup.call(t,r,h,a)||t.addEventListener&&t.addEventListener(d,a)),f.add&&(f.add.call(t,c),c.handler.guid||(c.handler.guid=n.guid)),i?p.splice(p.delegateCount++,0,c):p.push(c),k.event.global[d]=!0)}},remove:function(e,t,n,r,i){var o,a,s,u,l,c,f,p,d,h,g,v=Q.hasData(e)&&Q.get(e);if(v&&(u=v.events)){l=(t=(t||"").match(R)||[""]).length;while(l--)if(d=g=(s=Ee.exec(t[l])||[])[1],h=(s[2]||"").split(".").sort(),d){f=k.event.special[d]||{},p=u[d=(r?f.delegateType:f.bindType)||d]||[],s=s[2]&&new RegExp("(^|\\.)"+h.join("\\.(?:.*\\.|)")+"(\\.|$)"),a=o=p.length;while(o--)c=p[o],!i&&g!==c.origType||n&&n.guid!==c.guid||s&&!s.test(c.namespace)||r&&r!==c.selector&&("**"!==r||!c.selector)||(p.splice(o,1),c.selector&&p.delegateCount--,f.remove&&f.remove.call(e,c));a&&!p.length&&(f.teardown&&!1!==f.teardown.call(e,h,v.handle)||k.removeEvent(e,d,v.handle),delete u[d])}else for(d in u)k.event.remove(e,d+t[l],n,r,!0);k.isEmptyObject(u)&&Q.remove(e,"handle events")}},dispatch:function(e){var t,n,r,i,o,a,s=k.event.fix(e),u=new Array(arguments.length),l=(Q.get(this,"events")||{})[s.type]||[],c=k.event.special[s.type]||{};for(u[0]=s,t=1;t<arguments.length;t++)u[t]=arguments[t];if(s.delegateTarget=this,!c.preDispatch||!1!==c.preDispatch.call(this,s)){a=k.event.handlers.call(this,s,l),t=0;while((i=a[t++])&&!s.isPropagationStopped()){s.currentTarget=i.elem,n=0;while((o=i.handlers[n++])&&!s.isImmediatePropagationStopped())s.rnamespace&&!1!==o.namespace&&!s.rnamespace.test(o.namespace)||(s.handleObj=o,s.data=o.data,void 0!==(r=((k.event.special[o.origType]||{}).handle||o.handler).apply(i.elem,u))&&!1===(s.result=r)&&(s.preventDefault(),s.stopPropagation()))}return c.postDispatch&&c.postDispatch.call(this,s),s.result}},handlers:function(e,t){var n,r,i,o,a,s=[],u=t.delegateCount,l=e.target;if(u&&l.nodeType&&!("click"===e.type&&1<=e.button))for(;l!==this;l=l.parentNode||this)if(1===l.nodeType&&("click"!==e.type||!0!==l.disabled)){for(o=[],a={},n=0;n<u;n++)void 0===a[i=(r=t[n]).selector+" "]&&(a[i]=r.needsContext?-1<k(i,this).index(l):k.find(i,this,null,[l]).length),a[i]&&o.push(r);o.length&&s.push({elem:l,handlers:o})}return l=this,u<t.length&&s.push({elem:l,handlers:t.slice(u)}),s},addProp:function(t,e){Object.defineProperty(k.Event.prototype,t,{enumerable:!0,configurable:!0,get:m(e)?function(){if(this.originalEvent)return e(this.originalEvent)}:function(){if(this.originalEvent)return this.originalEvent[t]},set:function(e){Object.defineProperty(this,t,{enumerable:!0,configurable:!0,writable:!0,value:e})}})},fix:function(e){return e[k.expando]?e:new k.Event(e)},special:{load:{noBubble:!0},click:{setup:function(e){var t=this||e;return pe.test(t.type)&&t.click&&A(t,"input")&&De(t,"click",ke),!1},trigger:function(e){var t=this||e;return pe.test(t.type)&&t.click&&A(t,"input")&&De(t,"click"),!0},_default:function(e){var t=e.target;return pe.test(t.type)&&t.click&&A(t,"input")&&Q.get(t,"click")||A(t,"a")}},beforeunload:{postDispatch:function(e){void 0!==e.result&&e.originalEvent&&(e.originalEvent.returnValue=e.result)}}}},k.removeEvent=function(e,t,n){e.removeEventListener&&e.removeEventListener(t,n)},k.Event=function(e,t){if(!(this instanceof k.Event))return new k.Event(e,t);e&&e.type?(this.originalEvent=e,this.type=e.type,this.isDefaultPrevented=e.defaultPrevented||void 0===e.defaultPrevented&&!1===e.returnValue?ke:Se,this.target=e.target&&3===e.target.nodeType?e.target.parentNode:e.target,this.currentTarget=e.currentTarget,this.relatedTarget=e.relatedTarget):this.type=e,t&&k.extend(this,t),this.timeStamp=e&&e.timeStamp||Date.now(),this[k.expando]=!0},k.Event.prototype={constructor:k.Event,isDefaultPrevented:Se,isPropagationStopped:Se,isImmediatePropagationStopped:Se,isSimulated:!1,preventDefault:function(){var e=this.originalEvent;this.isDefaultPrevented=ke,e&&!this.isSimulated&&e.preventDefault()},stopPropagation:function(){var e=this.originalEvent;this.isPropagationStopped=ke,e&&!this.isSimulated&&e.stopPropagation()},stopImmediatePropagation:function(){var e=this.originalEvent;this.isImmediatePropagationStopped=ke,e&&!this.isSimulated&&e.stopImmediatePropagation(),this.stopPropagation()}},k.each({altKey:!0,bubbles:!0,cancelable:!0,changedTouches:!0,ctrlKey:!0,detail:!0,eventPhase:!0,metaKey:!0,pageX:!0,pageY:!0,shiftKey:!0,view:!0,"char":!0,code:!0,charCode:!0,key:!0,keyCode:!0,button:!0,buttons:!0,clientX:!0,clientY:!0,offsetX:!0,offsetY:!0,pointerId:!0,pointerType:!0,screenX:!0,screenY:!0,targetTouches:!0,toElement:!0,touches:!0,which:function(e){var t=e.button;return null==e.which&&Te.test(e.type)?null!=e.charCode?e.charCode:e.keyCode:!e.which&&void 0!==t&&Ce.test(e.type)?1&t?1:2&t?3:4&t?2:0:e.which}},k.event.addProp),k.each({focus:"focusin",blur:"focusout"},function(e,t){k.event.special[e]={setup:function(){return De(this,e,Ne),!1},trigger:function(){return De(this,e),!0},delegateType:t}}),k.each({mouseenter:"mouseover",mouseleave:"mouseout",pointerenter:"pointerover",pointerleave:"pointerout"},function(e,i){k.event.special[e]={delegateType:i,bindType:i,handle:function(e){var t,n=e.relatedTarget,r=e.handleObj;return n&&(n===this||k.contains(this,n))||(e.type=r.origType,t=r.handler.apply(this,arguments),e.type=i),t}}}),k.fn.extend({on:function(e,t,n,r){return Ae(this,e,t,n,r)},one:function(e,t,n,r){return Ae(this,e,t,n,r,1)},off:function(e,t,n){var r,i;if(e&&e.preventDefault&&e.handleObj)return r=e.handleObj,k(e.delegateTarget).off(r.namespace?r.origType+"."+r.namespace:r.origType,r.selector,r.handler),this;if("object"==typeof e){for(i in e)this.off(i,t,e[i]);return this}return!1!==t&&"function"!=typeof t||(n=t,t=void 0),!1===n&&(n=Se),this.each(function(){k.event.remove(this,e,n,t)})}});var je=/<(?!area|br|col|embed|hr|img|input|link|meta|param)(([a-z][^\/\0>\x20\t\r\n\f]*)[^>]*)\/>/gi,qe=/<script|<style|<link/i,Le=/checked\s*(?:[^=]|=\s*.checked.)/i,He=/^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g;function Oe(e,t){return A(e,"table")&&A(11!==t.nodeType?t:t.firstChild,"tr")&&k(e).children("tbody")[0]||e}function Pe(e){return e.type=(null!==e.getAttribute("type"))+"/"+e.type,e}function Re(e){return"true/"===(e.type||"").slice(0,5)?e.type=e.type.slice(5):e.removeAttribute("type"),e}function Me(e,t){var n,r,i,o,a,s,u,l;if(1===t.nodeType){if(Q.hasData(e)&&(o=Q.access(e),a=Q.set(t,o),l=o.events))for(i in delete a.handle,a.events={},l)for(n=0,r=l[i].length;n<r;n++)k.event.add(t,i,l[i][n]);J.hasData(e)&&(s=J.access(e),u=k.extend({},s),J.set(t,u))}}function Ie(n,r,i,o){r=g.apply([],r);var e,t,a,s,u,l,c=0,f=n.length,p=f-1,d=r[0],h=m(d);if(h||1<f&&"string"==typeof d&&!y.checkClone&&Le.test(d))return n.each(function(e){var t=n.eq(e);h&&(r[0]=d.call(this,e,t.html())),Ie(t,r,i,o)});if(f&&(t=(e=we(r,n[0].ownerDocument,!1,n,o)).firstChild,1===e.childNodes.length&&(e=t),t||o)){for(s=(a=k.map(ve(e,"script"),Pe)).length;c<f;c++)u=e,c!==p&&(u=k.clone(u,!0,!0),s&&k.merge(a,ve(u,"script"))),i.call(n[c],u,c);if(s)for(l=a[a.length-1].ownerDocument,k.map(a,Re),c=0;c<s;c++)u=a[c],he.test(u.type||"")&&!Q.access(u,"globalEval")&&k.contains(l,u)&&(u.src&&"module"!==(u.type||"").toLowerCase()?k._evalUrl&&!u.noModule&&k._evalUrl(u.src,{nonce:u.nonce||u.getAttribute("nonce")}):b(u.textContent.replace(He,""),u,l))}return n}function We(e,t,n){for(var r,i=t?k.filter(t,e):e,o=0;null!=(r=i[o]);o++)n||1!==r.nodeType||k.cleanData(ve(r)),r.parentNode&&(n&&oe(r)&&ye(ve(r,"script")),r.parentNode.removeChild(r));return e}k.extend({htmlPrefilter:function(e){return e.replace(je,"<$1></$2>")},clone:function(e,t,n){var r,i,o,a,s,u,l,c=e.cloneNode(!0),f=oe(e);if(!(y.noCloneChecked||1!==e.nodeType&&11!==e.nodeType||k.isXMLDoc(e)))for(a=ve(c),r=0,i=(o=ve(e)).length;r<i;r++)s=o[r],u=a[r],void 0,"input"===(l=u.nodeName.toLowerCase())&&pe.test(s.type)?u.checked=s.checked:"input"!==l&&"textarea"!==l||(u.defaultValue=s.defaultValue);if(t)if(n)for(o=o||ve(e),a=a||ve(c),r=0,i=o.length;r<i;r++)Me(o[r],a[r]);else Me(e,c);return 0<(a=ve(c,"script")).length&&ye(a,!f&&ve(e,"script")),c},cleanData:function(e){for(var t,n,r,i=k.event.special,o=0;void 0!==(n=e[o]);o++)if(G(n)){if(t=n[Q.expando]){if(t.events)for(r in t.events)i[r]?k.event.remove(n,r):k.removeEvent(n,r,t.handle);n[Q.expando]=void 0}n[J.expando]&&(n[J.expando]=void 0)}}}),k.fn.extend({detach:function(e){return We(this,e,!0)},remove:function(e){return We(this,e)},text:function(e){return _(this,function(e){return void 0===e?k.text(this):this.empty().each(function(){1!==this.nodeType&&11!==this.nodeType&&9!==this.nodeType||(this.textContent=e)})},null,e,arguments.length)},append:function(){return Ie(this,arguments,function(e){1!==this.nodeType&&11!==this.nodeType&&9!==this.nodeType||Oe(this,e).appendChild(e)})},prepend:function(){return Ie(this,arguments,function(e){if(1===this.nodeType||11===this.nodeType||9===this.nodeType){var t=Oe(this,e);t.insertBefore(e,t.firstChild)}})},before:function(){return Ie(this,arguments,function(e){this.parentNode&&this.parentNode.insertBefore(e,this)})},after:function(){return Ie(this,arguments,function(e){this.parentNode&&this.parentNode.insertBefore(e,this.nextSibling)})},empty:function(){for(var e,t=0;null!=(e=this[t]);t++)1===e.nodeType&&(k.cleanData(ve(e,!1)),e.textContent="");return this},clone:function(e,t){return e=null!=e&&e,t=null==t?e:t,this.map(function(){return k.clone(this,e,t)})},html:function(e){return _(this,function(e){var t=this[0]||{},n=0,r=this.length;if(void 0===e&&1===t.nodeType)return t.innerHTML;if("string"==typeof e&&!qe.test(e)&&!ge[(de.exec(e)||["",""])[1].toLowerCase()]){e=k.htmlPrefilter(e);try{for(;n<r;n++)1===(t=this[n]||{}).nodeType&&(k.cleanData(ve(t,!1)),t.innerHTML=e);t=0}catch(e){}}t&&this.empty().append(e)},null,e,arguments.length)},replaceWith:function(){var n=[];return Ie(this,arguments,function(e){var t=this.parentNode;k.inArray(this,n)<0&&(k.cleanData(ve(this)),t&&t.replaceChild(e,this))},n)}}),k.each({appendTo:"append",prependTo:"prepend",insertBefore:"before",insertAfter:"after",replaceAll:"replaceWith"},function(e,a){k.fn[e]=function(e){for(var t,n=[],r=k(e),i=r.length-1,o=0;o<=i;o++)t=o===i?this:this.clone(!0),k(r[o])[a](t),u.apply(n,t.get());return this.pushStack(n)}});var $e=new RegExp("^("+te+")(?!px)[a-z%]+$","i"),Fe=function(e){var t=e.ownerDocument.defaultView;return t&&t.opener||(t=C),t.getComputedStyle(e)},Be=new RegExp(re.join("|"),"i");function _e(e,t,n){var r,i,o,a,s=e.style;return(n=n||Fe(e))&&(""!==(a=n.getPropertyValue(t)||n[t])||oe(e)||(a=k.style(e,t)),!y.pixelBoxStyles()&&$e.test(a)&&Be.test(t)&&(r=s.width,i=s.minWidth,o=s.maxWidth,s.minWidth=s.maxWidth=s.width=a,a=n.width,s.width=r,s.minWidth=i,s.maxWidth=o)),void 0!==a?a+"":a}function ze(e,t){return{get:function(){if(!e())return(this.get=t).apply(this,arguments);delete this.get}}}!function(){function e(){if(u){s.style.cssText="position:absolute;left:-11111px;width:60px;margin-top:1px;padding:0;border:0",u.style.cssText="position:relative;display:block;box-sizing:border-box;overflow:scroll;margin:auto;border:1px;padding:1px;width:60%;top:1%",ie.appendChild(s).appendChild(u);var e=C.getComputedStyle(u);n="1%"!==e.top,a=12===t(e.marginLeft),u.style.right="60%",o=36===t(e.right),r=36===t(e.width),u.style.position="absolute",i=12===t(u.offsetWidth/3),ie.removeChild(s),u=null}}function t(e){return Math.round(parseFloat(e))}var n,r,i,o,a,s=E.createElement("div"),u=E.createElement("div");u.style&&(u.style.backgroundClip="content-box",u.cloneNode(!0).style.backgroundClip="",y.clearCloneStyle="content-box"===u.style.backgroundClip,k.extend(y,{boxSizingReliable:function(){return e(),r},pixelBoxStyles:function(){return e(),o},pixelPosition:function(){return e(),n},reliableMarginLeft:function(){return e(),a},scrollboxSize:function(){return e(),i}}))}();var Ue=["Webkit","Moz","ms"],Xe=E.createElement("div").style,Ve={};function Ge(e){var t=k.cssProps[e]||Ve[e];return t||(e in Xe?e:Ve[e]=function(e){var t=e[0].toUpperCase()+e.slice(1),n=Ue.length;while(n--)if((e=Ue[n]+t)in Xe)return e}(e)||e)}var Ye=/^(none|table(?!-c[ea]).+)/,Qe=/^--/,Je={position:"absolute",visibility:"hidden",display:"block"},Ke={letterSpacing:"0",fontWeight:"400"};function Ze(e,t,n){var r=ne.exec(t);return r?Math.max(0,r[2]-(n||0))+(r[3]||"px"):t}function et(e,t,n,r,i,o){var a="width"===t?1:0,s=0,u=0;if(n===(r?"border":"content"))return 0;for(;a<4;a+=2)"margin"===n&&(u+=k.css(e,n+re[a],!0,i)),r?("content"===n&&(u-=k.css(e,"padding"+re[a],!0,i)),"margin"!==n&&(u-=k.css(e,"border"+re[a]+"Width",!0,i))):(u+=k.css(e,"padding"+re[a],!0,i),"padding"!==n?u+=k.css(e,"border"+re[a]+"Width",!0,i):s+=k.css(e,"border"+re[a]+"Width",!0,i));return!r&&0<=o&&(u+=Math.max(0,Math.ceil(e["offset"+t[0].toUpperCase()+t.slice(1)]-o-u-s-.5))||0),u}function tt(e,t,n){var r=Fe(e),i=(!y.boxSizingReliable()||n)&&"border-box"===k.css(e,"boxSizing",!1,r),o=i,a=_e(e,t,r),s="offset"+t[0].toUpperCase()+t.slice(1);if($e.test(a)){if(!n)return a;a="auto"}return(!y.boxSizingReliable()&&i||"auto"===a||!parseFloat(a)&&"inline"===k.css(e,"display",!1,r))&&e.getClientRects().length&&(i="border-box"===k.css(e,"boxSizing",!1,r),(o=s in e)&&(a=e[s])),(a=parseFloat(a)||0)+et(e,t,n||(i?"border":"content"),o,r,a)+"px"}function nt(e,t,n,r,i){return new nt.prototype.init(e,t,n,r,i)}k.extend({cssHooks:{opacity:{get:function(e,t){if(t){var n=_e(e,"opacity");return""===n?"1":n}}}},cssNumber:{animationIterationCount:!0,columnCount:!0,fillOpacity:!0,flexGrow:!0,flexShrink:!0,fontWeight:!0,gridArea:!0,gridColumn:!0,gridColumnEnd:!0,gridColumnStart:!0,gridRow:!0,gridRowEnd:!0,gridRowStart:!0,lineHeight:!0,opacity:!0,order:!0,orphans:!0,widows:!0,zIndex:!0,zoom:!0},cssProps:{},style:function(e,t,n,r){if(e&&3!==e.nodeType&&8!==e.nodeType&&e.style){var i,o,a,s=V(t),u=Qe.test(t),l=e.style;if(u||(t=Ge(s)),a=k.cssHooks[t]||k.cssHooks[s],void 0===n)return a&&"get"in a&&void 0!==(i=a.get(e,!1,r))?i:l[t];"string"===(o=typeof n)&&(i=ne.exec(n))&&i[1]&&(n=le(e,t,i),o="number"),null!=n&&n==n&&("number"!==o||u||(n+=i&&i[3]||(k.cssNumber[s]?"":"px")),y.clearCloneStyle||""!==n||0!==t.indexOf("background")||(l[t]="inherit"),a&&"set"in a&&void 0===(n=a.set(e,n,r))||(u?l.setProperty(t,n):l[t]=n))}},css:function(e,t,n,r){var i,o,a,s=V(t);return Qe.test(t)||(t=Ge(s)),(a=k.cssHooks[t]||k.cssHooks[s])&&"get"in a&&(i=a.get(e,!0,n)),void 0===i&&(i=_e(e,t,r)),"normal"===i&&t in Ke&&(i=Ke[t]),""===n||n?(o=parseFloat(i),!0===n||isFinite(o)?o||0:i):i}}),k.each(["height","width"],function(e,u){k.cssHooks[u]={get:function(e,t,n){if(t)return!Ye.test(k.css(e,"display"))||e.getClientRects().length&&e.getBoundingClientRect().width?tt(e,u,n):ue(e,Je,function(){return tt(e,u,n)})},set:function(e,t,n){var r,i=Fe(e),o=!y.scrollboxSize()&&"absolute"===i.position,a=(o||n)&&"border-box"===k.css(e,"boxSizing",!1,i),s=n?et(e,u,n,a,i):0;return a&&o&&(s-=Math.ceil(e["offset"+u[0].toUpperCase()+u.slice(1)]-parseFloat(i[u])-et(e,u,"border",!1,i)-.5)),s&&(r=ne.exec(t))&&"px"!==(r[3]||"px")&&(e.style[u]=t,t=k.css(e,u)),Ze(0,t,s)}}}),k.cssHooks.marginLeft=ze(y.reliableMarginLeft,function(e,t){if(t)return(parseFloat(_e(e,"marginLeft"))||e.getBoundingClientRect().left-ue(e,{marginLeft:0},function(){return e.getBoundingClientRect().left}))+"px"}),k.each({margin:"",padding:"",border:"Width"},function(i,o){k.cssHooks[i+o]={expand:function(e){for(var t=0,n={},r="string"==typeof e?e.split(" "):[e];t<4;t++)n[i+re[t]+o]=r[t]||r[t-2]||r[0];return n}},"margin"!==i&&(k.cssHooks[i+o].set=Ze)}),k.fn.extend({css:function(e,t){return _(this,function(e,t,n){var r,i,o={},a=0;if(Array.isArray(t)){for(r=Fe(e),i=t.length;a<i;a++)o[t[a]]=k.css(e,t[a],!1,r);return o}return void 0!==n?k.style(e,t,n):k.css(e,t)},e,t,1<arguments.length)}}),((k.Tween=nt).prototype={constructor:nt,init:function(e,t,n,r,i,o){this.elem=e,this.prop=n,this.easing=i||k.easing._default,this.options=t,this.start=this.now=this.cur(),this.end=r,this.unit=o||(k.cssNumber[n]?"":"px")},cur:function(){var e=nt.propHooks[this.prop];return e&&e.get?e.get(this):nt.propHooks._default.get(this)},run:function(e){var t,n=nt.propHooks[this.prop];return this.options.duration?this.pos=t=k.easing[this.easing](e,this.options.duration*e,0,1,this.options.duration):this.pos=t=e,this.now=(this.end-this.start)*t+this.start,this.options.step&&this.options.step.call(this.elem,this.now,this),n&&n.set?n.set(this):nt.propHooks._default.set(this),this}}).init.prototype=nt.prototype,(nt.propHooks={_default:{get:function(e){var t;return 1!==e.elem.nodeType||null!=e.elem[e.prop]&&null==e.elem.style[e.prop]?e.elem[e.prop]:(t=k.css(e.elem,e.prop,""))&&"auto"!==t?t:0},set:function(e){k.fx.step[e.prop]?k.fx.step[e.prop](e):1!==e.elem.nodeType||!k.cssHooks[e.prop]&&null==e.elem.style[Ge(e.prop)]?e.elem[e.prop]=e.now:k.style(e.elem,e.prop,e.now+e.unit)}}}).scrollTop=nt.propHooks.scrollLeft={set:function(e){e.elem.nodeType&&e.elem.parentNode&&(e.elem[e.prop]=e.now)}},k.easing={linear:function(e){return e},swing:function(e){return.5-Math.cos(e*Math.PI)/2},_default:"swing"},k.fx=nt.prototype.init,k.fx.step={};var rt,it,ot,at,st=/^(?:toggle|show|hide)$/,ut=/queueHooks$/;function lt(){it&&(!1===E.hidden&&C.requestAnimationFrame?C.requestAnimationFrame(lt):C.setTimeout(lt,k.fx.interval),k.fx.tick())}function ct(){return C.setTimeout(function(){rt=void 0}),rt=Date.now()}function ft(e,t){var n,r=0,i={height:e};for(t=t?1:0;r<4;r+=2-t)i["margin"+(n=re[r])]=i["padding"+n]=e;return t&&(i.opacity=i.width=e),i}function pt(e,t,n){for(var r,i=(dt.tweeners[t]||[]).concat(dt.tweeners["*"]),o=0,a=i.length;o<a;o++)if(r=i[o].call(n,t,e))return r}function dt(o,e,t){var n,a,r=0,i=dt.prefilters.length,s=k.Deferred().always(function(){delete u.elem}),u=function(){if(a)return!1;for(var e=rt||ct(),t=Math.max(0,l.startTime+l.duration-e),n=1-(t/l.duration||0),r=0,i=l.tweens.length;r<i;r++)l.tweens[r].run(n);return s.notifyWith(o,[l,n,t]),n<1&&i?t:(i||s.notifyWith(o,[l,1,0]),s.resolveWith(o,[l]),!1)},l=s.promise({elem:o,props:k.extend({},e),opts:k.extend(!0,{specialEasing:{},easing:k.easing._default},t),originalProperties:e,originalOptions:t,startTime:rt||ct(),duration:t.duration,tweens:[],createTween:function(e,t){var n=k.Tween(o,l.opts,e,t,l.opts.specialEasing[e]||l.opts.easing);return l.tweens.push(n),n},stop:function(e){var t=0,n=e?l.tweens.length:0;if(a)return this;for(a=!0;t<n;t++)l.tweens[t].run(1);return e?(s.notifyWith(o,[l,1,0]),s.resolveWith(o,[l,e])):s.rejectWith(o,[l,e]),this}}),c=l.props;for(!function(e,t){var n,r,i,o,a;for(n in e)if(i=t[r=V(n)],o=e[n],Array.isArray(o)&&(i=o[1],o=e[n]=o[0]),n!==r&&(e[r]=o,delete e[n]),(a=k.cssHooks[r])&&"expand"in a)for(n in o=a.expand(o),delete e[r],o)n in e||(e[n]=o[n],t[n]=i);else t[r]=i}(c,l.opts.specialEasing);r<i;r++)if(n=dt.prefilters[r].call(l,o,c,l.opts))return m(n.stop)&&(k._queueHooks(l.elem,l.opts.queue).stop=n.stop.bind(n)),n;return k.map(c,pt,l),m(l.opts.start)&&l.opts.start.call(o,l),l.progress(l.opts.progress).done(l.opts.done,l.opts.complete).fail(l.opts.fail).always(l.opts.always),k.fx.timer(k.extend(u,{elem:o,anim:l,queue:l.opts.queue})),l}k.Animation=k.extend(dt,{tweeners:{"*":[function(e,t){var n=this.createTween(e,t);return le(n.elem,e,ne.exec(t),n),n}]},tweener:function(e,t){m(e)?(t=e,e=["*"]):e=e.match(R);for(var n,r=0,i=e.length;r<i;r++)n=e[r],dt.tweeners[n]=dt.tweeners[n]||[],dt.tweeners[n].unshift(t)},prefilters:[function(e,t,n){var r,i,o,a,s,u,l,c,f="width"in t||"height"in t,p=this,d={},h=e.style,g=e.nodeType&&se(e),v=Q.get(e,"fxshow");for(r in n.queue||(null==(a=k._queueHooks(e,"fx")).unqueued&&(a.unqueued=0,s=a.empty.fire,a.empty.fire=function(){a.unqueued||s()}),a.unqueued++,p.always(function(){p.always(function(){a.unqueued--,k.queue(e,"fx").length||a.empty.fire()})})),t)if(i=t[r],st.test(i)){if(delete t[r],o=o||"toggle"===i,i===(g?"hide":"show")){if("show"!==i||!v||void 0===v[r])continue;g=!0}d[r]=v&&v[r]||k.style(e,r)}if((u=!k.isEmptyObject(t))||!k.isEmptyObject(d))for(r in f&&1===e.nodeType&&(n.overflow=[h.overflow,h.overflowX,h.overflowY],null==(l=v&&v.display)&&(l=Q.get(e,"display")),"none"===(c=k.css(e,"display"))&&(l?c=l:(fe([e],!0),l=e.style.display||l,c=k.css(e,"display"),fe([e]))),("inline"===c||"inline-block"===c&&null!=l)&&"none"===k.css(e,"float")&&(u||(p.done(function(){h.display=l}),null==l&&(c=h.display,l="none"===c?"":c)),h.display="inline-block")),n.overflow&&(h.overflow="hidden",p.always(function(){h.overflow=n.overflow[0],h.overflowX=n.overflow[1],h.overflowY=n.overflow[2]})),u=!1,d)u||(v?"hidden"in v&&(g=v.hidden):v=Q.access(e,"fxshow",{display:l}),o&&(v.hidden=!g),g&&fe([e],!0),p.done(function(){for(r in g||fe([e]),Q.remove(e,"fxshow"),d)k.style(e,r,d[r])})),u=pt(g?v[r]:0,r,p),r in v||(v[r]=u.start,g&&(u.end=u.start,u.start=0))}],prefilter:function(e,t){t?dt.prefilters.unshift(e):dt.prefilters.push(e)}}),k.speed=function(e,t,n){var r=e&&"object"==typeof e?k.extend({},e):{complete:n||!n&&t||m(e)&&e,duration:e,easing:n&&t||t&&!m(t)&&t};return k.fx.off?r.duration=0:"number"!=typeof r.duration&&(r.duration in k.fx.speeds?r.duration=k.fx.speeds[r.duration]:r.duration=k.fx.speeds._default),null!=r.queue&&!0!==r.queue||(r.queue="fx"),r.old=r.complete,r.complete=function(){m(r.old)&&r.old.call(this),r.queue&&k.dequeue(this,r.queue)},r},k.fn.extend({fadeTo:function(e,t,n,r){return this.filter(se).css("opacity",0).show().end().animate({opacity:t},e,n,r)},animate:function(t,e,n,r){var i=k.isEmptyObject(t),o=k.speed(e,n,r),a=function(){var e=dt(this,k.extend({},t),o);(i||Q.get(this,"finish"))&&e.stop(!0)};return a.finish=a,i||!1===o.queue?this.each(a):this.queue(o.queue,a)},stop:function(i,e,o){var a=function(e){var t=e.stop;delete e.stop,t(o)};return"string"!=typeof i&&(o=e,e=i,i=void 0),e&&!1!==i&&this.queue(i||"fx",[]),this.each(function(){var e=!0,t=null!=i&&i+"queueHooks",n=k.timers,r=Q.get(this);if(t)r[t]&&r[t].stop&&a(r[t]);else for(t in r)r[t]&&r[t].stop&&ut.test(t)&&a(r[t]);for(t=n.length;t--;)n[t].elem!==this||null!=i&&n[t].queue!==i||(n[t].anim.stop(o),e=!1,n.splice(t,1));!e&&o||k.dequeue(this,i)})},finish:function(a){return!1!==a&&(a=a||"fx"),this.each(function(){var e,t=Q.get(this),n=t[a+"queue"],r=t[a+"queueHooks"],i=k.timers,o=n?n.length:0;for(t.finish=!0,k.queue(this,a,[]),r&&r.stop&&r.stop.call(this,!0),e=i.length;e--;)i[e].elem===this&&i[e].queue===a&&(i[e].anim.stop(!0),i.splice(e,1));for(e=0;e<o;e++)n[e]&&n[e].finish&&n[e].finish.call(this);delete t.finish})}}),k.each(["toggle","show","hide"],function(e,r){var i=k.fn[r];k.fn[r]=function(e,t,n){return null==e||"boolean"==typeof e?i.apply(this,arguments):this.animate(ft(r,!0),e,t,n)}}),k.each({slideDown:ft("show"),slideUp:ft("hide"),slideToggle:ft("toggle"),fadeIn:{opacity:"show"},fadeOut:{opacity:"hide"},fadeToggle:{opacity:"toggle"}},function(e,r){k.fn[e]=function(e,t,n){return this.animate(r,e,t,n)}}),k.timers=[],k.fx.tick=function(){var e,t=0,n=k.timers;for(rt=Date.now();t<n.length;t++)(e=n[t])()||n[t]!==e||n.splice(t--,1);n.length||k.fx.stop(),rt=void 0},k.fx.timer=function(e){k.timers.push(e),k.fx.start()},k.fx.interval=13,k.fx.start=function(){it||(it=!0,lt())},k.fx.stop=function(){it=null},k.fx.speeds={slow:600,fast:200,_default:400},k.fn.delay=function(r,e){return r=k.fx&&k.fx.speeds[r]||r,e=e||"fx",this.queue(e,function(e,t){var n=C.setTimeout(e,r);t.stop=function(){C.clearTimeout(n)}})},ot=E.createElement("input"),at=E.createElement("select").appendChild(E.createElement("option")),ot.type="checkbox",y.checkOn=""!==ot.value,y.optSelected=at.selected,(ot=E.createElement("input")).value="t",ot.type="radio",y.radioValue="t"===ot.value;var ht,gt=k.expr.attrHandle;k.fn.extend({attr:function(e,t){return _(this,k.attr,e,t,1<arguments.length)},removeAttr:function(e){return this.each(function(){k.removeAttr(this,e)})}}),k.extend({attr:function(e,t,n){var r,i,o=e.nodeType;if(3!==o&&8!==o&&2!==o)return"undefined"==typeof e.getAttribute?k.prop(e,t,n):(1===o&&k.isXMLDoc(e)||(i=k.attrHooks[t.toLowerCase()]||(k.expr.match.bool.test(t)?ht:void 0)),void 0!==n?null===n?void k.removeAttr(e,t):i&&"set"in i&&void 0!==(r=i.set(e,n,t))?r:(e.setAttribute(t,n+""),n):i&&"get"in i&&null!==(r=i.get(e,t))?r:null==(r=k.find.attr(e,t))?void 0:r)},attrHooks:{type:{set:function(e,t){if(!y.radioValue&&"radio"===t&&A(e,"input")){var n=e.value;return e.setAttribute("type",t),n&&(e.value=n),t}}}},removeAttr:function(e,t){var n,r=0,i=t&&t.match(R);if(i&&1===e.nodeType)while(n=i[r++])e.removeAttribute(n)}}),ht={set:function(e,t,n){return!1===t?k.removeAttr(e,n):e.setAttribute(n,n),n}},k.each(k.expr.match.bool.source.match(/\w+/g),function(e,t){var a=gt[t]||k.find.attr;gt[t]=function(e,t,n){var r,i,o=t.toLowerCase();return n||(i=gt[o],gt[o]=r,r=null!=a(e,t,n)?o:null,gt[o]=i),r}});var vt=/^(?:input|select|textarea|button)$/i,yt=/^(?:a|area)$/i;function mt(e){return(e.match(R)||[]).join(" ")}function xt(e){return e.getAttribute&&e.getAttribute("class")||""}function bt(e){return Array.isArray(e)?e:"string"==typeof e&&e.match(R)||[]}k.fn.extend({prop:function(e,t){return _(this,k.prop,e,t,1<arguments.length)},removeProp:function(e){return this.each(function(){delete this[k.propFix[e]||e]})}}),k.extend({prop:function(e,t,n){var r,i,o=e.nodeType;if(3!==o&&8!==o&&2!==o)return 1===o&&k.isXMLDoc(e)||(t=k.propFix[t]||t,i=k.propHooks[t]),void 0!==n?i&&"set"in i&&void 0!==(r=i.set(e,n,t))?r:e[t]=n:i&&"get"in i&&null!==(r=i.get(e,t))?r:e[t]},propHooks:{tabIndex:{get:function(e){var t=k.find.attr(e,"tabindex");return t?parseInt(t,10):vt.test(e.nodeName)||yt.test(e.nodeName)&&e.href?0:-1}}},propFix:{"for":"htmlFor","class":"className"}}),y.optSelected||(k.propHooks.selected={get:function(e){var t=e.parentNode;return t&&t.parentNode&&t.parentNode.selectedIndex,null},set:function(e){var t=e.parentNode;t&&(t.selectedIndex,t.parentNode&&t.parentNode.selectedIndex)}}),k.each(["tabIndex","readOnly","maxLength","cellSpacing","cellPadding","rowSpan","colSpan","useMap","frameBorder","contentEditable"],function(){k.propFix[this.toLowerCase()]=this}),k.fn.extend({addClass:function(t){var e,n,r,i,o,a,s,u=0;if(m(t))return this.each(function(e){k(this).addClass(t.call(this,e,xt(this)))});if((e=bt(t)).length)while(n=this[u++])if(i=xt(n),r=1===n.nodeType&&" "+mt(i)+" "){a=0;while(o=e[a++])r.indexOf(" "+o+" ")<0&&(r+=o+" ");i!==(s=mt(r))&&n.setAttribute("class",s)}return this},removeClass:function(t){var e,n,r,i,o,a,s,u=0;if(m(t))return this.each(function(e){k(this).removeClass(t.call(this,e,xt(this)))});if(!arguments.length)return this.attr("class","");if((e=bt(t)).length)while(n=this[u++])if(i=xt(n),r=1===n.nodeType&&" "+mt(i)+" "){a=0;while(o=e[a++])while(-1<r.indexOf(" "+o+" "))r=r.replace(" "+o+" "," ");i!==(s=mt(r))&&n.setAttribute("class",s)}return this},toggleClass:function(i,t){var o=typeof i,a="string"===o||Array.isArray(i);return"boolean"==typeof t&&a?t?this.addClass(i):this.removeClass(i):m(i)?this.each(function(e){k(this).toggleClass(i.call(this,e,xt(this),t),t)}):this.each(function(){var e,t,n,r;if(a){t=0,n=k(this),r=bt(i);while(e=r[t++])n.hasClass(e)?n.removeClass(e):n.addClass(e)}else void 0!==i&&"boolean"!==o||((e=xt(this))&&Q.set(this,"__className__",e),this.setAttribute&&this.setAttribute("class",e||!1===i?"":Q.get(this,"__className__")||""))})},hasClass:function(e){var t,n,r=0;t=" "+e+" ";while(n=this[r++])if(1===n.nodeType&&-1<(" "+mt(xt(n))+" ").indexOf(t))return!0;return!1}});var wt=/\r/g;k.fn.extend({val:function(n){var r,e,i,t=this[0];return arguments.length?(i=m(n),this.each(function(e){var t;1===this.nodeType&&(null==(t=i?n.call(this,e,k(this).val()):n)?t="":"number"==typeof t?t+="":Array.isArray(t)&&(t=k.map(t,function(e){return null==e?"":e+""})),(r=k.valHooks[this.type]||k.valHooks[this.nodeName.toLowerCase()])&&"set"in r&&void 0!==r.set(this,t,"value")||(this.value=t))})):t?(r=k.valHooks[t.type]||k.valHooks[t.nodeName.toLowerCase()])&&"get"in r&&void 0!==(e=r.get(t,"value"))?e:"string"==typeof(e=t.value)?e.replace(wt,""):null==e?"":e:void 0}}),k.extend({valHooks:{option:{get:function(e){var t=k.find.attr(e,"value");return null!=t?t:mt(k.text(e))}},select:{get:function(e){var t,n,r,i=e.options,o=e.selectedIndex,a="select-one"===e.type,s=a?null:[],u=a?o+1:i.length;for(r=o<0?u:a?o:0;r<u;r++)if(((n=i[r]).selected||r===o)&&!n.disabled&&(!n.parentNode.disabled||!A(n.parentNode,"optgroup"))){if(t=k(n).val(),a)return t;s.push(t)}return s},set:function(e,t){var n,r,i=e.options,o=k.makeArray(t),a=i.length;while(a--)((r=i[a]).selected=-1<k.inArray(k.valHooks.option.get(r),o))&&(n=!0);return n||(e.selectedIndex=-1),o}}}}),k.each(["radio","checkbox"],function(){k.valHooks[this]={set:function(e,t){if(Array.isArray(t))return e.checked=-1<k.inArray(k(e).val(),t)}},y.checkOn||(k.valHooks[this].get=function(e){return null===e.getAttribute("value")?"on":e.value})}),y.focusin="onfocusin"in C;var Tt=/^(?:focusinfocus|focusoutblur)$/,Ct=function(e){e.stopPropagation()};k.extend(k.event,{trigger:function(e,t,n,r){var i,o,a,s,u,l,c,f,p=[n||E],d=v.call(e,"type")?e.type:e,h=v.call(e,"namespace")?e.namespace.split("."):[];if(o=f=a=n=n||E,3!==n.nodeType&&8!==n.nodeType&&!Tt.test(d+k.event.triggered)&&(-1<d.indexOf(".")&&(d=(h=d.split(".")).shift(),h.sort()),u=d.indexOf(":")<0&&"on"+d,(e=e[k.expando]?e:new k.Event(d,"object"==typeof e&&e)).isTrigger=r?2:3,e.namespace=h.join("."),e.rnamespace=e.namespace?new RegExp("(^|\\.)"+h.join("\\.(?:.*\\.|)")+"(\\.|$)"):null,e.result=void 0,e.target||(e.target=n),t=null==t?[e]:k.makeArray(t,[e]),c=k.event.special[d]||{},r||!c.trigger||!1!==c.trigger.apply(n,t))){if(!r&&!c.noBubble&&!x(n)){for(s=c.delegateType||d,Tt.test(s+d)||(o=o.parentNode);o;o=o.parentNode)p.push(o),a=o;a===(n.ownerDocument||E)&&p.push(a.defaultView||a.parentWindow||C)}i=0;while((o=p[i++])&&!e.isPropagationStopped())f=o,e.type=1<i?s:c.bindType||d,(l=(Q.get(o,"events")||{})[e.type]&&Q.get(o,"handle"))&&l.apply(o,t),(l=u&&o[u])&&l.apply&&G(o)&&(e.result=l.apply(o,t),!1===e.result&&e.preventDefault());return e.type=d,r||e.isDefaultPrevented()||c._default&&!1!==c._default.apply(p.pop(),t)||!G(n)||u&&m(n[d])&&!x(n)&&((a=n[u])&&(n[u]=null),k.event.triggered=d,e.isPropagationStopped()&&f.addEventListener(d,Ct),n[d](),e.isPropagationStopped()&&f.removeEventListener(d,Ct),k.event.triggered=void 0,a&&(n[u]=a)),e.result}},simulate:function(e,t,n){var r=k.extend(new k.Event,n,{type:e,isSimulated:!0});k.event.trigger(r,null,t)}}),k.fn.extend({trigger:function(e,t){return this.each(function(){k.event.trigger(e,t,this)})},triggerHandler:function(e,t){var n=this[0];if(n)return k.event.trigger(e,t,n,!0)}}),y.focusin||k.each({focus:"focusin",blur:"focusout"},function(n,r){var i=function(e){k.event.simulate(r,e.target,k.event.fix(e))};k.event.special[r]={setup:function(){var e=this.ownerDocument||this,t=Q.access(e,r);t||e.addEventListener(n,i,!0),Q.access(e,r,(t||0)+1)},teardown:function(){var e=this.ownerDocument||this,t=Q.access(e,r)-1;t?Q.access(e,r,t):(e.removeEventListener(n,i,!0),Q.remove(e,r))}}});var Et=C.location,kt=Date.now(),St=/\?/;k.parseXML=function(e){var t;if(!e||"string"!=typeof e)return null;try{t=(new C.DOMParser).parseFromString(e,"text/xml")}catch(e){t=void 0}return t&&!t.getElementsByTagName("parsererror").length||k.error("Invalid XML: "+e),t};var Nt=/\[\]$/,At=/\r?\n/g,Dt=/^(?:submit|button|image|reset|file)$/i,jt=/^(?:input|select|textarea|keygen)/i;function qt(n,e,r,i){var t;if(Array.isArray(e))k.each(e,function(e,t){r||Nt.test(n)?i(n,t):qt(n+"["+("object"==typeof t&&null!=t?e:"")+"]",t,r,i)});else if(r||"object"!==w(e))i(n,e);else for(t in e)qt(n+"["+t+"]",e[t],r,i)}k.param=function(e,t){var n,r=[],i=function(e,t){var n=m(t)?t():t;r[r.length]=encodeURIComponent(e)+"="+encodeURIComponent(null==n?"":n)};if(null==e)return"";if(Array.isArray(e)||e.jquery&&!k.isPlainObject(e))k.each(e,function(){i(this.name,this.value)});else for(n in e)qt(n,e[n],t,i);return r.join("&")},k.fn.extend({serialize:function(){return k.param(this.serializeArray())},serializeArray:function(){return this.map(function(){var e=k.prop(this,"elements");return e?k.makeArray(e):this}).filter(function(){var e=this.type;return this.name&&!k(this).is(":disabled")&&jt.test(this.nodeName)&&!Dt.test(e)&&(this.checked||!pe.test(e))}).map(function(e,t){var n=k(this).val();return null==n?null:Array.isArray(n)?k.map(n,function(e){return{name:t.name,value:e.replace(At,"\r\n")}}):{name:t.name,value:n.replace(At,"\r\n")}}).get()}});var Lt=/%20/g,Ht=/#.*$/,Ot=/([?&])_=[^&]*/,Pt=/^(.*?):[ \t]*([^\r\n]*)$/gm,Rt=/^(?:GET|HEAD)$/,Mt=/^\/\//,It={},Wt={},$t="*/".concat("*"),Ft=E.createElement("a");function Bt(o){return function(e,t){"string"!=typeof e&&(t=e,e="*");var n,r=0,i=e.toLowerCase().match(R)||[];if(m(t))while(n=i[r++])"+"===n[0]?(n=n.slice(1)||"*",(o[n]=o[n]||[]).unshift(t)):(o[n]=o[n]||[]).push(t)}}function _t(t,i,o,a){var s={},u=t===Wt;function l(e){var r;return s[e]=!0,k.each(t[e]||[],function(e,t){var n=t(i,o,a);return"string"!=typeof n||u||s[n]?u?!(r=n):void 0:(i.dataTypes.unshift(n),l(n),!1)}),r}return l(i.dataTypes[0])||!s["*"]&&l("*")}function zt(e,t){var n,r,i=k.ajaxSettings.flatOptions||{};for(n in t)void 0!==t[n]&&((i[n]?e:r||(r={}))[n]=t[n]);return r&&k.extend(!0,e,r),e}Ft.href=Et.href,k.extend({active:0,lastModified:{},etag:{},ajaxSettings:{url:Et.href,type:"GET",isLocal:/^(?:about|app|app-storage|.+-extension|file|res|widget):$/.test(Et.protocol),global:!0,processData:!0,async:!0,contentType:"application/x-www-form-urlencoded; charset=UTF-8",accepts:{"*":$t,text:"text/plain",html:"text/html",xml:"application/xml, text/xml",json:"application/json, text/javascript"},contents:{xml:/\bxml\b/,html:/\bhtml/,json:/\bjson\b/},responseFields:{xml:"responseXML",text:"responseText",json:"responseJSON"},converters:{"* text":String,"text html":!0,"text json":JSON.parse,"text xml":k.parseXML},flatOptions:{url:!0,context:!0}},ajaxSetup:function(e,t){return t?zt(zt(e,k.ajaxSettings),t):zt(k.ajaxSettings,e)},ajaxPrefilter:Bt(It),ajaxTransport:Bt(Wt),ajax:function(e,t){"object"==typeof e&&(t=e,e=void 0),t=t||{};var c,f,p,n,d,r,h,g,i,o,v=k.ajaxSetup({},t),y=v.context||v,m=v.context&&(y.nodeType||y.jquery)?k(y):k.event,x=k.Deferred(),b=k.Callbacks("once memory"),w=v.statusCode||{},a={},s={},u="canceled",T={readyState:0,getResponseHeader:function(e){var t;if(h){if(!n){n={};while(t=Pt.exec(p))n[t[1].toLowerCase()+" "]=(n[t[1].toLowerCase()+" "]||[]).concat(t[2])}t=n[e.toLowerCase()+" "]}return null==t?null:t.join(", ")},getAllResponseHeaders:function(){return h?p:null},setRequestHeader:function(e,t){return null==h&&(e=s[e.toLowerCase()]=s[e.toLowerCase()]||e,a[e]=t),this},overrideMimeType:function(e){return null==h&&(v.mimeType=e),this},statusCode:function(e){var t;if(e)if(h)T.always(e[T.status]);else for(t in e)w[t]=[w[t],e[t]];return this},abort:function(e){var t=e||u;return c&&c.abort(t),l(0,t),this}};if(x.promise(T),v.url=((e||v.url||Et.href)+"").replace(Mt,Et.protocol+"//"),v.type=t.method||t.type||v.method||v.type,v.dataTypes=(v.dataType||"*").toLowerCase().match(R)||[""],null==v.crossDomain){r=E.createElement("a");try{r.href=v.url,r.href=r.href,v.crossDomain=Ft.protocol+"//"+Ft.host!=r.protocol+"//"+r.host}catch(e){v.crossDomain=!0}}if(v.data&&v.processData&&"string"!=typeof v.data&&(v.data=k.param(v.data,v.traditional)),_t(It,v,t,T),h)return T;for(i in(g=k.event&&v.global)&&0==k.active++&&k.event.trigger("ajaxStart"),v.type=v.type.toUpperCase(),v.hasContent=!Rt.test(v.type),f=v.url.replace(Ht,""),v.hasContent?v.data&&v.processData&&0===(v.contentType||"").indexOf("application/x-www-form-urlencoded")&&(v.data=v.data.replace(Lt,"+")):(o=v.url.slice(f.length),v.data&&(v.processData||"string"==typeof v.data)&&(f+=(St.test(f)?"&":"?")+v.data,delete v.data),!1===v.cache&&(f=f.replace(Ot,"$1"),o=(St.test(f)?"&":"?")+"_="+kt+++o),v.url=f+o),v.ifModified&&(k.lastModified[f]&&T.setRequestHeader("If-Modified-Since",k.lastModified[f]),k.etag[f]&&T.setRequestHeader("If-None-Match",k.etag[f])),(v.data&&v.hasContent&&!1!==v.contentType||t.contentType)&&T.setRequestHeader("Content-Type",v.contentType),T.setRequestHeader("Accept",v.dataTypes[0]&&v.accepts[v.dataTypes[0]]?v.accepts[v.dataTypes[0]]+("*"!==v.dataTypes[0]?", "+$t+"; q=0.01":""):v.accepts["*"]),v.headers)T.setRequestHeader(i,v.headers[i]);if(v.beforeSend&&(!1===v.beforeSend.call(y,T,v)||h))return T.abort();if(u="abort",b.add(v.complete),T.done(v.success),T.fail(v.error),c=_t(Wt,v,t,T)){if(T.readyState=1,g&&m.trigger("ajaxSend",[T,v]),h)return T;v.async&&0<v.timeout&&(d=C.setTimeout(function(){T.abort("timeout")},v.timeout));try{h=!1,c.send(a,l)}catch(e){if(h)throw e;l(-1,e)}}else l(-1,"No Transport");function l(e,t,n,r){var i,o,a,s,u,l=t;h||(h=!0,d&&C.clearTimeout(d),c=void 0,p=r||"",T.readyState=0<e?4:0,i=200<=e&&e<300||304===e,n&&(s=function(e,t,n){var r,i,o,a,s=e.contents,u=e.dataTypes;while("*"===u[0])u.shift(),void 0===r&&(r=e.mimeType||t.getResponseHeader("Content-Type"));if(r)for(i in s)if(s[i]&&s[i].test(r)){u.unshift(i);break}if(u[0]in n)o=u[0];else{for(i in n){if(!u[0]||e.converters[i+" "+u[0]]){o=i;break}a||(a=i)}o=o||a}if(o)return o!==u[0]&&u.unshift(o),n[o]}(v,T,n)),s=function(e,t,n,r){var i,o,a,s,u,l={},c=e.dataTypes.slice();if(c[1])for(a in e.converters)l[a.toLowerCase()]=e.converters[a];o=c.shift();while(o)if(e.responseFields[o]&&(n[e.responseFields[o]]=t),!u&&r&&e.dataFilter&&(t=e.dataFilter(t,e.dataType)),u=o,o=c.shift())if("*"===o)o=u;else if("*"!==u&&u!==o){if(!(a=l[u+" "+o]||l["* "+o]))for(i in l)if((s=i.split(" "))[1]===o&&(a=l[u+" "+s[0]]||l["* "+s[0]])){!0===a?a=l[i]:!0!==l[i]&&(o=s[0],c.unshift(s[1]));break}if(!0!==a)if(a&&e["throws"])t=a(t);else try{t=a(t)}catch(e){return{state:"parsererror",error:a?e:"No conversion from "+u+" to "+o}}}return{state:"success",data:t}}(v,s,T,i),i?(v.ifModified&&((u=T.getResponseHeader("Last-Modified"))&&(k.lastModified[f]=u),(u=T.getResponseHeader("etag"))&&(k.etag[f]=u)),204===e||"HEAD"===v.type?l="nocontent":304===e?l="notmodified":(l=s.state,o=s.data,i=!(a=s.error))):(a=l,!e&&l||(l="error",e<0&&(e=0))),T.status=e,T.statusText=(t||l)+"",i?x.resolveWith(y,[o,l,T]):x.rejectWith(y,[T,l,a]),T.statusCode(w),w=void 0,g&&m.trigger(i?"ajaxSuccess":"ajaxError",[T,v,i?o:a]),b.fireWith(y,[T,l]),g&&(m.trigger("ajaxComplete",[T,v]),--k.active||k.event.trigger("ajaxStop")))}return T},getJSON:function(e,t,n){return k.get(e,t,n,"json")},getScript:function(e,t){return k.get(e,void 0,t,"script")}}),k.each(["get","post"],function(e,i){k[i]=function(e,t,n,r){return m(t)&&(r=r||n,n=t,t=void 0),k.ajax(k.extend({url:e,type:i,dataType:r,data:t,success:n},k.isPlainObject(e)&&e))}}),k._evalUrl=function(e,t){return k.ajax({url:e,type:"GET",dataType:"script",cache:!0,async:!1,global:!1,converters:{"text script":function(){}},dataFilter:function(e){k.globalEval(e,t)}})},k.fn.extend({wrapAll:function(e){var t;return this[0]&&(m(e)&&(e=e.call(this[0])),t=k(e,this[0].ownerDocument).eq(0).clone(!0),this[0].parentNode&&t.insertBefore(this[0]),t.map(function(){var e=this;while(e.firstElementChild)e=e.firstElementChild;return e}).append(this)),this},wrapInner:function(n){return m(n)?this.each(function(e){k(this).wrapInner(n.call(this,e))}):this.each(function(){var e=k(this),t=e.contents();t.length?t.wrapAll(n):e.append(n)})},wrap:function(t){var n=m(t);return this.each(function(e){k(this).wrapAll(n?t.call(this,e):t)})},unwrap:function(e){return this.parent(e).not("body").each(function(){k(this).replaceWith(this.childNodes)}),this}}),k.expr.pseudos.hidden=function(e){return!k.expr.pseudos.visible(e)},k.expr.pseudos.visible=function(e){return!!(e.offsetWidth||e.offsetHeight||e.getClientRects().length)},k.ajaxSettings.xhr=function(){try{return new C.XMLHttpRequest}catch(e){}};var Ut={0:200,1223:204},Xt=k.ajaxSettings.xhr();y.cors=!!Xt&&"withCredentials"in Xt,y.ajax=Xt=!!Xt,k.ajaxTransport(function(i){var o,a;if(y.cors||Xt&&!i.crossDomain)return{send:function(e,t){var n,r=i.xhr();if(r.open(i.type,i.url,i.async,i.username,i.password),i.xhrFields)for(n in i.xhrFields)r[n]=i.xhrFields[n];for(n in i.mimeType&&r.overrideMimeType&&r.overrideMimeType(i.mimeType),i.crossDomain||e["X-Requested-With"]||(e["X-Requested-With"]="XMLHttpRequest"),e)r.setRequestHeader(n,e[n]);o=function(e){return function(){o&&(o=a=r.onload=r.onerror=r.onabort=r.ontimeout=r.onreadystatechange=null,"abort"===e?r.abort():"error"===e?"number"!=typeof r.status?t(0,"error"):t(r.status,r.statusText):t(Ut[r.status]||r.status,r.statusText,"text"!==(r.responseType||"text")||"string"!=typeof r.responseText?{binary:r.response}:{text:r.responseText},r.getAllResponseHeaders()))}},r.onload=o(),a=r.onerror=r.ontimeout=o("error"),void 0!==r.onabort?r.onabort=a:r.onreadystatechange=function(){4===r.readyState&&C.setTimeout(function(){o&&a()})},o=o("abort");try{r.send(i.hasContent&&i.data||null)}catch(e){if(o)throw e}},abort:function(){o&&o()}}}),k.ajaxPrefilter(function(e){e.crossDomain&&(e.contents.script=!1)}),k.ajaxSetup({accepts:{script:"text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"},contents:{script:/\b(?:java|ecma)script\b/},converters:{"text script":function(e){return k.globalEval(e),e}}}),k.ajaxPrefilter("script",function(e){void 0===e.cache&&(e.cache=!1),e.crossDomain&&(e.type="GET")}),k.ajaxTransport("script",function(n){var r,i;if(n.crossDomain||n.scriptAttrs)return{send:function(e,t){r=k("<script>").attr(n.scriptAttrs||{}).prop({charset:n.scriptCharset,src:n.url}).on("load error",i=function(e){r.remove(),i=null,e&&t("error"===e.type?404:200,e.type)}),E.head.appendChild(r[0])},abort:function(){i&&i()}}});var Vt,Gt=[],Yt=/(=)\?(?=&|$)|\?\?/;k.ajaxSetup({jsonp:"callback",jsonpCallback:function(){var e=Gt.pop()||k.expando+"_"+kt++;return this[e]=!0,e}}),k.ajaxPrefilter("json jsonp",function(e,t,n){var r,i,o,a=!1!==e.jsonp&&(Yt.test(e.url)?"url":"string"==typeof e.data&&0===(e.contentType||"").indexOf("application/x-www-form-urlencoded")&&Yt.test(e.data)&&"data");if(a||"jsonp"===e.dataTypes[0])return r=e.jsonpCallback=m(e.jsonpCallback)?e.jsonpCallback():e.jsonpCallback,a?e[a]=e[a].replace(Yt,"$1"+r):!1!==e.jsonp&&(e.url+=(St.test(e.url)?"&":"?")+e.jsonp+"="+r),e.converters["script json"]=function(){return o||k.error(r+" was not called"),o[0]},e.dataTypes[0]="json",i=C[r],C[r]=function(){o=arguments},n.always(function(){void 0===i?k(C).removeProp(r):C[r]=i,e[r]&&(e.jsonpCallback=t.jsonpCallback,Gt.push(r)),o&&m(i)&&i(o[0]),o=i=void 0}),"script"}),y.createHTMLDocument=((Vt=E.implementation.createHTMLDocument("").body).innerHTML="<form></form><form></form>",2===Vt.childNodes.length),k.parseHTML=function(e,t,n){return"string"!=typeof e?[]:("boolean"==typeof t&&(n=t,t=!1),t||(y.createHTMLDocument?((r=(t=E.implementation.createHTMLDocument("")).createElement("base")).href=E.location.href,t.head.appendChild(r)):t=E),o=!n&&[],(i=D.exec(e))?[t.createElement(i[1])]:(i=we([e],t,o),o&&o.length&&k(o).remove(),k.merge([],i.childNodes)));var r,i,o},k.fn.load=function(e,t,n){var r,i,o,a=this,s=e.indexOf(" ");return-1<s&&(r=mt(e.slice(s)),e=e.slice(0,s)),m(t)?(n=t,t=void 0):t&&"object"==typeof t&&(i="POST"),0<a.length&&k.ajax({url:e,type:i||"GET",dataType:"html",data:t}).done(function(e){o=arguments,a.html(r?k("<div>").append(k.parseHTML(e)).find(r):e)}).always(n&&function(e,t){a.each(function(){n.apply(this,o||[e.responseText,t,e])})}),this},k.each(["ajaxStart","ajaxStop","ajaxComplete","ajaxError","ajaxSuccess","ajaxSend"],function(e,t){k.fn[t]=function(e){return this.on(t,e)}}),k.expr.pseudos.animated=function(t){return k.grep(k.timers,function(e){return t===e.elem}).length},k.offset={setOffset:function(e,t,n){var r,i,o,a,s,u,l=k.css(e,"position"),c=k(e),f={};"static"===l&&(e.style.position="relative"),s=c.offset(),o=k.css(e,"top"),u=k.css(e,"left"),("absolute"===l||"fixed"===l)&&-1<(o+u).indexOf("auto")?(a=(r=c.position()).top,i=r.left):(a=parseFloat(o)||0,i=parseFloat(u)||0),m(t)&&(t=t.call(e,n,k.extend({},s))),null!=t.top&&(f.top=t.top-s.top+a),null!=t.left&&(f.left=t.left-s.left+i),"using"in t?t.using.call(e,f):c.css(f)}},k.fn.extend({offset:function(t){if(arguments.length)return void 0===t?this:this.each(function(e){k.offset.setOffset(this,t,e)});var e,n,r=this[0];return r?r.getClientRects().length?(e=r.getBoundingClientRect(),n=r.ownerDocument.defaultView,{top:e.top+n.pageYOffset,left:e.left+n.pageXOffset}):{top:0,left:0}:void 0},position:function(){if(this[0]){var e,t,n,r=this[0],i={top:0,left:0};if("fixed"===k.css(r,"position"))t=r.getBoundingClientRect();else{t=this.offset(),n=r.ownerDocument,e=r.offsetParent||n.documentElement;while(e&&(e===n.body||e===n.documentElement)&&"static"===k.css(e,"position"))e=e.parentNode;e&&e!==r&&1===e.nodeType&&((i=k(e).offset()).top+=k.css(e,"borderTopWidth",!0),i.left+=k.css(e,"borderLeftWidth",!0))}return{top:t.top-i.top-k.css(r,"marginTop",!0),left:t.left-i.left-k.css(r,"marginLeft",!0)}}},offsetParent:function(){return this.map(function(){var e=this.offsetParent;while(e&&"static"===k.css(e,"position"))e=e.offsetParent;return e||ie})}}),k.each({scrollLeft:"pageXOffset",scrollTop:"pageYOffset"},function(t,i){var o="pageYOffset"===i;k.fn[t]=function(e){return _(this,function(e,t,n){var r;if(x(e)?r=e:9===e.nodeType&&(r=e.defaultView),void 0===n)return r?r[i]:e[t];r?r.scrollTo(o?r.pageXOffset:n,o?n:r.pageYOffset):e[t]=n},t,e,arguments.length)}}),k.each(["top","left"],function(e,n){k.cssHooks[n]=ze(y.pixelPosition,function(e,t){if(t)return t=_e(e,n),$e.test(t)?k(e).position()[n]+"px":t})}),k.each({Height:"height",Width:"width"},function(a,s){k.each({padding:"inner"+a,content:s,"":"outer"+a},function(r,o){k.fn[o]=function(e,t){var n=arguments.length&&(r||"boolean"!=typeof e),i=r||(!0===e||!0===t?"margin":"border");return _(this,function(e,t,n){var r;return x(e)?0===o.indexOf("outer")?e["inner"+a]:e.document.documentElement["client"+a]:9===e.nodeType?(r=e.documentElement,Math.max(e.body["scroll"+a],r["scroll"+a],e.body["offset"+a],r["offset"+a],r["client"+a])):void 0===n?k.css(e,t,i):k.style(e,t,n,i)},s,n?e:void 0,n)}})}),k.each("blur focus focusin focusout resize scroll click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup contextmenu".split(" "),function(e,n){k.fn[n]=function(e,t){return 0<arguments.length?this.on(n,null,e,t):this.trigger(n)}}),k.fn.extend({hover:function(e,t){return this.mouseenter(e).mouseleave(t||e)}}),k.fn.extend({bind:function(e,t,n){return this.on(e,null,t,n)},unbind:function(e,t){return this.off(e,null,t)},delegate:function(e,t,n,r){return this.on(t,e,n,r)},undelegate:function(e,t,n){return 1===arguments.length?this.off(e,"**"):this.off(t,e||"**",n)}}),k.proxy=function(e,t){var n,r,i;if("string"==typeof t&&(n=e[t],t=e,e=n),m(e))return r=s.call(arguments,2),(i=function(){return e.apply(t||this,r.concat(s.call(arguments)))}).guid=e.guid=e.guid||k.guid++,i},k.holdReady=function(e){e?k.readyWait++:k.ready(!0)},k.isArray=Array.isArray,k.parseJSON=JSON.parse,k.nodeName=A,k.isFunction=m,k.isWindow=x,k.camelCase=V,k.type=w,k.now=Date.now,k.isNumeric=function(e){var t=k.type(e);return("number"===t||"string"===t)&&!isNaN(e-parseFloat(e))},"function"==typeof define&&define.amd&&define("jquery",[],function(){return k});var Qt=C.jQuery,Jt=C.$;return k.noConflict=function(e){return C.$===k&&(C.$=Jt),e&&C.jQuery===k&&(C.jQuery=Qt),k},e||(C.jQuery=C.$=k),k});
```

2. 在浏览器中输入下面的链接 `https://cdn.jsdelivr.net/gh/xiabo2/CDN@latest/fishes.js`，获得 fishes.js 文件中的内容，在 blog/themes/butterfly/source/js 目录下创建 fishes.js 文件，并写入上面在浏览器中获得的内容。

```js
fish();
function fish() {
    return (
      $("#footer-wrap").css({
        position: "absolute",
        "text-align": "center",
        top: 0,
        right: 0,
        left: 0,
        bottom: 0,
      }),
      $("footer").append(
        '<div class="container" id="jsi-flying-fish-container"></div>'
      ),
      $("body").append(
        '<script src="https://cdn.jsdelivr.net/gh/xiabo2/CDN@latest/fish.js"></script>'
      ),
      this
    );
  }
```

3. 修改 _config.butterfly.yml 文件中 inject 的 bottom 对它们的引用

```diff
   bottom:
+     - <script defer src="/js/jquery.min.js"></script>
-     - <script defer src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>   
+     - <script defer src="/js/fishes.js"></script>
-     - <script defer src="https://cdn.jsdelivr.net/gh/xiabo2/CDN@latest/fishes.js"></script>
```

4. 彩色的鱼：在浏览器中输入下面的链接 `https://uuuuu.cf/js/fishes.js`，获得 fishes.js 文件中的内容，在 blog/themes/butterfly/source/js 目录下创建 colorfishes.js 文件，并写入上面在浏览器中获得的内容。

```js
fish();
function fish() {
  return (
    $("footer").append(
      '<div class="container" id="jsi-flying-fish-container"></div>'
    ),
    $(".container").css({
      width: "100%",
      height: "160px",
      margin: 0,
      padding: 0,
    }),
    $("#footer-wrap").css({
      position: "absolute",
      "text-align": "center",
      top: 0,
      right: 0,
      left: 0,
      bottom: 0,
    }),
    this
  );
}
var RENDERER = {
  POINT_INTERVAL: 5,
  FISH_COUNT: 2,
  MAX_INTERVAL_COUNT: 50,
  INIT_HEIGHT_RATE: 0.5,
  THRESHOLD: 50,

  init: function () {
    this.setParameters();
    this.reconstructMethods();
    this.setup();
    this.bindEvent();
    this.render();
  },
  setParameters: function () {
    this.$window = $(window);
    this.$container = $("#jsi-flying-fish-container");
    this.$canvas = $("<canvas />");
    this.context = this.$canvas
      .appendTo(this.$container)
      .get(0)
      .getContext("2d");
    this.points = [];
    this.fishes = [];
    this.watchIds = [];
  },
  createSurfacePoints: function () {
    var count = Math.round(this.width / this.POINT_INTERVAL);
    this.pointInterval = this.width / (count - 1);
    this.points.push(new SURFACE_POINT(this, 0));

    for (var i = 1; i < count; i++) {
      var point = new SURFACE_POINT(this, i * this.pointInterval),
        previous = this.points[i - 1];

      point.setPreviousPoint(previous);
      previous.setNextPoint(point);
      this.points.push(point);
    }
  },
  reconstructMethods: function () {
    this.watchWindowSize = this.watchWindowSize.bind(this);
    this.jdugeToStopResize = this.jdugeToStopResize.bind(this);
    this.startEpicenter = this.startEpicenter.bind(this);
    this.moveEpicenter = this.moveEpicenter.bind(this);
    this.render = this.render.bind(this);
  },
  setup: function () {
    this.points.length = 0;
    this.fishes.length = 0;
    this.watchIds.length = 0;
    this.intervalCount = this.MAX_INTERVAL_COUNT;
    this.width = this.$container.width();
    this.height = this.$container.height();
    this.fishCount =
      (((this.FISH_COUNT * this.width) / 500) * this.height) / 500;
    this.$canvas.attr({ width: this.width, height: this.height });

    this.skyGradient = this.context.createLinearGradient(0, 0, 0, this.height);
    this.skyGradient.addColorStop(0, "hsl(180, 80%, 70%)");
    this.skyGradient.addColorStop(1, "hsl(180, 80%, 90%)");

    this.seaGradient = this.context.createLinearGradient(0, 0, 0, this.height);
    this.seaGradient.addColorStop(0, "hsl(180, 80%, 60%)");
    this.seaGradient.addColorStop(0.5, "hsl(180, 80%, 50%)");
    this.seaGradient.addColorStop(1, "hsl(210, 80%, 50%)");

    this.fishes.push(new FISH(this));
    this.createSurfacePoints();
  },
  watchWindowSize: function () {
    this.clearTimer();
    this.tmpWidth = this.$window.width();
    this.tmpHeight = this.$window.height();
    this.watchIds.push(setTimeout(this.jdugeToStopResize, this.WATCH_INTERVAL));
  },
  clearTimer: function () {
    while (this.watchIds.length > 0) {
      clearTimeout(this.watchIds.pop());
    }
  },
  jdugeToStopResize: function () {
    var width = this.$window.width(),
      height = this.$window.height(),
      stopped = width == this.tmpWidth && height == this.tmpHeight;

    this.tmpWidth = width;
    this.tmpHeight = height;

    if (stopped) {
      this.setup();
    }
  },
  bindEvent: function () {
    this.$window.on("resize", this.watchWindowSize);
    this.$container.on("mouseenter", this.startEpicenter);
    this.$container.on("mousemove", this.moveEpicenter);
  },
  getAxis: function (event) {
    var offset = this.$container.offset();

    return {
      x: event.clientX - offset.left + this.$window.scrollLeft(),
      y: event.clientY - offset.top + this.$window.scrollTop(),
    };
  },
  startEpicenter: function (event) {
    this.axis = this.getAxis(event);
  },
  moveEpicenter: function (event) {
    var axis = this.getAxis(event);

    if (!this.axis) {
      this.axis = axis;
    }
    this.generateEpicenter(axis.x, axis.y, axis.y - this.axis.y);
    this.axis = axis;
  },
  generateEpicenter: function (x, y, velocity) {
    if (
      y < this.height / 2 - this.THRESHOLD ||
      y > this.height / 2 + this.THRESHOLD
    ) {
      return;
    }
    var index = Math.round(x / this.pointInterval);

    if (index < 0 || index >= this.points.length) {
      return;
    }
    this.points[index].interfere(y, velocity);
  },
  controlStatus: function () {
    for (var i = 0, count = this.points.length; i < count; i++) {
      this.points[i].updateSelf();
    }
    for (var i = 0, count = this.points.length; i < count; i++) {
      this.points[i].updateNeighbors();
    }
    if (this.fishes.length < this.fishCount) {
      if (--this.intervalCount == 0) {
        this.intervalCount = this.MAX_INTERVAL_COUNT;
        this.fishes.push(new FISH(this));
      }
    }
  },
  render: function () {
    requestAnimationFrame(this.render);
    this.controlStatus();

    this.context.fillStyle = this.skyGradient;
    this.context.fillRect(0, 0, this.width, this.height);
    this.context.fillStyle = this.seaGradient;
    this.context.beginPath();
    this.context.moveTo(0, this.height);

    for (var i = 0, count = this.points.length; i < count; i++) {
      this.points[i].render(this.context);
    }
    this.context.lineTo(this.width, this.height);
    this.context.closePath();
    this.context.fill();

    for (var i = 0, count = this.fishes.length; i < count; i++) {
      this.fishes[i].render(this.context);
    }
  },
};
var SURFACE_POINT = function (renderer, x) {
  this.renderer = renderer;
  this.x = x;
  this.init();
};
SURFACE_POINT.prototype = {
  SPRING_CONSTANT: 0.03,
  SPRING_FRICTION: 0.9,
  WAVE_SPREAD: 0.3,
  ACCELARATION_RATE: 0.01,

  init: function () {
    this.initHeight = this.renderer.height * this.renderer.INIT_HEIGHT_RATE;
    this.height = this.initHeight;
    this.fy = 0;
    this.force = { previous: 0, next: 0 };
  },
  setPreviousPoint: function (previous) {
    this.previous = previous;
  },
  setNextPoint: function (next) {
    this.next = next;
  },
  interfere: function (y, velocity) {
    this.fy =
      this.renderer.height *
      this.ACCELARATION_RATE *
      (this.renderer.height - this.height - y >= 0 ? -1 : 1) *
      Math.abs(velocity);
  },
  updateSelf: function () {
    this.fy += this.SPRING_CONSTANT * (this.initHeight - this.height);
    this.fy *= this.SPRING_FRICTION;
    this.height += this.fy;
  },
  updateNeighbors: function () {
    if (this.previous) {
      this.force.previous =
        this.WAVE_SPREAD * (this.height - this.previous.height);
    }
    if (this.next) {
      this.force.next = this.WAVE_SPREAD * (this.height - this.next.height);
    }
  },
  render: function (context) {
    if (this.previous) {
      this.previous.height += this.force.previous;
      this.previous.fy += this.force.previous;
    }
    if (this.next) {
      this.next.height += this.force.next;
      this.next.fy += this.force.next;
    }
    context.lineTo(this.x, this.renderer.height - this.height);
  },
};
var FISH = function (renderer) {
  this.renderer = renderer;
  this.init();
};
FISH.prototype = {
  GRAVITY: 0.4,

  init: function () {
    this.direction = Math.random() < 0.5;
    this.x = this.direction
      ? this.renderer.width + this.renderer.THRESHOLD
      : -this.renderer.THRESHOLD;
    this.y = this.getRandomValue(
      (this.renderer.height * 6) / 10,
      (this.renderer.height * 9) / 10
    );
    this.previousY = this.y;
    this.vx = this.getRandomValue(4, 10) * (this.direction ? -1 : 1);
    this.vy = this.getRandomValue(-5, -2);
    this.ay = this.getRandomValue(-0.2, -0.05);
    this.theta = 0;
    this.phi = 0;
    this.isOut = false;
  },
  getRandomValue: function (min, max) {
    return min + (max - min) * Math.random();
  },
  controlStatus: function (context) {
    this.previousY = this.y;
    this.x += this.vx;
    this.y += this.vy;
    this.vy += this.ay;

    if (this.y < this.renderer.height * this.renderer.INIT_HEIGHT_RATE) {
      this.vy += this.GRAVITY;
      this.isOut = true;
    } else {
      if (this.isOut) {
        this.ay = this.getRandomValue(-0.2, -0.05);
      }
      this.isOut = false;
    }
    if (!this.isOut) {
      this.theta += Math.PI / 20;
      this.theta %= Math.PI * 2;
      this.phi += Math.PI / 30;
      this.phi %= Math.PI * 2;
    }
    this.renderer.generateEpicenter(
      this.x + (this.direction ? -1 : 1) * this.renderer.THRESHOLD,
      this.y,
      this.y - this.previousY
    );

    if (
      (this.vx > 0 && this.x > this.renderer.width + this.renderer.THRESHOLD) ||
      (this.vx < 0 && this.x < -this.renderer.THRESHOLD)
    ) {
      this.init();
    }
  },
  render: function (context) {
    context.save();
    context.translate(this.x, this.y);
    context.rotate(Math.PI + Math.atan2(this.vy, this.vx));
    context.scale(1, this.direction ? 1 : -1);

    context.fillStyle = "hsl(180, 30%, 80%)";
    context.beginPath();
    context.moveTo(-30, 0);
    context.bezierCurveTo(-20, 15, 15, 10, 40, 0);
    context.bezierCurveTo(15, -10, -20, -15, -30, 0);
    context.fill();

    context.save();
    context.translate(40, 0);
    context.scale(0.9 + 0.2 * Math.sin(this.theta), 1);
    context.fillStyle = "hsl(180, 30%, 80%)";
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
    context.rotate(Math.PI / 3 + (Math.PI / 10) * Math.sin(this.phi));
    context.fillStyle = "hsl(220, 80%, 40%)";
    context.beginPath();
    context.moveTo(-5, 0);
    context.bezierCurveTo(-10, -10, -10, -30, 0, -40);
    context.bezierCurveTo(12, -25, 8, -10, 0, 0);
    context.closePath();
    context.fill();
    context.restore();

    context.strokeStyle = "hsl(220, 80%, 40%)";
    context.beginPath();
    context.arc(-15, -3, 5, 0, Math.PI * 2, false);
    context.stroke();

    context.fillStyle = "hsl(220, 80%, 40%)";
    context.beginPath();
    context.arc(-15, -3, 3, 0, Math.PI * 2, false);
    context.fill();
    context.restore();

    this.controlStatus(context);
  },
};
$(function () {
  RENDERER.init();
});
```

3. 修改 _config.butterfly.yml 文件中 inject 的 bottom 对它们的引用

```diff
   bottom:
-     - <script defer src="https://uuuuu.cf/js/fishes.js"></script>
+     - <script defer src="/js/colorfishes.js"></script> # 页脚养鱼(彩色)    
```

#### 樱花动态效果背景

由于樱花动态效果背景并不是基于 jsDelivr 的，因此不用修改。

#### 动态线条效果背景

这个魔改其实不是基于 jsDelivr，因此可以不用修改，而且 Butterfly 主题已经内嵌动态线条效果背景，已经不需要自己加入动态线条效果背景了。

1. 在浏览器中输入下面的链接 `https://cdn.bootcss.com/canvas-nest.js/1.0.0/canvas-nest.min.js`，获得 canvas-nest.min.js 文件中的内容，在 blog/themes/butterfly/source/js 目录下创建 canvas-nest.min.js 文件，并写入上面在浏览器中获得的内容。

```js
!function(){function o(w,v,i){return w.getAttribute(v)||i}function j(i){return document.getElementsByTagName(i)}function l(){var i=j("script"),w=i.length,v=i[w-1];return{l:w,z:o(v,"zIndex",-1),o:o(v,"opacity",0.5),c:o(v,"color","0,0,0"),n:o(v,"count",99)}}function k(){r=u.width=window.innerWidth||document.documentElement.clientWidth||document.body.clientWidth,n=u.height=window.innerHeight||document.documentElement.clientHeight||document.body.clientHeight}function b(){e.clearRect(0,0,r,n);var w=[f].concat(t);var x,v,A,B,z,y;t.forEach(function(i){i.x+=i.xa,i.y+=i.ya,i.xa*=i.x>r||i.x<0?-1:1,i.ya*=i.y>n||i.y<0?-1:1,e.fillRect(i.x-0.5,i.y-0.5,1,1);for(v=0;v<w.length;v++){x=w[v];if(i!==x&&null!==x.x&&null!==x.y){B=i.x-x.x,z=i.y-x.y,y=B*B+z*z;y<x.max&&(x===f&&y>=x.max/2&&(i.x-=0.03*B,i.y-=0.03*z),A=(x.max-y)/x.max,e.beginPath(),e.lineWidth=A/2,e.strokeStyle="rgba("+s.c+","+(A+0.2)+")",e.moveTo(i.x,i.y),e.lineTo(x.x,x.y),e.stroke())}}w.splice(w.indexOf(i),1)}),m(b)}var u=document.createElement("canvas"),s=l(),c="c_n"+s.l,e=u.getContext("2d"),r,n,m=window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||window.oRequestAnimationFrame||window.msRequestAnimationFrame||function(i){window.setTimeout(i,1000/45)},a=Math.random,f={x:null,y:null,max:20000};u.id=c;u.style.cssText="position:fixed;top:0;left:0;z-index:"+s.z+";opacity:"+s.o;j("body")[0].appendChild(u);k(),window.onresize=k;window.onmousemove=function(i){i=i||window.event,f.x=i.clientX,f.y=i.clientY},window.onmouseout=function(){f.x=null,f.y=null};for(var t=[],p=0;s.n>p;p++){var h=a()*r,g=a()*n,q=2*a()-1,d=2*a()-1;t.push({x:h,y:g,xa:q,ya:d,max:6000})}setTimeout(function(){b()},100)}();
```

2. 修改 _config.butterfly.yml 文件的 inject 的 bottom 处

```diff
   bottom:
-     - <script defer src="https://cdn.bootcss.com/canvas-nest.js/1.0.0/canvas-nest.min.js"></script> # 背景动态线条
+     - <script defer src="/js/canvas-nest.min.js"></script>
```

#### 文章页透明效果

它并不依赖于 jsDelivr，因此并不需要修改。

#### 雪花动态效果背景

它并不依赖于 jsDelivr，因此并不需要修改。

#### 小标题旋转风车

它并不依赖于 jsDelivr，因此并不需要修改。

#### 公告栏计时器

它并不依赖于 jsDelivr，因此并不需要修改。

#### 页脚美化

它并不依赖于 jsDelivr，因此并不需要修改。

#### 水波荡漾效果

由于之前已经引用了 jquery.min.js 了，因此水波荡漾效果就需要引用 jquery.min,js 了。

打开浏览器访问 `https://cdn.jsdelivr.net/gh/sirxemic/jquery.ripples/dist/jquery.ripples.js` 获取 jquery.ripples.js 文件中的内容，在 blog/themes/butterfly/source/js 目录下创建 jquery.ripples.js 文件，并写入上面获得内容

```js
/**
 * jQuery Ripples plugin v0.6.3 / https://github.com/sirxemic/jquery.ripples
 * MIT License
 * @author sirxemic / https://sirxemic.com/
 */

(function (global, factory) {
	typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('jquery')) :
	typeof define === 'function' && define.amd ? define(['jquery'], factory) :
	(factory(global.$));
}(this, (function ($) { 'use strict';

$ = $ && 'default' in $ ? $['default'] : $;

var gl;
var $window = $(window); // There is only one window, so why not cache the jQuery-wrapped window?

function isPercentage(str) {
	return str[str.length - 1] == '%';
}

/**
 *  Load a configuration of GL settings which the browser supports.
 *  For example:
 *  - not all browsers support WebGL
 *  - not all browsers support floating point textures
 *  - not all browsers support linear filtering for floating point textures
 *  - not all browsers support rendering to floating point textures
 *  - some browsers *do* support rendering to half-floating point textures instead.
 */
function loadConfig() {
	var canvas = document.createElement('canvas');
	gl = canvas.getContext('webgl') || canvas.getContext('experimental-webgl');

	if (!gl) {
		// Browser does not support WebGL.
		return null;
	}

	// Load extensions
	var extensions = {};
	[
		'OES_texture_float',
		'OES_texture_half_float',
		'OES_texture_float_linear',
		'OES_texture_half_float_linear'
	].forEach(function(name) {
		var extension = gl.getExtension(name);
		if (extension) {
			extensions[name] = extension;
		}
	});

	// If no floating point extensions are supported we can bail out early.
	if (!extensions.OES_texture_float) {
		return null;
	}

	var configs = [];

	function createConfig(type, glType, arrayType) {
		var name = 'OES_texture_' + type,
				nameLinear = name + '_linear',
				linearSupport = nameLinear in extensions,
				configExtensions = [name];

		if (linearSupport) {
			configExtensions.push(nameLinear);
		}

		return {
			type: glType,
			arrayType: arrayType,
			linearSupport: linearSupport,
			extensions: configExtensions
		};
	}

	configs.push(
		createConfig('float', gl.FLOAT, Float32Array)
	);

	if (extensions.OES_texture_half_float) {
		configs.push(
			// Array type should be Uint16Array, but at least on iOS that breaks. In that case we
			// just initialize the textures with data=null, instead of data=new Uint16Array(...).
			// This makes initialization a tad slower, but it's still negligible.
			createConfig('half_float', extensions.OES_texture_half_float.HALF_FLOAT_OES, null)
		);
	}

	// Setup the texture and framebuffer
	var texture = gl.createTexture();
	var framebuffer = gl.createFramebuffer();

	gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);
	gl.bindTexture(gl.TEXTURE_2D, texture);
	gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST);
	gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST);
	gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE);
	gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE);

	// Check for each supported texture type if rendering to it is supported
	var config = null;

	for (var i = 0; i < configs.length; i++) {
		gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 32, 32, 0, gl.RGBA, configs[i].type, null);

		gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, texture, 0);
		if (gl.checkFramebufferStatus(gl.FRAMEBUFFER) === gl.FRAMEBUFFER_COMPLETE) {
			config = configs[i];
			break;
		}
	}

	return config;
}

function createImageData(width, height) {
	try {
		return new ImageData(width, height);
	}
	catch (e) {
		// Fallback for IE
		var canvas = document.createElement('canvas');
		return canvas.getContext('2d').createImageData(width, height);
	}
}

function translateBackgroundPosition(value) {
	var parts = value.split(' ');

	if (parts.length === 1) {
		switch (value) {
			case 'center':
				return ['50%', '50%'];
			case 'top':
				return ['50%', '0'];
			case 'bottom':
				return ['50%', '100%'];
			case 'left':
				return ['0', '50%'];
			case 'right':
				return ['100%', '50%'];
			default:
				return [value, '50%'];
		}
	}
	else {
		return parts.map(function(part) {
			switch (value) {
				case 'center':
					return '50%';
				case 'top':
				case 'left':
					return '0';
				case 'right':
				case 'bottom':
					return '100%';
				default:
					return part;
			}
		});
	}
}

function createProgram(vertexSource, fragmentSource, uniformValues) {
	function compileSource(type, source) {
		var shader = gl.createShader(type);
		gl.shaderSource(shader, source);
		gl.compileShader(shader);
		if (!gl.getShaderParameter(shader, gl.COMPILE_STATUS)) {
			throw new Error('compile error: ' + gl.getShaderInfoLog(shader));
		}
		return shader;
	}

	var program = {};

	program.id = gl.createProgram();
	gl.attachShader(program.id, compileSource(gl.VERTEX_SHADER, vertexSource));
	gl.attachShader(program.id, compileSource(gl.FRAGMENT_SHADER, fragmentSource));
	gl.linkProgram(program.id);
	if (!gl.getProgramParameter(program.id, gl.LINK_STATUS)) {
		throw new Error('link error: ' + gl.getProgramInfoLog(program.id));
	}

	// Fetch the uniform and attribute locations
	program.uniforms = {};
	program.locations = {};
	gl.useProgram(program.id);
	gl.enableVertexAttribArray(0);
	var match, name, regex = /uniform (\w+) (\w+)/g, shaderCode = vertexSource + fragmentSource;
	while ((match = regex.exec(shaderCode)) != null) {
		name = match[2];
		program.locations[name] = gl.getUniformLocation(program.id, name);
	}

	return program;
}

function bindTexture(texture, unit) {
	gl.activeTexture(gl.TEXTURE0 + (unit || 0));
	gl.bindTexture(gl.TEXTURE_2D, texture);
}

function extractUrl(value) {
	var urlMatch = /url\(["']?([^"']*)["']?\)/.exec(value);
	if (urlMatch == null) {
		return null;
	}

	return urlMatch[1];
}

function isDataUri(url) {
	return url.match(/^data:/);
}

var config = loadConfig();
var transparentPixels = createImageData(32, 32);

// Extend the css
$('head').prepend('<style>.jquery-ripples { position: relative; z-index: 0; }</style>');

// RIPPLES CLASS DEFINITION
// =========================

var Ripples = function (el, options) {
	var that = this;

	this.$el = $(el);

	// Init properties from options
	this.interactive = options.interactive;
	this.resolution = options.resolution;
	this.textureDelta = new Float32Array([1 / this.resolution, 1 / this.resolution]);

	this.perturbance = options.perturbance;
	this.dropRadius = options.dropRadius;

	this.crossOrigin = options.crossOrigin;
	this.imageUrl = options.imageUrl;

	// Init WebGL canvas
	var canvas = document.createElement('canvas');
	canvas.width = this.$el.innerWidth();
	canvas.height = this.$el.innerHeight();
	this.canvas = canvas;
	this.$canvas = $(canvas);
	this.$canvas.css({
		position: 'absolute',
		left: 0,
		top: 0,
		right: 0,
		bottom: 0,
		zIndex: -1
	});

	this.$el.addClass('jquery-ripples').append(canvas);
	this.context = gl = canvas.getContext('webgl') || canvas.getContext('experimental-webgl');

	// Load extensions
	config.extensions.forEach(function(name) {
		gl.getExtension(name);
	});

	// Auto-resize when window size changes.
	this.updateSize = this.updateSize.bind(this);
	$(window).on('resize', this.updateSize);

	// Init rendertargets for ripple data.
	this.textures = [];
	this.framebuffers = [];
	this.bufferWriteIndex = 0;
	this.bufferReadIndex = 1;

	var arrayType = config.arrayType;
	var textureData = arrayType ? new arrayType(this.resolution * this.resolution * 4) : null;

	for (var i = 0; i < 2; i++) {
		var texture = gl.createTexture();
		var framebuffer = gl.createFramebuffer();

		gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);

		gl.bindTexture(gl.TEXTURE_2D, texture);
		gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, config.linearSupport ? gl.LINEAR : gl.NEAREST);
		gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, config.linearSupport ? gl.LINEAR : gl.NEAREST);
		gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE);
		gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE);
		gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, this.resolution, this.resolution, 0, gl.RGBA, config.type, textureData);

		gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, texture, 0);

		this.textures.push(texture);
		this.framebuffers.push(framebuffer);
	}

	// Init GL stuff
	this.quad = gl.createBuffer();
	gl.bindBuffer(gl.ARRAY_BUFFER, this.quad);
	gl.bufferData(gl.ARRAY_BUFFER, new Float32Array([
		-1, -1,
		+1, -1,
		+1, +1,
		-1, +1
	]), gl.STATIC_DRAW);

	this.initShaders();
	this.initTexture();
	this.setTransparentTexture();

	// Load the image either from the options or CSS rules
	this.loadImage();

	// Set correct clear color and blend mode (regular alpha blending)
	gl.clearColor(0, 0, 0, 0);
	gl.blendFunc(gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA);

	// Plugin is successfully initialized!
	this.visible = true;
	this.running = true;
	this.inited = true;
	this.destroyed = false;

	this.setupPointerEvents();

	// Init animation
	function step() {
		if (!that.destroyed) {
			that.step();

			requestAnimationFrame(step);
		}
	}

	requestAnimationFrame(step);
};

Ripples.DEFAULTS = {
	imageUrl: null,
	resolution: 256,
	dropRadius: 20,
	perturbance: 0.03,
	interactive: true,
	crossOrigin: ''
};

Ripples.prototype = {

	// Set up pointer (mouse + touch) events
	setupPointerEvents: function() {
		var that = this;

		function pointerEventsEnabled() {
			return that.visible && that.running && that.interactive;
		}

		function dropAtPointer(pointer, big) {
			if (pointerEventsEnabled()) {
				that.dropAtPointer(
					pointer,
					that.dropRadius * (big ? 1.5 : 1),
					(big ? 0.14 : 0.01)
				);
			}
		}

		// Start listening to pointer events
		this.$el

			// Create regular, small ripples for mouse move and touch events...
			.on('mousemove.ripples', function(e) {
				dropAtPointer(e);
			})
			.on('touchmove.ripples touchstart.ripples', function(e) {
				var touches = e.originalEvent.changedTouches;
				for (var i = 0; i < touches.length; i++) {
					dropAtPointer(touches[i]);
				}
			})

			// ...and only a big ripple on mouse down events.
			.on('mousedown.ripples', function(e) {
				dropAtPointer(e, true);
			});
	},

	// Load the image either from the options or the element's CSS rules.
	loadImage: function() {
		var that = this;

		gl = this.context;

		var newImageSource = this.imageUrl ||
			extractUrl(this.originalCssBackgroundImage) ||
			extractUrl(this.$el.css('backgroundImage'));

		// If image source is unchanged, don't reload it.
		if (newImageSource == this.imageSource) {
			return;
		}

		this.imageSource = newImageSource;

		// Falsy source means no background.
		if (!this.imageSource) {
			this.setTransparentTexture();
			return;
		}

		// Load the texture from a new image.
		var image = new Image;
		image.onload = function() {
			gl = that.context;

			// Only textures with dimensions of powers of two can have repeat wrapping.
			function isPowerOfTwo(x) {
				return (x & (x - 1)) == 0;
			}

			var wrapping = (isPowerOfTwo(image.width) && isPowerOfTwo(image.height)) ? gl.REPEAT : gl.CLAMP_TO_EDGE;

			gl.bindTexture(gl.TEXTURE_2D, that.backgroundTexture);
			gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, wrapping);
			gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, wrapping);
			gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, image);

			that.backgroundWidth = image.width;
			that.backgroundHeight = image.height;

			// Hide the background that we're replacing.
			that.hideCssBackground();
		};

		// Fall back to a transparent texture when loading the image failed.
		image.onerror = function() {
			gl = that.context;

			that.setTransparentTexture();
		};

		// Disable CORS when the image source is a data URI.
		image.crossOrigin = isDataUri(this.imageSource) ? null : this.crossOrigin;

		image.src = this.imageSource;
	},

	step: function() {
		gl = this.context;

		if (!this.visible) {
			return;
		}

		this.computeTextureBoundaries();

		if (this.running) {
			this.update();
		}

		this.render();
	},

	drawQuad: function() {
		gl.bindBuffer(gl.ARRAY_BUFFER, this.quad);
		gl.vertexAttribPointer(0, 2, gl.FLOAT, false, 0, 0);
		gl.drawArrays(gl.TRIANGLE_FAN, 0, 4);
	},

	render: function() {
		gl.bindFramebuffer(gl.FRAMEBUFFER, null);

		gl.viewport(0, 0, this.canvas.width, this.canvas.height);

		gl.enable(gl.BLEND);
		gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);

		gl.useProgram(this.renderProgram.id);

		bindTexture(this.backgroundTexture, 0);
		bindTexture(this.textures[0], 1);

		gl.uniform1f(this.renderProgram.locations.perturbance, this.perturbance);
		gl.uniform2fv(this.renderProgram.locations.topLeft, this.renderProgram.uniforms.topLeft);
		gl.uniform2fv(this.renderProgram.locations.bottomRight, this.renderProgram.uniforms.bottomRight);
		gl.uniform2fv(this.renderProgram.locations.containerRatio, this.renderProgram.uniforms.containerRatio);
		gl.uniform1i(this.renderProgram.locations.samplerBackground, 0);
		gl.uniform1i(this.renderProgram.locations.samplerRipples, 1);

		this.drawQuad();
		gl.disable(gl.BLEND);
	},

	update: function() {
		gl.viewport(0, 0, this.resolution, this.resolution);

		gl.bindFramebuffer(gl.FRAMEBUFFER, this.framebuffers[this.bufferWriteIndex]);
		bindTexture(this.textures[this.bufferReadIndex]);
		gl.useProgram(this.updateProgram.id);

		this.drawQuad();

		this.swapBufferIndices();
	},

	swapBufferIndices: function() {
		this.bufferWriteIndex = 1 - this.bufferWriteIndex;
		this.bufferReadIndex = 1 - this.bufferReadIndex;
	},

	computeTextureBoundaries: function() {
		var backgroundSize = this.$el.css('background-size');
		var backgroundAttachment = this.$el.css('background-attachment');
		var backgroundPosition = translateBackgroundPosition(this.$el.css('background-position'));

		// Here the 'container' is the element which the background adapts to
		// (either the chrome window or some element, depending on attachment)
		var container;
		if (backgroundAttachment == 'fixed') {
			container = { left: window.pageXOffset, top: window.pageYOffset };
			container.width = $window.width();
			container.height = $window.height();
		}
		else {
			container = this.$el.offset();
			container.width = this.$el.innerWidth();
			container.height = this.$el.innerHeight();
		}

		// TODO: background-clip
		if (backgroundSize == 'cover') {
			var scale = Math.max(container.width / this.backgroundWidth, container.height / this.backgroundHeight);

			var backgroundWidth = this.backgroundWidth * scale;
			var backgroundHeight = this.backgroundHeight * scale;
		}
		else if (backgroundSize == 'contain') {
			var scale = Math.min(container.width / this.backgroundWidth, container.height / this.backgroundHeight);

			var backgroundWidth = this.backgroundWidth * scale;
			var backgroundHeight = this.backgroundHeight * scale;
		}
		else {
			backgroundSize = backgroundSize.split(' ');
			var backgroundWidth = backgroundSize[0] || '';
			var backgroundHeight = backgroundSize[1] || backgroundWidth;

			if (isPercentage(backgroundWidth)) {
				backgroundWidth = container.width * parseFloat(backgroundWidth) / 100;
			}
			else if (backgroundWidth != 'auto') {
				backgroundWidth = parseFloat(backgroundWidth);
			}

			if (isPercentage(backgroundHeight)) {
				backgroundHeight = container.height * parseFloat(backgroundHeight) / 100;
			}
			else if (backgroundHeight != 'auto') {
				backgroundHeight = parseFloat(backgroundHeight);
			}

			if (backgroundWidth == 'auto' && backgroundHeight == 'auto') {
				backgroundWidth = this.backgroundWidth;
				backgroundHeight = this.backgroundHeight;
			}
			else {
				if (backgroundWidth == 'auto') {
					backgroundWidth = this.backgroundWidth * (backgroundHeight / this.backgroundHeight);
				}

				if (backgroundHeight == 'auto') {
					backgroundHeight = this.backgroundHeight * (backgroundWidth / this.backgroundWidth);
				}
			}
		}

		// Compute backgroundX and backgroundY in page coordinates
		var backgroundX = backgroundPosition[0];
		var backgroundY = backgroundPosition[1];

		if (isPercentage(backgroundX)) {
			backgroundX = container.left + (container.width - backgroundWidth) * parseFloat(backgroundX) / 100;
		}
		else {
			backgroundX = container.left + parseFloat(backgroundX);
		}

		if (isPercentage(backgroundY)) {
			backgroundY = container.top + (container.height - backgroundHeight) * parseFloat(backgroundY) / 100;
		}
		else {
			backgroundY = container.top + parseFloat(backgroundY);
		}

		var elementOffset = this.$el.offset();

		this.renderProgram.uniforms.topLeft = new Float32Array([
			(elementOffset.left - backgroundX) / backgroundWidth,
			(elementOffset.top - backgroundY) / backgroundHeight
		]);
		this.renderProgram.uniforms.bottomRight = new Float32Array([
			this.renderProgram.uniforms.topLeft[0] + this.$el.innerWidth() / backgroundWidth,
			this.renderProgram.uniforms.topLeft[1] + this.$el.innerHeight() / backgroundHeight
		]);

		var maxSide = Math.max(this.canvas.width, this.canvas.height);

		this.renderProgram.uniforms.containerRatio = new Float32Array([
			this.canvas.width / maxSide,
			this.canvas.height / maxSide
		]);
	},

	initShaders: function() {
		var vertexShader = [
			'attribute vec2 vertex;',
			'varying vec2 coord;',
			'void main() {',
				'coord = vertex * 0.5 + 0.5;',
				'gl_Position = vec4(vertex, 0.0, 1.0);',
			'}'
		].join('\n');

		this.dropProgram = createProgram(vertexShader, [
			'precision highp float;',

			'const float PI = 3.141592653589793;',
			'uniform sampler2D texture;',
			'uniform vec2 center;',
			'uniform float radius;',
			'uniform float strength;',

			'varying vec2 coord;',

			'void main() {',
				'vec4 info = texture2D(texture, coord);',

				'float drop = max(0.0, 1.0 - length(center * 0.5 + 0.5 - coord) / radius);',
				'drop = 0.5 - cos(drop * PI) * 0.5;',

				'info.r += drop * strength;',

				'gl_FragColor = info;',
			'}'
		].join('\n'));

		this.updateProgram = createProgram(vertexShader, [
			'precision highp float;',

			'uniform sampler2D texture;',
			'uniform vec2 delta;',

			'varying vec2 coord;',

			'void main() {',
				'vec4 info = texture2D(texture, coord);',

				'vec2 dx = vec2(delta.x, 0.0);',
				'vec2 dy = vec2(0.0, delta.y);',

				'float average = (',
					'texture2D(texture, coord - dx).r +',
					'texture2D(texture, coord - dy).r +',
					'texture2D(texture, coord + dx).r +',
					'texture2D(texture, coord + dy).r',
				') * 0.25;',

				'info.g += (average - info.r) * 2.0;',
				'info.g *= 0.995;',
				'info.r += info.g;',

				'gl_FragColor = info;',
			'}'
		].join('\n'));
		gl.uniform2fv(this.updateProgram.locations.delta, this.textureDelta);

		this.renderProgram = createProgram([
			'precision highp float;',

			'attribute vec2 vertex;',
			'uniform vec2 topLeft;',
			'uniform vec2 bottomRight;',
			'uniform vec2 containerRatio;',
			'varying vec2 ripplesCoord;',
			'varying vec2 backgroundCoord;',
			'void main() {',
				'backgroundCoord = mix(topLeft, bottomRight, vertex * 0.5 + 0.5);',
				'backgroundCoord.y = 1.0 - backgroundCoord.y;',
				'ripplesCoord = vec2(vertex.x, -vertex.y) * containerRatio * 0.5 + 0.5;',
				'gl_Position = vec4(vertex.x, -vertex.y, 0.0, 1.0);',
			'}'
		].join('\n'), [
			'precision highp float;',

			'uniform sampler2D samplerBackground;',
			'uniform sampler2D samplerRipples;',
			'uniform vec2 delta;',

			'uniform float perturbance;',
			'varying vec2 ripplesCoord;',
			'varying vec2 backgroundCoord;',

			'void main() {',
				'float height = texture2D(samplerRipples, ripplesCoord).r;',
				'float heightX = texture2D(samplerRipples, vec2(ripplesCoord.x + delta.x, ripplesCoord.y)).r;',
				'float heightY = texture2D(samplerRipples, vec2(ripplesCoord.x, ripplesCoord.y + delta.y)).r;',
				'vec3 dx = vec3(delta.x, heightX - height, 0.0);',
				'vec3 dy = vec3(0.0, heightY - height, delta.y);',
				'vec2 offset = -normalize(cross(dy, dx)).xz;',
				'float specular = pow(max(0.0, dot(offset, normalize(vec2(-0.6, 1.0)))), 4.0);',
				'gl_FragColor = texture2D(samplerBackground, backgroundCoord + offset * perturbance) + specular;',
			'}'
		].join('\n'));
		gl.uniform2fv(this.renderProgram.locations.delta, this.textureDelta);
	},

	initTexture: function() {
		this.backgroundTexture = gl.createTexture();
		gl.bindTexture(gl.TEXTURE_2D, this.backgroundTexture);
		gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, 1);
		gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
		gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
	},

	setTransparentTexture: function() {
		gl.bindTexture(gl.TEXTURE_2D, this.backgroundTexture);
		gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, transparentPixels);
	},

	hideCssBackground: function() {

		// Check whether we're changing inline CSS or overriding a global CSS rule.
		var inlineCss = this.$el[0].style.backgroundImage;

		if (inlineCss == 'none') {
			return;
		}

		this.originalInlineCss = inlineCss;

		this.originalCssBackgroundImage = this.$el.css('backgroundImage');
		this.$el.css('backgroundImage', 'none');
	},

	restoreCssBackground: function() {

		// Restore background by either changing the inline CSS rule to what it was, or
		// simply remove the inline CSS rule if it never was inlined.
		this.$el.css('backgroundImage', this.originalInlineCss || '');
	},

	dropAtPointer: function(pointer, radius, strength) {
		var borderLeft = parseInt(this.$el.css('border-left-width')) || 0,
				borderTop = parseInt(this.$el.css('border-top-width')) || 0;

		this.drop(
			pointer.pageX - this.$el.offset().left - borderLeft,
			pointer.pageY - this.$el.offset().top - borderTop,
			radius,
			strength
		);
	},

	/**
	 *  Public methods
	 */
	drop: function(x, y, radius, strength) {
		gl = this.context;

		var elWidth = this.$el.innerWidth();
		var elHeight = this.$el.innerHeight();
		var longestSide = Math.max(elWidth, elHeight);

		radius = radius / longestSide;

		var dropPosition = new Float32Array([
			(2 * x - elWidth) / longestSide,
			(elHeight - 2 * y) / longestSide
		]);

		gl.viewport(0, 0, this.resolution, this.resolution);

		gl.bindFramebuffer(gl.FRAMEBUFFER, this.framebuffers[this.bufferWriteIndex]);
		bindTexture(this.textures[this.bufferReadIndex]);

		gl.useProgram(this.dropProgram.id);
		gl.uniform2fv(this.dropProgram.locations.center, dropPosition);
		gl.uniform1f(this.dropProgram.locations.radius, radius);
		gl.uniform1f(this.dropProgram.locations.strength, strength);

		this.drawQuad();

		this.swapBufferIndices();
	},

	updateSize: function() {
		var newWidth = this.$el.innerWidth(),
				newHeight = this.$el.innerHeight();

		if (newWidth != this.canvas.width || newHeight != this.canvas.height) {
			this.canvas.width = newWidth;
			this.canvas.height = newHeight;
		}
	},

	destroy: function() {
		this.$el
			.off('.ripples')
			.removeClass('jquery-ripples')
			.removeData('ripples');

		// Make sure the last used context is garbage-collected
		gl = null;

		$(window).off('resize', this.updateSize);

		this.$canvas.remove();
		this.restoreCssBackground();

		this.destroyed = true;
	},

	show: function() {
		this.visible = true;

		this.$canvas.show();
		this.hideCssBackground();
	},

	hide: function() {
		this.visible = false;

		this.$canvas.hide();
		this.restoreCssBackground();
	},

	pause: function() {
		this.running = false;
	},

	play: function() {
		this.running = true;
	},

	set: function(property, value) {
		switch (property) {
			case 'dropRadius':
			case 'perturbance':
			case 'interactive':
			case 'crossOrigin':
				this[property] = value;
				break;
			case 'imageUrl':
				this.imageUrl = value;
				this.loadImage();
				break;
		}
	}
};

// RIPPLES PLUGIN DEFINITION
// ==========================

var old = $.fn.ripples;

$.fn.ripples = function(option) {
	if (!config) {
		throw new Error('Your browser does not support WebGL, the OES_texture_float extension or rendering to floating point textures.');
	}

	var args = (arguments.length > 1) ? Array.prototype.slice.call(arguments, 1) : undefined;

	return this.each(function() {
		var $this = $(this),
				data = $this.data('ripples'),
				options = $.extend({}, Ripples.DEFAULTS, $this.data(), typeof option == 'object' && option);

		if (!data && typeof option == 'string') {
			return;
		}
		if (!data) {
			$this.data('ripples', (data = new Ripples(this, options)));
		}
		else if (typeof option == 'string') {
			Ripples.prototype[option].apply(data, args);
		}
	});
};

$.fn.ripples.Constructor = Ripples;


// RIPPLES NO CONFLICT
// ====================

$.fn.ripples.noConflict = function() {
	$.fn.ripples = old;
	return this;
};

})));
```

修改 _config.butterfly.yml 文件的 inject 的 bottom 处的代码为

```diff
   bottom:
     - <script defer src="/js/jquery.min.js"></script>
-     - <script defer src="https://rmt.dogedoge.com/fetch/~/source/jsdelivr/npm/jquery@latest/dist/jquery.min.js"></script>
-     - <script defer data-pjax src="https://cdn.jsdelivr.net/gh/sirxemic/jquery.ripples/dist/jquery.ripples.js"></script>
+     - <script defer data-pjax src="/js/jquery.ripples.js"></script>
+     - <script defer data-pjax src="/js/ripples.js"></script>
```

#### 上升气泡效果

由于之前已经引用了 jquery.min.js，因此不需要再引用了。

打开浏览器输入 `https://cdn.jsdelivr.net/gh/weilining/jsdelivr/jquery/circlemagic/circlemagic.min.js`，获取到 circlemagic.min.js 文件内容，在 blog/themes/butterfly/source/js 目录下创建 circlemagic.min.js 文件，写入上面获得的内容

```js
/**
 * Minified by jsDelivr using Terser v5.13.1.
 * Original file: /gh/weilining/jsdelivr@master/jquery/circlemagic/circlemagic.js
 *
 * Do NOT use SRI with dynamically generated files! More information: https://www.jsdelivr.com/using-sri-with-dynamic-files
 */
!function(t){t.fn.circleMagic=function(a){var e,o,n,r,i=!0,d=[],c=t.extend({color:"rgba(255,255,255,.5)",radius:10,density:.3,clearOffset:.2},a),h=this[0];function l(){i=!(document.body.scrollTop>o)}function s(){e=h.clientWidth,o=h.clientHeight,h.height=o+"px",n.width=e,n.height=o}function f(){if(i)for(var t in r.clearRect(0,0,e,o),d)d[t].draw();requestAnimationFrame(f)}function m(){var t=this;function a(){t.pos.x=Math.random()*e,t.pos.y=o+100*Math.random(),t.alpha=.1+Math.random()*c.clearOffset,t.scale=.1+.3*Math.random(),t.speed=Math.random(),"random"===c.color?t.color="rgba("+Math.floor(255*Math.random())+", "+Math.floor(255*Math.random())+", "+Math.floor(255*Math.random())+", "+Math.random().toPrecision(2)+")":t.color=c.color}t.pos={},a(),this.draw=function(){t.alpha<=0&&a(),t.pos.y-=t.speed,t.alpha-=5e-4,r.beginPath(),r.arc(t.pos.x,t.pos.y,t.scale*c.radius,0,2*Math.PI,!1),r.fillStyle=t.color,r.fill(),r.closePath()}}!function(){e=h.offsetWidth,o=h.offsetHeight,t=document.createElement("canvas"),t.id="canvas",h.appendChild(t),t.parentElement.style.overflow="hidden",(n=document.getElementById("canvas")).width=e,n.height=o,r=n.getContext("2d");var t;for(var a=0;a<e*c.density;a++){var i=new m;d.push(i)}f()}(),window.addEventListener("scroll",l,!1),window.addEventListener("resize",s,!1)}}(jQuery);
//# sourceMappingURL=/sm/28141423b885b9175e8c105c949e4bd5fac1d57e50e5d13f276d8c530cc10761.map
```

打开浏览器输入 `https://cdn.jsdelivr.net/gh/weilining/jsdelivr@latest/jquery/circlemagic/butterflycirclemagic.js`，获取到 butterflycirclemagic.js 文件内容，在 blog/themes/butterfly/source/js 目录下创建 butterflycirclemagic.js 文件，写入上面获得的内容

```js
// butterfly 3.6.0-b5头图气泡
(function () {
  $("#page-header").circleMagic({
    radius: 35,
    density: 0.1,
    color: "rgba(255,255,255, .4)",
    clearOffset: 0.9,
  });
})();
```

修改 _config.butterfly.yml 文件的 inject 的 bottom 处的内容为

```diff
   bottom:
     - <script defer src="/js/jquery.min.js"></script>
-     - <script defer src="https://cdn.jsdelivr.net/combine/npm/jquery@latest/dist/jquery.min.js,gh/weilining/jsdelivr/jquery/circlemagic/circlemagic.min.js,gh/weilining/jsdelivr@latest/jquery/circlemagic/butterflycirclemagic.js"></script>
+     - <script defer src="/js/circlemagic.min.js"></script>
+     - <script defer src="/js/butterflycirclemagic.js"></script>
```

#### 站点加载动画修改（齿轮效果）

由于我们已经使用 Loading Animation( 进阶 )，因此不要修改了。

#### 友链界面

它并不依赖于 jsDelivr，因此并不需要修改。

#### Swiper bar 

它并不依赖于 jsDelivr，因此并不需要修改。

#### 标签外挂 | 彩色文本段落 | 复选框 | 富文本按钮 | Folding | 密码样式的文本 | Link

它们并不依赖于 jsDelivr，因此并不需要修改。

#### 访客信息

它并不依赖于 jsDelivr，因此并不需要修改。

#### 随机诗词展示

它并不依赖于 jsDelivr，因此并不需要修改。

#### 鼠标样式修改

注：这个基于你已完成 **Hexo 异步加载方案**。

打开浏览器分别输入 `https://cdn.jsdelivr.net/gh/sviptzk/HexoStaticFile@latest/Hexo/img/default.cur`和 `https://cdn.jsdelivr.net/gh/sviptzk/HexoStaticFile@latest/Hexo/img/pointer.cur` 分别下载 default.cur 和 pointer.cur，并且将这两个文件放在 blog/themes/butterfly/source/img 目录下，如图

![](https://cos.luyf-lemon-love.space/images/20220521161313.png)

修改 blog/themes/butterfly/source/css/_custom/mouse.css 文件的内容为

```css
body {
    cursor: url(/img/default.cur),
        default;
}
a,
img {
    cursor: url(/img/pointer.cur),
        default;
}
```

#### Mac 代码框样式美化

注：这个基于你已完成 **Hexo 异步加载方案**。

1. 如果你选择 Mac 黑色，请在浏览器中输入 `https://cdn.jsdelivr.net/gh/sviptzk/StaticFile_HEXO@latest/butterfly/css/macblack.css` 获取到 macblack.css 文件的内容，在 blog/themes/butterfly/source/css/_custom 目录下创建 macblack.css 文件，写入上面获得的内容

```css
#article-container figure.highlight,#article-container pre{color:#f8f8f2;background:#696969}#article-container figure.highlight .highlight-tools{background:#3f3f3f;color:#fff}#article-container figure.highlight .gutter pre{color:#d3d3d3;background:grey}#article-container figure.highlight figcaption a{color:#a9a9a9!important}
```

2. 修改 blog/themes/butterfly/source/css/index.styl 文件

```diff
-@import 'https://cdn.jsdelivr.net/gh/sviptzk/StaticFile_HEXO@latest/butterfly/css/macblack.css'
```

3. 如果你选择 Mac 黑色，请在浏览器中输入 `https://cdn.jsdelivr.net/gh/sviptzk/StaticFile_HEXO@latest/butterfly/css/macWhite.css` 获取到 macWhite.css 文件的内容，在 blog/themes/butterfly/source/css/_custom 目录下创建 macWhite.css 文件，写入上面获得的内容

```css
#article-container figure.highlight,#article-container pre{color:#a9a9a9;background:#f3f3f3}#article-container figure.highlight .highlight-tools{color:#a9a9a9;background:#eee}#article-container figure.highlight .gutter pre{color:#999;background:#f3f3f3}#article-container figure.highlight figcaption a{color:#f3f3f3!important}
```

4. 修改 blog/themes/butterfly/source/css/index.styl 文件

```diff
-@import 'https://cdn.jsdelivr.net/gh/sviptzk/StaticFile_HEXO@latest/butterfly/css/macWhite.css'
```

#### 哔哩哔哩视频代码块

它并不依赖于 jsDelivr，因此并不需要修改。

#### 黑客帝国特效

请在浏览器中输入 `https://cdn.jsdelivr.net/npm/canvas-matrix.js@0/canvas-matrix.min.js` 获取到 canvas-matrix.min.js 文件的内容，在 blog/themes/butterfly/source/js 目录下创建 canvas-matrix.min.js 文件，写入上面获得的内容

```js
(function(){const scripts=document.getElementsByTagName("script"),script=scripts[scripts.length-1],fontSize=script.getAttribute("size")||16,fontName=script.getAttribute("font")||"monospace";const canvas=document.createElement("canvas"),context=canvas.getContext("2d");document.body.appendChild(canvas);canvas.style.cssText="position: fixed; top: 0; left: 0; background-color: #111; z-index: -1;";let W=window.innerWidth,H=window.innerHeight;canvas.width=W;canvas.height=H;let colunms=Math.floor(W/fontSize),drops=[],str="QWERTYUIOPASDFGHJKLZXCVBNM!@#$%^&*()1234567890qwertyuiopasdfghjklzxcvbnm";for(let i=0;i<colunms;i++){drops.push(Math.ceil(canvas.height/fontSize)+1)}setInterval((function(){context.fillStyle="rgba(0,0,0,0.05)";context.fillRect(0,0,W,H);context.font=`700 ${fontSize}px ${fontName}`;context.fillStyle="#00cc33";for(let i=0;i<colunms;i++){const index=Math.floor(Math.random()*str.length),x=i*fontSize,y=drops[i]*fontSize;context.fillText(str[index],x,y);if(y>=canvas.height&&Math.random()>.99){drops[i]=0}drops[i]++}}),120);window.addEventListener("resize",(function(){W=window.innerWidth;H=window.innerHeight;canvas.width=W;canvas.height=H;colunms=Math.floor(W/fontSize);drops=[];for(let i=0;i<colunms;i++){drops.push(Math.ceil(canvas.height/fontSize)+1)}}))})();
```

修改 _config.butterfly.yml 文件的 inject 的 bottom 处

```diff
   bottom:
-     - <script defer src="https://cdn.jsdelivr.net/npm/canvas-matrix.js@0/canvas-matrix.min.js" size="20" font="arial"></script>
+     - <script defer src="/js/canvas-matrix.min.js" size="20" font="arial"></script>
```

#### 点亮网站标题和副标题

它并不依赖于 jsDelivr，因此并不需要修改。

#### 进度弹球

1. 请在浏览器中输入 `https://cdn.jsdelivr.net/gh/CodeByZach/pace/themes/pink/pace-theme-bounce.css` 获取到 pace-theme-bounce.css 文件的内容，在 blog/themes/butterfly/source/css/_custom 目录下创建 pace-theme-bounce.css 文件，写入上面获得的内容

```css
/* This is a compiled file, you should be editing the file in the templates directory */
.pace {
  width: 140px;
  height: 300px;
  position: fixed;
  top: -90px;
  right: -20px;
  z-index: 2000;
  -webkit-transform: scale(0);
  -moz-transform: scale(0);
  -ms-transform: scale(0);
  -o-transform: scale(0);
  transform: scale(0);
  opacity: 0;
  -webkit-transition: all 2s linear 0s;
  -moz-transition: all 2s linear 0s;
  transition: all 2s linear 0s;
}

.pace.pace-active {
  -webkit-transform: scale(.25);
  -moz-transform: scale(.25);
  -ms-transform: scale(.25);
  -o-transform: scale(.25);
  transform: scale(.25);
  opacity: 1;
}

.pace .pace-activity {
  width: 140px;
  height: 140px;
  border-radius: 70px;
  background: #e90f92;
  position: absolute;
  top: 0;
  z-index: 1911;
  -webkit-animation: pace-bounce 1s infinite;
  -moz-animation: pace-bounce 1s infinite;
  -o-animation: pace-bounce 1s infinite;
  -ms-animation: pace-bounce 1s infinite;
  animation: pace-bounce 1s infinite;
}

.pace .pace-progress {
  position: absolute;
  display: block;
  left: 50%;
  bottom: 0;
  z-index: 1910;
  margin-left: -30px;
  width: 60px;
  height: 75px;
  background: rgba(20, 20, 20, .1);
  box-shadow: 0 0 20px 35px rgba(20, 20, 20, .1);
  border-radius: 30px / 40px;
  -webkit-transform: scaleY(.3) !important;
  -moz-transform: scaleY(.3) !important;
  -ms-transform: scaleY(.3) !important;
  -o-transform: scaleY(.3) !important;
  transform: scaleY(.3) !important;
  -webkit-animation: pace-compress .5s infinite alternate;
  -moz-animation: pace-compress .5s infinite alternate;
  -o-animation: pace-compress .5s infinite alternate;
  -ms-animation: pace-compress .5s infinite alternate;
  animation: pace-compress .5s infinite alternate;
}

@-webkit-keyframes pace-bounce {
  0% {
    top: 0;
    -webkit-animation-timing-function: ease-in;
  }
  40% {}
  50% {
    top: 140px;
    height: 140px;
    -webkit-animation-timing-function: ease-out;
  }
  55% {
    top: 160px;
    height: 120px;
    border-radius: 70px / 60px;
    -webkit-animation-timing-function: ease-in;
  }
  65% {
    top: 120px;
    height: 140px;
    border-radius: 70px;
    -webkit-animation-timing-function: ease-out;
  }
  95% {
    top: 0;
    -webkit-animation-timing-function: ease-in;
  }
  100% {
    top: 0;
    -webkit-animation-timing-function: ease-in;
  }
}

@-moz-keyframes pace-bounce {
  0% {
    top: 0;
    -moz-animation-timing-function: ease-in;
  }
  40% {}
  50% {
    top: 140px;
    height: 140px;
    -moz-animation-timing-function: ease-out;
  }
  55% {
    top: 160px;
    height: 120px;
    border-radius: 70px / 60px;
    -moz-animation-timing-function: ease-in;
  }
  65% {
    top: 120px;
    height: 140px;
    border-radius: 70px;
    -moz-animation-timing-function: ease-out;}
  95% {
    top: 0;
    -moz-animation-timing-function: ease-in;
  }
  100% {top: 0;
    -moz-animation-timing-function: ease-in;
  }
}

@keyframes pace-bounce {
  0% {
    top: 0;
    animation-timing-function: ease-in;
  }
  50% {
    top: 140px;
    height: 140px;
    animation-timing-function: ease-out;
  }
  55% {
    top: 160px;
    height: 120px;
    border-radius: 70px / 60px;
    animation-timing-function: ease-in;
  }
  65% {
    top: 120px;
    height: 140px;
    border-radius: 70px;
    animation-timing-function: ease-out;
  }
  95% {
    top: 0;
    animation-timing-function: ease-in;
  }
  100% {
    top: 0;
    animation-timing-function: ease-in;
  }
}

@-webkit-keyframes pace-compress {
  0% {
    bottom: 0;
    margin-left: -30px;
    width: 60px;
    height: 75px;
    background: rgba(20, 20, 20, .1);
    box-shadow: 0 0 20px 35px rgba(20, 20, 20, .1);
    border-radius: 30px / 40px;
    -webkit-animation-timing-function: ease-in;
  }
  100% {
    bottom: 30px;
    margin-left: -10px;
    width: 20px;
    height: 5px;
    background: rgba(20, 20, 20, .3);
    box-shadow: 0 0 20px 35px rgba(20, 20, 20, .3);
    border-radius: 20px / 20px;
    -webkit-animation-timing-function: ease-out;
  }
}

@-moz-keyframes pace-compress {
  0% {
    bottom: 0;
    margin-left: -30px;
    width: 60px;
    height: 75px;
    background: rgba(20, 20, 20, .1);
    box-shadow: 0 0 20px 35px rgba(20, 20, 20, .1);
    border-radius: 30px / 40px;
    -moz-animation-timing-function: ease-in;
  }
  100% {
    bottom: 30px;
    margin-left: -10px;
    width: 20px;
    height: 5px;
    background: rgba(20, 20, 20, .3);
    box-shadow: 0 0 20px 35px rgba(20, 20, 20, .3);
    border-radius: 20px / 20px;
    -moz-animation-timing-function: ease-out;
  }
}

@keyframes pace-compress {
  0% {
    bottom: 0;
    margin-left: -30px;
    width: 60px;
    height: 75px;
    background: rgba(20, 20, 20, .1);
    box-shadow: 0 0 20px 35px rgba(20, 20, 20, .1);
    border-radius: 30px / 40px;
    animation-timing-function: ease-in;
  }
  100% {
    bottom: 30px;
    margin-left: -10px;
    width: 20px;
    height: 5px;
    background: rgba(20, 20, 20, .3);
    box-shadow: 0 0 20px 35px rgba(20, 20, 20, .3);
    border-radius: 20px / 20px;
    animation-timing-function: ease-out;
  }
}
```

2. 请在浏览器中输入 `https://dogefs.s3.ladydaily.com/~/source/jsdelivr/gh/CodeByZach/pace/pace.min.js` 获取到 pace.min.js 文件的内容，在 blog/themes/butterfly/source/js 目录下创建 pace.min.js 文件，写入上面获得的内容

```js
/*!
 * pace.js v1.2.4
 * https://github.com/CodeByZach/pace/
 * Licensed MIT © HubSpot, Inc.
 */
!function(){function o(t,e){return function(){return t.apply(e,arguments)}}var u,c,i,s,n,y,t,l,v,r,a,p,e,h,w,b,f,g,d,m,k,S,q,L,x,P,T,R,j,O,E,M,A,C,N,_,F,U,W,X,D,H,I,z,G,B,J=[].slice,K={}.hasOwnProperty,Q=function(t,e){for(var n in e)K.call(e,n)&&(t[n]=e[n]);function r(){this.constructor=t}return r.prototype=e.prototype,t.prototype=new r,t.__super__=e.prototype,t},V=[].indexOf||function(t){for(var e=0,n=this.length;e<n;e++)if(e in this&&this[e]===t)return e;return-1};function Y(){}for(g={className:"",catchupTime:100,initialRate:.03,minTime:250,ghostTime:100,maxProgressPerFrame:20,easeFactor:1.25,startOnPageLoad:!0,restartOnPushState:!0,restartOnRequestAfter:500,target:"body",elements:{checkInterval:100,selectors:["body"]},eventLag:{minSamples:10,sampleCount:3,lagThreshold:3},ajax:{trackMethods:["GET"],trackWebSockets:!0,ignoreURLs:[]}},P=function(){var t;return null!=(t="undefined"!=typeof performance&&null!==performance&&"function"==typeof performance.now?performance.now():void 0)?t:+new Date},R=window.requestAnimationFrame||window.mozRequestAnimationFrame||window.webkitRequestAnimationFrame||window.msRequestAnimationFrame,f=window.cancelAnimationFrame||window.mozCancelAnimationFrame,p=function(t,e,n){if("function"==typeof t.addEventListener)return t.addEventListener(e,n,!1);var r;"function"!=typeof t["on"+e]||"object"!=typeof t["on"+e].eventListeners?(r=new s,"function"==typeof t["on"+e]&&r.on(e,t["on"+e]),t["on"+e]=function(t){return r.trigger(e,t)},t["on"+e].eventListeners=r):r=t["on"+e].eventListeners,r.on(e,n)},null==R&&(R=function(t){return setTimeout(t,50)},f=function(t){return clearTimeout(t)}),O=function(e){var n=P(),r=function(){var t=P()-n;return 33<=t?(n=P(),e(t,function(){return R(r)})):setTimeout(r,33-t)};return r()},j=function(){var t=arguments[0],e=arguments[1],n=3<=arguments.length?J.call(arguments,2):[];return"function"==typeof t[e]?t[e].apply(t,n):t[e]},d=function(){for(var t,e,n,r=arguments[0],s=2<=arguments.length?J.call(arguments,1):[],o=0,i=s.length;o<i;o++)if(e=s[o])for(t in e)K.call(e,t)&&(n=e[t],null!=r[t]&&"object"==typeof r[t]&&null!=n&&"object"==typeof n?d(r[t],n):r[t]=n);return r},h=function(t){for(var e,n,r=e=0,s=0,o=t.length;s<o;s++)n=t[s],r+=Math.abs(n),e++;return r/e},k=function(t,e){var n,r;if(null==t&&(t="options"),null==e&&(e=!0),r=document.querySelector("[data-pace-"+t+"]")){if(n=r.getAttribute("data-pace-"+t),!e)return n;try{return JSON.parse(n)}catch(t){return"undefined"!=typeof console&&null!==console?console.error("Error parsing inline pace options",t):void 0}}},Y.prototype.on=function(t,e,n,r){var s;return null==r&&(r=!1),null==this.bindings&&(this.bindings={}),null==(s=this.bindings)[t]&&(s[t]=[]),this.bindings[t].push({handler:e,ctx:n,once:r})},Y.prototype.once=function(t,e,n){return this.on(t,e,n,!0)},Y.prototype.off=function(t,e){var n,r,s;if(null!=(null!=(r=this.bindings)?r[t]:void 0)){if(null==e)return delete this.bindings[t];for(n=0,s=[];n<this.bindings[t].length;)this.bindings[t][n].handler===e?s.push(this.bindings[t].splice(n,1)):s.push(n++);return s}},Y.prototype.trigger=function(){var t,e,n,r,s,o,i=arguments[0],a=2<=arguments.length?J.call(arguments,1):[];if(null!=(r=this.bindings)&&r[i]){for(n=0,o=[];n<this.bindings[i].length;)e=(s=this.bindings[i][n]).handler,t=s.ctx,s=s.once,e.apply(null!=t?t:this,a),s?o.push(this.bindings[i].splice(n,1)):o.push(n++);return o}},B=Y,y=window.Pace||{},window.Pace=y,d(y,B.prototype),T=y.options=d({},g,window.paceOptions,k()),X=0,H=(z=["ajax","document","eventLag","elements"]).length;X<H;X++)!0===T[C=z[X]]&&(T[C]=g[C]);function Z(){return Z.__super__.constructor.apply(this,arguments)}function $(){this.progress=0}function tt(){this.bindings={}}function et(){var e,o=this;et.__super__.constructor.apply(this,arguments),e=function(r){var s=r.open;return r.open=function(t,e,n){return A(t)&&o.trigger("request",{type:t,url:e,request:r}),s.apply(r,arguments)}},window.XMLHttpRequest=function(t){t=new W(t);return e(t),t};try{m(window.XMLHttpRequest,W)}catch(t){}if(null!=U){window.XDomainRequest=function(){var t=new U;return e(t),t};try{m(window.XDomainRequest,U)}catch(t){}}if(null!=F&&T.ajax.trackWebSockets){window.WebSocket=function(t,e){var n=null!=e?new F(t,e):new F(t);return A("socket")&&o.trigger("request",{type:"socket",url:t,protocols:e,request:n}),n};try{m(window.WebSocket,F)}catch(t){}}}function nt(){this.complete=o(this.complete,this);var t=this;this.elements=[],S().on("request",function(){return t.watch.apply(t,arguments)})}function rt(t){var e,n,r,s;for(null==t&&(t={}),this.complete=o(this.complete,this),this.elements=[],null==t.selectors&&(t.selectors=[]),n=0,r=(s=t.selectors).length;n<r;n++)e=s[n],this.elements.push(new i(e,this.complete))}function st(t,e){this.selector=t,this.completeCallback=e,this.progress=0,this.check()}function ot(){var t,e,n=this;this.progress=null!=(e=this.states[document.readyState])?e:100,t=document.onreadystatechange,document.onreadystatechange=function(){return null!=n.states[document.readyState]&&(n.progress=n.states[document.readyState]),"function"==typeof t?t.apply(null,arguments):void 0}}function it(t){this.source=t,this.last=this.sinceLastUpdate=0,this.rate=T.initialRate,this.catchup=0,this.progress=this.lastProgress=0,null!=this.source&&(this.progress=j(this.source,"progress"))}B=Error,Q(Z,B),n=Z,$.prototype.getElement=function(){var t;if(null==this.el){if(!(t=document.querySelector(T.target)))throw new n;this.el=document.createElement("div"),this.el.className="pace pace-active",document.body.className=document.body.className.replace(/(pace-done )|/,"pace-running ");var e=""!==T.className?" "+T.className:"";this.el.innerHTML='<div class="pace-progress'+e+'">\n  <div class="pace-progress-inner"></div>\n</div>\n<div class="pace-activity"></div>',null!=t.firstChild?t.insertBefore(this.el,t.firstChild):t.appendChild(this.el)}return this.el},$.prototype.finish=function(){var t=this.getElement();return t.className=t.className.replace("pace-active","pace-inactive"),document.body.className=document.body.className.replace("pace-running ","pace-done ")},$.prototype.update=function(t){return this.progress=t,y.trigger("progress",t),this.render()},$.prototype.destroy=function(){try{this.getElement().parentNode.removeChild(this.getElement())}catch(t){n=t}return this.el=void 0},$.prototype.render=function(){var t,e,n,r,s,o,i;if(null==document.querySelector(T.target))return!1;for(t=this.getElement(),r="translate3d("+this.progress+"%, 0, 0)",s=0,o=(i=["webkitTransform","msTransform","transform"]).length;s<o;s++)e=i[s],t.children[0].style[e]=r;return(!this.lastRenderedProgress||this.lastRenderedProgress|0!==this.progress|0)&&(t.children[0].setAttribute("data-progress-text",(0|this.progress)+"%"),100<=this.progress?n="99":(n=this.progress<10?"0":"",n+=0|this.progress),t.children[0].setAttribute("data-progress",""+n)),y.trigger("change",this.progress),this.lastRenderedProgress=this.progress},$.prototype.done=function(){return 100<=this.progress},c=$,tt.prototype.trigger=function(t,e){var n,r,s,o,i;if(null!=this.bindings[t]){for(i=[],r=0,s=(o=this.bindings[t]).length;r<s;r++)n=o[r],i.push(n.call(this,e));return i}},tt.prototype.on=function(t,e){var n;return null==(n=this.bindings)[t]&&(n[t]=[]),this.bindings[t].push(e)},s=tt,W=window.XMLHttpRequest,U=window.XDomainRequest,F=window.WebSocket,m=function(t,e){var n,r=[];for(n in e.prototype)try{null==t[n]&&"function"!=typeof e[n]?"function"==typeof Object.defineProperty?r.push(Object.defineProperty(t,n,{get:function(t){return function(){return e.prototype[t]}}(n),configurable:!0,enumerable:!0})):r.push(t[n]=e.prototype[n]):r.push(void 0)}catch(t){0}return r},L=[],y.ignore=function(){var t=arguments[0],e=2<=arguments.length?J.call(arguments,1):[];return L.unshift("ignore"),e=t.apply(null,e),L.shift(),e},y.track=function(){var t=arguments[0],e=2<=arguments.length?J.call(arguments,1):[];return L.unshift("track"),e=t.apply(null,e),L.shift(),e},A=function(t){if(null==t&&(t="GET"),"track"===L[0])return"force";if(!L.length&&T.ajax){if("socket"===t&&T.ajax.trackWebSockets)return!0;if(t=t.toUpperCase(),0<=V.call(T.ajax.trackMethods,t))return!0}return!1},Q(et,s),t=et,D=null,M=function(t){for(var e,n=T.ajax.ignoreURLs,r=0,s=n.length;r<s;r++)if("string"==typeof(e=n[r])){if(-1!==t.indexOf(e))return!0}else if(e.test(t))return!0;return!1},(S=function(){return D=null==D?new t:D})().on("request",function(t){var o,i=t.type,a=t.request,e=t.url;if(!M(e))return y.running||!1===T.restartOnRequestAfter&&"force"!==A(i)?void 0:(o=arguments,"boolean"==typeof(e=T.restartOnRequestAfter||0)&&(e=0),setTimeout(function(){var t,e,n,r,s="socket"===i?a.readyState<1:0<(s=a.readyState)&&s<4;if(s){for(y.restart(),r=[],t=0,e=(n=y.sources).length;t<e;t++){if((C=n[t])instanceof u){C.watch.apply(C,o);break}r.push(void 0)}return r}},e))}),nt.prototype.watch=function(t){var e=t.type,n=t.request,t=t.url;if(!M(t))return n=new("socket"===e?r:a)(n,this.complete),this.elements.push(n)},nt.prototype.complete=function(e){return this.elements=this.elements.filter(function(t){return t!==e})},u=nt,a=function(e,n){var t,r,s,o,i=this;if(this.progress=0,null!=window.ProgressEvent)for(p(e,"progress",function(t){return t.lengthComputable?i.progress=100*t.loaded/t.total:i.progress=i.progress+(100-i.progress)/2}),t=0,r=(o=["load","abort","timeout","error"]).length;t<r;t++)p(e,o[t],function(){return n(i),i.progress=100});else s=e.onreadystatechange,e.onreadystatechange=function(){var t;return 0===(t=e.readyState)||4===t?(n(i),i.progress=100):3===e.readyState&&(i.progress=50),"function"==typeof s?s.apply(null,arguments):void 0}},r=function(t,e){for(var n,r=this,s=this.progress=0,o=(n=["error","open"]).length;s<o;s++)p(t,n[s],function(){return e(r),r.progress=100})},rt.prototype.complete=function(e){return this.elements=this.elements.filter(function(t){return t!==e})},k=rt,st.prototype.check=function(){var t=this;return document.querySelector(this.selector)?this.done():setTimeout(function(){return t.check()},T.elements.checkInterval)},st.prototype.done=function(){return this.completeCallback(this),this.completeCallback=null,this.progress=100},i=st,ot.prototype.states={loading:0,interactive:50,complete:100},B=ot,Q=function(){var e,n,r,s,o,i=this;this.progress=0,o=[],s=0,r=P(),n=setInterval(function(){var t=P()-r-50;return r=P(),o.push(t),o.length>T.eventLag.sampleCount&&o.shift(),e=h(o),++s>=T.eventLag.minSamples&&e<T.eventLag.lagThreshold?(i.progress=100,clearInterval(n)):i.progress=3/(e+3)*100},50)},it.prototype.tick=function(t,e){return 100<=(e=null==e?j(this.source,"progress"):e)&&(this.done=!0),e===this.last?this.sinceLastUpdate+=t:(this.sinceLastUpdate&&(this.rate=(e-this.last)/this.sinceLastUpdate),this.catchup=(e-this.progress)/T.catchupTime,this.sinceLastUpdate=0,this.last=e),e>this.progress&&(this.progress+=this.catchup*t),e=1-Math.pow(this.progress/100,T.easeFactor),this.progress+=e*this.rate*t,this.progress=Math.min(this.lastProgress+T.maxProgressPerFrame,this.progress),this.progress=Math.max(0,this.progress),this.progress=Math.min(100,this.progress),this.lastProgress=this.progress,this.progress},v=it,b=e=_=w=E=N=null,y.running=!1,q=function(){if(T.restartOnPushState)return y.restart()},null!=window.history.pushState&&(I=window.history.pushState,window.history.pushState=function(){return q(),I.apply(window.history,arguments)}),null!=window.history.replaceState&&(G=window.history.replaceState,window.history.replaceState=function(){return q(),G.apply(window.history,arguments)}),l={ajax:u,elements:k,document:B,eventLag:Q},(x=function(){var t,e,n,r,s,o,i,a;for(y.sources=N=[],e=0,r=(o=["ajax","elements","document","eventLag"]).length;e<r;e++)!1!==T[t=o[e]]&&N.push(new l[t](T[t]));for(n=0,s=(a=null!=(i=T.extraSources)?i:[]).length;n<s;n++)C=a[n],N.push(new C(T));return y.bar=w=new c,E=[],_=new v})(),y.stop=function(){return y.trigger("stop"),y.running=!1,w.destroy(),b=!0,null!=e&&("function"==typeof f&&f(e),e=null),x()},y.restart=function(){return y.trigger("restart"),y.stop(),y.start()},y.go=function(){var m;return y.running=!0,w.render(),m=P(),b=!1,e=O(function(t,e){w.progress;for(var n,r,s,o,i,a,u,c,l,p,h=a=0,f=!0,g=u=0,d=N.length;u<d;g=++u)for(C=N[g],i=null!=E[g]?E[g]:E[g]=[],s=c=0,l=(r=null!=(p=C.elements)?p:[C]).length;c<l;s=++c)o=r[s],f&=(o=null!=i[s]?i[s]:i[s]=new v(o)).done,o.done||(h++,a+=o.tick(t));return n=a/h,w.update(_.tick(t,n)),w.done()||f||b?(w.update(100),y.trigger("done"),setTimeout(function(){return w.finish(),y.running=!1,y.trigger("hide")},Math.max(T.ghostTime,Math.max(T.minTime-(P()-m),0)))):e()})},y.start=function(t){d(T,t),y.running=!0;try{w.render()}catch(t){n=t}return document.querySelector(".pace")?(y.trigger("start"),y.go()):setTimeout(y.start,50)},"function"==typeof define&&define.amd?define(function(){return y}):"object"==typeof exports?module.exports=y:T.startOnPageLoad&&y.start()}.call(this);
```

3. 修改 _config.butterfly.yml 文件的 inject 部分

```diff
inject:
   head:
-     - <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/CodeByZach/pace/themes/pink/pace-theme-bounce.css"> # 进度弹球
   bottom:
-     - <script async src="https://rmt.dogedoge.com/fetch/~/source/jsdelivr/gh/CodeByZach/pace/pace.min.js"></script> # 进度弹球
+     - <script async src="js/pace.min.js"></script>
```

#### 搜索系统

它并不依赖于 jsDelivr，因此并不需要修改。


#### 评论系统

它并不依赖于 jsDelivr，因此并不需要修改。

#### RSS

它并不依赖于 jsDelivr，因此并不需要修改。

#### 文章永久链接

它并不依赖于 jsDelivr，因此并不需要修改。

#### 文章计数

它并不依赖于 jsDelivr，因此并不需要修改。

#### Vercel 加速博客

它并不依赖于 jsDelivr，因此并不需要修改。

#### Loading Animation( 进阶 )

它并不依赖于 jsDelivr，因此并不需要修改。

#### Live2d Widget( 进阶 )

它并不依赖于 jsDelivr，因此并不需要修改。

#### 访客地图 | 访客地图（进阶）

它们并不依赖于 jsDelivr，因此并不需要修改。

#### 全局 Aplayer 播放

它并不依赖于 jsDelivr，因此并不需要修改。

#### 说说

它并不依赖于 jsDelivr，因此并不需要修改。

#### hexo-filter-nofollow

它并不依赖于 jsDelivr，因此并不需要修改。

#### 新建 Bilibili 主页

它并不依赖于 jsDelivr，因此并不需要修改。

#### inject 处的最终代码

```yaml
# 修改过
# Inject
# Insert the code to head (before '</head>' tag) and the bottom (before '</body>' tag)
# 插入代码到头部 </head> 之前 和 底部 </body> 之前
inject:
   head:
     #- <link rel="stylesheet" href="/css/myCreate.css">
     #- <link rel="stylesheet" href="/css/title.css">
     #- <link rel="stylesheet" href="/css/mouse.css">
     #- <link rel="stylesheet" href="/css/tag.css">
     #- <link rel="stylesheet" href="/css/transparent.css">
     - <link rel="stylesheet" href="//at.alicdn.com/t/font_3411896_xzx9wqcqhmq.css">
     - "<style>#article-container.post-content h1:before, h2:before, h3:before, h4:before, h5:before, h6:before { -webkit-animation: avatar_turn_around 1s linear infinite; -moz-animation: avatar_turn_around 1s linear infinite; -o-animation: avatar_turn_around 1s linear infinite; -ms-animation: avatar_turn_around 1s linear infinite; animation: avatar_turn_around 1s linear infinite; }</style>"
   bottom:
     - <script defer src="/js/jquery.min.js"></script>
     - <script defer src="/live2d-widget/autoload.js"></script> # 页脚看板娘2
     #- <script defer src="/js/colorfishes.js"></script> # 页脚养鱼(彩色)    
     - <script defer src="/js/fishes.js"></script>
     - <script defer src="/js/sakura.js"></script>
     #- <script defer src="/js/snow.js"></script> # 下雪动效
     - <script defer src="/js/timing.js"></script> # 公告栏计时器插件
     - <script defer src="/js/footerbea.js"></script>
     - <script defer data-pjax src="/js/jquery.ripples.js"></script>
     - <script defer data-pjax src="/js/ripples.js"></script>
     - <script defer src="https://pv.sohu.com/cityjson?ie=utf-8"></script>
     - <script defer src="/js/ip_content.js"></script>
     #- <script defer src="/js/canvas-matrix.min.js" size="20" font="arial"></script>
     #- <script async src="js/pace.min.js"></script>
     #- <script defer src="/js/circlemagic.min.js"></script>
     #- <script defer src="/js/butterflycirclemagic.js"></script>
     - <div class="aplayer no-destroy" data-id="8476474722" data-server="tencent" data-type="playlist" data-fixed="true" data-autoplay="true"> </div>
```

#### 图床

关于图床的问题，可以通过阅读我另外两篇文章来去掉对 jsDelivr 的引用。

1. 腾讯云轻量应用服务器搭建图床-ubuntu

2. PicGo+腾讯云COS搭建图床-ubuntu


### 腾讯云域名绑定到 Github 上

1. 登录[腾讯云官网](https://cloud.tencent.com/)，找到 **[域名注册](https://dnspod.cloud.tencent.com/)** 并进入，选择你想要的域名并购买，注意第一次需要用身份证创建信息模板，并进行实名认证，虽然腾讯官网说需要 3-5 日，但实际上只需要 15 分钟左右，效率还是很高的。

2. 然后进入[腾讯云 DNS 解析控制台](https://console.cloud.tencent.com/cns)，点击你的域名的解析按钮，点击添加记录按钮，如图

![](https://cos.luyf-lemon-love.space/images/20220521205001.png)

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

3. 为了使访客用不用 www 都可以访问博客，我们添加两条记录，注意：我们选择 CNAME 记录类型，记录值填写 **你的 Github 用户名.github.io**，如图

![](https://cos.luyf-lemon-love.space/images/20220521205412.png)

4. 进入你的 Github 博客所在仓库的设置页面，点击 Pages，在 Custom domain 处修改域名为你之前买的域名，并勾选 Enforce HTTPS，然后点击 Save。如图

![](https://cos.luyf-lemon-love.space/images/20220521210424.png)

![](https://cos.luyf-lemon-love.space/images/20220521210459.png)

5. 在 blog/source 目录下新建一个 CNAME 文件，填入你的域名。

```
luyf-lemon-love.space
```

6. 然后一键三连，过不了多久，再打开你的浏览器，输入你自己的域名，就可以看到搭建的网站啦！

```shell
hexo clean
hexo g
hexo d
```

### Git 分支进行多终端工作 | 更换电脑

默认情况下 hexo d上传部署到github的其实是hexo编译后的文件，是用来生成网页的，不包含源文件。

可以利用 Git 分支实现快速的切换工作环境（不同的电脑撰写博客）和备份源文件。

#### Git 分支进行多终端工作

1. 在 LuYF-Lemon-love.github.io 仓库的主页新建一个 hexo 分支。

![](https://cos.luyf-lemon-love.space/images/20220521221948.png)

2. 在 LuYF-Lemon-love.github.io 仓库的设置页面 > Branches > Default branch 处修改默认分支为 hexo 。

![](https://cos.luyf-lemon-love.space/images/20220521222202.png)

3. 在本地任意目录下运行下面命令，将你的仓库克隆到本地

```shell
git clone git@github.com:LuYF-Lemon-love/LuYF-Lemon-love.github.io.git
```

4. 进入到 LuYF-Lemon-love.github.io 目录里面，把除了 .git 目录以外，其他所有文件都删掉。

5. 将之前的 blog 目录里面的文件都复制到 LuYF-Lemon-love.github.io 目录中，由于 Git 不能嵌套上传，你应该把各个主题目录里面的 .git 目录删掉（由于之前用过 yilia 主题，因此我需要删掉 butterfly 和 yilia 两个主题目录里的 .git 文件）。由于之前进阶版看板娘的克隆过一个 live2d-widget 目录，因此您应该删掉 LuYF-Lemon-love.github.io/themes/butterfly/source/live2d-widget 目录里面的 .git 目录。

6. 然后在 LuYF-Lemon-love.github.io 目录下运行下面的命令将博客的源文件上传到 Github 上。

```shell
git add .
git commit -m "add branch"
git push
```

#### 更换电脑

```shell
# 安装 git 
sudo apt-get install git

# 设置 git
git config --global user.name "yourgithubname"
git config --global user.email "yourgithubemail"

# 设置 ssh key
ssh-keygen -t rsa -C "youremail"
#生成后填到 github上，由于我还有 gitee，coding 和 轻量应用服务器，因此我需要为上面四个平台都填上 ssh 的公钥，并验证每一个平台的公钥是否上传成功
#验证 github
ssh -T git@github.com

# 安装 nodejs
sudo apt-get install nodejs
sudo apt-get install npm

# 安装 hexo，不需要运行 hexo init
sudo npm install hexo-cli -g

# 克隆 
git clone git@github.com:LuYF-Lemon-love/LuYF-Lemon-love.github.io.git

cd LuYF-Lemon-love.github.io/
npm install
npm install hexo-deployer-git --save

# 撰写博客

# 部署
hexo cl
hexo g
hexo d

# 上传源文件
git add .
git commit -m "新电脑测试"
git push

# 每次编写的时候获取新版本
# git pull 命令用于从远程获取代码并合并本地的版本
git pull
```

### 百度收录博客

由于 Github 拒绝百度爬虫的访问，因此百度不会收录 Github Pages 上的博客的。

但是部署在 Vercel 上的博客，百度时可以抓取的。因此，我们是可以利用 Vercel 让百度收录我们的博客。

由于之前已经我们已经介绍了在 Vervel 部署博客的方法，所以这里就不重复了。

#### 向百度添加站点

1. 登录 [百度站长](https://ziyuan.baidu.com/site/index)。

2. 点击添加网站，安装步骤添加网站。

```
1. 输入网站，协议头选择 https://，域名填写 Vercel 的域名如：lu-yf-lemon-love-github-io.vercel.app

2. 站点属性：信息技术

3. 验证网站有三种，我们选择 **文件验证**
```

文件验证：按照指引下载 验证文件如：baidu_verify_code-BpOQH6T9DQ.html，将验证文件放入到博客根目录的 source 目录下，如 LuYF-Lemon-love.github.io/source。

然后在 _config.yml 文件中设置以下内容

```yaml
skip_render:
  - baidu_verify_code-BpOQH6T9DQ.html
```

然后重新部署

```shell
hexo cl
hexo g
hexo d
```

访问 https://lu-yf-lemon-love-github-io.vercel.app/baidu_verify_code-BpOQH6T9DQ.html 看是否能访问，如果能够，点击验证按钮完成验证。

#### 向百度推送网站资源

1. 登录 [百度普通收录](https://ziyuan.baidu.com/linksubmit/index)

2. 可以发现普通收录方式有：API提交、sitemap、手动提交，我们选择 sitemap 方式，点击 sitemap。

3. 安装插件

```shell
npm install hexo-generator-sitemap --save 
npm install hexo-generator-baidu-sitemap --save

hexo cl
hexo g
```
4. 运行上面命令后，会发现在 LuYF-Lemon-love.github.io/public 目录下有了 baidusitemap.xml 和 sitemap.xml

5. 在 _config.yml 文件设置以下内容

```yaml
# URL
## Set your site url here. For example, if you use GitHub Page, set url as 'https://username.github.io/project'
url: https://lu-yf-lemon-love-github-io.vercel.app/
# 通用站点地图
sitemap:
  path: sitemap.xml
# 百度站点地图
baidusitemap:
  path: baidusitemap.xml
```

6. 在百度的普通收录页面的 sitemap 处填写下面内容（每天只能填一条），完成后点击提交。

```
https://lu-yf-lemon-love-github-io.vercel.app/baidusitemap.xml
https://lu-yf-lemon-love-github-io.vercel.app/sitemap.xml
```

7. 第二天和第三天的结果

![](https://cos.luyf-lemon-love.space/images/20220523141148.png)

![](https://cos.luyf-lemon-love.space/images/20220524141249.png)

8. 百度收录很慢，一般至少要半个月，你可以半个月后到百度搜索引擎中输入 site:<域名>（site:lu-yf-lemon-love-github-io.vercel.app)看看又没有收录。

#### 向百度推送网站资源 2

1. 登录 [百度普通收录](https://ziyuan.baidu.com/linksubmit/index)，获取到 token。

![](https://cos.luyf-lemon-love.space/images/20220523144002.png)

2. 安装插件

```shell
npm install hexo-baidu-url-submit --save
```

3. 在 _config.yml 文件中增添下面设置

```yaml
baidu_url_submit:
  count: 5 ## 提交最新的一个链接
  host: lu-yf-lemon-love-github-io.vercel.app ## 在百度站长平台中注册的域名
  token: your_token ## 请注意这是您的秘钥， 所以请不要把博客源代码发布在公众仓库里!
  path: baidu_urls.txt ## 文本文档的地址， 新链接会保存在此文本文档里
```

4. 修改 _config.yml 的设置

```shell
# URL
## Set your site url here. For example, if you use GitHub Page, set url as 'https://username.github.io/project'
url: https://lu-yf-lemon-love-github-io.vercel.app

# Deployment
## Docs: https://hexo.io/docs/one-command-deployment
deploy:
  - type: git
    repo: 
      github: git@github.com:LuYF-Lemon-love/LuYF-Lemon-love.github.io.git
      gitee: git@gitee.com:LuYF-Lemon-love/LuYF-Lemon-love.git
      coding: git@e.coding.net:luyanfeng-nlp/luyf-lemon-love/LuYF-Lemon-love.git
      baota: git@43.142.31.247:/www/wwwroot/repo/hexo.git
    branch: master
  - type: baidu_url_submitter ## 这是新加的
```

5. 重新部署

```shell
hexo cl
hexo g
hexo d
```

### 结语

第四篇博文写完，开心！！！！

今天，也是充满希望的一天。