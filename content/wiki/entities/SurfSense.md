---
tags: [research-agent, knowledge-base, notebooklm-alternative, perplexity-alternative, rag, self-hosting]
created: 2026-05-19
updated: 2026-05-19
type: entity
sources:
  - raw/articles/2026-05-18-20251009-surfsense.md
---

# SurfSense

> 开源 NotebookLM / Perplexity 替代品，高级 AI 研究代理，可连接搜索引擎、Slack、Notion、GitHub 等 20+ 外部数据源，支持 100+ LLM 和 6000+ Embedding 模型。

## 概述

SurfSense 是一个开源的全功能 AI 研究代理，定位为 [[NotebookLM]] 和 Perplexity 的开源替代品。它的核心竞争力在于**连接性**和**可定制性**——能够深度集成搜索引擎（Tavily、LinkUp）、工作协同工具（Slack、Jira、Notion、Airtable）、内容平台（YouTube、GitHub、Discord）以及个人工具（Gmail、Google Calendar）等 20+ 外部数据源。

SurfSense 采用先进的 RAG 技术栈：两层分层索引、混合搜索（语义 + 全文检索 + 互易排名融合 RRF）、支持 100+ LLM 和 6000+ Embedding 模型。它还内置了一个极速播客生成代理，可在 20 秒内生成 3 分钟的播客内容。

## 关键特性

- **20+ 外部数据源连接**：Slack、Jira、Confluence、Notion、Gmail、YouTube、GitHub、Discord 等
- **个人知识库构建**：支持 50+ 文件格式上传（文档、图片、音视频）
- **先进 RAG 技术**：两层分层索引 + 混合搜索（语义 + 全文 RRF）+ Reranker
- **模型支持广泛**：100+ LLM、6000+ Embedding 模型、主流 Reranker（Cohere、Flashrank）
- **引用答案**：像 Perplexity 一样提供带来源引用的答案
- **播客生成代理**：20 秒内生成 3 分钟播客，支持多 TTS 提供商
- **隐私优先**：支持自托管 + 本地 LLM（Ollama），数据完全可控
- **跨浏览器扩展**：保存网页内容，尤其是需登录验证的页面

## 技术架构

- **后端**：FastAPI + PostgreSQL/pgvector + SQLAlchemy + LangGraph + LangChain + LiteLLM
- **前端**：Next.js 15 + React 19 + TypeScript + Tailwind CSS + Shadcn
- **部署**：Docker Compose，支持 pgAdmin 管理

## 关系

- 相关页面：[[NotebookLM]], [[AI记忆方案]], [[知识库构建方法论]], [[Cloudflare]]
- 替代关系：[[NotebookLM]] 的增强版替代品——不仅有多文档合成，还能连接外部实时数据源
- 知识库生态：可作为 [[知识库构建方法论]] 中 LLM Wiki 的替代或补充方案
- 部署选项：可通过 [[Cloudflare]] Workers/Pages 等基础设施辅助部署

## 来源参考

- SurfSense GitHub 仓库（MODSetter/SurfSense）
- SurfSense 官方文档及 Docker 部署指南
