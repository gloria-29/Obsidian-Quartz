---
tags: [NotebookLM, 本地部署, 知识库, 开源工具]
created: 2025-01-20
updated: 2025-01-20
sources: []
---
# 自建本地 NotebookLM 服务方案比较

> 系统性比较多种本地部署类 NotebookLM 文档问答服务的方案，重点关注低硬件配置下的可行性。

## 核心观点
- 自建类 NotebookLM 服务可按搭建难度分为三个梯队：最简单(Docker 化方案)、较简单(多组件搭配)、较复杂(需手动编译)
- 硬件配置最低的方案推荐：chatgpt-document-qa（首选）和 privateGPT（备选），均支持 CPU 运行
- [[Llama.cpp]] 方案虽然搭建复杂，但硬件要求最低且性能优秀，适合追求极致优化的场景
- 量化模型（GGML/GGUF 格式）是低资源配置下运行 LLM 的关键

## 关键概念
- [[NotebookLM]] — Google 的 AI 笔记和文档问答工具，可基于用户文档进行对话式查询
- [[privateGPT]] — 注重隐私的本地文档问答系统，使用本地 LLM 和嵌入模型
- [[AnythingLLM]] — 桌面应用程序，可构建本地知识库并利用本地 LLM 进行对话
- [[chatgpt-document-qa]] — 基于 LangChain 和 Streamlit 的文档问答系统，支持 Docker 一键部署
- [[Ollama]] — 本地运行和管理 LLM 模型的命令行工具
- [[量化模型 GGUF]] — 通过减少模型精度来降低硬件需求的模型格式
