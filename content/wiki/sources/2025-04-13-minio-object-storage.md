---
tags: [MinIO, 对象存储, S3, 开源, 自建服务]
created: 2025-04-13
updated: 2025-04-13
sources: []
---
# MinIO 对象存储解决方案

> 开源高性能 S3 兼容对象存储 MinIO 的全面部署指南，涵盖容器化、macOS、Linux、Windows 和源码编译五种安装方式。

## 核心观点
- MinIO 采用 AGPL v3 许可证开源，与 Amazon S3 API 完全兼容，适合 AI/ML 和数据分析的高性能基础设施
- 五种部署方式：容器化(Podman/Docker)、macOS(Homebrew/二进制)、Linux(二进制)、Windows(exe)、源码编译(Go)
- 默认凭证为 minioadmin:minioadmin，控制台通过 http://127.0.0.1:9001 访问
- 生产环境推荐启用 Erasure Coding，每台服务器至少需要 4 个存储设备
- 升级为零停机时间，所有升级操作均为非破坏性

## 关键概念
- [[MinIO]] — 开源的高性能 S3 兼容对象存储服务器
- [[Erasure Coding]] — 擦除编码技术，通过数据分片和冗余实现高可用性和数据保护
- [[S3 协议]] — Amazon Simple Storage Service API，已成为对象存储的事实标准
- [[对象存储]] — 以对象（而非文件或块）形式存储数据的架构，适合非结构化数据和海量存储
