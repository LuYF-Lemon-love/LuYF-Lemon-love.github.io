---
title: PyTorch Tutorials 学习笔记（一）-ubuntu
tags:
  - 人工智能
  - 深度学习
  - PyTorch
  - Python
categories: 学习笔记
description: 官方 PyTorch Tutorials 的学习笔记。
cover: 'https://cos.luyf-lemon-love.space/images/20221008161018.png'
abbrlink: 4206674756
date: 2022-10-08 14:24:50
---

## 前言

`PyTorch` 的官网地址为：https://pytorch.org/ 。

`PyTorch Tutorials` 的地址为：https://pytorch.org/tutorials/ 。

操作系统：**Ubuntu 18.04.6 LTS**

## 参考文档

1. [PyTorch 官网](https://pytorch.org/)

2. [PyTorch Tutorials](https://pytorch.org/tutorials/)

3. [GET STARTED](https://pytorch.org/get-started/locally/)

4. [Anaconda详细安装使用教程](https://microstrong.blog.csdn.net/article/details/79677557)

5. [[400]anaconda详细安装使用教程](https://blog.csdn.net/xc_zhou/article/details/82715612)

## 安装 `PyTorch`

`PyTorch` 官方安装教程：https://pytorch.org/get-started/locally/ 。

1. 本地操作系统信息。

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

2. 本地 `NVIDIA System Management Interface`。其中 `CUDA Version: 11.6`。

```bash
$ nvidia-smi
Sat Oct  8 14:45:37 2022       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 510.85.02    Driver Version: 510.85.02    CUDA Version: 11.6     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  NVIDIA GeForce ...  Off  | 00000000:02:00.0 Off |                  N/A |
| 29%   39C    P8     9W / 250W |      0MiB / 11264MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
|   1  NVIDIA GeForce ...  Off  | 00000000:81:00.0 Off |                  N/A |
| 32%   45C    P8    10W / 250W |      0MiB / 11264MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+
```

3. 安装 `Anaconda`。

```bash
$ curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
$ sh Miniconda3-latest-Linux-x86_64.sh

Welcome to Miniconda3 py39_4.12.0

In order to continue the installation process, please review the license
agreement.
Please, press ENTER to continue
>>> 
======================================
End User License Agreement - Miniconda
======================================

Copyright 2015-2022, Anaconda, Inc.

All rights reserved under the 3-clause BSD License:

This End User License Agreement (the "Agreement") is a legal agreement between you and Anaconda, Inc. ("Anaconda") and governs your use of Miniconda.

Subject to the terms of this Agreement, Anaconda hereby grants you a non-exclusive, non-transferable license to:

  * Install and use the Miniconda,
  * Modify and create derivative works of sample source code delivered in Miniconda subject to the Terms of Service for the Repository (as defined hereinafter) availa
ble at https://www.anaconda.com/terms-of-service, and
  * Redistribute code files in source (if provided to you by Anaconda as source) and binary forms, with or without modification subject to the requirements set forth 
below.

Anaconda may, at its option, make available patches, workarounds or other updates to Miniconda. Unless the updates are provided with their separate governing terms, t
hey are deemed part of Miniconda licensed to you as provided in this Agreement. This Agreement does not entitle you to any support for Miniconda.

Anaconda reserves all rights not expressly granted to you in this Agreement.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

  * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
  * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other m
aterials provided with the distribution.
  * Neither the name of Anaconda nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior writte
n permission.

You acknowledge that, as between you and Anaconda, Anaconda owns all right, title, and interest, including all intellectual property rights, in and to Miniconda and, 
with respect to third-party products distributed with or through Miniconda, the applicable third-party licensors own all right, title and interest, including all inte
llectual property rights, in and to such products. If you send or transmit any communications or materials to Anaconda suggesting or recommending changes to the softw
are or documentation, including without limitation, new features or functionality relating thereto, or any comments, questions, suggestions or the like ("Feedback"), 
Anaconda is free to use such Feedback. You hereby assign to Anaconda all right, title, and interest in, and Anaconda is free to use, without any attribution or compen
sation to any party, any ideas, know-how, concepts, techniques or other intellectual property rights contained in the Feedback, for any purpose whatsoever, although A
naconda is not required to use any Feedback.

DISCLAIMER
==========

THIS SOFTWARE IS PROVIDED BY ANACONDA AND ITS CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MER
CHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL ANACONDA BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CO
NSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUS
ED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWA
RE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

TO THE MAXIMUM EXTENT PERMITTED BY LAW, ANACONDA AND ITS AFFILIATES SHALL NOT BE LIABLE FOR ANY SPECIAL, INCIDENTAL, PUNITIVE OR CONSEQUENTIAL DAMAGES, OR ANY LOST PR
OFITS, LOSS OF USE, LOSS OF DATA OR LOSS OF GOODWILL, OR THE COSTS OF PROCURING SUBSTITUTE PRODUCTS, ARISING OUT OF OR IN CONNECTION WITH THIS AGREEMENT OR THE USE OR
 PERFORMANCE OF MINICONDA, WHETHER SUCH LIABILITY ARISES FROM ANY CLAIM BASED UPON BREACH OF CONTRACT, BREACH OF WARRANTY, TORT (INCLUDING NEGLIGENCE), PRODUCT LIABIL
ITY OR ANY OTHER CAUSE OF ACTION OR THEORY OF LIABILITY. IN NO EVENT WILL THE TOTAL CUMULATIVE LIABILITY OF ANACONDA AND ITS AFFILIATES UNDER OR ARISING OUT OF THIS A
GREEMENT EXCEED US.00.

Miscellaneous
=============

If you want to terminate this Agreement, you may do so by discontinuing use of Miniconda. Anaconda may, at any time, terminate this Agreement and the license granted 
hereunder if you fail to comply with any term of this Agreement. Upon any termination of this Agreement, you agree to promptly discontinue use of the Miniconda and de
stroy all copies in your possession or control. Upon any termination of this Agreement all provisions survive except for the licenses granted to you.

This Agreement is governed by and construed in accordance with the internal laws of the State of Texas without giving effect to any choice or conflict of law provisio
n or rule that would require or permit the application of the laws of any jurisdiction other than those of the State of Texas. Any legal suit, action, or proceeding a
rising out of or related to this Agreement or the licenses granted hereunder by you must be instituted exclusively in the federal courts of the United States or the c
ourts of the State of Texas in each case located in Travis County, Texas, and you irrevocably submit to the jurisdiction of such courts in any such suit, action, or p
roceeding.

Notice of Third Party Software Licenses
=======================================

Miniconda provides access to a repository (the "Repository") which contains software packages or tools licensed on an open source basis from third parties and binary 
packages of these third party tools. These third party software packages or tools are provided on an "as is" basis and are subject to their respective license agreeme
nts as well as this Agreement and the Terms of Service for the Repository located at https://www.anaconda.com/terms-of-service; provided, however, no restriction cont
ained in the Terms of Service shall be construed so as to limit Your ability to download the packages contained in Miniconda provided you comply with the license for 
each such package. These licenses may be accessed from within the Miniconda software[1] or https://www.anaconda.com/legal. Information regarding which license is appl
icable is available from within many of the third party software packages and tools and at https://repo.anaconda.com/pkgs/main/ and https://repo.anaconda.com/pkgs/r/.
 Anaconda reserves the right, in its sole discretion, to change which third party tools are included in the Repository accessible through Miniconda.


Intel Math Kernel Library
-------------------------

Miniconda provides access to re-distributable, run-time, shared-library files from the Intel Math Kernel Library ("MKL binaries").

Copyright 2018 Intel Corporation. License available at https://software.intel.com/en-us/license/intel-simplified-software-license (the "MKL License").

You may use and redistribute the MKL binaries, without modification, provided the following conditions are met:

  * Redistributions must reproduce the above copyright notice and the following terms of use in the MKL binaries and in the documentation and/or other materials provi
ded with the distribution.
  * Neither the name of Intel nor the names of its suppliers may be used to endorse or promote products derived from the MKL binaries without specific prior written p
ermission.
  * No reverse engineering, decompilation, or disassembly of the MKL binaries is permitted.

You are specifically authorized to use and redistribute the MKL binaries with your installation of Miniconda subject to the terms set forth in the MKL License. You ar
e also authorized to redistribute the MKL binaries with Miniconda or in the Anaconda package that contains the MKL binaries. If needed, instructions for removing the 
MKL binaries after installation of Miniconda are available at https://docs.anaconda.com.

cuDNN Software
--------------

Miniconda also provides access to cuDNN software binaries ("cuDNN binaries") from NVIDIA Corporation. You are specifically authorized to use the cuDNN binaries with y
our installation of Miniconda subject to your compliance with the license agreement located at https://docs.nvidia.com/deeplearning/sdk/cudnn-sla/index.html. You are 
also authorized to redistribute the cuDNN binaries with an Miniconda package that contains the cuDNN binaries. You can add or remove the cuDNN binaries utilizing the 
install and uninstall features in Miniconda.

cuDNN binaries contain source code provided by NVIDIA Corporation.

Arm Performance Libraries
-------------------------

Arm Performance Libraries (Free Version): Anaconda provides access to software and related documentation from the Arm Performance Libraries ("Arm PL") provided by Arm
 Limited. By installing or otherwise accessing the Arm PL, you acknowledge and agree that use and distribution of the Arm PL is subject to your compliance with the Ar
m PL end user license agreement located at: https://developer.arm.com/tools-and-software/server-and-hpc/downloads/arm-performance-libraries/eula.

Export; Cryptography Notice
===========================

You must comply with all domestic and international export laws and regulations that apply to the software, which include restrictions on destinations, end users, and
 end use. Miniconda includes cryptographic software. The country in which you currently reside may have restrictions on the import, possession, use, and/or re-export 
to another country, of encryption software. BEFORE using any encryption software, please check your country's laws, regulations and policies concerning the import, po
ssession, or use, and re-export of encryption software, to see if this is permitted. See the Wassenaar Arrangement http://www.wassenaar.org/ for more information.

Anaconda has self-classified this software as Export Commodity Control Number (ECCN) EAR99, which includes mass market information security software using or performi
ng cryptographic functions with asymmetric algorithms. No license is required for export of this software to non-embargoed countries.

The Intel Math Kernel Library contained in Miniconda is classified by Intel as ECCN 5D992.c with no license required for export to non-embargoed countries.

The following packages listed on https://www.anaconda.com/cryptography are included in the Repository accessible through Miniconda that relate to cryptography.

Last updated March 21, 2022

Do you accept the license terms? [yes|no]
[no] >>> 
Please answer 'yes' or 'no':'
>>> yes

Miniconda3 will now be installed into this location:
/home/luyanfeng/miniconda3

  - Press ENTER to confirm the location
  - Press CTRL-C to abort the installation
  - Or specify a different location below

[/home/luyanfeng/miniconda3] >>> 
PREFIX=/home/luyanfeng/miniconda3
Unpacking payload ...
Collecting package metadata (current_repodata.json): done                                                                                                             
Solving environment: done

## Package Plan ##

  environment location: /home/luyanfeng/miniconda3

  added / updated specs:
    - _libgcc_mutex==0.1=main
    - _openmp_mutex==4.5=1_gnu
    - brotlipy==0.7.0=py39h27cfd23_1003
    - ca-certificates==2022.3.29=h06a4308_1
    - certifi==2021.10.8=py39h06a4308_2
    - cffi==1.15.0=py39hd667e15_1
    - charset-normalizer==2.0.4=pyhd3eb1b0_0
    - colorama==0.4.4=pyhd3eb1b0_0
    - conda-content-trust==0.1.1=pyhd3eb1b0_0
    - conda-package-handling==1.8.1=py39h7f8727e_0
    - conda==4.12.0=py39h06a4308_0
    - cryptography==36.0.0=py39h9ce1e76_0
    - idna==3.3=pyhd3eb1b0_0
    - ld_impl_linux-64==2.35.1=h7274673_9
    - libffi==3.3=he6710b0_2
    - libgcc-ng==9.3.0=h5101ec6_17
    - libgomp==9.3.0=h5101ec6_17
    - libstdcxx-ng==9.3.0=hd4cf53a_17
    - ncurses==6.3=h7f8727e_2
    - openssl==1.1.1n=h7f8727e_0
    - pip==21.2.4=py39h06a4308_0
    - pycosat==0.6.3=py39h27cfd23_0
    - pycparser==2.21=pyhd3eb1b0_0
    - pyopenssl==22.0.0=pyhd3eb1b0_0
    - pysocks==1.7.1=py39h06a4308_0
    - python==3.9.12=h12debd9_0
    - readline==8.1.2=h7f8727e_1
    - requests==2.27.1=pyhd3eb1b0_0
    - ruamel_yaml==0.15.100=py39h27cfd23_0
    - setuptools==61.2.0=py39h06a4308_0
    - six==1.16.0=pyhd3eb1b0_1
    - sqlite==3.38.2=hc218d9a_0
    - tk==8.6.11=h1ccaba5_0
    - tqdm==4.63.0=pyhd3eb1b0_0
    - tzdata==2022a=hda174b7_0
    - urllib3==1.26.8=pyhd3eb1b0_0
    - wheel==0.37.1=pyhd3eb1b0_0
    - xz==5.2.5=h7b6447c_0
    - yaml==0.2.5=h7b6447c_0
    - zlib==1.2.12=h7f8727e_1


The following NEW packages will be INSTALLED:

  _libgcc_mutex      pkgs/main/linux-64::_libgcc_mutex-0.1-main
  _openmp_mutex      pkgs/main/linux-64::_openmp_mutex-4.5-1_gnu
  brotlipy           pkgs/main/linux-64::brotlipy-0.7.0-py39h27cfd23_1003
  ca-certificates    pkgs/main/linux-64::ca-certificates-2022.3.29-h06a4308_1
  certifi            pkgs/main/linux-64::certifi-2021.10.8-py39h06a4308_2
  cffi               pkgs/main/linux-64::cffi-1.15.0-py39hd667e15_1
  charset-normalizer pkgs/main/noarch::charset-normalizer-2.0.4-pyhd3eb1b0_0
  colorama           pkgs/main/noarch::colorama-0.4.4-pyhd3eb1b0_0
  conda              pkgs/main/linux-64::conda-4.12.0-py39h06a4308_0
  conda-content-tru~ pkgs/main/noarch::conda-content-trust-0.1.1-pyhd3eb1b0_0
  conda-package-han~ pkgs/main/linux-64::conda-package-handling-1.8.1-py39h7f8727e_0
  cryptography       pkgs/main/linux-64::cryptography-36.0.0-py39h9ce1e76_0
  idna               pkgs/main/noarch::idna-3.3-pyhd3eb1b0_0
  ld_impl_linux-64   pkgs/main/linux-64::ld_impl_linux-64-2.35.1-h7274673_9
  libffi             pkgs/main/linux-64::libffi-3.3-he6710b0_2
  libgcc-ng          pkgs/main/linux-64::libgcc-ng-9.3.0-h5101ec6_17
  libgomp            pkgs/main/linux-64::libgomp-9.3.0-h5101ec6_17
  libstdcxx-ng       pkgs/main/linux-64::libstdcxx-ng-9.3.0-hd4cf53a_17
  ncurses            pkgs/main/linux-64::ncurses-6.3-h7f8727e_2
  openssl            pkgs/main/linux-64::openssl-1.1.1n-h7f8727e_0
  pip                pkgs/main/linux-64::pip-21.2.4-py39h06a4308_0
  pycosat            pkgs/main/linux-64::pycosat-0.6.3-py39h27cfd23_0
  pycparser          pkgs/main/noarch::pycparser-2.21-pyhd3eb1b0_0
  pyopenssl          pkgs/main/noarch::pyopenssl-22.0.0-pyhd3eb1b0_0
  pysocks            pkgs/main/linux-64::pysocks-1.7.1-py39h06a4308_0
  python             pkgs/main/linux-64::python-3.9.12-h12debd9_0
  readline           pkgs/main/linux-64::readline-8.1.2-h7f8727e_1
  requests           pkgs/main/noarch::requests-2.27.1-pyhd3eb1b0_0
  ruamel_yaml        pkgs/main/linux-64::ruamel_yaml-0.15.100-py39h27cfd23_0
  setuptools         pkgs/main/linux-64::setuptools-61.2.0-py39h06a4308_0
  six                pkgs/main/noarch::six-1.16.0-pyhd3eb1b0_1
  sqlite             pkgs/main/linux-64::sqlite-3.38.2-hc218d9a_0
  tk                 pkgs/main/linux-64::tk-8.6.11-h1ccaba5_0
  tqdm               pkgs/main/noarch::tqdm-4.63.0-pyhd3eb1b0_0
  tzdata             pkgs/main/noarch::tzdata-2022a-hda174b7_0
  urllib3            pkgs/main/noarch::urllib3-1.26.8-pyhd3eb1b0_0
  wheel              pkgs/main/noarch::wheel-0.37.1-pyhd3eb1b0_0
  xz                 pkgs/main/linux-64::xz-5.2.5-h7b6447c_0
  yaml               pkgs/main/linux-64::yaml-0.2.5-h7b6447c_0
  zlib               pkgs/main/linux-64::zlib-1.2.12-h7f8727e_1


Preparing transaction: done
Executing transaction: done
installation finished.
Do you wish the installer to initialize Miniconda3
by running conda init? [yes|no]
[no] >>> yes
no change     /home/luyanfeng/miniconda3/condabin/conda
no change     /home/luyanfeng/miniconda3/bin/conda
no change     /home/luyanfeng/miniconda3/bin/conda-env
no change     /home/luyanfeng/miniconda3/bin/activate
no change     /home/luyanfeng/miniconda3/bin/deactivate
no change     /home/luyanfeng/miniconda3/etc/profile.d/conda.sh
no change     /home/luyanfeng/miniconda3/etc/fish/conf.d/conda.fish
no change     /home/luyanfeng/miniconda3/shell/condabin/Conda.psm1
no change     /home/luyanfeng/miniconda3/shell/condabin/conda-hook.ps1
no change     /home/luyanfeng/miniconda3/lib/python3.9/site-packages/xontrib/conda.xsh
no change     /home/luyanfeng/miniconda3/etc/profile.d/conda.csh
modified      /home/luyanfeng/.bashrc

==> For changes to take effect, close and re-open your current shell. <==

If you'd prefer that conda's base environment not be activated on startup, 
   set the auto_activate_base parameter to false: 

conda config --set auto_activate_base false

Thank you for installing Miniconda3!
$ source ~/.bashrc
$ rm -rf Miniconda3-latest-Linux-x86_64.sh
```

4. 安装 `PyTorch` 并验证。

```bash
$ conda env list
# conda environments:
#
base                  *  /home/luyanfeng/miniconda3

$ conda create -n pytorch-tutorials python=3.8
Collecting package metadata (current_repodata.json): done
Solving environment: done


==> WARNING: A newer version of conda exists. <==
  current version: 4.12.0
  latest version: 22.9.0

Please update conda by running

    $ conda update -n base -c defaults conda



## Package Plan ##

  environment location: /home/luyanfeng/miniconda3/envs/pytorch-tutorials

  added / updated specs:
    - python=3.8


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    _openmp_mutex-5.1          |            1_gnu          21 KB
    ca-certificates-2022.07.19 |       h06a4308_0         124 KB
    certifi-2022.9.24          |   py38h06a4308_0         154 KB
    ld_impl_linux-64-2.38      |       h1181459_1         654 KB
    libgcc-ng-11.2.0           |       h1234567_1         5.3 MB
    libgomp-11.2.0             |       h1234567_1         474 KB
    libstdcxx-ng-11.2.0        |       h1234567_1         4.7 MB
    ncurses-6.3                |       h5eee18b_3         781 KB
    openssl-1.1.1q             |       h7f8727e_0         2.5 MB
    pip-22.2.2                 |   py38h06a4308_0         2.3 MB
    python-3.8.13              |       h12debd9_0        18.8 MB
    setuptools-63.4.1          |   py38h06a4308_0         1.1 MB
    sqlite-3.39.3              |       h5082296_0         1.1 MB
    tk-8.6.12                  |       h1ccaba5_0         3.0 MB
    xz-5.2.6                   |       h5eee18b_0         394 KB
    zlib-1.2.12                |       h5eee18b_3         103 KB
    ------------------------------------------------------------
                                           Total:        41.5 MB

The following NEW packages will be INSTALLED:

  _libgcc_mutex      pkgs/main/linux-64::_libgcc_mutex-0.1-main
  _openmp_mutex      pkgs/main/linux-64::_openmp_mutex-5.1-1_gnu
  ca-certificates    pkgs/main/linux-64::ca-certificates-2022.07.19-h06a4308_0
  certifi            pkgs/main/linux-64::certifi-2022.9.24-py38h06a4308_0
  ld_impl_linux-64   pkgs/main/linux-64::ld_impl_linux-64-2.38-h1181459_1
  libffi             pkgs/main/linux-64::libffi-3.3-he6710b0_2
  libgcc-ng          pkgs/main/linux-64::libgcc-ng-11.2.0-h1234567_1
  libgomp            pkgs/main/linux-64::libgomp-11.2.0-h1234567_1
  libstdcxx-ng       pkgs/main/linux-64::libstdcxx-ng-11.2.0-h1234567_1
  ncurses            pkgs/main/linux-64::ncurses-6.3-h5eee18b_3
  openssl            pkgs/main/linux-64::openssl-1.1.1q-h7f8727e_0
  pip                pkgs/main/linux-64::pip-22.2.2-py38h06a4308_0
  python             pkgs/main/linux-64::python-3.8.13-h12debd9_0
  readline           pkgs/main/linux-64::readline-8.1.2-h7f8727e_1
  setuptools         pkgs/main/linux-64::setuptools-63.4.1-py38h06a4308_0
  sqlite             pkgs/main/linux-64::sqlite-3.39.3-h5082296_0
  tk                 pkgs/main/linux-64::tk-8.6.12-h1ccaba5_0
  wheel              pkgs/main/noarch::wheel-0.37.1-pyhd3eb1b0_0
  xz                 pkgs/main/linux-64::xz-5.2.6-h5eee18b_0
  zlib               pkgs/main/linux-64::zlib-1.2.12-h5eee18b_3


Proceed ([y]/n)? y


Downloading and Extracting Packages
ld_impl_linux-64-2.3 | 654 KB    | ################################# | 100% 
pip-22.2.2           | 2.3 MB    | ################################# | 100% 
certifi-2022.9.24    | 154 KB    | ################################# | 100% 
libgomp-11.2.0       | 474 KB    | ################################# | 100% 
xz-5.2.6             | 394 KB    | ################################# | 100% 
openssl-1.1.1q       | 2.5 MB    | ################################# | 100% 
zlib-1.2.12          | 103 KB    | ################################# | 100% 
ncurses-6.3          | 781 KB    | ################################# | 100% 
sqlite-3.39.3        | 1.1 MB    | ################################# | 100% 
libstdcxx-ng-11.2.0  | 4.7 MB    | ################################# | 100% 
tk-8.6.12            | 3.0 MB    | ################################# | 100% 
libgcc-ng-11.2.0     | 5.3 MB    | ################################# | 100% 
ca-certificates-2022 | 124 KB    | ################################# | 100% 
setuptools-63.4.1    | 1.1 MB    | ################################# | 100% 
_openmp_mutex-5.1    | 21 KB     | ################################# | 100% 
python-3.8.13        | 18.8 MB   | ################################# | 100% 
Preparing transaction: done
Verifying transaction: done
Executing transaction: done
#
# To activate this environment, use
#
#     $ conda activate pytorch-tutorials
#
# To deactivate an active environment, use
#
#     $ conda deactivate

$ conda env list
# conda environments:
#
base                  *  /home/luyanfeng/miniconda3
pytorch-tutorials        /home/luyanfeng/miniconda3/envs/pytorch-tutorials

$ conda activate pytorch-tutorials
$ pip list
Package    Version
---------- ---------
certifi    2022.9.24
pip        22.2.2
setuptools 63.4.1
wheel      0.37.1
$ conda install pytorch torchvision torchaudio cudatoolkit=11.6 -c pytorch -c conda-forge
Collecting package metadata (current_repodata.json): done
Solving environment: failed with initial frozen solve. Retrying with flexible solve.
Collecting package metadata (repodata.json): done
Solving environment: done


==> WARNING: A newer version of conda exists. <==
  current version: 4.12.0
  latest version: 22.9.0

Please update conda by running

    $ conda update -n base -c defaults conda



## Package Plan ##

  environment location: /home/luyanfeng/miniconda3/envs/pytorch-tutorials

  added / updated specs:
    - cudatoolkit=11.6
    - pytorch
    - torchaudio
    - torchvision


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    blas-1.0                   |              mkl           6 KB
    brotlipy-0.7.0             |py38h0a891b7_1004         342 KB  conda-forge
    bzip2-1.0.8                |       h7f98852_4         484 KB  conda-forge
    ca-certificates-2022.9.24  |       ha878542_0         150 KB  conda-forge
    certifi-2022.9.24          |     pyhd8ed1ab_0         155 KB  conda-forge
    cffi-1.14.6                |   py38ha65f79e_0         226 KB  conda-forge
    charset-normalizer-2.1.1   |     pyhd8ed1ab_0          36 KB  conda-forge
    cryptography-37.0.2        |   py38h2b5fc30_0         1.5 MB  conda-forge
    cudatoolkit-11.6.0         |      hecad31d_10       821.2 MB  conda-forge
    ffmpeg-4.3                 |       hf484d3e_0         9.9 MB  pytorch
    freetype-2.10.4            |       h0708190_1         890 KB  conda-forge
    gmp-6.2.1                  |       h58526e2_0         806 KB  conda-forge
    gnutls-3.6.13              |       h85f3911_1         2.0 MB  conda-forge
    idna-3.4                   |     pyhd8ed1ab_0          55 KB  conda-forge
    intel-openmp-2021.4.0      |    h06a4308_3561         4.2 MB
    jpeg-9e                    |       h166bdaf_1         268 KB  conda-forge
    lame-3.100                 |    h7f98852_1001         496 KB  conda-forge
    lcms2-2.12                 |       hddcbb42_0         443 KB  conda-forge
    libiconv-1.17              |       h166bdaf_0         1.4 MB  conda-forge
    libpng-1.6.37              |       h21135ba_2         306 KB  conda-forge
    libtiff-4.2.0              |       hf544144_3         590 KB  conda-forge
    libwebp-base-1.2.2         |       h7f98852_1         824 KB  conda-forge
    lz4-c-1.9.3                |       h9c3ff4c_1         179 KB  conda-forge
    mkl-2021.4.0               |     h06a4308_640       142.6 MB
    mkl-service-2.4.0          |   py38h95df7f1_0          61 KB  conda-forge
    mkl_fft-1.3.1              |   py38h8666266_1         213 KB  conda-forge
    mkl_random-1.2.2           |   py38h1abd341_0         364 KB  conda-forge
    nettle-3.6                 |       he412f7d_0         6.5 MB  conda-forge
    numpy-1.23.1               |   py38h6c91a56_0          11 KB
    numpy-base-1.23.1          |   py38ha15fc14_0         5.6 MB
    olefile-0.46               |     pyh9f0ad1d_1          32 KB  conda-forge
    openh264-2.1.1             |       h780b84a_0         1.5 MB  conda-forge
    openjpeg-2.4.0             |       hb52868f_1         444 KB  conda-forge
    openssl-1.1.1o             |       h166bdaf_0         2.1 MB  conda-forge
    pillow-8.2.0               |   py38ha0e1e83_1         688 KB  conda-forge
    pycparser-2.21             |     pyhd8ed1ab_0         100 KB  conda-forge
    pyopenssl-22.0.0           |     pyhd8ed1ab_1         120 KB  conda-forge
    pysocks-1.7.1              |     pyha2e5f31_6          19 KB  conda-forge
    python_abi-3.8             |           2_cp38           4 KB  conda-forge
    pytorch-1.12.1             |py3.8_cuda11.6_cudnn8.3.2_0        1.20 GB  pytorch
    pytorch-mutex-1.0          |             cuda           3 KB  pytorch
    requests-2.28.1            |     pyhd8ed1ab_1          53 KB  conda-forge
    six-1.16.0                 |     pyh6c4a22f_0          14 KB  conda-forge
    torchaudio-0.12.1          |       py38_cu116         6.2 MB  pytorch
    torchvision-0.13.1         |       py38_cu116         7.7 MB  pytorch
    typing_extensions-4.4.0    |     pyha770c72_0          29 KB  conda-forge
    urllib3-1.26.11            |     pyhd8ed1ab_0         102 KB  conda-forge
    zstd-1.5.0                 |       ha95c52a_0         490 KB  conda-forge
    ------------------------------------------------------------
                                           Total:        2.20 GB

The following NEW packages will be INSTALLED:

  blas               pkgs/main/linux-64::blas-1.0-mkl
  brotlipy           conda-forge/linux-64::brotlipy-0.7.0-py38h0a891b7_1004
  bzip2              conda-forge/linux-64::bzip2-1.0.8-h7f98852_4
  cffi               conda-forge/linux-64::cffi-1.14.6-py38ha65f79e_0
  charset-normalizer conda-forge/noarch::charset-normalizer-2.1.1-pyhd8ed1ab_0
  cryptography       conda-forge/linux-64::cryptography-37.0.2-py38h2b5fc30_0
  cudatoolkit        conda-forge/linux-64::cudatoolkit-11.6.0-hecad31d_10
  ffmpeg             pytorch/linux-64::ffmpeg-4.3-hf484d3e_0
  freetype           conda-forge/linux-64::freetype-2.10.4-h0708190_1
  gmp                conda-forge/linux-64::gmp-6.2.1-h58526e2_0
  gnutls             conda-forge/linux-64::gnutls-3.6.13-h85f3911_1
  idna               conda-forge/noarch::idna-3.4-pyhd8ed1ab_0
  intel-openmp       pkgs/main/linux-64::intel-openmp-2021.4.0-h06a4308_3561
  jpeg               conda-forge/linux-64::jpeg-9e-h166bdaf_1
  lame               conda-forge/linux-64::lame-3.100-h7f98852_1001
  lcms2              conda-forge/linux-64::lcms2-2.12-hddcbb42_0
  libiconv           conda-forge/linux-64::libiconv-1.17-h166bdaf_0
  libpng             conda-forge/linux-64::libpng-1.6.37-h21135ba_2
  libtiff            conda-forge/linux-64::libtiff-4.2.0-hf544144_3
  libwebp-base       conda-forge/linux-64::libwebp-base-1.2.2-h7f98852_1
  lz4-c              conda-forge/linux-64::lz4-c-1.9.3-h9c3ff4c_1
  mkl                pkgs/main/linux-64::mkl-2021.4.0-h06a4308_640
  mkl-service        conda-forge/linux-64::mkl-service-2.4.0-py38h95df7f1_0
  mkl_fft            conda-forge/linux-64::mkl_fft-1.3.1-py38h8666266_1
  mkl_random         conda-forge/linux-64::mkl_random-1.2.2-py38h1abd341_0
  nettle             conda-forge/linux-64::nettle-3.6-he412f7d_0
  numpy              pkgs/main/linux-64::numpy-1.23.1-py38h6c91a56_0
  numpy-base         pkgs/main/linux-64::numpy-base-1.23.1-py38ha15fc14_0
  olefile            conda-forge/noarch::olefile-0.46-pyh9f0ad1d_1
  openh264           conda-forge/linux-64::openh264-2.1.1-h780b84a_0
  openjpeg           conda-forge/linux-64::openjpeg-2.4.0-hb52868f_1
  pillow             conda-forge/linux-64::pillow-8.2.0-py38ha0e1e83_1
  pycparser          conda-forge/noarch::pycparser-2.21-pyhd8ed1ab_0
  pyopenssl          conda-forge/noarch::pyopenssl-22.0.0-pyhd8ed1ab_1
  pysocks            conda-forge/noarch::pysocks-1.7.1-pyha2e5f31_6
  python_abi         conda-forge/linux-64::python_abi-3.8-2_cp38
  pytorch            pytorch/linux-64::pytorch-1.12.1-py3.8_cuda11.6_cudnn8.3.2_0
  pytorch-mutex      pytorch/noarch::pytorch-mutex-1.0-cuda
  requests           conda-forge/noarch::requests-2.28.1-pyhd8ed1ab_1
  six                conda-forge/noarch::six-1.16.0-pyh6c4a22f_0
  torchaudio         pytorch/linux-64::torchaudio-0.12.1-py38_cu116
  torchvision        pytorch/linux-64::torchvision-0.13.1-py38_cu116
  typing_extensions  conda-forge/noarch::typing_extensions-4.4.0-pyha770c72_0
  urllib3            conda-forge/noarch::urllib3-1.26.11-pyhd8ed1ab_0
  zstd               conda-forge/linux-64::zstd-1.5.0-ha95c52a_0

The following packages will be UPDATED:

  ca-certificates    pkgs/main::ca-certificates-2022.07.19~ --> conda-forge::ca-certificates-2022.9.24-ha878542_0

The following packages will be SUPERSEDED by a higher-priority channel:

  certifi            pkgs/main/linux-64::certifi-2022.9.24~ --> conda-forge/noarch::certifi-2022.9.24-pyhd8ed1ab_0
  openssl              pkgs/main::openssl-1.1.1q-h7f8727e_0 --> conda-forge::openssl-1.1.1o-h166bdaf_0


Proceed ([y]/n)? y


Downloading and Extracting Packages
numpy-base-1.23.1    | 5.6 MB    | ########################################################################################################################### | 100% 
pillow-8.2.0         | 688 KB    | ########################################################################################################################### | 100% 
urllib3-1.26.11      | 102 KB    | ########################################################################################################################### | 100% 
lz4-c-1.9.3          | 179 KB    | ########################################################################################################################### | 100% 
pytorch-1.12.1       | 1.20 GB   | ########################################################################################################################### | 100% 
openh264-2.1.1       | 1.5 MB    | ########################################################################################################################### | 100% 
numpy-1.23.1         | 11 KB     | ########################################################################################################################### | 100% 
gnutls-3.6.13        | 2.0 MB    | ########################################################################################################################### | 100% 
freetype-2.10.4      | 890 KB    | ########################################################################################################################### | 100% 
pyopenssl-22.0.0     | 120 KB    | ########################################################################################################################### | 100% 
requests-2.28.1      | 53 KB     | ########################################################################################################################### | 100% 
nettle-3.6           | 6.5 MB    | ########################################################################################################################### | 100% 
ca-certificates-2022 | 150 KB    | ########################################################################################################################### | 100% 
torchvision-0.13.1   | 7.7 MB    | ########################################################################################################################### | 100% 
charset-normalizer-2 | 36 KB     | ########################################################################################################################### | 100% 
bzip2-1.0.8          | 484 KB    | ########################################################################################################################### | 100% 
certifi-2022.9.24    | 155 KB    | ########################################################################################################################### | 100% 
intel-openmp-2021.4. | 4.2 MB    | ########################################################################################################################### | 100% 
blas-1.0             | 6 KB      | ########################################################################################################################### | 100% 
mkl-2021.4.0         | 142.6 MB  | ########################################################################################################################### | 100% 
ffmpeg-4.3           | 9.9 MB    | ########################################################################################################################### | 100% 
cffi-1.14.6          | 226 KB    | ########################################################################################################################### | 100% 
brotlipy-0.7.0       | 342 KB    | ########################################################################################################################### | 100% 
pysocks-1.7.1        | 19 KB     | ########################################################################################################################### | 100% 
libiconv-1.17        | 1.4 MB    | ########################################################################################################################### | 100% 
gmp-6.2.1            | 806 KB    | ########################################################################################################################### | 100% 
openjpeg-2.4.0       | 444 KB    | ########################################################################################################################### | 100% 
typing_extensions-4. | 29 KB     | ########################################################################################################################### | 100% 
libwebp-base-1.2.2   | 824 KB    | ########################################################################################################################### | 100% 
cryptography-37.0.2  | 1.5 MB    | ########################################################################################################################### | 100% 
torchaudio-0.12.1    | 6.2 MB    | ########################################################################################################################### | 100% 
libpng-1.6.37        | 306 KB    | ########################################################################################################################### | 100% 
mkl_random-1.2.2     | 364 KB    | ########################################################################################################################### | 100% 
python_abi-3.8       | 4 KB      | ########################################################################################################################### | 100% 
pycparser-2.21       | 100 KB    | ########################################################################################################################### | 100% 
mkl-service-2.4.0    | 61 KB     | ########################################################################################################################### | 100% 
lame-3.100           | 496 KB    | ########################################################################################################################### | 100% 
lcms2-2.12           | 443 KB    | ########################################################################################################################### | 100% 
six-1.16.0           | 14 KB     | ########################################################################################################################### | 100% 
zstd-1.5.0           | 490 KB    | ########################################################################################################################### | 100% 
pytorch-mutex-1.0    | 3 KB      | ########################################################################################################################### | 100% 
idna-3.4             | 55 KB     | ########################################################################################################################### | 100% 
olefile-0.46         | 32 KB     | ########################################################################################################################### | 100% 
mkl_fft-1.3.1        | 213 KB    | ########################################################################################################################### | 100% 
libtiff-4.2.0        | 590 KB    | ########################################################################################################################### | 100% 
jpeg-9e              | 268 KB    | ########################################################################################################################### | 100% 
openssl-1.1.1o       | 2.1 MB    | ########################################################################################################################### | 100% 
cudatoolkit-11.6.0   | 821.2 MB  | ########################################################################################################################### | 100% 
Preparing transaction: done
Verifying transaction: done
Executing transaction: / By downloading and using the CUDA Toolkit conda packages, you accept the terms and conditions of the CUDA End User License Agreement (EULA): https://docs.nvidia.com/cuda/eula/index.html

done
$ pip list
Package            Version
------------------ ---------
brotlipy           0.7.0
certifi            2022.9.24
cffi               1.14.6
charset-normalizer 2.1.1
cryptography       37.0.2
idna               3.4
mkl-fft            1.3.1
mkl-random         1.2.2
mkl-service        2.4.0
numpy              1.23.1
olefile            0.46
Pillow             8.2.0
pip                22.2.2
pycparser          2.21
pyOpenSSL          22.0.0
PySocks            1.7.1
requests           2.28.1
setuptools         63.4.1
six                1.16.0
torch              1.12.1
torchaudio         0.12.1
torchvision        0.13.1
typing_extensions  4.4.0
urllib3            1.26.11
wheel              0.37.1
$ python --version
Python 3.8.13
$ python
Python 3.8.13 (default, Mar 28 2022, 11:38:47) 
[GCC 7.5.0] :: Anaconda, Inc. on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import torch
>>> x = torch.rand(5, 3)
>>> print(x)
tensor([[0.3916, 0.1399, 0.1719],
        [0.7075, 0.6833, 0.8973],
        [0.7452, 0.3193, 0.2473],
        [0.6819, 0.8641, 0.6296],
        [0.0478, 0.7371, 0.3067]])
>>> torch.cuda.is_available()
True
>>> exit()
$
```

## 结语

第三十四篇博文写完，开心！！！！

今天，也是充满希望的一天。