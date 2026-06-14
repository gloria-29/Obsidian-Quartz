---
tags: [Hermes Agent, AI记忆系统, OpenClaw, Prompt Caching, Agent记忆, 系统设计, AI]
created: 2026-04-30
updated: 2026-06-13
sources:
  - https://mp.weixin.qq.com/s/Oq33YStOaYOdzQ7wXHii9w
  - https://x.com/manthanguptaa/status/2034849672985288957
---
# 深度拆解 Hermes Agent 的记忆系统：它如何修正 OpenClaw 的误区

## 概要

Manthan Gupta 对开源 AI 智能体 Hermes Agent 的记忆架构进行了代码级逆向分析。Hermes 拥有四套记忆系统（提示词记忆、SQLite 历史会话搜索、技能程序记忆、Honcho 用户建模），通过冷热分离和缓存优先的设计原则，在记忆持久化与提示词稳定性之间找到了平衡，修正了 OpenClaw 以 Markdown 为核心的"流水账"式记忆误区。

## 核心内容

### 四层记忆架构

| 层级 | 存储位置 | 用途 | 限制 |
|------|---------|------|------|
| 第一层：提示词记忆 | `MEMORY.md` + `USER.md` | 智能体笔记、用户画像 | 分别限 2200 / 1375 字符 |
| 第二层：会话搜索 | SQLite 数据库 | 按需全文搜索历史会话 | 搜索后用廉价模型摘要 |
| 第三层：技能记忆 | `~/.hermes/skills/` | 程序性记忆（如何做事） | 仅加载索引，按需加载内容 |
| 第四层：Honcho 用户建模 | 可选外部服务 | 跨设备深层用户建模 | 附加在用户消息后，不破坏缓存 |

### 关键设计原则

- **缓存优先**：系统提示词前缀尽可能稳定，利用 LLM 的 Prompt Caching 降低延迟和成本
- **冷热分离**：高频事实注入提示词（热），低频历史交给工具按需检索（冷）
- **记忆冲刷（Memory Flush）**：对话压缩前先执行一次模型调用，让模型将值得记住的信息写入 `MEMORY.md`，避免有损摘要丢失关键事实
- **精选状态而非日记**：保存用户偏好、环境事实、反复出现的错误修正；不保存任务进度、会话结果、临时待办

### 与 OpenClaw 的核心区别

OpenClaw 的记忆偏向以 Markdown 为中心的日志存储，系统提示词中包含大量历史信息。Hermes 则严格限制提示词记忆容量（约 1300 Token），认为"不是所有东西都配住在系统提示词这个黄金地段"。

## 关键概念

- [[Hermes Agent]] — 开源 AI 智能体，四层记忆架构设计，缓存优先
- [[Prompt Caching]] — 保持提示词前缀稳定以利用 LLM 缓存机制
- 记忆冲刷 — 压缩对话前自动保存关键信息的机制
- [[AI记忆方案]] — AI Agent 中冷热分离、多层级的记忆管理架构范式
- [[Letta]] — 另一种 AI Agent 记忆管理框架，可对比架构差异
- [[Mem0]] — AI 记忆层方案，提供跨会话记忆持久化

## 关联实体

- [[Hermes Agent]]
- [[Nocturne Memory]]
- [[Letta]]
- [[Mem0]]

## 相关页面

- [[PAI]]
- [[AI记忆方案]]
- [[Hermes Agent]]
