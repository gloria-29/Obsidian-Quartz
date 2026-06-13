---
tags: [ai-tool, coding-agent, anthropic, claude, development, agent-engine]
created: 2026-05-18
updated: 2026-05-19
type: entity
sources:
  - raw/articles/2026-05-18-20260517-personal-ai-infrastructure.md
  - raw/articles/2026-05-18-20260427-genericagent教程.md
---

# Claude Code

## 概述

Claude Code 是 Anthropic 官方的 AI 编程代理，以 CLI 工具形式运行。它是 [[PAI]] 等高级 AI 基础设施的"引擎"——底层推理和代码执行能力的提供者。与普通的代码补全工具不同，Claude Code 可以自主读写文件、执行命令、管理项目。

## 核心能力

| 能力 | 说明 |
|------|------|
| **文件读写** | 自主读取、创建、修改项目文件 |
| **命令执行** | 运行 shell 命令、测试、构建 |
| **代码理解** | 理解整个项目结构和代码关系 |
| **MCP 集成** | 通过 [[MCP]] 协议连接外部工具 |
| **上下文管理** | 智能管理对话上下文窗口 |
| **Hook 系统** | 事件驱动的自动化钩子 |

## Hook 系统

Claude Code 的 Hook 系统允许在特定事件触发时执行自定义脚本：

```bash
# PreToolUse - 工具调用前触发
# PostToolUse - 工具调用后触发  
# Notification - 通知事件触发
# Stop - 会话结束时触发
```

Hook 用途：
- 自动格式化代码（prettier/black）
- 运行 linter 检查
- 自动提交 git
- 发送通知
- 记录操作日志

## 上下文管理原语

Claude Code 提供多种上下文管理工具：

1. **CLAUDE.md**: 项目级指令文件，定义项目规则和偏好
2. **Memory**: 持久化记忆，跨会话保留
3. **Skills**: 可复用的技能包（SKILL.md）
4. **Slash Commands**: 用户自定义命令（/review, /test 等）

## MCP 服务器支持

Claude Code 原生支持 [[MCP]] 协议：

```bash
# 启动时加载 MCP 服务器
claude --mcp filesystem --mcp database

# 或在 CLAUDE.md 中配置
mcp_servers:
  - name: filesystem
    command: npx
    args: ["@modelcontextprotocol/server-filesystem", "/path"]
```

## 与 PAI 的关系

在 [[PAI]] 架构中，Claude Code 是底层引擎：

```
用户 ←→ PAI Pulse Daemon ←→ Claude Code (引擎)
                              ├─ 文件操作
                              ├─ 代码执行
                              ├─ MCP 工具
                              └─ 上下文管理
```

PAI 在 Claude Code 之上构建了：
- Pulse 守护进程（常驻后台）
- DA 身份系统（固定人格）
- Algorithm 工作流（自动化流程）
- Memory 三级记忆系统
- Skills 技能生态

## 使用方式

### 基本用法
```bash
# 启动交互式会话
claude

# 执行单次任务
claude "创建一个 Python Web 管理面板"

# 指定项目目录
claude --project /path/to/project

# 加载 MCP 服务器
claude --mcp server-name
```

### 高级用法
```bash
# 使用 slash 命令
/review    # 代码审查
/test      # 运行测试
/commit    # 提交更改
/explain   # 解释代码
```

## 局限性

- 需要 Anthropic API 密钥（付费）
- 上下文窗口有限（~200K tokens）
- 无法处理图形界面操作
- 网络访问需要 MCP 服务器支持
- 大型项目可能需要分块处理

## 相关页面

- [[PAI]] — 基于 Claude Code 的高级 AI 基础设施
- [[MCP]] — Claude Code 的工具扩展协议
- [[Codex (OpenAI Coding Agent)]] — OpenAI 的类似产品
- [[Hermes Agent]] — 另一个 AI Agent 框架
- [[AI Agent框架]] — 更广泛的 Agent 生态
