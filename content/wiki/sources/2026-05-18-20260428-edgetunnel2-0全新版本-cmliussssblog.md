---
tags: [Edgetunnel, Cloudflare, VLESS, Trojan, 代理工具, 科学上网, Pages部署]
created: "2026-04-28"
updated: "2026-06-13"
sources:
  - "raw/articles/2026-05-18-20260428-edgetunnel2-0全新版本-cmliussssblog.html"
  - "raw/articles/2026-04-03-edgetunnel.md"
---

# Edgetunnel 2.0：基于 Cloudflare Pages 的全新代理方案

## 概要

Edgetunnel 2.0 是基于 Cloudflare Pages/Workers 部署的代理隧道工具，支持 VLESS/Trojan 协议在线切换、WebUI 管理面板、三网优选 IP、SOCKS5/HTTP 反代等功能。采用全新传输架构，部署门槛极低（Pages 上传方式零门槛）。

## 核心内容

### 主要改进

- **全新传输架构**：提升兼容性和稳定性
- **WebUI 管理界面**：修改配置无需改动变量重新部署，点击保存即刻生效
- **多协议支持**：在线切换 VLESS、Trojan 传输协议
- **三网优选 IP**：根据电信/联通/移动自动分配优选 IP，支持自定义优选、在线优选、优选 API 接入
- **反代扩展**：除 ProxyIP 外支持 SOCKS5/HTTP 代理，可实现链式代理效果
- **Telegram Bot 通知**：实时获取项目访问、登录、订阅等消息
- **请求统计**：通过 CF Account ID/API Token 获取 Workers/Pages 使用量统计
- **日志中心**：查看所有可疑登录订阅操作

### 部署方式（Pages 上传为例）

1. 下载 `direct-upload-demo.zip`，在 Cloudflare 创建 Pages 应用
2. 添加 `ADMIN` 变量（WebUI 管理员密码）
3. 创建 KV 命名空间（建议命名 `EDT2`）并绑定
4. 下载 `edgetunnel-main.zip`，通过"从计算机中选择"上传部署
5. 绑定自定义域名

### 部署方式总览

| 方式 | 说明 |
|------|------|
| Workers | Cloudflare Workers 直接部署 |
| Pages GitHub | 通过 GitHub 仓库自动部署 |
| Pages 上传 | 手动上传压缩包，零门槛 |

### 高级功能

- 自助优选订阅
- VLESS/Trojan 协议切换
- 单面板管理多节点（彩蛋功能）
- SOCKS5/HTTP 全局代理链式代理

## 关键概念

- **优选 IP**：针对不同运营商网络选择最优 Cloudflare 边缘节点 IP
- **VLESS / Trojan**：两种轻量级代理协议，各有兼容性与性能特点
- **Cloudflare Pages**：Cloudflare 的前端部署平台，可运行 Worker 脚本
- **KV 命名空间**：Cloudflare Workers KV 存储，用于持久化配置数据
- **链式代理**：SOCKS5/HTTP 反代 + 上游代理的组合使用方式

## 关联实体

- [[Cloudflare]] — 部署平台
- [[技术与服务器部署]] — 部署实践

## 相关页面

- [[技术与服务器部署]]
- [[Cloudflare]]
- [[MCP协议与工具生态系统]]
