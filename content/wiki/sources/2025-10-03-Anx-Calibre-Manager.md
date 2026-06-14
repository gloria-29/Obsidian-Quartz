---
tags:
  - 电子书
  - 开源工具
  - Calibre
  - WebDAV
  - 阅读管理
created: 2025-10-03
updated: 2026-06-13
sources:
  - raw/notes/2025-10-03-Anx-Calibre-Manager.md
---

# Anx Calibre Manager

## 概要

一个现代化的移动端优先Web应用，用于管理电子书库，与Calibre集成并提供个人WebDAV服务器。支持浏览器内图书预览、有声书生成（TTS转M4B）、AI与书籍对话、KOReader同步、智能推送到Kindle、MCP服务器集成等功能。采用Docker部署，GPLv3开源许可证。

## 核心内容

### 核心功能特性

集成Calibre书库浏览与搜索，支持EPUB/多种格式的浏览器内预览。内置TTS有声书生成（支持Edge TTS和OpenAI TTS），生成的M4B文件与Audiobookshelf完全兼容。AI对话功能允许与书库中任何书籍聊天，获取摘要或探讨主题。支持KOReader设备的阅读进度和时间同步。智能推送到Kindle时自动将非EPUB格式转换以确保兼容性。

### WebDAV与用户管理

每个用户获得独立安全的WebDAV文件夹，与Anx-reader和KOReader兼容。用户角色分为管理员（完全控制）、维护者（编辑元数据）和普通用户（上传、管理自己的书库）。支持邀请码注册机制，防止未授权访问。普通用户可编辑自己上传的书籍元数据。

### MCP服务器集成

内置符合规范的Model Context Protocol (MCP)服务器，允许AI代理与书库交互。支持搜索书籍、获取详情、推送书籍、生成有声书、获取目录和章节内容、字数统计等工具。通过JSON-RPC 2.0格式通信，支持自然语言提示操作。

### 部署与配置

Docker单容器部署，支持docker-compose。通过环境变量配置Calibre连接、SMTP邮件、TTS提供商、LLM接口等。支持自定义字体挂载以处理中文等特殊字符。提供详细的KOReader同步设置指南。

### 阅读统计

自动生成个人阅读统计页面，包含年度阅读热力图、在读书籍和已读书籍列表，支持公开或私有分享。

## 关键概念

- **Calibre集成**: 连接现有Calibre内容服务器浏览和搜索书库
- **WebDAV服务器**: 为每个用户提供独立的文件存储和同步服务
- **MCP协议**: Model Context Protocol，允许AI代理与外部工具安全交互
- **有声书生成**: 将EPUB转换为带章节标记的M4B有声书文件

## 关联实体

- [[Calibre]] — 开源电子书管理工具，核心依赖
- [[KOReader]] — 电子书阅读器，支持进度同步
- [[Kindle]] — 推送目标设备
- [[Audiobookshelf]] — 有声书服务器，兼容M4B格式

## 相关页面

- [[2024-09-28-电纸书需求与选择]] — 电子书阅读器选择
- [[2025-01-14-搭建Calibre-Web电子书管理系统]] — Calibre Web搭建
- [[2025-06-29-软件Inbox]] — 软件工具收集
