---
tags: [mcp, gemini, bridge, browser-extension, automation]
created: 2026-05-19
updated: 2026-05-19
type: entity
sources:
  - raw/articles/2026-05-18-20260428-chatgpt-gemini连接外部mcp.md
---

# Gemini MCP 桥接

## 概述

Gemini MCP 桥接是一种让 Gemini 网页版连接使用外部 [[MCP]] 服务器的方案。由于 Gemini 网页版目前不是可配置的 MCP Client，需要通过浏览器脚本/扩展 + 本地桥接器的方式实现。

## 核心问题

| 问题 | 说明 |
|------|------|
| **Gemini 网页版不支持 MCP** | 无法像 Claude Desktop 那样直接配置 |
| **Gemini CLI 支持 MCP** | 官方文档明确支持 |
| **Gemini API 支持 function calling** | 需要自己写应用层 |

## 解决方案

### 方案 A：Gemini CLI（最干净）

使用 [[Claude Code]] 类似的终端方式：

```bash
# 安装 Gemini CLI
npm install -g @anthropic-ai/gemini-cli

# 配置 MCP 服务器
# settings.json
{
  "mcpServers": {
    "nocturne-memory": {
      "command": "npx",
      "args": ["nocturne-memory"]
    }
  }
}
```

**优点**: 官方支持、稳定可靠
**缺点**: 不是网页版，需要终端操作

### 方案 B：浏览器脚本 + 本地桥（网页版可落地）

```
Gemini Web
   ↓ 油猴脚本
Local Bridge: http://127.0.0.1:8787
   ↓ REST API
Nocturne Memory MCP Server
```

**组件**:
1. **bridge.mjs**: 本地 REST → MCP 桥
2. **gemini-nocturne.user.js**: Tampermonkey 油猴脚本
3. **.env.example**: 配置 token、Nocturne 地址

**工作流程**:
1. 油猴脚本拦截 Gemini 输入框
2. 调用本地桥接器获取记忆
3. 将记忆注入到 prompt 中
4. Gemini 响应后，提取有价值信息写回记忆

## Nocturne Memory 功能

根据源文献，[[Nocturne Memory]] 提供以下 MCP 工具：

| 工具 | 说明 |
|------|------|
| `read_memory` | 读取记忆 |
| `create_memory` | 创建新记忆 |
| `update_memory` | 更新现有记忆 |
| `delete_memory` | 删除记忆 |
| `add_alias` | 添加别名 |
| `manage_triggers` | 管理触发器 |
| `search_memory` | 搜索记忆 |

## 使用场景

1. **个人记忆注入**: 不用反复复述个人背景
2. **多 Agent 同步**: 和别的智能体同步实时更新记忆
3. **知识积累**: 自动收集有价值的信息
4. **上下文保持**: 跨会话保持对话上下文

## 与其他方案的对比

| 维度 | Gemini MCP 桥接 | [[Claude Code]] 原生 MCP | [[MCP Gateway]] |
|------|----------------|-------------------------|-----------------|
| **支持** | 需要桥接 | 原生支持 | 原生支持 |
| **稳定性** | 中 | 高 | 高 |
| **配置** | 复杂 | 简单 | 中 |
| **网页版** | 支持 | 不支持 | 不支持 |

## 相关页面

- [[MCP]] — 底层协议
- [[Nocturne Memory]] — 记忆服务器
- [[Claude Code]] — 原生支持 MCP 的工具
- [[MCP Gateway]] — MCP 聚合网关
