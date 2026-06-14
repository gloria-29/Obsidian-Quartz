---
tags: [Cloudflare, 临时邮箱, 子域名, DNS配置, Worker, 邮件路由]
created: "2026-04-28"
updated: "2026-06-13"
sources:
  - "raw/articles/2026-05-18-20260428-cloudflare-tempemail-子域邮箱配置方法の无限裂变.html"
---

# Cloudflare 子域邮箱配置：临时邮箱的无限裂变

## 概要

基于 Cloudflare Worker 的免费临时域名邮箱方案，通过配置通配符 DNS + 主域 Catch-all + Worker 环境变量实现随机二级域名收信。子域邮箱注册 OpenAI 等服务成功率约 60%，是应对风控的有效手段。

## 核心内容

### 前置条件

- 部署 [cloudflare_temp_email](https://github.com/dreamhunter2333/cloudflare_temp_email) 项目（需 v1.50+，支持随机二级域名）
- 拥有 Cloudflare 托管的主域名（如 `example.com`）

### 三步配置流程

**第一步：通配符 MX 记录**

在 Cloudflare DNS 管理页面添加三条通配符 MX 记录（名称填 `*`）：
- `route1.mx.cloudflare.net` / `route2.mx.cloudflare.net` / `route3.mx.cloudflare.net`
- 同时添加通配符 SPF TXT 记录：`v=spf1 include:_spf.mx.cloudflare.net ~all`

**第二步：开启主域名 Catch-all**

路径：电子邮件 → 电子邮件路由 → 路由规则 → Catch-all 地址
- 状态：开启
- 操作：发送到 Worker（选择已部署的 `cloudflare_temp_email`）

**第三步：配置 Worker 环境变量**

- `DOMAINS`：`["example.com"]`（主域名）
- `RANDOM_SUBDOMAIN_DOMAINS`：`["example.com"]`
- `ENABLE_RANDOM_SUBDOMAIN`：`true`

### 工作原理

发往 `test@任意值.example.com` 的邮件 → 通配符 MX 解析到 Cloudflare 邮件服务器 → 主域 Catch-all 拦截 → Worker 接收处理 → 前端收件箱展示。

### 限制

- Cloudflare 邮件路由界面不支持泛解析，需手动在 DNS 页面添加
- 子域邮箱非万能，部分服务仍有风控拦截

## 关键概念

- **通配符 MX 记录**：名称为 `*` 的 MX 记录，匹配所有未明确定义的子域
- **Catch-all**：主域邮件路由的全部捕获功能，将无匹配规则的邮件统一转发
- **随机二级域名**：每次注册生成不同子域前缀，增加邮箱多样性
- **SPF 记录**：Sender Policy Framework，防止发信被退信

## 关联实体

- [[Cloudflare]] — DNS 和 Worker 平台
- [[技术与服务器部署]] — 部署实践
- [[PAI]] — 个人基础设施中的邮件管理

## 相关页面

- [[技术与服务器部署]]
- [[一人公司工具栈]]
- [[MCP协议与工具生态系统]]
