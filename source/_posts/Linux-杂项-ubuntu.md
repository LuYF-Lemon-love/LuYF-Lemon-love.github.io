---
title: Linux 杂项-ubuntu
tags:
  - Linux
  - Ubuntu
  - Python
categories: 杂项
description: 介绍一些 Linux 杂项，包括：Linux 命令、Linux 系统问题。
cover: 'https://cos.luyf-lemon-love.space/images/不朽堡垒.png'
abbrlink: 3132979103
date: 2022-09-28 12:04:25
---

## 前言

介绍一些 `Linux` 杂项，包括：`Linux` 命令、`Linux` 系统问题。

操作系统：Ubuntu 20.04.4 LTS

## 参考文档

1. [Linux wget 命令详解](https://juejin.cn/post/7026184288198459406)

2. [pip3安装pillow失败](https://blog.csdn.net/weixin_50008473/article/details/119676343)

3. [GET STARTED](https://pytorch.org/get-started/locally/)

4. [普通用户添加 sudo 权限](https://subingwen.cn/linux/sudoers/)

5. [ubuntu 修改用户权限，不小心修改了sudoers文件](https://blog.csdn.net/qq_28488285/article/details/117462370)

6. [ubuntu 16.04 忘记root密码的处理方法](https://www.cnblogs.com/jefflee168/p/5583456.html)

7. [Ubuntu 重置密码](https://blog.csdn.net/qq_44721831/article/details/122182958)

8. [Ubuntu卸载Pyhon3无法进入图形界面](https://blog.csdn.net/qq_41008154/article/details/121590775)

9. [ubuntu下获取apt-get离线安装包的通用方法](https://blog.csdn.net/qq_29852231/article/details/126056228)

10. [Linux之ubuntu离线安装软件包](https://zongxp.blog.csdn.net/article/details/105994450)

11. [Ubuntu Packages Search](https://packages.ubuntu.com/)

12. [Ubuntu 如何离线安装软件包](https://luhuadong.blog.csdn.net/article/details/52183076)

13. [dpkg -i 安装软件出现各种依赖等问题解决办法](https://blog.csdn.net/qinshanjy/article/details/109014356)

14. [Index of /ubuntu/pool/main](http://cz.archive.ubuntu.com/ubuntu/pool/main/)

15. [当你的Ubuntu UI界面消失时该怎么做](https://blog.csdn.net/liluan_sama/article/details/123503708)

16. [Linux 或 Mac OS 系统通过 SCP 上传文件到 Linux 轻量应用服务器](https://cloud.tencent.com/document/product/1207/53215)

## wget 命令

`wget` 命令是 `Linux` 系统用于从 `Web` 上下载文件的命令行工具，支持 `HTTP`，`HTTPS` 和 `FTP` 协议。

### 安装

```bash
$ sudo apt install wget
```

### wget --help

```bash
$ wget --help
GNU Wget 1.20.3，非交互式的网络文件下载工具。
用法： wget [选项]... [URL]...

长选项所必须的参数在使用短选项时也是必须的。

启动：
  -V,  --version                   显示 Wget 的版本信息并退出
  -h,  --help                      打印此帮助
  -b,  --background                启动后转入后台
  -e,  --execute=命令              运行一个“.wgetrc”风格的命令

日志和输入文件：
  -o,  --output-file=文件          将日志信息写入 FILE
  -a,  --append-output=文件        将信息添加至 FILE
  -d,  --debug                     打印大量调试信息
  -q,  --quiet                     安静模式 (无信息输出)
  -v,  --verbose                   详尽的输出 (此为默认值)
  -nv, --no-verbose                关闭详尽输出，但不进入安静模式
       --report-speed=类型         以 <类型> 报告带宽。类型可以是 bits
  -i,  --input-file=文件           下载本地或外部 <文件> 中的 URL
  -F,  --force-html                把输入文件当成 HTML 文件
  -B,  --base=URL                  解析相对于 URL 的 HTML 输入文件链接 (-i -F)
       --config=文件               指定要使用的配置文件
       --no-cookies                不读取任何配置文件
       --rejected-log=文件         将拒绝 URL 的原因写入 <文件>。

下载：
  -t,  --tries=数字                设置重试次数为 <数字> (0 代表无限制)
       --retry-connrefused         即使拒绝连接也是重试
       --retry-on-http-error=ERRORS    提供以逗号分隔的列表，列出遇到时进行重试的 HTTP 错误
  -O,  --output-document=文件      将文档写入 FILE
  -nc, --no-clobber                不要下载已存在将被覆盖的文件
       --no-netrc                  不要尝试从 .netrc 获取凭据
  -c,  --continue                  断点续传下载文件
       --start-pos=偏移量          从由零计数的 <偏移量> 开始下载
       --progress=类型             选择进度条类型
       --show-progress             在任意啰嗦状态下都显示进度条
  -N,  --timestamping              只获取比本地文件新的文件
       --no-if-modified-since      不要在时间戳 (timestamping) 模式下使用
                                     if-modified-since get 条件请求
       --no-use-server-timestamps  不用服务器上的时间戳来设置本地文件
  -S,  --server-response           打印服务器响应
       --spider                    不下载任何文件
  -T,  --timeout=SECONDS           将所有超时设为 SECONDS 秒
       --dns-timeout=SECS          设置 DNS 查寻超时为 SECS 秒
       --connect-timeout=SECS      设置连接超时为 SECS 秒
       --read-timeout=SECS         设置读取超时为 SECS 秒
  -w,  --wait=SECONDS              等待间隔为 SECONDS 秒
       --waitretry=SECONDS         在获取文件的重试期间等待 1..SECONDS 秒
       --random-wait               获取多个文件时，每次随机等待间隔 (0.5~1.5)*WAIT 秒
       --no-proxy                  禁止使用代理
  -Q,  --quota=数字                设置获取配额为 <数字> 字节
       --bind-address=ADDRESS      绑定至本地主机上的 ADDRESS (主机名或是 IP)
       --limit-rate=RATE           限制下载速率为 RATE
       --no-dns-cache              关闭 DNS 查询缓存
       --restrict-file-names=系统  限定文件名中的字符为 <系统> 允许的字符
       --ignore-case               匹配文件/目录时忽略大小写
  -4,  --inet4-only                仅连接至 IPv4 地址
  -6,  --inet6-only                仅连接至 IPv6 地址
       --prefer-family=地址族      首先连接至指定家族（IPv6，IPv4 或 none）的地址
       --user=用户                 将 ftp 和 http 的用户名均设置为 <用户>
       --password=密码             将 ftp 和 http 的密码均设置为 <密码>
       --ask-password              提示输入密码
       --use-askpass=命令          指定用于请求用户名和密码的凭据管理器。
                                     如果没有提供指定命令，程序将使用 WGET_ASKPASS 或
                                     SSH_ASKPASS 环境变量。
       --no-iri                    关闭 IRI 支持
       --local-encoding=ENC        使用 ENC 作为 IRI (国际化资源标识符) 的本地编码
       --remote-encoding=ENC       使用 ENC 作为默认远程编码
       --unlink                    覆盖前移除文件
       --xattr                     在文件的拓展属性中储存元数据

目录：
  -nd, --no-directories            不创建目录
  -x,  --force-directories         强制创建目录
  -nH, --no-host-directories       不要创建主 (host) 目录
       --protocol-directories      在目录中使用协议名称
  -P,  --directory-prefix=前缀     保存文件到 <前缀>/..
       --cut-dirs=数字             忽略远程目录中 <数字> 个目录层。

HTTP 选项：
       --http-user=用户            设置 http 用户名为 <用户>
       --http-password=密码        设置 http 密码为 <密码>
       --no-cache                  不使用服务器缓存的数据。
       --default-page=NAME         改变默认页 (通常是“index.html”)。
  -E,  --adjust-extension          以合适的扩展名保存 HTML/CSS 文档
       --ignore-length             忽略头部的‘Content-Length’区域
       --header=字符串             在头部插入 <字符串>
       --compression=类型          选择压缩类型，值可以为 auto、gzip 和 none。（默认：none）
       --max-redirect              每页所允许的最大重定向
       --proxy-user=用户           使用 <用户> 作为代理用户名
       --proxy-password=密码       使用 <密码> 作为代理密码
       --referer=URL               在 HTTP 请求头包含‘Referer: URL’
       --save-headers              将 HTTP 头保存至文件。
  -U,  --user-agent=代理           标识自己为 <代理> 而不是 Wget/VERSION。
       --no-http-keep-alive        禁用 HTTP keep-alive (持久连接)。
       --no-cookies                不使用 cookies。
       --load-cookies=文件         会话开始前从 <文件> 中载入 cookies。
       --save-cookies=文件         会话结束后保存 cookies 至 FILE。
       --keep-session-cookies      载入并保存会话 (非永久) cookies。
       --post-data=字符串          使用 POST 方式；把 <字串>作为数据发送。
       --post-file=文件            使用 POST 方式；发送 <文件> 内容。
       --method=HTTP方法           在请求中使用指定的 <HTTP 方法>。
       --post-data=字符串          把 <字串> 作为数据发送，必须设置 --method
       --post-file=文件            发送 <文件> 内容，必须设置 --method
       --content-disposition       当选择本地文件名时允许 Content-Disposition
                                   头部 (实验中)。
       --content-on-error          在服务器错误时输出接收到的内容
       --auth-no-challenge         不先等待服务器询问就发送基本 HTTP 验证信息。

HTTPS (SSL/TLS) 选项：
       --secure-protocol=PR         选择安全协议，值可以是 auto、SSLv2、
                                    SSLv3、TLSv1、TLSv1_1、TLSv1_2 或 PFS
       --https-only                 只跟随安全的 HTTPS 链接
       --no-check-certificate       不要验证服务器的证书。
       --certificate=文件           客户端证书文件。
       --certificate-type=类型      客户端证书类型，PEM 或 DER。
       --private-key=文件           私钥文件。
       --private-key-type=类型      私钥文件类型，PEM 或 DER。
       --ca-certificate=文件        带有一组 CA 证书的文件。
       --ca-directory=DIR           保存 CA 证书的哈希列表的目录。
       --ca-certificate=文件        带有一组 CA 证书的文件。
       --pinnedpubkey=文件/散列值  用于验证节点的公钥（PEM/DER）文件或
                                   任何数量的 sha256 散列值，以 base64 编码、
                                   “sha256//” 开头、用“;”间隔
       --random-file=文件           用于初始化 SSL 伪随机数生成器（PRNG）的文件，
                                      应含有随机数据

       --ciphers=STR           直接设置 priority string (GnuTLS) 或 cipher list string (OpenSSL)。
                                   请小心使用。该选项会覆盖 --secure-protocol。
                                   其具体格式和字符串语法取决于对应的 SSL/TLS 引擎。
HSTS 选项：
       --no-hsts                   禁用 HSTS
       --hsts-file                 HSTS 数据库路径（将覆盖默认值）

FTP 选项：
       --ftp-user=用户             设置 ftp 用户名为 <用户>。
       --ftp-password=密码         设置 ftp 密码为 <密码>
       --no-remove-listing         不要删除‘.listing’文件
       --no-glob                   不在 FTP 文件名中使用通配符展开
       --no-passive-ftp            禁用“passive”传输模式
       --preserve-permissions      保留远程文件的权限
       --retr-symlinks             递归目录时，获取链接的文件 (而非目录)

FTPS 选项：
       --ftps-implicit                 使用隐式 FTPS（默认端口 990）
       --ftps-resume-ssl               打开数据连接时继续控制连接中的 SSL/TLS 会话
       --ftps-clear-data-connection    只加密控制信道；数据传输使用明文
       --ftps-fallback-to-ftp          回落到 FTP，如果目标服务器不支持 FTPS
WARC 选项：
       --warc-file=文件名          在一个 .warc.gz 文件里保持请求/响应数据
       --warc-header=字符串        在头部插入 <字符串>
       --warc-max-size=数字        将 WARC 的最大尺寸设置为 <数字>
       --warc-cdx                  写入 CDX 索引文件
       --warc-dedup=文件名         不要记录列在此 CDX 文件内的记录
       --no-warc-compression       不要 GZIP 压缩 WARC 文件
       --no-warc-digests           不要计算 SHA1 摘要
       --no-warc-keep-log          不要在 WARC 记录中存储日志文件
       --warc-tempdir=目录         WARC 写入器的临时文件目录

递归下载：
  -r,  --recursive                 指定递归下载
  -l,  --level=数字                最大递归深度 (inf 或 0 代表无限制，即全部下载)。
       --delete-after              下载完成后删除本地文件
  -k,  --convert-links             让下载得到的 HTML 或 CSS 中的链接指向本地文件
       --convert-file-only         只转换 URL 的文件部分（一般叫做“基础名”/basename）
       --backups=N                 写入文件 X 前，轮换移动最多 N 个备份文件
  -K,  --backup-converted          在转换文件 X 前先将它备份为 X.orig。
  -m,  --mirror                    -N -r -l inf --no-remove-listing 的缩写形式。
  -p,  --page-requisites           下载所有用于显示 HTML 页面的图片之类的元素。
       --strict-comments           用严格方式 (SGML) 处理 HTML 注释。

递归接受/拒绝：
  -A,  --accept=列表               逗号分隔的可接受的扩展名列表
  -R,  --reject=列表               逗号分隔的要拒绝的扩展名列表
       --accept-regex=REGEX        匹配接受的 URL 的正则表达式
       --reject-regex=REGEX        匹配拒绝的 URL 的正则表达式
       --regex-type=类型           正则类型 (posix|pcre)
  -D,  --domains=列表              逗号分隔的可接受的域名列表
       --exclude-domains=列表      逗号分隔的要拒绝的域名列表
       --follow-ftp                跟踪 HTML 文档中的 FTP 链接
       --follow-tags=列表          逗号分隔的跟踪的 HTML 标识列表
       --ignore-tags=列表          逗号分隔的忽略的 HTML 标识列表
  -H,  --span-hosts                递归时转向外部主机
  -L,  --relative                  仅跟踪相对链接
  -I,  --include-directories=列表  允许目录的列表
       --trust-server-names        使用重定向 URL 的最后一段作为本地文件名
  -X,  --exclude-directories=列表  排除目录的列表
  -np, --no-parent                 不追溯至父目录

请将错误报告、问题和讨论寄信至 <bug-wget@gnu.org>
和/或在 https://savannah.gnu.org/bugs/?func=additem&group=wget 开 issue 进行讨论。
```

### 默认用法

```bash
$ wget [选项]... [URL]...
```

---

使用 `wget` 下载 `redis` 的 `tar.gz` 文件 (https://download.redis.io/releases/):

```bash
$ wget https://download.redis.io/releases/redis-6.0.8.tar.gz
--2022-09-28 12:59:32--  https://download.redis.io/releases/redis-6.0.8.tar.gz
正在解析主机 download.redis.io (download.redis.io)... 45.60.125.1
正在连接 download.redis.io (download.redis.io)|45.60.125.1|:443... 已连接。
已发出 HTTP 请求，正在等待回应... 200 OK
长度： 2247528 (2.1M) [application/octet-stream]
正在保存至: “redis-6.0.8.tar.gz”

redis-6.0.8.tar.gz                        100%[===================================================================================>]   2.14M  5.61MB/s    用时 0.4s  

2022-09-28 12:59:33 (5.61 MB/s) - 已保存 “redis-6.0.8.tar.gz” [2247528/2247528])

$ ls
redis-6.0.8.tar.gz
```

注: 默认情况下会将文件下载到`当前工作目录`中。

### -O 更改下载文件的名字

```bash
$ wget -O redis.tar.gz https://download.redis.io/releases/redis-6.0.8.tar.gz
--2022-09-28 13:05:13--  https://download.redis.io/releases/redis-6.0.8.tar.gz
正在解析主机 download.redis.io (download.redis.io)... 45.60.125.1
正在连接 download.redis.io (download.redis.io)|45.60.125.1|:443... 已连接。
已发出 HTTP 请求，正在等待回应... 200 OK
长度： 2247528 (2.1M) [application/octet-stream]
正在保存至: “redis.tar.gz”

redis.tar.gz                              100%[===================================================================================>]   2.14M  7.12MB/s    用时 0.3s  

2022-09-28 13:05:13 (7.12 MB/s) - 已保存 “redis.tar.gz” [2247528/2247528])

$ ls
redis-6.0.8.tar.gz  redis.tar.gz
```

### -P 将文件下载到指定目录

```bash
$ ls
redis-6.0.8.tar.gz  redis.tar.gz
$ mkdir tmp
$ ls
redis-6.0.8.tar.gz  redis.tar.gz  tmp
$ wget -P ./tmp/ https://download.redis.io/releases/redis-6.0.8.tar.gz
--2022-09-28 13:16:50--  https://download.redis.io/releases/redis-6.0.8.tar.gz
正在解析主机 download.redis.io (download.redis.io)... 45.60.125.1
正在连接 download.redis.io (download.redis.io)|45.60.125.1|:443... 已连接。
已发出 HTTP 请求，正在等待回应... 200 OK
长度： 2247528 (2.1M) [application/octet-stream]
正在保存至: “./tmp/redis-6.0.8.tar.gz”

redis-6.0.8.tar.gz                        100%[===================================================================================>]   2.14M  7.05MB/s    用时 0.3s  

2022-09-28 13:16:51 (7.05 MB/s) - 已保存 “./tmp/redis-6.0.8.tar.gz” [2247528/2247528])

$ tree
.
├── redis-6.0.8.tar.gz
├── redis.tar.gz
└── tmp
    └── redis-6.0.8.tar.gz

1 directory, 3 files
```

### -c 断点续传下载文件

注：中途断网导致文件下载未完成，`-c` 能够恢复下载，无需从头下载。

```bash
$ tree
.

0 directories, 0 files
$ wget -c https://download.redis.io/releases/redis-6.0.8.tar.gz
--2022-09-28 13:24:44--  https://download.redis.io/releases/redis-6.0.8.tar.gz
正在解析主机 download.redis.io (download.redis.io)... 45.60.125.1
正在连接 download.redis.io (download.redis.io)|45.60.125.1|:443... 已连接。
已发出 HTTP 请求，正在等待回应... 200 OK
长度： 2247528 (2.1M) [application/octet-stream]
正在保存至: “redis-6.0.8.tar.gz”

redis-6.0.8.tar.gz  100%[==================>]   2.14M  7.28MB/s    用时 0.3s  

2022-09-28 13:24:45 (7.28 MB/s) - 已保存 “redis-6.0.8.tar.gz” [2247528/2247528])

$ tree
.
└── redis-6.0.8.tar.gz

0 directories, 1 file
```

### -b 后台下载

```bash
$ tree
.

0 directories, 0 files
$ wget -b https://download.redis.io/releases/redis-6.0.8.tar.gz
继续在后台运行，pid 为 11224。
将把输出写入至 “wget-log”。
$ ls
redis-6.0.8.tar.gz  wget-log
$ cat wget-log 
--2022-09-28 13:27:37--  https://download.redis.io/releases/redis-6.0.8.tar.gz
正在解析主机 download.redis.io (download.redis.io)... 45.60.125.1
正在连接 download.redis.io (download.redis.io)|45.60.125.1|:443... 已连接。
已发出 HTTP 请求，正在等待回应... 200 OK
长度： 2247528 (2.1M) [application/octet-stream]
正在保存至: “redis-6.0.8.tar.gz”

     0K .......... .......... .......... .......... ..........  2%  324K 7s
    50K .......... .......... .......... .......... ..........  4%  647K 5s
   100K .......... .......... .......... .......... ..........  6% 52.9M 3s
   150K .......... .......... .......... .......... ..........  9%  649K 3s
   200K .......... .......... .......... .......... .......... 11% 54.4M 2s
   250K .......... .......... .......... .......... .......... 13% 49.8M 2s
   300K .......... .......... .......... .......... .......... 15%  655K 2s
   350K .......... .......... .......... .......... .......... 18% 49.9M 2s
   400K .......... .......... .......... .......... .......... 20% 50.7M 2s
   450K .......... .......... .......... .......... .......... 22%  114M 1s
   500K .......... .......... .......... .......... .......... 25%  156M 1s
   550K .......... .......... .......... .......... .......... 27%  411M 1s
   600K .......... .......... .......... .......... .......... 29%  415M 1s
   650K .......... .......... .......... .......... .......... 31%  691K 1s
   700K .......... .......... .......... .......... .......... 34% 16.1M 1s
   750K .......... .......... .......... .......... .......... 36% 51.9M 1s
   800K .......... .......... .......... .......... .......... 38% 71.6M 1s
   850K .......... .......... .......... .......... .......... 41%  180M 1s
   900K .......... .......... .......... .......... .......... 43%  185M 1s
   950K .......... .......... .......... .......... .......... 45%  152M 1s
  1000K .......... .......... .......... .......... .......... 47%  180M 1s
  1050K .......... .......... .......... .......... .......... 50%  206M 0s
  1100K .......... .......... .......... .......... .......... 52%  181M 0s
  1150K .......... .......... .......... .......... .......... 54%  165M 0s
  1200K .......... .......... .......... .......... .......... 56%  185M 0s
  1250K .......... .......... .......... .......... .......... 59%  200M 0s
  1300K .......... .......... .......... .......... .......... 61%  186M 0s
  1350K .......... .......... .......... .......... .......... 63%  730K 0s
  1400K .......... .......... .......... .......... .......... 66% 28.6M 0s
  1450K .......... .......... .......... .......... .......... 68% 36.7M 0s
  1500K .......... .......... .......... .......... .......... 70%  139M 0s
  1550K .......... .......... .......... .......... .......... 72%  146M 0s
  1600K .......... .......... .......... .......... .......... 75%  203M 0s
  1650K .......... .......... .......... .......... .......... 77%  202M 0s
  1700K .......... .......... .......... .......... .......... 79%  199M 0s
  1750K .......... .......... .......... .......... .......... 82%  153M 0s
  1800K .......... .......... .......... .......... .......... 84%  208M 0s
  1850K .......... .......... .......... .......... .......... 86%  206M 0s
  1900K .......... .......... .......... .......... .......... 88%  192M 0s
  1950K .......... .......... .......... .......... .......... 91%  197M 0s
  2000K .......... .......... .......... .......... .......... 93%  205M 0s
  2050K .......... .......... .......... .......... .......... 95%  210M 0s
  2100K .......... .......... .......... .......... .......... 97%  204M 0s
  2150K .......... .......... .......... .......... ....      100%  220M=0.5s

2022-09-28 13:27:38 (3.93 MB/s) - 已保存 “redis-6.0.8.tar.gz” [2247528/2247528])

$ tail -f wget-log
  1850K .......... .......... .......... .......... .......... 86%  206M 0s
  1900K .......... .......... .......... .......... .......... 88%  192M 0s
  1950K .......... .......... .......... .......... .......... 91%  197M 0s
  2000K .......... .......... .......... .......... .......... 93%  205M 0s
  2050K .......... .......... .......... .......... .......... 95%  210M 0s
  2100K .......... .......... .......... .......... .......... 97%  204M 0s
  2150K .......... .......... .......... .......... ....      100%  220M=0.5s

2022-09-28 13:27:38 (3.93 MB/s) - 已保存 “redis-6.0.8.tar.gz” [2247528/2247528])


^C
$
```

注：下载日志会写入到 `wget-log` 文件中，可以使用 `tail -f wget-log` 查看。

### -i 下载多个文件

```bash
$ ls
download_list.txt
$ cat download_list.txt 
https://download.redis.io/releases/redis-6.0.8.tar.gz
https://download.redis.io/releases/redis-6.2.1.tar.gz
https://download.redis.io/releases/redis-7.0.0.tar.gz
https://download.redis.io/releases/redis-7.0.5.tar.gz
$ wget -i download_list.txt 
--2022-09-28 13:38:41--  https://download.redis.io/releases/redis-6.0.8.tar.gz
正在解析主机 download.redis.io (download.redis.io)... 45.60.125.1
正在连接 download.redis.io (download.redis.io)|45.60.125.1|:443... 已连接。
已发出 HTTP 请求，正在等待回应... 200 OK
长度： 2247528 (2.1M) [application/octet-stream]
正在保存至: “redis-6.0.8.tar.gz”

redis-6.0.8.tar.gz  100%[==================>]   2.14M  5.32MB/s    用时 0.4s  

2022-09-28 13:38:42 (5.32 MB/s) - 已保存 “redis-6.0.8.tar.gz” [2247528/2247528])

--2022-09-28 13:38:42--  https://download.redis.io/releases/redis-6.2.1.tar.gz
再次使用存在的到 download.redis.io:443 的连接。
已发出 HTTP 请求，正在等待回应... 200 OK
长度： 2438367 (2.3M) [application/octet-stream]
正在保存至: “redis-6.2.1.tar.gz”

redis-6.2.1.tar.gz  100%[==================>]   2.33M  --.-KB/s    用时 0.06s 

2022-09-28 13:38:42 (37.3 MB/s) - 已保存 “redis-6.2.1.tar.gz” [2438367/2438367])

--2022-09-28 13:38:42--  https://download.redis.io/releases/redis-7.0.0.tar.gz
再次使用存在的到 download.redis.io:443 的连接。
已发出 HTTP 请求，正在等待回应... 200 OK
长度： 2943054 (2.8M) [application/octet-stream]
正在保存至: “redis-7.0.0.tar.gz”

redis-7.0.0.tar.gz  100%[==================>]   2.81M  3.50MB/s    用时 0.8s  

2022-09-28 13:38:43 (3.50 MB/s) - 已保存 “redis-7.0.0.tar.gz” [2943054/2943054])

--2022-09-28 13:38:43--  https://download.redis.io/releases/redis-7.0.5.tar.gz
再次使用存在的到 download.redis.io:443 的连接。
已发出 HTTP 请求，正在等待回应... 200 OK
长度： 2968205 (2.8M) [application/octet-stream]
正在保存至: “redis-7.0.5.tar.gz”

redis-7.0.5.tar.gz  100%[==================>]   2.83M  2.14MB/s    用时 1.3s  

2022-09-28 13:38:45 (2.14 MB/s) - 已保存 “redis-7.0.5.tar.gz” [2968205/2968205])

下载完毕 --2022-09-28 13:38:45--
总用时：3.6s
下载了：4 个文件，2.6s (3.90 MB/s) 中的 10M
$ ls
download_list.txt   redis-6.2.1.tar.gz  redis-7.0.5.tar.gz
redis-6.0.8.tar.gz  redis-7.0.0.tar.gz
```

注：文本文件中，每一行一个 `url`。

### --limit-rate 限制下载速度

```bash
$ tree
.

0 directories, 0 files
$ wget --limit-rate=1m https://download.redis.io/releases/redis-6.0.8.tar.gz
--2022-09-28 13:45:46--  https://download.redis.io/releases/redis-6.0.8.tar.gz
正在解析主机 download.redis.io (download.redis.io)... 45.60.125.1
正在连接 download.redis.io (download.redis.io)|45.60.125.1|:443... 已连接。
已发出 HTTP 请求，正在等待回应... 200 OK
长度： 2247528 (2.1M) [application/octet-stream]
正在保存至: “redis-6.0.8.tar.gz”

redis-6.0.8.tar.gz  100%[=================>]   2.14M  1.08MB/s    用时 2.0s  

2022-09-28 13:45:49 (1.08 MB/s) - 已保存 “redis-6.0.8.tar.gz” [2247528/2247528])

$ tree
.
└── redis-6.0.8.tar.gz

0 directories, 1 file
```

注：`wget` 命令默认以全速下载，占用大量宽带。`--limit-rate=1m` 将下载速度限制为 `1m/s`。

## pip3 安装 pillow 失败

```bash
sudo apt-get install libtiff5-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python-tk
sudo apt-get install python3-dev
```

## hostnamectl -- 查看/修改当前主机的信息

```bash
luyanfeng@amax:~$ hostnamectl --help
hostnamectl [OPTIONS...] COMMAND ...

Query or change system hostname.

  -h --help              Show this help
     --version           Show package version
     --no-ask-password   Do not prompt for password
  -H --host=[USER@]HOST  Operate on remote host
  -M --machine=CONTAINER Operate on local container
     --transient         Only set transient hostname
     --static            Only set static hostname
     --pretty            Only set pretty hostname

Commands:
  status                 Show current hostname settings
  set-hostname NAME      Set system hostname
  set-icon-name NAME     Set icon name for host
  set-chassis NAME       Set chassis type for host
  set-deployment NAME    Set deployment environment for host
  set-location NAME      Set location for host
luyanfeng@amax:~$ hostnamectl
   Static hostname: amax
         Icon name: computer-server
           Chassis: server
        Machine ID: 9e3f9b2c17f34ec498bbe99396f0597d
           Boot ID: 045903c8f58741f1b1862515b085885b
  Operating System: Ubuntu 18.04.6 LTS
            Kernel: Linux 5.4.0-126-generic
      Architecture: x86-64
luyanfeng@amax:~$
```

## pip

While `Python 3.x` is installed by default on `Linux`, `pip` is not installed by default.

```bash
sudo apt install python3-pip
```

## 为普通用户添加 `sudo` 权限

```bash
$ cd /etc/
$ ll sudoers
-r-------- 1 root root 4382 Jan 21 23:16 sudoers
# 1. 切换到root用户
$ su root
Password: 		# 输入root用户的密码

# 2. 修改文件权限, 暴力一点没有关系, 反正还需要改回去, 直接 777 就行
$ chmod 777 sudoers

# 3. 使用 vim 打开这个文件
$ vim sudoers

# 4. 在文件中找到这一行, 在文件偏尾部的位置
root    ALL=(ALL)       ALL

# 5. 照葫芦画瓢, 在下边新添加一行内容如下:
root    ALL=(ALL)       ALL           # 原来的内容
susu    ALL=(ALL)       ALL          # 新添加的行, susu 是需要添加 sudo 权限的用户名

# 6. 保存退出 (先按esc, 然后输入 :wq)
# 7. 将文件改回原来的权限
$ chmod 400 sudoers
```

## `Ubuntu 18.04.6 LTS` 没有 `root` 用户但修改了 `sudoers`

### 参考文档

1. [ubuntu 修改用户权限，不小心修改了sudoers文件](https://blog.csdn.net/qq_28488285/article/details/117462370)

2. [ubuntu 16.04 忘记root密码的处理方法](https://www.cnblogs.com/jefflee168/p/5583456.html)

3. [Ubuntu 重置密码](https://blog.csdn.net/qq_44721831/article/details/122182958)

### 问题介绍

在 `Ubuntu 18.04.6 LTS`  上，为`新建的用户`添加 `sudo` 权限，需要修改 `sudoers` 文件，因此 `sudoers` 文件的权限被更改为 `777`，修改完成后，由于该系统上还没有设置 `root` 用户，无法将 `sudoers` 文件的权限更改回 `400`。

### 解决办法

#### 第一步：进入 `recovery` 模式，创建 `root` 用户，设置密码

1. 重启计算机，出现如下界面，选中如下选项，按 `Enter` 键。

![](https://cos.luyf-lemon-love.space/images/20221008121631.png)

2. 然后选中最后有（`recovery mode`）的选项，推荐选择版本较高的一个。`按 e `，请不要使用 `Enter` 键。

![](https://cos.luyf-lemon-love.space/images/20221008122027.png)

3. 找到图中红色框的 `recovery nomodeset` 并将其删掉，再在这一行的后面输入 `quiet splash rw init=/bin/bash`。完成后按 `F10` 键。

![](https://cos.luyf-lemon-love.space/images/20221008122159.png)

![](https://cos.luyf-lemon-love.space/images/20221008122212.png)

4. 在命令行输入 `passwd`，修改 `root` 用户密码。然后，按`电源`键，关机，然后按`电源`键，重启计算机。

![](https://cos.luyf-lemon-love.space/images/20221008122654.png)

#### 第二步：用 `root` 用户，修改 `sudoers` 文件权限

```bash
$ cd /etc/

# 1. 切换到root用户
$ su root
Password: 		# 输入root用户的密码

# 2. 将文件改回原来的权限
$ chmod 400 sudoers
```

## `Ubuntu 18.04.6 LTS` 卸载 `Python3` 无法进入图形界面

### 问题描述

1. `Ubuntu` 的桌面依赖自带的 `Python3`，因此请不要卸载自带的 `Python3`。如果卸载了自带的 `Python3`，将不能使用`图形界面`，只能使用`命令行`。

>如果能够`连网`，可以使用下面的步骤解决。
>
>1. 重启电脑，在终端登录。
>2. 执行 `sudo dhclient` 获取 `ip` 地址进行网络连接，通过 `ping baidu.com` 验证是否能够连网。
>3. 执行 `sudo apt-get install ubuntu-minimal ubuntu-standard ubuntu-desktop` 安装桌面。
>4. 执行 `sudo reboot` 重启电脑。

2. 由于学校的服务器需要通过`图形界面`，登录`账号密码`进行连网，因此，服务器不能连网，进而不能使用上面的解决办法。

### 解决

1. 首先通过 `sudo dhclient` 获取 `ip` 地址，然后通过 `ip addr` 或者 `ifconfig` 查看到服务器的`内网地址`，如 `10.4.3.155`。

2. 通过 `hostnamectl` 查看服务器的操作系统和架构。显示服务器的操作系统为 `Ubuntu 18.04.6 LTS`，架构为 `x86-64`。

```bash
$ hostnamectl 
   Static hostname: amax
         Icon name: computer-server
           Chassis: server
        Machine ID: 9e3f9b2c17f34ec498bbe99396f0597d
           Boot ID: 045903c8f58741f1b1862515b085885b
  Operating System: Ubuntu 18.04.6 LTS
            Kernel: Linux 5.4.0-126-generic
      Architecture: x86-64
```

3. 在本地的电脑访问 [Ubuntu Packages Search](https://packages.ubuntu.com/)，由于服务器的操作系统为 `Ubuntu 18.04.6 LTS`，因此 `Distribution` 选择 `bionic`，我们以 `ubuntu-minimal` 包为例，如下图。

![](https://cos.luyf-lemon-love.space/images/20221009140437.png)

4. 点击搜索，结果如下图。

![](https://cos.luyf-lemon-love.space/images/20221009140540.png)

5. 点击搜索结果的链接 (`bionic (18.04LTS)`)，如下图。

![](https://cos.luyf-lemon-love.space/images/20221009140734.png)

![](https://cos.luyf-lemon-love.space/images/20221009140804.png)

6. 由于服务器的架构为 `x86-64`，因此，我们选择 `amd64` 版本，如下图。

![](https://cos.luyf-lemon-love.space/images/20221009140927.png)

7. 点击 `amd64`，结果如下图。可以发现我们需要的包名为 `ubuntu-minimal_1.417_amd64.deb`，可以在`镜像服务器`的 `pool/main/u/ubuntu-meta/` 子目录中下载这个包:

![](https://cos.luyf-lemon-love.space/images/20221009141044.png)

8. 其中一个镜像服务器地址为：`http://cz.archive.ubuntu.com/ubuntu/pool/main/`。依次找到 `ubuntu-minimal_1.417_amd64.deb` 包，如下图。

![](https://cos.luyf-lemon-love.space/images/20221009141735.png)

![](https://cos.luyf-lemon-love.space/images/20221009141857.png)

![](https://cos.luyf-lemon-love.space/images/20221009141930.png)

9. 点击 `ubuntu-minimal_1.417_amd64.deb` 并下载到本地电脑。进入到下载目录，执行 `scp` 命令将下载的包传输到服务器中。

```bash
# scp 本地文件地址 服务器帐号@内网 IP:服务器文件地址
$ scp * luyanfeng@10.4.3.155:/home/luyanfeng/programs/
```

10. 通过内网 `IP` 用 `ssh` 连接服务器，执行下面命令安装 `ubuntu-minimal` 包。

```bash
$ sudo dpkg -i ubuntu-minimal_1.417_amd64.deb
```

11. 一般情况下是不能安装成功的，因为 `ubuntu-minimal` 需要一些依赖包，需要先安装依赖包，再安装 `ubuntu-minimal` 包。可以根据 `sudo dpkg -i ubuntu-minimal_1.417_amd64.deb` 命令给出的提示，像上面那样在 [Ubuntu Packages Search](https://packages.ubuntu.com/) 中找到需要的依赖包，并下载，传输到服务器，安装。

12. 类似的，我们需要按照上面步骤安装 `ubuntu-minimal`、`ubuntu-standard`、`ubuntu-desktop` 这些包，但是当安装 `ubuntu-desktop` 的依赖包时会显示 `xxx 包未被配置` 的错误。不要管它，安装其他的包。

13. 下面是我总共安装的包。

```bash
$ tree programs/
programs/
├── aptdaemon_1.1.1+bzr982-0ubuntu19.5_all.deb
├── foomatic-db-compressed-ppds_20180306-1_all.deb
├── gdm3_3.28.3-0ubuntu18.04.6_amd64.deb
├── gir1.2-ibus-1.0_1.5.17-3ubuntu5.3_amd64.deb
├── gnome-control-center_3.28.1-0ubuntu1_amd64.deb
├── gnome-menus_3.13.3-11ubuntu1_amd64.deb
├── gnome-session-common_3.28.1-0ubuntu2_all.deb
├── gnome-shell_3.28.3+git20190124-0ubuntu18.04.2_amd64.deb
├── gnome-shell-common_3.28.3+git20190124-0ubuntu18.04.2_all.deb
├── language-selector-common_0.188_all.deb
├── language-selector-gnome_0.188_all.deb
├── lsb-release_9.20170808ubuntu1_all.deb
├── microsoft-edge-stable_105.0.1343.42-1_amd64.deb
├── netplan.io_0.40.1_18.04.4_amd64.deb
├── nplan_0.40.1_18.04.4_all.deb
├── openprinting-ppds_20180306-1_all.deb
├── python3-apport_2.20.9-0ubuntu7.28_all.deb
├── python3-apt_1.6.5ubuntu0.5_amd64.deb
├── python3-aptdaemon_1.1.1+bzr982-0ubuntu19.5_all.deb
├── python3-aptdaemon.gtk3widgets_1.1.1+bzr982-0ubuntu19.5_all.deb
├── python3-defer_1.0.6-2build1_all.deb
├── python3-distupgrade_18.04.17_all.deb
├── python3-netifaces_0.10.4-0.1build4_amd64.deb
├── python3-software-properties_0.96.24.32.14_all.deb
├── python3-xkit_0.5.0ubuntu2_all.deb
├── python3-yaml_3.12-1build2_amd64.deb
├── software-properties-gtk_0.96.24.32.14_all.deb
├── system-config-printer-common_1.5.11-1ubuntu2_all.deb
├── ubuntu-advantage-tools_17_all.deb
├── ubuntu-desktop_1.417_amd64.deb
├── ubuntu-drivers-common_0.5.2_amd64.deb
├── ubuntu-minimal_1.417_amd64.deb
├── ubuntu-release-upgrader-core_18.04.17_all.deb
├── ubuntu-release-upgrader-gtk_18.04.17_all.deb
├── ubuntu-session_3.28.1-0ubuntu2_amd64.deb
├── ubuntu-standard_1.417_amd64.deb
├── update-manager_18.04.11_all.deb
├── update-notifier_3.192_amd64.deb
├── xorg_7.7+19ubuntu7_amd64.deb
└── xserver-xorg_7.7+19ubuntu7_amd64.deb

0 directories, 40 files
$
```

14. `microsoft-edge-stable_105.0.1343.42-1_amd64.deb` 这个包是 `edge` 浏览器的安装包 (可以从 https://www.microsoft.com/zh-cn/edge 处下载)，因为我需要浏览器，才能通过学校的账号连网。

15. 这时服务器的`图形界面`应该可以使用了，但还是`卡卡的感觉`，通过 `edge` 连网，输入下面命令再次安装桌面。

```bash
$ sudo apt-get install -f -y
$ sudo apt-get update
$ sudo apt-get install ubuntu-minimal ubuntu-standard ubuntu-desktop
$ sudo reboot
```

16. 电脑重启后，应该就会直接进入到图形界面了。

## Linux 系统通过 SCP 上传文件到 Linux 服务器 (包括下载文件)

### 上传文件

在本地机器执行以下命令，向 `Linux` 服务器上传文件。

```shell
$ scp 本地文件地址 服务器帐号@服务器 IP:服务器文件地址
$ scp foo luyanfeng@10.4.6.15:/home/luyanfeng/my_code/temp/
luyanfeng@10.4.6.15's password: 
foo                                           100%    0     0.0KB/s   00:00    
$ 
```

### 下载文件

在本地机器执行以下命令，将 `Linux` 服务器上的文件下载至本地。

```shell
$ scp 服务器帐号@服务器 IP:服务器文件地址 本地文件地址 
$ scp luyanfeng@10.4.6.15:/home/luyanfeng/my_code/temp/lyf .
luyanfeng@10.4.6.15's password: 
lyf                                           100%    0     0.0KB/s   00:00    
$
```

## 结语

第二十八篇博文写完，开心！！！！

今天，也是充满希望的一天。