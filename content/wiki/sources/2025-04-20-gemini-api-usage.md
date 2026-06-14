---
tags: [Gemini, API, Google, AI工具, 开发者工具, 计费]
created: 2025-04-20
updated: 2026-06-13
sources:
  - raw/articles/2025-04-20-gemini-api.md
---

# Gemini API 使用量差异解析

## 概要

厘清 Google One AI Premium 订阅（Gemini Advanced）与 Gemini API 访问之间的关系。核心发现：订阅解锁高级模型和 100 万 token 上下文窗口，但 **不提升 API 速率限制**；API 使用独立的免费/付费层级，通过 Google Cloud 计费。

## 核心内容

### 订阅 vs API 是独立产品线
- **Google One AI Premium**（$19.99/月）：在 Gemini 网页/应用中提供 Gemini 1.5 Pro + 100万 token 上下文
- **API 访问**（AI Studio 或直接调用）：使用独立的层级系统，与订阅状态无关
- 消费者订阅和开发者 API 是 Google 两条不同的产品线

### 速率限制不受订阅影响
- 免费和 Advanced 用户在免费 API 层级均获得 **60 RPM**
- 要获得 **600+ RPM** 并享受数据隐私（不用于模型训练），任何用户都需设置 Google Cloud 付费 API 层级
- 付费层级保证数据不被用于模型训练——这是数据隐私的关键差异

### 上下文窗口的细微差别
- Advanced 用户在 Gemini 网页聊天界面获得 100万 token（订阅核心价值）
- 在 AI Studio/API 中，**所有用户**（包括免费用户）均可访问 Gemini 1.5 Pro 的 100万 token
- 差异在于速率限制，而非上下文长度

## 关键概念
- **消费者服务 vs 开发者平台**：订阅面向终端用户，API 面向开发者，两者独立运作
- **数据隐私**：仅付费 API 层级保证数据不被用于模型训练
- **AI Studio**：免费的网页端原型开发工具，使用 API 免费层级限制
- **Google Cloud 计费**：API 付费层级的入口，与 Google One 订阅账单分开

## 关联实体
- [[Gemini]] — Google AI 模型系列与平台
- [[AI工具与应用-扩展]] — AI 工具全景与使用指南
- [[信息获取与管理]] — AI API 作为信息获取基础设施
- [[Obsidian]] — 可通过插件集成 Gemini API

## 相关页面
- [[Gemini MCP 桥接]] — Gemini 连接外部 MCP 协议
- [[Gemini 3 Pro Prompts]] — Gemini 提示词与多模态能力
- [[个人AI基础设施]] — PAI 中 Gemini 的应用方式
