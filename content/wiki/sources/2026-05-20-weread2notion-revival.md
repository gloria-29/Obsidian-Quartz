---
tags: [微信读书, Notion, GitHub Actions, 自动化]
created: 2026-05-20
updated: 2026-05-20
sources: []
---
# WeRead2Notion 复活：新版微信读书同步指南

> 作者通过解包微信读书 Skills 发现其 API 文档，基于此将 WeRead2Notion 项目从 Cookie 方式升级为 API Key 方式，并完善了部署流程。

## 核心观点
- 微信读书 Skills 包内实际是一组微信读书 API 文档（书籍、书架、笔记、搜索等接口）
- 新版 WeRead2Notion 使用 WEREAD_API_KEY 替代 Cookie，通过 GitHub Action 自动同步
- 同步流程：微信读书 Skills 页面创建 Key -> Notion 授权 -> Fork 项目 -> 配置 Secrets -> 手动运行
- 开源版有明确限制：不能自定义 Notion 模板，同步时会删除重建书籍页面
- NotionHub 微信读书付费版提供增量同步、热力图、书架同步等更多功能

## 关键概念
- [[微信读书]] — 腾讯旗下电子书阅读平台，提供阅读数据和笔记 API
- [[Notion]] — 多功能笔记和数据库工具，通过 Integration Token 实现数据同步
- [[GitHub Actions]] — GitHub 提供的 CI/CD 服务，用于定时自动执行同步脚本

## 相关页面
- [[Notion]]
- [[Obsidian]]
