---
tags: [AI工具, 开源, API, DeepSeek, API中转, Agent]
created: 2026-04-08
updated: 2026-06-13
sources:
  - https://github.com/CJackHwang/ds2api
---

# DS2API：DeepSeek 客户端对话转 API

## 概要

DS2API是由CJackHwang开发的全栈开源工具，将[[DeepSeek]] Web对话能力转换为OpenAI、Claude、Gemini兼容的API接口。Go后端全量实现 + React前端管理台，支持多账号轮询、并发队列控制、Vercel/Docker/本地多种部署方式。[[Claude Code]]可通过配置`ANTHROPIC_BASE_URL`直接接入，实现用DeepSeek模型驱动Claude生态工具链。

## 核心内容

### 架构设计（3.x版本）

- **统一路由内核**：所有协议入口汇聚到chi Router，OpenAI/Claude/Gemini/Admin/WebUI统一注册
- **统一执行链路**：Claude/Gemini入口先经协议转换层（CLIProxy Bridge），再进入OpenAI ChatCompletions统一处理，最后转换回原协议响应
- **Tool Calling双运行时对齐**：Go侧与Vercel Node侧保持一致的解析/防泄漏语义，覆盖JSON/XML/ANTML/invoke多风格输入

### 协议兼容矩阵

| 协议 | 端点示例 | 默认模型映射 |
|------|----------|------------|
| OpenAI | `/v1/chat/completions`、`/v1/responses` | `gpt-4o` → `deepseek-chat` |
| Claude | `/anthropic/v1/messages`、`/v1/messages` | `claude-sonnet-4-5` → `deepseek-chat` |
| Gemini | `/v1beta/models/{model}:generateContent` | 按model_aliases规则映射 |

### 核心能力

- **多账号轮询**：自动token刷新，邮箱/手机号双登录，`X-Ds2-Target-Account`指定账号
- **并发队列控制**：每账号in-flight上限 + 等待队列，动态计算建议并发值，超出才返回429
- **DeepSeek PoW**：纯Go高性能实现（DeepSeekHashV1），毫秒级响应
- **Tool Calling防泄漏**：非代码块高置信特征识别，结构化增量输出
- **运行时热更新**：配置与运行时设置通过Admin API分离管理

### Claude Code接入要点

- `ANTHROPIC_BASE_URL`指向DS2API根地址（如`http://127.0.0.1:5001`）
- 需保留常规key与`sk-ant-*`形态key兼容不同客户端
- 代理环境下配置`NO_PROXY=127.0.0.1,localhost`避免本地回环被拦截
- Claude模型映射可通过`claude_mapping`自定义fast/slow对应模型

### 部署方式

- 本地运行（Go 1.26+）、Docker、Vercel Serverless、Zeabur一键部署、systemd
- Vercel流式通过Node Runtime保证实时SSE，鉴权由Go内部完成
- 配置统一为`config.json`，支持Base64注入环境变量

## 关键概念

- [[DS2API]] — DeepSeek网页对话转API的开源工具
- [[DeepSeek]] — 国产大模型，DS2API的数据源
- [[API中转]] — 通过中间层将非官方API转换为标准接口的技术方案
- [[Agent协议适配]] — 统一OpenAI/Claude/Gemini三种协议的适配层模式

## 关联实体

- [[DeepSeek]] — 被转换的AI模型服务
- [[DeepSeek V4]] — DeepSeek最新模型版本
- [[Claude Code]] — 可通过DS2API接入DeepSeek模型
- [[个人AI基础设施]] — API中转作为基础设施层的实践

## 相关页面

- [[DeepSeek]]
- [[DeepSeek V4]]
- [[Claude Code]]
- [[AI工具与应用-扩展]]
