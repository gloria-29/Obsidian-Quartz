---
created: 2026-05-17
title: "gloria-29/Personal_AI_Infrastructure: Agentic AI Infrastructure for magnifying HUMAN capabilities."
source: "https://github.com/gloria-29/Personal_AI_Infrastructure"
author:
description: "Agentic AI Infrastructure for magnifying HUMAN capabilities. - gloria-29/Personal_AI_Infrastructure"
---
# gloria-29/Personal_AI_Infrastructure: Agentic AI Infrastructure for magnifying HUMAN capabilities.

# Personal AI Infrastructure (PAI) 阅读笔记

## 全面摘要

PAI（个人AI基础设施）被设计为一个**赋能人类能力的生活操作系统**，旨在通过了解用户的AI助手的帮助，捕捉用户的身份、关注点和目标，并协助用户实现这些目标。它构建在Claude Code之上，但提供了一个更上层的、个性化的完整系统。

### 核心概念与原则

*   **以人为本，技术次之：** PAI将人类置于中心，技术服务于改善人们的生活。
*   **生活操作系统：** PAI不仅仅是AI工具，它关注并帮助用户在目标、工作、人际关系、健康和财务等方面追求理想状态。
*   **理想状态驱动：** AI最大的挑战在于定义“好”或“完成”，PAI围绕“理想状态”概念构建，通过**ISA (Ideal State Artifact)** 明确“完成”的样子，并分解为**ISC (Ideal State Criteria)** 进行验证。
*   **单一数字助理界面：** 每个人拥有一个DA (Digital Assistant)，作为与所有AI交互的主要接口，它能动态创建所需界面，并以用户的“终极目标 (Telos)”为导向。

### 关键特性与组成部分

*   **PAI 操作系统：** 包含技能、记忆、核心算法、Telos文件和身份文件。
*   **Pulse (生命仪表盘)：** 在`localhost:31337`运行的统一守护进程，提供状态、目标和工作的可视化界面，并集成语音、钩子、可观测性、定时任务、wiki API等。
*   **The DA (数字助理)：** 用户的AI声音和个性，是主要交互接口。
*   **Algorithm v6.3.0：** 一种自定义的七阶段循环算法（观察→思考→规划→构建→执行→验证→学习），用于驱动从当前状态到理想状态的转变，并根据提示选择模式和等级。
*   **ISA 原语：** 理想状态工件，类似软件PRD，但适用于所有创意任务，通过12个章节和5种身份定义。
*   **结构化隐私：** 通过“包含区域 (containment zones)”和安全门实现，避免跨区域数据泄露。
*   **Memory v7.6：** 基于文本的记忆系统，分为工作 (WORK)、知识 (KNOWLEDGE)、学习 (LEARNING)、关系 (RELATIONSHIP)、可观测性 (OBSERVABILITY) 和状态 (STATE) 三个层级，并构建类型化图谱。
*   **技能 (Skills)：** 偏向确定性代码执行的模块化单元，通过代码、CLI、工作流和SKILL.md组织。PAI v5.0.0包含45个公共技能、171个工作流和37个钩子。
*   **思维技能：** 提供第一性原理、专家辩论、红队分析、根因分析、系统思考、迭代深度探索等自定义思维能力，提高系统决策质量。
*   **透明存储：** 强烈偏向纯文本和Markdown，避免使用SQLite、Postgres等不透明存储。
*   **上下文优先：** PAI是为智能模型提供正确上下文的系统，模型的重要性低于其周围的上下文。
*   **无RAG的文件系统：** 自2025年6月起避免使用RAG，而是通过富文本、交叉引用和快速搜索利用文件系统作为上下文索引。
*   **自我改进：** 捕捉明确评分、情感、验证结果、满意度等信号，用于提升系统自身性能。

### 安装与升级

*   **一键安装（推荐）：** `curl -sSL https://ourpai.ai/install.sh | bash`，自动处理环境验证、DA身份设置、Pulse服务注册等。
*   **手动安装：** 克隆仓库，复制配置，然后运行安装脚本。
*   **安装后步骤：** 打开`http://localhost:31337`生命仪表盘，并在Claude Code中运行`/interview`以设置**TELOS**、理想状态、偏好和DA身份，其中TELOS是DA优化的关键。
*   **v4.x升级：** v5.0.0是全新系统，非补丁，需阅读迁移指南。建议先备份，DA可协助迁移旧内容。

### 与其他工具的区别

*   **与Claude Code：** Claude Code是引擎，PAI是使其成为“您的车”的顶层，提供持久记忆、自定义技能、个人上下文、智能路由和自我改进。
*   **与Fabric：** Fabric是特定任务的AI提示集合，PAI是DA如何运作的基础设施。两者互补，PAI用户可将Fabric模式集成到技能中。

### 发展路线图

未来计划包括支持本地模型、更细粒度的模型路由、远程访问、对外电话呼叫功能以及与邮件、Discord、Telegram、Slack等外部平台的通知集成。

### v5.0.0 版本亮点 (2026-04-30)

*   **Pulse：** 统一守护进程，Life Dashboard。
*   **The DA：** 数字助理身份层，包含交互式设置 (`/interview`)。
*   **Algorithm v6.3.0：** 七阶段循环，具备模式分类器和验证原则。
*   **The ISA：** 理想状态工件原语，包含12个部分和5种身份。
*   **包含与发布工具链：** 结构化隐私机制。
*   **Memory v7.6：** 按用途结构化的记忆系统。
*   **45个公共技能、171个工作流、37个钩子：** 构成PAI的丰富功能集。
*   **一键安装器：** 简化部署流程。

---

# 原文内容

![PAI Logo](https://github.com/gloria-29/OB-assets/releases/download/img-b6/b666b1964785f057176edb80d8318798b310166dc63aaca53b9714c61b06ae95.png)

## Personal AI Infrastructure

[![Typing SVG](https://github.com/gloria-29/OB-assets/releases/download/img-2f/2faa9a85130894dde9bc19e5feaf41cca4d56a03ab35f44c32fb94d47b4f26d0.svg)](https://github.com/danielmiessler/Personal_AI_Infrastructure)

**Overview:** [What PAI Is](#what-pai-is) · [Principles](#principles) · [Features](#features)  
概述：PAI 是什么 · 设计原则 · 核心功能

**Get Started:** [Installation](#-installation) · [Releases](https://github.com/gloria-29/Personal_AI_Infrastructure/blob/main/Releases) · [Packs](https://github.com/gloria-29/Personal_AI_Infrastructure/blob/main/Packs)  
快速上手：安装指南 · 版本发布 · 技能包

**Resources:** [FAQ](#-faq) · [Roadmap](#-roadmap) · [Community](#-community) · [Contributing](#-contributing)  
资源：常见问题 · 路线图 · 社区 · 贡献指南

[![PAI Overview Video](https://github.com/gloria-29/OB-assets/releases/download/img-a2/a2dd596ccf62b07ec74b4199bc986793dd4acfdd6d702174e5b74dabadc48ace.jpg)](https://youtu.be/Le0DLrn7ta0)

**[Watch the full PAI walkthrough](https://youtu.be/Le0DLrn7ta0)** | **[Read: The Real Internet of Things](https://danielmiessler.com/blog/the-real-internet-of-things)**  
观看完整 PAI 使用演示 | 阅读文章：《真正的物联网》

---

> [!important] Important
> **PAI v5.0.0 — Life Operating System** — the biggest release in PAI history. PAI is no longer "AI scaffolding" — it's a **Life Operating System** with the unified **Pulse** daemon (Life Dashboard at `localhost:31337`), a **DA** (Digital Assistant) identity layer, **Algorithm v6.3.0** (Current State → Ideal State, seven phases, classifier-driven mode + tier), the **ISA** primitive (universal "ideal state" articulation), 45 skills, 171 workflows, 37 hooks, and structural privacy via containment zones.  
> PAI v5.0.0 — 生活操作系统 — 这是 PAI 历史上最重要的版本更新。PAI 不再仅仅是“AI 脚手架”，而是一个集成了统一 Pulse 守护进程（生命仪表盘 `localhost:31337` ）、DA（数字助理）身份层、Algorithm v6.3.0（从当前状态到理想状态的七阶段流程，支持分类器驱动模式+分级机制）、ISA 原语（通用“理想状态”表述框架）、45 项技能、171 个工作流和 37 个钩子的完整生活操作系统。同时引入了基于隔离区域的结构化隐私保护机制。
> 
> **[v5.0.0 release notes →](https://github.com/gloria-29/Personal_AI_Infrastructure/blob/main/Releases/v5.0.0/README.md)** | **[All releases →](https://github.com/gloria-29/Personal_AI_Infrastructure/blob/main/Releases)**  
> v5.0.0 版本说明 → | 查看所有版本 →
> 
> **One-line install:** `curl -sSL https://ourpai.ai/install.sh | bash`
> 
> Upgrading from v4.x? This is a different system, not a patch. Read the [migration guide](https://github.com/gloria-29/Personal_AI_Infrastructure/blob/main/Releases/v5.0.0/README.md#migration-guide-from-v4x) first.  
> 从 v4.x 升级？请注意，这是一个全新的系统架构，并非简单补丁。请务必先阅读迁移指南。

## AI should magnify everyone—not just the top 1%.AI 应该放大每个人的能力——而不仅仅是前 1%的人。

## What PAI Is

PAI is a Life Operating System. It captures who you are, what you care about, and where you're trying to go — and then helps you get there using AI that knows you. Three layers stack on top of each other:  
PAI 是一个生活操作系统。它能够捕捉您的个人特质、关注重点和发展目标，并通过了解您的 AI 助手帮助您实现这些目标。该系统由三个层级构成：

- **PAI** — the OS itself. Skills, memory, the Algorithm, your Telos, your identity files.  
	PAI —— 操作系统本身。技能、记忆、算法、你的 Telos（终极目标）以及身份文件。
- **Pulse** — the Life Dashboard at `localhost:31337`. Where you actually see your state, goals, and work.  
	Pulse —— `localhost:31337` 上的生命仪表盘。在这里，你真正看到自己的状态、目标和作品。
- **The DA** — your Digital Assistant. The voice and personality you talk to.  
	DA —— 您的数字助理。您与之交谈的声音和个性。

It's designed for individuals first, but the same architecture works for teams, companies, or any entity that wants to articulate what it's trying to be and move toward it.  
其设计优先考虑个人用户，但相同的架构同样适用于团队、企业或任何希望明确自身定位并持续进步的实体组织。

---

## Principles

### Humans first, tech second

PAI puts the human at the center, not the tooling. The tech exists to improve people's lives, not the other way around. Every design decision starts from one question: what does this do for the person running it?  
PAI 将人置于中心，而非工具。技术存在的目的是改善人们的生活，而不是相反。每一个设计决策都始于一个问题：这对操作者有什么帮助？

### A Life OS, not an agent harness

---

PAI captures what you care about — goals, work, relationships, health, finances — and helps you pursue your ideal state across all of it. It writes code and runs agents and does the things people associate with AI tooling, but those are capabilities in service of the larger goal.  
PAI 捕捉您所关心的一切——目标、工作、关系、健康、财务——并帮助您实现所有这些方面的理想状态。它编写代码、运行代理，执行人们通常与 AI 工具相关联的功能，但这些功能都是为了实现更大目标而服务的。  
The point is your life, not the tools.

---

### Ideal State drives everything

The biggest unsolved problem with AI is that nobody can define what "good" or "done" actually means for a given task. PAI is built around the concept of Ideal State — specifically the transition from your current state to your ideal state — and it's woven through every layer.  
AI 最大的未解难题在于，没有人能够真正定义某个特定任务中“好”或“完成”意味着什么。PAI 围绕“理想状态”这一概念构建——具体来说，就是从当前状态过渡到理想状态——并且这一理念贯穿于系统的每个层面。

---

The primary expression is the **ISA** (Ideal State Artifact). An ISA is similar to a software PRD: it captures what done looks like so you can build toward it. The difference is that an ISA is general — it works for any creative task, from design to art to philosophy to engineering to strategy.  
主要表达形式是 ISA（理想状态工件）。ISA 类似于软件 PRD：它描述了目标完成的样子，以便你可以朝着这个方向构建。不同之处在于，ISA 是通用的——它适用于任何创造性任务，从设计到艺术，再到哲学、工程和战略。  
The system decomposes the ideal state into discrete **ISCs** (Ideal State Criteria), which populate the document and double as verification items. That's how PAI hill-climbs toward ideal state on any kind of work.  
该系统将理想状态分解为离散的 ISC（理想状态标准），这些标准填充文档并作为验证项。这就是 PAI 如何能在任何类型的工作中逐步逼近理想状态。

---

### A single Digital Assistant will be everyone's interface to AI一个数字助理将成为每个人与人工智能交互的界面。

I wrote about this in 2016 in [The Real Internet of Things](https://danielmiessler.com/blog/the-real-internet-of-things), and I'm more convinced now than I was then. The trajectory is clear: chatbots → agents → assistants. We're all building the same thing, and the endpoint is one DA per person.  
我在 2016 年的《真实的物联网》中写过相关内容，而现在我比当时更加确信这一点。轨迹清晰可见：聊天机器人 → 智能体 → 个人助理。我们都在构建同一类东西，最终目标是每个人拥有一个 DA。

TRIOT had four core ideas that PAI is built on:

- **Digital Assistants** — one DA per person, your primary interface to all AI  
	数字助理——每人一个 DA，是您接触所有人工智能的主要接口。
- **Everything gets an API** — every product, service, person, and place becomes addressable  
	万物皆具 API——每个产品、服务、个人和地点都变得可寻址。
- **Your DA dynamically creates your interfaces** — no more apps and dashboards; the DA assembles whatever you need in the moment  
	您的 DA 会动态地为您构建界面——不再需要各种应用和仪表板；DA 会在当下为您组装所需的一切。
- **You define your ideal state, AI helps you get there** — the whole system points at your Telos  
	您定义理想状态，AI 帮助您实现目标——整个系统都指向您的 Telos（终极目标）

This is what PAI is reaching for.

---

## Features

### Text over opaque storage

Heavy bias toward plain text and Markdown. PAI avoids SQLite, Postgres, and other opaque stores wherever possible. Everything should be transparent and parsable — by you, by your DA, by `rg`, by anything else. If you can't read it with `cat`, we don't want it.  
强烈偏向纯文本和 Markdown。PAI 尽可能避免使用 SQLite、Postgres 等不透明的存储方式。所有内容都应该是透明且可解析的——对你、对你的 DA、对 `rg` 、对其他任何东西都是如此。如果你无法用 `cat` 读取它，那我们就不要它。

### Context scaffolding > model

---

The mistake most people make with AI is failing to feed it the big picture.  
大多数人在使用 AI 时犯的最大错误是未能为其提供全局视角。  
PAI is fundamentally a system for handing the smartest models the right context — about you, about what you're trying to accomplish, about the tools they have — so they can actually help you reach your ideal state. The model matters less than what surrounds it.  
PAI 本质上是一个系统，旨在将最聪明的模型与正确的上下文——关于你、关于你的目标、关于它们可用的工具——相结合，从而真正帮助你达成理想状态。模型本身的重要性远低于其周围的上下文。

---

### Bitter-pilled engineering

---

The flip side of context scaffolding: as models get stronger, they need fewer instructions on how to do the work. We constantly audit PAI to remove overly prescriptive direction in places where the model can do better with just the right context and tools.  
上下文支撑的另一面是：随着模型的增强，它们在执行工作时需要的指令越来越少。我们持续审计 PAI，以移除那些过于具体的方向性指导，因为在适当的上下文和工具支持下，模型可以做得更好。  
The system gets smaller as the models get bigger.

---

### Filesystem as context, no RAG

PAI has avoided RAG since June 2025. Rich text with cross-references, plus fast search like ripgrep, gives us everything people normally want from RAG — without the embedding complexity, the retrieval flakiness, or the loss of fidelity. Your filesystem is the index.  
自 2025 年 6 月起，PAI 已避免使用 RAG。富文本配合交叉引用，再加上像 ripgrep 这样快速的搜索功能，为我们提供了人们通常期望从 RAG 中获得的一切——而无需嵌入复杂性、检索不确定性或保真度损失。你的文件系统就是索引。

### Memory that compounds

A text-based memory system that captures what you've done, what you've learned, and what's worth keeping — and feeds it back as input to future work. Three tiers (WORK, KNOWLEDGE, LEARNING) plus a typed graph across people, companies, ideas, and research.  
一个基于文本的记忆系统，记录你所做的一切、所学的一切以及值得保留的内容——并将这些信息作为未来工作的输入。包含三个层级（工作、知识、学习），以及跨越人、公司、思想和研究的类型化图谱。

### Self-improvement loop

PAI captures signals about what went well and what didn't — explicit ratings, sentiment, verification outcomes, satisfaction — and uses them to improve itself. The system that runs the work is also the system that gets better at running it.  
PAI 捕捉关于哪些事情进展顺利、哪些没有的信息——明确的评分、情感、验证结果、满意度等——并利用这些信息来提升自身。运行工作的系统同时也是不断改进其运行能力的系统。

### The Algorithm

---

A custom algorithm that drives the current → ideal state transition through a seven-phase loop modeled on the scientific method, using Deutsch's framing of hard-to-vary explanations as the standard for "good.  
一种驱动当前状态向理想状态转变的自定义算法，该算法通过一个模仿科学方法的七阶段循环运作，采用德裔物理学家大卫·多伊奇提出的“难以变更的解释”作为“优质”的标准。  
" It's the gravitational center of PAI — every non-trivial task runs through it.  
它是 PAI 的核心引力中心——所有非平凡任务都经由它处理。

---

### Skills as deterministic units

---

A skill system biased toward deterministic code execution. The hierarchy is: code → CLI to run the code → workflows that prompt the CLI → a SKILL.md that routes between workflows. The skill is the container; SKILL.  
一个偏向确定性代码执行的技能体系。层级结构为：代码 → 运行代码的命令行接口（CLI）→ 提示 CLI 执行的流程 → 在 SKILL.md 中定义的路由机制。技能是容器，SKILL.md 是其入口；实际工作尽可能使用真实代码完成。提示词包裹代码，而非代码包裹提示词。  
md is the front door; the actual work is real code wherever possible. Prompts wrap code; code doesn't wrap prompts.  
一套有意义的定制思维技能库——包括第一性原理、专家辩论、红队分析、根因分析、系统思考、迭代深度探索、视角切换等——算法从中调用以提升整个系统的决策质量。

---

### Thinking skills

A meaningful library of custom thinking skills — first principles, council debates, red team, root cause, systems thinking, iterative depth, aperture oscillation, and more — that the Algorithm pulls from to raise the quality of decisions across the system.  
项目处于积极开发中——PAI 正在快速演进。预计会有重大变更、结构调整和频繁更新。

---

## 🚀 Installation

> [!caution] Caution
> **Project in Active Development** — PAI is evolving rapidly. Expect breaking changes, restructuring, and frequent updates.  
> 我们非常相信基于 AI 的 PAI 安装与修改能力。一旦你成功安装了系统，就可以让 AI 直接操作该系统本身——升级版本、添加技能、修改钩子、调整设置、修复任何故障。

### Use your AI to install and run PAI

---

We very much believe in AI-based installation and modification of PAI. Once you have a working install, point your AI at the system itself — upgrade versions, add skills, modify hooks, change settings, repair anything that breaks.  
The most important thing your AI can do for you up front is bring all of your existing custom context — notes, project state, preferences, identity, history — into the `PAI/USER/` directory so PAI knows who you are from day one. Tell your DA: *"Help me migrate my context into PAI/USER/."* The system was designed to be operated by AI; lean on it.  
您的人工智能最应该先为您做的事情，就是将您现有的所有自定义上下文——笔记、项目状态、偏好设置、身份信息、历史记录等——全部导入到 `PAI/USER/` 目录中，这样 PAI 从一开始就知道您是谁。告诉您的 DA：“帮我将我的上下文迁移到 PAI/USER/。” 该系统专为由 AI 操作而设计；请充分利用它。

---

```
curl -sSL https://ourpai.ai/install.sh | bash
```

That's it. The installer wizard handles Bun, Git, and Claude Code verification, ElevenLabs key (optional), DA identity setup, voice picker, Pulse launchd registration, and validation. An existing `~/.claude/` is auto-backed-up to `~/.claude.backup-{TIMESTAMP}` before anything is overwritten.  
就这样。安装向导会处理 Bun、Git 和 Claude Code 的验证、ElevenLabs 密钥（可选）、DA 身份设置、语音选择器、Pulse launchd 注册以及验证。现有的 `~/.claude/` 会在任何内容被覆盖之前自动备份到 `~/.claude.backup-{TIMESTAMP}` 。

**Prefer to inspect first?** [Read the script](https://ourpai.ai/install.sh) before piping it.  
想先查看脚本？在管道传输前阅读脚本。

### Manual install (clone + run)

```
git clone https://github.com/danielmiessler/Personal_AI_Infrastructure.git
cd Personal_AI_Infrastructure/Releases/v5.0.0
cp -R .claude ~/
cd ~/.claude && ./install.sh
```

**The installer will:**

- Verify Bun, Git, and Claude Code are installed
- Prompt for your ElevenLabs API key (skippable — voice falls back to desktop notifications)  
	您的 ElevenLabs API 密钥提示（可跳过——语音将回退到桌面通知）
- Launch the DA identity wizard (name + voice + personality)  
	启动 DA 身份向导（姓名 + 声音 + 性格）
- Set up Pulse as a launchd service (`com.pai.pulse`)
- Run validation

### After install

```
open http://localhost:31337    # the Life Dashboard
```

Then run `/interview` in Claude Code. Your DA will guide you through:  
然后在 Claude Code 中运行 `/interview` 。您的 DA 会引导您完成整个过程。

1. **Phase 1 — TELOS:** Mission, Goals, Beliefs, Wisdom, Challenges, Books, Mental models, Narratives  
	第一阶段 — TELOS：使命、目标、信念、智慧、挑战、书籍、思维模型、叙事
2. **Phase 2 — IDEAL\_STATE:** What does success look like for you?  
	第二阶段 — IDEAL\_STATE：对您来说，成功是什么样子？
3. **Phase 3 — Preferences:** Tools, conventions, working style  
	第三阶段 — 偏好：工具、惯例、工作风格
4. **Phase 4 — Identity:** Final DA personality tuning  
	第四阶段 — 身份：最终调整 DA 的性格

This is the most important step. **Without TELOS, your DA has nothing to optimize against.**  
这是最重要的步骤。没有 TELOS，您的 DA 就没有优化的目标。

### Upgrading from v4.x

> [!important] Important
> v5.0.0 is a different system, not a patch. Read the **[full migration guide](https://github.com/gloria-29/Personal_AI_Infrastructure/blob/main/Releases/v5.0.0/README.md#migration-guide-from-v4x)** before installing.  
> v5.0.0 是一个全新的系统，而不是补丁。安装前请阅读完整的迁移指南。

Quick path:

```
# 1. Back up your existing installation
cp -R ~/.claude ~/.claude.backup-$(date +%Y%m%d)

# 2. Install v5.0.0 (one-liner above) or via manual clone
curl -sSL https://ourpai.ai/install.sh | bash

# 3. Open the Life Dashboard and run the interview
open http://localhost:31337
```

If you had personal content in v4.x (notes, project state, custom rules), tell your DA: *"Help me migrate my old content into the PAI/USER/ structure."* The **Migrate** skill intakes from `.md` /`.markdown` /`.txt`, Obsidian, Notion, Apple Notes — classifies each chunk against the v5 taxonomy (TELOS, KNOWLEDGE, PROJECTS, FEED, etc.) and commits with provenance.  
如果您在 v4.x 版本中有个人内容（笔记、项目状态、自定义规则），请告诉您的 DA：“帮助我将旧内容迁移到 PAI/USER/ 结构中。”迁移技能可以从 `.md` / `.markdown` / `.txt` 、Obsidian、Notion、Apple Notes 等来源获取内容，根据 v5 分类法（TELOS、KNOWLEDGE、PROJECTS、FEED 等）对每个片段进行分类，并带有出处提交。

**Post-upgrade checklist:**

- Pulse is alive: `curl -s http://localhost:31337/api/pulse/health | jq`
- Voice announces: `curl -s -X POST http://localhost:31337/notify -H "Content-Type: application/json" -d '{"message": "Hello from your DA"}'`
- Dashboard renders: `open http://localhost:31337`
- DA identity populated in `PAI/USER/DA_IDENTITY.md`
- TELOS captured under `PAI/USER/TELOS/`

---

## 📦 PAI Packs

Packs are standalone, AI-installable capabilities you can add to any AI coding harness without installing PAI. Each pack is a self-contained prompt your DA can read and execute — point it at the pack directory and say "install this," and it handles the rest.  
Packs 是独立的、可由 AI 安装的功能，您可以将其添加到任何 AI 编码工具中，而无需安装 PAI。每个 pack 都是一个自包含的提示，您的 DA 可以读取和执行——只需指向 pack 目录并说“安装这个”，其余部分由它处理。

**[Browse all packs →](https://github.com/gloria-29/Personal_AI_Infrastructure/blob/main/Packs)**

---

## ❓ FAQ

### How is PAI different from just using Claude Code?

PAI is built natively on Claude Code and designed to stay that way. We chose Claude Code because its hook system, context management, and agentic architecture are the best foundation available for personal AI infrastructure.  
PAI 原生构建在 Claude Code 之上，并旨在保持这种关系。我们选择 Claude Code，因为它的钩子系统、上下文管理和代理架构是为个人 AI 基础设施提供的最佳基础。

PAI isn't a replacement for Claude Code — it's the layer on top that makes Claude Code *yours*:  
PAI 不是 Claude Code 的替代品——它是使其成为您自己的 Claude Code 的顶层。

- **Persistent memory** — Your DA remembers past sessions, decisions, and learnings  
	持久记忆 — 您的 AI 助手会记住过往会话、决策和经验
- **Custom skills** — Specialized capabilities for the things you do most  
	自定义技能 — 针对您最常处理事务的专项能力
- **Your context** — Goals, contacts, preferences—all available without re-explaining  
	个人上下文 — 目标、联系人、偏好等信息无需重复说明即可随时调用
- **Intelligent routing** — Say "research this" and the right workflow triggers automatically  
	智能路由 — 只需说"研究这个"，就会自动触发相应工作流程
- **Self-improvement** — The system modifies itself based on what it learns  
	自我完善 — 系统会根据所学知识进行自我优化

Think of it this way: Claude Code is the engine. PAI is everything else that makes it *your* car.  
这样理解：Claude Code 是引擎。PAI 就是使这辆车成为您的车的一切其他部分。

### What's the difference between PAI and Claude Code's built-in features?PAI 和 Claude Code 内置功能有什么区别？

Claude Code provides powerful primitives — hooks, slash commands, MCP servers, context files. These are individual building blocks.  
Claude Code 提供了强大的原语——钩子、斜杠命令、MCP 服务器、上下文文件。这些是个体构建块。

PAI is the complete system built on those primitives. It connects everything together: your goals inform your skills, your skills generate memory, your memory improves future responses. PAI turns Claude Code's building blocks into a coherent personal AI platform.  
PAI 是基于这些原语的完整系统。它将所有东西连接在一起：您的目标指导您的技能，您的技能生成记忆，您的记忆改善未来的响应。PAI 将 Claude Code 的构建块转变为一个连贯的个人 AI 平台。

### Is PAI only for Claude Code?

PAI is Claude Code native. We believe Claude Code's hook system, context management, and agentic capabilities make it the best platform for personal AI infrastructure, and PAI is designed to take full advantage of those features.  
PAI 是 Claude Code 的原生版本。我们相信 Claude Code 的钩子系统、上下文管理和代理功能使其成为个人 AI 基础设施的最佳平台，而 PAI 的设计旨在充分利用这些特性。

That said, PAI's concepts (skills, memory, algorithms) are universal, and the code is TypeScript and Bash — so community members are welcome to adapt it for other platforms.  
话虽如此，PAI 的概念（技能、记忆、算法）是通用的，代码采用 TypeScript 和 Bash 编写——欢迎社区成员将其适配到其他平台。

### How is this different from fabric?

[Fabric](https://github.com/danielmiessler/fabric) is a collection of AI prompts (patterns) for specific tasks. It's focused on *what to ask AI*.  
Fabric 是一系列针对特定任务的 AI 提示（模式）的集合。它专注于如何向 AI 提问。

PAI is infrastructure for *how your DA operates* —memory, skills, routing, context, self-improvement. They're complementary. Many PAI users integrate Fabric patterns into their skills.  
PAI 是定义你的代理（DA）如何运作的基础设施——包括记忆、技能、路由、上下文和自我改进。它们是互补的。许多 PAI 用户将 Fabric 模式集成到他们的技能中。

### What if I break something?

Recovery is straightforward:

- **Back up first** — Before any upgrade: `cp -r ~/.claude ~/.claude-backup-$(date +%Y%m%d)`  
	先备份 — 任何升级前： `cp -r ~/.claude ~/.claude-backup-$(date +%Y%m%d)`
- **USER/ is safe** — Your customizations in `USER/` are never touched by the installer or upgrades  
	USER/ 是安全的 — 安装程序或升级永远不会触及 `USER/` 中的自定义内容
- **Settings merge, not overwrite** — The installer only updates identity and version fields; your hooks, statusline, and custom config are preserved  
	设置合并，而非覆盖 — 安装程序仅更新身份和版本字段；你的钩子、状态栏和自定义配置将被保留
- **Git-backed** — Version control everything, roll back when needed  
	基于 Git — 对所有内容进行版本控制，必要时可回滚
- **History is preserved** — Your DA's memory survives mistakes  
	历史得以保留 — 你的 DA 的记忆能经受住错误
- **DA can fix it** — Your DA helped build it, it can help repair it  
	DA 可以修复它 — 你的 DA 参与了构建，也能帮助修复
- **Re-install** — Run the installer again; it detects existing installations and merges intelligently  
	重新安装 — 再次运行安装程序；它会检测现有安装并智能合并

---

## 🎯 Roadmap

| Feature | Description |
| --- | --- |
| **Local Model Support** | Run PAI with local models (Ollama, llama.cpp) for privacy and cost control   使用本地模型（Ollama、llama.cpp）运行 PAI，以实现隐私和成本控制 |
| **Granular Model Routing** | Route different tasks to different models based on complexity   根据任务的复杂度将不同的任务路由到不同的模型 |
| **Remote Access** | Access your PAI from anywhere—mobile, web, other devices   随时随地访问您的 PAI——移动端、网页端或其他设备 |
| **Outbound Phone Calling** | Voice capabilities for outbound calls |
| **External Notifications** | Robust notification system for Email, Discord, Telegram, Slack   强大的通知系统，支持电子邮件、Discord、Telegram 和 Slack |

---

## 🌐 Community

**GitHub Discussions:** [Join the conversation](https://github.com/danielmiessler/Personal_AI_Infrastructure/discussions)

**Community Discord:** PAI is discussed in the [community Discord](https://danielmiessler.com/upgrade) along with other AI projects  
社区 Discord：PAI 在社区的 Discord 频道中与其他 AI 项目一起讨论。

**Twitter/X:** [@danielmiessler](https://twitter.com/danielmiessler)

**Blog:** [danielmiessler.com](https://danielmiessler.com/)

### Star History

[

![Star History Chart](https://github.com/gloria-29/OB-assets/releases/download/img-f7/f75e3e52d4094fe92d5ee2bb0de1fc50879f481b890007811b8a7d140456aa0d.svg)

](https://star-history.com/#danielmiessler/Personal_AI_Infrastructure&Date)

---

## 🤝 Contributing

We welcome contributions! See our [GitHub Issues](https://github.com/danielmiessler/Personal_AI_Infrastructure/issues) for open tasks.  
我们欢迎贡献！请查看我们的 GitHub Issues 以获取开放任务。

1. **Fork the repository**
2. **Make your changes** — Bug fixes, new skills, documentation improvements  
	进行你的修改——修复 bug、新增技能、完善文档
3. **Test thoroughly** — Install in a fresh system to verify  
	彻底测试——在全新系统中安装以验证
4. **Submit a PR** with examples and testing evidence

---

## 📜 License

MIT License - see [LICENSE](https://github.com/gloria-29/Personal_AI_Infrastructure/blob/main/LICENSE) for details.

---

## 🙏 Credits

**Anthropic and the Claude Code team** — First and foremost. You are moving AI further and faster than anyone right now. Claude Code is the foundation that makes all of this possible.  
Anthropic 和 Claude Code 团队——首先，非常感谢你们。你们正在将 AI 向前推进，速度超过任何人。Claude Code 是所有这一切的基础。

**[IndyDevDan](https://www.youtube.com/@indydevdan)** — For great videos on meta-prompting and custom agents that have inspired parts of PAI.  
IndyDevDan——感谢他关于元提示和自定义代理的精彩视频，启发了 PAI 的某些部分。

### Contributors

**[fayerman-source](https://github.com/fayerman-source)** — Google Cloud TTS provider integration and Linux audio support for the voice system.  
fayerman-source——Google Cloud TTS 提供程序集成以及语音系统的 Linux 音频支持。

**Matt Espinoza** — Extensive testing, ideas, and feedback for the PAI 2.3 release, plus roadmap contributions.  
Matt Espinoza——对 PAI 2.3 版本的广泛测试、想法和反馈，以及对路线图的贡献。

---

## 💜 Support This Project

**PAI is free and open-source forever. If you find it valuable, you can [sponsor the project](https://github.com/sponsors/danielmiessler).  
PAI 永远免费且开源。如果你觉得它有价值，可以赞助该项目。**

---

- [The Real Internet of Things](https://danielmiessler.com/blog/the-real-internet-of-things) — The vision behind PAI  
	真正的物联网——PAI 背后的愿景
- [AI's Predictable Path: 7 Components](https://danielmiessler.com/blog/ai-predictable-path-7-components-2024) — Visual walkthrough of where AI is heading  
	AI 的确定性路径：7 个组成部分——AI 发展方向的视觉化解析
- [Building a Personal AI Infrastructure](https://danielmiessler.com/blog/personal-ai-infrastructure) — Full PAI walkthrough with examples  
	构建个人人工智能基础设施——完整的 PAI 使用指南与示例

---

**📜 Update History**

**v5.0.0 (2026-04-30) — Life Operating System  
v5.0.0（2026 年 4 月 30 日）——生命操作系统**

- **Pulse** — unified daemon (port 31337): voice, hooks, observability, cron, Life Dashboard (22 routes), wiki API, optional Telegram/iMessage bridges. Replaces every previous loose service.  
	脉冲 — 统一守护进程（端口 31337）：语音、钩子、可观测性、定时任务、生命仪表盘（22 条路由）、维基 API，可选的 Telegram/iMessage 桥接。取代之前所有松散的服务。
- **The DA** — Digital Assistant identity layer. PRINCIPAL\_IDENTITY + DA\_IDENTITY pair, loaded at session start. `/interview` walks you through naming your DA, picking a voice, capturing TELOS.  
	DA — 数字助理身份层。PRINCIPAL\_IDENTITY + DA\_IDENTITY 配对，在会话启动时加载。 `/interview` 将引导您为您的 DA 命名、选择语音并捕获 TELOS。

---

- **Algorithm v6.3.0** — seven-phase loop (OBSERVE → THINK → PLAN → BUILD → EXECUTE → VERIFY → LEARN). Sonnet-backed mode classifier picks MINIMAL/NATIVE/ALGORITHM and tier (E1–E5) per prompt. Closed-list thinking capabilities. Voice phase announcements.  
	算法 v6.3.0 — 七阶段循环（观察 → 思考 → 规划 → 构建 → 执行 → 验证 → 学习）。Sonnet 支持的分类器根据提示选择最小/本地/算法模式及等级（E1–E5）。封闭式思维能力列表。语音阶段公告。  
	Verification doctrine (live-probe, advisor calls at commitment boundaries, cross-vendor audit at E4/E5).  
	验证原则（实时探测、在承诺边界处调用顾问、E4/E5 阶段跨厂商审计）。

---

- **The ISA** — Ideal State Artifact primitive.  
	ISA —— 理想状态工件原语。  
	One document, twelve sections (Problem → Vision → Out of Scope → Principles → Constraints → Goal → Criteria → Test Strategy → Features → Decisions → Changelog → Verification), five identities (articulation, test harness, build verification, done condition, system of record).  
	一份文档，十二个章节（问题 → 愿景 → 范围外 → 原则 → 约束 → 目标 → 标准 → 测试策略 → 功能 → 决策 → 变更日志 → 验证），五种身份（阐述、测试工具、构建验证、完成条件、记录系统）。  
	Owned by the **ISA skill** (Scaffold, Interview, CheckCompleteness, Reconcile, Seed, Append) with a dozen reference examples spanning E1–E5.  
	由 ISA 技能（搭建、访谈、检查完整性、协调、播种、追加）拥有，附带从 E1 到 E5 的十二个参考示例。

---

- **Containment + release tooling** — privacy is structural. `containment-zones.ts` declares every directory's privacy zone; `ContainmentGuard` PreToolUse hook blocks cross-zone leaks; 12 security gates run on every public release; two-stage release (stage → publish) never auto-chains.  
	包含与发布工具链 —— 隐私是结构性的。 `containment-zones.ts` 声明每个目录的隐私区域； `ContainmentGuard` PreToolUse 钩子阻止跨区域泄露；每次公开发布时运行 12 道安全门；两阶段发布（预发布 → 发布）绝不自动串联。
- **Memory v7.6** — structured by purpose: WORK (active task ISAs), KNOWLEDGE (typed graph: People, Companies, Ideas, Research, Blogs), LEARNING (meta-patterns), RELATIONSHIP (DA-Principal notes), OBSERVABILITY (every tool call + hook firing + satisfaction signal), STATE (session registry).  
	Memory v7.6 —— 按用途结构化：WORK（活跃任务 ISA）、KNOWLEDGE（类型化图谱：人员、公司、理念、研究、博客）、LEARNING（元模式）、RELATIONSHIP（DA-Principal 笔记）、OBSERVABILITY（每次工具调用 + 钩子触发 + 满意度信号）、STATE（会话注册表）。
- **45 public skills, 171 workflows, 37 hooks** — skills are self-activating composable domain units; hooks fire across SessionStart, UserPromptSubmit, PreToolUse, PostToolUse, Stop, SubagentStop, PreCompact, SessionEnd.  
	45 个公共技能，171 个工作流，37 个钩子 —— 技能是自激活的可组合领域单元；钩子在 SessionStart、UserPromptSubmit、PreToolUse、PostToolUse、Stop、SubagentStop、PreCompact、SessionEnd 等事件上触发。
- **One-line installer** — `curl -sSL https://ourpai.ai/install.sh | bash`. Auto-backs-up existing `~/.claude/`, runs the DA identity wizard, registers Pulse as a launchd service, validates.  
	单行安装器 —— `curl -sSL https://ourpai.ai/install.sh | bash` 。自动备份现有的 `~/.claude/` ，运行 DA 身份向导，将 Pulse 注册为 launchd 服务，并验证。
- [Full release notes + migration guide](https://github.com/gloria-29/Personal_AI_Infrastructure/blob/main/Releases/v5.0.0/README.md)

**v4.0.3 (2026-03-01) — Community PR Patch  
v4.0.3（2026 年 3 月 1 日）—— 社区 PR 补丁**

- JSON array parsing fix in Inference.ts
- 29 dead references removed from CONTEXT\_ROUTING.md  
	从 CONTEXT\_ROUTING.md 中删除了 29 个死引用
- WorldThreatModelHarness PAI\_DIR portability
- User context migration for v2.5/v3.0 upgraders
- [Release Notes](https://github.com/gloria-29/Personal_AI_Infrastructure/blob/main/Releases/v4.0.3/README.md)

**v4.0.2 (2026-03-01) — Bug Fix Patch  
v4.0.2（2026 年 3 月 1 日）——错误修复补丁 v4.0.1（2026 年 2 月 28 日）——升级路径与偏好设置 %% v4.0.0（2026 年 2 月 27 日）——精简高效 %% v3.0.0（2026 年 2 月 15 日）——算法成熟 %% v2.5.0（2026 年 1 月 30 日）——深度思考，快速执行 %% v2.4.0（2026 年 1 月 23 日）——算法核心 %% v2.3.0（2026 年 1 月 15 日）——完整发布回归 %% v2.1.1（2026 年 1 月 9 日）——MEMORY 系统迁移 %% v2.1.0（2025 年 12 月 31 日）——模块化架构 %% v2.0.0（2025 年 12 月 28 日）——PAI v2 正式发布**

- 13 surgical fixes: Linux compatibility, installer, statusline, hooks  
	13 个外科手术式修复：Linux 兼容性、安装程序、状态栏、钩子
- Cross-platform OAuth token extraction, GNU coreutils tr fix  
	跨平台 OAuth 令牌提取，GNU coreutils tr 修复
- Inference guard (~15s savings), lineage tracking, dead code removal  
	推理守卫（节省约 15 秒），血统追踪，死代码移除
- [Release Notes](https://github.com/gloria-29/Personal_AI_Infrastructure/blob/main/Releases/v4.0.2/README.md)

**v4.0.1 (2026-02-28) — Upgrade Path & Preferences**

- Upgrade documentation with backup, merge, and post-upgrade checklist  
	升级文档：备份、合并和升级后检查清单
- Configurable temperature unit (Fahrenheit/Celsius) in statusline and installer  
	状态栏和安装程序中可配置的温度单位（华氏度/摄氏度）
- FAQ fixes: removed stale Python reference, improved recovery guidance  
	常见问题解答修复：删除过时的 Python 引用，改进恢复指南
- [Release Notes](https://github.com/gloria-29/Personal_AI_Infrastructure/blob/main/Releases/v4.0.1/README.md)

**v4.0.0 (2026-02-27) — Lean and Mean  
v4.0.0（2026 年 2 月 27 日）——精简高效**

- 38 flat skill directories → 12 hierarchical categories (-68% top-level dirs)  
	38 个扁平技能目录 → 12 个层级分类（顶级目录减少 68%）
- Dead systems removed: Components/, DocRebuild, RebuildSkill  
	已移除死系统：Components/、DocRebuild、RebuildSkill
- CLAUDE.md template system with BuildCLAUDE.ts + SessionStart hook  
	CLAUDE.md 模板系统，配合 BuildCLAUDE.ts + SessionStart 钩子
- Algorithm v3.5.0 (up from v1.4.0)
- Comprehensive security sanitization (33+ files cleaned)  
	全面的安全清理（33+ 个文件被清理）
- All version refs updated, Electron crash fix
- 63 skills, 21 hooks, 180 workflows, 14 agents
- [Release Notes](https://github.com/gloria-29/Personal_AI_Infrastructure/blob/main/Releases/v4.0.0/README.md)

**v3.0.0 (2026-02-15) — The Algorithm Matures**

- Algorithm v1.4.0 with constraint extraction and build drift prevention  
	算法 v1.4.0，具备约束提取和构建漂移预防功能
- Persistent PRDs and parallel loop execution
- Full installer with GUI wizard
- 10 new skills, agent teams/swarm, voice personality system  
	新增 10 项技能、代理团队/蜂群、语音人格系统
- 38 skills, 20 hooks, 162 workflows
- [Release Notes](https://github.com/gloria-29/Personal_AI_Infrastructure/blob/main/Releases/v3.0/README.md)

**v2.5.0 (2026-01-30) — Think Deeper, Execute Faster  
v2.5.0（2026-01-30）—— 深度思考，快速执行**

- Two-Pass Capability Selection: Hook hints validated against ISC in THINK phase  
	双阶段能力选择：THINK 阶段将 Hook 提示与 ISC 进行验证
- Thinking Tools with Justify-Exclusion: Opt-OUT, not opt-IN for Council, RedTeam, FirstPrinciples, etc.  
	思维工具带理由排除：Opt-OUT 而非 Opt-IN，适用于 Council、RedTeam、FirstPrinciples 等
- Parallel-by-Default Execution: Independent tasks run concurrently via parallel agent spawning  
	默认并行执行：通过并行代理生成实现独立任务的并发运行
- 28 skills, 17 hooks, 356 workflows
- [Release Notes](https://github.com/gloria-29/Personal_AI_Infrastructure/blob/main/Releases/v2.5/README.md)

**v2.4.0 (2026-01-23) — The Algorithm**

- Universal problem-solving system with ISC (Ideal State Criteria) tracking  
	通用问题解决系统，配备 ISC（理想状态标准）跟踪
- 29 skills, 15 hooks, 331 workflows
- Euphoric Surprise as the outcome metric
- Enhanced security with AllowList enforcement
- [Release Notes](https://github.com/gloria-29/Personal_AI_Infrastructure/blob/main/Releases/v2.4/README.md)

**v2.3.0 (2026-01-15) — Full Releases Return**

- Complete `.claude/` directory releases with continuous learning  
	完整的 `.claude/` 目录发布，支持持续学习
- Explicit and implicit rating capture
- Enhanced hook system with 14 production hooks
- Status line with learning signal display
- [Release Notes](https://github.com/gloria-29/Personal_AI_Infrastructure/blob/main/Releases/v2.3/README.md)

**v2.1.1 (2026-01-09) — MEMORY System Migration**

- History system merged into core as MEMORY System

**v2.1.0 (2025-12-31) — Modular Architecture  
v2.1.0 (2025-12-31) — 模块化架构**

- Source code in real files instead of embedded markdown  
	源代码位于实际文件中，而非嵌入的 Markdown 中

**v2.0.0 (2025-12-28) — PAI v2 Launch**

---

**Built with ❤️ by [Daniel Miessler](https://danielmiessler.com/) and the PAI community  
用 ❤️ 由 Daniel Miessler 和 PAI 社区共同打造**

*Augment yourself.*

# 高亮内容

- 