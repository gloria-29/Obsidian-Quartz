---
标题: Claude Skills 入门
笔记 ID: 019bab39-53d5-7cd4-8b91-7e4a05797664
笔记类型: crawl
tags:
    - 工作
卡片盒:
    - 生活
包含语音: 否
网页链接:
创建时间: "2026-01-11T12:03:39.607"
更新时间: "2026-03-11T20:45:31.691"
---

![](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019bab39-2e77-7c4f-8c31-bd9464215ff1.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260111%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260111T040334Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;d995ed9f19e3bcdbd6279c652fe56b327c325713ca445f2ff4252266cbbb594a&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

**Wang Shuyi** (@wshuyi)

[Wang Shuyi](/wshuyi)

[@wshuyi](/wshuyi)

![图像](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019bab39-2de7-7c92-91fe-df9c12d4bb1e.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260111%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260111T040332Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;722d46ea8e93e982534cd2bbdc967a63f7f463e49c542b8b436e8faff8899cdb&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

Claude Skills 入门：一篇文章搞懂 AI 怎么从「嘴替」升级成「打工人」

51

307

981

[26万](/wshuyi/status/2009451186039214388/analytics)

你有没有这种感觉 ——AI 领域的新名词，比手机型号更新还快？

昨天刚搞懂「函数调用」(Function Calling) 是怎么回事，今天又冒出来个「Skills」。前天有人跟你说「MCP」，你还没反应过来，后天又有人聊「Agent」。每次看到这些词，第一反应都是：我是不是又落伍了？

别慌。今天咱们把「Claude Skills」这事儿掰开揉碎了讲清楚。

更重要的是，我会告诉你它跟你已经知道的那些概念 —— 函数、函数调用 —— 到底是什么关系。你会发现，这不是三个孤立的新词，而是一层一层往上搭的台阶。搞懂这三层，以后再出什么新词，你也能自己判断它在哪一层。

## 起点

咱们从最熟悉的东西开始：编程里的「函数」。

你可以把函数理解成一个「小助手」。你告诉它要做什么（给它一个输入），它帮你做完后告诉你结果（给你一个输出）。就像餐厅里的服务员：你点菜，他端菜，每次都按照固定流程来。

举个例子，程序员写一个叫 \&#96;calculate\_tax (income)\&#96; 的函数。你把收入数字扔进去，它把该交多少税算出来还给你。下次还要算？再调用一遍就行。不用每次都重写一遍算税的逻辑。

函数的价值，说白了就三个字：**封装、重用、标准化**。

把一件事情的做法「打包」起来，以后谁都能用，每次用的方式都一样。这是程序员几十年来最基本的生产力工具。

![图像](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019bab39-2d96-7ceb-86d8-c170828b5f0c.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260111%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260111T040332Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;e6ca8ae327fa4261af7d0643a53f9a5621c1489176db044337e26ad860d9b4ad&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

但函数有个局限 —— 它只活在代码世界里。

程序员在代码里写 \&#96;getWeather()\&#96;，这个函数 100% 会被执行。可是普通人不会写代码，AI 也不会直接「运行」这些代码。那怎么让 AI 也能用上这些「小助手」呢？

## 架桥

2023 年前后，一个叫「函数调用」（Function Calling）的概念火了起来。

你可以把它理解成：给那个「只会聊天的 AI」配了一部电话和一本通讯录。

以前的 AI，你问它「今天北京天气怎么样」，它要么从训练数据里瞎猜一个，要么老老实实说「我不知道」。因为它没有「手脚」，不能真的去查天气。

有了函数调用之后，情况变了。

开发者事先告诉 AI：「这是一本通讯录，里面有个叫 \&#96;get\_weather\&#96; 的函数，你想查天气就打这个电话。」AI 收到「今天北京天气怎么样」的问题后，它会自己判断：「哦，这个问题我得打电话给 \&#96;get\_weather\&#96; 才能回答。」

然后它生成一段标准格式的「便签」（叫 JSON），上面写着：

&gt; { &quot;function&quot;: &quot;get\_weather&quot;, &quot;arguments&quot;: { &quot;city&quot;: &quot;北京&quot; } }

这段便签被外部程序接收、解析、执行。真正打电话给气象台的，是外部程序，不是 AI 自己。执行完后，结果返回给 AI，AI 再用人话告诉你：「北京今天晴，15 度。」

**这里有个关键的转折，初学者容易忽略。**

传统函数是「确定性」的——程序员在代码里写了 \&#96;getWeather()\&#96;，100% 会执行。

但 LLM 的函数调用是「概率性」的——AI 看到「今天天气怎么样」，它要**自己判断**该不该调用天气函数。这个判断是基于理解，不是基于规则。有小概率它会判断错误，比如把「天气」理解成某个人名。

所以说，函数调用的本质是：**让 AI 能「打电话」，但打不打、打给谁，它自己决定。**

这是一个巨大的进步 ——AI 不再只是「知识库」，它开始变成「行动者」。

![图像](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019bab39-2e13-7428-957a-a13e905d119c.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260111%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260111T040331Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;f10666b67e755678c043b62370dde1d4d53cab0d2c690c482185ac43331d5972&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

但函数调用还有个问题：它是零散的、一次性的。

你给 AI 配了十几个函数，它每次只能选一个打电话。如果一个任务需要连续调用五六个函数、中间还有逻辑判断、还需要参考一些文档，函数调用就不够用了。

## 跃升

2025 年 10 月 16 日，Anthropic 发布了一个新功能：

[Claude Skills](https://support.anthropic.com/en/articles/12512176-what-are-skills)

。

你可以把 Skills 理解成「员工手册」+「工具箱」的组合。

员工手册告诉 AI：「当你遇到某类任务时，应该怎么做，分几步，每一步用什么工具。」工具箱里装着它需要用的脚本和参考资料。

具体来说，一个 Skill 就是一个文件夹，里面有三样东西：

**第一，**

[**SKILL.md**](//SKILL.md)

** 文件**。这是「指令」，用自然语言写的。告诉 AI：这个 Skill 是干什么的，什么情况下该用，怎么用，有什么注意事项。

**第二，脚本**。可以是 Python、JavaScript 或者其他语言写的代码。当 AI 需要「动手」的时候，就执行这些脚本。

**第三，资源文件**。比如参考文档、模板、配置文件。AI 在执行任务的时候可以查阅这些资料。

你可能会问：这跟函数调用有什么本质区别？

区别在于：**函数调用是「单个工具」，Skills 是「整套解决方案」​**。

打个比方。函数调用像是给你一把锤子、一把螺丝刀、一把扳手，你得自己知道什么时候用哪个。Skills 像是给你一本《如何组装宜家书柜》的说明书，说明书里不仅告诉你步骤，还附上了所有需要的工具和零件。

还有一个重要的机制叫「渐进式披露」。

AI 的「工作记忆」是有限的（技术上叫「上下文窗口」）。如果你把所有 Skills 的内容一股脑塞进去，AI 会被信息淹没。

Skills 的做法是：平时只告诉 AI「有这么一本说明书」，AI 真正需要的时候再去翻。就像你不用把整本百科全书背下来，遇到问题再查相关那一页就行。

![图像](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019bab39-2def-7489-a80b-becbc0f8b3b5.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260111%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260111T040331Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;aaf1d460e70143abe278862a45181a6f72227a3a59b640511cbbf5ab7a183a7b&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

现在，咱们把三层放在一起看：

![图像](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019bab39-2e12-7baf-ba3d-74ce29b5c524.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260111%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260111T040331Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;a62190d261d7a71782dc186b665257d09131c85b41f26ceb6ea1bbb7421b6cec&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

从下往上看，抽象层次越来越高。函数是代码级的，函数调用是接口级的，Skills 是工作流级的。

**Skills 可以包含函数调用，但函数调用只是 Skills 的一部分。**

就像一本菜谱不只是「切菜」「炒菜」「装盘」这几个动作的罗列，它还包括「为什么要这样做」「火候怎么掌握」「如果烧焦了怎么补救」这些知识。

## 实战

说了这么多概念，Skills 到底能干什么？咱们看几个真实案例。

**先说一个我自己的项目：**

[**x-article-publisher-skill**](https://github.com/wshuyi/x-article-publisher-skill)

**。**

![图像](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019bab39-2e90-76ea-90ed-a7e566398245.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260111%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260111T040333Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;fc535466810288b606f45abbe83de35f321671eff960edfda1b3d5da27f11fc2&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

如果你用 Markdown 写文章，然后想发布到 X（Twitter）的 Articles 功能里，你会遇到一个极其崩溃的问题：复制粘贴过去，格式全丢了。

标题变普通文字，粗体变普通文字，链接变普通文字。你得手动一个一个加回来。一篇文章，光是调格式就要花 15-20 分钟。

更要命的是图片。你得手动上传每一张，然后把它拖到正确的位置。如果文章有十几张图，你很容易搞错顺序。

这个 Skill 怎么解决的呢？

它会先解析你的 Markdown 文件，提取标题、封面图，并且给每张内容图片计算一个「块索引」（block\_index）—— 就是这张图应该出现在文章的第几个段落之后。

然后，它把 Markdown 转成富文本 HTML，通过剪贴板粘贴到 X 编辑器里。格式完美保留。

最后，它用浏览器自动化（Playwright）把每张图片精准插入到正确的位置。

原本 20-30 分钟的手动操作，现在几分钟内**全自动搞定**。减少时长自不必说。**对懒人而言，能全程不用自己再动手，才是最主要的嘛。**

你可能会说：这不就是写了个自动化脚本吗？

是，也不是。

单纯的自动化脚本，你得自己记住什么时候用、怎么用、参数怎么填。但 Skill 把「什么时候用」「怎么用」都写进了指令里。你只需要跟 AI 说一句「把这篇文章发到 X」，它就知道该调用这个 Skill，该怎么操作。

**这就是「知识编码」的价值——把「我知道怎么做」变成「AI 也知道怎么做」。**

再看几个企业场景。

**会议管理**：有个 Skill 能自动从会议记录里提取摘要、决策和行动项，然后起草跟进邮件。开完会不用再花半小时整理笔记。

**数据分析**：扔给它一个 CSV 文件，它能自动识别关键指标、找出异常值，生成图文并茂的报告。非技术人员也能快速从数据里挖出洞察。

**客户支持**：它从公司知识库里检索准确答案，再用人性化的语言组织成回复。既保证准确，又不失温度。

这些场景有个共同点：**都是重复性高、步骤固定、但又需要一定判断力的任务**。以前，要么靠人硬扛，要么花大价钱开发专门的软件。现在，一个 Skill 就能搞定。

**最后说说开发者工具。**

有个叫 \&#96;skill-creator\&#96; 的 Skill，特别有意思 —— 它是用来创建 Skill 的 Skill。

![图像](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019bab39-2e89-7987-8054-995f2f54c923.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260111%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260111T040332Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;d6dcebeb688ba298324afe627dcb579cca6279e10d659f21da026df7ab916e99&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

你跟它聊天，告诉它你想实现什么工作流，它会帮你生成一个完整的 Skill 项目框架。这就是所谓的「元技能」。

还有 \&#96;webapp-testing\&#96;，能根据测试用例自动操作浏览器，对 Web 应用进行功能测试，然后生成测试报告。前端测试流程部分自动化了。

## 动手

说了这么多，怎么开始用 Skills？

**如果你想用现成的 Skills**，最简单的方式是通过 Claude Code 的插件市场。

默认初始自动安装的只是 Claude 官方的插件市场。

![图像](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019bab39-2eab-7cb9-8ed2-e671d7307dff.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260111%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260111T040333Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;f6519f8548481a0f2c72fc32b9489787da8a546c2b183c7c9f0b86542d525453&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

你也可以根据自己的需求，添加其他插件市场。格式例如：

&gt; /plugin marketplace add anthropics/claude-code

![图像](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019bab39-2e72-775f-ae14-6ccb6c65003d.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260111%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260111T040332Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;c3e3ab1da1a1ed23661715d75dacdf37963aff0b86339bda669892b5b78e1efd&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

安装之后，你这里就有两个插件市场了。

![图像](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019bab39-2e5a-795e-a15b-60844d99e513.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260111%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260111T040332Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;148972b376e3ab030db4779b5596ceeddab65bd4f6fd59b0fe50f36a5ea41fb8&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

你看到了，利用 \&#96;/plugin\&#96; 命令，可以添加、管理插件。

这是我目前已经安装的部分插件。

![图像](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019bab39-2f38-7f89-9cbb-5deec2d6da2b.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260111%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260111T040333Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;35e3a4bfc7cc00345841a61133848b89e7b794ef5233cd4f98baaa9b6d4c2444&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

装完之后，你可以让 Claude 用某个 Skill 来完成任务。比如：「用 PDF Skill 提取这份文件里的表格数据。」

**如果你想自己创建 Skills**，可以用 \&#96;skill-creator\&#96; 这个元技能。跟它对话，描述你的工作流，它会帮你生成框架。

你可以编写 Claude Skill，让它帮助你去分析材料、自动调研，并且绘制出对应的结构图。

例如这是红楼梦人物关系图。

![图像](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019bab39-2f4f-7fe8-b9dc-e7fa9850f45a.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260111%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260111T040334Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;ba7c3573ea6a522cf5348d022d1ebd9b7a484bfee13c0d23b84e51bd7e36e6d7&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

下面是战国七雄的互动。

![图像](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019bab39-2f39-7545-acbb-a7293f39dd86.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260111%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260111T040334Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;5e8c9a51606d04a37e1f9ced27e69130b561263cc75718dd095385d8db07f397&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

使用方式可以

[参考我这篇文章](https://mp.weixin.qq.com/s/edyLjMcarzIrjRi3vsuCPQ)

。

更高级的玩法是用 Claude Skills 连接一些非常好的外部工具，例如 NotebookLM 作为知识库使用。这样你就可以把 NotebookLM 强大的检索和知识验证功能，与你自己的创意以及其他模型工具的特点有机地结合在一起。

![图像](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019bab39-2f52-70ed-89db-96dd80dcd109.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260111%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260111T040334Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;66e9e44d052953a98b7350674debf48b72a3388b538a0ae210c16c796445b10c&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

我在

[这篇文章当中有详细的介绍。](https://mp.weixin.qq.com/s/lrAeILr8qAJjrMXmnK339g)

想看看别人做了什么 Skills？去 GitHub 搜

[awesome-claude-skills](https://github.com/travisvn/awesome-claude-skills)

，那里有社区整理的优秀 Skill 清单。

![图像](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019bab39-2f52-70ed-89db-96dcd3970545.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260111%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260111T040335Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;773a903d7be4073403e12c0bbab09e8ffe7f7f4cb6732550decda6dd4c2e9fca&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

我个人比较推荐的是活水智能（也就是阳志平老师团队）做的

[插件市场 42plugin](https://42plugin.com/)

。

![图像](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019bab39-3042-78ec-a4ec-3ff4f9111a18.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260111%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260111T040335Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;4d2e8d34e5648f26d76690a57b12174690895b4f57690d0e0839740fa1e09951&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

这里不仅整理了很多的插件，而且还有相应的评级评分，更可以保证避免踩坑。

![图像](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019bab39-3047-73b2-828b-68d27b7232cc.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260111%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260111T040337Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;407653aa70eca28e02ae2297b2ed0734eae3700f67e3d2fc6b5da4934c1187b6&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

最重要的一点：**创建 Skill 不一定需要会写代码。**

[SKILL.md](//SKILL.md)

里的指令是自然语言写的。如果你的工作流不涉及复杂的脚本，光靠自然语言指令就能完成很多事情。

正如 Claire Vo 在

[Lenny&#39;s Newsletter](https://www.lennysnewsletter.com/p/claude-skills-explained)

里说的：即使是非程序员，也可以通过清晰地定义工作流，创建出强大的、可复用的 AI 工作流。

![图像](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019bab39-3041-7a98-82f0-a14e0d9e81c3.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260111%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260111T040334Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;4657f9060bf0da005e4239293baa0645ad08844f0363e826cb05d0d71eef35ea&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

## 小结

现在咱们回头看这三层台阶：

- **编程函数**是基石。它提供了最基础、最可靠的逻辑执行单元。
- **LLM 函数调用**是桥梁。它让 AI 不再只是「知识库」，而是能「打电话」驱动外部世界的行动者。
- **Claude Skills**是蓝图。它把零散的工具和指令整合成完整的工作流，让 AI 能更可靠、更专业地完成复杂任务。

这三层会越来越融合。开发者继续写高效的函数作为底层工具；通过函数调用把工具暴露给 AI；再用 Skills 指导 AI 怎么智能地使用这些工具。

**真正的力量在于：它让「领域专家」也能「教」AI。**

你不需要是程序员，只需要清楚自己的工作流程是什么，就能把这些知识打包成一个 Skill。你的专业知识不再只存在于你脑子里，它变成了 AI 可以调用的能力。

对了，就在我写这篇文章的时候（2026 年 1 月 8 日），Claude Code 又发布了一次重大更新。Skills 现在支持隔离上下文、热重载、指定模型、在子代理中使用……

[Plugin Marketplace](https://code.claude.com/docs/en/discover-plugins)

也正式上线了。

![图像](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019bab39-3048-722a-97f8-a6d835915fad.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260111%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260111T040335Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;20732986d5b733f26a1a70ea1e210aaa476fc2e6ad87fddbfc1a6eeaf21f52b1&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

Anthropic 还把 Agent Skills 规范作为

[开放标准](https://aibusiness.com/foundation-models/anthropic-launches-skills-open-standard-claude)

发布 —— 这跟他们之前推 MCP（Model Context Protocol）的路数一样，都是走开放生态路线。

Gartner 的分析师说，这标志着 AI 市场的焦点正在从「模型更新」转向「用例落地」。

翻译成人话就是：大家不再只比谁的模型更聪明，而是开始比谁能把 AI 用得更好。

Skills 是这场转变的核心载体。它让 AI 从「应答者」变成了「协作者」。

下次再有人跟你说什么关于 Agent 功能的新词，你就问自己：它是在哪一层？是代码级的工具，是接口级的桥梁，还是工作流级的蓝图？

想清楚这个，新词就不再可怕了。

你有没有尝试过 Claude Skills？有没有自己制作符合你自己工作流的 Claude Skill？

欢迎分享在留言区，咱们一起交流讨论。

## 延伸阅读

- [品味还是技能？ChatGPT 引发的能力培养变革](https://mp.weixin.qq.com/s/cSysHNhu24H8dUpKk9XxQg)
- [AI 时代的真稀缺技能：从「有技术」到「会洞察」](https://mp.weixin.qq.com/s/xEAWepdqRlq2kG6-rEtzbQ)
- [如何用 Claude Skill 帮你一句话做深度调研并自动画图？](https://mp.weixin.qq.com/s/edyLjMcarzIrjRi3vsuCPQ)
- [从枯燥理论到生动实践：AI 智能代理如何用交互式教程讲解复杂概念](https://mp.weixin.qq.com/s/9o2xEsAClOnrn2GhuBryBA)
- [新学期，给你自己配一个好用的 AI 助手吧。会思考，能联网，还有知识库那种](https://mp.weixin.qq.com/s/1Ce7TKTIju8GEHMbSmUIBA)

想发布自己的文章？

[升级为 Premium](/i/premium_sign_up)

[上午10:24 · 2026年1月9日](/wshuyi/status/2009451186039214388)

·

26.4万

查看

51

307

981

1,721

&gt; 来自：[https://x.com/wshuyi/status/2009451186039214388](https://x.com/wshuyi/status/2009451186039214388)
