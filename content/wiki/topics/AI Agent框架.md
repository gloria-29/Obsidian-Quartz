---
tags: [ai, agent, framework, concept]
created: 2026-05-19
updated: 2026-05-19
type: concept
sources:
  - "2026-05-18-20260427-genericagent教程"
  - "2026-05-18-20260517-personal-ai-infrastructure"
  - "2026-05-18-20260428-chatplus"
  - "2026-05-18-20260428-openclaw-hermes-nocturne-notion"
  - "2026-05-18-20251109-mtga赋能trae"
---

# AI Agent框架

> 构建 AI Agent 的主流框架对比与选型指南，涵盖 GenericAgent、PAI、Claude Code、Codex、ChatPlus 等方案的架构设计与适用场景。

## 核心概念

AI Agent 框架是为构建自主 AI 代理（Agent）提供基础设施的软件系统。区别于简单的 LLM 对话接口，Agent 框架通常包含**工具调用、记忆管理、任务规划、人机协作**等核心能力。

当前主流框架可大致分为三类：
- **通用 Agent 平台**：如 [[GenericAgent]]，提供完整的 Agent 运行环境、Skill 生态和 GUI
- **个人 AI 基础设施**：如 [[PAI]]，基于 [[Claude Code]] 构建的生活操作系统
- **浏览器端 Agent 增强**：如 [[ChatPlus]]，通过 MCP 协议为 Web 聊天界面注入工具能力

## 主要内容

### GenericAgent (GA)

[[GenericAgent]] 是一个开源通用 Agent 框架，其核心设计理念是 **SOP 即 Skill**。在 GA 中，一份标准化操作流程（SOP）文档就是一个 Skill。GA 支持多模型切换、Mixin Failover 自动切换、以及三级记忆架构（L1 索引 → L2 工作记忆 → L3 SOP/经验存储）。

关键特性：
- **阶段自动转换**：Agent 在任务执行中可主动将经验蒸馏为 SOP 写入 L3 层，后续同类任务自动切换到 SOP 执行模式
- **自定义 Skill Hub**：可将 Skill Search 指向外部或自建 Skill 库
- **丰富的 API 渠道支持**：Anthropic、OpenAI、智谱、Kimi、DeepSeek 等十余种

### PAI（Personal AI Infrastructure）

[[PAI]] 是构建在 [[Claude Code]] 之上的一层个人 AI 基础设施，其定位是"生活操作系统"而非单纯的 Agent 工具。核心组件包括：
- **The DA**：每个人的数字助理，是用户与 AI 交互的唯一主界面
- **Pulse**：本地 `localhost:31337` 运行的生命仪表盘守护进程
- **Algorithm v6.3.0**：七阶段循环算法（观察→思考→规划→构建→执行→验证→学习）
- **ISA 原语**：理想状态工件（Ideal State Artifact），类似 PRD 但适用于所有创意任务
- **Memory v7.6**：三层记忆系统（WORK、KNOWLEDGE、LEARNING）

PAI 的设计哲学强调"人本第一，技术次之"，目标是让 AI 放大每个人的能力。

### ChatPlus

[[ChatPlus]] 是一个浏览器扩展，通过在受支持的聊天站点注入指令、拦截请求来增强网页端 AI 能力。其核心区别在于：MCP 工具在受控运行时中以可编程接口暴露，而非不透明的远程调用。

### 框架选型对比

| 维度 | GenericAgent | PAI | ChatPlus |
|------|-------------|-----|----------|
| 定位 | 通用 Agent 框架 | 生活操作系统 | 浏览器增强工具 |
| 底基模型 | 多模型 | Claude Code | 网页 AI 模型 |
| 记忆系统 | 三级 L1/L2/L3 | Memory v7.6 | 依赖 MCP |
| 工具生态 | SOP/Skill | 45+ 技能 | MCP 工具 |
| 适用用户 | 开发者、研究者 | 个人知识工作者 | 日常使用用户 |

## 关键资源

- [[GenericAgent]] 教程与安装指南
- [[PAI]] v5.0.0 版本说明
- [[ChatPlus]] MCP 工具集成
- [[Claude Code]] 底层引擎能力

## 相关页面

- [[AI记忆方案]] - Agent 的记忆层解决方案
- [[MCP协议与工具生态系统]] - Agent 的工具调用协议
- [[个人AI基础设施]] - 更深度的个人化 AI 系统
- [[GenericAgent]] - 通用 Agent 框架实体
- [[PAI]] - 个人 AI 基础设施实体
- [[ChatPlus]] - 浏览器 Agent 增强工具
