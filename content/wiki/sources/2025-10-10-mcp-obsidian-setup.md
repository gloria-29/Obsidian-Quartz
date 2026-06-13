---
tags: [工具, MCP, Obsidian, Claude]
created: 2025-10-10
updated: 2025-10-10
sources: []
---
# smithery-ai/mcp-obsidian 服务器部署指南

> 小白最友好的[[Obsidian]] [[MCP]]服务器部署方案，不依赖Obsidian内部插件，直接读取文件系统，一键安装到[[Claude Code|Claude Desktop]]。

## 核心观点
- smithery-ai/mcp-obsidian比Python版MCP更简单，基于Node.js，无需安装Obsidian REST API插件
- 一键安装命令：`npx -y @smithery/cli install mcp-obsidian --client claude --vaultPath "<vault路径>"`
- 直接读取Markdown文件系统，不需要Obsidian应用运行
- Windows部署完整步骤包括Node.js安装、Vault路径获取、MCP安装和Claude Desktop重启验证

## 关键概念
- [[MCP]] — Model Context Protocol，让AI工具安全访问外部数据源的开放协议
- [[Obsidian]] — 基于本地Markdown文件的个人知识管理工具
- [[Smithery]] — MCP服务器的分发和托管平台

## 相关页面
- [[MCP]]
- [[Obsidian]]
- [[Claude Desktop配置]]
