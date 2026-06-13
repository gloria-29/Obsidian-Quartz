---
tags: [mcp, memory, nostr, autobiography, agent, self-sovereign]
created: 2026-05-19
updated: 2026-05-19
type: entity
sources:
  - raw/articles/2026-05-18-20260428-openclaw-hermes-nocturne-notion.md
  - raw/articles/2026-05-18-20260428-chatgpt-gemini连接外部mcp.md
---

# Nocturne Memory

> 自传体记忆 MCP 服务，为 AI Agent 提供"主权记忆"——以命名空间 URI 架构存储和管理跨会话、跨模型的长期记忆，支持 Dashboard 审计和回滚。

## 概述

Nocturne Memory（nocturne_memory）是一个专门为 AI Agent 设计的自传体记忆 MCP 服务。区别于传统 RAG（检索增强生成），Nocturne 关注的是"人格记忆"——让 AI 能记住"用户是谁"、"用户偏好什么"、"发生了什么"等自传体信息，而非简单的文档检索。

Nocturne 基于 MCP 协议，通过 stdio/SSE/Streamable HTTP 多种传输方式向外暴露记忆工具。其核心工具包括 `read_memory`、`create_memory`、`update_memory`、`delete_memory`、`add_alias`、`manage_triggers`、`search_memory`，并提供 Web Dashboard 用于审计、回滚和 diff 对比。

## 关键特性

- **自传体记忆**：记录"人格伤疤"和"自主灵魂"，而非简单的语义文档检索
- **命名空间 URI 架构**：通过 `core://agent/traits`、`system://boot` 等 URI 组织记忆，支持多 Agent 隔离
- **MCP 协议原生**：支持 stdio、SSE、Streamable HTTP 三种传输方式
- **Dashboard 审计**：Web 界面支持记忆审计、diff 对比和 rollback 回滚
- **跨模型跨会话**：记忆独立于底层模型，支持 Claude、Gemini、Codex 等多 Agent 共享
- **触发机制**：支持 `manage_triggers` 配置记忆的自动加载条件

## 集成案例：Gemini 网页版连接 Nocturne

通过本地 Sidecar 桥（bridge.mjs + 油猴脚本），可在 Gemini 网页端注入 Nocturne 记忆上下文：

```
Gemini Web → 油猴脚本 → Local Bridge(127.0.0.1:8787) → MCP Client SDK → Nocturne MCP(127.0.0.1:8233/mcp)
```

每次发送前自动读取 `system://boot` 和相关搜索结果，塞入 `<NOCTURNE_MEMORY_CONTEXT>` 块，让 Gemini "像记起来一样"回答。

## 在 OpenClaw 集成中的角色

在 OpenClaw × Hermes × Nocturne 三系统架构中，Nocturne 担任"真理刻录机"角色：
- 锁定 Telos、SOUL.md、USER.md 等核心身份文件
- AI 只能**读取**这些核心记忆作为上下文
- AI 想**修改**需通过 Nocturne 产生待审批 Snapshot
- 杜绝 AI 对用户长期愿景的二次创作

## 关系

- 相关页面：[[MCP协议与工具生态系统]], [[AI记忆方案]], [[OpenClaw]], [[Hermes Agent]]
- 协议基础：基于 [[MCP]] 协议向外暴露记忆工具
- 集成生态：在 [[OpenClaw]] 中作为"金库"层锁定核心记忆
- 管道搭档：与 [[Hermes Agent]] 分工——Hermes 记流水账，Nocturne 锁核心

## 来源参考

- Nocturne Memory GitHub 仓库及 TOOLS.md 文档
- Gemini × Nocturne 桥接方案实践
- OpenClaw × Hermes × Nocturne 三系统集成 Telegram 记录
