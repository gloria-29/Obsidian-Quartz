---
tags: [MCP, AI工具配置, Cherry Studio, MCPHub, 服务器配置]
created: 2025-09-22
updated: 2026-06-13
sources: [WuCai群聊记录]
---

# MCP服务器配置：Cherry Studio中添加MCP服务

## 概要

群聊讨论在Cherry Studio中配置MCP服务器的方法，核心是通过JSON导入方式添加MCP服务，使用streamableHttp类型连接远程MCP服务端。

## 核心内容

### 配置方式
- Cherry Studio支持通过JSON导入添加MCP服务器
- 配置使用streamableHttp传输类型连接远程服务
- 目标服务地址为mcp.chatgo.pro

### MCP协议要点
- MCP（Model Context Protocol）是AI工具与外部服务交互的标准协议
- 服务器端负责提供工具能力，客户端（如Cherry Studio）负责调用
- 配置JSON中需指定传输类型、服务地址和认证信息

### 实操步骤
1. 获取MCP服务器的连接配置JSON
2. 在Cherry Studio的MCP管理界面选择导入
3. 粘贴JSON配置并保存
4. 测试连接是否成功

## 关键概念

- [[MCP]] — Model Context Protocol，AI模型与外部工具交互的标准协议
- [[Cherry Studio]] — 支持MCP的AI客户端桌面应用
- streamableHttp — MCP的一种传输协议类型，基于HTTP流式通信
- JSON导入 — 快速配置MCP服务的方式

## 关联实体

- [[Cherry Studio]] — MCP客户端应用
- [[MCPHub]] — MCP服务聚合平台
- [[mcp.chatgo.pro]] — 远程MCP服务端

## 相关页面

- [[MCP]] — 协议概述与生态
- [[AI工具与应用-扩展]] — AI工具配置与使用
- [[Obsidian]] — 同类知识管理工具对比
