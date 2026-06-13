---
tags: [Gemini, API, 白嫖, Docker]
created: 2025-11-22
updated: 2025-11-22
sources: []
---
# 利用网页Cookies免费调用Gemini API

> 在Google关闭免费API后，通过逆向工程提取Gemini网页端Cookie封装为OpenAI兼容API的替代方案。

## 核心观点
- Gemini-FastAPI项目二次封装HanaokaYuzu/Gemini-API，提供FastAPI Server
- 通过`__Secure-1PSID`和`__Secure-1PSIDTS`两个Cookie免API Key调用
- 内置Google Apps集成（Gmail/GMap/Youtube/网页搜索），提升响应准确性
- Docker一键部署，支持Open WebUI等应用的自动模型识别
- 对话可同步至Gemini网页端

## 关键概念
- [[Gemini]] — Google的多模态大语言模型
- [[Reverse Engineering API]] — 逆向工程提取内部API接口
- [[OpenAI API Compatible]] — OpenAI兼容的API格式

## 相关页面
- [[Gemini]]
- [[免费AI模型API]]
