---
tags: [ide, ai-coding, mcp, free, bytedance]
created: 2026-05-19
updated: 2026-05-19
type: entity
sources:
  - raw/articles/2026-05-18-20251109-mtga赋能trae.md
  - raw/articles/2026-05-18-deepseek接入这个智能体后-能够吞下整本书了-确实可以封神了.md
---

# Trae

> 字节跳动开发的免费 AI IDE，原生支持 MCP 智能体协议和智能体编排，内置 DeepSeek-R1 和豆包等模型免费额度。

## 概述

Trae 是字节跳动推出的一款免费 AI 编程 IDE，内置了 Doubao-1.5-pro、DeepSeek-R1 等模型，并提供免费使用额度。Trae 的核心特色是对 MCP 智能体（Agent）的深度支持——它是市面上对 MCP 智能体支持最好、对 Agent 编排做了深度优化的 IDE 之一。

通过 @ 智能体功能，用户可以在 Trae 中创建自定义 Agent（定义名称、提示词、MCP Server 配置），实现复杂的多步骤自动化任务。典型的应用案例包括"吞书智能体"——通过 pdf-reader MCP Server + 分章节编排提示词，实现对整本书高精度无损的逐章摘要总结。

## 关键特性

- **免费使用**：内置 DeepSeek-R1、Doubao-1.5-pro 等模型，免费额度
- **MCP 原生支持**：深度集成 MCP Server，支持手动配置 JSON 接入外部 MCP
- **智能体编排**：通过 @ 创建智能体，自定义名称、提示词、MCP 工具链
- **# 文档引用**：通过 # 直接接入本地文档作为上下文
- **多模型聚合**：配合 MTGA 工具可接入公益站 API 的国际大模型（Gemini、Claude 等）

## 吞书智能体案例

使用 Trae 构建的"吞书智能体"展示了 Trae 的 MCP 编排能力：

1. 在 Trae 中创建智能体，填写编排提示词
2. 配置 pdf-reader MCP Server（开源在 GitHub: DeepSeekMine/mcp-pdf-reader）
3. 上传 PDF 书籍 → Agent 自动分章节提取、分析、摘要
4. 逐章处理，每章上下文不超过模型长度（如 R1 的 128K）
5. 自动生成各章节总结文件（TXT）和可视化 HTML 网页

**核心原理**：通过多智能体协作 + 分章节编排，实现精度无损的整本书摘要——避免了直接塞入超长文本导致的注意力退化问题。

## MTGA 扩展

通过 MTGA（本地代理工具），Trae 可接入公益 API 站的国际大模型（Gemini、Claude、Kimi 等），实现"国内版 IDE 聚合全球大模型"的效果。详见 [[MTGA]]。

## 关系

- 相关页面：[[MTGA]], [[MCP]], [[GenericAgent]], [[Claude Code]]
- MCP 能力：对 [[MCP]] 智能体的原生支持使其成为 Agent 开发的重要 IDE
- 扩展工具：通过 [[MTGA]] 可扩展模型选择范围
- 对比：与 [[Claude Code]] 同为 AI IDE，但 Trae 免费且更侧重 GUI 交互

## 来源参考

- MTGA 赋能 Trae 教程（LINUX DO）
- 吞书智能体：DeepSeek 接入 Trae 实现整本书摘要方案
