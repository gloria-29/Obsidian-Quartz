---
tags: [protocol, anthropic, mcp, ai-tools, integration, agent-ecosystem]
created: 2026-05-18
updated: 2026-05-19
type: entity
sources:
  - raw/articles/2026-05-18-20260428-本地-mcp-gateway.md
  - raw/articles/2026-05-18-20260428-chatgpt-gemini连接外部mcp.md
  - raw/articles/2026-05-18-20260428-openclaw-hermes-nocturne-notion.md
---

# MCP (Model Context Protocol)

## 概述

MCP（Model Context Protocol，模型上下文协议）是 Anthropic 提出的开放协议，定义了 AI 模型与外部工具/数据源之间的标准化通信接口。它让 AI Agent 能够发现、调用和管理外部工具，是 [[Claude Code]]、[[GenericAgent]]、[[OpenClaw]] 等 Agent 框架的底层工具协议。

## 核心架构

```
AI 客户端 (Claude/Gemini/ChatGPT)
    ↓ MCP 协议
MCP Gateway/Server
    ↓ 工具路由
Tool A  Tool B  Tool C
```

### 三种传输模式

| 模式 | 说明 | 适用场景 |
|------|------|----------|
| **stdio** | 标准输入输出 | 本地进程间通信，[[Claude Code]] 默认 |
| **SSE** | Server-Sent Events | Web 实时推送 |
| **HTTP** | RESTful API | 云端服务，[[MCP Gateway]] 使用 |

### 工具发现机制

1. 客户端发送 `tools/list` 请求
2. 服务器返回可用工具列表（名称、描述、参数 schema）
3. 客户端根据 schema 构造调用请求
4. 服务器执行并返回结果

## MCP 服务器类型

| 类型 | 示例 | 说明 |
|------|------|------|
| **文件系统** | filesystem-server | 读写本地文件 |
| **数据库** | postgres-server, sqlite-server | SQL 查询 |
| **Web 搜索** | brave-search, tavily | 网络搜索 |
| **代码执行** | code-interpreter | 运行 Python/JS |
| **API 集成** | github-server, slack-server | 第三方 API |

## 与 Agent 框架的关系

MCP 是 Agent 工具调用的标准化层：

- **[[Claude Code]]**: 原生支持 MCP，通过 `--mcp` 参数加载服务器
- **[[GenericAgent]]**: 支持 MCP 工具集成
- **[[OpenClaw]]**: 支持自定义 MCP 服务器
- **[[Hermes Agent]]**: 通过 MCP 扩展工具集
- **[[MCP Gateway]]**: MCP 的聚合网关，统一管理多个服务器

## ChatGPT/Gemini 连接外部 MCP

根据源文献，ChatGPT 和 Gemini 可通过以下方式连接外部 MCP：

1. **油猴脚本注入**: 通过浏览器脚本将 MCP 调用注入网页版
2. **本地代理**: 运行本地 MCP 代理服务器
3. **Chrome 扩展**: 通过浏览器扩展桥接 MCP 调用

## 关键特性

- **标准化**: 统一的工具描述和调用格式
- **可组合**: 多个 MCP 服务器可串联
- **安全**: 支持认证和权限控制
- **跨平台**: 支持 stdio/SSE/HTTP 多种传输
- **生态丰富**: 社区贡献了数百个 MCP 服务器

## 局限性

- 工具调用依赖 LLM 的 function calling 能力
- 复杂工具链可能增加延迟
- 安全模型仍在演进中
- 不同 LLM 对 MCP 的支持程度不同

## 相关页面

- [[MCP Gateway]] — MCP 的聚合网关实现
- [[Claude Code]] — MCP 的主要使用者
- [[GenericAgent]] — 支持 MCP 的 Agent 框架
- [[Hermes Agent]] — 支持 MCP 工具扩展
- [[AI Agent框架]] — 更广泛的 Agent 生态
