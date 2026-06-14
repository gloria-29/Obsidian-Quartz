---
type: entity
aliases: [Dinox, 聆龙, Dinox聆龙]
tags: [笔记系统, AI工具, 卡片笔记, 知识管理, AI笔记]
---

# Dinox (聆龙)

## 概述

Dinox（聆龙）是一款 AI 原生笔记应用，以"卡片盒 + 自定义插件库"为核心架构。支持 iOS/Android/PC 全平台同步，通过自定义插件扩展笔记能力，满足从个人知识管理到 AI 辅助写作的多场景需求。其 S3 对象存储方案和 CLI 工具生态（dino-* 系列 Skills）使其在 AI 笔记工具中拥有独特的技术灵活性。

## 核心功能

### 功能特点
- **卡片盒笔记**：基于 Zettelkasten 的原子笔记单元，每条笔记为一张独立卡片
- **自定义插件库**：插件分两类——笔记收纳（AI 生成笔记等不出现在线上）和固定格式收纳（AI 整理为表格形式）
- **AI 辅助写作**：内置 AI 提示词模板，支持内容总结、知识提取、翻译等
- **对象存储支持**：支持将多媒体文件上传到自己的 S3 服务，增强隐私保护和稳定性
- **全平台同步**：iOS/Android/PC 全平台支持
- **Claude Code Skills 集成**：提供 `/dinox` 斜杠命令，支持 create-md、search、ask、boxes、get、update 等子命令

### 使用场景
- **减重与健康管理**：作为减脂工具实现 AI 定制计划、掉秤日记卡片盒、拍照热量分析
- **个人知识管理**：卡片盒收集、连接、洞察三阶段知识管理
- **AI 辅助内容创作**：利用 AI 插件生成笔记、整理格式、提取摘要
- **自媒体运营**：整合多个平台的内容管理

## 关键概念

- **卡片盒（Zettelkasten）**：原子化笔记单元，每张卡片聚焦一个概念
- **自定义插件**：扩展笔记能力的功能模块，分笔记收纳和固定格式收纳两类
- **S3 对象存储**：Dinix 支持将媒体文件存储到自己的 S3 桶，保证数据隐私
- **CLI 工具链**：Dino-* 系列（dino-not、dino-manage-tags 等）可在终端中管理笔记

## 关联实体

- [[Obsidian]] — 同为双链笔记工具，Dinox 更侧重 AI 原生和卡片盒
- [[memos]] — 同为开源笔记服务，Dinox 插件生态更丰富
- [[Claude Code]] — Dinox 可通过 Skills 与 Claude Code 集成
- [[Notion]] — 同为全平台笔记应用，Dinox 更轻量

## 相关素材

- [[2025-06-23-dinox-ai-fitness]] — Dinox 作为减脂工具的 AI 方案
- [[2025-04-02-官方教程-在Dinox中添加自己的对象存储服务]] — S3 存储配置教程
- [[2025-04-02-dinox-s3-storage]] — 对象存储配置笔记
- [[2026-02-16-dinox-claude-skill-guide]] — Dinox 与 Claude Code Skills 集成指南
- [[2026-03-05-dinox-cli-notes]] — Dinox CLI 使用笔记
