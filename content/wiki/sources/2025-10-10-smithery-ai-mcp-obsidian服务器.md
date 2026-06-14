---
tags: [MCP, Obsidian, AI工具, smithery, Node.js, 教程]
created: 2025-10-10
updated: 2026-06-13
sources:
  - raw/notes/2025-10-10-smithery-ai-mcp-obsidian服务器.md
---

# smithery-ai/mcp-obsidian 服务器

## 概要

smithery-ai/mcp-obsidian 是目前对小白用户最友好的 Obsidian MCP（Model Context Protocol）服务器方案。它允许 Claude Desktop 直接读取和搜索 Obsidian 笔记库，无需 Obsidian 应用运行或安装额外插件。本文记录了在 Windows 环境下的完整部署步骤。

## 核心内容

### 为什么选择 smithery-ai/mcp-obsidian
- **一键安装**：提供 `npx -y @smithery/cli install mcp-obsidian --client claude` 命令，自动配置 Claude Desktop
- **无插件依赖**：直接读取文件系统，不需要 Obsidian REST API 插件
- **JavaScript/Node.js 生态**：比 Python 方案（如 mcp-obsidian-python）安装更直观

### 部署五步流程
1. **安装 Node.js**：从 nodejs.org 下载 LTS 版本，确保 npm 和 npx 可用
2. **获取 Vault 路径**：在 Obsidian 中右键文件夹选择"在系统资源管理器中显示"
3. **运行安装命令**：`npx -y @smithery/cli install mcp-obsidian --client claude --vaultPath "<路径>"`
4. **重启 Claude Desktop**：完全退出（包括系统托盘）后重新启动
5. **验证连接**：检查 Claude Desktop 中的锤子图标，尝试列出文件或搜索笔记

### 与其他方案对比
- **mcp-obsidian-python**（MarkusPfeifer）：需要安装 Obsidian REST API 插件 + Python 环境
- **mcp-obsidian**（smithery-ai）：直接读文件系统，零额外依赖

### 常见问题
- "npx" 命令未找到 → 检查 Node.js 安装和环境变量
- 安装报错 → 检查 Vault 路径是否正确，路径有空格需加双引号
- 无工具图标 → 完全关闭后重启 Claude Desktop，检查 `%APPDATA%\Claude\logs\mcp*.log`

## 关键概念

- **MCP（Model Context Protocol）**：Anthropic 推出的模型上下文协议，让 AI 助手访问外部数据源
- **smithery-cli**：Smithery 平台的 CLI 工具，用于一键安装 MCP 服务器
- **Vault 路径**：Obsidian 笔记库在文件系统中的根目录路径

## 关联实体

- [[Obsidian]] — 本地优先的 Markdown 笔记应用
- [[Claude Desktop]] — 支持 MCP 的 AI 桌面客户端
- [[Node.js]] — 运行 npx 命令所需的 JavaScript 运行时

## 相关页面

- [[2024-11-30-podcast-ai-audio-pipeline]]
- [[2024-07-25-obsidian-pdf批注]]
- [[2025-04-06-cubox-obsidian]]
