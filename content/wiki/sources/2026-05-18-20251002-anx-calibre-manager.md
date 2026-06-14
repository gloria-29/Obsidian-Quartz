---
tags: [ebook, calibre, self-hosted, docker, webdav, mobile-reading]
created: 2025-10-02
updated: 2026-06-13
sources: ["https://github.com/ptbsare/anx-calibre-manager"]
---

# Anx Calibre Manager -- 移动端电子书管理工具

## 概要

Anx Calibre Manager 是一款移动端优先的 Web 电子书库管理应用，与 Calibre 深度集成，同时提供个人 WebDAV 服务器功能。支持 Anx-reader 兼容设备，方便在移动设备上管理和阅读电子书。项目采用 GPL-3.0 开源许可证，支持 Docker 部署，提供多语言界面，是 [[知识管理与笔记系统]] 中电子书管理环节的实用工具。

## 核心内容

### 功能特性
- **Calibre 集成**：连接现有 Calibre 服务器，浏览和搜索完整书库
- **WebDAV 服务器**：内置个人 WebDAV 服务，支持跨设备同步
- **阅读进度同步**：插件将阅读进度回传至 Anx Calibre Manager 服务器
- **有声书生成**：为 Anx 或 Calibre 书库中的书籍生成有声书（TTS）

### 技术架构
- 移动端优先的 Web 应用设计
- 支持 Docker 容器化部署，降低自托管门槛
- 多语言界面支持
- 与 KOReader 等开源阅读器生态兼容

### 使用场景
- 自托管电子书库管理，替代商业云服务
- 移动端浏览、搜索和阅读个人电子书收藏
- 跨设备阅读进度同步
- 电子书转有声书，支持碎片化场景下的"听书"需求

## 关键概念

- **Calibre**：开源电子书管理软件的事实标准
- **WebDAV**：基于 HTTP 的分布式文件管理协议，适合电子书同步
- **Anx-reader**：兼容的移动端电子书阅读器
- **KOReader**：开源电子墨水屏阅读器，与 Calibre 生态互通

## 关联实体

- [[Calibre]] -- 底层电子书管理引擎
- [[Anx Calibre Manager]] -- 本文讨论的项目
- [[技术与服务器部署]] -- Docker 自托管部署相关
- [[PAI]] -- 个人基础设施中电子书管理的一环

## 相关页面

- [[知识管理与笔记系统]]
- [[技术与服务器部署]]
- [[AI工具与应用-扩展]]
- [[信息获取与管理]]
- [[Obsidian]]
