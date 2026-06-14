---
type: entity
aliases: [elog]
tags: [blog-tool, cli, cross-platform, markdown, sync, 博客工具]
created: 2026-05-28
updated: 2026-06-14
sources:
  - raw/articles/2025-08-12-elog-config.md
  - raw/notes/2025-08-01-Elog.md
---

# Elog

## 概述

Elog 是一款开放式的跨平台博客同步 CLI 工具，支持从多种写作平台（语雀、Notion、FlowUs、飞书）批量导出 Markdown 格式内容，并自动发布到 Hexo、VitePress、Hugo 等主流静态博客框架，或直接发布到 Halo、WordPress、Confluence 等 CMS 平台。内置图床支持和 CI/CD 集成能力，是构建现代化博客工作流的关键工具。

## 核心功能

### 功能特点
- **多写作平台导出**：支持语雀、Notion、FlowUs、飞书作为内容来源
- **多博客框架发布**：支持 Hexo、VitePress、Hugo 等静态博客框架
- **直达 CMS**：支持直接发布到 Halo、WordPress、Confluence
- **内置图床支持**：本地、腾讯云 COS、阿里云 OSS、七牛云、又拍云、GitHub 图床
- **持续集成**：支持 GitHub Actions + Webhooks + Pipeline 的自动化部署
- **Markdown 优先**：所有内容统一转换为标准 Markdown 格式
- **增量同步**：仅同步发生变化的内容，避免重复处理

### 使用场景
- **Notion → 博客**：用 Notion 写作，自动同步到个人博客
- **语雀 → 博客**：将语雀知识库同步到博客网站
- **多源聚合**：将多个写作平台的内容聚合到统一博客
- **团队协作**：多人通过不同平台写作，统一发布到公司博客

## 关键概念

- **跨平台同步**：不同写作平台和发布平台之间的双向/单项同步
- **图床迁移**：写作平台中的图片自动迁移到配置的图床
- **CI/CD 博客**：通过持续集成实现"写作即发布"的工作流

## 关联实体

- [[Obsidian]] — 同为笔记写作工具，可与 Elog 配合使用
- [[Notion]] — Elog 支持的主要内容来源之一
- [[简悦]] — 同为内容采集→处理→输出的工具，Elog 侧重发布端，简悦侧重采集端

## 相关素材

- [[wiki/sources/2025-08-12-elog|Elog 跨平台博客解决方案]]
- [[wiki/sources/2025-08-01-Elog|Elog 配置笔记]]
