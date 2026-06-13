---
created: 2026-04-30
title: "I Built a Knowledge Base That Writes Itself. Here Is What Andrej Karpathy Got Right."
source: "https://fabswill.com/blog/building-a-second-brain-that-compounds-karpathy-obsidian-claude/?utm_source=reddit"
author:
description: "Andrej Karpathy posted about using LLMs to build personal knowledge bases. I took his workflow, wired it into my Obsidian vault with Claude Code, and within an hour had 21 cross-linked wiki articles compiled from YouTube transcripts. Here is how it works and why it matters."
---
# I Built a Knowledge Base That Writes Itself. Here Is What Andrej Karpathy Got Right.

# 《我构建了一个自我编写的知识库：安德烈·卡帕西做对了什么》阅读笔记
## 一、基本信息
- **原文标题**：I Built a Knowledge Base That Writes Itself. Here Is What Andrej Karpathy Got Right.
- **中文译名**：我构建了一个自我编写的知识库：安德烈·卡帕西做对了什么
- **作者**：Fabian G. Williams，微软首席产品经理，运营副业Adotob，同时维护两个AI代理：运行在Mac Mini上的家庭助理Ada（40+定时任务）、运行在Windows设备上的非营利组织执行助理Mimi
- **发表时间**：2026年4月5日
- **阅读时长**：8分钟
- **核心主旨**：AI不应仅用于回答问题，而应构建可自动生长、实现复利效应的个人知识库，让未来的每个问题都更容易被解答。

## 二、核心背景与起源
### 1. Andrej Karpathy的原始观点
复活节周末，作者在信息流中看到安德烈·卡帕西（前特斯拉AI总监、OpenAI创始成员）的推文，核心思路如下：
- 停止仅用大语言模型（LLM）编写代码，转而用其**编译知识**：将原始资料（文章、论文、转录稿、推文等）统一存入文件夹，让LLM增量构建结构化维基，包含摘要、反向链接、概念文章、交叉引用，全部采用Markdown格式，可在Obsidian中直接查看。
- 该方案不属于RAG（检索增强生成）：当维基规模达到约100篇文章、40万字时，仅靠LLM自动维护的索引文件即可完成处理，无需向量数据库、嵌入管道，仅依赖Markdown文件和合理的索引结构。
- 核心逻辑：LLM负责维护知识库，用户仅需要输入原始资料，无需手动整理内容。

### 2. 作者原有Obsidian库的状态
作者自2026年2月起使用Obsidian作为「第二大脑」，原有基础包括：
- 三个工作场景分类：个人事务、副业Adotob、微软日常工作
- 自研的Ralph v2宪法框架，用于自主开发流程规范
- 两个已运行的AI代理：Ada（Mac Mini，40+定时任务）、Mimi（Windows，非营利组织运营）
- 库规模：2327个Markdown文件、2.3GB存储空间
- 原有痛点：内容杂乱无章，研究摘要与定时任务配置混存、播客笔记与部署脚本同目录，所有内容无交叉链接，每次新会话都从零开始，知识无法产生复利效应。

### 3. 项目触发点
作者看到Karpathy的推文后，意识到自己已具备80%的基础条件（Obsidian库、Claude Code工具、存量播客转录稿），仅缺少**将原始资料自动转化为结构化知识的管道**，因此用Claude Code在一场会话中完整实现了整套流程。

## 三、核心实现：四大Claude Code技能
作者基于Karpathy的思路，构建了四个Claude Code技能，实现全流程自动化：
| 技能名称 | 功能说明 |
| --- | --- |
| `/ingest-transcript` | 输入YouTube URL，自动下载转录稿并保存到`knowledge/raw/transcripts/`目录，自动添加完整YAML前置元数据（标题、演讲者、日期、标签、`compiled: false`），源信息自动注册，单条命令完成录入 |
| `/wiki-compile` | 核心编译技能：扫描`knowledge/raw/`目录下所有未编译的原始源，提取其中提到的概念、人物、工具，在`knowledge/wiki/`目录创建或更新对应维基文章（包含摘要、核心要点、`[[反向链接]]`），自动更新主索引文件，标记原始文件为`compiled: true`。**幂等特性**：重复运行不会改变结果，避免重复生成内容 |
| `/wiki-lint` | 维基健康自检：扫描库中断链、缺失前置元数据、过时文章、孤立页面、重复概念等问题，生成修复报告，提示用户需要优化的内容 |
| `wiki_search.py` | 基于SQLite FTS5的全文搜索工具，无额外依赖，可覆盖所有维基内容的检索，支持命令行调用或Claude会话中直接调用 |

### 系统整体特性
- 完全基于文件系统运行：除搜索功能使用SQLite外，无额外数据库，无第三方API调用，无云依赖，Obsidian仅作为内容查看器使用。
- 技能本质为Claude Code可识别的Markdown指令文件，可适配任意支持文件读写的LLM。

## 四、首次实测效果
作者选择Lenny播客对Anthropic增长负责人Amol Avasari的采访作为首个测试素材，仅观看1/3时就决定录入：
1. 运行`/ingest-transcript <采访URL>`，自动生成包含3237段的转录稿
2. 运行`/wiki-compile`，自动生成4篇交叉链接的维基文章：
   - 《Amol Avasari》：人物背景，介绍其通过冷邮件加入Anthropic的经历
   - 《Capability Overhang（能力过剩）》：概念文章，指模型能力提升速度快于产品效益扩散速度的现象
   - 《CASH Framework》：Anthropic内部自动化增长实验框架，全称为Claude Accelerates Sustainable Hypergrowth
   - 《Success Disasters（成功灾难）》：指增长过快导致其他业务环节崩溃的情况
3. 自动关联效果：每篇新文章都与现有库内内容交叉链接，例如Amol关联Claude Code、CASH框架关联Agentic Engineering、能力过剩关联令牌预算优化，知识图谱自动扩展。

## 五、运行数据效果
处理5个原始源（3个YouTube转录、1个推文线程、1个会话摘要）后的成果：
| 统计维度 | 数据 |
| --- | --- |
| 概念文章数量 | 13 |
| 人物档案数量 | 4 |
| 工具评估数量 | 4 |
| 维基文章总数 | 21 |
| 文章间交叉链接数 | 60+ |
| 已处理原始源数量 | 5 |
| 管道搭建总耗时 | 1个下午 |
| 单个新源处理耗时 | <2分钟 |
| 整体库结构 | 重构为`knowledge/`、`projects/`、`contexts/`、`ops/`、`media/`的清晰层级，共2327个Markdown文件 |

## 六、核心价值：知识的复利效应
这是Karpathy推文中未明确提及、但实践后最突出的特性：**每一个新录入的源，都会让所有历史源的价值提升**。
- 实例：
  1. 首次整理Simon Willison的转录时，「Agentic Engineering（智能体工程）」文章独立存在，无关联内容
  2. 次日整理Nate B Jones的转录，其提出的12个Agentic Primitives（智能体原语）自动反向链接到「Agentic Engineering」文章
  3. 再次整理Amol Avasari的内容时，CASH框架同时关联上述两部分内容，而「能力过剩」概念为之前从不同角度撰写的「令牌预算优化」提供了全新背景视角
- 所有关联均为LLM基于维基结构自动发现，无需人工设计，这就是知识复利的直观体现。

## 七、适用场景延伸（不止个人使用）
这套方案可适配多种角色的知识管理需求：
1. **产品经理**：录入所有用户研究访谈，一周内即可生成交叉链接的用户痛点、功能请求、竞品洞察维基，全可搜索、全关联
2. **工程师**：将所有架构决策记录、故障复盘、RFC文档纳入维基，六个月后查询「2025年我们关于缓存学到了什么？」，可直接获得答案加3个相关决策链接
3. **创业者**：录入所有投资人对话、竞品分析、客户电话内容，路演PPT几乎可自动生成，因为所有证据已结构化整理
- Karpathy曾提到「这里本可以诞生令人惊叹的新产品，而非一堆脚本的拼凑」，但作者强调无需等待商业化产品，现有脚本已可稳定运行。

## 八、实操搭建指南
若需自行搭建同款系统，需准备以下工具并按步骤配置：
### 1. 必备工具
- Obsidian：免费本地软件，完美渲染Markdown，作为内容查看器
- Claude Code（或任意编码类AI代理）：用于构建和运行自动化技能
- Obsidian网页剪辑器（浏览器扩展）：一键将网页文章保存到原始资料目录

### 2. 标准目录结构
```
knowledge/
  raw/          ← 所有原始资料存放目录
    articles/   ← 文章类资料
    transcripts/ ← 转录稿类资料
    papers/      ← 论文类资料
  wiki/          ← LLM编译后的维基内容目录
    concepts/    ← 概念类文章
    people/      ← 人物类档案
    tools/       ← 工具类评估
    _index.md    ← 主索引文件
  output/        ← 查询结果归档目录
```

### 3. 注意事项
- 首次编译需要耐心：LLM需要读取所有原始源构建初始维基，后续增量编译速度极快
- 技能文件可适配任意支持文件读写的LLM，无需绑定Claude Code

## 九、三个核心经验教训
作者总结实践后的三个关键认知：
1. **管道比单篇文章价值高得多**：手动撰写21篇维基需要数天时间且难以维护，而自动化管道可让每一个观看的视频、阅读的论文、刷到的推文都自动成为知识库的一部分，持续产生价值。
2. **交叉链接是超能力**：单独的笔记仅能解决单点问题，交叉链接的笔记可实现知识关联，产生变革性价值。例如「能力过剩」和「令牌预算优化」关联后，可发现成本问题和采用问题本质是同一问题的不同视角。
3. **Obsidian图谱视图是核心反馈**：可视化看到知识增长（节点出现、边形成、聚类涌现）的满足感，远高于管理一堆无关联的Markdown文件，会驱动用户持续录入更多资料。

## 十、结论与后续规划
- 整套管道仅用1个周六下午搭建完成，可长期稳定运行，所有后续观看的播客、剪辑的文章、追踪的研究线索都会自动纳入知识库，持续产生复利。
- Karpathy的核心正确判断：LLM不只是回答问题的工具，更是**构建「回答问题的系统」**的工具。
- 作者后续计划将这套知识管道接入自己的两个AI代理Ada和Mimi，进一步提升代理的自主能力。

---

# 原文内容

## I Built a Knowledge Base That Writes Itself. Here Is What Andrej Karpathy Got Right.我构建了一个自我编写的知识库。安德烈·卡帕西做对了什么。

Andrej Karpathy posted about using LLMs to build personal knowledge bases. I took his workflow, wired it into my Obsidian vault with Claude Code, and within an hour had 21 cross-linked wiki articles compiled from YouTube transcripts. Here is how it works and why it matters.  
安德烈·卡帕西在推特上分享了使用 LLMs 构建个人知识库的方法。我将他的工作流程接入我的 Obsidian 知识库，并使用 Claude Code，在一个小时内就从 YouTube 转录文本中整理出 21 篇相互链接的维基文章。以下是具体实现方式及其重要性。## TL;DR

---

Andrej Karpathy tweeted about using LLMs to build personal knowledge bases — raw sources in, compiled wiki out, all in Obsidian. I implemented his entire workflow in one session using Claude Code skills. Four YouTube transcripts became 21 cross-linked wiki articles.  
安德烈·卡帕西在推特上分享了如何使用 LLMs 构建个人知识库——从原始资料输入到整合成维基输出，全部在 Obsidian 中进行。我使用 Claude Code 的技能，在一场会话中完整实现了他的整个工作流程。四份 YouTube 转录文本变成了 21 篇相互链接的维基文章。  
The system now compiles new sources, health-checks its own consistency, and searches itself. It took an afternoon. It will compound forever.  
该系统现在可以编译新资料、检查自身的一致性并进行搜索。整个过程只花了一个下午。它将永远持续下去并不断增长。

---

> **Your AI should not just answer questions. It should build a knowledge base that makes every future question easier to answer.  
> 你的 AI 不应仅仅回答问题。它应该构建一个知识库，让未来的每个问题都更容易回答。**

---

## The Tweet That Started This

On Easter weekend, I was catching up on my feed and saw [this post from Andrej Karpathy](https://x.com/karpathy/status/2039805659525644595):  
复活节周末，我正在浏览我的信息流，看到了安德烈·卡帕西（Andrej Karpathy）的一条帖子：

![Andrej Karpathy's tweet about LLM Knowledge Bases](https://github.com/gloria-29/OB-assets/releases/download/img-e7/e7e1007a770103166d5b11bb09ee70c6bfb2abf08965f8483dfb58f70ac7a36a.png)

The core idea: stop using LLMs just to write code. Start using them to **compile knowledge**. Collect raw sources — articles, papers, transcripts, tweets — into a folder. Then have the LLM incrementally build a wiki from those sources. Summaries, backlinks, concept articles, cross-references. All in markdown. All viewable in Obsidian.  
核心理念是：停止使用 LLM 来编写代码。开始使用它们来“编译”知识。将原始资料——文章、论文、转录稿、推文——收集到一个文件夹中。然后让 LLM 逐步从这些资料中构建一个 wiki。包括摘要、反向链接、概念文章、交叉引用。全部使用 Markdown 格式。全部可在 Obsidian 中查看。

I read it and thought: I am already 80% there. I have the Obsidian vault. I have Claude Code. I have transcripts from podcasts I have been watching all week. What I do not have is the pipeline — the thing that turns raw sources into structured knowledge automatically.  
我读了之后心想：我已经有 80% 做到了。我有 Obsidian 知识库。我有 Claude Code。我有本周观看的播客转录稿。我没有的是管道——那个将原始资料自动转化为结构化知识的工具。

So I built it.

## What I Had Before

---

I have been running an Obsidian vault as my second brain since early February 2026. Three work contexts — personal, my side business Adotob, and my day job at Microsoft. A constitutional framework called Ralph v2 for autonomous development.  
我从 2026 年 2 月初开始运行一个 Obsidian 知识库作为我的第二大脑。三个工作场景——个人事务、我的副业 Adotob，以及我在 Microsoft 的日常工作。一个名为 Ralph v2 的宪法框架用于自主开发。  
An AI agent named Ada running on a Mac Mini in my house with 40+ cron jobs. Another agent named Mimi running a nonprofit’s operations on a Windows box.  
一个名为 Ada 的人工智能代理在我的 Mac Mini 上运行着 40 多个定时任务。另一个名为 Mimi 的代理在 Windows 服务器上管理非营利组织的运营。

---

The vault had grown to 2,327 markdown files and 2.3 gigabytes. It was powerful but messy. Research summaries lived next to cron job configs. Podcast notes sat in the same directory as deploy scripts. I had knowledge, but it was not compounding.  
这个知识库已经增长到 2,327 个 Markdown 文件和 2.3GB。它功能强大但杂乱无章。研究摘要与定时任务配置混在一起，播客笔记和部署脚本存放在同一个目录下。我拥有知识，但这些知识并没有形成复利效应。  
Every new session started from scratch because nothing was cross-linked.  
每次新的会话都从零开始，因为没有任何内容之间建立了交叉链接。

---

## What Karpathy Got Right

His insight is deceptively simple: **the LLM should maintain the wiki, not you.** You rarely touch it directly. Your job is to feed it raw sources. The LLM’s job is to:  
他的洞见看似简单：LLM 应该维护知识库，而不是你。你很少直接接触它。你的工作是向它提供原始资料。LLM 的工作是：

1. **Compile** raw sources into structured articles
2. **Cross-link** related concepts with backlinks
3. **Index** everything so you can find it
4. **Lint** the wiki for inconsistencies and gaps
5. **Answer questions** against the accumulated knowledge  
	根据积累的知识回答问题

This is not RAG. At ~100 articles and ~400K words, Karpathy found the LLM handles it fine with auto-maintained index files. No vector database. No embedding pipeline. Just markdown files and a good index.  
这不是 RAG。在约 100 篇文章和约 40 万字的情况下，Karpathy 发现 LLM 完全可以处理，只需自动维护索引文件即可。无需向量数据库，无需嵌入管道，只需要 Markdown 文件和良好的索引。

## What I Built

I created four Claude Code skills that implement Karpathy’s pipeline:  
我创建了四个 Claude Code 技能来实现 Karpathy 的流水线：

**`/ingest-transcript`** — Feed a YouTube URL, get a transcript saved to `knowledge/raw/transcripts/` with full YAML frontmatter (title, speaker, date, tags, `compiled: false`). One command. Source is registered automatically.  
`/ingest-transcript` — 输入一个 YouTube 网址，即可将带有完整 YAML 前置元数据的成绩单保存到 `knowledge/raw/transcripts/` （包含标题、演讲者、日期、标签、 `compiled: false` ）。一条命令即可完成。来源信息会自动注册。

**`/wiki-compile`** — The core skill. Scans `knowledge/raw/` for uncompiled sources. For each one, it extracts concepts, people, and tools mentioned. Creates or updates wiki articles in `knowledge/wiki/` with summaries, key points, and `[[backlinks]]`. Updates the master index. Marks raw files as compiled. Idempotent — run it twice, nothing changes.  
`/wiki-compile` — 核心技能。扫描 `knowledge/raw/` 中未编译的来源。对每个来源，提取其中提到的概念、人物和工具。在 `knowledge/wiki/` 中创建或更新带有摘要、要点和 `[[backlinks]]` 的 wiki 文章。更新主索引。将原始文件标记为已编译。幂等操作——运行两次，不会有任何变化。

**`/wiki-lint`** — Health checks the wiki for broken links, missing frontmatter, stale articles, orphan pages, and duplicate concepts. Writes a report. Tells me what to fix.  
`/wiki-lint` — 检查 wiki 的健康状况，查找断链、缺失的前置元数据、过时的文章、孤立页面以及重复的概念。生成报告。告诉我需要修复的内容。

**`wiki_search.py`** — FTS5 full-text search over all wiki content. SQLite-based, zero dependencies. Searchable from the command line or by Claude during a session.  
`wiki_search.py` — 基于 SQLite 的 FTS5 全文搜索功能，覆盖所有 wiki 内容，无需依赖外部库。可通过命令行或 Claude 会话进行搜索。

The whole thing runs on the filesystem. No database except SQLite for search. No API calls. No cloud dependency. Obsidian is just the viewer.  
整个系统都运行在文件系统中。除了用于搜索的 SQLite 之外，没有使用数据库。没有 API 调用。没有云依赖。Obsidian 只是一个查看器。

## The First Real Test

I was watching [Lenny’s Podcast interview with Amol Avasari](https://www.youtube.com/watch?v=k-H4nsOTuxU) — the head of growth at Anthropic. A third of the way in, I knew I wanted this in my knowledge base. So I ran:  
我正在观看 Lenny 播客对 Anthropic 增长负责人 Amol Avasari 的采访。看到三分之一的时候，我就知道这个内容应该加入我的知识库。所以我执行了以下操作：

```coffeescript
/ingest-transcript https://www.youtube.com/watch?v=k-H4nsOTuxU
```

Transcript saved. 3,237 segments. Then:

```
/wiki-compile
```

Four new wiki articles appeared:

- **Amol Avasari** — the person, his background, how he cold-emailed his way into Anthropic  
	Amol Avasari — 这个人，他的背景，他是如何通过冷邮件进入 Anthropic 的
- **Capability Overhang** — models improve faster than products can diffuse the benefits  
	能力过剩 — 模型提升速度超过产品扩散效益的速度
- **CASH Framework** — Claude Accelerates Sustainable Hypergrowth, Anthropic’s internal automated growth experimentation  
	CASH 框架——Claude 加速可持续超增长，Anthropic 内部自动化增长实验
- **Success Disasters** — when growth goes so fast that other things break  
	成功灾难——当增长过快导致其他环节崩溃时

Each article cross-linked to existing articles. Amol connected to Claude Code. CASH Framework connected to Agentic Engineering. Capability Overhang connected to Token Budget Optimization. The knowledge graph grew itself.  
每篇文章都与现有文章交叉链接。Amol 与 Claude Code 相连。CASH 框架与 Agentic Engineering 相连。能力冗余与令牌预算优化相连。知识图谱自我扩展。

![Terminal showing wiki-compile output alongside Obsidian graph view with Amol Avasari connected to CASH Framework, Capability Overhang, and Success Disasters](https://github.com/gloria-29/OB-assets/releases/download/img-97/97c36c45dac76286f18724b62c8c02c93b38623b025acd5c08f255ecaf34b248.png)

## The Numbers

After processing five raw sources — three YouTube transcripts, one tweet thread, and one session summary — the wiki contains:  
处理五个原始资料后——三个 YouTube 转录文本、一个推文线程和一个会话摘要——该维基包含：

| Category | Count |
| --- | --- |
| Concept articles | 13 |
| People profiles | 4 |
| Tool evaluations | 4 |
| Total wiki articles | 21 |
| Cross-links between articles | 60+ |
| Raw sources processed | 5 |
| Time to build the pipeline | One afternoon |
| Time to process a new source | Under 2 minutes |

The vault overall: 2,327 markdown files, restructured into a clean hierarchy with `knowledge/`, `projects/`, `contexts/`, `ops/`, and `media/`.  
整体来看：2,327 个 Markdown 文件，按照 `knowledge/` 、 `projects/` 、 `contexts/` 、 `ops/` 和 `media/` 的结构整理成清晰的层级。

![Full Obsidian graph view showing the knowledge wiki integrated into the vault](https://github.com/gloria-29/OB-assets/releases/download/img-6c/6c76b7981610af9f9f825c8650a91d345b9f030af43dcf69c11ba678a0da87c9.png)

## What Compounding Looks Like

Here is the thing that Karpathy’s post does not say explicitly but that becomes obvious the moment you use this: **every new source makes every previous source more valuable.**  
Karpathy 的文章中有一句话没有明确提及，但当你真正使用这套体系时就会立刻明白：每新增一个来源，都会让所有之前的来源变得更有价值。

---

When I compiled the Simon Willison transcript two days ago, the article on Agentic Engineering stood alone. When I compiled the Nate B Jones transcript the next day, his 12 Agentic Primitives linked back to Agentic Engineering.  
两天前我整理了 Simon Willison 的转录内容，当时关于“代理工程”（Agentic Engineering）的那篇文章是独立存在的。第二天我整理了 Nate B Jones 的转录内容后，他提出的 12 个代理原语（Agentic Primitives）又反向链接到了“代理工程”。  
When I compiled Amol Avasari today, the CASH Framework linked to both — and the Capability Overhang article gave new context to Token Budget Optimization, which I had written about from a completely different source.  
今天整理 Amol Avasari 的内容时，CASH 框架同时关联了这两部分内容——而《能力过剩》（Capability Overhang）这篇文章则为“令牌预算优化”（Token Budget Optimization）提供了全新的背景视角，尽管我之前是从完全不同的角度讨论过这个话题。

---

None of these connections were planned. The LLM found them because the wiki structure makes relationships visible. This is the compound interest of knowledge.  
这些连接都不是预先设计好的。LLM 之所以能发现它们，是因为维基的结构让关系变得可见。这就是知识的复利效应。

![Obsidian graph view focused on tag observability showing how one concept radiates to connect everything](https://github.com/gloria-29/OB-assets/releases/download/img-9d/9df1ba5c72e94674ff9c79e93bf611dc97e38b435119035031c3409d0050f06a.png)

## Why This Matters Beyond My Situation

I have been writing about autonomous AI agents for months — how to build them, how to trust them, how to keep them honest. This knowledge pipeline is a different kind of agent. It does not send emails or check your bank balance. It **builds understanding**.  
我已经连续数月撰写关于自主 AI 代理的文章——如何构建它们，如何信任它们，如何让它们保持诚实。这个知识管道是一种不同类型的代理。它不会发送电子邮件或查看你的银行账户余额。它构建的是理解力。

If you are a PM, imagine feeding every user research interview into this pipeline. Within a week you have a cross-linked wiki of user pain points, feature requests, and competitive insights — all searchable, all connected.  
如果你是产品经理，想象将所有用户研究访谈输入到这个管道中。一周之内，你就能拥有一个相互链接的维基，涵盖用户痛点、功能请求和竞争洞察——全部可搜索，全部关联。

If you are an engineer, imagine every architecture decision record, every post-mortem, every RFC living in a wiki that the LLM keeps current. Six months from now, you ask “what did we learn about caching in 2025?” and the wiki has the answer with links to three related decisions.  
如果你是工程师，想象每一个架构决策记录、每一次事后复盘、每一份 RFC 都存在于一个由 LLM 维护的维基中。六个月后，当你询问“我们在 2025 年对缓存学到了什么？”时，该维基会给出答案，并附上三个相关决策的链接。

If you are a founder, imagine every investor conversation, every competitor teardown, every customer call compiled into a knowledge base that compounds. Your pitch deck practically writes itself because the evidence is already organized.  
如果你是创业者，想象一下，每一场投资人对话、每一次竞品分析、每一个客户电话都被整合进一个不断积累的知识库。你的路演 PPT 几乎可以自动生成，因为证据已经整理得井井有条。

This is what Karpathy means when he says “there is room here for an incredible new product instead of a hacky collection of scripts.” He is right. But you do not have to wait for the product. The scripts work today.  
这就是 Karpathy 所说的“这里本可以诞生一个令人惊叹的新产品，而不是一个由一堆脚本拼凑而成的东西”的含义。他说的没错。但你不必等待这个产品的出现——这些脚本今天就能用。

## The Practical Setup

If you want to build this yourself, here is what you need:  
如果你想自己搭建这样的系统，你需要准备以下工具：

1. **Obsidian** — free, runs locally, renders markdown beautifully  
	Obsidian —— 免费、本地运行、能完美渲染 Markdown
2. **Claude Code** (or any coding agent) — to build and run the skills  
	Claude Code（或任何代码代理）——用于构建和运行技能
3. **A directory structure:**
	```lua
	knowledge/
	 raw/          ← dump sources here
	   articles/
	   transcripts/
	   papers/
	 wiki/          ← LLM compiles here
	   concepts/
	   people/
	   tools/
	   _index.md
	 output/        ← query results filed back
	```
4. **Obsidian Web Clipper** (browser extension) — one-click save articles to `raw/`  
	Obsidian 网页剪辑器（浏览器扩展）——一键将文章保存到 `raw/`
5. **Patience for the first compile** — the LLM needs to read your sources and build the initial wiki. After that, incremental compiles are fast.  
	耐心等待首次编译——LLM 需要读取你的源文件并构建初始维基。之后，增量编译会很快。

The skills I built are Claude Code markdown files. They are not magic. They are instructions the LLM follows: scan for uncompiled files, extract concepts, create articles, update the index. You could adapt the same pattern for any LLM that can read and write files.  
我构建的技能是 Claude Code 的 Markdown 文件。它们并非魔法。它们是 LLM 遵循的指令：扫描未编译的文件，提取概念，创建文章，更新索引。你可以为任何能够读写文件的 LLM 调整相同的模式。

## Three Lessons

1. **The pipeline is more valuable than any single article.** I could have written 21 wiki articles by hand. It would have taken days and I would never maintain them. The pipeline means every YouTube video I watch, every article I read, every tweet that catches my eye becomes part of a growing knowledge base — automatically.  
	这个流水线比任何单篇文章都更有价值。我本可以手动撰写 21 篇维基百科文章，但这需要数天时间，而且我永远无法维护它们。这个流水线意味着：我观看的每一个 YouTube 视频、阅读的每一篇文章、看到的每一条引起注意的推文，都会自动成为不断增长的知识库的一部分。
2. ---
	**Cross-links are the superpower.** Individual notes are useful. Cross-linked notes are transformational.  
	交叉链接是真正的超能力。单独的笔记是有用的，但交叉链接的笔记却能带来变革性的效果。  
	The moment Amol Avasari’s Capability Overhang connected to Nate B Jones’s Token Budget Optimization, I saw a relationship I had not noticed before — the cost problem and the adoption problem are the same problem viewed from different angles.  
	当 Amol Avasari 的"能力缺口"(Capability Overhang)与 Nate B Jones 的"令牌预算优化"(Token Budget Optimization)产生关联时，我看到了一个之前未曾注意到的新关系——成本问题和采用问题其实是同一个问题的不同角度。
	---
3. **Obsidian’s graph view is the reward.** You can see the knowledge growing. Nodes appear, edges form, clusters emerge. It is deeply satisfying in a way that a folder of markdown files is not. The visual feedback makes you want to feed it more sources.  
	Obsidian 的图谱视图就是奖励所在。你可以看到知识在成长，节点出现，边形成，聚类涌现。这种满足感远非一堆 markdown 文件所能比拟。视觉反馈让你渴望不断向其中添加更多来源。

---

I built this pipeline in one session on a Saturday afternoon. It will run for years. Every podcast I watch, every article I clip, every research thread I follow — it all compounds now.  
我花了周六下午的时间搭建了这个系统，它将持续运行多年。我观看的每一个播客、剪辑的每一篇文章、关注的每一条研究线索——现在它们都在不断积累价值。

That is what Karpathy got right. The LLM is not just a tool for answering questions. It is a tool for **building the thing that answers questions.**  
这就是卡帕西（Karpathy）真正理解的地方。大语言模型（LLM）不仅仅是一个回答问题的工具，更是一个构建能够回答问题的系统的工具。

---

If you are interested in autonomous AI agents, knowledge management, or just building cool things on your Mac, I write about all of it here. I also run Ada — an AI family assistant on a Mac Mini — and Mimi — an AI executive assistant for a nonprofit.  
如果你对自主人工智能代理、知识管理，或者只是在你的 Mac 上构建酷炫的东西感兴趣，我在这里都会写相关内容。我还运营着 Ada——一个在 Mac Mini 上的 AI 家庭助手，以及 Mimi——一家非营利组织的 AI 执行助理。  
Both of them are getting this knowledge pipeline next.  
他们都将很快接入这个知识管道系统。

---

Cheers, Fabian Williams

[fabswill.com](https://fabswill.com/) · [adotob.com](https://adotob.com/) · [@fabianwilliams](https://twitter.com/fabianwilliams) · [LinkedIn](https://linkedin.com/in/fabiangwilliams)

# 高亮内容

- 