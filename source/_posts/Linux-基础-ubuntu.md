---
title: Linux 基础-ubuntu
tags:
  - Linux
  - Vim
  - C/C++
  - GCC
  - G++
categories: 计算机基础
description: 介绍一些 Linux 基础知识，包括 Linux 操作系统、 Vim 的使用、GCC、静态链接库、动态链接库、Makefile 和 GDB 调试。
cover: >-
  https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220520215149.png
abbrlink: 4256061298
date: 2022-05-24 14:35:22
---

### 前言

Linux 是 UNIX 操作系统的一个克隆系统，但是 Linux 操作系统是开源的。因此 Linux 自从但是以来就是企业级服务器的首选操作系统。它和 Git 一直是学生从学校到企业的两个拦路虎。所以学习 Linux 操作系统是必要的。

操作系统：Ubuntu 20.04.4 LTS。

### 参考文档

1. [苏丙榅老师的 Linux 教程](https://subingwen.cn/linux/)
2. [vim 插件快速安装](https://subingwen.cn/linux/vimplus/)
3. [vimplus修改终端字体为Droid Sans Mono Nerd Font](https://blog.csdn.net/steveforever/article/details/109231599)

### 初识 Linux 操作系统

#### Linux 的发展历程

{% timeline 1991 %}
<!-- timeline 年初 -->
林纳斯 · 托瓦兹开始在一台 386sx 兼容微机上学习 minix 操作系统。
<!-- endtimeline -->
<!-- timeline 04 -->
林纳斯 · 托瓦兹开始酝酿并着手编制自己的操作系统。
<!-- endtimeline -->
<!-- timeline 04-13 -->
林纳斯 · 托瓦兹在 comp.os.minix 上宣布自己已经成功地将 bash 移植到了 minix 上了。
<!-- endtimeline -->
<!-- timeline 10-05 -->
林纳斯 · 托瓦兹在 comp.os.minix 宣布 Linux 内核已经诞生。
<!-- endtimeline -->
{% endtimeline %}
{% timeline 1992 %}
<!-- timeline -->
Linux 与其他 GNU 软件结合，完全自由的操作系统 GNU/Linux 诞生。
<!-- endtimeline -->
{% endtimeline %}
{% timeline 1993 %}
<!-- timeline -->
Linux 0.99 的代码量有十万行，用户有 10 万个左右。
<!-- endtimeline -->
{% endtimeline %}
{% timeline 1994 %}
<!-- timeline 03 -->
Linux 1.0 发布，公有 17 万行代码。不久正式采用 GPL 协议。
<!-- endtimeline -->
{% endtimeline %}

**Linux 特性**

- Linux 是一个基于文件的操作系统。甚至像鼠标键盘等硬件都被抽象成一个设备文件来管理。

- 多个用户可以同时登录，每个用户同时可以运行多个应用程序。

- 是一个自由软件，免费且开源。

**POSIX** ，英文全称为 Portable Operating System Interface for Computing Systems，是由 IEEE 和 ISO/IEC 开发的一套接口标准，保证所编制的应用程序在源代码一级可以在多种操作系统上可移植。中文名为 可移植操作系统接口。

**Linux 发行版**，对于初学者接触的两个最常见的发行版为

- [CentOS Linux](https://www.centos.org) 发行版是一个稳定、可预测、可管理和可重现的平台，源自红帽 Linux（ RHEL ）的源代码。

- [Ubuntu](https://ubuntu.com) 发行版最大的特点就是具有优秀易用的桌面环境，基于 Debian Linux 发行版。

#### Linux 内核

Linux 内核主要包含 5 个子系统：进程调度、内存管理、虚拟文件系统、网路接口和进程间通信。

- 进程调度 SCHED 是操作系统对进程的多种状态之间的转换策略。

  - SCHED_OTHER: 分时调度策略（默认），用于针对普通进程的时间片轮转调度策略。

  - SCHED_FIFO: 实时调度策略，是针对运行的实时性要求比较高、运行时间短的进程调度策略。

  - SCHED_RR: 实时调度策略，是针对实时性要求比较高、运行时间比较长的进程调度策略。

- 内存管理 MMU
  
  - 内存管理是多个进程间的内存共享策略。指的是虚拟内存。

  - 虚拟内存可以让进程拥有比实际物理内存更大的内存。

  - 每个进程的虚拟内存存在不同的地址空间，多个进程的虚拟内存不会冲突。

- 虚拟文件系统 VFS

  - Linux 支持多种文件系统，目前最常用的文件系统为 ext2 和 ext3。

- 网路接口

  - 网络接口包括网络协议和驱动程序。

  - 网络协议是一种网络传输的通信标准。

  - 网络驱动程序是硬件设备的驱动程序。

- 进程间通信

  - 通信方式包括管道、信号、消息队列、共享内存和套接字。

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220525145427.png "Linux 内核")

#### Linux 目录

Linux 文件系统是一个树状结构，只有一个单独的顶级目录结构，叫做`根目录`，更目录的子目录结构相对固定。

- bin: 二进制文件目录，存储了可执行程序。

- sbin: root 用户使用的一些二进制可执行程序。

- etc: 应用程序的配置文件目录。

- lib: 存储了一些动态链接库和静态链接库。

- media: 挂载目录，挂载外部设备：光驱，扫描仪等。

- mnt: 临时挂载目录，如 U 盘。

- proc: 内存使用的映射目录，操作系统使用。

- tmp: 临时目录，存放临时数据，重启电脑时，数据被自动删除。

- boot: 存储了开机相关的配置。

- home: 普通用户的家目录。

- root: root 用户的家目录。

- dev: 设备目录，如 键盘、鼠标。

- lost+food: 存储用于电脑异常关闭/崩溃时恢复系统的文件。

- opt: 第三方软件的安装目录。

- var: 存储日志等经常发生变化的文件。

- usr: 系统资源目录。
 
  - /usr/bin: 可执行的二进制应用程序。

  - /usr/games: 游戏目录。

  - /usr/include: 包含标准头文件。

  - /usr/local: 第三方软件安装目录。

#### 文件路径

**相对路径**

- `./`: 等价于 `.`，代表当前目录。
- `../`: 等价于 `..`，代表上一级目录。

**绝对路径**：从系统磁盘起始节点开始描述的路径。如 `/usr/games`。

#### 命令解析器

命令解析器经常有 `bash` 和 `shell` 两个名字。`shell` 是 Bourne 为 `Unix` 操作系统写的命令解析器。`bash` 是 Bourne 为 `Linux` 操作系统写的命令解析器。

```shell
# 打印环境变量
echo $PATH
```

**命令提示行**

```shell
root@lyfubuntu:~/local#
```

- root: 当前登录的用户的用户名。

- @: at -> 在

- lyfubuntu: 主机名。

- ~: 表示家目录。

- ~/local: 表示当前用户所在的工作目录。

- #: 表示当前用户是 root 用户。

- $: 表示当前用户是普通用户。

**命令行快捷键**

- Tab: 命令自动补齐。

- Ctrl+p: 显示上一个输入的历史命令。等价于 ↑ 键。

- Ctrl+n: 显示下一个输入的历史命令。等价于 ↓ 键。

- Ctrl+a: 光标移动到命令行首。等价于 Home 键。

- Ctrl+e: 光标移动到命令行尾。等价于 End 键。

- Ctrl+u: 删除光标前的部分字符串。

- Ctrl+k: 删除光标后的部分字符串。

- →: 光标向右移动一个字符。

- ←：光标向左移动一个字符。

- Backspace: 删除光标前的一个字符。

- Delete: 删除光标后的一个字符。

### Vim 的使用

`Vim` 是 Linux 操作系统中一款功能强大的文本编辑器，支持安装各种插件，但是所有的操作都是通过键盘快捷键操作完成的。`Vim` 是 `Vi` 的增强版。

#### 安装

```shell
sudo apt install vim

vim --version

# 查看使用文档
vimtutor
```

#### Vim 的模式

Vim 一共有三种模式，分别是 `命令模式`，`末行模式`，`编辑模式`，默认进入的是 `命令模式`。

##### 命令模式下的操作

```shell
# 打开一个文件，如果文件不存在，并且退出的时候进行了保存，文件会被创建。
vim 文件名
```

##### 保存退出

```shell
# 先按住 shift 键，然后连续按两次 z
ZZ
```

##### 代码格式化

```shell
# 假设写的 c/c++ 代码没有对齐，通过该命令可以对齐代码
# 一定要注意最后一个字符是大写的 G，因此需要先按 shift 键
gg=G
```

##### 光标的移动

- ↑ | k: 光标上移
- ↓ | j: 光标下移
- ← | h: 光标左移
- → | l: 光标右移
- 0: 光标移动到行首
- $: 光标移动到行尾
- gg: 光标移动到第一行的开始
- G: 光标移动到最后一行的开始
- nG: 行跳转，n 代表要跳转到哪一行
- n+Enter: 相对跳转 n 行，从光标所在行往下跳 n 行

##### 删除（剪切）命令

- x: 删除光标盖住的字符
- X: 删除光标前边的字符
- dw: 删除光标所在单词的右边字符
- d0: 删除光标前的字符串
- d$ | D: 删除光标后的字符串
- dd: 删除光标所在行
- ndd: 从光标所在行开始删除 n 行

##### 撤销和反撤销

- u: 撤销，等价于 windows 中的 ctrl+z
- Ctrl+r: 反撤销，等价于 windows 中的 ctrl+y

##### 复制和粘贴

- p: 粘贴到光标所在行的下边
- P: 粘贴到光标所在行的上边
- yy: 复制光标所在行
- nyy: 从光标所在行向下复制 n 行

##### 可视模式

- v: 进入字符可视模式（ Characterwise visual mode )，文本选择是以字符为单位的。
- V: 进入行可视模式（ Linewise visual mode )，文本选择是以行为单位的。
- Ctrl+v: 进入块可视模式（ Blockwise visual mode )，可以选择一个矩形形状的文本。

进入到可视模式后

- h: 光标向左移动
- j: 光标向下移动
- k: 光标向上移动
- l: 光标向右移动
- d: 剪切
- y: 复制
- p: 粘贴到光标的后边
- P: 粘贴到光标的前边

##### 代码注释

代码块注释使用块可视模式：

1. Ctrl+v 进入块可视模式
2. 通过 k 和 j 使得光标上移或者下移，选中多个代码行的开头。
3. 选择完毕后，按大写的 I 键，输入注释符。
4. 按 Esc 键。

删除代码块注释：

1. Ctrl+v 进入块可视模式
2. 移动光标选中注释符
3. 按 d 键

##### 替换

- r: 替换光标后的单个字符
- R: 替换光标后的多个字符，按 Esc 键结束替换

##### 查找

- /: `n` 从当前位置向下，`N` 从当前位置向上
- ?: `n` 从当前位置向上，`N` 从当前位置向下
- #: 'n' 从当前位置向上，`N` 从当前位置向下，光标需要先放置在被搜索的关键字上。

##### 查看 man 文档

man 文档一共有 9 个章节，具体如下：

- section 1: Linux 提供的所有 shell 命令
- section 2: 系统函数（由内核提供）
- section 3: 库调用函数（程序库中的函数）
- section 4: 特殊文件（通常存放在 /dev 目录中）
- section 5: 系统配置文件格式和约定，比如：/etc/passwd
- section 6: 游戏
- section 7: 杂项（包括宏包和约定）
- section 8: 系统管理命令（通常针对 root 用户）
- section 9: 内核例程（非标准）

```shell
# 打开 man 文档首页
man man

# 退出
q

# 查询第一章的 shell 命令
man 1 cp

# 查询第二章的系统函数（如：read, write, open 等）
man 2 read

# 查询第三章的标准的库函数（如：fread, fwrite, fopen 等）
man 3 fread

# 查询第五章的特殊的配置文件说明，比如：/etc/passwd 或者 /etc/group 
man 5 passwd
```

Vim 的命令模式下

```shell
# 首先将光标放在要查看的函数上
章节号（可选）+ K
```

##### 切换到编辑模式

- i: 从光标的前边开始输入
- a: 从光标的后边开始输入
- o: 在光标下边新建行，在新行中输入
- s: 删除光标盖住的字符，从删除的字符位置开始输入
- I: 从当前行行首开始输入
- A: 从当前行行尾开始输入
- O: 在光标上边新建行，在新行中输入
- S: 删除当前行，在当前行开始输入
- Rsc: 从编辑模式退回到命令模式

#### 末行模式下的操作

##### 命令模式和末行模式相互切换

```shell
# 命令模式切换到末行模式
：

# 末行模式切换到命令模式
1. 按两次 Esc
2. 末行模式执行完成一个命令后，自动退回命令模式
```

##### 保存退出

- q: 退出，如果没有保存文件，Vim 会给出提示是否要保存
- q!: 直接退出，不保存
- w: 保存，不退出
- wq | x: 保存退出

##### 替换

```shell
# /g 表示做整行替换
# 只对光标所在行进行替换
s/被替换的关键字/新的关键字/g

# [行号1，行号2] 是一个从小到大的范围，对这个范围进行替换
行号 1, 行号 2s/被替换的关键字/新的关键字/g

# 对所有行进行替换
%s/被替换的关键字/新的关键字/g
```

##### 分屏

- sp: 水平分屏，多个窗口垂直排列，多个窗口中显示同一文件里的内容
- vsp: 垂直分屏，多个窗口水平排列，多个窗口中显示同一个文件里的内容
- Ctrl+w+w: 光标在打开的屏幕之间切换，按住 Ctrl 然后按两次 w
- qall: 同时退出多个屏幕
- wqall: 同时保存退出多个屏幕
- sp 文件名：分屏的同时指定打开的文件的名字
- vsp 文件名：分屏的同时指定打开的文件的名字

```shell
# 在打开文件的时候指定分屏
# 水平分屏
vim -o 文件1,文件2,文件3
# 垂直分屏
vim -O 文件1,文件2,文件3
```

##### 行跳转

```shell
:行号 # 输入完行号之后敲 Enter 键
```

##### 执行 shell 命令

```shell
# 语法
:!shell命令

# 举例
:!ls
```

#### Vim 配置文件

- ~/.vimrc: 用户级别的配置文件
- /ect/vim/vimrc: 系统级别的配置文件
- 用户级别的配置文件优先级高

#### Vim 插件快速按安装

[vimplus](https://github.com/chxuan/vimplus): An automatic configuration program for vim.

Linux 64-bit

##### Linux 64-bit 支持以下发行版

<table>
<tr>
<td><a href="https://distrowatch.com/table.php?distribution=ubuntu"><img src="https://distrowatch.com/images/yvzhuwbpy/ubuntu.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=ubuntukylin"><img src="https://distrowatch.com/images/yvzhuwbpy/ubuntukylin.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=debian"><img src="https://distrowatch.com/images/yvzhuwbpy/debian.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=kali"><img src="https://distrowatch.com/images/yvzhuwbpy/kali.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=deepin"><img src="https://distrowatch.com/images/yvzhuwbpy/deepin.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=mint"><img src="https://distrowatch.com/images/yvzhuwbpy/mint.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=elementary"><img src="https://distrowatch.com/images/yvzhuwbpy/elementary.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=centos"><img src="https://distrowatch.com/images/yvzhuwbpy/centos.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=fedora"><img src="https://distrowatch.com/images/yvzhuwbpy/fedora.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=arch"><img src="https://distrowatch.com/images/yvzhuwbpy/arch.png"/></a><p align="center"></p></td>
</tr>
<tr>
<td><a href="https://distrowatch.com/table.php?distribution=manjaro"><img src="https://distrowatch.com/images/yvzhuwbpy/manjaro.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=opensuse"><img src="https://distrowatch.com/images/yvzhuwbpy/opensuse.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=gentoo"><img src="https://distrowatch.com/images/yvzhuwbpy/gentoo.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=parrot"><img src="https://distrowatch.com/images/yvzhuwbpy/parrot.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=raspios"><img src="https://distrowatch.com/images/yvzhuwbpy/raspios.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=freebsd"><img src="https://distrowatch.com/images/yvzhuwbpy/freebsd.png"/></a><p align="center"></p></td>
<td><a href="https://distrowatch.com/table.php?distribution=alpine"><img src="https://distrowatch.com/images/yvzhuwbpy/alpine.png"/></a><p align="center"></p></td>
</tr>
</table>

##### 安装vimplus

```shell
git clone https://github.com/chxuan/vimplus.git ~/.vimplus
cd ~/.vimplus
./install.sh //不加sudo
```

##### 设置Nerd Font

为防止vimplus显示乱码，需设置linux终端字体为`Droid Sans Mono Nerd Font`。

1. 在[nerd-fonts](https://github.com/ryanoasis/nerd-fonts) 的 readme.md 文件的 Patched Fonts 处下载字体

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220526213314.png)

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220526213407.png)

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220526213450.png)

2. 进入complete文件夹，选择下载

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220526213616.png)

3. 双击下载的字体文件，进行安装

4. 在 terminal 设置，右击选择配置文件首选项(P)

5. 选择字体

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220526213925.png)

![](https://picbed-1311975210.cos.ap-nanjing.myqcloud.com/images/20220526214011.png)


##### 多用户支持

将vimplus在某个用户下安装好后，若需要在其他用户也能够使用vimplus，则执行

```shell
sudo ./install_to_user.sh username1 username2 //替换为真实用户名
```

##### 更新vimplus

紧跟vimplus的步伐，尝鲜新特性

```shell
./update.sh
```

##### 自定义

- ~/.vimrc 为 vimplus 的默认配置，一般不做修改
- ~/.vimrc.custom.plugins 为用户自定义插件列表，用户增加、卸载插件请修改该文件
- ~/.vimrc.custom.config 为用户自定义配置文件，一般性配置请放入该文件，可覆盖 ~/.vimrc 里的配置

##### 插件列表

| 插件                                | 说明                                                                           |
| -------                             | -----                                                                          |
| cpp-mode                    | 提供生成函数实现、函数声明/实现跳转、.h .cpp切换等功能(I'm author:smile:)      |
| vim-edit                      | 方便的文本编辑插件(I'm author:smile:)                                          |
| change-colorscheme           | 随心所欲切换主题(I'm author:smile:)                                            |
| prepare-code                | 新建文件时，生成预定义代码片段(I'm author:smile:)                              |
| vim-buffer                   | vim缓存操作(I'm author:smile:)                                                 |
| vimplus-startify              | vimplus开始页面                                |
| tagbar                       | 使用 preservim/tagbar 的最新版本，taglist 的替代品，显示类/方法/变量 |
| vim-plug                       | 比 Vundle 下载更快的插件管理软件                                           |
| YouCompleteMe                 | 史上最强大的基于语义的自动补全插件，支持C/C++、C#、Python、PHP等语言           |
| NerdTree                     | 代码资源管理器                                                                 |
| vim-nerdtree-syntax-highlight | NerdTree文件类型高亮                                                           |
| nerdtree-git-plugin           | NerdTree显示git状态                                                            |
| vim-devicons                 | 显示文件类型图标                                                               |
| Airline                        | 可以取代 powerline 的状态栏美化插件                                         |
| auto-pairs                   | 自动补全引号、圆括号、花括号等                                                 |
| LeaderF                       | 比 ctrlp 更强大的文件的模糊搜索工具                                        |
| ack                           | 强大的文本搜索工具                                                             |
| vim-surround                  | 自动增加、替换配对符的插件                                                     |
| vim-commentary                | 快速注释代码插件                                                               |
| vim-repeat                    | 重复上一次操作                                                                 |
| vim-endwise                   | if/end/endif/endfunction补全                                                   |
| tabular                       | 代码、注释、表格对齐                                                           |
| vim-easymotion                | 强大的光标快速移动工具，强大到颠覆你的插件观                                   |
| incsearch.vim                 | 模糊字符搜索插件                                                               |
| vim-fugitive                  | 集成Git                                                                        |
| gv                            | 显示 git 提交记录                                                                |
| vim-slash                     | 优化搜索，移动光标后清除高亮                                                   |
| echodoc                      | 补全函数时在命令栏显示函数签名                                                 |
| vim-smooth-scroll             | 让翻页更顺畅                                                                   |
| clever-f.vim                  | 强化f和F键                                                                     |

##### 快捷键

以下是部分快捷键，可通过vimplus的`,h`命令查看 vimplus帮助文档。

| 快捷键              | 说明                                      |
| -------             | -----                                     |
| `,`                 | Leader Key                                |
| `<leader>n`         | 打开/关闭代码资源管理器                   |
| `<leader>t`         | 打开/关闭函数列表                         |
| `<leader>a`         | .h .cpp 文件切换                          |
| `<leader>u`         | 转到函数声明                              |
| `<leader>U`         | 转到函数实现                              |
| `<leader>u`         | 转到变量声明                              |
| `<leader>o`         | 打开include文件                           |
| `<leader>y`         | 拷贝函数声明                              |
| `<leader>p`         | 生成函数实现                              |
| `<leader>w`         | 单词跳转                                  |
| `<leader>f`         | 搜索~目录下的文件                         |
| `<leader>F`         | 搜索当前目录下的文本                      |
| `<leader>g`         | 显示git仓库提交记录                       |
| `<leader>G`         | 显示当前文件提交记录                      |
| `<leader>gg`        | 显示当前文件在某个commit下的完整内容      |
| `<leader>ff`        | 语法错误自动修复(FixIt)                   |
| `<c-p>`             | 切换到上一个buffer                        |
| `<c-n>`             | 切换到下一个buffer                        |
| `<leader>d`         | 删除当前buffer                            |
| `<leader>D`         | 删除当前buffer外的所有buffer              |
| `vim`               | 运行vim编辑器时,默认启动开始页面          |
| `<F5>`              | 显示语法错误提示窗口                      |
| `<F9>`              | 显示上一主题                              |
| `<F10>`             | 显示下一主题                              |
| `<leader>l`         | 按竖线对齐                                |
| `<leader>=`         | 按等号对齐                                |
| `Ya`                | 复制行文本到字母a                         |
| `Da`                | 剪切行文本到字母a                         |
| `Ca`                | 改写行文本到字母a                         |
| `rr`                | 替换文本                                  |
| `<leader>r`         | 全局替换，目前只支持单个文件              |
| `rev`               | 翻转当前光标下的单词或使用V模式选择的文本 |
| `gcc`               | 注释代码                                  |
| `gcap`              | 注释段落                                  |
| `vif`               | 选中函数内容                              |
| `dif`               | 删除函数内容                              |
| `cif`               | 改写函数内容                              |
| `vaf`               | 选中函数内容（包括函数名 花括号）         |
| `daf`               | 删除函数内容（包括函数名 花括号）         |
| `caf`               | 改写函数内容（包括函数名 花括号）         |
| `fa`                | 查找字母a，然后再按f键查找下一个          |
| `<leader>e`         | 快速编辑~/.vimrc文件                      |
| `<leader>s`         | 重新加载~/.vimrc文件                      |
| `<leader>vp`        | 快速编辑~/.vimrc.custom.plugins文件       |
| `<leader>vc`        | 快速编辑~/.vimrc.custom.config文件        |
| `<leader>h`         | 打开vimplus帮助文档                       |
| `<leader>H`         | 打开当前光标所在单词的vim帮助文档         |
| `<leader><leader>t` | 生成try-catch代码块                       |
| `<leader><leader>y` | 复制当前选中到系统剪切板                  |
| `<leader><leader>i` | 安装插件                                  |
| `<leader><leader>u` | 更新插件                                  |
| `<leader><leader>c` | 删除插件                                  |

### GCC

GCC 是 Linux 操作系统的编译工具集，是 GNU Compiler Collection 的缩写，包含 gcc，g++ 等编译器。这个工具集不仅包含编译器，还包含其他工具集，如 ar、nm 等。支持 X86、ARM、PowerPC、mips 等硬件平台，还支持 Linux、Windows 等软件平台。

#### 安装 GCC 

```shell
#ubuntu
sudo apt update
sudo apt install gcc g++

gcc -v
gcc --version

g++ -v
g++ --version
```

#### GCC 工作流程

GCC 编译程序分为 4 个阶段：预处理（预编译）、编译和优化、汇编和链接。

1. 预处理：GCC 调用预处理器来完成，包括：展开头文件、宏替换和去掉注释行。

2. 编译：GCC 调用编译器对文件进行编译，得到一个汇编文件。

3. 汇编：GCC 调用汇编器对文件进行汇编，最终得到一个二进制文件。

4. 链接：GCC 调用链接器对程序需要调用的库进行链接，最终得到一个可执行的二进制文件。

各个阶段的的文件

- 源文件，后缀为 .c

- 预处理后的 C 文件，后缀为 .i，预处理参数为 -E

- 编译得到汇编语言的源文件，后缀为 .s，编译参数为 -S

- 汇编得到的二进制文件，后缀为 .o，汇编参数 -c

C 语言源文件 > 

### 结语

第十篇博文写完，开心！！！！

今天，也是充满希望的一天。