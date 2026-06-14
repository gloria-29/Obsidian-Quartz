---
tags: [Webhook, URL Scheme, API, 自动化, 应用间通信]
created: 2025-04-20
updated: 2026-06-13
sources: [Dinox笔记]
---

# Webhook与URL Scheme对比

## 概要

对比两种应用间通信机制：Webhook（服务端事件驱动的HTTP回调）和URL Scheme（客户端应用间跳转的自定义协议），分析各自适用场景、技术实现和安全注意事项。

## 核心内容

### Webhook
- **定义**：基于HTTP回调的事件驱动通信工具，事件发生时服务端主动向预设URL发送POST请求
- **典型场景**：GitHub代码提交触发构建、支付宝支付回调、Slack通知推送
- **配置流程**：获取Webhook URL → 设置触发事件 → 解析请求体执行后续操作
- **安全性**：需验证签名（HMAC）防止伪造，推荐HTTPS加密

### URL Scheme
- **定义**：移动端应用间通信的自定义协议，通过特定格式URL直接调起其他应用
- **典型场景**：微信扫码（`weixin://scanqrcode`）、支付宝付款、B站视频跳转
- **注册方式**：iOS的Info.plist或Android的AndroidManifest.xml中声明
- **兼容性**：需检测目标应用是否安装，提供备用方案（如跳转应用商店）

### 核心对比

| 维度 | Webhook | URL Scheme |
|------|---------|------------|
| 适用场景 | 服务端事件通知 | 客户端应用间跳转 |
| 通信方向 | 服务端主动推送 | 客户端主动触发 |
| 数据载体 | HTTP请求体（JSON/XML） | URL参数（键值对） |
| 实时性 | 高（事件触发即发送） | 即时（用户点击响应） |

### 调试工具
- Webhook：使用RequestBin等工具实时捕获请求
- URL Scheme：通过Charles等抓包工具分析调起逻辑

## 关键概念

- [[Webhook]] — 基于HTTP回调的事件驱动通信机制
- [[URL Scheme]] — 移动端应用间跳转的自定义协议
- HMAC签名 — 验证Webhook请求真实性的加密方式
- 深度链接（Deep Link）— URL Scheme的应用场景之一

## 关联实体

- [[GitHub]] — Webhook的典型使用平台
- [[微信]] — URL Scheme的典型应用场景
- [[支付宝]] — 两种技术均有应用

## 相关页面

- [[AI工具与应用-扩展]] — 自动化与集成工具
- [[MCP]] — 另一种AI工具通信协议
- [[个人成长与人生规划]] — 自动化提升效率
