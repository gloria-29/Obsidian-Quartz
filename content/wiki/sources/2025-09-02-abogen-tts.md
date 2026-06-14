---
tags:
  - TTS
  - 文本转语音
  - 开源工具
  - 有声书
  - Kokoro
created: 2025-09-02
updated: 2026-06-13
sources:
  - raw/notes/2025-09-02-Abogen文本转语音工具要点与功能概览.md
  - raw/articles/2025-09-02-abogen-tts.md
---

# Abogen - 文本转语音工具

## 概要

Abogen 是一款基于 Kokoro-82M 引擎的开源桌面 TTS 应用，可将 ePub/PDF/TXT 文件快速转换为高质量音频和同步字幕。生成约 1 分钟音频仅需 5 秒，适合制作有声读物和社交媒体视频配音。

## 核心内容

### 输入输出支持

- **输入**：ePub、PDF、TXT 文件拖放，内置文本编辑器
- **输出音频**：WAV、FLAC、MP3、OPUS（高压缩率）、M4B（支持章节）
- **输出字幕**：SRT、ASS 格式（目前仅支持英语，受 Kokoro 库限制）

### 高度可定制化

- **语音控制**：0.1x–2.0x 语速调节，多语言多性别声音选择
- **语音混合器（Voice Mixer）**：混合不同语音模型创建个性化自定义声音，为同类工具中的独特功能
- **字幕样式**：按句子、单词（1-3词）、逗号或高亮等多种风格生成

### 高级书籍处理

- 章节选择与独立/合并保存
- 自动为 M4B 文件添加标题、作者等元数据标签
- 队列模式（Queue Mode）支持多文件批量处理，各文件保留独立配置
- ePub/PDF 文本缓存与手动编辑，支持 `<<CHAPTER_MARKER:章节名>>` 标记

### 跨平台部署

- Windows 提供自动化安装脚本 `WINDOWS_INSTALL.bat`（含 Python 和 CUDA）
- Mac/Linux 通过 pip 安装，针对 Apple Silicon 和 AMD ROCm 有特别说明
- 支持 Docker 容器化部署

## 关键概念

- **Kokoro-82M**：Abogen 依赖的核心语音合成引擎
- **语音混合器**：通过混合不同模型创造自定义声音
- **队列模式**：批量转换多个文件，各自保留配置
- **M4B 格式**：支持章节和元数据的有声书专用格式

## 关联实体

- [[2025-09-30-baitts-cli-rs|baitts-cli-rs 有声书工具]]
- [[2025-10-21-Awesome-ChatTTS|Awesome ChatTTS]]
- [[2024-11-30-podcast-ai-audio-pipeline|播客AI音频处理流程]]

## 相关页面

- [[2025-12-27-三种TTS逆向白嫖]]
- [[2025-11-03-AzureTTS个人账户免费额度指南]]
