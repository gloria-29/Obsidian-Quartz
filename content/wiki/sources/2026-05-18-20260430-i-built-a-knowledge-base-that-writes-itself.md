---
tags: [知识管理, Obsidian, LLM, Claude Code, Karpathy]
created: 2026-04-30
updated: 2026-06-13
sources: [raw/articles/2026-05-18-20260430-i-built-a-knowledge-base-that-writes-itself-here-is.md]
---

# I Built a Knowledge Base That Writes Itself

## 概要

受 Andrej Karpathy 推文启发，作者 Fabian G. Williams 用 Claude Code 构建了一套自动化知识管道：将 YouTube 转录稿等原始资料输入 Obsidian 库，LLM 自动增量编译为交叉链接的维基文章。5 个原始源产出 21 篇文章、60+ 交叉链接，整个管道一个下午搭建完成。核心价值是知识的复利效应——每个新源都让所有历史源更有价值。

## 核心内容

### 四大 Claude Code 技能
- `/ingest-transcript`：输入 YouTube URL，自动下载转录稿并保存到 raw 目录，添加完整 YAML 前置元数据
- `/wiki-compile`：核心编译技能，扫描未编译源，提取概念/人物/工具，创建或更新维基文章，自动交叉链接，幂等操作
- `/wiki-lint`：维基健康自检，查找断链、缺失元数据、过时文章、孤立页面
- `wiki_search.py`：SQLite FTS5 全文搜索，零依赖

### 知识复利效应
- 首次整理 Simon Willison 转录时，"Agentic Engineering" 文章独立存在
- 次日整理 Nate B Jones 转录，12 个 Agentic Primitives 自动反向链接
- 整理 Amol Avasari 时，CASH Framework 同时关联前述两部分，"能力过剩"为"令牌预算优化"提供新视角

### 运行数据
- 21 篇维基文章，60+ 交叉链接，处理 5 个原始源
- 单个新源处理耗时不到 2 分钟
- 知识库重构为 knowledge/projects/contexts/ops/media 清晰层级

## 关键概念

- **知识复利** — 每个新录入的源都会让所有历史源的价值提升
- **非 RAG 方案** — 约 100 篇文章 40 万字规模下，LLM 靠自动维护索引文件即可处理，无需向量数据库
- **管道优于文章** — 自动化管道比手动撰写任何单篇文章都更有价值

## 关联实体

- [[Andrej Karpathy]] — 原始推文作者，前特斯拉 AI 总监
- [[Obsidian]] — 知识库载体和查看器
- [[Claude Code]] — 构建自动化技能的工具

## 相关页面

- [[Obsidian to NotionNext Batch 插件]] — Obsidian 生态的同步工具
- [[ChatGPT o3系统提示词]] — LLM 系统级指令设计参考
