---
tags: [知识管理, 开源项目, PandaWiki, Docker, AI检索, 个人知识库]
created: 2025-10-23
updated: 2026-06-13
sources: [raw/notes/2025-10-23-PandaWiki搭建个人知识库学习网站.md]
---

# PandaWiki 搭建个人知识库学习网站

## 概要

PandaWiki 是一个开源的零代码个人知识库学习网站搭建方案，基于 Docker 部署，支持 AI 检索与知识管理。用户无需编程基础即可在约10分钟内搭建一个支持 Markdown 渲染、AI 总结、自然语言查询的知识库网站。项目由长亭科技（Chaitin）开发维护。

## 核心内容

### 核心特性
- **零代码部署**: 一条 bash 命令完成安装，无需编程基础
- **AI 驱动**: 支持基于笔记内容的自然语言提问、自动生成总结、标注引用源
- **Markdown 原生**: 后端编写简单，前端自动渲染，右侧显示目录结构
- **Docker 容器化**: 依赖 Docker 环境部署，镜像约 1.5GB

### 部署流程
1. **安装 Docker**: CentOS 环境下配置阿里云镜像源，`yum install docker-ce`
2. **拉取 PandaWiki**: 执行官方安装脚本 `bash -c "$(curl -fsSLk https://release.baizhi.cloud/panda-wiki/manager.sh)"`
3. **配置 AI 模型**: 支持 DeepSeek 等模型，输入 API Key 即可，其他模型内置默认配置
4. **端口放行**: 需放行 2443（管理端）和 8080（前端访问）端口
5. **创建知识库**: 在后端创建文件夹和文档，前端自动同步更新

### 系统要求
- Linux 系统，最低 1核 CPU / 2GB 内存 / 5GB 磁盘
- 需要 Docker 环境
- 需要 AI 模型 API Key（如 DeepSeek）

### 常见问题
- 防火墙需同时放行 8080 端口，仅放行安全组不够
- `firewall-cmd --permanent --add-port=8080/tcp && firewall-cmd --reload`

## 关键概念

- **PandaWiki**: 长亭科技开源的 AI 驱动知识库平台
- **Docker 容器化部署**: 通过容器技术实现一键部署和环境隔离
- **AI 检索增强**: 利用大语言模型对知识库内容进行语义搜索和自动总结
- **零代码搭建**: 无需编程即可构建功能完整的知识管理网站

## 关联实体

- [[知识管理与笔记系统]] — PandaWiki 是个人知识管理的重要工具选项
- [[NotebookLM]] — 同为 AI 驱动的知识检索工具，PandaWiki 更侧重公开分享
- [[Obsidian]] — 本地知识管理对比方案，PandaWiki 侧重在线共享

## 相关页面

- [[独立开发与营销]] — 零代码工具降低了个人项目的启动门槛
- [[PAI]] — PAI 的知识管理模块可参考类似 AI 检索架构
- [[效率与自我管理]] — 知识库系统化是提升个人效率的基础设施
