---
tags: [MCP, Obsidian, Claude, Smithery, Node.js, 知识管理]
created: 2025-10-10
updated: 2026-06-13
sources: [raw/notes/2025-10-10-smithery-ai-mcp-obsidian服务器.md]
---

# smithery-ai/mcp-obsidian 服务器部署指南

## 概要

smithery-ai/mcp-obsidian 是面向小白用户最友好的 [[Obsidian]] [[MCP]] 服务器部署方案。相比 Python 版 MCP，它基于 Node.js，不需要安装 Obsidian REST API 插件，直接读取文件系统，通过一条 `npx` 命令即可完成安装并自动配置 [[Claude Code|Claude Desktop]]。本文包含完整的 Windows 部署步骤、验证方法和故障排除指南。

## 核心内容

### 为什么选择 smithery-ai/mcp-obsidian
- **安装最简单**: `npx -y @smithery/cli install mcp-obsidian --client claude --vaultPath "<路径>"` 一条命令搞定
- **无 Obsidian 依赖**: 直接读取 Markdown 文件系统，不需要 Obsidian 应用运行，不需要 REST API 插件
- **Node.js 生态**: 对多数用户比 Python 环境（特别是 uvx 等新工具）更直观
- **自动配置**: Smithery CLI 自动处理 Claude Desktop 的 MCP 配置文件

### 完整部署步骤（Windows）

**步骤 1：安装 Node.js**
- 从 nodejs.org 下载 LTS 版本 MSI 安装包
- 默认安装即可，确保勾选 "Node.js runtime" 和 "npm package manager"
- 验证：`node -v` 和 `npm -v` 输出版本号

**步骤 2：获取 Vault 路径**
- Obsidian 中右键文件/文件夹 → "在系统资源管理器中显示" → 复制地址栏路径
- 示例：`C:\Users\YourName\Documents\Obsidian\MyVault`
- 确保复制的是整个 Vault 文件夹路径

**步骤 3：安装 MCP 服务器**
```bash
npx -y @smithery/cli install mcp-obsidian --client claude --vaultPath "<完整路径>"
```
- 路径含空格时必须用双引号括起

**步骤 4：重启 Claude Desktop**
- 完全退出（系统托盘右键 → 退出），不是最小化
- 重新启动

**步骤 5：验证**
- Claude Desktop 中出现锤子/工具图标即表示 MCP 已连接
- 点击可看到 `list_files_in_vault`、`search`、`get_file_contents` 等工具
- 测试："列出我的 Obsidian 笔记库中的所有文件"

### 故障排除
- `npx` 命令未找到 → 重启电脑，确认 Node.js 安装路径在系统环境变量中
- 安装报错 → 检查 Vault 路径正确性，尝试管理员权限运行命令提示符
- 无工具图标 → 检查日志 `%APPDATA%\Claude\logs\mcp*.log`

## 关键概念

- **MCP（Model Context Protocol）**: 让 AI 工具安全访问外部数据源的开放协议，由 Anthropic 推出
- **Smithery**: MCP 服务器的分发和托管平台，提供一键安装 CLI 工具
- **Vault 路径**: Obsidian 笔记库在本地文件系统的根目录路径，MCP 服务器通过此路径直接读取 Markdown 文件

## 关联实体

- [[MCP]] — 本方案的核心协议，连接 AI 工具与 Obsidian 笔记库
- [[Obsidian]] — 基于本地 Markdown 文件的个人知识管理工具，MCP 服务器的数据源
- [[Claude Code]] — MCP 宿主客户端，通过 MCP 协议调用 Obsidian 工具
- [[PAI]] — PAI 的知识管理模块同样依赖 [[Obsidian]] 作为底层存储

## 相关页面

- [[MCP协议与工具生态系统]] — smithery-ai/mcp-obsidian 是 MCP 生态中的典型知识管理工具
- [[知识管理与笔记系统]] — MCP 桥接 AI 与笔记系统，实现 AI 辅助知识检索和管理
- [[Claude Desktop配置]] — Claude Desktop 的 MCP 配置和管理
