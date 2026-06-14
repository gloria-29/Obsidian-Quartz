---
title: BaiTTS-CLI-rs 有声书工具
type: source
date: 2025-09-30
source: WuCai
topics: [开源工具, TTS, 有声书]
entities: [BaiTTS, MultiTTS]
---

# BaiTTS-CLI-rs — 有声书生成命令行工具

## 概要

基于 MultiTTS API 的命令行工具（Rust 版本），用于将文本文档转换为有声书音频（.wav）并可生成同步 LRC 歌词文件。是原 Python 版本 BaiTTS-CLI 的 Rust 重写版本，使用 GPL-3.0 许可证，支持 .txt 文件输入。

## 核心内容

### 功能特性

- 将文本文档转换为高质量语音音频（.wav 格式）
- 自动生成同步 LRC 歌词文件，支持逐行/逐句同步
- 支持 .txt 格式的文本输入
- 命令行操作，适合批量处理和自动化工作流

### 技术架构

- Rust 语言重写，相较于 Python 版本性能更高
- 基于 MultiTTS API 提供语音合成能力
- 使用 GPL-3.0 开源许可证
- 项目托管于 GitHub：Doraemonsan/BaiTTS-CLI-rs

### 应用场景

- 有声书自动化制作
- 播客内容批量生成
- 文章和文档的语音版本制作
- 辅助阅读材料制作

## 关键概念

- **BaiTTS-CLI-rs** — 基于 Rust 的命令行有声书生成工具
- **MultiTTS** — 多引擎语音合成 API
- **LRC 歌词文件** — 包含时间戳的歌词或字幕文件格式

## 关联实体

- [[BaiTTS]]
- [[MultiTTS]]

## 相关页面

- [[KoodoReader调用安卓ttsServer]]
- [[AzureTTS个人账户免费额度指南]]
