---
tags: [Google Blogger, 博客, 国内访问, 域名, CDN, 技术教程]
created: 2025-06-01
updated: 2026-06-13
sources:
  - "https://blog.csdn.net/vip7557/article/details/137189242"
  - "raw/notes/2025-06-01-谷歌博客Google-Blogger完美优化国内访问.md"
---

# 谷歌博客 Google Blogger 完美优化国内访问

## 概要

详细教程，解决 Google Blogger 在国内无法正常访问的问题。核心思路是通过自定义域名 + Cloudflare 接入、禁用 Blogger 默认的 CSS/JS 文件、替换图片链接为国内可用代理源，实现博客在国内的完整直连访问。

## 核心内容

### 基础配置

1. **域名接入**：拥有独立域名（免费二级域名或付费域名均可），接入 Cloudflare DNS，添加两条 CNAME 记录指向 Blogger。注意验证用的 CNAME 记录不要开启 CDN 代理
2. **个人资料**：在 Blogger 后台设置中修改头像和资料信息

### 模板代码修改

1. **图片链接代理**：搜索所有 http/https/src 的图片链接，前缀加上 `https://images.weserv.nl/?url=` 或 `https://cdn.cdnjson.com/pic.html?url=` 实现国内图片代理
2. **禁用 CSS/JS**：将 `<html>` 标签添加 `b:css='false' b:js='false'` 属性禁用 Blogger 默认资源加载（注意：修改布局时需临时去掉 `b:js='false'`）
3. **缩略图修复**：替换原有缩略图代码为自定义方案，通过 textarea 隐藏文章全文、用 JS 从正文中提取首图作为缩略图
4. **JS 文件替换**：将无法加载的 `indie_compiled.js` 文件下载后上传至国内对象存储（腾讯云/阿里云），替换模板中的引用地址
5. **LOGO 地址修复**：在 JS 文件中给 Blogger LOGO 地址添加 wsrv.nl 代理前缀

### 关键技术点

- wsrv.nl 是图片代理服务，可将 Google 图片资源通过第三方服务器中转
- `b:css='false'` 和 `b:js='false'` 可阻止 Blogger 注入默认的渲染脚本
- 使用 `<b:if>` 条件标签和 DOM 操作实现首页缩略图逻辑

## 关键概念

- **图片代理（wsrv.nl）**：通过第三方 CDN 代理 Google 图片资源，解决国内无法加载的问题
- **Blogger 模板禁用**：通过 `b:css='false'` `b:js='false'` 禁用默认样式和脚本加载
- **CNAME 接入**：将自定义域名指向 Blogger 服务器的 DNS 配置方式
- **国内对象存储**：将 JS 静态资源托管在腾讯云/阿里云 OSS 上，替代 Google 服务器

## 关联实体

- [[Google Blogger]] — Google 提供的免费博客平台
- [[Cloudflare]] — DNS 和 CDN 服务提供商
- [[国内网络优化]] — 解决海外服务在国内访问的技术方案

## 相关页面

- [[谷歌博客国内访问方案]]
- [[技术与服务器部署]]
- [[开启博客]]
