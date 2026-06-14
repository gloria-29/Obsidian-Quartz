---
tags: [Notion, API升级, 数据库, TypeScript, 开发工具]
created: 2025-12-11
updated: 2026-06-13
sources: [raw/notes/2025-12-11-Notion-API-Upgrade.md]
---

# Notion API 版本 2025-09-03 升级指南

## 概要

Notion API 2025-09-03 版本引入"数据源"（Data Source）概念，将原有数据库功能进行分层——一个数据库可包含多个数据源，各自拥有独立属性。这是一次非向后兼容的重大更新，涉及 API 端点迁移、请求/响应结构变更、TypeScript SDK v5 升级和 Webhook 事件调整。所有使用 Notion 数据库 API 的集成必须迁移，否则在用户启用多源数据库功能时将出现服务中断。

## 核心内容

### 核心概念变更
- 旧模型：一个数据库对应一个固定数据结构
- 新模型：数据库作为容器，可包含多个数据源（Data Source），每个数据源有独立属性，共享视图和权限
- `database_id` 在很多场景下被 `data_source_id` 取代或补充

### 不兼容变更的影响
- 未更新的集成在用户添加第二个数据源后，以下操作会失败：以数据库为父级创建页面、读写或查询数据库、写入指向该数据库的关系属性

### 六步迁移清单
1. **发现并存储数据源 ID**：调用新的 `GET /v1/databases/:database_id` 端点获取所有子数据源
2. **在创建页面和关系中使用数据源 ID**：将 parent 中的 `database_id` 改为 `data_source_id`（此步骤兼容旧版本 API）
3. **将数据库端点迁移至数据源端点**：操作从 `/v1/databases` 迁移到 `/v1/data_sources` 命名空间
4. **更新搜索 API 处理逻辑**：过滤条件 object 从 `database` 改为 `data_source`
5. **升级 TypeScript SDK 至 v5**：使用新的 `notion.dataSources.*` 方法
6. **处理 Webhook 变更**：新增 `data_source.created/moved/deleted/schema_updated/content_updated` 等事件类型

### API 端点变更细节
- 检索：`GET /v1/databases/{id}` 变为列出数据源；获取具体数据源用 `GET /v1/data_sources/{id}`
- 查询：`POST /v1/databases/{id}/query` 变为 `POST /v1/data_sources/{id}/query`
- 创建：`POST /v1/databases` 仍用于创建数据库及其初始数据源，属性放在 `initial_data_source[properties]` 字段
- 更新：数据库容器属性（title/icon/cover）和数据源属性（schema）分离到不同端点

## 关键概念

- **数据源（Data Source）**：数据库下的子层级，拥有独立属性集合，是实际存储和查询数据的单元
- **非向后兼容（Breaking Change）**：集成不更新会导致用户启用多源数据库时 API 操作失败
- **渐进式迁移**：步骤 2 可在升级 API 版本之前实施，因其兼容旧版本
- **Webhook 事件层级调整**：原数据库内容/模式事件下放至数据源级别

## 关联实体

- [[Notion]] — 产品与协作平台，提供数据库、页面等核心功能
- [[TypeScript SDK]] — `@notionhq/client` v5.0.0，提供新的数据源方法

## 相关页面

- [[Notion API 开发]] — Notion 集成开发的一般性知识，包含认证、分页、错误处理等
- [[API 版本迁移]] — 非向后兼容 API 升级的通用模式和最佳实践
