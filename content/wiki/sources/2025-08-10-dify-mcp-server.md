---
tags: [Dify, MCP, Claude-Desktop, Cursor, AI工具集成, LLM应用平台]
created: 2025-08-10
updated: 2026-06-13
sources:
  - "https://docs.dify.ai/zh-hans/guides/application-publishing/publish-mcp"
---

# 将 Dify 应用部署为 MCP 服务器

## 概要

Dify 平台支持将创建的应用发布为 MCP（Model Context Protocol）服务器，使外部 AI 工具如 [[Claude Code]] 和 Cursor 能够直接调用 Dify 应用的功能。每个 Dify 应用会生成唯一的 MCP 服务器地址，通过 JSON 配置即可完成集成，实现 LLM 应用与 AI 编辑器之间的无缝互操作。

## 核心内容

### MCP 服务器地址即 API Key
- 生成的 MCP 地址包含敏感认证信息，应像对待 API Key 一样妥善保管
- 重新生成地址会使旧地址立即失效，旧的外部连接将无法继续使用

### Claude Desktop 集成步骤
- 进入 Profile > Settings > Integrations > Add Integration
- 粘贴 Dify 生成的 MCP 服务器 URL 即可完成配置
- 配置后 Claude Desktop 可直接调用 Dify 应用的工具能力

### Cursor 集成步骤
- 在项目根目录创建或编辑 `.cursor/mcp.json`
- 填入服务器名称和 MCP URL
- 支持通过多个服务器条目同时集成多个 Dify 应用

### Dify 工具描述优化
- 面向 AI 的工具描述应尽量详细具体
- 例如使用 "包含用户名、邮箱和偏好设置的 JSON 对象" 而非 "输入数据"
- 清晰的描述帮助 AI 模型更准确地决定何时以及如何调用工具

### 延迟管理
- 如果 Dify 应用处理时间超过 30 秒，建议添加进度指示器或将任务拆分为更小的步骤
- MCP 协议本身对超时有要求，长任务需要做适配处理

## 关键概念

- **MCP（Model Context Protocol）**：由 Anthropic 提出的模型上下文协议，标准化 AI 模型与外部工具/服务的通信方式
- **MCP 服务器**：遵循 MCP 协议暴露工具能力的服务端点，可被任何支持 MCP 的客户端调用
- **Dify 应用发布**：Dify 平台支持多种发布方式（API、嵌入、MCP），MCP 是其中面向 AI 编辑器的集成方式

## 关联实体

- [[MCP]] — 模型上下文协议，核心标准
- [[MCP Gateway]] — MCP 服务器聚合管理工具
- [[Claude Code]] — Anthropic 的 AI 编程工具，支持 MCP 集成
- [[DeepSeek]] — 可通过 MCP 协议集成的国产大模型

## 相关页面

- [[MCP协议与工具生态系统]] — MCP 生态全景与工具集成方法
- [[AI工具与应用-扩展]] — 更多 AI 工具集成与应用实践
- [[AI编程与开发工具]] — AI 编程辅助工具对比与使用
- [[技术与服务器部署]] — 服务部署与配置实践
