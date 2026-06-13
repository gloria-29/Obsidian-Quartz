---
tags: [DeepSeek, Trae, MCP, AI智能体, PDF处理]
created: 2025-04-28
updated: 2025-04-28
sources: []
---
# DeepSeek + Trae 吞书智能体

> 利用 Trae 平台 + DeepSeek-R1 + MCP Server 构建自动化的整本书分章节总结智能体，解决大模型无法直接处理长文本的问题。

## 核心观点
- 根本挑战：Transformer 的注意力复杂度 O(n^2) 使超长文本无法被一次性高精度处理
- 解决方案：使用多智能体协作 + 分章节编排提示词，逐章提取摘要并自动写入文件
- 技术栈：Trae(字节跳动的免费 IDE) + DeepSeek-R1 + MCP pdf-reader Server
- 处理338页《强化学习》仅需约10分钟，自动生成所有章节的总结文件
- 虽然需要手工输入"继续"（思考次数达上限），但完全免费且可复现

## 关键概念
- [[MCP]] — Model Context Protocol，允许 AI 应用与外部工具和数据源交互的协议标准
- [[Trae]] — 字节跳动开发的免费 IDE，对 MCP 智能体支持较好，内置 DeepSeek-R1 等模型
- [[上下文长度限制]] — Transformer 模型处理长文本的固有瓶颈，稀疏注意力等方法只能部分缓解
- [[多智能体协作]] — 通过编排多个专用智能体协同工作来完成复杂任务
- [[DeepSeek-R1]] — 开源推理模型，128K 上下文支持，适合分章节分析
