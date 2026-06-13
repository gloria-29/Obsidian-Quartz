---
tags: [ai-infrastructure, agent, personal-ai, life-os, claude-code]
created: 2026-05-18
updated: 2026-05-19
type: entity
sources:
  - raw/articles/2026-05-18-20260517-personal-ai-infrastructure.md
---

# PAI

> 个人人工智能基础设施（Personal AI Infrastructure），由 Daniel Miessler 创建、gloria-29 fork 并维护，构建于 Claude Code 之上的 Life OS 智能体系统。

## 概述

PAI（Personal AI Infrastructure）是一个**生活操作系统（Life Operating System）**，旨在捕捉用户的身份、关注点和目标，并通过了解用户的 AI 助手帮助其实现理想状态。PAI v5.0.0（2026-04-30 发布）是历史上最大的版本更新，从"AI 脚手架"进化为完整的生活操作系统。

PAI 构建在 [[Claude Code]] 之上——Claude Code 是引擎，PAI 是使其成为"您的车"的顶层，提供持久记忆、自定义技能、个人上下文、智能路由和自我改进。

## 核心设计原则

1. **以人为本，技术次之**：技术存在的目的是改善人们的生活，而非相反。每个设计决策始于一个问题：这对操作者有什么帮助？
2. **生活操作系统**：PAI 不只是 AI 工具——它关注目标、工作、人际关系、健康和财务，帮助用户追求全方位的理想状态
3. **理想状态驱动**：AI 最大的挑战在于定义"好"或"完成"。PAI 通过 ISA（理想状态工件）明确"完成"的样子，并通过 ISC（理想状态标准）进行分解验证
4. **单一数字助理界面**：每人一个 DA（Digital Assistant），作为与所有 AI 交互的主要接口，动态创建所需界面，以用户的终极目标（Telos）为导向
5. **文本优先于不透明存储**：强偏好纯文本和 Markdown，避免 SQLite/Postgres 等不透明存储。一切均可通过 `cat` 和 `rg` 读取
6. **上下文脚手架 > 模型本身**：PAI 本质上是为智能模型提供正确上下文的系统，模型的重要性低于其周围的上下文
7. **无 RAG 的文件系统**：自 2025 年 6 月起避免 RAG，通过富文本、交叉引用和快速搜索（ripgrep）利用文件系统作为上下文索引
8. **苦药工程学（Bitter-pilled engineering）**：模型越强，需要的指令越少。持续审计以移除过度规定性的方向指导——系统随模型变大而变小

## 系统架构（v5.0.0 三层架构）

### 第一层：PAI — 操作系统本身

核心组件包括技能（Skills）、记忆（Memory）、核心算法（Algorithm）、Telos 文件和身份文件。

### 第二层：Pulse — 生命仪表盘

- **地址**：`localhost:31337`
- **角色**：统一守护进程（daemon），取代之前所有松散服务
- **能力**：语音、钩子（hooks）、可观测性（observability）、定时任务（cron）、生命仪表盘（22 条路由）、wiki API
- **可选桥接**：Telegram / iMessage 桥接
- **安装后访问**：`open http://localhost:31337`

### 第三层：The DA — 数字助理

- 用户的 AI 声音和个性，主要交互接口
- PRINCIPAL_IDENTITY + DA_IDENTITY 配对，会话启动时加载
- 通过 `/interview` 命令引导用户完成设置
- 互动式设置流程包括：命名 DA、选择语音、捕获 TELOS

## Algorithm v6.3.0 — 七阶段循环引擎

算法是 PAI 的"引力中心"——所有非平凡任务都经它处理。基于科学方法建模，采用 David Deutsch 的"难以变更的解释"作为"优质"标准。

### 七个阶段

| 阶段 | 名称 | 说明 |
|------|------|------|
| 1 | OBSERVE（观察） | 感知当前状态和环境 |
| 2 | THINK（思考） | 分析信息，运用思维技能库 |
| 3 | PLAN（规划） | 制定从当前状态到理想状态的路径 |
| 4 | BUILD（构建） | 实施计划，创建工件 |
| 5 | EXECUTE（执行） | 运行构建成果 |
| 6 | VERIFY（验证） | 对照 ISC 验证结果 |
| 7 | LEARN（学习） | 提取经验，改进系统 |

### 模式分类器

Sonnet 驱动的模式分类器根据每个提示自动选择执行模式：

| 模式 | 适用场景 |
|------|---------|
| MINIMAL（最小） | 简单问答、直接回复 |
| NATIVE（本地） | 中等复杂度任务 |
| ALGORITHM（算法） | 复杂、多步骤任务 |

### 执行等级（Tier E1–E5）

| 等级 | 描述 |
|------|------|
| E1 | 快速执行，单一验证 |
| E2 | 标准执行，基本验证 |
| E3 | 深度执行，多项验证 |
| E4 | 交叉厂商审计（cross-vendor audit） |
| E5 | 最高级别，全面验证 + 外部审计 |

### 验证原则

- 实时探测（live-probe）
- 在承诺边界处调用顾问（advisor calls at commitment boundaries）
- E4/E5 阶段跨厂商审计（cross-vendor audit）

## ISA（理想状态工件）— 12 章节 + 5 身份

ISA 类似软件 PRD，但适用于所有创造性任务——从设计到艺术到哲学到工程到战略。

### 12 个章节

1. **Problem（问题）** — 定义要解决的问题
2. **Vision（愿景）** — 理想状态的样子
3. **Out of Scope（范围外）** — 明确不做什么
4. **Principles（原则）** — 指导决策的原则
5. **Constraints（约束）** — 时间、资源、技术限制
6. **Goal（目标）** — 具体的可量化目标
7. **Criteria（标准/ISC）** — 理想状态标准，用于验证
8. **Test Strategy（测试策略）** — 如何验证
9. **Features（功能）** — 实现目标所需的功能
10. **Decisions（决策）** — 关键决策记录
11. **Changelog（变更日志）** — 版本变更记录
12. **Verification（验证）** — 验证结果

### 5 种身份

1. **Articulation（阐述）** — 清晰表达理想状态
2. **Test Harness（测试工具）** — 构建验证框架
3. **Build Verification（构建验证）** — 确保构建质量
4. **Done Condition（完成条件）** — 定义"完成"的标准
5. **System of Record（记录系统）** — 维护所有记录的权威来源

### ISA 技能操作

由 ISA skill 拥有，提供 Scaffold（搭建）、Interview（访谈）、CheckCompleteness（检查完整性）、Reconcile（协调）、Seed（播种）、Append（追加）等操作，附带从 E1 到 E5 的 12 个参考示例。

## Memory v7.6 — 三层次结构化记忆

基于文本的记忆系统，按用途结构化，捕捉所做、所学和值得保留的内容，作为未来工作的输入。

### 六层结构

| 层级 | 名称 | 存储内容 |
|------|------|---------|
| WORK | 工作 | 活跃任务 ISA |
| KNOWLEDGE | 知识 | 类型化图谱（人员、公司、理念、研究、博客） |
| LEARNING | 学习 | 元模式（跨任务的通用经验） |
| RELATIONSHIP | 关系 | DA-Principal 笔记 |
| OBSERVABILITY | 可观测性 | 每次工具调用 + 钩子触发 + 满意度信号 |
| STATE | 状态 | 会话注册表 |

## 思维技能库（Thinking Skills）

一套自定义思维能力，算法从中调用以提升系统决策质量：

- **第一性原理（First Principles）**：分解到最基本真理再重构
- **专家辩论（Council Debates）**：模拟多方专家辩论
- **红队分析（Red Team）**：从对立面挑战假设
- **根因分析（Root Cause）**：追溯问题根本原因
- **系统思考（Systems Thinking）**：理解组件间的相互依赖
- **迭代深度探索（Iterative Depth）**：逐层深入分析
- **视角切换（Aperture Oscillation）**：在不同抽象层次间切换

## 技能生态系统

### 技能层级结构

```
code → CLI → workflows → SKILL.md（路由入口）
```

技能偏向确定性代码执行，提示词包裹代码，而非代码包裹提示词。

### v5.0.0 技能统计

| 类型 | 数量 |
|------|------|
| 公共技能（Public Skills） | 45 |
| 工作流（Workflows） | 171 |
| 钩子（Hooks） | 37 |

### 钩子触发事件

钩子在以下 8 个事件上触发：SessionStart、UserPromptSubmit、PreToolUse、PostToolUse、Stop、SubagentStop、PreCompact、SessionEnd。

## 结构化隐私 — Containment Zones

- `containment-zones.ts` 声明每个目录的隐私区域
- `ContainmentGuard` PreToolUse 钩子阻止跨区域数据泄露
- 12 道安全门在每次公开发布时运行
- 两阶段发布（stage → publish）绝不自动串联

## 一键安装器

```bash
curl -sSL https://ourpai.ai/install.sh | bash
```

安装器自动处理：
- Bun、Git、Claude Code 验证
- ElevenLabs 密钥（可选，语音可回退到桌面通知）
- DA 身份设置向导
- Pulse 注册为 launchd 服务（`com.pai.pulse`）
- 现有 `~/.claude/` 自动备份到 `~/.claude.backup-{TIMESTAMP}`

## /interview 四阶段设置

安装后在 Claude Code 中运行 `/interview`，DA 将引导：

1. **Phase 1 — TELOS**：使命、目标、信念、智慧、挑战、书籍、思维模型、叙事
2. **Phase 2 — IDEAL_STATE**：成功是什么样子？
3. **Phase 3 — Preferences**：工具、惯例、工作风格
4. **Phase 4 — Identity**：最终 DA 性格调整

> ⚠️ 这是最重要的步骤——没有 TELOS，DA 就没有优化的目标。

## PAI 与 Claude Code 的关系

| 维度 | Claude Code | PAI |
|------|-------------|-----|
| 角色 | 引擎 | 使其成为"您的车"的顶层 |
| 记忆 | 会话级别 | 持久记忆，跨会话 |
| 技能 | MCP 工具 | 自定义技能 + 171 工作流 |
| 上下文 | 项目级别 | 个人上下文（目标、联系人、偏好） |
| 路由 | 手动 | 智能路由（"研究这个"自动触发工作流） |
| 自我改进 | 无 | 系统根据学习进行自我优化 |

## 安装后验证清单

- Pulse 存活：`curl -s http://localhost:31337/api/pulse/health | jq`
- 语音通知：`curl -s -X POST http://localhost:31337/notify ...`
- 仪表盘渲染：`open http://localhost:31337`
- DA 身份填充：`PAI/USER/DA_IDENTITY.md`
- TELOS 捕获：`PAI/USER/TELOS/`

## PAI Packs

Packs 是独立的、可由 AI 安装的功能模块，无需安装完整 PAI 即可添加到任何 AI 编码工具。每个 pack 是一个自包含的提示——指向 pack 目录说"安装这个"，AI 处理其余部分。

## 发展路线图

| 特性 | 描述 |
|------|------|
| 本地模型支持 | 通过 Ollama/llama.cpp 运行 PAI，实现隐私和成本控制 |
| 细粒度模型路由 | 根据复杂度将不同任务路由到不同模型 |
| 远程访问 | 移动端、网页端或其他设备远程访问 PAI |
| 对外电话呼叫 | 语音拨打能力 |
| 外部通知 | 邮件、Discord、Telegram、Slack 通知集成 |

## 版本历史

| 版本 | 日期 | 亮点 |
|------|------|------|
| v5.0.0 | 2026-04-30 | Life OS：Pulse 守护进程、DA 身份、Algorithm v6.3.0、ISA 原语、45 技能 |
| v4.0.3 | 2026-03-01 | 社区 PR 补丁 |
| v4.0.2 | 2026-03-01 | 13 个外科手术式修复 |
| v4.0.1 | 2026-02-28 | 升级路径与偏好设置 |
| v4.0.0 | 2026-02-27 | 精简高效：38→12 分类，63 技能/21 钩子/180 工作流 |
| v3.0.0 | 2026-02-15 | 算法成熟、GUI 安装向导 |
| v2.0.0 | 2025-12-28 | PAI v2 正式发布 |

## 关系

- 相关页面：[[Claude Code]], [[MCP]], [[MCP Gateway]], [[GenericAgent]]
- 构建基础：PAI 建立在 [[Claude Code]] 之上，利用其钩子系统、上下文管理和代理架构
- 协议集成：可通过 [[MCP Gateway]] 调用远程 MCP 技能
- 设计对比：PAI 的 Skill 系统偏向确定性代码执行，与 [[GenericAgent]] 的 SOP 驱动 Skill Hub 概念互补
- 技能生态：Fabric 模式可集成到 PAI 技能中
- 模型路由：未来支持细粒度模型路由，可结合 [[DeepSeek V4]] 等模型

## 来源参考

- GitHub: gloria-29/Personal_AI_Infrastructure（fork from danielmiessler/Personal_AI_Infrastructure）
- 安装入口：https://ourpai.ai/install.sh
- 演示视频：https://youtu.be/Le0DLrn7ta0
- 博客：《真正的物联网》https://danielmiessler.com/blog/the-real-internet-of-things
