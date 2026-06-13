---
tags: [Notion, OpenClaw, MCP, Cloudflare, 系统设计]
created: 2026-02-05
updated: 2026-02-05
sources: []
---
# Notion 单向镜像系统设计文档

> 基于 OpenClaw + MCP + Skills + Playwright + Cloudflare R2 的 Notion 数据库单向同步系统，实现从团队工作区到个人工作区的完整增量镜像。

## 核心观点
- 三层能力模型：MCP 底座（原子能力）-> Skills 能力层（能力组合）-> OpenClaw 编排层（任务编排/重试/补偿）
- 五大 MCP 工具：notion_api（API 封装）、notion_web（Playwright 文件抓取）、r2_upload（文件备份）、diff_engine（差异计算）、sync_engine（同步执行）
- 七层 Skills 组合链：查询源数据库 -> 查询目标数据库 -> 计算差异 -> 收集文件 -> 备份到 R2 -> 执行同步
- 增量同步核心逻辑：目标库中有 Source ID 匹配则跳过/更新，无则创建
- 文件真实备份：从 notion-static.com 抓取 URL -> 下载 -> 上传 R2 -> 替换目标页面中 URL

## 关键概念
- [[单向镜像]] — 数据从源到目标的单向同步模式，目标端不做反向写入
- [[MCP工具]] — Model Context Protocol 定义的原子能力封装
- [[Cloudflare R2]] — Cloudflare 对象存储服务，S3 兼容 API

## 相关页面
- [[Notion]]
- [[OpenClaw]]
- [[MCP]]
- [[Cloudflare]]
