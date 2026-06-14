---
tags: [OpenCode, AI终端, 开发工具, CLI, 多代理协作, Claude Code]
created: 2026-01-13
updated: 2026-06-13
sources: [raw/notes/2026-01-13-关于OpenCode.md]
---

# OpenCode：开源AI终端代理配置与多代理协作指南

## 概要
OpenCode 是开源的终端 AI 代理工具，搭配 oh-my-opencode 插件可实现异步多代理协作（UltraWork 模式）。本文详细介绍如何将非官方 API 渠道（公益站、中转站、本地代理）接入 OpenCode，以及 UltraWork 多 Agent 并行开发模式的配置方法。

## 核心内容

### 接入非官方 API 渠道

#### 简单版（推荐）
1. 执行 `opencode auth login`，选择 Anthropic，手动输入 API Key
2. 编辑 `~/.config/opencode/opencode.json`，在 provider 中重载 baseURL 到渠道地址
3. 修改模型名为渠道实际模型名（如 `claude-sonnet-4-5-20250929`）
4. 注意：API URL 后面大概率需要加 `/v1`

#### 自定义供应商版
在 opencode.json 的 provider 中定义新供应商对象，指定 npm 包（`@ai-sdk/anthropic`）、baseURL、以及模型配置（包含 context/output 限制和 modalities 信息）。同时配置 oh-my-opencode.json 中各 Agent 的模型分配。

### UltraWork 多代理协作模式
- 在指令前加 `ulw` 或 `UltraWork` 可启用该模式
- 自动进行项目分块 + 架构设计，然后多 Agent 分工并行执行直到项目完整交付
- 可在 oh-my-opencode.json 中为不同 Agent 配置不同模型（前端用 Gemini、后端用 Opus、调试审核用 GPT、搜索用 Grok）
- 支持 Ralph Loop 防止会话自行终止（挂机必备）

### 限制
- 部分平台禁止非 Claude Code CLI 使用（如 88code、WONG 公益站专属分组）
- cc-switch 等 Claude 配置工具对 OpenCode 无效
- 需注意渠道兼容性和倍率差异

## 关键概念
- **UltraWork 模式**：OpenCode 的异步多代理协作功能，自动分块+并行执行
- **oh-my-opencode**：OpenCode 的社区插件，提供 UltraWork 支持和增强配置
- **Ralph Loop**：防止 AI 会话自行终止的循环插件，适合长时间任务

## 关联实体 [[wikilinks]]
- [[Claude Code]] — OpenCode 兼容其 Skills 和配置体系
- [[AI编程与开发工具]] — AI 辅助编程工具生态
- [[OpenClaw]] — 另一个 AI 代理平台

## 相关页面 [[wikilinks]]
- [[AI编程与开发工具]]
- [[AI记忆方案]]
