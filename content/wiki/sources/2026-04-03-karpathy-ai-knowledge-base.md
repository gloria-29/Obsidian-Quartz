---
tags: [知识管理, Obsidian, LLM, Karpathy, Claude Code]
created: 2026-04-03
updated: 2026-04-03
sources: []
---
# Karpathy 的 AI 知识库构建方案

> Andrej Karpathy 分享了一套用 LLM 构建个人 Wiki 知识库的方法论：纯本地 MD、自动编译摘要、交叉链接、健康检查。

## 核心观点
- 使用 Obsidian 作为纯本地 MD 查看器，将原始资料放入 RAW 目录
- LLM 自动将原始资料编译为结构化 Wiki：创建摘要、索引、概念条目、交叉链接、可视化
- 非 RAG 方案：约 100 篇文章 40 万字，LLM 可直接通过索引文件处理，无需向量数据库
- 关键创新：让 LLM 做 Wiki 健康检查——发现自相矛盾、补发缺失信息、发现新关联
- 必须将 AI 生成内容和原始可靠来源分开放，避免"污染知识库"

## 关键概念
- [[LLM Wiki]] — 由大语言模型自动维护的个人知识库系统
- [[Karpathy]] — Andrej Karpathy，前 Tesla AI 总监、前 OpenAI 创始成员
- [[知识库污染]] — AI 生成内容混入原始资料导致知识可信度下降

## 相关页面
- [[Obsidian]]
- [[Claude Code]]
- [[NotebookLM]]
