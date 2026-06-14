---
tags: [Azure, TTS, 语音合成, 免费工具, 微软]
created: 2026-01-04
updated: 2026-06-13
sources:
  - type: note
    title: AzureTTS个人账户免费额度指南
    path: raw/notes/2025-11-03-AzureTTS个人账户免费额度指南.md
  - type: note
    title: AzureTTS-CF
    path: raw/notes/2026-01-04-AzureTTS-CF.md
---

# Azure TTS + Cloudflare Worker 个人免费语音合成方案

## 概要

利用微软Azure文本转语音（TTS）服务的免费层级，结合Cloudflare Worker做API代理，搭建个人免费语音合成方案。免费账户每月可使用50万个Neural TTS字符（约7-8小时音频），无需编程即可通过Speech Studio生成高质量语音。

## 核心内容

### Azure TTS 免费方案

- **免费额度**：F0定价层级，每月50万字符Neural TTS
- **注册要求**：微软账户 + 信用卡身份验证（不扣费，仅验证身份）
- **无代码使用**：通过Speech Studio的Audio Content Creation工具，粘贴文本即可生成音频
- **语音选择**：数百种Neural语音，支持调整风格、语速、音高
- **限制**：每60秒20次请求，单次最长10分钟音频，单文件3000字符

### Cloudflare Worker 代理

通过Cloudflare Worker部署API代理层，可以：

- 绕过Azure API的地域限制
- 实现更灵活的调用方式
- 配合其他应用（如阅读软件TTS）使用

### 实际应用场景

- 个人阅读材料语音化
- 内容创作辅助
- 无障碍阅读支持

## 关键概念

- **Neural TTS**：神经网络语音合成，质量最高、最接近真人发音的语音技术
- **Speech Studio**：微软提供的无代码语音生成Web工具
- **F0定价层级**：Azure免费层，适合个人使用

## 关联实体

- [[Azure]]
- [[文本转语音]]
- [[Cloudflare Worker]]

## 相关页面

- [[ElevenLabs替代方案]]
- [[Elog]]
- [[Gemini]]
