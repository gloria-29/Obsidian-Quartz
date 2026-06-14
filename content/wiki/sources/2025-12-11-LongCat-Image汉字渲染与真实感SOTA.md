---
title: "LongCat-Image汉字渲染与真实感SOTA"
type: source
date: 2025-12-11
source: web
source_url: https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b0c1a-ebc2-7ca1-b3a5-b54f97e908fe.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251211%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251211T063051Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;c885ff51d4d98ce34572e7355c67df6d766206319b37bc288706f474de7bafe6&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject
topics: ["工具", "生活"]
---

# LongCat-Image汉字渲染与真实感SOTA

## 概要
这两天看到图像生成领域，又开源了一个“出乎意料”的模型！ 它能解决很多读者粉丝们长久以来的痛点，什么痛点呢？就是平时用 AI 生图时，画不好汉字，或者想精准修改图片里的某个物体（比如把猫变成狗）却把背景搞乱了。以前为了解决这些问题，可能需要复杂的 ComfyUI 工作流，或者微调大模型，非常耗时。 今天这篇文章，我来分享下美团刚刚开源的 LongCat-Image。它以仅仅6B 的参数量，在多项指...

## 核心内容

### **1 效果展示**
- 我们直接看效果，毕竟眼见为实。
- 以往我们用开源模型生成带中文的图片，出来的字往往是“鬼画符”。现在使用 LongCat-Image，只需输入一段提示词，输入：
- 这是一个中国风的春节海报，画面中央写着巨大的金色汉字&quot;恭喜发财&quot;。
- 生成效果如下：
- 你可以看到，这 4 个汉字笔画清晰，结构准确，完全没有乱码。
- 即便连‘罍’这样笔画繁复的生僻字，都能精准还原，笔锋清晰，彻底打破了AI‘只识大众字，不识冷门字’的刻板印象！如下图所示：

### **2 核心亮点与开源**
- 这样的 AI 绘图模型，其实市面上不少，美团这次开源的 LongCat-Image 我看了下确实良心，主要体现在以下几点：
- 第一，以小博大，性能强悍。
- 它只有 6B 的参数量。这是什么概念？意味着它不需要昂贵的 H100 集群，普通的显卡就能跑得动。在 GenEval测评超过闭源模型，得分0.87：
- 第二，中文与真实感并重。
- 美团团队在预训练阶段引入了千万量级的合成数据来学习字形，解决了 AI“不识字”的难题。同时，为了去除 AI 绘图常见的“塑料感”，他们引入了OCR 与美学双奖励模型，让生成的图片光影质感非常真实。
- 为了去验证到底是不是它论文中这样说的，输入这个提示词：

### 除了看效果，我也帮大家跑通了基本的代码。如果你想在本地或者服务器上部署体验，可以参考下面的步骤。
- 第一步：环境准备
- 推荐使用 Conda 创建独立环境，防止依赖冲突：
- &#96;&#96;&#96;
- git clone https://github.com/meituan-longcat/LongCat-Imagecd LongCat-Imageconda create -n longcat-image python&#61;3.10c
- &#96;&#96;&#96;
- &#96;&#96;&#96;

## 关键概念

## 关联实体

## 相关页面
