---
tags: [TTS, 电子书, 安卓工具]
created: 2025-11-01
updated: 2025-11-01
sources: []
---
# KoodoReader调用安卓TTS Server方案

> 通过局域网让[[KoodoReader]]调用安卓手机上的[[TTS]]引擎进行朗读的配置方案。

## 核心观点
- 使用jing332/tts-server-android将安卓系统TTS引擎通过HTTP API暴露
- 配置KoodoReader插件通过局域网IP和API URL调用手机TTS
- 仅限电脑和手机在同一局域网中使用

## 关键概念
- [[KoodoReader]] — 跨平台电子书阅读器
- [[TTS]] — Text-to-Speech文本转语音

## 相关页面
- [[TTS工具]]
