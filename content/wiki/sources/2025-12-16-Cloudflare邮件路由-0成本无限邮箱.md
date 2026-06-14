---
tags: [Cloudflare, 邮件路由, 隐私保护, 无限邮箱, Gmail, 教程]
created: 2025-12-16
updated: 2026-06-13
sources:
  - raw/notes/2025-12-16-Cloudflare邮件路由-0成本无限邮箱.md
---

# Cloudflare 邮件路由 — 0 成本无限邮箱

## 概要

利用 Cloudflare Email Routing 功能，0 成本实现无限别名邮箱。配合 Catch-all 功能可随意编造邮箱地址（如 amazon@yourdomain.com），所有邮件自动转发到私人邮箱。再通过 Gmail SMTP 代发功能，实现以域名邮箱身份"原件发送"，形成完整的收发闭环。

## 核心内容

### 第一阶段：接收邮件
- **前提**：拥有一个域名，且域名 NS 已托管到 Cloudflare
- 进入 Cloudflare → 域名 → Email → Email Routing → Get Started
- 添加目标地址（私人邮箱如 Gmail），完成验证
- Cloudflare 自动添加 MX 和 TXT（SPF）记录
- 创建自定义别名地址或开启 **Catch-all**（接收所有前缀的邮件）

### Catch-all 的妙用
- 开启后任意前缀 `xxx@yourdomain.com` 都能收到邮件
- 可为每个网站创建专属邮箱：`amazon@yourdomain.com`、`tiktok@yourdomain.com`
- 用于追踪哪个平台泄露了你的邮箱信息

### 第二阶段：Gmail SMTP 发信
1. 开启 Google 两步验证 → 生成应用专用密码（16 位）
2. Gmail 设置 → 账号和导入 → 添加其他电子邮件地址
3. SMTP 配置：`smtp.gmail.com`，端口 587，TLS 加密
4. 用户名用 Gmail 原账号，密码用应用专用密码
5. 验证邮件通过 Cloudflare 路由自动回到 Gmail 收件箱

### 避坑指南
- 一个域名只能有一条 SPF 记录，删除旧的残留记录
- 不要用于群发营销邮件（Gmail SMTP 有日发送限制）
- DMARC 设置保持 Cloudflare 默认即可满足 99% 需求

## 关键概念

- **Email Routing** — Cloudflare 免费邮件路由功能，不提供邮箱存储，只做转发
- **Catch-all** — 接收所有发往域名的邮件，无需逐个创建别名
- **SPF 记录** — Sender Policy Framework，声明哪些服务器有权代发域名邮件
- **应用专用密码** — Google 为不支持两步验证的应用生成的专用登录密码

## 关联实体

- [[Cloudflare]] — 提供免费邮件路由和 CDN 服务
- [[Gmail SMTP]] — 用于伪装域名邮箱发信
- [[DNS MX 记录]] — 邮件路由的核心 DNS 配置

## 相关页面

- [[2024-06-19-free-api]]
- [[2024-08-13-my-tools]]
- [[2024-08-22-我的订阅制服务统计]]
