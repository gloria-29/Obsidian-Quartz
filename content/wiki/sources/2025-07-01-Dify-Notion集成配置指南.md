---
tags: [Dify, Notion, 知识库, Docker, RAG, 集成配置]
created: 2025-07-01
updated: 2026-06-13
sources: [raw/notes/2025-07-01-Dify-Notion集成配置指南.md]
---

# Dify-Notion 集成配置指南

## 概要

通过 Docker Compose 部署 Dify 后集成 Notion 知识库的完整排错和配置指南。核心问题：默认的 Notion 公共集成（OAuth）需要 HTTPS 回调，在本地或 HTTP 部署环境下会报错"client_id should be a string"。解决方案：切换为 Notion 内部集成（Internal Integration），跳过 OAuth 流程。

## 核心内容

### 问题诊断
- 错误信息：`client_id should be a string or undefined, instead was 0`
- 原因：Docker Compose 部署时 `NOTION_CLIENT_ID` 环境变量未正确配置
- 根本原因：公共集成的 OAuth 流程需要 HTTPS 回调 URL，本地 HTTP 环境无法满足

### 解决方案：切换为内部集成

**修改 .env 文件中的三处配置：**
```
NOTION_INTEGRATION_TYPE=internal
NOTION_INTERNAL_SECRET=secret_XXXXXXXXXXXXXXXX
# NOTION_CLIENT_ID=
# NOTION_CLIENT_SECRET=
```

**重新部署命令：**
```bash
cd /path/to/dify/docker
docker-compose down
docker-compose pull   # 可选，拉取最新镜像
docker-compose up -d
```

### 两种集成类型对比

| 特性 | 公共集成（Public） | 内部集成（Internal） |
|------|-------------------|---------------------|
| 认证方式 | OAuth 2.0 | 直接使用 Token |
| HTTPS 要求 | 必需 | 不需要 |
| 配置复杂度 | 较高（需 Client ID + Secret） | 低（只需 Internal Secret） |
| 适用场景 | 多用户、生产环境 | 单用户、本地开发 |

### 关键注意事项
- SSL 证书不是 Dify 运行的强制要求，`NGINX_HTTPS_ENABLED=false` 即可以 HTTP 运行
- Notion 集成类型与 SSL 配置无关，两种类型在 HTTP/HTTPS 下均可工作
- 修改配置后必须 `docker-compose down` 再 `up -d`，不能只 restart

## 关键概念

- **Dify**: 开源 LLM 应用开发平台，支持 RAG 知识库、工作流编排等功能
- **Notion 内部集成**: 使用 Notion Integration Token 直接认证，无需 OAuth 授权流程
- **OAuth 2.0**: 开放授权协议，公共集成需要用户授权跳转，要求 HTTPS 回调

## 关联实体

- [[知识管理与笔记系统]] — Dify + Notion 构成知识管理的技术栈
- [[独立开发与营销]] — Dify 是独立开发者构建 AI 应用的重要工具

## 相关页面

- [[知识管理与笔记系统]] — Notion 作为知识库后端的优劣分析
- [[独立开发与营销]] — 利用 Dify 构建 AI 产品和服务的实践经验
- [[NotebookLM]] — 另一种基于文档的 AI 问答方案，与 Dify RAG 形成互补
