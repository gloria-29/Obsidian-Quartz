---
tags: [Openlist, GitHub, 网盘管理, 教程]
created: 2025-11-07
updated: 2025-11-07
sources: []
---
# Openlist挂载GitHub仓库配置指南

> 利用[[Openlist]]内置的GitHub API存储驱动，将GitHub仓库像云盘一样挂载和浏览的完整配置教程。

## 核心观点
- Openlist是AList的分支，继承了其强大的多存储驱动支持
- 通过GitHub Personal Access Token (PAT)认证，勾选`repo`权限即可
- 文件大小限制100MB，写操作仅在挂载分支名时可用
- 最小权限原则：只授予必要的`repo`作用域，设置过期时间

## 关键概念
- [[Openlist]] — AList的开源分支，统一的文件列表管理程序
- [[Personal Access Token]] — GitHub的API认证令牌，替代密码使用
- [[AList]] — 开源的多存储文件列表程序，Openlist的父项目
