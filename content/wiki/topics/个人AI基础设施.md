---
tags: [ai, personal, infrastructure, concept, pai]
created: 2026-05-19
updated: 2026-05-19
type: concept
sources:
  - "2026-05-18-20260517-personal-ai-infrastructure"
  - "2026-05-18-20260427-genericagent教程"
  - "2026-05-18-20260428-openclaw-hermes-nocturne-notion"
  - "2026-05-18-20260428-本地-mcp-gateway"
---

# 个人AI基础设施

> 个人 AI 基础设施（PAI）是构建在 AI 模型之上的"生活操作系统"，通过记忆、身份、算法和工具的深度整合，让 AI 真正了解并服务于个人。

## 核心概念

[[PAI]]（Personal AI Infrastructure）不是又一个 AI 工具——它是一个 **生活操作系统**（Life Operating System），旨在捕捉用户是谁、关心什么、想去哪里，然后通过了解用户的 AI 助手的帮助实现这些目标。

PAI 分为三个层级：
- **PAI** — 操作系统本身：技能、记忆、算法、Telos（终极目标）、身份文件
- **Pulse** — 生命仪表盘：在 `localhost:31337` 上可视化的状态、目标和作品
- **The DA** — 数字助理：用户的 AI 声音和个性，是主要交互接口

## 主要内容

### 核心组件

#### The DA（Digital Assistant）
每人一个数字助理，作为与所有 AI 交互的主要接口。DA 能动态创建所需界面，以用户的"终极目标"（Telos）为导向。

#### Pulse（生命仪表盘）
运行在 `localhost:31337` 的统一守护进程，提供状态可视化、语音交互、钩子系统、可观测性、定时任务和 Wiki API。

#### Algorithm v6.3.0
七阶段循环算法：**观察 → 思考 → 规划 → 构建 → 执行 → 验证 → 学习**。该算法驱动从当前状态到理想状态的转变，根据任务提示自动选择模式（Mode）和等级（Tier）。

#### ISA（Ideal State Artifact）
理想状态工件原语，类似于软件 PRD 但适用于所有创意任务。ISA 包含 12 个章节和 5 种身份，将"完成的样子"分解为可验证的 ISC（理想状态标准）。

#### Memory v7.6
基于文本的三层记忆系统：
- **WORK**：工作记忆
- **KNOWLEDGE**：知识记忆
- **LEARNING**：学习记忆
- 另有 RELATIONSHIP、OBSERVABILITY 和 STATE 子类型
- 构建类型化图谱，纯文本优先，避免 SQLite/Postgres

### 设计原则

- **人本第一，技术次之**：每个设计决策始于"这对操作者有什么帮助"
- **理想状态驱动**：AI 最大的未解难题是定义"好"或"完成"，PAI 通过 ISA 解决
- **文本优先**：所有内容透明可解析（可用 `cat` 读取）
- **上下文 > 模型**：模型本身的重要性低于其周围的上下文
- **Bitter-pilled 工程**：随着模型变强，系统反而变小（移除过多指令）

### 与其他工具的区别

- **vs [[Claude Code]]**：Claude Code 是引擎，PAI 是使引擎成为"您的车"的顶层
- **vs [[GenericAgent]]**：GA 是通用 Agent 框架，PAI 是围绕个人生活的操作系统
- **vs Fabric**：Fabric 是特定任务的 AI 提示集合，PAI 是 DA 运作的基础设施

### v5.0.0 版本亮点（2026-04-30）

- Pulse 统一守护进程 + Life Dashboard
- The DA 数字助理身份层（交互式 `/interview` 设置）
- Algorithm v6.3.0 七阶段循环
- ISA 理想状态工件原语
- 包含与发布工具链（结构化隐私机制）
- Memory v7.6 按用途结构化的记忆系统
- 45 个公共技能、171 个工作流、37 个钩子

## 关键资源

- [[PAI]] - 个人 AI 基础设施主实体
- [[Pulse]] - 生命仪表盘守护进程
- [[The DA]] - 数字助理实体
- [[ISA]] - 理想状态工件
- [[PAI Memory v7.6]] - 三层记忆系统

## 相关页面

- [[AI Agent框架]] - 与 PAI 对比的 Agent 框架
- [[AI记忆方案]] - PAI 中使用的记忆架构
- [[MCP协议与工具生态系统]] - PAI 的工具集成协议
- [[知识库构建方法论]] - PAI 的 Wiki 和知识管理
- [[GenericAgent]] - 替代/互补框架
- [[Claude Code]] - PAI 的底层引擎
