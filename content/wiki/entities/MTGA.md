---
tags: [proxy, api, model-aggregation, free, trae, open-source]
created: 2026-05-19
updated: 2026-05-19
type: entity
sources:
  - raw/articles/2026-05-18-20251109-mtga赋能trae.md
---

# MTGA

> 本地代理工具，绕过 IDE 的固定模型服务商限制，将公益 API 站的国际大模型聚合到 Trae 等国内 IDE 中统一使用。

## 概述

MTGA（由 GitHub 用户 BiFangKNT 开发）是一个基于本地代理的工具，核心功能是绕过 IDE 的固定模型服务商限制。其最典型的应用场景是将公益 API 站（如 api.dev88.tech）提供的国际大模型（Gemini、Claude、Kimi K2.6 等）聚合到 [[Trae]] 等国内 IDE 的自定义模型中，实现免费使用多种前沿模型。

## 工作原理

MTGA 通过在本地启动代理服务，将 IDE 发往指定地址的请求转发到配置的目标 API 端点。用户只需在 MTGA 中配置目标 API 的地址、模型名称、API Key，然后在 IDE 中添加一个自定义模型指向本地代理即可。

**v1.2.0 版本优势**：在 IDE 只需添加一次模型配置，后续可直接在 MTGA UI 中切换模型，无需反复修改 IDE 设置。

## 使用流程

1. 下载 MTGA GUI 并管理员运行
2. 在公益 API 站选择模型、生成 API Key
3. 在 MTGA 中填写 API 地址、模型名称、鉴权信息
4. 安装证书、修改 HOSTS、启动服务
5. 在 IDE（如 Trae）中添加自定义模型指向本地代理
6. 后续在 MTGA 中自由切换模型

## 关系

- 相关页面：[[Trae]], [[MCP]], [[Claude Code]]
- 主要用途：扩展 [[Trae]] 的可用模型范围，免费接入国际大模型
- 生态位置：属于 AI 工具链中的"代理/中转"基础设施层

## 来源参考

- LINUX DO 社区 MTGA 教程帖
- GitHub: BiFangKNT/mtga
