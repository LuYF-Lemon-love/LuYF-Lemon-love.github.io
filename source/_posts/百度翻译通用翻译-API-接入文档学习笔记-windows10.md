---
title: 百度翻译通用翻译 API 接入文档学习笔记-windows10
tags:
  - Python
  - 百度翻译
categories: 实用技巧
description: 介绍如何用 Python 调用百度翻译通用翻译 API.
cover: 'https://cos.luyf-lemon-love.space/images/0437605176.webp'
abbrlink: 2553319787
date: 2022-12-19 16:43:51
---

## 前言

本博文将介绍如何用 **Python** 调用百度翻译通用翻译 **API**.

>欢迎使用通用翻译API，本文档将指导您如何快速接入。

原教程链接: https://fanyi-api.baidu.com/doc/21 .

操作系统：**Windows 10 家庭版**

## 参考文档

1. [通用翻译API接入文档](https://fanyi-api.baidu.com/doc/21)

## 如何使用通用翻译API？

1. 使用您的百度账号登录[百度翻译开放平台](http://api.fanyi.baidu.com/)；

2. 注册成为开发者，获得 **APPID** 

3. 进行开发者认证（如仅需标准版可跳过）；

4. 开通通用翻译API服务：[开通链接](https://fanyi-api.baidu.com/choose)；

5. 参考技术文档和 Demo 编写代码。

## 具体步骤

1. 百度翻译地址: https://fanyi.baidu.com/ .

2. 点击[翻译API](https://fanyi-api.baidu.com/) .

3. 找到**通用翻译**, 点击**查看详情**: https://fanyi-api.baidu.com/product/11 .

![](https://cos.luyf-lemon-love.space/images/20221219173546.png)

4. 点击**立即使用**.

![](https://cos.luyf-lemon-love.space/images/%E7%99%BE%E5%BA%A6%E7%BF%BB%E8%AF%91%E9%80%9A%E7%94%A8%E7%BF%BB%E8%AF%91.png)

5. 按照提示填写信息, 申请. 最终会跳转到下图界面.

![](https://cos.luyf-lemon-love.space/images/20221219174655.png)

6. 可以在开发者信息中, 获得你的 **APP ID**, **密钥**.

## 接入方式

**通用翻译 API** 通过 **HTTP** 接口对外提供多语种互译服务。您只需要通过调用**通用翻译 API**，传入**待翻译的内容**，并指定要翻译的**源语言**（支持源语言语种自动检测）和**目标语言**种类，就可以得到相应的翻译结果。

**通用翻译API HTTPS 地址：**

```
https://fanyi-api.baidu.com/api/trans/vip/translate
```

## 签名生成方法

**签名**是为了保证调用安全，使用 **MD5** 算法生成的一段字符串，生成的**签名长度为 32 位**，签名中的英文字符均为**小写格式**。

**生成方法：**

1. **Step1**. 将请求参数中的 **APPID(appid)**， 翻译 **query(q，注意为UTF-8编码)**，**随机数(salt)**，以及**平台分配的密钥(可在管理控制台查看)** 按照 **appid+q+salt+密钥**的顺序拼接得到**字符串 1**。

2. **Step2**. 对**字符串 1** 做 **MD5** ，得到 **32** 位小写的 **sign**。

**注：**

1. 待**翻译文本**（q）需为 **UTF-8** 编码；

2. 在生成签名拼接 **appid+q+salt+密钥** 字符串时，**q 不需要做 URL encode**，在生成签名之后，**发送 HTTP 请求之前才需要对要发送的待翻译文本字段 q 做 URL encode**；

3. 如遇到报 **54001** 签名错误，请检查您的签名生成方法是否正确，**在对 sign 进行拼接和加密时，q 不需要做 URL encode，很多开发者遇到签名报错均是由于拼接 sign 前就做了 URL encode**；

4. 在生成签名后，**发送 HTTP 请求时，如果将 query 拼接在URL上，需要对 query 做 URL encode**。

## 输入参数

>**请求方式**： 可使用 **GET** 或 **POST** 方式，如使用 **POST** 方式，**Content-Type** 请指定为：**application/x-www-form-urlencoded**
>
>**字符编码**：统一采用 **UTF-8** 编码格式
>
>**query 长度**：为保证翻译质量，请将单次请求长度控制在 **6000 bytes** 以内（汉字约为输入参数 **2000** 个）

|字段名|类型|是否必填|描述|备注|
|:-:|:-:|:-:|:-:|:-:|
|q|string|是|请求翻译query|UTF-8编码|
|from|string|是|翻译源语言|可设置为auto|
|to|string|是|翻译目标语言|不可设置为auto|
|appid|string|是|APPID|可在[管理控制台](https://api.fanyi.baidu.com/api/trans/product/desktop?req=developer)查看|
|salt|string|是|随机数|可为字母或数字的字符串|
|sign|string|是|签名|appid+q+salt+密钥的MD5值|

## 输出参数

返回的结果是 **json** 格式，包含以下字段：

|字段名|类型|描述|备注|
|:-:|:-:|:-:|:-:|
|from|string|源语言|返回用户指定的语言，或者自动检测出的语种（源语言设为auto时）|
|to|string|目标语言|返回用户指定的目标语言|
|trans_result|array|翻译结果|返回翻译结果，包括src和dst字段|
|trans_result.*.src|string|原文|接入举例中的“apple”|
|trans_result.*dst|string|译文|接入举例中的“苹果”|
|error_code|integer|错误码|仅当出现错误时显示|

## 接入举例

例如：将英文单词 **apple** 翻译成中文：

**请求参数：**

```
q=apple
from=en
to=zh
appid=2015063000000001（请替换为您的appid）
salt=1435660288（随机码）
平台分配的密钥: 12345678
```

**生成签名sign：**

**Step1. 拼接字符串1：**

拼接appid=2015063000000001+q=apple+salt=1435660288+密钥=12345678得到字符串1：“2015063000000001apple143566028812345678”

**Step2. 计算签名：（对字符串1做MD5加密）**

sign=MD5(2015063000000001apple143566028812345678)，得到sign=f89f9594663708c1605f3d736d01d2d4

**拼接完整请求：**

```
http://api.fanyi.baidu.com/api/trans/vip/translate?q=apple&from=en&to=zh&appid=2015063000000001&salt=1435660288&sign=f89f9594663708c1605f3d736d01d2d4
```

注：也可使用 **POST** 方式，如 **POST** 方式传送，**Content-Type** 请指定为：**application/x-www-form-urlencoded**

## 输出举例

**正确情况：**

```json
{
    "from": "en",
    "to": "zh",
    "trans_result": [
        {
            "src": "apple",
            "dst": "苹果"
        }
    ]
}
```

**异常情况：**

```json
{
    "error_code": "54001",
    "error_msg": "Invalid Sign"
}
```

## 语种列表

>通用翻译API支持语种数已达 **201** 种，完整列表如下。其中，**对于常见语种列表内的语种，所有用户均可调用**。对于**非常见语种**，仅**企业已认证的尊享版用户**可调用，未认证的非尊享版用户调用将返回错误。
>
>**源语言语种不确定时可设置为 auto**，**目标语言语种不可设置为 auto**。但对于**非常用语种**，**语种自动检测可能存在误差**。

## 常见语种列表

|名称|代码|名称|代码|名称|代码|
|:-:|:-:|:-:|:-:|:-:|:-:|
|自动检测|auto|中文|zh|英语|en|
|粤语|yue|文言文|wyw|日语|jp|
|韩语|kor|法语|fra|西班牙语|spa|
|泰语|th|阿拉伯语|ara|俄语|ru|
|葡萄牙语|pt|德语|de|意大利语|it|
|希腊语|el|荷兰语|nl|波兰语|pl|
|保加利亚语|bul|爱沙尼亚语|est|丹麦语|dan|
|芬兰语|fin|捷克语|cs|罗马尼亚语|rom|
|斯洛文尼亚语|slo|瑞典语|swe|匈牙利语|hu|
|繁体中文|cht|越南语|vie|||

## 错误码列表

当翻译结果无法正常返回时，请参考下表处理：

|错误码|含义|解决方案|
|:-:|:-:|:-:| 
|52000|成功||
|52001|请求超时|请重试| 
|52002|系统错误|请重试|
|52003|未授权用户|请检查**appid**是否正确或者服务是否开通| 
|54000|必填参数为空|请检查是否少传参数|
|54001|签名错误|请检查您的签名生成方法|
|54003|访问频率受限|请降低您的调用频率，或进行身份认证后切换为高级版/尊享版| 
|54004|账户余额不足|请前往[管理控制台](https://api.fanyi.baidu.com/api/trans/product/desktop)为账户充值| 
|54005|长query请求频繁|请降低长query的发送频率，3s后再试| 
|58000|客户端IP非法|检查个人资料里填写的IP地址是否正确，可前往[开发者信息-基本信息](https://api.fanyi.baidu.com/access/0/3)修改| 
|58001|译文语言方向不支持|检查译文语言是否在语言列表里|
|58002|服务当前已关闭|请前往[管理控制台](https://api.fanyi.baidu.com/choose)开启服务|
|90107|认证未通过或未生效|请前往[我的认证](https://api.fanyi.baidu.com/myIdentify)查看认证进度|

## 各语言 DEMO

原教程链接: https://fanyi-api.baidu.com/doc/21 , 包含 `PHP`, `JS`, `Python`, `C`, `Java`, `C#` 的 `DEMO`.

## Python DEMO

```python
# -*- coding: utf-8 -*-

# This code shows an example of text translation from English to Simplified-Chinese.
# This code runs on Python 2.7.x and Python 3.x.
# You may install `requests` to run this code: pip install requests
# Please refer to `https://api.fanyi.baidu.com/doc/21` for complete api document

import requests
import random
import json
from hashlib import md5

# Set your own appid/appkey.
appid = 'INPUT_YOUR_APPID'
appkey = 'INPUT_YOUR_APPKEY'

# For list of language codes, please refer to `https://api.fanyi.baidu.com/doc/21`
from_lang = 'en'
to_lang =  'zh'

endpoint = 'http://api.fanyi.baidu.com'
path = '/api/trans/vip/translate'
url = endpoint + path

query = 'Hello World! This is 1st paragraph.\nThis is 2nd paragraph.'

# Generate salt and sign
def make_md5(s, encoding='utf-8'):
    return md5(s.encode(encoding)).hexdigest()

salt = random.randint(32768, 65536)
sign = make_md5(appid + query + str(salt) + appkey)

# Build request
headers = {'Content-Type': 'application/x-www-form-urlencoded'}
payload = {'appid': appid, 'q': query, 'from': from_lang, 'to': to_lang, 'salt': salt, 'sign': sign}

# Send request
r = requests.post(url, params=payload, headers=headers)
result = r.json()

# Show response
print(json.dumps(result, indent=4, ensure_ascii=False))
```

## 结语

第四十四篇博文写完，开心！！！！

今天，也是充满希望的一天。