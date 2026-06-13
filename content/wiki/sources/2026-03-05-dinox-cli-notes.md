---
tags: [Dinox, CLI, 笔记工具, Zettelkasten, Claude Code, OpenClaw]
created: 2026-03-05
updated: 2026-03-05
sources: []
---
# Dinox CLI：告别笔记黑洞

> Dinox CLI 是一个基于 Zettelkasten 卡片盒笔记法的命令行笔记工具，配合 AI 工具实现自然语言操作笔记系统。

## 核心观点
- 基于 Zettelkasten 方法，每条笔记是独立卡片，通过标签和卡片盒组织
- 三种接入方式：CLI 直接调用（最快最省 Token）、MCP Server（中等）、API 接口（较慢）
- 配合 Claude Code/OpenClaw/Cursor 使用时，用户只需自然语言描述意图
- CLI 相比 API 节省 80% 以上的 Token，且数据不出本地、完全离线可用
- 支持自动打标签、待办追踪、批量整理笔记、周报生成等高级功能

## 关键概念
- [[Zettelkasten]] — 卡片盒笔记法，卢曼用此法写出 70 本书、400+ 篇论文
- [[Dinox CLI]] — Dinox 笔记系统的命令行客户端，npm 全局安装
- [[MCP]] — Model Context Protocol，Anthropic 推出的 AI 工具连接标准

## 相关页面
- [[Claude Code]]
- [[OpenClaw]]
- [[Obsidian]]
