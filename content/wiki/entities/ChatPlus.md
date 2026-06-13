---
tags: [mcp, browser-extension, agent, chat-enhancement, code-mode]
created: 2026-05-19
updated: 2026-05-19
type: entity
sources:
  - raw/articles/2026-05-18-20260428-chatplus.md
  - raw/articles/2026-05-18-20260428-本地-mcp-gateway.md
  - https://github.com/510myRday/Chat-Plus
---

# ChatPlus

> 面向 AI 聊天网站的适配器驱动式 MCP 编排浏览器扩展，将网页聊天 UI 接入 MCP 服务器与 Skills，支持 Code Mode 受控沙箱执行工具工作流。

## 概述

ChatPlus 是一个浏览器扩展（Chrome/Firefox），专门为 ChatGPT、Gemini、豆包、Qwen Chat 等 AI 聊天网站注入 MCP 工具能力。它不修改网页端内部，而是通过适配器驱动设计，在页面、扩展运行时和 MCP 服务器之间架设桥梁，让模型能够发现工具、调用工具、并在拿到工具输出后自动继续同一段对话。

ChatPlus 的核心创新在于 **Code Mode**：将 MCP 工具暴露为可在沙箱中用 JavaScript 编程调用的接口，而非简单的不透明远程调用。模型可以在沙箱中编写 JavaScript 串联多个工具、检查中间结果、重塑输出，最终返回干净的最终结果。

## 关键特性

- **适配器驱动**：每个网站使用独立的 JavaScript 适配器脚本，遵循四钩子契约（`transformRequest`、`extractResponse`、`decorateBubbles`、`continueConversation`）
- **Code Mode**：提供受控 JavaScript 沙箱运行时，支持 `tools.<serverAlias>.<toolAlias>(args)` 调用 MCP 工具
- **按标签页独立编排**：每个页面可分别启用扩展、预设、服务器与工具
- **自动续聊**：工具运行完成后，自动发送结果或填入输入框供审阅
- **系统提示词重注入**：当对话长度或 URL 变化需要时，重新应用已解析的系统指令
- **原生 MCP 执行**：从远程 MCP 服务器发现工具，通过 SSE/Streamable HTTP 进行调用
- **GPL v3 开源**：代码开放，支持商业许可

## 工作原理

```
AI 聊天网站 → ChatPlus 内容运行时 → 已启用的 MCP 服务器
→ 工具发现 → Code Mode 清单(别名+Schema) → 沙箱运行时
→ AI 输出 JavaScript 并发起工具调用 → 沙箱桥接层
→ 后台 MCP 客户端 → MCP 传输层(SSE/Streamable HTTP) → MCP 服务器
→ 执行结果 → 继续对话
```

ChatPlus 需要配合 [[MCP Gateway]] 使用：如果 MCP 工具或 SKILL.md 工作流只存在于本地（如 stdio 模式），需先通过 MCP Gateway 将其暴露为 SSE/HTTP 端点。

## 关系

- 相关页面：[[MCP Gateway]], [[MCP协议与工具生态系统]], [[AI Agent框架]]
- 技术依赖：需配合 [[MCP Gateway]] 暴露本地 MCP 服务
- 框架生态：在 [[AI Agent框架]] 中定位为浏览器端 Agent 增强工具
- 对比参考：与 [[GenericAgent]]、[[PAI]] 定位不同——ChatPlus 是轻量级浏览器增强，而非完整的 Agent 框架

## 来源参考

- ChatPlus 官方文档（GitHub）
- MCP Gateway 配合使用指南

## 适配器驱动设计详解

ChatPlus 的每个宿主网站使用一份独立的 JavaScript 适配器脚本，遵循固定的**四钩子契约**：

| 钩子 | 职责 | 运行环境 |
|------|------|----------|
| `transformRequest(ctx)` | 注入系统指令或工具结果到出站请求 | 页面上下文 |
| `extractResponse(ctx)` | 从响应中提取助手文本和协议块 | 页面上下文 |
| `decorateBubbles(ctx)` | 重写消息 DOM，隐藏协议文本，渲染 toolCall/toolResult/codeMode UI | DOM 快照沙箱 |
| `continueConversation(ctx)` | 返回 DOM 计划，将结果放回输入框并触发发送 | DOM 快照沙箱 |

适配器必须返回一个对象，包含 `meta` 块（含 `contractVersion`、`adapterName`、`capabilities`）和四个钩子。

**重要行为约束**：
- `decorateBubbles` 和 `continueConversation` 运行在 DOM 快照沙箱中，不直接操作真实页面
- `transformRequest` 面对加密载荷可安全 `return null`，ChatPlus 会退回 DOM 预填充方式
- 如果目标站点改了请求字段或 DOM 形状，应修复适配器脚本而非修改扩展核心
- 沙箱提供 `ctx.helpers.protocol.*`、`ctx.helpers.ui.*`、`ctx.helpers.plans.*` 共享 helper

**已适配站点**（仓库 `web_chat_js/` 目录）：ChatGPT、Gemini、Google AI Studio、豆包、Qwen Chat、Arena、小米 Mimo、Z.ai

## Code Mode 详细机制

Code Mode 是 ChatPlus 的核心创新——将 MCP 工具从"薄连接器"提升为"可编程运行时"。

### 执行流程

1. ChatPlus 从已启用 MCP 服务器发现工具
2. 转换为带**稳定别名和输入 schema** 的清单
3. 注入完整的已启用 `tools.*` 目录及简短描述
4. 模型在沙箱中编写 JavaScript，可调用 `tools.<serverAlias>.<toolAlias>(args)`
5. 模型可调用 `toolDocs.describe(ref)` 查看单个工具的完整文档
6. 支持 `await`、`Promise.all`、`console.log(...)`、结构化 `return`
7. 沙箱通过桥接层将调用转发给后台 MCP 客户端（SSE/Streamable HTTP）
8. 结果流回沙箱，最终输出返回对话

### 沙箱安全限制

Code Mode **不允许**：
- 直接访问 DOM
- `window`、`document`、`fetch`、`XMLHttpRequest`、`chrome`、`browser`
- `import` / `export`
- 任意第三方库

## MCP 编排架构

ChatPlus 不把 MCP 当成一次性传输调用，而是：

1. 从已启用 MCP 服务器发现工具接口
2. 标准化为清单（稳定别名 + 输入 schema）
3. 注入完整工具目录及描述到对话上下文
4. 模型编写 JavaScript 编排代码，串联多工具、检查中间结果、重塑输出
5. 结果作为执行输出回到对话

```
MCP 服务器 → 工具发现 → 清单(别名+Schema) → 沙箱运行时
→ AI 输出 JavaScript → 桥接层 → 后台 MCP 客户端
→ SSE/Streamable HTTP → MCP 服务器 → 执行结果 → 对话
```

## 安装与构建

```bash
npm install
npm run build          # 输出 dist/chrome 和 dist/firefox
npm run dev            # 开发模式 watch
```

| 浏览器 | 输出目录 | 加载方式 |
|--------|----------|----------|
| Chrome/Edge | `dist/chrome/` | chrome://extensions → 开发者模式 → 加载已解压 |
| Firefox | `dist/firefox/` | about:debugging → This Firefox → 加载 manifest.json |

### 配置步骤

1. 打开目标聊天网站
2. 打开 ChatPlus 侧边栏
3. **Site** → 添加/编辑适配器脚本
4. **Tools** → 注册 MCP 服务器（SSE/Streamable HTTP 端点）
5. **Orchestration** → 按标签页启用工具

## 项目结构

```
src/
├─ background/          # MCP 客户端、连接池、发现与工具调用
├─ content/             # 注入状态、续聊、Code Mode、界面组件
├─ page-monitor/        # 页面上下文中的请求/响应拦截
├─ sandbox/             # 适配器与 Code Mode 沙箱执行器
├─ sidepanel/           # React 侧边栏 UI
├─ mcp/                 # MCP 配置辅助与清单生成
├─ system-instructions/ # 预设与解析逻辑
└─ shared/              # 共享协议标记与工具函数
```
