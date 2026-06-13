---
标题: NotionMpClipper支持Obsidian剪藏
笔记 ID: 0197a4ae-b8d2-7f8d-9e89-c4928aa7b7eb
笔记类型: crawl
tags:
    - 自我提升/成长记录
卡片盒:
    - 自我提升
包含语音: 否
网页链接:
创建时间: "2025-06-25T09:23:23"
更新时间: "2026-03-03T17:58:45.024"
---

![cover_image](https://github.com/gloria-29/OB-assets/releases/download/img-1f/1f2a1b128ef549002e18e7e84d3b1f31391ff7147561e2beef9d60b34406eb3d.jpg)

原创 攻城狮MK [NotionHelper](javascript:void(0);) *2025年06月24日 21:30*

&gt; 世间最快之物，非光也，乃逝去之时间，尤在奔波劳碌之际。

## 🎯 更新亮点速览

* ✨ Obsidian剪藏
* 🏷️ 标签同步备份
* 🎨 交互体验优化
* 🚀 底层引擎重构

哈喽，各位 NotionMpClipper 的朋友们，好久不见！

今天发这篇文章，正式向大家介绍 NotionMpClipper 本次发布带来的新特性： **Obsidian-微信剪藏同步** 。

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-9d/9dad8eb959dab7047d38351e26f897103697ab1391edc74feef08ac8665c9aa2.webp)

去年双十一的时候我在公众号文章里表达了我想在 NotionMpClipper 中支持 Obsidian 剪藏的计划，并表示将尽快安排，争取在今年上半年上线，今天终于把承诺兑现了。

还记得 23 年刚接触 Notion 那会，我产生了一个想法：“将微信与 Notion 打通，让移动端剪藏变得更加轻松”，如今同样要把微信与 Obsidian 打通，让没有同步方案的 Obsidian 用户能够轻松的在移动端快捷剪藏并将内容呈现在 PC 端的 Obsidian 仓库里。

希望对于同样热爱收集和知识管理的 Notion 和 Obsidian 用户们能够提供一些便利。

本次发布除了支持 Obsidian 剪藏之外，还针对常用标签容易丢失的场景增加了 Notion **标签同步和标签备份** 功能。

在之前的功能设计中，本着剪藏插件只转存数据不保存数据的原则，常用标签设计为只保留在小程序客户端，当用户清理小程序或者微信缓存时可能导致常用标签丢失。

在本次发布所含的日常功能迭代里开放了同步 Notion 标签的能力，注意这是需要用户手动触发才会进行 Notion 标签查询同步的，本小程序在设计功能时，尽量不读取用户数据，即使需要读取用户数据，也是在用户明确知道并且在主观操作的情况下进行。

用户也可以选择定期将常用标签同步备份到云端服务器，同时也提供了删除云端备份的入口。

另外还优化了 **图床配置和个性设置页面的交互** ，之前的设计确实容易让人产生误会，这是我作为开发者所欠缺的能力，在经历了多位用户的反馈下，这个交互优化的任务大大的提高了优先级。

最后，本次发布对 **网页解析引擎做了大范围重构升级** ，套用严谨的程序员的话：理论上来讲，这次发布后的剪藏体验应该会更棒更棒。

## ⚙️ Obsidian剪藏配置

我知道，你已经迫不及待了。别急，这份图文+标注的教程将带你轻松配置好 Obsidian 剪藏。

&gt; 注意： Obsidian 剪藏功能还在完善当中，目前对会员开放，后续稳定后将对所有用户开放体验。

### 📱 如何配置？

#### 🔧 第一步：小程序端配置

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-2a/2a53ed2015dd6a8883d5810d35fe9d96ce6f7c4b7d24b8eb899e0658ecf4f048.webp)

1. 进入 【NotionMpClipper 小程序】-【我的】-【Obsidian】页面。按照提示配置图床，支持阿里云、腾讯云、缤纷云、cloudflare r2、以及各类兼容 S3 协议的对象存储服务。 &gt; 注：需要图床配置教程的请在本公众号后台发送：图床。
2. 进入【NotionMpClipper 小程序】-【我的】-【个性设置】页面。将【保存到Obsidian】这个开关打开。 ![图片](https://github.com/gloria-29/OB-assets/releases/download/img-ae/ae1af8dc2e16e653dc9be22cbc114901534aad3b7d6c02eb2012346130f6a825.webp)

#### 💻 第二步：Obsidian插件安装

关注【NotionHelper】公众号，后台发送： **插件** 。下载插件后导入安装到 Obsidian 中，然后完成插件的配置。

为了方便用户配置插件，我在小程序-【我的】-【Obsidian】页面提供了一个复制 Obsidian 配置的按钮，你可以直接复制到剪贴板中，然后保存到你的记事本里，再复制到 Obsidian 插件配置表单。

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-f1/f1f3616d1280e0622fc21d8f1724456d030ac4c8122d946e0e1d2c17d9170792.webp) ![图片](https://github.com/gloria-29/OB-assets/releases/download/img-52/529f1d639786a83e0436aacd777ebbd74c2488c437960fc373e1fd91a26c90e0.webp)

#### ⚠️ 第三步：图床CORS配置

有一个特别需要注意的配置：无论你使用什么图床，你都需要去图床平台增加一项配置： **CORS跨域配置** 。

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-37/3743e990bee5641b3c6c8a23d7cdb5d40075cfc10988116a59fe66569b5ccdfa.webp)

我这里给了一份缤纷云的参考，其他图床也是这样配置。如仍有不明白的地方可以在 Obsidian 剪藏内测群里反馈，这个不难，我建议可以优先百度或者 DeepSeek 解决。

### 🚀 如何使用？

配置好之后，剪藏流程和之前完全一样。你可以把文章链接发送给小程序剪藏，也可以通过微信收藏助手来剪藏。

**请注意** ：开启 Obsidian 剪藏后，Notion 的剪藏功能将自动停用，反之亦然。两者是互斥关系，你可以随时在设置中切换回来。

我对剪藏格式进行了深度优化，确保文章在 Obsidian 中也能保持优美的排版，网页中各种常见标签格式，都能得到很好的呈现。

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-39/3915ef14e00bce02e8c9b65f4cd081e013e40e2c0a45108fda98e2d21b41f211.webp) ![图片](https://github.com/gloria-29/OB-assets/releases/download/img-04/0468d59a66862cae705b03519a3eea812a485e68afc3c173c82a6ce106f7a51c.webp)

## 🔮 未来展望：AI 要来了！

在产品设计上，我有点&#39;一根筋&#39;。很多朋友建议的功能，我迟迟没有上线，不是不想做，而是希望每一个功能拿出来时，它不仅对我来说&#39;开发完了&#39;，对你来说更是&#39;足够好用&#39;。

这几个月以来，AI 对我的工作提效不少，我在工作中也有不少 AI 提效落地的 KPI。在下半年我会将我的工作经验结合落地到 NotionMpClipper 中，希望可以带来一些真正有用并且实际体验感拉满的能力：

* **AI 修正标题** ：帮你把&#39;震惊体&#39;标题一键还原成清爽、有信息量的标题。
* **AI 自动打标** ：剪藏一堆文章没时间整理？AI 帮你自动分类打标。
* **AI 聊天记录总结** ：聊天标题生成，分析话题参与者和观点内容

当然，AI 是附加功能，它只在你的需要和允许下工作。

敬请期待！

---

## 💌 写在最后

感谢每一位用户。正是因为你们的持续反馈、耐心等更和热情分享，NotionMpClipper 才能持续迭代茁壮成长。你们的每一个建议，都是我前进的动力。

如果你是小程序的付费用户，并且同时是 Obsidian 的用户，欢迎你加入内测，成为产品的第一批体验官和共建者。你的反馈对我至关重要。

&gt; **如何申请内测？** 请直接在私我微信或者在用户群、NotionHelper公众号后台联系我，并备注【申请内测】，我会尽快与你联系。

再次感谢大家的支持，我们下一个版本见！

个人观点，仅供参考

继续滑动看下一个

![](https://github.com/gloria-29/OB-assets/releases/download/img-92/92f711b93e147e9361bb284bf1da50d3958aed55f0e464cd408c01898e71d183.png)

NotionHelper

向上滑动看下一个

![](https://github.com/gloria-29/OB-assets/releases/download/img-9f/9f66858ed11a75ea313404649416387245f47610bc4f517049dc519b3654fa89.png)

NotionHelper

&gt; 原始链接：[https://mp.weixin.qq.com/s/QP0tr884rs2xw2Cf\_RY-Gw](https://mp.weixin.qq.com/s/QP0tr884rs2xw2Cf_RY-Gw)
