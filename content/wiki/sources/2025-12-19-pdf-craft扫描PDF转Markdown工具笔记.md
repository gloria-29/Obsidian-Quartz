---
title: "pdf-craft扫描PDF转Markdown工具笔记"
type: source
date: 2025-12-19
source: web
source_url: https://glasp.co/reader?url&#61;https://github.com/oomol-lab/pdf-craft/blob/main/README_zh-CN.md
topics: ["工具", "生活"]
entities: ["扫描件专攻", "复杂元素处理", "表格与公式", "脚注处理", "结构化输出"]
---

# pdf-craft扫描PDF转Markdown工具笔记

## 概要
pdf-craft 是一个专注于处理扫描版书籍的开源工具，能够利用 DeepSeek OCR 技术，在本地通过 GPU 加速将 PDF 文档高精度转换为 Markdown 或 EPUB 格式。v1.0.0 版本后彻底去除了对 LLM 的依赖，实现了完全离线、高速的转换流程，同时采用更宽松的 MIT 协议。 - 扫描件专攻：专为扫描版 PDF 优化，而非简单的文本提取。 - 表格与公式：支持高精度识...

## 核心内容

### 核心摘要
- pdf-craft 是一个专注于处理扫描版书籍的开源工具，能够利用 DeepSeek OCR 技术，在本地通过 GPU 加速将 PDF 文档高精度转换为 Markdown 或 EPUB 格式。v1.0.0 版本后彻底去除了对 LLM 的依赖

### 1. 高精度文档识别与还原
- - 扫描件专攻：专为扫描版 PDF 优化，而非简单的文本提取。
- - 复杂元素处理：
- - 表格与公式：支持高精度识别，提供多种渲染方式（如 MathML, SVG, HTML 或直接裁剪原图）。
- - 脚注处理：能够妥善提取脚注及其中的图片资源。
- - 结构化输出：
- - 自动去噪：自动识别并过滤页眉、页脚等非正文干扰信息。

### 2. 本地化与高性能 (v1.0.0 变革)
- - DeepSeek OCR 驱动：全面拥抱 DeepSeek OCR 模型，替代了旧版本中的 LLM 文本矫正。
- - 完全离线：无需网络请求，解决了网络延迟和失败问题，大幅提升转换速度。
- - 隐私与稳定：所有处理在本地完成，数据更安全，流程更稳定。
- - 注：若必须使用 LLM 文本矫正功能，需回退至 v0.2.8 版本。

### 3. 灵活的模型与渲染配置
- - 多尺寸模型：提供 5 种 OCR 模型尺寸（&#96;tiny&#96;, &#96;small&#96;, &#96;base&#96;, &#96;large&#96;, &#96;gundam&#96;）。
- - 默认使用 &#96;gundam&#96;（最大模型，质量最高）。
- - 渲染可选项：
- - 表格：HTML 代码或图片裁剪 (Clipping)。
- - 公式：MathML, SVG 或图片裁剪。
- - 内联 LaTeX：EPUB 模式下可选择保留内联 LaTeX 代码供阅读器渲染。

## 关键概念

## 关联实体

## 相关页面
