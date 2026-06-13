---
tags: [OpenCode, SVG, PPT, AI工具, 自动化]
created: 2026-02-04
updated: 2026-02-04
sources: []
---
# OpenCode + SVG：省心可控的 AI PPT 生成方案

> 利用 OpenCode 配合 SVG 生成可编辑 PPT 的完整工作流，输出可二次编辑的矢量图形而非一次性图片。

## 核心观点
- 流程：安装 OpenCode -> 安装 oh-my-opencode 插件 -> 准备 MD 文稿 -> Ultrawork 模式 -> SVG 输出 -> PPT 导入转形状
- 核心优势：输出 SVG 可在 PPT 中"转换为形状"后编辑，不像 NotebookLM 只能出图片
- 关键技巧：让 AI 先理解内容再推荐风格布局（"适配性设计"），比直接套模板效果好得多
- SVG 兼容性优化：Windows 字体优先 Microsoft YaHei、用 path+C 命令代替 rect rx 保留圆角、避免 rgba 和 filter 属性

## 关键概念
- [[OpenCode]] — 开源 AI 编程工具，号称 Claude Code 平替，支持 GitHub Copilot 接入
- [[SVG]] — 可缩放矢量图形格式，在 PPT 中可转换为可编辑形状
- [[Ultrawork模式]] — oh-my-opencode 插件的高强度工作模式，自动分配多个 Agent 协作

## 相关页面
- [[Claude Code]]
- [[NotebookLM]]
