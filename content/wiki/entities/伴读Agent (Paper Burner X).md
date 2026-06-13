---
tags: [agent, reading, translation, ocr, academic, pdf, open-source]
created: 2026-05-19
updated: 2026-05-19
type: entity
sources:
  - raw/articles/2026-05-18-20251006-伴读agent.md
---

# 伴读Agent (Paper Burner X)

> 开源即开即用的一站式 AI 翻译/阅读/分析工作站，专为学术/工作打造，纯浏览器可用，融合 Agent 智能体机制和长文本处理能力。

## 概述

Paper Burner X（又名 Agent 伴读）是一个专为学术和办公场景打造的开源 AI 工具站。它可在纯浏览器中运行，融合了 AI Agent 机制来处理长文本——通过为 AI 提供 `grep`、`vector search`、`map`、`fetch` 等工具，使模型能主动判断所需上下文并获取完整信息。

项目前身是"量子波动速读"批量文档处理工具，经过大幅升级后引入了保留格式的 PDF 翻译、多 OCR 引擎支持、术语备择库、提示词池等专业功能。目前已支持 `grok-4-fast`、`gemini-2.5-flash-preview` 等模型。

## 关键特性

- **保留格式的 PDF 翻译**：通过 MinerU 的结构化翻译模式实现格式保持
- **Agent 长文本处理**：为 AI 配备 `grep`、`vector search`、`map`、`fetch` 等工具集
- **意群/地图机制**：帮助 AI 保持对长文本的"全局视角"
- **多 OCR 引擎**：支持 `mistral`、`doc2x`、`mineru`，部分需 Cloudflare Worker 部署
- **多格式支持**：导入 PDF、MD、TXT、DOCX、PPTX、HTML、EPUB、YAML；导出 DOCX、PDF 等
- **术语备择库**：快速导入导出，自动匹配原文块并注入固定译文，大幅提升翻译一致性
- **提示词池**：由元提示词生成系列相似需求的提示词，带健康管理功能
- **批量模式**：支持整库翻译、文件夹翻译（如整个 GitHub 仓库）
- **未来规划**：MCP 集成、参考文献工具、"先读后看"机制、AI 自动生成 PPT、浏览器插件、云存储支持

## AI 使用认知影响警示

项目帖中引用了 MIT 研究，警示过度依赖 AI 的风险：
- LLM 组论文同质性显著，人脑组多样性更强
- 大脑功能连接性随外部认知辅助增加而系统性下降
- 78% 的 LLM 组受试者在移除 AI 后无法回忆相关内容
- 建议在学习初期阶段延迟引入 AI 工具，优先促进自我驱动的认知建构

## 关系

- 相关页面：[[GenericAgent]], [[MCP协议与工具生态系统]], [[Cloudflare]], [[DeepSeek V4]]
- Agent 概念：使用 AI Agent 机制处理长文本，与 [[GenericAgent]] 有共同的设计理念
- 基础设施：部分 OCR 引擎需 [[Cloudflare]] Workers 部署
- 模型支持：可使用 [[DeepSeek V4]] 作为底层推理模型

## 来源参考

- LINUX DO 社区 Paper Burner X 项目帖
- GitHub: Feather-2/paper-burner-x
