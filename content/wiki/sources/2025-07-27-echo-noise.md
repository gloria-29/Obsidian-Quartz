---
title: Echo-Noise 说说笔记系统
type: source
date: 2025-07-27
source: WuCai
topics: [个人工具, 开源项目, 自托管]
entities: [Ech0, memos, fly.io, Neon PostgreSQL]
---

# Echo-Noise 说说笔记系统

## 概要

基于 Ech0 开源框架魔改的轻量说说笔记系统，类似朋友圈风格。支持一键部署到 fly.io/zeabur/railway/vercel，支持 SQLite/PostgreSQL/MySQL。

## 核心内容

### 系统定位

- 轻量级的"说说"类笔记系统，类似朋友圈的发布形式
- 适合记录碎片化的想法和日常状态
- 自托管部署，数据完全在自己的控制之下

### 核心功能

- API 发布内容：支持通过 API 接口快速发布
- 多平台推送：支持 webhook、Telegram、企业微信、飞书
- 内容解析：支持 B 站、YouTube、网易云音乐链接解析
- 图片生成：一键生成内容图片方便分享
- 标签系统和热力图：可视化记录轨迹
- Popclip 快捷发布：通过 Popclip 快速记录

### 技术架构

- 后端：Go 语言
- 前端：Vue.js
- 部署：Docker 容器化
- 数据库：支持 SQLite、PostgreSQL、MySQL

### 部署选项

- fly.io：边缘平台一键部署
- Zeabur：无服务器平台
- Railway：快速部署方案
- Vercel：前端部署平台
- 源码：https://github.com/rcy1314/echo-noise

## 关键概念

- **Ech0** — 开源的说说话（microblog）笔记系统框架
- **自托管** — 在自己的服务器上部署和运行应用
- **Popclip** — macOS 上的快捷操作工具

## 关联实体

- [[Ech0]]
- [[memos]]

## 相关页面

- [[memos笔记系统]]
