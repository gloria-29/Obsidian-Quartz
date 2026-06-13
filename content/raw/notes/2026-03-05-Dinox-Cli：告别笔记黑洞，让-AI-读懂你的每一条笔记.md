---
标题: Dinox-Cli：告别笔记黑洞，让 AI 读懂你的每一条笔记
笔记 ID: 019cbd34-780a-730c-9db5-5f3659652d99
笔记类型: crawl
tags:
    - 生活/电子工具
卡片盒:
    - 生活
包含语音: 否
网页链接:
创建时间: "2026-03-05T16:54:18.380"
更新时间: "2026-03-09T20:05:37.899"
---

![](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019cbd34-6b13-7c9e-ba0d-d0a31be28114.jpeg)

  


![](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019cbd34-6c0c-7a0f-92fe-6313b2e9da90.png)

  


# **告别笔记黑洞：让 AI 读懂你的每一条笔记**

## **一个真实的困境**

你有多少条笔记？

100 条？500 条？还是已经多到自己都不记得？

更扎心的问题是：**你还能找到它们吗？**

- 灵感来了，随手记在备忘录，事后找不到
- 读书笔记散落在微信收藏、印象笔记、Notion...
- 想找&quot;上个月看的那篇关于时间管理的文章&quot;，翻了半天放弃
- 待办事项写了一堆，完成了哪些？忘了

**笔记越多，越像一个黑洞。**

如果我告诉你，有一个工具可以让你：

- 用说话的方式管理笔记
- AI 自动帮你分类、打标签
- 秒速找到任何一条笔记
- 待办事项自动追踪

你会试试吗？

这就是 **Dinox CLI** 的魔法。

## **Dinox CLI 是什么？**

简单说，它是一个**命令行笔记工具**。

但别被&quot;命令行&quot;三个字吓到。你不需要是程序员，也不需要懂技术。

**Dinox CLI 的核心理念：**

基于 **Zettelkasten（卡片盒笔记法）**——诺贝尔奖得主、社会学家卢曼用了一辈子的方法。他用这套方法写了 70 本书、400 多篇论文。

每条笔记都是一张独立的卡片，通过标签和盒子组织，形成你的**第二大脑**。

**核心功能：**

- :memo: **笔记管理**：创建、搜索、更新、删除
- :label: **标签系统**：支持层级标签，比如 &#96;阅读/心理学/认知偏差&#96;
- :package: **卡片盒分类**：Inbox（收件箱）、Project（项目）、Archive（归档）...
- :check_mark_button: **待办管理**：笔记里的 todo 自动识别，可搜索、更新状态
- :arrows_counterclockwise: **云端同步**：数据安全存储，多设备访问
- :robot: **AI 友好**：配合 AI 工具，自然语言操作

## **但是，命令行不是很难吗？**

这是大多数人的第一反应。

确实，传统的命令行工具长这样：

&#96;&#96;&#96;plaintext
dino note create --title &quot;读书笔记&quot; --content &quot;今天读了《思考，快与慢》第三章...&quot; --tags &quot;阅读,心理学&quot; --zettel_boxes &quot;Inbox&quot;

&#96;&#96;&#96;

看着就头疼。

**但如果有 AI 帮你呢？**

你只需要说：

&#96;&#96;&#96;plaintext
帮我记一条笔记：今天读了《思考，快与慢》第三章，讲的是认知偏差

&#96;&#96;&#96;

AI 会自动：

1. 理解你的意图
2. 生成合适的标题
3. 添加相关标签（阅读、心理学）
4. 调用 &#96;dino&#96; 命令
5. 保存笔记

**你不需要记任何命令。**

这就是 **Dinox CLI Skills** 的作用——让 AI 成为你和工具之间的翻译官。

## **配合什么 AI 工具使用？**

Dinox CLI Skills 可以配合多种 AI 工具使用：

### **1. Claude Code**

**Claude Code** 是 Anthropic 推出的官方 CLI 工具，让你可以在终端中直接与 Claude AI 对话。

**适合人群：**

- 程序员、开发者
- 喜欢键盘操作的效率党
- 需要在编码时快速记录想法的人

**特点：**

- 可以读写文件、执行命令
- 支持 Skills 扩展
- 完全在终端中操作

### **2. OpenClaw**

**OpenClaw** 是一个开源的个人 AI 助手，在本地运行，通过你喜欢的聊天应用操作（WhatsApp、Telegram、Discord、Slack 等）。

**适合人群：**

- 注重隐私，希望数据留在本地的用户
- 需要跨多个聊天平台使用的人
- 想要高度可定制的 AI 助手

**特点：**

- 本地运行，数据完全掌控
- 通过聊天应用自然交互
- 持久记忆，学习你的偏好
- 集成 50+ 服务（Gmail、GitHub、Spotify、Obsidian 等）
- 支持多种 AI 模型（Claude、GPT、本地模型）

官网：https://openclaw.ai/**[1]**

### **3. Cursor / Windsurf 等 AI 编辑器**

通过 **MCP Server**（Model Context Protocol），Dinox CLI 可以连接到 Cursor、Windsurf 等 AI 编辑器。

**适合人群：**

- 使用 AI 编辑器写代码的开发者
- 希望在编辑器内管理笔记的人

### **4. 其他支持 MCP 的工具**

只要支持 MCP 协议，都可以连接 Dinox CLI。

**核心思想：工具只是载体，重点是 Dinox CLI 本身的能力。**

## **为什么选择 CLI 方式？**

你可能会问：既然有 MCP Server、API 接口这些方式，为什么还要用 CLI？

让我们对比一下：

### **CLI vs MCP Server vs API 接口**


| **对比维度**     | **CLI 直接调用**             | **MCP Server**                       | **API 接口**                                       |
| ------------ | ------------------------ | ------------------------------------ | ------------------------------------------------ |
| **响应速度**     | :high_voltage:️ 最快（本地执行） | :arrows_counterclockwise: 中等（需要网络通信） | :snail: 较慢（远程调用）                                 |
| **Token 消耗** | :moneybag: 最省（只传必要数据）    | :money_with_wings: 中等                | :money_with_wings::money_with_wings: 较多（需要完整上下文） |
| **上下文利用**    | :bullseye: 最高（直接访问本地数据）  | :bar_chart: 中等                       | :chart_decreasing: 较低（受限于传输）                     |
| **数据隐私**     | :lock: 最安全（数据不出本地）       | :closed_lock_with_key: 较安全（本地服务）     | :warning: 需要网络传输                                 |
| **离线使用**     | :check_mark_button: 完全支持 | :check_mark_button: 支持（本地服务）         | :cross_mark: 需要网络                                |


### **具体优势**

**1. 上下文利用率更高**

CLI 可以直接访问本地 SQLite 数据库，无需通过网络传输。这意味着：

- 可以快速检索大量笔记
- 支持复杂的 SQL 查询
- 不受网络带宽限制

**2. 数据处理更快**

本地执行，没有网络延迟：

- 搜索 1000 条笔记：CLI &lt; 100ms，API 可能需要几秒
- 批量更新标签：CLI 瞬间完成，API 需要多次请求

**3. 更节省 Token**

CLI 只需要传输结果，不需要传输原始数据：

- 搜索笔记：只返回匹配结果，不是全部笔记
- 查看笔记：按需加载，不是一次性加载所有

**举个例子：**

假设你要搜索最近一周的笔记并总结：

- **API 方式**：需要先调用 API 获取所有笔记（消耗大量 token），再让 AI 分析
- **CLI 方式**：直接在本地筛选，只把结果传给 AI（节省 80% 以上的 token）

**4. 更灵活的组合**

CLI 可以和其他命令行工具无缝配合：

&#96;&#96;&#96;plaintext
# 导出笔记到文件
dino note search &quot;React&quot; --json &gt; react-notes.json

# 结合 jq 处理
dino note search &quot;React&quot; --json | jq &#39;.[] | .title&#39;

# 批量处理
cat note-ids.txt | xargs -I {} dino note get {}

&#96;&#96;&#96;

**结论：CLI 是效率和成本的最优解。**

## **真实场景演示**

### **场景 1：写作者 - 灵感捕捉**

你正在写文章，突然想到一个好句子。

**你说：**

&#96;&#96;&#96;plaintext
记一下：好的写作不是堆砌华丽的辞藻，而是用最简单的语言说清楚复杂的事

&#96;&#96;&#96;

**AI 帮你做：**

- 创建笔记
- 自动生成标题：&quot;写作技巧&quot;
- 添加标签：&#96;写作&#96;、&#96;金句&#96;
- 存入 Inbox

**耗时：3 秒**

### **场景 2：学生 - 读书笔记管理**

你读完一本书，想整理笔记。

**你说：**

&#96;&#96;&#96;plaintext
搜索所有关于《思考，快与慢》的笔记

&#96;&#96;&#96;

**AI 执行：**

&#96;&#96;&#96;plaintext
dino note search &quot;思考，快与慢&quot;

&#96;&#96;&#96;

**结果：**找到 8 条笔记，AI 还会帮你总结要点，甚至可以说：

&#96;&#96;&#96;plaintext
把这些笔记整理成一篇读书总结

&#96;&#96;&#96;

### **场景 3：职场人 - 待办事项管理**

你在笔记里随手记了几个待办：

&#96;&#96;&#96;plaintext
- [ ] 周五前完成季度报告
- [ ] 联系供应商确认报价
- [ ] 预约下周的会议室

&#96;&#96;&#96;

现在想看看有哪些未完成的任务。

**你说：**

&#96;&#96;&#96;plaintext
搜索所有未完成的待办

&#96;&#96;&#96;

**AI 执行：**

&#96;&#96;&#96;plaintext
dino todo search --status uncompleted

&#96;&#96;&#96;

完成一个任务后：

**你说：**

&#96;&#96;&#96;plaintext
把&quot;联系供应商&quot;标记为完成

&#96;&#96;&#96;

笔记里的 &#96;[ ]&#96; 自动变成 &#96;[x]&#96;。

### **场景 4：知识工作者 - 批量整理**

你有 20 条笔记忘了分类，想让 AI 帮你整理。

**你说：**

&#96;&#96;&#96;plaintext
帮我找出所有没有标签的笔记，根据内容自动添加合适的标签和卡片盒

&#96;&#96;&#96;

**AI 会：**

1. 搜索无标签笔记
2. 逐条分析内容
3. 建议标签和卡片盒
4. 批量更新

这就是 **AI + CLI 的威力：自动化重复劳动**。

### **场景 5：程序员 - 技术笔记沉淀**

你在写代码时记录了很多技术要点。

**你说：**

&#96;&#96;&#96;plaintext
搜索最近一个月关于 React 的笔记，帮我整理成一篇技术总结

&#96;&#96;&#96;

**AI 会：**

- 搜索相关笔记
- 分析内容
- 生成结构化总结
- 甚至可以直接保存为新笔记

## **快速上手**

### **方式一：最简单（推荐）**

如果你使用 Claude Code 或 OpenClaw，只需要把这两个链接发给 AI：

&#96;&#96;&#96;plaintext
帮我安装 Dinox CLI 和 Skills：
https://www.npmjs.com/package/@dinoxx/dinox-cli
https://github.com/ryzencool/dinox-cli-skills

&#96;&#96;&#96;

AI 会自动帮你：

1. 安装 Dinox CLI
2. 克隆 Skills 仓库
3. 配置好一切

**就这么简单！**

---

### **方式二：手动安装**

如果你想自己动手，可以按以下步骤操作：

### **第一步：安装 Dinox CLI**

**前提条件：**需要先安装 Node.js（建议 LTS 版本，&gt;&#61; 20）

检查是否已安装：

&#96;&#96;&#96;plaintext
node -v

&#96;&#96;&#96;

**安装 Dinox CLI：**

&#96;&#96;&#96;plaintext
npm install -g @dinoxx/dinox-cli

&#96;&#96;&#96;

验证安装：

&#96;&#96;&#96;plaintext
dino info

&#96;&#96;&#96;

### **第二步：登录并同步**

**获取 token：**

在 Dinox App 中：

1. 打开设置
2. 进入&quot;同步设置&quot;
3. 找到&quot;API Token&quot;
4. 复制 token

**登录：**

&#96;&#96;&#96;plaintext
dino auth login &quot;&lt;你的token&gt;&quot;
dino sync

&#96;&#96;&#96;

现在你已经可以直接使用 &#96;dino&#96; 命令了！

### **第三步：安装 Dinox CLI Skills（可选但推荐）**

如果你想用自然语言操作，需要安装 Skills。

**适用工具：Claude Code / OpenClaw**

**安装方法：**

&#96;&#96;&#96;plaintext
# 克隆 Skills 仓库
git clone https://github.com/shanks/dinox-cli-skills.git

# 在 Claude Code 中添加
claude --add-dir ./dinox-cli-skills

&#96;&#96;&#96;

**验证：**

启动 Claude Code：

&#96;&#96;&#96;plaintext
claude

&#96;&#96;&#96;

试试：

&#96;&#96;&#96;plaintext
/dino-auth status

&#96;&#96;&#96;

看到登录状态，说明配置成功！

### **第四步：配置 MCP Server（可选）**

如果你使用 Cursor、Windsurf 等 AI 编辑器，可以通过 MCP Server 连接。

**启动 MCP Server：**

&#96;&#96;&#96;plaintext
dino mcp serve

&#96;&#96;&#96;

默认监听 &#96;127.0.0.1:45137&#96;

**配置 Cursor：**

在 &#96;.cursor/mcp.json&#96; 或 &#96;~/.cursor/mcp.json&#96; 中添加：

&#96;&#96;&#96;plaintext
{
&quot;mcpServers&quot;:{
&quot;dinox&quot;:{
&quot;url&quot;:&quot;https://127.0.0.1:45137&quot;
}
}
}

&#96;&#96;&#96;

现在在 Cursor 里也能用自然语言管理笔记了！

## **Dinox CLI Skills 功能清单**

安装 Skills 后，你可以使用这些功能：


| **功能**     | **说明**       | **示例**                     |
| ---------- | ------------ | -------------------------- |
| **认证管理**   | 查看登录状态       | &#96;/dino-auth status&#96;        |
| **数据同步**   | 同步云端数据       | &#96;/dino-sync&#96;               |
| **搜索笔记**   | 按关键词/标签/时间搜索 | &#96;/dino-search-notes React&#96; |
| **创建笔记**   | 新建笔记         | &#96;/dino-create-note 今日总结&#96;   |
| **查看笔记**   | 查看笔记详情       | &#96;/dino-view-note &lt;id&gt;&#96;     |
| **更新笔记**   | 更新标签/卡片盒     | &#96;/dino-update-note &lt;id&gt;&#96;   |
| **删除笔记**   | 软删除笔记        | &#96;/dino-delete-note &lt;id&gt;&#96;   |
| **待办管理**   | 搜索/创建/更新待办   | &#96;/dino-manage-todo&#96;        |
| **标签管理**   | 列出/创建标签      | &#96;/dino-manage-tags&#96;        |
| **卡片盒管理**  | 列出/创建卡片盒     | &#96;/dino-manage-boxes&#96;       |
| **提示词模板**  | 管理可复用的提示词    | &#96;/dino-manage-prompts&#96;     |
| **更新 CLI** | 升级到最新版本      | &#96;/dino-update-cli&#96;         |


**重点：你不需要记这些命令。**

直接用自然语言说就行，AI 会自动选择合适的功能。

## **进阶玩法**

### **1. 自定义提示词模板**

创建可复用的提示词，提升效率。

**示例：周报助手**

&#96;&#96;&#96;plaintext
/dino-manage-prompts --name &quot;周报助手&quot; --cmd &quot;请基于本周笔记输出一份简洁周报&quot;

&#96;&#96;&#96;

下次直接说：

&#96;&#96;&#96;plaintext
用周报助手帮我生成本周周报

&#96;&#96;&#96;

**示例：读书总结**

&#96;&#96;&#96;plaintext
/dino-manage-prompts --name &quot;读书总结&quot; --cmd &quot;请将这本书的所有笔记整理成一篇读书总结&quot;

&#96;&#96;&#96;

### **2. 高级搜索技巧**

**按标签组合搜索：**

&#96;&#96;&#96;plaintext
搜索带有&quot;工作&quot;标签但不带&quot;已完成&quot;标签的笔记

&#96;&#96;&#96;

**按时间范围搜索：**

&#96;&#96;&#96;plaintext
搜索最近 7 天的笔记

&#96;&#96;&#96;

**按卡片盒搜索：**

&#96;&#96;&#96;plaintext
搜索 Inbox 里的所有笔记

&#96;&#96;&#96;

**SQL 风格搜索（高级用户）：**

&#96;&#96;&#96;plaintext
搜索类型是 crawl 且在 Inbox 或 Project 盒子里的笔记

&#96;&#96;&#96;

### **3. 日常工作流建议**

**晨间回顾（5 分钟）：**

&#96;&#96;&#96;plaintext
帮我看看昨天创建的所有笔记，总结一下要点

&#96;&#96;&#96;

**项目管理：**

&#96;&#96;&#96;plaintext
创建一个叫&quot;新项目&quot;的卡片盒，把所有带 project-x 标签的笔记移进去

&#96;&#96;&#96;

**知识沉淀（周末）：**

&#96;&#96;&#96;plaintext
搜索本周所有笔记，帮我整理成一篇周总结

&#96;&#96;&#96;

**待办清理：**

&#96;&#96;&#96;plaintext
搜索所有已完成的待办，帮我归档

&#96;&#96;&#96;

## **常见问题**

**Q: 我不是程序员，能用吗？**

A: 完全可以！Dinox CLI 本身是命令行工具，但配合 AI（Claude Code/OpenClaw 或 Cursor），你只需要用自然语言说话。不需要记命令，不需要懂技术。

**Q: 必须用 Claude Code 吗？**

A: 不是。你可以：

- 直接用 &#96;dino&#96; 命令（适合熟悉命令行的人）
- 用 Claude Code / OpenClaw（适合程序员和效率党）
- 通过 MCP Server 连接 Cursor、Windsurf 等 AI 编辑器
- 甚至可以自己开发客户端（开源工具）

**Q: 我的笔记能导出吗？**

A: 可以。数据是纯文本 Markdown 格式，随时可以导出、备份、迁移。

## **为什么你应该试试？**

如果你是这样的人：

- :check_mark_button: 每天产生大量想法，但懒得整理
- :check_mark_button: 笔记散落各处，找不到想要的内容
- :check_mark_button: 希望有个&quot;听得懂人话&quot;的笔记工具
- :check_mark_button: 想要待办事项自动追踪
- :check_mark_button: 相信&quot;工具应该适应人，而不是人适应工具&quot;

那 Dinox CLI 就是为你准备的。

**它不是又一个笔记软件。**

它是一个会思考的笔记系统，一个可以用自然语言操作的知识管理工具。

## **三步开始你的旅程**

1. **安装 CLI**
  &#96;&#96;&#96;plaintext
  npm install -g @dinoxx/dinox-cli
  dino auth login &quot;&lt;your-token&gt;&quot;

  &#96;&#96;&#96;
2. **安装 Skills（可选）**
  &#96;&#96;&#96;plaintext
  git clone https://github.com/shanks/dinox-cli-skills.git
  claude --add-dir ./dinox-cli-skills

  &#96;&#96;&#96;
3. **开始使用**
  &#96;&#96;&#96;plaintext
  帮我创建第一条笔记

  &#96;&#96;&#96;

就这么简单。

---

**相关资源**

- **Dinox CLI GitHub**：
  https://github.com/shanks/dinox-cli**[2]**
- **Dinox CLI Skills GitHub**：
  https://github.com/shanks/dinox-cli-skills**[3]**
- **Claude Code 官方文档**：
  https://docs.anthropic.com/claude-code**[4]**

**关注我，一起探索 AI 时代的知识管理！**

#### **参考链接**

1. https://openclaw.ai/: 
  https://openclaw.ai/
2. https://github.com/shanks/dinox-cli: 
  https://github.com/shanks/dinox-cli
3. https://github.com/shanks/dinox-cli-skills: 
  https://github.com/shanks/dinox-cli-skills
4. https://docs.anthropic.com/claude-code: 
  https://docs.anthropic.com/claude-code

  


&amp;nbsp;

&gt; 来自：[https://mp.weixin.qq.com/s/FDZZo5hzPpGju-bzTs8kNQ](https://mp.weixin.qq.com/s/FDZZo5hzPpGju-bzTs8kNQ)

&amp;nbsp;
