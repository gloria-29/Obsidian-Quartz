---
tags: [mcp, gateway, memory, agent, local-first, always-on]
created: 2026-05-19
updated: 2026-05-19
type: entity
sources:
  - raw/articles/2026-05-18-20260428-openclaw-hermes-nocturne-notion.md
  - raw/articles/2026-05-18-20260428-recommended-ai-agent-memory-solutions.md
---

# OpenClaw

> 全时本地 AI 网关与个人助手，排名 AI 记忆方案第 9 名，通过原生三层工作区记忆和 50+ 平台桥接实现无感 AI 交互。

## 概述

OpenClaw 是一个全时运行（always-on）的个人 AI 助手系统，在 2026 年开源 AI Agent 记忆方案评选中排名第 9。它采用原生三层记忆架构（Context Tree、Workspace Memory、Daily Memory logs），能桥接超过 50 个平台（Telegram、iMessage 等），并在每天结束时自动整理日度洞察日志。

OpenClaw 的核心设计哲学是以文件系统为 Root、以实时分析为 Stream。它既是 MCP 协议的"母舰"（可接入 Nocturne Memory、Notion MCP 等外部记忆和工具服务），也是个人 AI 生态系统的"总控台"——通过将 Hermes 记忆分析、Nocturne 记忆存储、Notion 远程协作等功能统一汇聚到 OpenClaw Workspace 中。

## 关键特性

- **三层工作区记忆**：Context Tree（上下文树）+ Workspace Memory（工作区记忆）+ Daily Memory logs（日度记忆日志），提供分层记忆管理
- **50+ 平台桥接**：原生支持 Telegram、iMessage 等多种即时通讯平台，统一 AI 交互入口
- **全时运行（Always-On）**：作为后台服务持续运行，主动监控和分析用户数据
- **MCP 母舰**：可接入 Nocturne Memory MCP、Notion Local Ops MCP 等外部服务作为"大脑插件"
- **日度洞察日志**：每天自动整理和生成用户当日关键信息摘要
- **文件系统优先**：以本地文件系统为根，所有数据和配置透明可读
- **简易部署**：通过 `curl -fsSL https://openclaw.ai/install.sh | bash` 一键安装，`openclaw onboard --install-daemon` 配置后台服务

## 与其他系统的集成

### OpenClaw × Hermes × Nocturne 三系统集成

在 Telegram 私聊中记录的集成实践展示了 OpenClaw 作为"主脑"的核心地位：

- **Hermes（感官层）**：负责"记流水账"——监测饮食、心情、睡眠等日常数据，存入 SQLite 数据库。通过软链接（`ln -s /root/.hermes /root/.openclaw/workspace/memory/hermes_brain`）映射到 OpenClaw Workspace。
- **Nocturne（核心/定论层）**：作为"真理刻录机"，锁定 Telos、SOUL.md、USER.md 等核心身份文件，AI 只能读取不能随意修改，修改需通过 Snapshot 审批流程。
- **OpenClaw（主脑/执行层）**：Kitty Agent 负责干活，统一读取 Hermes 的分析结论和 Nocturne 的核心记忆，在 Telegram 界面中提供智能交互。

### 集成逻辑
```
Hermes (感官) → 负责"记流水账"
Kitty (主脑) → 负责"看图说话"，定期翻 Hermes 记录，把点连成线
USER.md (唯一控制台) → 负责"你是谁"，一处修改、两系统同步
```

## 关系

- 相关页面：[[AI记忆方案]], [[MCP协议与工具生态系统]], [[PAI]]
- 记忆系统：使用三层工作区记忆，在 [[AI记忆方案]] Top 20 中排名第 9
- 生态集成：作为 MCP 母舰，接入 [[Nocturne Memory]] 和 [[Hermes Agent]]
- 同生态位：与 [[PAI]] 同为个人 AI 基础设施，但侧重网关/桥接角色

## 来源参考

- AI Agent Memory 解决方案 Top 20 排名（2026）
- Telegram 私聊记录：OpenClaw × Hermes × Nocturne 集成方案
