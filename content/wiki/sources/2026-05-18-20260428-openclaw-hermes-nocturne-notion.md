---
tags: [OpenClaw, Hermes Agent, Nocturne, Notion, AI基础设施]
created: 2026-05-18
updated: 2026-06-13
sources: [raw/articles/2026-05-18-20260428-openclaw-hermes-nocturne-notion.md]
---

# OpenClaw × Hermes × Nocturne × Notion 集成方案

## 概要
基于 Telegram 私聊（Irene Green）的 7 条原始消息，记录了将 [[OpenClaw]]、[[Hermes Agent]]、[[Nocturne Memory]] 三个 AI 系统整合为统一生活策略系统的完整方案，辅以 Notion 远程操控。核心思路是：Hermes 做传感器（监测记录），Nocturne 做金库（防篡改记忆），OpenClaw 做主脑（执行与决策）。

## 核心内容
### 三大系统定位
- **Hermes（感官/传感器）**：负责记录散碎日志——饮食、心情、睡眠等原始数据，通过 detect_patterns 算法发现规律
- **Nocturne（核心记忆/金库）**：自传体记忆系统，存储 Telos、Identity 等核心人格文件，设置只读权限防止 AI 二次创作
- **OpenClaw（主脑/执行）**：MCP 母舰，承担执行决策和用户交互，Kitty 作为统一入口
- **Notion（远程展板）**：通过 notion-local-ops-mcp 桥接，实现 Notion 界面直接操作本地后端文件

### 减法整合策略
- 废弃臃肿 AGENTS.md 定义，让九宫格代理共享同一个 Hermes 分析引擎
- 清空 MEMORY.md 旧账，历史心情/体重记录挪到 Hermes 数据库，只在 MEMORY.md 留结论
- Telos 校对完锁进 Nocturne，设为"只读加载"

### 无感同步架构
- 物理层：`ln -s /root/.hermes /root/.openclaw/workspace/memory/hermes_brain` 建立软链接
- 配置层：统一 USER.md 为唯一画像源，Kitty 和 Hermes 同时感知用户变化
- 工作流层：cron 脚本每日聚合 Hermes 数据，由 Kitty 以自然语言汇报

### Notion 集成方案
- notion-local-ops-mcp 提供"隧道"，Notion 中编辑的内容自动同步到本地目录
- 需要 cloudflared 隧道支持，按需集成

## 关键概念
- **自传体记忆（Autobiographical Memory）**：Nocturne 的核心能力，区别于 OpenClaw 默认的 RAG 检索式记忆，支持跨模型、跨会话持久化
- **传感器-金库-主脑模型**：Hermes 负责感知记录，Nocturne 负责核心存储，OpenClaw 负责执行决策的三层架构
- **九宫格 Agent（PAI-Grid）**：OpenClaw 的执行框架，以九个功能格位覆盖生活各维度
- **MCP 协议**：Model Context Protocol，上述三个系统均基于此协议实现互操作

## 关联实体
- [[OpenClaw]] — 个人 AI 系统，作为集成方案的主脑和 MCP 母舰
- [[Hermes Agent]] — 智能体框架，擅长规律检测和情绪监测，充当传感器角色
- [[Nocturne Memory]] — 记忆系统，提供防篡改的核心人格存储
- [[Notion]] — 知识管理平台，通过 MCP 桥接实现远程操控

## 相关页面
- [[个人成长与人生规划]] — 集成方案服务于个人生活策略系统的整体规划
- [[生活管理与SOP]] — 九宫格管理和无感同步流程属于生活管理 SOP 的一部分
- [[3x3-App]] — 九宫格系统的具体应用形态
