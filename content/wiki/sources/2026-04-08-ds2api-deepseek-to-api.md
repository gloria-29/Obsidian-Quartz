---
tags: [AI工具, 开源, API, DeepSeek]
created: 2026-04-08
updated: 2026-04-08
sources: []
---
# DS2API：DeepSeek 客户端对话转 API

> DS2API 是一个将 DeepSeek Web 对话能力转换为 OpenAI、Claude、Gemini 兼容 API 的全栈开源工具，Go 后端 + React 管理台，支持多账号轮询、Vercel/Docker 部署。

## 核心观点
- 将 DeepSeek 网页对话会话转化为标准 API，兼容 OpenAI / Claude / Gemini 三种协议格式
- 后端 Go 全量实现，前端 React WebUI 管理台，支持 Vercel Serverless、Docker、本地运行
- 多账号轮询 + 并发队列控制，每账号 in-flight 上限 + 等待队列
- 纯 Go 高性能实现 DeepSeek PoW（DeepSeekHashV1），毫秒级响应
- Tool Calling 防泄漏处理，支持 JSON/XML/ANTML/invoke 多格式解析
- Claude Code 可通过配置 ANTHROPIC_BASE_URL 直接接入

## 关键概念
- [[DS2API]] — DeepSeek 网页对话转 API 的开源工具，由 CJackHwang 开发
- [[Agent协议适配]] — 将不同 AI API 协议（OpenAI/Claude/Gemini）统一转换的适配层模式
- [[API中转]] — 通过中间层将非官方 API 转换为标准 API 接口的技术方案

## 相关页面
- [[Claude Code]]
- [[DeepSeek]]
- [[MCP]]
