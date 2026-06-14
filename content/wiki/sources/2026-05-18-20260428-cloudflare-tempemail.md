---
tags: [Cloudflare, 临时邮箱, 域名邮箱, 邮件路由, 开发工具]
created: 2026-05-18
updated: 2026-06-13
sources: [raw/articles/2026-05-18-20260428-cloudflare-tempemail-子域邮箱配置方法の无限裂变.html]
---

# Cloudflare Temp Email 子域邮箱配置：无限裂变

## 概要

介绍如何在已有 Cloudflare 临时邮箱项目基础上配置子域（随机二级域名）邮箱功能。通过通配符 DNS + 主域 Catch-all + Worker 环境变量的三步方案，实现任意子域名邮箱的收信能力，子域邮箱注册成功率约 60%。

## 核心内容

### 第一步：配置通配符 DNS 记录
- 在 Cloudflare DNS 管理页面手动添加三条通配符 MX 记录（名称填 `*`）
- 指向 Cloudflare 邮件服务器：route1/2/3.mx.cloudflare.net
- 添加通配符 TXT (SPF) 记录防止退信

### 第二步：开启主域名 Catch-all
- 进入"电子邮件" → "电子邮件路由" → "路由规则"
- 将 Catch-all 地址状态设为开启
- 操作选择"发送到 Worker"，指向已部署的 cloudflare_temp_email

### 第三步：配置 Worker 环境变量
- 确保部署的是 V1.50 以上版本
- 配置 `DOMAINS` 环境变量为 `["example.com"]`
- 添加 `RANDOM_SUBDOMAIN_DOMAINS` 和 `ENABLE_RANDOM_SUBDOMAIN = true`

## 关键概念

- **Catch-all**：捕获发送到域名下所有地址的邮件，无论收件人是否存在
- **通配符 MX 记录**：使用 `*` 作为名称，匹配所有未定义的子域名
- **cloudflare_temp_email**：GitHub 开源项目 dreamhunter2333/cloudflare_temp_email
- **子域邮箱**：使用随机二级域名（如 test@abc.example.com）的临时邮箱

## 关联实体

- [[Cloudflare]] — DNS 和邮件路由服务提供者
- [[临时邮箱]] — 匿名注册和隐私保护工具

## 相关页面

- [[Cloudflare教程]] — Cloudflare 平台使用指南
- [[海外服务注册方案]] — 海外服务注册相关工具
