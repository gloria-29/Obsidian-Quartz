---
tags: [DeepSeek, API, Docker, 自托管, 云服务器部署]
created: 2025-12-02
updated: 2026-06-13
sources: [raw/notes/2025-12-02-Deepseek2API.md]
---

# Deepseek2API

## 概要

Deepseek2API 是一个将 DeepSeek 网页端接口转换为标准 OpenAI API 格式的开源项目，支持在 Ubuntu 云服务器上通过 Docker 或 Docker Compose 部署。提供了从配置、部署、防火墙设置、Nginx反向代理到监控管理的完整部署指南。

## 核心内容

### 部署方式
- **Docker 直接部署**：`docker run` 一键启动，端口5001
- **Docker Compose 部署**（推荐）：更易管理，支持日志轮转和自动重启
- 镜像：`ghcr.io/iidamie/deepseek2api:latest`

### 配置要点
- `config.json` 配置 API 鉴权密钥和 DeepSeek 账号列表
- 支持邮箱+密码或手机号+密码登录
- 账号支持多个，实现负载均衡

### 运维管理
- **防火墙**：开放5001端口（ufw allow 5001/tcp）
- **Nginx反向代理**：支持域名访问、流式输出优化、WebSocket
- **管理脚本**：提供 start/stop/restart/status/logs/update 一键管理
- **日志轮转**：Docker容器日志自动轮转（7天，压缩存储）

### API 接口
- 兼容 OpenAI API 格式：`/v1/models`、`/v1/chat/completions`
- 支持流式和非流式对话
- 使用 Bearer Token 认证

### 故障排查
- 账号登录失败：检查密码、验证码需求
- API 401 错误：检查 Authorization 头中的 key 与 config.json 匹配
- 服务启动失败：查看 docker logs、检查配置文件权限

## 关键概念

- **API 网关转换**: 将非标准接口转换为标准 OpenAI API 格式
- **Docker Compose**: 容器编排工具，简化多容器应用的部署和管理
- **Nginx反向代理**: 前端代理服务器，提供域名访问、负载均衡和安全加固
- **Bearer Token认证**: API 鉴权方式，在请求头中携带 API Key

## 关联实体

- [[DeepSeek]] — Deepseek2API 对接的底层 AI 服务
- [[MinIO对象存储解决方案]] — 同为自托管基础设施

## 相关页面

- [[沉浸式翻译Prompt分享]] — DeepSeek 模型在翻译场景的应用
- [[豆包文生图MCP]] — 另一个 AI 能力封装方案
- [[DeepSeek-OCR深度解读及上手指南]] — DeepSeek 的多模态能力
