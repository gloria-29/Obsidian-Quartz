---
标题: LongCat-Image汉字渲染与真实感SOTA
笔记 ID: 019b0c1b-1c1f-7bcc-9e88-cca55433ae02
笔记类型: crawl
tags:
    - 生活/电子工具
卡片盒:
    - 生活
包含语音: 否
网页链接:
创建时间: "2025-12-11T14:31:01.923"
更新时间: "2026-03-11T20:45:31.691"
---

![](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b0c1a-ebc2-7ca1-b3a5-b54f97e908fe.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251211%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251211T063051Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;c885ff51d4d98ce34572e7355c67df6d766206319b37bc288706f474de7bafe6&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

你好， 我是郭震！

这两天看到图像生成领域，又开源了一个“出乎意料”的模型！

它能解决很多读者粉丝们长久以来的痛点，什么痛点呢？就是平时用 AI 生图时，**画不好汉字**，或者想**精准修改**图片里的某个物体（比如把猫变成狗）却把背景搞乱了。以前为了解决这些问题，可能需要复杂的 ComfyUI 工作流，或者微调大模型，非常耗时。

今天这篇文章，我来分享下美团刚刚开源的 **LongCat-Image**。它以仅仅6B 的参数量，在多项指标上超越了百亿级的大模型，尤其是中文文字的渲染能力，简直是“强迫症”福音。感兴趣的可以看看这篇。

### **1 效果展示**

我们直接看效果，毕竟眼见为实。

**以往我们用开源模型生成带中文的图片，出来的字往往是“鬼画符”**。现在使用 LongCat-Image，只需输入一段提示词，输入：

*这是一个中国风的春节海报，画面中央写着巨大的金色汉字&quot;恭喜发财&quot;。*

**生成效果如下：**

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b0c1a-df58-7118-9ecb-22a5a98e67fb.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251211%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251211T063050Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;903b13b761733e98219e71d04ff2fcfcda58facb2d6691d9ee46b5f9852e36c9&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

你可以看到，这 4 个汉字笔画清晰，结构准确，完全没有乱码。

即便连‘罍’这样笔画繁复的**生僻字**，都能精准还原，笔锋清晰，彻底打破了AI‘只识大众字，不识冷门字’的刻板印象！如下图所示：

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b0c1a-ebb8-776a-9fd4-654c56c86482.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251211%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251211T063052Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;406d6c8bf629849eaeb954b6112ea61c7e186d2a7986482025cba41ee938b44d&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

这效果还真是很不错！我查看了下文档介绍，LongCat-Image覆盖了 **8105 个通用规范汉字**，在 ChineseWord 评测中得分高达 **90.7**，遥遥领先同类产品:

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b0c1a-eb97-7af7-980a-079333b378c2.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251211%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251211T063051Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;2558749f88d4c267213c617cae3172876f420e5ac32dfd2274eb793e6407b622&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

再来看看**图像编辑**能力。

以前想把一张照片里的物体换掉，往往需要遮罩、重绘等复杂操作。现在，LongCat 提供了专门的 LongCat-Image-Edit 模型。编辑前后的对比如下所示。

**原图：**

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b0c1a-f1c3-7d12-ab39-861468f77157.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251211%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251211T063054Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;faa1c210fee0027449793ced2bea00265954068e710415332504415eacbbda02&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

输入原图和一句简单的指令：&quot;将猫变成狗&quot;，编辑后的图如下所示：

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b0c1a-f174-779f-bc61-d7a6b2b2d622.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251211%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251211T063058Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;61f145f1402cd520d660656f922b51e2bf5be301f35052607f85a6844766f724&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

**背景纹理、光影几乎没有变化，只有目标物体被完美替换。**

继续编辑上图，回复：戴上未来眼镜，霓虹灯效，如下图所示：

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b0c1a-f256-7903-b6e0-ce34f28d9ba7.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251211%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251211T063059Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;c17e084faff6ee03301db846800491c6de81a606df0cec55aaa876056e0c88dd&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

继续编辑上图，打领带，如下图所示：

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b0c1a-f231-78df-aaec-32cc4a1d3459.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251211%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251211T063055Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;6b1be64e89c6a6eb32d66902f6d0c010afd0db7fe3e9144e98d42db6922289e4&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

以上经过四轮连续编辑图片，能做到“指哪打哪”，完全拿捏。这就太实用了。比如对于做电商图、海报修改的朋友来说，这个特性就太节省时间了。

再实测下这些实用场景，如下所示：*一张模特穿着****白色棉质T恤****的半身照*

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b0c1a-f200-7ad3-9b2d-5599e8aca038.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251211%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251211T063054Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;056f13e9e478fc456ff13b7ee830f100aaaa64d5b1f2fc58056f8b7ff278f0b7&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

输入上面原图，写几个字，*将白色T恤变成红色真丝衬衫*：

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b0c1a-f1c0-7efe-9ff6-1573435c404c.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251211%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251211T063053Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;b5aeda9c8839dde121e3efa9c9c0cfc12cdd9833239f9a433a5bf946207f0109&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

继续编辑上图，回复：*戴上闪耀的钻石耳环和项链*

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b0c1a-f1fc-77c6-90b2-eecb148625a9.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251211%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251211T063055Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;b6370e4be3b093d1b97cf56b308fb20d78c6011d70b4ceccafc450fe3ba1a847&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

继续编辑上图，回复：*背景变成高级法式餐厅，手里拿着高脚红酒杯*

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b0c1a-f254-76f9-bdbc-f3bf55b23019.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251211%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251211T063056Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;8d0118c20ad7c735ac596d4201627e5a085fa47ee90d94b474f2e7199aa82171&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

做电商的朋友都懂，以前为了上架不同颜色的同款衣服，得让模特换好几套衣服拍半天。现在，你看AI编辑上面这些图，我只输入了简单指令，模特身上的**棉质T恤**瞬间变成了**红色真丝衬衫、带上了钻石耳环和项链，背景背景变成高级法式餐厅，手里拿着高脚红酒杯**。

**注意看褶皱的光泽感，真丝的反光和棉布完全不同**，但模特的手势、身材、背景丝毫未动。这就叫‘**一图多用**’！”

### **2 核心亮点与开源**

这样的 AI 绘图模型，其实市面上不少，美团这次开源的 LongCat-Image 我看了下确实良心，主要体现在以下几点：

**第一，以小博大，性能强悍。**

**它只有 6B** 的参数量。这是什么概念？意味着它不需要昂贵的 H100 集群，普通的显卡就能跑得动。在 GenEval测评超过闭源模型，得分0.87：

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b0c1a-f1bd-7688-b9f8-47eae0f02efa.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251211%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251211T063052Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;228e9e7a3c2ae0dd8e1d8c40074319bec68d6a94094fa70a134c9ba6d0332a9e&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

**第二，中文与真实感并重。**

**美团团队在预训练阶段引入了千万量级的合成数据来学习字形，解决了 AI“不识字”的难题。同时，为了去除 AI 绘图常见的“塑料感”，他们引入了OCR 与美学双奖励模型，让生成的图片光影质感非常真实。**

**为了去验证到底是不是它论文中这样说的，输入这个提示词：**

***一张超写实的亚洲女性侧脸特写，清晨的阳光从侧面打过来。要求：皮肤要有通透感，能清晰看到脸上的细微绒毛和毛孔，保留自然的雀斑。背景是虚化的咖啡馆窗户，哈苏相机实拍质感。***

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b0c1a-f25c-7733-b3ea-7fbcea2aa91d.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251211%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251211T063058Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;00dcbcf1f41c75b4099bc3417597fd146c81c9c66ae30dc626fc6a6ea495e6dc&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

生成的这张图质量基本和它论文中描述的相吻合，无**塑料感，片光影质感非常真实。**

再有一个很实用的商用场景，能对海报道具随意换，如下图所示：

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b0c1a-f259-723e-8e6c-3107eadd6bf5.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251211%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251211T063058Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;c9a2f9c52363d65ec5e0d49e2c498816014349c21f2f11e7ba0c46b5d0bfdd96&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

有时候产品图拍好了，老板突然说：“这个配景的水果不好看，换成花”，以前这得重新建模或PS很久。如下所示，只需要输入原图，加几个字：将红苹果变成透明水晶球：

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b0c1a-f25f-7642-b121-9d8d5847ed92.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251211%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251211T063059Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;969303a4d3f18f542b55a8fdb518706c8b1ab9767073a164e01c9569592c92a7&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

再看这个海报修改的例子。原图桌上是个苹果，我觉得不够高级，想换成水晶球。在 LongCat 里输入指令后，苹果消失了，取而代之的是一个**通透的水晶球**。**最绝的是什么？ 大家看水晶球里的倒影，还有透过水晶球折射出的桌面纹理，光学的物理规律都符合！**这要是让设计师手绘修图，没个半天搞不定，AI 只要 10 秒。”

**第三，全生态开源。**

我在 Github 上看了一圈，他们不仅开源了**文生图模型**，还开源了专门的**图像编辑模型**，甚至连**中间训练检查点（Dev版）和完整的训练代码**都放出来了！

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b0c1a-f251-7c82-ac9b-be9029238804.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251211%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251211T063055Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;2e48b9b6af81d119eeeb5e1841481fa3b2333362df3c5f6c0419e292c0f46669&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

这意味着开发者不仅可以直接用，还可以基于它进行微调，训练属于自己的风格模型。

### **3 快速上手教程**

### 除了看效果，我也帮大家跑通了基本的代码。如果你想在本地或者服务器上部署体验，可以参考下面的步骤。

**第一步：环境准备**

推荐使用 Conda 创建独立环境，防止依赖冲突：

&#96;&#96;&#96;
git clone https://github.com/meituan-longcat/LongCat-Imagecd LongCat-Imageconda create -n longcat-image python&#61;3.10conda activate longcat-imagepip install -r requirements.txt
&#96;&#96;&#96;

&#96;&#96;&#96;


&#96;&#96;&#96;

**第二步：模型下载**

使用 huggingface-cli 下载模型权重：

&#96;&#96;&#96;
pip install  &quot;huggingface_hub[cli]&quot;# 下载文生图模型huggingface-cli download meituan-longcat/LongCat-Image --local-dir ./weights/LongCat-Image
&#96;&#96;&#96;

**第三步：运行文生图代码**

只需要几行 Python 代码，就能生成高质量图片。

&#96;&#96;&#96;
import torchfrom transformers import AutoProcessorfrom longcat_image.models import LongCatImageTransformer2DModelfrom longcat_image.pipelines import LongCatImagePipelinedevice &#61; torch.device(&#39;cuda&#39;)checkpoint_dir &#61; &#39;./weights/LongCat-Image&#39;text_processor &#61; AutoProcessor.from_pretrained( checkpoint_dir, subfolder &#61; &#39;tokenizer&#39;  )transformer &#61; LongCatImageTransformer2DModel.from_pretrained( checkpoint_dir , subfolder &#61; &#39;transformer&#39;,     torch_dtype&#61;torch.bfloat16, use_safetensors&#61;True).to(device)pipe &#61; LongCatImagePipeline.from_pretrained(    checkpoint_dir,    transformer&#61;transformer,    text_processor&#61;text_processor,    torch_dtype&#61;torch.bfloat16)# pipe.to(device, torch.bfloat16)  # Uncomment for high VRAM devices (Faster inference)pipe.enable_model_cpu_offload()  # Offload to CPU to save VRAM (Required ~17 GB); slower but prevents OOM
&#96;&#96;&#96;

**注意：如果你想在图片里写字，记得把文字内容放在英文双引号 &quot;&quot; 里，**

&#96;&#96;&#96;
prompt &#61; &#39;一个年轻的亚裔女性，身穿黄色针织衫，搭配白色项链。她的双手放在膝盖上，表情恬静。背景是一堵粗糙的砖墙，午后的阳光温暖地洒在她身上，营造出一种宁静而温馨的氛围。镜头采用中距离视角，突出她的神态和服饰的细节。光线柔和地打在她的脸上，强调她的五官和饰品的质感，增加画面的层次感与亲和力。整个画面构图简洁，砖墙的纹理与阳光的光影效果相得益彰，突显出人物的优雅与从容。&#39;image &#61; pipe(    prompt,    height&#61;768,    width&#61;1344,    guidance_scale&#61;4.5,    num_inference_steps&#61;50,    num_images_per_prompt&#61;1,    generator&#61;torch.Generator(&quot;cpu&quot;).manual_seed(43),    enable_cfg_renorm&#61;True,    enable_prompt_rewrite&#61;True# Reusing the text encoder as a built-in prompt rewriter).images[0]image.save(&#39;./t2i_example.png&#39;)
&#96;&#96;&#96;

**这是他们文档中说到的一个小窍门。**

**总结一下**

美团这次开源的 LongCat-Image，在 **6B 参数**这个轻量级赛道上，确实做到了极致。

无论是对**中文文字的精准渲染**，还是对**图像编辑的可控性**，都达到了开源领域的 SOTA当前最佳水平。而且它基于 Apache 2.0 协议，商用友好，这对于开发者和创业者来说，绝对是个好消息。

感兴趣的读者，建议根据文中教程，去下载模型玩一玩。在这个 AIGC 爆发的时代，有一个趁手的工具，效率直接翻倍。

以上全文 3859 字，16图，包括操作步骤。若可以，给我个三连击：点赞、转发和在看。若可以再给我加个⭐️，谢谢你看我的文章，我们下篇再见。

&gt; 来自：[https://mp.weixin.qq.com/s/YEFeeloiXxoS6KJa3wZM8w](https://mp.weixin.qq.com/s/YEFeeloiXxoS6KJa3wZM8w)
