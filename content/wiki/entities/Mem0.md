---
tags: [memory, agent, vector, graph, neo4j, self-hosting]
created: 2026-05-19
updated: 2026-05-19
type: entity
sources:
  - raw/articles/2026-05-18-20260428-recommended-ai-agent-memory-solutions.md
  - raw/articles/2026-05-18-20260428-chatgpt-ai-agent-memory解决方案.md
---

# Mem0

> 排名第一的即插即用 AI Agent Memory API，采用向量+图谱（Neo4j/Kuzu）混合架构，LoCoMo 基准准确率高达 91.6%，检索延迟低于 1 秒。

## 概述

Mem0 是 2026 年 AI Agent 记忆方案领域的行业标杆，在多个评测维度（效果、可靠性、自托管简易性）综合排名第一。它定位为"通用记忆层"（Universal Memory Layer），可以为任意无状态的 AI Agent 快速附加长期记忆能力——自动从对话中抽取用户偏好、长期事实、可检索上下文。

Mem0 采用向量搜索 + 知识图谱的混合架构，既能进行语义相似度检索，也能处理复杂的多跳推理查询。其自托管版本通过 Docker Compose 一键部署，包含 FastAPI 服务、Postgres/pgvector 和 Neo4j 等组件。

## 关键特性

- **即插即用**：为现有 Agent 快速附加记忆层，无需重构架构
- **混合架构**：向量搜索（语义匹配）+ 图谱（Neo4j/Kuzu，多跳推理）
- **高准确率**：在 LoCoMo 基准上准确率高达 91.6%
- **低延迟**：检索延迟低于 1 秒，适合实时对话场景
- **简易自托管**：Docker Compose 一键部署，配置 LLM API Key 即可
- **自我改进**：支持记忆更新、过期和冲突合并
- **多框架集成**：可接入 LangChain、LangGraph、LlamaIndex、CrewAI 等

## 最简自托管

```bash
# 克隆官方仓库
git clone https://github.com/mem0ai/mem0
cd server
# 配置 .env（填入 LLM API keys）
# 启动
docker compose up -d
```

## 与其他记忆方案对比

| 维度 | Mem0 | Letta | Zep |
|------|------|-------|-----|
| 定位 | 即插即用 API | OS 式 Agent Runtime | 时间推理 |
| 架构 | 向量+图谱 | 分页内存管理 | 双时态知识图谱 |
| 上手难度 | 低 | 低 | 低 |
| 最佳场景 | 快速加记忆 | 管理 Agent 生命周期 | 时间变化追踪 |

## 关系

- 相关页面：[[AI记忆方案]], [[Letta]], [[PAI]]
- 竞品对比：[[Letta]] 更适合 Agent 生命周期管理，Mem0 更轻量即插即用
- 生态集成：在 [[AI记忆方案]] Top 20 中排名第一

## 来源参考

- AI Agent Memory 解决方案 Top 20 排名（2026）
- Mem0 官方文档及 Docker 自托管指南
