---
tags: [ebook, self-hosting, calibre, webdav, mcp, docker]
created: 2026-05-19
updated: 2026-05-19
type: entity
sources:
  - raw/articles/2026-05-18-20251002-anx-calibre-manager.md
---

# anx-calibre-manager

## 概述

anx-calibre-manager 是一个现代化的、移动端优先的 Web 应用，用于管理电子书库。它与 Calibre 集成，为 Anx-reader 兼容设备提供个人 WebDAV 服务器，并内置 [[MCP]] 服务器支持 AI 代理交互。

## 核心功能

| 功能 | 说明 |
|------|------|
| **Calibre 集成** | 连接现有 Calibre 服务器浏览书库 |
| **WebDAV 服务器** | 每个用户独立的 WebDAV 文件夹 |
| **MCP 服务器** | 内置 [[MCP]] 支持，AI 可与书库交互 |
| **移动端优先** | 响应式 UI，专为手机设计 |
| **PWA 支持** | 可安装为渐进式 Web 应用 |
| **有声书生成** | EPUB 转 M4B 有声书 |
| **AI 对话** | 与书籍内容对话 |
| **KOReader 同步** | 同步阅读进度和时间 |
| **Kindle 推送** | 智能格式转换后推送到 Kindle |

## 特色功能

### 1. 有声书生成
- 使用可配置的 TTS 提供商（如 Microsoft Edge TTS）
- 将 EPUB 转换为带章节标记的 M4B
- 兼容 Audiobookshelf 等有声书服务器
- 浏览器内播放，自动保存进度

### 2. AI 对话
- 与书库中的任何一本书聊天
- AI 驱动的问答界面
- 获取摘要、探讨主题

### 3. MCP 服务器
- 符合 [[MCP]] 规范的服务器
- AI 代理可安全与书库交互
- 支持外部工具集成

### 4. 用户管理
- **管理员**: 完全控制权
- **维护者**: 编辑所有书籍元数据
- **普通用户**: 上传、管理自己的书库
- 邀请码注册机制

## 部署

```bash
docker pull ptbsare/anx-calibre-manager
docker run -d -p 8080:8080 \
  -v ./data:/data \
  ptbsare/anx-calibre-manager
```

## 阅读统计

- 年度阅读热力图
- 在读书籍和已读书籍列表
- 支持公开或私有分享

## 相关页面

- [[MCP]] — 内置的工具协议
- [[Obsidian]] — 类似的本地知识管理
- [[电子书转思维导图]] — 电子书处理工具
