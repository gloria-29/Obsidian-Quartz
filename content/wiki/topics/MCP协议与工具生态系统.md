---
tags: [ai, mcp, protocol, tool-ecosystem, concept]
created: 2026-05-19
updated: 2026-05-19
type: concept
sources:
  - "2026-05-18-20260428-本地-mcp-gateway"
  - "2026-05-18-20260428-chatgpt-gemini连接外部mcp"
  - "2026-05-18-20260428-chatplus"
  - "2026-05-18-20260428-openclaw-hermes-nocturne-notion"
  - "2026-05-18-20260428-recommended-ai-agent-memory-solutions"
---

# MCP协议与工具生态系统

> Model Context Protocol (MCP) 是连接 AI 模型与外部工具的标准化协议。它定义了 AI Agent 如何发现工具、调用资源、管理技能，正在成为 Agent 生态的"HTTP 协议"。

## 核心概念

[[MCP 协议]]（Model Context Protocol）是一个开放标准，定义了 AI 模型与外部工具、数据源之间的通信规范。其核心价值在于：

- **标准化的工具发现**：Client 通过 MCP 端点发现可用工具列表
- **统一的调用接口**：无论是本地 `stdio` 还是远程 `SSE`/`Streamable HTTP`，接口一致
- **安全边界控制**：路径守卫、Token 认证、命令审批机制

## 主要内容

### MCP Gateway

[[MCP Gateway]] 是一个 MCP 服务器网关，它将多个 MCP Server 统一接入一个入口，提供代理转发、认证和管理功能。最常见的用途是**将本地 `stdio` MCP 服务转换为远程可访问的 `SSE`/`Streamable HTTP` MCP 服务**，使网页端 AI 聊天窗口也能使用工具和技能。

核心功能：
- 统一管理多个 MCP 服务（可视化 + JSON 双编辑模式）
- 网关统一转发 SSE（`GET|POST /api/v2/sse/<serverName>`）
- 网关统一转发 HTTP（`POST /api/v2/mcp/<serverName>`）
- 内置安全认证（Admin Token / MCP Token）
- SKILLS 标签页管理内置 Skill MCP 服务
- 路径守卫（白名单目录 + 越界策略：allow/confirm/deny）
- 策略规则和待确认命令审批

### 传输协议对比

| 方式 | 适用场景 | 特点 |
|------|----------|------|
| `stdio` | 本地直接调用 | 最低延迟，无需网络 |
| `SSE` | 远程/浏览器端 | 服务端推送，单向流 |
| `Streamable HTTP` | 浏览器端 | 双向流，现代 Web 标准 |

### 生态集成

MCP 生态正在快速扩展，覆盖了多种应用场景：

- **记忆系统**：[[Nocturne Memory]] 作为 MCP Memory Server，为 Agent 提供自传体记忆
- **聊天增强**：[[ChatPlus]] 监听支持站点的出站请求，注入 MCP 工具指令
- **本地桥接**：通过 Gemini CLI + Nocturne Memory MCP 实现无感记忆注入
- **AI 知识库**：[[qmd]] 提供 MCP Server 接口的本地 Markdown 搜索引擎
- **个人基础设施**：[[OpenClaw]] 作为全时本地 MCP 网关，桥接 50+ 平台

### 安全架构

MCP Gateway 采用多层安全模型：
1. **Token 层**：Admin Token 保护管理接口，MCP Token 保护调用接口
2. **路径守卫**：白名单目录 + 越界策略
3. **执行限制**：超时控制、最大输出限制
4. **审批机制**：高风险命令需人工 Approve/Reject

## 关键资源

- [[MCP Gateway]] - 本地 MCP 服务器网关
- [[MCP 协议]] - Model Context Protocol 官方规范
- [[ChatPlus]] - 浏览器端 MCP 工具集成
- [[Nocturne Memory]] - 自传体记忆 MCP 服务
- [[MCP Memory Server]] - MCP 记忆服务端点

## 相关页面

- [[AI Agent框架]] - 使用 MCP 工具的 Agent 框架
- [[AI记忆方案]] - 通过 MCP 接入的记忆方案
- [[个人AI基础设施]] - PAI 中的 MCP 集成
- [[OpenClaw]] - 全时本地 MCP 网关
- [[GenericAgent]] - MCP 工具调用支持
