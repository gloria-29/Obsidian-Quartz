---
tags: [agent, memory, monitoring, health, notification, nous-research]
created: 2026-05-19
updated: 2026-05-19
type: entity
sources:
  - raw/articles/2026-05-18-20260428-openclaw-hermes-nocturne-notion.md
---

# Hermes Agent

> Nous Research 开发的全时运行个人 AI Agent，设计为"传感器"角色——负责监测用户的身心状态、日常数据和情绪波动，通过 SQLite 数据库存储分散记忆，并提供模式检测算法分析规律。

## 概述

Hermes Agent（注意：与 Nous Research 的 Hermes 模型系列不同，此处指其 Agent 系统）是一个独立的个人 AI Agent，设计定位为个人生态系统的"感官层"。它运行在服务器上（路径：`/root/.hermes`），使用 SQLite 数据库（`state.db` 存储状态/记忆、`response_store.db` 存储对话历史）记录用户的日常碎片化数据。

Hermes 的核心设计哲学是"传感器"——它不负责复杂的推理或决策，而是专注于**数据采集**：饮食记录、心情变化、睡眠质量、生理数据（如心率）等。它内置 `detect_patterns` 算法用于发现隐藏的行为规律，然后将精炼的关键结论传递给主脑 Agent。

## 关键特性

- **多模型支持**：可配置使用 moonshotai/kimi-k2.6 等模型
- **多重人格设置**：内置多种交互风格（如 kawaii 等）
- **SQLite 数据存储**：轻量低噪，`state.db` + `response_store.db` 双数据库架构
- **模式检测算法**：`detect_patterns` 自动分析用户行为规律
- **可配置指令集**：通过 `SKILL.md` 等文件定义行为

## 在 OpenClaw 集成中的角色

在三系统架构中，Hermes 担任"传感器"角色：

- **数据流向**：所有日常日志进入 Hermes DB（轻量、低噪）
- **每日巡检**：Kitty（OpenClaw 主脑）在每天 18:00 读取 Hermes 的关键结论
- **写入九宫格**：关键诊断建议（如"本周心率不稳与 Omad 进食时间有关"）写入九宫格的"身心分册"
- **USER.md 共享**：Hermes 强制引用 OpenClaw Workspace 中的 `USER.md` 作为唯一用户画像源

## 简明集成逻辑

```
Hermes (感官) → 负责"记流水账"：饮食、心情、睡眠
Kitty (主脑) → 负责"看图说话"：定期翻 Hermes 记录，把点连成线
USER.md (唯一控制台) → 负责"你是谁"：一处修改，两系统同步
```

## 关系

- 相关页面：[[OpenClaw]], [[Nocturne Memory]], [[AI记忆方案]], [[PAI]]
- 系统集成：在 [[OpenClaw]] 生态中担任感官层，定期向主脑传递分析结论
- 数据锁定：核心记忆交给 [[Nocturne Memory]] 锁定，防止 AI 修改
- 功能互补：与 [[PAI]] 的 Pulse 仪表盘在健康监测功能上有重叠

## 来源参考

- OpenClaw × Hermes × Nocturne 三系统集成 Telegram 记录
- Hermes 服务器路径与数据库结构定位记录
