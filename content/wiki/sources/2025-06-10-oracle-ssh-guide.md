---
tags: [Oracle云, SSH, SCP, 服务器, 运维]
created: 2025-06-10
updated: 2025-06-10
sources: []
---
# Oracle云服务器SSH/SCP连接问题排查

> Oracle云服务器Windows平台上SSH/SCP连接失败的常见排查指南，涵盖默认用户、密钥权限等要点。

## 核心观点
- Oracle Linux默认用户是opc（非root），直接连接root会被拒绝
- SSH命令：ssh -i /path/to/private_key opc@<PUBLIC_IP>
- 需root权限时先用opc登录后执行sudo -i切换

## 关键概念
- [[Oracle Cloud]] — Oracle云服务，提供永久免费层VM实例
- [[SSH]] — Secure Shell，安全远程登录协议

## 相关页面
- [[VPS]]
