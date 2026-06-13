---
标题: [官方教程] 在Dinox中添加自己的对象存储服务 - Dinox反馈中心
笔记 ID: 0195f5c9-5094-7750-a8ac-53692e04dac6
笔记类型: crawl
tags:
    - 学习/学术学习
卡片盒:
    - 学习
包含语音: 否
网页链接:
创建时间: "2025-04-02T17:16:06"
更新时间: "2026-03-03T08:32:31.352"
---

原始链接：[http://feedback.dinox.info/questions/10010000000000023](http://feedback.dinox.info/questions/10010000000000023)

## S3的优势

Dinox中支持将多媒体文件，以及其他相关文件上传到自己的S3服务中，S3服务相对与webdav等传统存储服务有很多优点

价格不贵支持外网访问多媒体，笔记能够在外部直接渲染对应的多媒体文件内容隐私性较好，相比与存储在官方S3中，存储在自己的S3会更加安全，稳定，对于极致安全的场景，也可以Nas部署Minio这样的开源S3服务数据安全性好，所有数据自己掌握迁移方便，Dinox支持自定义域名和前缀路径，以后的迁移十分方便

## 缤纷云为例设置

### 缤纷云优劣

### 优点

价格便宜速度ok运营3年，没有出什么问题

### 缺点

相对于传统的阿里云，七牛云等厂商，仍然属于新厂商

## 设置流程

注册缤纷云账号，这一步就不演示了，注册后需要实名点击右上角控制台进入  
![image.png](http://feedback.dinox.info/uploads/post/5qMG7JupkW1.png)

#### 桶创建

创建桶，我这里创建了一个dinoxoss的桶，大家按照自己的喜好填写即可，选择公开桶，此时需要充一笔小钱，几块钱也可以，随意，可以使用系统里面发放的优惠券  
![image.png](http://feedback.dinox.info/uploads/post/5qMGvAdYBG5.png)

#### AccessKey 设置

创建子用户: 选择左侧菜单栏的accessKey，添加子用户，名字按照自己喜好即可创建Accesskey: 备注任意填写，子用户选择第一步添加的即可，创建完成后系统会提供一个AccessKey和SecretKey, 可以理解为系统为你分配的访问凭证，复制保存下来，后面有用  
![image.png](http://feedback.dinox.info/uploads/post/5qMGUQXQK5u.png)

#### 查看桶的信息，点击左侧桶列表，选择刚才自己创建的桶

![image.png](http://feedback.dinox.info/uploads/post/5qMHdCpv5yY.png)打开访问管理里的公开读取和启动http3  
![image.png](http://feedback.dinox.info/uploads/post/5qMJbAGdtoq.png)

### 把缤纷云的信息填写到Dinox中

首先我们打开Dinox APP, 打开侧边栏，点击右下角的设置，进入到系统设置，滑到最下面，点击去设置对象存储  
![image.png](http://feedback.dinox.info/uploads/post/5qMHwVVnR79.png)参照下图的对应关系，把信息填写到dinox中  
![image.png](http://feedback.dinox.info/uploads/post/5qMKJqjRg1u.png)

### 在Dinox中把剪藏的视频 图片替换成自己的s3链接

长按图片，选择替换为对象存储链接，就可以传到自己的存储中啦  
![image.png](http://feedback.dinox.info/uploads/post/5qMKYUhLmtS.png)
