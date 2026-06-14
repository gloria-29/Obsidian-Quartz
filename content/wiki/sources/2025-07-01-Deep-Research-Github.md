---
tags: [Deep-Research, GitHub, AI研究工具, 开源项目, Next.js]
created: 2025-07-01
updated: 2026-06-13
sources: [raw/notes/2025-07-01-Deep-Research-Github.md]
---

# Deep Research Github

## 概要

一款开源的AI深度研究工具，利用多种大语言模型在约2分钟内生成深入研究报告。支持Gemini、OpenAI、Anthropic、Deepseek等多种模型和多种搜索引擎，注重隐私保护（数据本地存储），支持Vercel/Cloudflare/Docker部署和MCP服务。

## 核心内容

### 核心功能
- 快速深度研究：约2分钟生成全面研究报告
- 支持多种LLM：Gemini、OpenAI、Anthropic、Deepseek、Grok、Mistral、Azure、OpenRouter、Ollama
- 支持多种搜索引擎：Searxng、Tavily、Firecrawl、Exa、Bocha
- 本地知识库：支持上传文本、Office、PDF等资源文件
- 知识图谱：一键生成报告知识图谱
- MCP服务器支持（StreamableHTTP和SSE）

### 部署方式
- 一键部署到Vercel或Cloudflare
- Docker部署：`docker pull xiangfa/deep-research:latest`
- 本地开发：pnpm/npm + Next.js 15 + Shadcn UI
- 静态部署支持（GitHub Pages等）

### 技术架构
- 前端：Next.js 15 + Shadcn UI
- 思维模型与任务模型双模型架构
- SSE API支持SaaS模式调用
- MIT开源许可

## 关键概念

- **Deep Research**：AI驱动的自动化深度研究方法，自动搜索、分析、综合生成报告
- **MCP（Model Context Protocol）**：模型上下文协议，标准化AI服务间的通信
- **Vibe Coding**：AI辅助的快速编程方式，侧重实现想法而非语法
- **思维/任务双模型**：用"思维模型"做深度推理，"任务模型"做次要处理

## 关联实体

- [[DeepSeek]] — 工具支持的LLM之一
- [[Gemini]] — 推荐使用的免费模型
- [[Next.js]] — 项目使用的技术框架

## 相关页面

- [[deepseek-v3.2正式版]] — DeepSeek模型更新信息
- [[20251225笔记总结]] — 包含免费AI API资源汇总
- [[学习指南-金融投资AI工具及学习]] — AI工具在投资领域的应用
