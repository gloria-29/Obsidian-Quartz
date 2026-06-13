---
标题: PandaWiki搭建个人知识库学习网站
笔记 ID: 019a0e4e-0246-768b-8aca-bd3f3c019999
笔记类型: crawl
tags:
    - 学习/学术学习
卡片盒:
    - 学习
包含语音: 否
网页链接:
创建时间: "2025-10-23T07:43:04.776"
更新时间: "2026-03-03T00:40:05.475"
---

![](https://github.com/gloria-29/OB-assets/releases/download/img-bf/bf66faffb0c7761de21e19f3b28cd3ef275cb6a8e2b34562060834c66f2f3bee.jpg)

这几天发现了一个开源项目，PandaWiki，它能搭建个人知识库学习网站：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-95/95d21c43f6b02cabffcd8dbcf2a6d93c8c0fdcb9fb6034e0cbe0d05e65697244.png)

零代码构建一个网站，现在很多AI工具可以做到，但是能做到**零代码搭建个人知识库学习网站**，PandaWiki，我发现的第一个能做到的。

于是写了这篇文章，这篇教程手把手教大家搭建一个这样的个人知识库学习网站，比较实用，感兴趣的可以看看。

1 效果展示

这是我搭建的个人知识库学习网站，首页界面：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-19/19db9c96dbe15b90d894c9780f95ee11a096207adfd9709264d83b4dfbcf6ab4.png)

我把这几天的学习笔记整理到这个网站，如下图所示，我点击某一篇笔记，中间就会自动渲染成Markdown笔记格式，右侧显示文章的目录结构，可读性还是不错的：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-dc/dc8528643b5593b2e5a2b134758ce34e9299993fdd35b710c96406bd6ead331e.png)

另外可以直接基于现有的学习笔记，提问我总结过的历史笔记，如下图所示：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-2f/2faae1d8524e558bcfa6eb8ccee52a0706dd85d0bee4eb3433797d5a4b396468.png)

如下图所示是它对我其中一篇笔记的AI总结分析，并且列出了引用源：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-e4/e4d69aad70a4b915ecfcf193d00147da9e461f34e25de448467de2f2e30958e8.png)

就这些功能太实用了，过往没有博客网站，能做到如此方便地基于个人知识库，做AI查询检索和总结分析。

关键，PandaWiki对新手也非常友好， 因为不需要编写代码，全程零代码。

只需要按照我下面的这个教程，一步一步就能搭建好，同时我也会把在搭建时候遇到问题都总结出来，感兴趣的根据下面步骤就能做出来，若有问题也可以留言告诉我。

下面咱们就逐步开始，使用PandaWiki搭建一个基于个人知识库的学习网站。

2 安装Docker

PandaWiki依赖Docker部署，所以咱们先安装Docker。系统要求Linux，最低要求：1 核 CPU / 2 GB 内存 / 5 GB 磁盘

打开终端，输入下面命令：

&#96;&#96;&#96;
vi /etc/yum.repos.d/docker-ce.repo
&#96;&#96;&#96;

编辑：

&#96;&#96;&#96;
[docker-ce-stable]name&#61;Docker CE Stable - $basearchbaseurl&#61;https://mirrors.aliyun.com/docker-ce/linux/centos/7/$basearch/stableenabled&#61;1gpgcheck&#61;0
&#96;&#96;&#96;

执行：

&#96;&#96;&#96;
yum install -y docker-ce docker-ce-cli containerd.io
&#96;&#96;&#96;

安装Docker中：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-47/47fbf822d6b1edd7ce35af8ebb5c6cde174cf198b8d45e9b3b8ed8fba7110a4a.png)

Docker安装完成：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-e0/e0d0bcf9a655fe22182320f5955f2d18c94d1b8760ec93629c54e7a3a2a4db9e.png)

测试Docker是否已经安装好：

&#96;&#96;&#96;
docker pull hello-worlddocker run --rm hello-world
&#96;&#96;&#96;

显示：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-ee/ee70a8afa872d7b153020e1c65a89d5a8b9058f4cb939be93c5a249172e62730.png)

3 安装PandaWiki

接下来执行下面一行命令，就能拉取PandaWiki镜像：

&#96;&#96;&#96;
bash -c &quot;$(curl -fsSLk https://release.baizhi.cloud/panda-wiki/manager.sh)&quot;
&#96;&#96;&#96;

选择安装：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-50/50f0975d64b5a594ca84316f4c705f458103cf06ff514ef0f5bdaa8fc735c8dd.png)

安装PandaWiki镜像中：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-d4/d43a2e83e9522e2a39f367bf69714eb05c3399398888795e52dea6d9c8c88c20.png)

镜像已拉取1.543G：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-5d/5d38cde78d031394f22d96a864d0dc18104e5459b88b66f6f7b4f98d9b119b44.png)

安装大概需要5分钟，如下图所示，表示安装完成：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-13/131e8cf783ca5565368806367fa1a766e3a60e0df3987348cba444d8fbe60ca6.png)

上图红色方框里，提示了访问地址，用户名，密码

在正式访问前，先放行2443端口：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-5d/5d0917aca41e2c500ca3f1afbfe623648d56e96e18f969d20376830998c94c56.png)

然后再在浏览器输入：

https://49.234.198.106:2443/

就会打开PandaWiki界面，这是PandaWiki的后端配置界面：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-ad/ad0c95427d6c7aff911fc09dcd8ef2b6ce342bad7e8098dcec06a28679b979d4.png)

登入进去后，就会看到admin账户：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-26/2628e8406d764854af6a9b84a4994415805aa9dbcf31339773dbc0c4e157d6c6.png)

接下来，再配置AI对话模型，如下所示，选择DeepSeek，并输入API Key：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-64/64cf32cd58d955bf9fcbca97da01584c2d65b281563891f574aa2fa3b36138fc.png)

以下三个模型无需修改，全部按照默认就行，API Key都是内置的，

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-d3/d35ccfa456baf88079ee58413683d21fe54c3b7c0d2d829bc4b4cdf73a043941.png)

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-29/29208d7ae93b958f5a9d449cc163424722c84b521b335b52ba83a789f3b325c1.png)

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-ed/ed46313fa718c2b784315d89676951acdd28cd047e66f197587b1665c14949fc.png)

无需自己去配置，比较方便。接下来，创建前端Wiki站点，如下图所示，知识库名称保存后也可以修改：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-8e/8ed1b5fad7d415c54380328ead5a750ba13024c70d87b1536c19c5cccc9ae625.png)

然后就可以创建文件夹和文档了：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-3f/3f6a38a868048ff2907f9d6d1b55ac0dc029e3b441d0684173c9c5dd44dc183d.png)

比如编辑一个文档：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-ec/ec1850935a923b00bb52d3b3412a654ecf578852d39aa884cec7828a676c29f4.png)

支持自动生成摘要，如下图所示：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-30/30839a2b19d27bfdb3ba5dd039dcaaaf8a3c7aefa15148900b9c60653ebd0a6a.png)

下面就是我最近几天创建的知识笔记，这些都在后端编写，书写简单方便：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-f9/f9dff729679ef8b79f7482aae377dbf51828399749feea35865e69e7a02b76e5.png)

这些完成后，我在点击下面，访问Wiki网站，按钮时：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-7c/7c7d54b588f93068ebb199ff3b0ec89136de2ffeccb945bc05182eb69720208a.png)

出现了不能访问的问题：

原因是虽然放行了8080端口后，但是系统防火墙（firewalld）如果**未放行 8080 端口**，依然会无法访问。解决措施如下：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-31/310b1ce3d5ec782e454303857988478e8eaf0463d3baf960167c6b9f49d878c2.png)

这样明确告诉防火墙，放行8080端口，为了方便大家复制，我把命令贴出来：

&#96;&#96;&#96;
firewall-cmd --permanent --add-port&#61;8080/tcpfirewall-cmd --reload
&#96;&#96;&#96;

然后就可以正常访问，如下所示：

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-5f/5fa126b4befd4b817c9510b8f13abd133fc534d6a00f3ff4c61c35977f8fc8c7.png)

至此，如果一切顺利，大概10分钟，你就拥有了一个基于个人知识库的学习网站，后端可以编辑知识文章，前端直接可以让其他人都能访问你的网站，正如以上大家看到的，不需要编写一行代码。

这个PandaWiki项目，我看了下是开源的，仓库地址如下所示：

https://github.com/chaitin/PandaWiki

大家可以加个star支持下良心的项目，有啥需求建议也可以提issue

在个人知识库学习网站搭建过程中，若有啥疑问也可以加入交流群，会有人帮助你解决问题：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_jpg/FQd8gQcyN27kYHvkFv7Ar4ddSqdV7QPLLMyx6OkYOk5OwT7zCPpdIgMMHSRZfibsdsaoC2914zrMvoibmZPJQPvQ/640#61;other&amp;from&#61;appmsg#imgIndex&#61;39)

总结

总的来说，PandaWiki 是一个真正实现了“零代码上手”的个人知识库网站。整个过程只需一条命令即可完成部署，无需任何编程基础；后台可以直接编写、分类、总结笔记，前台页面则自动同步更新，呈现清晰美观的阅读体验。

更令人印象深刻的是，它将 AI 检索与知识管理融为一体，让你能够基于自己的笔记进行自然语言提问、自动生成总结，并精准标注引用来源。

对于希望快速搭建个人学习与知识沉淀网站的人来说，PandaWiki 无疑是一个高效、优雅且实用的选择。

以上全文2159字，28张图。若可以，给我个三连击：点赞、转发和在看。若可以再给我加个⭐️，谢谢你看我的文章，我们下篇再见。
