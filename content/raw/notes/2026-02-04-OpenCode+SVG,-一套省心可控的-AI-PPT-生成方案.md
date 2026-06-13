---
标题: OpenCode+SVG, 一套省心可控的 AI PPT 生成方案
笔记 ID: 019c25c4-af44-7807-8b39-c1a0b8a2ad3d
笔记类型: crawl
tags:
    - 生活/电子工具
卡片盒:
    - 生活
包含语音: 是
网页链接:
创建时间: "2026-02-04T07:09:32.868"
更新时间: "2026-03-11T20:45:31.691"
---
![录音](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/files/019c25c4-a3fa-73ba-8ff0-656bfcdfd508.md#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260203%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260203T230932Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;2c0e9ad13d351ace469b97f20894756202a5004a3dae304fbd01d0d3315db4d5&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

# [OpenCode + SVG：一套省心可控的 AI PPT 生成方案](https://linux.do/t/topic/1489177#p-12838904-opencode-svg-ai-ppt-1)

[![image](https://linux.do/uploads/default/optimized/4X/6/0/b/60b849887f5a86ce59b68b7801d32d03eed56bfc_2_690x292.jpeg)](https://linux.do/uploads/default/original/4X/6/0/b/60b849887f5a86ce59b68b7801d32d03eed56bfc.jpeg)

前两天接到个活儿，要做个项目方案演示 PPT。

打开 PowerPoint 的那一刻，我盯着空白页面发了五分钟呆。![:slightly_frowning_face:](https://linux.do/images/emoji/twitter/slightly_frowning_face.png#61;15)

说实话，作为一个产品，PPT 能力属实一般 —— 内容我能写，但怎么让它**好看** 、**有重点** 、**一眼能抓住人** ，这事儿我真不太行。

正好最近 OpenCode 特别火，号称是 Claude Code 的平替。最关键的是，它支持接入 GitHub Copilot 作为模型能力。

巧了，公司正好给订阅了 Copilot 企业版 ![:grinning_face_with_smiling_eyes:](https://linux.do/images/emoji/twitter/grinning_face_with_smiling_eyes.png#61;15)

也就是说，我现在直接实现了 **API 自由** —— 装个 OpenCode，切到 Copilot，然后猛猛造就完事儿了。

于是就有了这篇：**用 OpenCode 无痛生成可编辑 PPT 的完整流程** 。

### [预期管理](https://linux.do/t/topic/1489177#p-12838904-h-2)

先说清楚，咱们今天分享的这套方案，主打三个字：

- 简单实用 （不需要 mcp、skills）
- 复用性强 （掌握方法后可在多种 PPT 场景下使用）
- 可控性高 （支持持续性的调整和二次修改）

最关键的是 —— 输出的内容**可以在 PPT 里二次编辑** ，不像 NotebookLM 那种，生成出来是张图片，改都没法改。

但有一点要提前说：这次主打实用，美观性这种主观因素先不深究。不过可以保证，出来的效果直接拿去用是没问题的。

还有，我下面描述的操作流程更多是**提供一种思路** ，很多步骤不是固定的，也没有所谓「一键出成果」的操作。希望大伙儿按这个思路多试试，换不同风格玩玩看。

### [省流总结](https://linux.do/t/topic/1489177#p-12838904-h-3)

凡是需要把复杂信息结构化呈现、用图形辅助理解的场景，都很契合这套流程。

熟悉 Vibe Coding 的小伙伴，看完这个流程估计不用看细节就能直接上手了：

1. 安装 OpenCode
2. 安装官方插件 oh-my-opencode
3. 创建项目文件夹，准备好 PPT 文稿内容
4. 用 OpenCode 打开项目文件夹，切换到 Plan 模式，输入 ulw 进入 **Ultrawork 模式**
5. 输入下文准备好的 Prompt，选择 PPT 风格，输出为 SVG 格式
6. 在 PPT 中导入 SVG 文件，点击「转换为形状」
7. 微调一下文本排列和字号，搞定！

## [效果展示](https://linux.do/t/topic/1489177#p-12838904-h-4)

正好这两天国外 X 上有位大佬发了篇长文特别火：「如何在一天内彻底修复你的人生」，我就拿这篇文章来做流程演示。

这是从一篇 4000 字的长文，到一套可编辑的 PPT 录屏效果。

全程用 OpenCode 生成，导入后可以直接在 PPT 里改，先瞅瞅看效果如何![:backhand_index_pointing_down:](https://linux.do/images/emoji/twitter/backhand_index_pointing_down.png#61;15)

&gt; 原文链接：[https://x.com/thedankoe/status/2010751592346030461?s&#61;20](https://x.com/thedankoe/status/2010751592346030461?s&#61;20)

[如何在一天内彻底修复你的人生.pdf](https://linux.do/uploads/short-url/iSjj2iOiZQ1cr7sscxxFYc1naHt.pdf) (719.7 KB)  

想上传视频的，没找到咋搞，大伙儿打开 PDF 看看也行。
[![PixPin_2026-01-20_12-35-49](https://linux.do/uploads/default/optimized/4X/8/2/3/823baca0f13432132d072c024d77eae0aa43c840_2_620x500.jpeg)](https://linux.do/uploads/default/original/4X/8/2/3/823baca0f13432132d072c024d77eae0aa43c840.jpeg)

## [前期准备](https://linux.do/t/topic/1489177#p-12838904-h-5)

### [1. 安装 OpenCode](https://linux.do/t/topic/1489177#p-12838904-h-1-opencode-6)

打开官网，安装指引很详细。支持三种方式：终端、客户端、IDE 插件。

个人推荐直接选**客户端** —— 方便查看历史记录，使用门槛也低。

&gt; 官方安装链接：[OpenCode | Download](https://opencode.ai/download)

[![image](https://linux.do/uploads/default/optimized/4X/4/2/e/42ed2e491a0a196ca52e0428602cc4273af0215b_2_625x500.jpeg)](https://linux.do/uploads/default/original/4X/4/2/e/42ed2e491a0a196ca52e0428602cc4273af0215b.jpeg)

### [2. 添加模型提供商](https://linux.do/t/topic/1489177#p-12838904-h-2-7)

安装完成后，打开终端输入以下命令，选择 Agent 执行任务时用哪个模型提供商：

opencode auth login

我这里直接选了 GitHub Copilot。

没有提前准备 API 也没关系 —— 官方很贴心地内置了几个免费模型，终端里选第一项，或者客户端里选置顶的几个大模型，就能直接免费用。

&gt; 备注：以下所有效果均通过 GitHub Copilot 的 Claude Opus 4.5 模型生成。

[![image](https://linux.do/uploads/default/original/4X/4/8/e/48e38cb412188244fb820935830c710fea5d51ec.png)](https://linux.do/uploads/default/original/4X/4/8/e/48e38cb412188244fb820935830c710fea5d51ec.png)  

[![image](https://linux.do/uploads/default/optimized/4X/8/f/8/8f8eea580f56da28dc9371c906ba41d5cd82d907_2_690x310.png)](https://linux.do/uploads/default/original/4X/8/f/8/8f8eea580f56da28dc9371c906ba41d5cd82d907.png)

### [3. 安装 oh-my-opencode 插件](https://linux.do/t/topic/1489177#p-12838904-h-3-oh-my-opencode-8)

这一步很关键。

oh-my-opencode 是官方插件，一个强大的 OpenCode 扩展集合。简单说，开启后会进入**火力全开模式** ，自动根据任务情况安排最合适的工作 Agent。

安装很简单，直接在对话框输入：

&#96;&#96;&#96;
&quot;Install and configure by following the instructions here https://raw.githubusercontent.com/code-yeongyu/oh-my-opencode/refs/heads/master/README.md&quot;
&#96;&#96;&#96;

&gt; 参考文档：[🔥 Oh My OpenCode (Oh My OpenCode) - OpenCode 中文文档](https://www.opencodecn.com/docs/best-practices/oh-my-opencode)

### [4. 准备项目文件](https://linux.do/t/topic/1489177#p-12838904-h-4-9)

新建一个文件夹作为项目文件夹，把 PPT 文稿内容存成 .md 格式放进去，然后用 OpenCode 客户端打开这个文件夹。

到这里，所有前置准备就完成了。接下来进入 PPT 生成的具体步骤 ![:backhand_index_pointing_down:](https://linux.do/images/emoji/twitter/backhand_index_pointing_down.png#61;15)

[![image](https://linux.do/uploads/default/optimized/4X/5/7/e/57e27d148c236bf27eb34171e9c3d1441a7f5222_2_690x474.jpeg)](https://linux.do/uploads/default/original/4X/5/7/e/57e27d148c236bf27eb34171e9c3d1441a7f5222.jpeg)

## [PPT 生成操作流程](https://linux.do/t/topic/1489177#p-12838904-ppt-10)

### [1. 进入 Ultrawork 模式](https://linux.do/t/topic/1489177#p-12838904-h-1-ultrawork-11)

打开项目文件后，在输入框直接输入 ulw，让 OpenCode 进入「燃起来![:fire:](https://linux.do/images/emoji/twitter/fire.png#61;15)」的 **Ultrawork 模式** 。

输入后，会先告知该模式的一些事项和规则。官方给出了详细的 Prompt，最下方也有使用场景说明：

- 探索代理（背景）— 代码库结构、文件模式、内部实现
- 图书管理员代理（背景）— 外部文档、API 参考、开源示例
- 计划代理 — 详细工作分解和策略
- 数据库代理 — 架构决策、代码审查、高智商推理
- 前端 UI/UX 工程师 — 视觉设计和实现
- 文档编写者 — 技术文档

[![image](https://linux.do/uploads/default/optimized/4X/3/c/8/3c81c5e4d3ee598b80ed5f6b44d1d5856c5db990_2_587x500.jpeg)](https://linux.do/uploads/default/original/4X/3/c/8/3c81c5e4d3ee598b80ed5f6b44d1d5856c5db990.jpeg)

### [2. 分析 PPT 内容](https://linux.do/t/topic/1489177#p-12838904-h-2-ppt-12)

接着，把工作模式切换成 Planner-Sisyphus—— 这是 OpenCode 的**计划只读模式** ，专门用于自我演进、迭代优化和处理高复杂度任务的规划模式。

然后通过 @ 符号引用 PPT 文案的 md 文件，在输入框输入：

&#96;&#96;&#96;
请作为一名资深 PPT 设计师，帮我处理这份文档： 

1. **拆解**：提炼文档精华，产出结构化的 PPT 页面清单（包含页数、内容、重点）。 

2. **渲染**：利用 SVG 矢量代码输出每一页的视觉雏形。要求：图文分离、层级分明，代码需兼容 PPT 的&quot;转换为形状&quot;功能，以便我进行后期可编辑式的二次调整。  

基于这些诉求，给出方案。
&#96;&#96;&#96;

这一步其实不需要什么精妙的提示词。项目初期，每次对话更多是**想法碰撞和方案定位** ，不是一开始就用提示词框死大模型的想象空间。

直接在 Plan 模式下抛出核心诉求：一是 拆解，二是 渲染。然后让大模型输出方案，根据提示不断调整方向，最终达到效果即可。

**只要能出满意的效果，那这个提示词就是合理且有效的。**

[![image](https://linux.do/uploads/default/optimized/4X/4/1/8/418a5f755dd67517c5f6373c3b0cdb0c2f21e68f_2_575x500.jpeg)](https://linux.do/uploads/default/original/4X/4/1/8/418a5f755dd67517c5f6373c3b0cdb0c2f21e68f.jpeg)

按这个思路，大模型输出的方案大概率包括：

- 拆解后每页 PPT 的内容（标题、内容、重点…）
- PPT 输出模式确认（分页生成 / 全部生成）
- 设计规范确认（尺寸、配色、字体、风格…）
- SVG 输出格式要求（代码规范、组件规范…）

如果觉得拆解不合适，可以在 Planner 模式下持续对话，不断提要求，直到满意为止。

[![image](https://linux.do/uploads/default/optimized/4X/6/f/d/6fd98f9844d44b1cca20f44d3e7313d07887c0aa_2_575x500.jpeg)](https://linux.do/uploads/default/original/4X/6/f/d/6fd98f9844d44b1cca20f44d3e7313d07887c0aa.jpeg)

### [3. PPT 风格确认](https://linux.do/t/topic/1489177#p-12838904-h-3-ppt-13)

这一步，建议只给定 尺寸要求、配色要求、主题色要求，剩下的布局排列和组件样式，推荐先让大模型自由发挥 —— 体验一下抽盲盒的快乐。

可以参考我的输入试试，这里的配色是直接从公司 PPT 模板里扣的，大伙儿可以替换成自己的要求：

&#96;&#96;&#96;
尺寸要求：16:9
主题风格：浅色风格
配色要求：
| 颜色用途 | RGB 值 | 说明 |
|---------|--------|------|
| 主色 | &#96;rgb(1,107,255)&#96; | 品牌蓝 |
| 次色 | &#96;rgb(86,91,255)&#96; | 紫蓝 |
| 辅助色 | &#96;rgb(46,204,247)&#96; | 青蓝 |
| 背景色 | &#96;rgb(246,246,246)&#96; | 浅灰 |
| 文字色 | &#96;rgb(0,0,0)&#96; | 黑色 |

&#96;&#96;&#96;

先让大模型输出前三页看看效果。下面是第二、三页的效果 —— 会发现实在太寡淡、太平面化了，不是不能用，就是一眼看上去没有记忆点。

[![image](https://linux.do/uploads/default/optimized/4X/6/e/c/6ec674fdbafeec78ee30781fcbeb98216adf4002_2_690x288.jpeg)](https://linux.do/uploads/default/original/4X/6/e/c/6ec674fdbafeec78ee30781fcbeb98216adf4002.jpeg)

这时我想到：**好的 PPT 绝不是套用模板，而是要根据内容进行「适配性设计」，才能真正突出重点、制造记忆点。**

既然如此，能不能让大模型先理解文本，由它来构思最契合的风格和布局方案？

于是直接输入了一个简单的要求：

基于这篇文章的内容，和品牌配色，还可以有怎样的风格和布局推荐？

结果很 amazing！

OpenCode 内置的 Agent 能力非常强大 —— 不仅分析出这篇文章的主题与「成长」「身份重塑」「行为心理学」「自我发展」等关键词相关，还会根据这些关键词在网上搜索相关的 PPT 设计方案，最终给出一个非常详细的每页风格推荐。

[![image](https://linux.do/uploads/default/optimized/4X/e/4/4/e44d48d80a2d018211064cbf5dfeb7f4e21bf4f9_2_423x500.jpeg)](https://linux.do/uploads/default/original/4X/e/4/4/e44d48d80a2d018211064cbf5dfeb7f4e21bf4f9.jpeg)

根据新的设计方案，第三页推荐使用「冰山隐喻」风格，效果如下 —— 确实比第一版好太多了！

接着，只需要根据设计方案，对剩下的页面做批量生成即可。

[![image](https://linux.do/uploads/default/optimized/4X/2/5/2/252321faa54fdac374c3b78c26e3fd4b3329c020_2_690x364.jpeg)](https://linux.do/uploads/default/original/4X/2/5/2/252321faa54fdac374c3b78c26e3fd4b3329c020.jpeg)

### [4. PPT 内容编辑](https://linux.do/t/topic/1489177#p-12838904-h-4-ppt-14)

SVG 批量生成后，难免有些文本内容或布局效果不符合预期。怎么办？

最简单的办法：直接在对话框描述问题，还可以通过**截图标注** 辅助说明需要调整的地方。

如果只是文本内容的问题，也可以用 VSCode 打开 SVG 文件，直接手动改。

[![image](https://linux.do/uploads/default/optimized/4X/d/a/8/da85470c11137762f05900438cfc44ecce1e0f5f_2_690x475.jpeg)](https://linux.do/uploads/default/original/4X/d/a/8/da85470c11137762f05900438cfc44ecce1e0f5f.jpeg)

### [5. PPT 文件导入](https://linux.do/t/topic/1489177#p-12838904-h-5-ppt-15)

最后一步。

检查所有 SVG 效果图都满足要求后，把 SVG 文件导入 PPT，点击「转换为形状」，就能把 SVG 一键转成 PPT 支持的组件样式，对所有元素进行编辑和调整。

这样再也不用担心大模型生成的 PPT 是一次性的 —— 上下文丢了，都不知道怎么改。

具体的导入和转化操作可以参考我往期的内容：

    
  
    
    ![](https://linux.do/user_avatar/linux.do/vigorxu/48/102317_2.png)
    
      [![+1](https://linux.do/images/emoji/twitter/+1.png#61;15) 分享一个非常实用的 AI 小技巧，如何快速给 PPT 绘制效果图](https://linux.do/t/topic/610874) [搞七捻三](https://linux.do/c/gossip/11)
    
  

  
&gt; 亲测，分享一个非常实用的 AI 小技巧，如何快速给 PPT 绘制效果图，以流程图为例： 
&gt; 
&gt; 准备好流程的步骤说明；
&gt; 提示词让 AI 将文字内容转换成效果图，输出为 svg 格式；
&gt; 将效果图下载为 svg 格式；
&gt; PPT 中导入 svg 图片；
&gt; 右键导入的图片，选择 “转换为形状”，这样效果图中的所有元素和文字都可以二次编辑了。
&gt; 
&gt; 提示词示例如下，按照个人喜好手搓的，大伙儿可以随意调整，亲测 Claude 3.7 的效果最好，比…

[![image](https://linux.do/uploads/default/optimized/4X/7/8/0/780e9c5501ddb011262cbeb0673972c7b6b69f6c_2_690x392.jpeg)](https://linux.do/uploads/default/original/4X/7/8/0/780e9c5501ddb011262cbeb0673972c7b6b69f6c.jpeg)

实际操作中，转化后的效果还是会遇到不少问题：字号错乱、布局偏移、组件变形…

这里简单总结了一些优化方案，只需要在输出 SVG 前，把要求全部告知大模型即可：

&#96;&#96;&#96;
1️⃣ **圆角矩形优化**：使用 &#96;&lt;path&gt;&#96; + 贝塞尔曲线 &#96;C&#96; 命令绘制，避免 &#96;&lt;rect rx&#61;&quot;24&quot;&gt;&#96; 在 PPT 中丢失圆角

2️⃣ **字体优化**：Windows 字体优先排列 &#96;Microsoft YaHei, SimHei, PingFang SC, sans-serif&#96;，避免 PingFang SC 在 Windows 上不存在导致布局变化

3️⃣ **文字定位优化**：使用 &#96;style&#96; 属性整合样式，手动计算居中位置，避免 &#96;text-anchor&#96; 和 &#96;dominant-baseline&#96; 属性支持不完善

4️⃣ **颜色格式优化**：使用 &#96;#RRGGBB&#96; + &#96;fill-opacity&#96; 分离透明度，避免 &#96;rgba()&#96; 和带透明度的十六进制颜色支持不佳

5️⃣ **阴影效果**：移除 &#96;filter&#61;&quot;drop-shadow(...)&quot;&#96; 属性，在 PPT 中转换后手动添加阴影
&#96;&#96;&#96;

## [后续优化](https://linux.do/t/topic/1489177#p-12838904-h-16)

这一套操作下来，熟悉大模型的伙伴可能会觉得：就这？连 MCP 和 Skills 都没用上，没啥新意。

但对于一些小白 —— 比如连 OpenCode 或终端是什么都不知道的小伙伴 —— 操作过程中还是会遇到不少问题的。

不过我觉得，AI 时代，只要能说得清楚、有明确报错信息的问题，丢给 AI 都能解决。所以还是希望能引导更多人去动手试试看。

后续计划研究一下 Skills，正好扣子 skills 不是也出了吗，打算把这些流程固化进去，尽可能实现**一次生成就能满足效果** 的情况。

## [最后](https://linux.do/t/topic/1489177#p-12838904-h-17)

PPT 这件事，难的从来不是内容，而是怎么让内容被看见。

现在有了 OpenCode + SVG 这条路，至少「呈现」这一步，可以交给 AI 先跑一版了。

剩下的，就是你来把控方向。

有问题欢迎留言，一起交流 ![:backhand_index_pointing_down:](https://linux.do/images/emoji/twitter/backhand_index_pointing_down.png#61;15)
