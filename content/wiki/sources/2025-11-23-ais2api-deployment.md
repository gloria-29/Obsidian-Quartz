---
tags: [AI Studio, API, 反向工程, Docker, Gemini, 自动化]
created: 2025-11-23
updated: 2026-06-13
sources: [raw/notes/2025-11-23-本地获取认证部署ais2api项目.md]
---

# ais2api：本地获取 AI Studio 认证部署 API

## 概要

通过 camoufox 反检测浏览器在本地获取 Google AI Studio 认证文件，并使用 Docker 部署为 [[Gemini]] 兼容 API 服务的完整教程。支持多账号负载均衡、自动切换和假流式模式，部署后以 Gemini 接口格式访问，适合需要大量调用 Gemini API 的场景。

## 核心内容

### 部署流程

**第一步：本地获取认证文件（Windows）**
1. 安装 Git、Node.js、Docker
2. 下载 camoufox 反检测浏览器（GitHub Releases）
3. 克隆 ais2api 项目：`git clone https://github.com/Ellinav/ais2api.git`
4. 解压 camoufox 到项目文件夹
5. 运行 `npm install` 安装依赖
6. 运行 `node save-auth.js` 按提示获取认证 JSON 文件
7. 需要多账号时重复执行 save-auth.js

**第二步：Linux 服务器部署**
1. 创建项目目录和认证文件夹：`mkdir -p ./auth`
2. 设置权限：`sudo chown -R 1000:1000 ./auth`
3. 创建 docker-compose.yml，配置端口映射（7860）和认证挂载
4. 创建 .env 文件，配置以下关键变量：
   - `API_KEYS`: 访问密钥（必须修改）
   - `SWITCH_ON_USES`: 每账号使用次数后切换（默认40）
   - `STREAMING_MODE`: 流式模式（real）
   - `IMMEDIATE_SWITCH_STATUS_CODES`: 429/503 时立即切换账号
5. 上传认证文件到 auth 文件夹
6. `docker compose up -d` 启动服务

### 关键配置参数
- 支持多账号轮换，避免单账号限流
- 遇到 429（限流）和 503（服务不可用）自动切换账号
- 以 Gemini API 接口格式对外提供服务

## 关键概念

- **反检测浏览器（Camoufox）**: 修改浏览器指纹以避免被网站检测为自动化工具
- **API 代理**: 将网页端服务转换为标准 API 接口，实现程序化调用
- **负载均衡**: 多账号轮换使用，分散单账号的调用压力
- **Docker Compose**: 多容器应用的编排工具，简化部署和管理

## 关联实体

- [[Gemini]] — Google 的大语言模型，本项目将其 AI Studio 转为 API 服务
- [[独立开发与营销]] — 自建 API 服务是独立开发者降低 AI 调用成本的技术手段

## 相关页面

- [[Gemini]] — Gemini 模型的官方 API 和 AI Studio 平台
- [[独立开发与营销]] — 利用开源工具降低 AI 开发成本的实践经验
- [[知识管理与笔记系统]] — 技术部署文档的系统化整理和维护
