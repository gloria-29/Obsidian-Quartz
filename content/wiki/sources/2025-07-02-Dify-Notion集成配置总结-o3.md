---
tags: [Dify, Notion, 集成配置, Docker, API]
created: 2025-07-02
updated: 2026-06-13
sources: [Dinox笔记]
---

# Dify Notion集成配置总结

## 概要

在Ubuntu云服务器上通过Docker Compose部署Dify并配置Notion内部集成的完整指南。解决了公共集成OAuth流程中NOTION_CLIENT_ID配置错误导致的"client_id should be a string"报错问题，通过切换为内部集成模式绕过OAuth流程。

## 核心内容

### Dify对Notion的两种集成模式
- **公共集成 (public)**：基于OAuth流程，需配置NOTION_CLIENT_ID和NOTION_CLIENT_SECRET
- **内部集成 (internal)**：通过NOTION_INTERNAL_SECRET实现，无需OAuth授权，适合本地/测试环境

### 报错原因分析
- NOTION_CLIENT_ID配置错误（设置成数字0而不是字符串）
- 公共集成需要HTTPS回调，内部集成则不受此限制

### 环境变量配置
```env
NOTION_INTEGRATION_TYPE=internal
NOTION_INTERNAL_SECRET=your_notion_internal_secret_here
NOTION_CLIENT_ID=
NOTION_CLIENT_SECRET=
```

### 详细操作步骤
1. SSH登录Ubuntu云服务器
2. 定位到Dify项目目录 (`cd /home/your_username/dify/docker`)
3. 编辑.env文件修改Notion集成配置
4. 确保.env文件权限正确 (chmod 644)
5. 停止当前容器：`docker-compose down`
6. 可选拉取最新镜像：`docker-compose pull`
7. 重新部署：`docker-compose up -d`
8. 检查状态：`docker-compose ps`
9. 监控日志：`docker-compose logs -f` 确认无OAuth报错
10. 验证：在Dify前端控制台尝试从Notion导入内容

### 注意事项
- .env文件中不能有拼写错误或多余空格
- 修改后必须重启容器生效
- 生产环境建议启用HTTPS
- 可用 `docker-compose config` 查看最终加载的环境变量

## 关键概念

- **Dify**：开源LLM应用开发平台，支持RAG、Agent、工作流等
- **Notion内部集成**：不经过OAuth流程，直接使用API令牌连接Notion的集成方式
- **Docker Compose**：多容器Docker应用的编排工具，通过yaml文件定义服务
- **OAuth vs Internal**：OAuth需要用户授权跳转，Internal直接使用预配置的API令牌

## 关联实体

[[2025-07-02-Dify-Notion集成配置总结-o3]]
[[2025-07-01-Dify-Notion集成配置指南]]
[[2025-06-25-Dify平台详解]]

## 相关页面

[[2025-08-10-dify-mcp-server]]
[[2025-07-04-Dify应用模板设计方案]]
[[gemini-to-notion-exporter]]
