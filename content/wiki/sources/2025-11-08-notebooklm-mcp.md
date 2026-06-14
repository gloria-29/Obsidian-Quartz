---
tags: [MCP协议, NotebookLM, AI工具, 开源]
created: 2025-11-08
updated: 2026-06-13
sources: [raw/articles/2025-11-08-notebooklm-mcp.md]
---

# NotebookLM MCP Server

## 概要
NotebookLM MCP Server 是一个基于 MCP（Model Context Protocol）协议的开源服务器实现，由开发者 Prompto 在 GitHub 上发布，采用 MIT 许可证。该项目的核心目标是让各类AI工具能够通过标准化的MCP协议与Google的 NotebookLM 进行交互，从而将NotebookLM的知识管理能力融入更广泛的AI工作流中。

## 核心内容
### MCP协议简介
- MCP（Model Context Protocol）是由Anthropic提出的开放协议标准，定义了AI模型与外部工具之间的通信规范
- 该协议采用JSON-RPC 2.0作为底层通信格式，支持工具发现、资源访问和提示模板三大核心功能
- MCP的目标是成为AI工具生态的"USB接口"——统一不同工具之间的连接标准

### NotebookLM MCP Server的功能
- 将NotebookLM的操作封装为MCP兼容的工具接口，包括创建笔记本、添加来源、生成摘要等
- 支持AI助手通过MCP协议直接调用NotebookLM的功能，无需用户手动操作界面
- 实现了资源（Resources）和工具（Tools）两种MCP原语的映射

### 技术实现
- 开源项目，采用MIT许可证，代码托管在GitHub上
- 通过NotebookLM的API接口实现功能调用
- 作为MCP Server运行，可被任何支持MCP协议的客户端（如Claude Desktop、Cursor等）连接使用

### 应用场景
- 在AI对话中直接查询和操作NotebookLM笔记本中的内容
- 将NotebookLM作为AI助手的知识库后端，实现RAG（检索增强生成）
- 自动化知识管理工作流：文档上传、摘要生成、问答交互

## 关键概念
- **MCP协议（Model Context Protocol）**：Anthropic提出的AI工具互操作标准协议，基于JSON-RPC 2.0
- **NotebookLM**：Google推出的AI驱动笔记和研究工具，支持基于上传文档的对话式问答
- **MCP Server**：实现MCP协议的服务端，暴露工具和资源供AI客户端调用
- **MIT许可证**：最宽松的开源许可证之一，允许自由使用、修改和分发

## 关联实体
- [[NotebookLM]] — Google NotebookLM的完整功能介绍和使用指南
- [[MCP协议]] — MCP协议的技术规范、设计理念和生态发展
- [[开源NotebookLM替代品]] — 其他开源的知识管理和AI笔记工具

## 相关页面
- [[MCP协议]] — 深入了解MCP协议的技术细节和最佳实践
- [[NotebookLM]] — NotebookLM的官方功能和高级用法
