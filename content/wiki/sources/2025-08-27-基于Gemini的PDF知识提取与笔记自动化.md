---
tags: [Gemini, PDF提取, 笔记自动化, AI工作流, 学习工具, Obsidian]
created: 2025-08-27
updated: 2026-06-13
sources: [raw/notes/2025-08-27-基于Gemini的PDF知识提取与笔记自动化.md]
---

# 基于Gemini的PDF知识提取与笔记自动化

## 概要
一套利用 Google Gemini 2.5 Pro 从 PDF 教材中提取结构化知识点并生成 Obsidian Markdown 笔记的自动化工作流。核心流程：Python 脚本切割 PDF → 逐章喂给 Gemini → 生成格式化的知识点笔记。选择 Gemini 的原因是免费、上下文长、输出长且 PDF 识别效果好。

## 核心内容
### 工作流设计
- **PDF 切割**：使用 Python pypdf 库按章节目录切割大 PDF 为独立章节文件
- **知识点提取**：将切割后的 PDF 逐章输入 AI Studio 的 Gemini 2.5 Pro
- **笔记生成**：Gemini 输出符合 Obsidian 规范的 Markdown 知识点笔记

### 为什么选择 Gemini
- 免费使用（AI Studio），上下文窗口长，相同内容可能超出豆包网页版限制
- 输出长度优于 GPT，不容易半路截断
- PDF 识别能力较好，适合教材类文档

### 提示词设计要点
- 指定为计算机专业高级助手，输出 Obsidian 兼容的 Markdown
- 数学公式使用 KaTeX 语法（单 $ 行内，双 $$ 块级）
- 表格中数学公式需转义 `|` 符号防止冲突
- 先确认章节知识点数量，再逐一完成，确保不遗漏定理和编号公式
- 不使用分隔符 `---`（Obsidian 显示效果不佳），不使用图片引用

### PDF 切割脚本
- 支持指定页面范围和 offset 偏移量
- 每个切割的 PDF 自动创建同名空 Markdown 文件
- page_ranges 可通过截图目录让 Gemini 自动生成
- offset 计算：书籍第一页对应的 PDF 页码减 1

## 关键概念
- **PDF 切割（page extraction）**：将大 PDF 按章节拆分为独立文件，降低单次输入的 token 量
- **offset 偏移**：处理 PDF 页码与书籍实际页码不一致时的校正值
- **KaTeX 格式化**：Obsidian 中数学公式的标准渲染方式
- **AI Studio**：Google 提供的免费 Gemini API 测试平台

## 关联实体
- [[Gemini]] — 本工作流的核心 AI 模型，利用其长上下文和 PDF 理解能力
- [[个人成长与人生规划]] — 学习效率工具是知识积累的加速器
- [[生活管理与SOP]] — 自动化笔记流程可标准化为学习 SOP

## 相关页面
- [[Gemini]] — Gemini 模型的能力与应用场景
- [[生活管理与SOP]] — 将知识提取流程纳入日常学习管理
- [[个人成长与人生规划]] — 技术工具赋能个人成长
