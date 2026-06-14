---
tags: [CMS, Cloudflare, 自托管, 无服务器, microfeed, RSS, 播客]
created: 2025-12-24
updated: 2026-06-13
sources: [idcflare.com, Listen Notes]
---

# Cloudflare自托管轻量CMS——microfeed

## 概要

microfeed是由Listen Notes公司开发的开源轻量级CMS，完全托管在Cloudflare生态系统上，支持发布播客、博客、照片、视频、文档和URL链接等多种内容格式。采用AGPL-3.0许可，利用Cloudflare Pages + R2 + D1实现近乎免费的自托管内容管理。

## 核心内容

### 技术架构

- **Cloudflare Pages**：代码托管与运行环境
- **Cloudflare R2**：媒体文件存储与分发（S3兼容API）
- **Cloudflare D1**：元数据存储（SQLite数据库）
- **Cloudflare Zero Trust**：管理员仪表盘登录认证
- 免费额度充足：10GB存储 + 1000万读/月 + 100万写/月

### 多格式支持

- 可发布音频、视频、图片、文档、博客文章和外部URL
- 内容可呈现为网页、RSS订阅源和JSON Feed
- 支持无头CMS模式，提供OpenAPI规范供第三方调用
- 支持播客追踪服务（OP3、Podtrac等）

### 部署流程

1. Fork GitHub仓库到个人账户
2. 配置5个必需密钥（CLOUDFLARE_ACCOUNT_ID、API_TOKEN、R2密钥等）
3. 触发GitHub Actions自动部署
4. 配置自定义域名
5. 完成管理员初始设置后即可发布

### 数据管理

- 元数据存储在D1（SQLite），媒体文件存储在R2
- D1备份使用wrangler命令行导出
- R2备份需编写脚本使用S3兼容API批量下载
- 使用自定义域名 + 定期备份可降低平台依赖风险

## 关键概念

- **无服务器CMS**：无需自维护服务器，完全托管在Cloudflare边缘网络
- **无头CMS**：仅提供数据API，前端由第三方应用自由构建
- **JSON Feed**：JSON格式的内容订阅源，兼容JSON Feed规范
- **mustache.js**：前端模板引擎，用于样式自定义

## 关联实体

- [[Cloudflare]] — 底层基础设施平台
- [[microfeed]] — 核心开源CMS项目
- [[无服务器架构]] — 技术架构模式

## 相关页面

- [[Cloudflare自托管方案]] — Cloudflare生态自托管应用
- [[GitHub]] — 代码托管与部署入口
- [[自建博客与网站]] — 个人建站方案对比
