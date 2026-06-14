---
tags: [AI API, Claude, ChatGPT, Gemini, Midjourney]
created: 2025-01-13
updated: 2026-06-13
sources: [raw/notes/2025-01-13-AI-API-Gateway-Claude,-ChatGPT,-Gemini,-Midjourney-API-Gateway.md]
---

# AI API Gateway：统一多模型 API 网关

## 概要

一个通用 AI API 网关服务，通过单一入口点提供 Claude、ChatGPT、Gemini 和 Midjourney 的 API 访问。保持与原 API 兼容的请求格式，降低迁移成本，支持流式输出，适合实时交互场景。

## 核心内容

### 支持的模型
- **Claude API**：通过 `/v1/messages` 端点收发消息，需要 `anthropic-version` 头
- **ChatGPT API**：通过 `/v1/chat/completions` 端点，兼容 OpenAI 格式
- **Gemini API**：Google 的生成式 AI 模型接入
- **Midjourney API**：AI 图像生成服务接入

### 核心特性
- 统一网关简化多模型 API 管理：一个 API Key 访问多种 AI 模型
- 保持与官方 API 兼容的请求格式，降低迁移成本
- 完整支持流式输出（Stream），适合实时交互场景

### 使用方式
- 通过 Bearer Token 认证
- 各模型 Base URL 统一在 `ai.gits.one` 域名下
- 请求格式与官方 API 完全一致，无需修改现有调用代码

## 关键概念

- **API Gateway** — 统一管理和路由多个后端服务 API 请求的网关层
- **流式输出** — Stream 模式，逐 token 返回结果，降低首字延迟
- **兼容性设计** — 保持官方 API 格式，实现零成本迁移

## 关联实体

- [[Claude]] — Anthropic 的 AI 助手，网关支持的模型之一
- [[ChatGPT]] — OpenAI 对话模型，网关支持的模型之一

## 相关页面

- [[MTGA 赋能 Trae]] — 另一种 AI 模型聚合方案，面向编程场景
- [[ChatGPT o3系统提示词]] — OpenAI 模型的系统级指令设计
