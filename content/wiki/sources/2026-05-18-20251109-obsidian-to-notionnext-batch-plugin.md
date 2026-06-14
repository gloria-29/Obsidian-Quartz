---
tags: [Obsidian, Notion, NotionNext, 插件, 知识管理]
created: 2025-11-09
updated: 2026-06-13
sources: [raw/articles/2026-05-18-20251109-obsidian-to-notionnext-batch-plugin.md]
---

# Obsidian to NotionNext Batch 插件

## 概要

一个增强版 Obsidian 插件，实现笔记从 Obsidian 批量同步到 Notion，特别针对 NotionNext 博客框架用户优化。支持三种数据库类型（通用、NotionNext、自定义），新增文件夹批量同步功能，自动转换 Callout 语法，是打通 Obsidian 和 Notion 生态的利器。

## 核心内容

### 三种数据库类型
- **通用数据库**：最基础模式，仅同步 title 和 tags 两列，适合简单笔记归档
- **NotionNext 数据库**：专为 NotionNext 博客框架设计，预设所有模板所需字段（titleicon、date、coverurl、slug、status 等）
- **自定义数据库**：最大灵活性，可根据自己的 Notion 数据库结构自定义所有同步字段

### 文件夹批量同步
- 通过命令面板或右键文件夹菜单，一键同步整个文件夹及子文件夹内容
- 内置 API 速率限制保护（100ms 延迟），防止被 Notion API 封禁
- 实时上传进度通知和结果摘要（成功/失败数量）

### 配置与使用
- 创建 Notion Integration → 获取 Token → 创建数据库 → 连接集成 → 获取数据库 ID
- 笔记顶部 YAML Front Matter 的键名必须与 Notion 数据库属性名（小写）完全一致
- v2.3.0 后自定义数据库需重新创建，旧版结构不兼容

## 关键概念

- **NotionNext** — 基于 Notion 的开源博客框架，由 tangly1024 开发
- **Front Matter** — Markdown 文件顶部的 YAML 元数据块，定义同步属性
- **Callout 转换** — 自动将 Obsidian 的 Callout 语法转为 Notion Callout 块

## 关联实体

- [[NotionNext]] — 博客框架，插件的核心适配目标
- [[Obsidian]] — 笔记工具，插件的宿主平台

## 相关页面

- [[简悦x-obsidian升级]] — 同为 Obsidian 生态的网页剪藏与同步工具
- [[I Built a Knowledge Base That Writes Itself]] — 基于 Obsidian 的知识管理方案
