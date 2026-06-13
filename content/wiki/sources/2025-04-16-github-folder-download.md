---
tags: [GitHub, 开发工具, 版本控制]
created: 2025-04-16
updated: 2025-04-16
sources: []
---
# 下载 GitHub 仓库特定目录的方法

> 系统地介绍了无需克隆整个仓库即可下载 GitHub 特定目录/文件夹的多种方法。

## 核心观点
- 六种方法从简单到高级：网页手动下载、ZIP全仓库下载、第三方工具(DownGit/GitZip)、API 编程方式、Git Sparse Checkout、npx degit
- 推荐方案：DownGit(粘贴URL即下载)和 GitZip 浏览器扩展(右击文件夹直接下载)
- Sparse Checkout 是最专业的方法，Git 2.25+ 原生支持，仅下载指定文件夹

## 关键概念
- [[Git Sparse Checkout]] — Git 原生功能，允许仅检出仓库的部分目录而非完整仓库
- [[DownGit]] — 第三方在线工具，通过文件夹 URL 直接生成 ZIP 下载
