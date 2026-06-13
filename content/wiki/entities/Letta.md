---
tags: [memory, agent, os-level, stateful, self-hosting, memgpt]
created: 2026-05-19
updated: 2026-05-19
type: entity
sources:
  - raw/articles/2026-05-18-20260428-recommended-ai-agent-memory-solutions.md
  - raw/articles/2026-05-18-20260428-chatgpt-ai-agent-memory解决方案.md
---

# Letta

> 前身为 MemGPT，采用 OS 式分页内存管理的 Stateful Agent Runtime，让 Agent 自主管理"换页"记忆，在 AI 记忆方案中排名第 3。

## 概述

Letta（前身为 MemGPT）是 AI Agent 记忆方案的先驱之一，其核心思路受到计算机操作系统的启发：将上下文窗口类比为 RAM，将长期存储类比为磁盘，让 Agent 像操作系统管理内存一样自主管理"分页（paging）"记忆——Agent 自主决定何时将哪些记忆从长期存储"换入"工作上下文。

Letta 的定位不是简单的 SDK 或 API，而是一个 **Stateful Agent Runtime**：用户可以创建、运行、管理有状态的 Agent，每个 Agent 拥有自己的持久状态、长期记忆和可管理的上下文。它在 AI 记忆方案评选中综合排名第 3。

## 关键特性

- **OS 式分页记忆**：Agent 自主管理记忆块的"换入换出"，解决上下文窗口限制
- **Stateful Agent Runtime**：支持创建、运行、管理持久化有状态 Agent
- **Docker 部署**：单条 `docker run` 命令即可启动 Letta Server
- **多模型支持**：支持 Anthropic、OpenAI、Ollama 等多种 LLM
- **跨会话记忆**：支持跨会话、跨模型的记忆持久化

## 最简自托管

```bash
docker run -p 8283:8283 \
  -v ~/.letta/.persist/pgdata:/var/lib/postgresql/data \
  -e OPENAI_API_KEY="your_key" \
  letta/letta:latest
```

## 与 Mem0 对比

Letta 的抽象比 Mem0 更"重"：如果只是想给现有聊天机器人加记忆，Mem0 更轻量；如果想管理 Agent 生命周期（创建、运行、状态持久化），Letta 更顺手。

## 关系

- 相关页面：[[Mem0]], [[AI记忆方案]], [[PAI]]
- 竞品对比：[[Mem0]] 是即插即用 API，Letta 是完整 Agent Runtime
- 设计理念：与 [[PAI]] Memory v7.6 有相似的多层记忆架构思想

## 来源参考

- AI Agent Memory 解决方案 Top 20 排名（2026）
- Letta 官方文档及 Docker 部署指南
