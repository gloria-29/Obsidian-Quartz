---
tags: [Hermes Agent, OpenClaw, Agent记忆, 系统设计, AI]
created: 2026-04-30
updated: 2026-04-30
sources: []
---
# Hermes Agent 记忆系统深度拆解

> Hermes Agent 拥有四套记忆系统，通过冷热分离、缓存优先的设计原则，修正了 OpenClaw 在记忆管理上的误区。

## 核心观点
- Hermes 有四层记忆：精简提示词记忆（MEMORY.md + USER.md）、SQLite 历史会话搜索、技能程序记忆、可选 Honcho 用户建模
- 核心设计原则：保持提示词稳定以便利用 Prompt Caching，其他信息交给工具按需检索
- MEMORY.md 限 2200 字符、USER.md 限 1375 字符，刻意保持极小——记忆是"精选状态"而非"流水账"
- 与 OpenClaw 的关键区别：Hermes 关注缓存效率，不把所有历史塞进系统提示词
- 压缩前先执行"记忆冲刷"（Memory Flush），让模型在对话被压缩前保存关键信息

## 关键概念
- [[Hermes Agent]] — 开源 AI 智能体，拥有四层记忆架构设计
- [[OpenClaw]] — 开源个人 AI 助手，记忆偏向以 Markdown 为中心的存储方式
- [[Prompt Caching]] — 保持提示词前缀稳定以利用 LLM 缓存机制降低延迟和成本
- [[记忆冲刷]] — 压缩对话前自动保存关键信息的机制
- [[Agent记忆系统]] — AI Agent 中冷热分离、多层级的记忆管理架构

## 相关页面
- [[Claude Code]]
- [[OpenClaw]]
