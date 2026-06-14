---
tags: [API Gateway, AI工具, Claude, ChatGPT, Gemini, Midjourney, MCP Gateway]
created: 2025-01-13
updated: 2026-06-13
sources:
  - raw/notes/2025-01-13-AI-API-Gateway-Claude,-ChatGPT,-Gemini,-Midjourney-API-Gateway.md
---

# AI API Gateway — Claude, ChatGPT, Gemini, Midjourney

## 概要

一个统一的 AI API 网关服务，通过单一入口整合 Claude、ChatGPT、Gemini 和 Midjourney 四大主流 AI 平台的 API。保持与各平台官方 API 兼容的请求格式，支持流式响应（streaming），降低多模型应用的接入复杂度。这与 [[MCP Gateway]] 的设计理念相通——通过网关层抽象来简化多 AI 服务的集成。

## 核心内容

### 架构设计

- **统一入口** — 所有 AI 服务通过 `ai.gits.one` 域名下的不同路径前缀访问
- **API 兼容** — 保持与各官方 API 相同的请求格式，迁移成本极低
- **流式支持** — 全面支持 Server-Sent Events 流式响应

### 支持的 API 端点

| 平台 | 基础路径 | 主要端点 |
|------|---------|---------|
| Claude | `/claude` | `/v1/messages` |
| ChatGPT | `/openai` | `/v1/chat/completions`, `/v1/models` |
| Gemini | `/gemini` | `/v1/models/gemini-pro/generateContent`, `/v1/models` |
| Midjourney | `/midjourney` | `/api/v2/imagine` |

### 认证方式

- Claude / ChatGPT / Midjourney：Bearer Token 认证（`Authorization: Bearer YOUR_API_KEY`）
- Claude 额外需要 `anthropic-version` 头
- Gemini：仅需 `Content-Type` 头（API Key 可能通过其他方式传递）

### 与 MCP Gateway 的关系

- 本项目是 API 代理层（proxy），解决多 API 统一接入问题
- [[MCP Gateway]] 更进一步，基于 Model Context Protocol 实现工具调用和上下文管理的标准化
- 两者可以组合使用：API Gateway 处理模型调用层，MCP Gateway 处理工具和上下文层

## 关键概念

- **API Gateway 模式** — 在客户端和多个后端服务之间引入统一代理层，简化集成、统一认证、集中管理
- **API 兼容代理** — 代理服务保持与原始 API 相同的接口规范，客户端无需修改代码即可切换
- **流式响应（Streaming）** — 模型生成内容时实时返回 token，而非等待完整响应
- **多模型路由** — 根据请求路径将调用分发到不同的 AI 后端服务

## 关联实体

- [[MCP Gateway]] — Model Context Protocol 网关，处理工具调用和上下文管理的标准化层
- [[AI工具与应用-扩展]] — AI API Gateway 是多模型应用开发的基础设施组件
- [[Claude]] — Anthropic 的大语言模型，通过 `/claude` 路径接入
- [[ChatGPT]] — OpenAI 的对话模型，通过 `/openai` 路径接入
- [[Gemini]] — Google 的大语言模型，通过 `/gemini` 路径接入

## 相关页面

- [[AI工具与应用-扩展]] — AI 工具生态中的基础设施层
- [[MCP Gateway]] — 更高层的 AI 服务抽象，基于 Model Context Protocol
- [[个人AI基础设施]] — 统一 API 网关是个人 AI 基础设施的关键组件
