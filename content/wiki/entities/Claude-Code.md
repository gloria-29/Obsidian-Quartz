---
type: entity
aliases: [Claude Code, Claude, Anthropic CLI]
tags: [AI编程, Anthropic, CLI工具, AI Agent, MCP]
---

# Claude Code

## 概述

Claude Code 是 Anthropic 推出的 CLI AI 编程工具，运行在终端中，能够分析代码仓库、执行编程任务、理解上下文。支持 MCP（Model Context Protocol）配置，可无缝集成外部工具和数据源。作为 AI 编程工具领域的标杆产品，Claude Code 也是 PAI（Personal AI Infrastructure）等个人 AI 系统的底层运行平台。

## 核心功能

### 功能特点
- **终端原生运行**：直接在命令行中理解项目上下文、读取文件、编写代码
- **MCP 协议支持**：原生支持 MCP 服务器，可连接外部工具（爬虫、数据库、知识库等）
- **Skills 系统**：通过 Markdown 指令文件定义工作流，让领域专家无需编程也能教 AI 执行复杂任务
- **全栈开发能力**：从前端到后端、从代码生成到部署的完整开发流程
- **Agent 模式**：支持自主迭代完成复杂多步骤任务
- **与编辑器集成**：可通过 Cursor、VSCode 等编辑器接入

### 使用场景
- **自动化编程**：代码生成、重构、调试的全流程代理
- **知识库构建**：与 Obsidian 配合构建自动编译的私人知识库（Karpathy 工作流）
- **SEO 优化 Agent**：24 小时内让新网站做到谷歌搜索结果前三名
- **MCP 桥接**：通过 MCP 连接 Dify、Crawl4AI、Ollama 等工具
- **Vibe Coding**：自然语言描述需求，AI 自动生成完整应用

## 关键概念

- **Skills**：Claude Code 的可复用工作流单元，定义为 Markdown 文件
- **MCP（Model Context Protocol）**：Anthropic 推出的开放协议，连接 AI 与外部工具的标准化接口
- **Agent 模式**：AI 自主规划、执行、验证的多步骤代理行为

## 关联实体

- [[MCP]] — Claude Code 的工具集成协议
- [[Codex (OpenAI Coding Agent)]] — OpenAI 的同类竞品
- [[iFlow-CLI]] — 同为终端 AI 编程助手
- [[CodeBuddy]] — 腾讯出品的 AI CLI 编程工具
- [[DeepSeek]] — 可通过 DS2API 接入 Claude Code 生态的替代模型
- [[OpenCode]] — Claude Code 的开源替代品

## 相关素材

- [[2025-08-27-gemini-seo-agent]] — James 用 Claude Code 24 小时冲上谷歌前三
- [[2026-05-20-codex-plus-plus]] — Codex++ 对比 Claude Code
- [[2026-04-30-i-built-a-knowledge-base-that-writes-itself]] — 用 Claude Code 构建自动化知识管道
- [[2026-01-11-claude-skills-intro]] — Claude Code Skills 概念与实战
- [[2026-05-17-pai-life-os]] — PAI 基于 Claude Code 构建生活操作系统
