---
tags: [Obsidian, Notion, 剪藏工具, 知识管理, 微信, AI工具]
created: 2025-06-25
updated: 2026-06-13
sources:
  - https://mp.weixin.qq.com/s/QP0tr884rs2xw2Cf_RY-Gw
---
# NotionMpClipper支持Obsidian剪藏

## 概要
微信剪藏工具 NotionMpClipper 新增 Obsidian 剪藏模式，打通从微信到 [[Obsidian]] 的移动端剪藏链路。此前该工具仅支持 Notion，本次更新实现 Notion 与 Obsidian 双平台互斥切换，并预告下半年 AI 功能（自动打标、标题修正、聊天总结）。

## 核心内容
- **Obsidian 剪藏配置三步**：小程序端配置图床并开启开关 -> 安装 Obsidian 插件 -> 图床 CORS 跨域配置
- **图床支持**：阿里云、腾讯云、缤纷云、Cloudflare R2 及各类 S3 兼容对象存储
- **Notion 与 Obsidian 互斥**：开启 Obsidian 模式后 Notion 剪藏自动停用，可随时在设置中切换
- **标签同步备份**：新增手动触发的 Notion 标签同步功能，防止清理缓存时丢失常用标签；支持云端备份
- **网页解析引擎重构**：大范围重构升级剪藏格式，确保 Markdown 排版在 Obsidian 中保持美观
- **AI 功能预告**：AI 修正标题（去震惊体）、AI 自动打标分类、AI 聊天记录总结，将在下半年逐步上线

## 关键概念
- **NotionMpClipper**：微信文章剪藏小程序，由 NotionHelper 公众号开发，支持 Notion 和 Obsidian 双平台
- **CORS 跨域配置**：图床必须配置的项，允许 Obsidian 插件跨域读取图片资源
- **双平台互斥设计**：剪藏插件只转存不保存数据，Notion/Obsidian 模式同一时间只能启用一个

## 关联实体
- [[Obsidian]] — 本地化 Markdown 知识管理工具，本次剪藏目标平台
- [[Notion]] — 原始剪藏目标平台，与 Obsidian 共用同一工具入口
- [[Cloudflare R2]] — 支持的图床选项之一
- [[知识管理与笔记系统]] — 微信内容剪藏是知识管理的关键入口环节
- [[AI工具与应用-扩展]] — AI 自动打标、标题修正等功能预告

## 相关页面
- [[知识管理与笔记系统]] — 剪藏工具是笔记系统信息输入的重要工具链
- [[Obsidian]] — 核心剪藏目标平台
- [[AI工具与应用-扩展]] — 后续 AI 功能规划方向
