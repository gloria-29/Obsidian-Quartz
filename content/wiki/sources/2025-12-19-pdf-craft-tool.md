---
tags: [PDF, OCR, Markdown, 工具]
created: 2025-12-19
updated: 2025-12-19
sources: []
---
# pdf-craft：扫描PDF转Markdown工具

> 基于[[DeepSeek OCR]]的开源扫描PDF转[[Markdown]]/EPUB工具，完全本地离线运行，支持表格、公式、脚注等复杂元素的高精度识别。

## 核心观点
- 专为扫描版PDF优化，v1.0.0后完全去除LLM依赖（MIT协议）
- 5种OCR模型尺寸可选（tiny到gundam），GPU加速
- 自动识别过滤页眉页脚，支持目录生成
- 图表支持多种渲染方式（MathML/SVG/HTML/裁剪原图）
- 可配合epub-translator实现"扫描PDF->EPUB->双语对照"工作流

## 关键概念
- [[DeepSeek OCR]] — DeepSeek发布的多模态OCR模型
- [[PDF-to-Markdown]] — PDF文档到Markdown格式的转换

## 相关页面
- [[DeepSeek OCR]]
- [[PDF处理工具]]
