---
title: Linux命令-ubuntu
tags: Linux
categories: 计算机基础
description: 介绍一些 Linux 常用命令
cover: https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220513124700.png
abbrlink: 1327326170
date: 2022-05-08 16:14:51
---

### 前言

Linux 命令是对 Linux 系统进行管理的命令。对于 Linux 系统来说，无论是中央处理器、内存、磁盘驱动器、键盘、鼠标，还是用户等都是文件，Linux 系统管理的命令是它正常运行的核心。Linux 命令在系统中有两种类型：内置 Shell 命令和 Linux 命令。

Linux 命令是程序员必备技能。

操作系统：Ubuntu 20.04.4 LTS

### 参考文档

1. [苏丙榅老师的 Linux 教程](https://subingwen.cn/linux/)

### Linux 常用命令

#### 清空终端

```shell
Ctrl + l

clear

reset
```

#### 任务管理器

top 命令

```shell
top
```

htop 命令

```shell
# 安装 htop 命令
sudo apt-get install htop

htop
```

#### 当前用户

```shell
whoami
```

#### 用户当前的工作目录

```shell
pwd
```

#### . || ..

```shell
# 当前目录
.

./

# 上一级目录
..

../
```

#### 切换到用户的 home 目录

```shell
cd 

cd ~
```

#### 登录 root 用户

```shell
# 登录 root 用户
su root

# 退出 root 用户
exit
```

#### 查看目录中的文件信息

```shell
# 查看当前目录的文件
ls

# 显示隐藏文件
ls -a

# 显示目录中文件的详细信息（默认文件大小单位为字节）
ls -l

# 以K,M,G为大小单位直观显示目录中的文件
ls -lh

# 直观显示目录文件
ls -F

# ubuntu 中 ll 相当于 ls -laF
```

#### 查看命令所在的实际路径

- which 命令只能查看非内建的 shell 指令所在的实际路径
- 有些命令是直接写到内核中的，无法查看

```shell
# 查看 pwd 命令所在的实际位置
which pwd
```

#### 输出环境变量 PATH

```shell
echo $APTH
```

#### 历史命令

```shell
history
```

#### 自动补齐

```shell
Tab
```

#### 创建目录

```shell
mkdir 新目录名

# -p 创建多级目录
mkdir grandfather/father/grandson -p
```

#### 删除空目录

```shell
rmdir 目录名
```

#### 删除目录 || 删除文件

- -r 递归删除目录
- -i：删除的时候给出提示信息
- -f: 强制删除文件，没有提示信息

```shell
rm 目录名 -r
```

#### 树状结构查看目录信息

```shell
# 安装 tree 命令
sudo apt install tree

# 查看当前目录的结构，n 为显示的目录层数
tree [-L n]

# 查看指定目录的结构
tree 目录名 [-L n]

tree -L 1
```

#### 拷贝文件

- -r 拷贝目录

```shell
cp 源文件 目标文件

# 目录 A，通过拷贝得到不存在的目录 B
cp A B -r

# 将目录 A 拷贝进目录 B 中
cp A B -r

# 将目录 A 中的一个或者多个文件拷贝到目录 B 中
cp A/a.txt B

# 将目录 A 中的所有文件拷贝到目录 B 中
cp A/* B -r
```

#### 移动文件

```shell
# 将文件 A 或目录 A 移动到目录 B 中
mv A B

# 文件 A 或者 目录 A 改名为 B
mv A B

# 用文件 A 覆盖文件 B，文件 A 被删除，只剩下文件 B
mv A B
```

#### 显示文件内容

```shell
# 将文件内容显示到终端（文件内容太多，只显示部分内容）
cat 文件名
```

以翻屏的方式查看文件中的内容1：

- Enter：显示下一行
- Space：向下滚动一屏
- b：返回上一屏
- q：退出

```shell
more 文件名
```

以翻屏的方式查看文件中的内容2

- Enter：显示下一行
- Space：向下滚动一屏
- b：返回上一屏
- q：退出
- 上下键：上下滚动

```shell
less 文件名
```

查看文件头部的若干行信息

- 默认显示文件的前10行

```shell
head 文件名

# 指定显示头部的前多少行
head -行数 文件名
```

查看文件尾部的若干行信息

- 默认显示文件的后10行

```shell
tail 文件名

# 指定显示尾部的后多少行
tail -行数 文件名
```

#### 创建软链接

```shell
ln -s 源文件路径(建议绝对路径，这样软链接移动位置后依旧能够实现链接) 软链接文件的名字(可以带路径)
```

#### 创建硬链接

- 目录是不允许创建硬链接的

```shell
ln 源文件 硬链接的名字（可以带路径）
```

#### 修改文件权限

##### 文字设定法

- who:
    - u: user -> 文件所有者
    - g: group -> 文件所属组用户
    - o: other -> 其他
    - a: all -> u + g + o
- 权限操作:
    - +: 添加权限
    - -: 去除权限
    - =: 权限的覆盖
- mod -> 权限:
    - r: read
    - w: write
    - x: execute
    - -: 没有权限

```shell
chmod who [+|-|=] mod 文件名

# 将文件所有者权限设置为读和执行
chmod u=rx b.txt
```

##### 数字设定法

- 权限操作:
    - +: 添加权限
    - -: 去除权限
    - =: 权限的覆盖，可以省略
- mod -> 权限:
    - 0：没有权限
    - 1: execute, x
    - 2: write, w
    - 3: w + x
    - 4: read, r
    - 5: r + x
    - 6: r + w
    - 7: r + w + x

```shell
# 权限：user -> r + x, group -> r + w, ohter -> r + w + x
chmod 567 a.txt
```

#### 修改文件所有者和所属组

```shell
# 修改所有者
sudo chown 新的所有者 文件名

sudo chown li4 a.c

# 修改所有者和所属组
sudo chown 新的所有者:新的所属组 文件名

sudo chown li4:zhang3 a.c

# 修改所属组
sudo chgrp 新的所属组 文件名

sudo chgrp li4 a.c
```

#### 创键一个空文件

- 如果文件已经存在，只会更改文件的修改日期，对内容没有影响

```shell
touch 文件名
```

#### 打印字符串

```shell
echo 字符串

echo hello, world
```

#### 输出日期

```shell
date
```

#### 重定向

- ">" 将文件内容写入到指定文件中，如果文件中已有数据，则会使用新数据覆盖原数据
- ">>" 追加在文件的尾部

```shell
# 日期信息被写到文件 a.txt 中
date > a.txt

# 日期信息被追加到 a.txt 中
date >> a.txt

```

#### 切换用户

- su 只切换用户，当前的工作目录不会发生变化
- su - 不仅会切换用户也会切换工作目录，工作目录切换为新用户的 home 目录
- 从用户 A 切换到用户 B，如果还想再切换回用户 A，可以直接使用 exit

```shell
su 用户名

su - 用户名

exit
```

#### 添加新用户

```shell
# 所有 linux 版本
sudo adduser 用户名

# ubuntu -m: 创建用户 home 目录 -s: 设置命令解析器
sudo useradd -m -s /bin/bash 用户名
```

#### 删除用户

```shell
# 所有 linux 版本
# 删除用户，添加参数 -r 可以一并删除用户的 home 目录
sudo userdel 用户名 -r

# ubuntu 也支持 deluser
# deluser 不能添加参数 -r，home 目录不能被删除，需要使用 rm 命令删除用户的 home 目录
sudo rm /home/用户名 -r
```

#### 添加 || 删除用户组

```shell
# 基于普通用户添加新的用户组
sudo groupadd 组名

# 基于普通用户删除用户组
sudo groupdel 组名
```

#### 修改密码

```shell
# 修改当前用户的密码
passwd

# 修改非当前用户的密码
sudo passwd 用户名

# 修改 root 用户的密码
sudo passwd root
```

#### 文件压缩（.tar.gz，tar.bz2，.tgz）

- .tgz 文件等同于 .tar.gz 文件
- c: 创建压缩文件
- z: 使用 gzip 的方式进行文件压缩，标准后缀名 .tar.gz
- j: 使用 bzip2 的方式进行文件压缩,标准后缀名 .tar.bz2
- v: 压缩过程中显示压缩信息，可以省略不写
- f: 指定压缩包的名字

```shell
tar 参数 压缩包的名字 要压缩的文件（文件或者目录）

# 压缩目录中的所有文件
tar zcvf all.tar.gz *

tar jcvf all.tar.bz2 a.c b.c
```

#### 文件解压缩（.tar.gz，.tar.bz2，.tgz）

- .tgz 文件等同于 .tar.gz 文件
- x: 释放压缩文件中的内容
- z: 使用 gzip 的方式进行文件压缩，标准后缀名 .tar.gz
- j: 使用 bzip2 的方式进行文件压缩，标准后缀名 .tar.bz2
- v: 解压缩过程中显示解压缩信息
- f: 指定压缩包的名字
- -C 解压到指定目录

```shell
# 解压到当前目录中
tar 参数 压缩包名

# 解压到指定目录
tar 参数 压缩包名 -C 解压目录

# 将 all.tar.gz 压缩包解压缩到 temp 目录中
tar zxvf all.tar.gz -C temp
```

#### 文件压缩和解压缩（.zip)

```shell
# ubuntu 安装
sudo apt install zip
sudo apt install unzip

# 压缩
# 自动添加压缩包后缀 .zip，如果要压缩目录，需要添加参数 -r
zip [-r] 压缩包名 要压缩的文件

zip all a.c b.c -r

# 解压所
# 解压到当前目录中
unzip 压缩包名

# 解压到指定目录, 需要添加参数 -d
unzip 压缩包名 -d 解压目录

# 将 all.zip 解压缩到 temp 目录中
unzip all.zip -d temp/
```

#### 文件压缩和解压缩（.rar)

```shell
# ubuntu 安装
sudo apt install rar

# 压缩，需要添加参数 a，自动添加压缩包后缀 .rar
# 压缩目录，需要添加参数 -r

rar a 压缩包名 要压缩的文件 [-r]

rar a all a.c b.c -r

# 解压缩，需要添加参数 x，rar 和 unrar 都可以
# 解压缩到当前目录中
rar/unrar x 压缩包名字

# 解压缩到指定目录中
rar/unrar x 压缩包名 解压目录

rar x all.rar temp/
```

#### 文件压缩和解压缩（.tar.xz)

```shell
# 压缩
# 第一步
tar cvf xxx.tar 要压缩的文件

# 第二步，.tar 文件变为 .tar.xz
xz -z xxx.tar

tar cvf all.tar a.c b.c
xz -z all.tar

# 解压缩
#第一步
xz -d xxx.tar.xz

#第二步：将 xxx.tar 中的文件释放到当前目录
tar xvf xxx.tar

xz -d all.tar.xz
tar xvf all.tar
```

#### 查找文件

##### 通过文件名查找

- 精确查找
- 模糊查询：* 可以匹配0个或者多个字符，? 用于匹配单个任意键字符
- 模糊查询：建议（非必须）将带有通配符的文件名写到引号中（单引号或者双引号都可以）

```shell
# 根据文件名搜索
find 搜索路径 -name 要搜索的文件名

find /root -name "a.c"
find /root -name "*.txt"
```

##### 通过文件类型查找

| 文件类型 | 普通文件 |  目录 | 软链接 | 字符设备 | 块设备 | 管道 | 本地套接字 |
| :-----: | :-----: | :-----: | :-----: | :-----: | :-----: | :-----: | :-----: |
|   符号   |    f    |    d    |    l    |    c    |    b    |    p    |    s    |

```shell
find 搜索路径 -type 文件类型

find /root -type l
```

##### 通过文件大小查找

- k(小写)，M(大写)，G(大写)
- -size 4k: 表示的区间为(4-1k，4k]
- -size -4k: [0k，4-1k]
- -size +4k: (4k，正无穷)

```shell
find 搜索路径 -size [+|-]文件大小

find ./ -size -3M

# 搜索当前目录下大于 1M 并且小于等于 3M 的文件
find ./ -size +1M -size -4M
```

###### 通过目录层级查找

- -maxdepth: 最多搜索到第多少层目录
- -mindepth: 至少从第多少层开始搜索
- 这两个参数不能单独使用，而且必须写在其他参数前面

```shell
# 查找文件，从根目录开始，最多搜索 5 层
sudo find / -maxdepth 5 -name "*.c"

# 查找文件，从根目录开始，至少从第 5 层开始搜索
sudo find / -mindepth 5 -name "*.c"
```

###### 同时执行多个操作

exec 参数

- 在 exec 参数后添加其他需要执行的 shell 命令

```shell
find 搜索路径 参数 参数值 -exec shell命令 {} \;

find ./ -maxdepth 2 -name "*.c" -exec ls -l {} \;
```

ok 参数

- 与 exec 使用方式类似，但是提供交互式操作

```shell
find 搜索路径 参数 参数值 -ok shell命令 {} \;

find ./ -maxdepth 1 -name "*.c" -ok ls -l {} \;
find ./ -maxdepth 1 -name "*.c" -ok rm -rf {} \;
```

xargs 参数

- xargs 的效率比使用 exec 效率高
- exec: 将 find 查询的结果逐条传递给后边的 shell 命令
- xargs: 将 find 查询的结果一次性传递给后边的 shell 命令

```shell
find 搜索路径 参数 参数值 | xargs shell命令

find ./ -maxdepth 1 -name "*.c" | xargs ls -l
```

#### 查询文件的内容

grep 命名

- -r: 如果需要搜索目录中的文件内容，需要进行递归操作，必须指定该参数
- -i: 对应搜索的关键字，忽略字符大小写的差别
- -n: 显示结果在文件中的行号

```shell
# 建议将搜索内容放到引号中（单引号双引号都可以）
grep "搜索的内容" 搜索的路径/文件 参数

grep "include" ./ -rn
```

#### 轻量版 find 命令

- 在使用 locate 命令之前，先使用 updatedb 命令手动更新数据库

```shell
# 安装
sudo apt install mlocate

sudo updatedb

# 搜索所有目录以 test 开头的文件
locate test

# 指定的目录必须使用绝对路径
locate /home/zhang3/test

# -i 参数忽略文件名的大小写
locate TEST -i

# -n 显示前 n 个结果
locate test -n 5

# -r 参数基于正则表达式匹配匹配文件名
locate -r "\.cpp$"
```


#### 帮助命令

```shell
命令 --help

grep --help
ls --help
```

#### ubuntu 中打开和关闭终端

```shell
# 打开终端
Ctrl + Alt + T

# 关闭终端
exit

Ctrl + D
```

### 结语

第三篇博文写完，开心！！！！

今天，也是充满希望的一天。