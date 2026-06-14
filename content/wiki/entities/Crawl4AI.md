---
type: tool
aliases: [Crawl4AI]
tags: [tool, 爬虫, 网页抓取, LLM, RAG, 开源]
created: 2026-05-28
updated: 2026-06-14
sources: ["2025-07-07-Crawl4AI-LLM友好型Web爬虫与抓取工具"]
---

# Crawl4AI

## 概述

Crawl4AI 是一款 GitHub 47K+ Stars 的开源 LLM 友好型 Web 爬虫工具，专为 RAG（检索增强生成）管线优化。核心设计理念是将网页内容转化为干净的 Markdown 格式，供大语言模型直接消费。通过 Playwright 驱动浏览器引擎，支持 JavaScript 渲染页面，并通过 BM25 启发式过滤从爬取内容中提取核心信息。提供 MCP 集成，可一键连接 Claude Code 等 AI 工具。

## 核心功能

### 功能特点
- **LLM 友好输出**：生成干净的结构化 Markdown，无广告/导航/页脚干扰
- **Playwright 驱动**：支持 Chromium/Firefox/WebKit 无头浏览器，可渲染 JS 动态页面
- **FastAPI 服务**：Docker 部署提供 RESTful API，方便集成
- **BM25 启发式过滤**：自动从爬取内容中提取核心信息，去除噪音
- **排除/包含模式**：通过 CSS 选择器精确控制爬取范围
- **MCP 协议集成**：一键连接 Claude Code 等 AI 工具（`claude mcp add --transport sse c4ai-sse`）
- **批量爬取**：支持大规模多页面爬取
- **速率控制**：可配置请求间隔，避免被目标网站限制

### 使用场景
- **RAG 知识库内容获取**：为 AI 研究系统提供结构化的网页数据源
- **AI Agent 网页信息获取**：为 AI Agent 爬取当前信息并提供给 LLM 分析
- **批量主题爬取**：爬取特定主题的大量文章集合
- **个人知识库构建**：作为知识库的网页内容获取层
- **竞品分析**：批量获取竞品网站信息

## 关键概念

- **LLM 友好**：输出格式专为大语言模型消费优化
- **BM25 过滤**：信息检索算法，用于从爬取内容中提取最相关的段落
- **MCP 协议**：通过 Model Context Protocol 与 AI 工具集成
- **Playwright**：微软开发的无头浏览器库，支持多种浏览器引擎

## 关联实体

- [[MCP]] — Crawl4AI 的协议集成基础
- [[Claude Code]] — 通过 MCP 连接 Crawl4AI，实现 AI Agent 自主爬取
- [[BrightData]] — 同为爬虫工具，侧重商业代理和反封锁
- [[RAG]] — Crawl4AI 优化的下游任务
- [[n8n]] — 工作流自动化中的爬虫节点

## 相关素材

- [[2025-07-07-Crawl4AI-LLM友好型Web爬虫与抓取工具]] — Crawl4AI 详细介绍
