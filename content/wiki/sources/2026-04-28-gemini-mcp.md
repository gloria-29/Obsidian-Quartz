---
tags: [Gemini, MCP, AI配置, API, Claude]
created: 2026-04-28
updated: 2026-06-13
sources:
  - type: article
    title: Gemini连接外部MCP方案
    path: raw/articles/2026-04-28-gemini-mcp.md
    url: "https://chatgpt.com/share/e/69f02f85-ed70-8008-91b7-6df43af43423"
---

# Gemini连接外部MCP方案

## 概要

Gemini CLI和API原生支持MCP（Model Context Protocol），但gemini.google.com网页端没有MCP配置入口。网页端需要通过浏览器脚本或扩展调用本地桥接器来实现MCP连接，而Claude Desktop和Cursor可直接配置MCP Server。

## 核心内容

### 不同端的MCP支持情况

| 平台 | MCP支持 | 配置方式 |
|------|---------|---------|
| Gemini CLI | 原生支持 | 配置文件直接设置 |
| Gemini API | 原生支持 | API参数配置 |
| gemini.google.com网页版 | 无原生支持 | 需浏览器扩展桥接 |
| Claude Desktop | 原生支持 | settings.json配置 |
| Cursor | 原生支持 | 设置面板配置 |

### 网页端桥接方案

由于Gemini网页版没有MCP配置入口，需要通过以下方式实现：

- 浏览器脚本（Tampermonkey等）拦截请求并注入MCP调用
- 浏览器扩展调用本地运行的桥接服务
- 桥接器在本地运行MCP Server，通过浏览器扩展与网页版通信

### 对比Claude生态

Claude Desktop和Cursor对MCP的支持更加成熟，配置简单直观，是目前MCP集成的最佳选择。

## 关键概念

- **MCP（Model Context Protocol）**：模型上下文协议，让AI模型连接外部工具和数据源的标准协议
- **本地桥接**：在用户设备上运行的中间服务，将网页端请求转发给MCP Server
- **smithery-ai/mcp-obsidian**：通过Smithery CLI一键安装的Obsidian MCP服务器

## 关联实体

- [[Gemini]]
- [[MCP协议]]
- [[Claude Desktop]]

## 相关页面

- [[smithery-ai MCP Obsidian服务器]]
- [[AzureTTS-CF]]
- [[Vibe Coding发行指南]]
