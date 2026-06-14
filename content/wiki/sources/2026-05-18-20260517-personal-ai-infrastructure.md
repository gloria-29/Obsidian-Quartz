---
tags: [PAI, Claude Code, 个人AI, 生活操作系统, 数字助理, 开源]
created: 2026-05-17
updated: 2026-06-13
sources:
  - https://github.com/gloria-29/Personal_AI_Infrastructure
---
# Personal AI Infrastructure (PAI) — 个人 AI 基础设施

## 概要
PAI（Personal AI Infrastructure）是由 Daniel Miessler 发起的开源项目，定位为"生活操作系统"。它构建在 Claude Code 之上，通过技能、记忆、算法和数字助理（DA）四个层级，帮助用户定义理想状态并持续向其迭代。v5.0.0 是当前最大版本更新，集成了 Pulse 生命仪表盘、ISA 原语、Algorithm v6.3.0 等核心模块。

## 核心内容

### 三层架构
- **PAI 操作系统层**：技能（45 个公共技能、171 个工作流、37 个钩子）、记忆系统（Memory v7.6）、核心算法、Telos 文件和身份文件
- **Pulse 生命仪表盘**：运行在 `localhost:31337` 的统一守护进程，提供状态/目标/工作可视化，集成语音、钩子、可观测性、定时任务和 Wiki API
- **The DA（数字助理）**：用户的 AI 人格和交互接口，通过 `/interview` 设置身份、语音和 Telos

### 核心理念
- **以人为本，技术次之**：技术服务于改善生活，每个设计决策都从"这对使用者有什么帮助"出发
- **理想状态驱动**：通过 ISA（理想状态工件）明确"完成"的样子，分解为 ISC（理想状态标准）进行验证
- **上下文优先于模型**：PAI 本质上是为最聪明的模型提供正确上下文的系统
- **透明存储**：强烈偏向纯文本和 Markdown，避免 SQLite/Postgres 等不透明存储
- **无 RAG 的文件系统**：自 2025 年 6 月起避免使用 RAG，以富文本 + 交叉引用 + ripgrep 替代

### Algorithm v6.3.0
七阶段循环算法：观察 → 思考 → 规划 → 构建 → 执行 → 验证 → 学习。基于科学方法建模，采用 Deutsch 的"难以变更的解释"作为"优质"标准。支持模式分类器（MINIMAL/NATIVE/ALGORITHM）和分级机制（E1-E5）。

### 与 Claude Code 的关系
PAI 不是 Claude Code 的替代品，而是使其个性化的顶层。Claude Code 提供引擎（钩子系统、上下文管理、代理架构），PAI 在其上构建持久记忆、自定义技能、个人上下文、智能路由和自我改进。

### 安装方式
- 一键安装：`curl -sSL https://ourpai.ai/install.sh | bash`
- 安装后需运行 `/interview` 设置 TELOS（使命、目标、信念、智慧等）

## 关键概念
- **ISA（Ideal State Artifact）**：理想状态工件，类似软件 PRD 但适用于任何创造性任务，包含 12 个章节和 5 种身份
- **Telos**：用户的终极目标，是 DA 优化的核心方向
- **DA（Digital Assistant）**：数字助理，每个人的 AI 声音和个性
- **Containment Zones**：基于目录的隐私隔离机制，阻止跨区域数据泄露

## 关联实体
- [[Claude Code]] — PAI 的底层运行平台
- [[个人AI基础设施]] — PAI 对应的知识主题
- [[PAI]] — 项目本体

## 相关页面
- [[AI工具与应用-扩展]] — AI 工具生态全景
- [[一人公司工具栈]] — 个人效率与 AI 工具组合
- [[GenericAgent]] — 另一种个人 AI Agent 框架
- [[独立开发与营销]] — 独立开发者的 AI 基础设施需求
