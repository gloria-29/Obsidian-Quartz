---
tags: [甲骨文云, 云服务器, Docker, 自动化, 免费]
created: 2026-02-18
updated: 2026-02-18
sources: []
---
# y 探长部署：自动抢甲骨文免费云服务器

> 使用开源 oci-helper（y探长）脚本自动调用甲骨文 API 定时刷新抢免费云服务器，解决 ARM 实例配额不足的问题。

## 核心观点
- 刷机原理：甲骨文提供 API 接口，脚本定时调用 API 尝试创建免费机器，抢到即止
- y探长即开源项目 oci-helper（Yohann0617），一键 Docker 部署，Web 控制台管理
- 部署前需先建立 VNC 和子网，配置路由表和防火墙
- API 密钥建议新建租户单独分配权限，创建后需等 2-3 分钟生效
- ARM 实例极度稀缺，有人刷大半年才抢到，建议配置通知推送

## 关键概念
- [[甲骨文云]] — Oracle Cloud Infrastructure，提供永久免费的 VPS 实例（ARM 最高 4核24G）
- [[oci-helper]] — y探长，GitHub 开源甲骨文刷机脚本
- [[Docker]] — 容器化部署技术，y探长通过 Docker 部署

## 相关页面
- [[xserver]]
- [[Cloudflare]]
