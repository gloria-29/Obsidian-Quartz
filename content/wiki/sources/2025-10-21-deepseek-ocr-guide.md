---
tags: [AI, OCR, 多模态, 工具]
created: 2025-10-21
updated: 2025-10-21
sources: []
---
# DeepSeek-OCR深度解读及上手指南

> DeepSeek-OCR是约3B参数的多模态OCR 2.0模型，仅需7GB显存即可完成高精度表格、公式、CAD图纸识别及PDF一键转换Markdown。

## 核心观点
- DeepSeek-OCR本质是多模态大模型（VLM），不是传统OCR，能理解图像语义而非仅识别文字
- 首个实现"情境光学压缩"的OCR模型，用更少视觉标记获得更好效果
- 单卡A100推理速度达2500 tokens/s，4090实测450 tokens/s
- 支持图片语义识别、PDF转Markdown、CAD图纸解读等任务

## 关键概念
- [[OCR 2.0]] — 第二代OCR，从单纯文字识别升级为多模态语义理解
- [[Vision-Language Model]] — 视觉语言模型，能同时处理图像和文本信息
- [[DeepSeek]] — 中国AI公司，发布多个SOTA开源模型
- [[情境光学压缩]] — DeepSeek-OCR核心技术，以更少像素压缩图像信息

## 相关页面
- [[DeepSeek]]
- [[多模态RAG]]
- [[PDF处理工具]]
