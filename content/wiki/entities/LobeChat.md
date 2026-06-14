---
type: entity
aliases: [LobeChat, LobeHub]
tags: [AI聊天, 开源项目, 自托管, AI客户端, 多模型]
---

# LobeChat

## 概述

LobeChat 是一款开源、现代化设计的 AI 聊天框架，支持接入多种主流大模型（OpenAI/Claude/Gemini/Ollama/Qwen/DeepSeek 等）。作为自托管 AI 客户端的首选方案之一，LobeChat 提供知识库管理、插件系统和可服务端数据库部署等企业级特性，是 NextChat 之后的 AI 聊天界面新选择。

## 核心功能

### 功能特点
- **多模型支持**：OpenAI、Claude、Gemini、Ollama、Qwen、DeepSeek 等主流模型全接入
- **知识库集成**：支持文件上传和知识管理，构建个人 RAG 系统
- **插件系统**：通过插件扩展功能，支持联网搜索、代码执行等
- **服务端部署**：支持 Postgres + S3 的服务端数据库部署方案
- **现代化 UI**：LobeHub 社区驱动的高质量交互设计
- **会话管理**：多会话、角色设定、提示词管理
- **开源社区活跃**：GitHub 社区持续贡献，迭代速度快

### 使用场景
- **个人 AI 助理**：统一管理多个 AI 模型的对话界面
- **团队协作**：服务端部署后团队成员共享 AI 资源
- **本地模型接入**：通过 Ollama 接入本地运行的开源模型
- **知识问答**：上传文档构建个人/团队知识库

## 关键概念

- **RAG（Retrieval-Augmented Generation）**：检索增强生成，LobeChat 知识库的核心技术
- **服务端部署模式**：客户端-服务器架构，支持多用户协作和数据持久化
- **模型路由**：根据不同任务自动选择最优模型

## 关联实体

- [[ChatPlus]] — 同为 AI 聊天客户端
- [[NextChat]] — 上一代热门 AI 聊天界面，LobeChat 的参考对象
- [[MCP Gateway]] — 可通过 MCP 桥接扩展 LobeChat 能力
- [[Claude Code]] — AI 工具生态中互补的编程侧工具

## 相关素材

- [[2025-08-18-小小的4c16g里承载了太多服务]] — LobeChat 在自托管服务栈中的位置
- [[2025-08-22-z2api]] — LobeChat 接入非标准 API 的实践
- [[cubox-2024-q4]] — LobeChat 部署相关收藏
