---
tags: [Openlist, 豆包, 云存储, Cookie认证, AList, 教程]
created: 2025-11-07
updated: 2026-06-13
sources:
  - raw/notes/2025-11-07-openlist-doubao-mount.md
---

# Openlist 挂载豆包 AI 网盘教程

## 概要

通过浏览器开发者工具获取认证 Cookie，在 Openlist（AList 分支）中挂载豆包 AI 网盘的完整配置教程。豆包 AI 网盘驱动在 AList v3.44.0 中已加入但未写入官方文档。

## 核心内容

### 前提条件
- 豆包 AI 网盘驱动已在 AList v3.44.0 中内置
- Openlist 继承了 AList 所有存储驱动能力
- 需要一个豆包 AI 账号和 Openlist 实例

### 获取认证 Cookie
1. 使用浏览器打开豆包 AI 网盘网页版
2. 打开 DevTools（F12）→ Network 标签页
3. 在网盘页面进行操作（如浏览文件），捕获网络请求
4. 从请求头中复制完整的 Cookie 字符串
5. 注意 Cookie 有效期，过期需重新获取

### 在 Openlist 中配置
- 进入 Openlist 管理后台 → 存储 → 添加存储
- 选择"豆包 AI 网盘"驱动类型
- 填入获取的 Cookie 作为认证凭据
- 设置挂载路径和访问权限

### Cookie-based 认证机制
- 模拟浏览器会话的 API 认证方式
- 优点：无需 API Key，利用现有浏览器登录态
- 缺点：Cookie 有有效期，需要定期更新
- 安全提示：Cookie 包含会话信息，不要泄露给他人

## 关键概念

- **AList** — 开源文件列表程序，支持挂载多种云存储
- **Openlist** — AList 的分支，继承全部存储驱动能力
- **Cookie-based Auth** — 模拟浏览器会话的认证方式，不同于 OAuth 或 API Key
- **DevTools Network** — 浏览器开发者工具的网络请求监控面板

## 关联实体

- [[AList]] — 开源文件列表/管理程序
- [[豆包 AI]] — 字节跳动旗下 AI 助手及云存储服务
- [[Openlist]] — AList 的社区分支版本

## 相关页面

- [[2024-09-28-剪藏app使用整理]]
- [[2024-11-22-原生系统与MIUI系统对比]]
- [[2024-11-29-ios-apps-to-check]]
