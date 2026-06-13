---
tags: [Blogger, 国内访问, Cloudflare, CDN, 代理]
created: 2025-06-01
updated: 2025-06-01
sources: []
---
# Google Blogger完美优化国内访问

> 通过修改模板代码、代理图片JS资源、使用独立域名+Cloudflare，实现Google Blogger国内直连访问的完整方案。

## 核心观点
- 核心原理：禁用无法加载的CSS/JS，将Google资源替换为国内可访问的代理源
- 图片代理：使用images.weserv.nl或cdn.cdnjson.com代理所有Google托管的图片
- CSS/JS禁用：HTML标签注释+添加b:css='false' b:js='false'
- 独立JS文件需下载后托管到国内对象存储（腾讯云COS等）
- 独立域名绑定+Cloudflare DNS配置CNAME记录
- Blogger版权LOGO也需要走代理，不能直接替换链接

## 关键概念
- [[Google Blogger]] — Google免费博客平台，默认国内无法访问
- [[Cloudflare]] — 提供DNS、CDN、代理等网络服务
- [[对象存储]] — 用于托管JS等静态资源实现国内访问

## 相关页面
- [[GCP]]
