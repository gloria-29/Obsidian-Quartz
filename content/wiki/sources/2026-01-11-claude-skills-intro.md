---
tags: [Claude Skill, AI, 函数调用, MCP]
created: 2026-01-11
updated: 2026-01-11
sources: []
---
# Claude Skills 入门：AI 从嘴替到打工人

> 王树义从编程函数 -> LLM 函数调用 -> Claude Skills 三层台阶的角度，系统讲解 Claude Skills 的概念和应用。

## 核心观点
- 三层台阶：编程函数（确定性代码执行） -> LLM 函数调用（概率性工具调用） -> Claude Skills（工作流级蓝图）
- Skills = SKILL.md（自然语言指令） + 脚本（Python/JS 等） + 资源文件（文档/模板/配置）
- Skills 支持渐进式披露：平时只告诉 AI"有这本说明书"，用到时再加载内容
- 关键认知：Skills 可以包含函数调用，但函数调用只是 Skills 的一部分——Skills 是整套解决方案
- Claude Skills 已被 Anthropic 作为开放标准发布，类似 MCP 的开放生态路线

## 关键概念
- [[Claude Skill]] — Anthropic 推出的 AI 工作流封装标准，可复用、可组合
- [[MCP]] — Model Context Protocol，Anthropic 的 AI-工具连接标准
- [[函数调用]] — LLM 根据意图自动选择和调用外部工具的能力
- [[渐进式披露]] — 按需加载 Skill 内容以优化上下文窗口使用

## 相关页面
- [[Claude Code]]
- [[OpenClaw]]
- [[OpenCode]]
