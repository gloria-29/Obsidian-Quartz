---
tags: [OpenCode, Claude Code, AI终端, 开发工具, CLI]
created: 2026-01-13
updated: 2026-01-13
sources: "["https://linux.do/t/topic/1416459"]"
---

# OpenCode：开源AI终端代理配置指南

## 概要

OpenCode是开源的终端AI代理工具，搭配oh-my-opencode可实现异步多代理协作（UltraWork模式）。核心功能：自动识别和使用[[Claude Code]]的Skills、支持Ralph Loop防止会话终止、多模型并行分工。

## 接入非官方API渠道

### 简单版（推荐）
1. `opencode auth login` → Anthropic → Manually enter API Key
2. 在opencode.json中重载baseURL到渠道地址
3. 修改模型名为渠道实际模型名（如claude-sonnet-4-5-20250929）

### 自定义供应商版
在opencode.json的provider中定义新供应商，指定npm包、baseURL、模型配置（包含context/output限制和modalities信息）

## UltraWork多代理协作模式
- 启用后自动进行项目分块+架构设计
- 多Agent分工并行执行直到项目完整交付
- 可在oh-my-opencode.json中为不同Agent配置不同模型
- 典型分工：前端用Gemini、后端用Opus、调试审核用GPT、搜索用Grok

## 限制
部分平台禁止非Claude Code CLI使用，需注意渠道兼容性。cc-switch等Claude配置工具对OpenCode无效。

## 相关页面
- [[Claude Code]] CLI编程工具
- [[MCP]]协议
- [[PAI 人生操作系统]]的Agent系统
- [[OpenClaw]]代理平台
