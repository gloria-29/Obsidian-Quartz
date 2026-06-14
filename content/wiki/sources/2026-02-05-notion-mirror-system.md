---
tags: [Notion, OpenClaw, MCP, Cloudflare, 系统设计, 知识管理]
created: 2026-02-05
updated: 2026-06-13
sources:
  - https://copilot.microsoft.com/pages/KAFSYfq7YEzDmaUHKj2n
---

# Notion 单向镜像系统设计文档

## 概要

基于 OpenClaw + MCP + Skills + Playwright + Cloudflare R2 构建的 Notion 数据库单向同步系统完整设计方案。实现从团队工作区到个人工作区的增量镜像，涵盖三层能力模型、五大MCP工具定义、七层Skills组合链、OpenClaw编排层及部署配置。是[[个人AI基础设施]]中数据同步与[[知识管理与笔记系统]]集成的典型案例。

## 核心内容

### 三层能力模型

```
OpenClaw（任务编排/重试/补偿）
    ↓
Skills（能力组合/可复用）
    ↓
MCP（原子能力/底座）
```

- **MCP层**只做原子能力，不做复杂流程
- **Skills层**只做能力组合，把多个MCP工具组合成高层操作
- **OpenClaw层**只做任务编排，决定何时调用哪个Skill

### 五大MCP工具

| 工具 | 职责 |
|------|------|
| `notion_api` | 封装Notion官方API（查询/获取/创建/更新页面和block） |
| `notion_web` | Playwright自动化抓取Notion网页中的文件URL |
| `r2_upload` | 下载文件 → 上传Cloudflare R2 → 返回URL映射 |
| `diff_engine` | 纯逻辑差异计算（创建/更新/跳过分类） |
| `sync_engine` | 根据diff + file_map执行同步，递归复制block |

### 七层Skills组合链

```
skill.sync_notion_database（顶层入口）
  ├─ skill.query_source_database
  ├─ skill.query_target_database
  ├─ skill.compute_diff
  ├─ skill.collect_files_for_sync
  ├─ skill.backup_files_to_r2
  └─ skill.sync_database_changes
```

### 增量同步核心逻辑

目标库中有 `Source ID` 匹配则检查 `last_edited_time` 决定跳过或更新；无匹配则创建新页面 + 递归复制block。文件从 `secure.notion-static.com` 抓取 → 下载 → 上传R2 → 替换目标页面URL。

### 部署架构

Cloudflare Worker触发 → OpenClaw Agent（`notion_mirror_agent`）执行 → R2 Bucket存储备份文件，支持自定义域名。

## 关键概念

- [[单向镜像]] — 数据从源到目标的单向同步模式，目标端不做反向写入
- [[MCP]] — Model Context Protocol，定义原子能力封装
- [[Cloudflare R2]] — S3兼容的对象存储服务
- [[知识管理与笔记系统]] — Notion作为团队知识库的同步与备份需求

## 关联实体

- [[OpenClaw]] — AI Agent编排框架，负责任务调度
- [[Notion]] — 团队协作知识库，同步的数据源
- [[个人AI基础设施]] — 系统设计所处的更大架构上下文

## 相关页面

- [[AI工具与应用-扩展]]
- [[个人AI基础设施]]
- [[知识管理与笔记系统]]
- [[Claude Code]]
