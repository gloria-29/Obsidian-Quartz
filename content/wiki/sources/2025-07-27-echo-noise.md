---
title: Echo-Noise 说说笔记系统
type: source
date: 2025-07-27
source: WuCai
topics: [个人工具, 开源项目, 自托管]
entities: [Ech0, memos, fly.io, Neon PostgreSQL]
---

# Echo-Noise 说说笔记系统

基于 Ech0 开源框架魔改的轻量说说笔记系统，类似朋友圈风格。支持一键部署到 fly.io/zeabur/railway/vercel，支持 SQLite/PostgreSQL/MySQL。

**核心功能**：API 发布内容、多平台推送（webhook/Telegram/企业微信/飞书）、B站/YouTube/网易云解析、一键生成内容图片、标签系统和热力图、Popclip 快捷发布。

**技术栈**：Go 后端 + Vue 前端，Docker 部署。源码：https://github.com/rcy1314/echo-noise
