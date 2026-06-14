---
tags: [CodePilot, AI工具, Agent, Claude Code, GUI, Vibe Coding]
created: 2026-04-09
updated: 2026-06-13
sources:
  - https://mp.weixin.qq.com/s/rlifmUjG23e7Tj9_RBNzWw
  - https://github.com/op7418/CodePilot
---

# CodePilot 保姆级入门攻略

## 概要

藏师傅(op7418)纯[[AI提示词工程]]驱动的Vibe Coding方式开发的全平台开源通用Agent客户端，GitHub 5100+ Star。支持Mac/Windows/Linux，集成Claude/OpenAI授权登录、国产模型CodePlan、[[Claude Code]]引擎、Skills/MCP/Plugin、IM远程连接、生成式UI看板、Obsidian深度集成的助理模式等功能。是[[AI工具与应用-扩展]]生态中面向终端用户的通用Agent GUI代表。

## 核心内容

### 多模型接入方式

1. **Claude授权登录**：直接读取Claude Code登录状态，选择执行引擎为Claude Code即可
2. **OpenAI授权登录**：网页OAuth授权，使用GPT Plus/Pro额度
3. **国产模型CodePlan**：支持智谱、MiniMax、Kimi、MIMO、火山方舟、阿里云百炼
4. **三方Anthropic API**：国内代理服务，需配置基础URL和模型名称映射
5. **Ollama本地模型**：连接本地Ollama服务，支持Gamma 4等本地部署模型

### 核心特色功能

- **设计Agent模式**：调用[[Nano Banana Pro]]生成图片，支持连续编辑和批量生成，自动归入素材库
- **生成式UI**：AI实时生成可视化图表/流程图，可Pin到看板持续更新
- **助理模式**：长期记忆 + 心跳机制（类似龙虾的主动执行），可与[[知识管理与笔记系统]]中的Obsidian深度集成
- **宠物系统**：助理与宠物结合，孵化、进化、属性成长
- **IM远程连接**：飞书、微信、QQ、Discord远程操控Agent
- **Token用量统计**：详细的模型消耗追踪

### Skills与MCP生态

- 内置Skills.sh市场，搜索安装社区Skills
- 支持MCP服务器管理面板，添加自定义MCP服务
- 内置CLI工具商店（ffmpeg、飞书CLI等筛选推荐）
- 斜杠命令查看和调用所有已安装Skills

### 项目制工作流

每个聊天绑定本地文件夹作为项目，AI可操作项目下所有文件。支持代码模式和计划模式切换，以及默认权限/完全访问两种安全级别。

## 关键概念

- [[CodePilot]] — 全平台开源Agent客户端，Vibe Coding产物
- [[Vibe Coding]] — 不写传统代码、通过与AI对话驱动开发的编程范式
- [[生成式UI]] — AI实时生成可交互可视化组件的界面能力
- [[助理模式]] — Agent的长记忆+主动执行模式，拥有心跳机制

## 关联实体

- [[藏师傅]] — CodePilot开发者，op7418
- [[Claude Code]] — CodePilot支持的执行引擎之一
- [[Nano Banana Pro]] — 内置设计Agent的图像生成模型
- [[个人AI基础设施]] — CodePilot作为Agent客户端在PAI生态中的位置

## 相关页面

- [[Claude Code]]
- [[AI工具与应用-扩展]]
- [[知识管理与笔记系统]]
- [[AI提示词工程]]
