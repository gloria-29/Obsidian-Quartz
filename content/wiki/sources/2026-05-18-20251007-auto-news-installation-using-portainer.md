---
tags: [news-aggregator, docker, portainer, notion, self-hosted, rss, llm]
created: 2025-10-07
updated: 2026-06-13
sources: ["https://github.com/finaldie/auto-news/wiki/Installation-using-Portainer"]
---

# Auto-News Portainer 部署指南 -- 个人新闻聚合系统

## 概要

Auto-News 是一款个人新闻聚合器，通过 LLM（支持 ChatGPT/Gemini/Ollama via LangChain）从多源（Twitter、RSS、YouTube、网页文章、Reddit、个人日志）抓取信息并智能过滤，输出至 Notion 进行高效阅读。本文档记录通过 Portainer 快速部署 Auto-News 的完整流程，涵盖环境准备、Docker 堆栈部署、Notion 配置和运维管理。是 [[技术与服务器部署]] 和 [[信息获取与管理]] 的交叉实践。

## 核心内容

### 部署前提
- **必需**：Docker 环境、Notion API 令牌、Notion 入口页面（启用集成）
- **可选**：OpenAI API Key、Google API Key、Ollama 本地模型、Reddit 令牌、Twitter 开发者令牌（需付费账号）
- **推荐**：Notion Web Clipper 浏览器扩展

### 三步部署流程
1. **创建 Notion 入口页面**：新建 Readings 类型页面，启用页面集成，记录页面 ID
2. **配置环境变量**：在 `.env` 中填写 NOTION_TOKEN、NOTION_ENTRY_PAGE_ID，并选择 LLM 提供商（openai/google/ollama 三选一）
3. **Portainer 堆栈部署**：Stacks > Add Stack > 上传 docker-compose.yaml 和 .env > Deploy

### LLM 多模型支持矩阵
| 模型类型 | 响应速度 | 成本 | 适用场景 |
|----------|----------|------|----------|
| OpenAI | 快 | 高 | 高质量摘要生成 |
| Google Gemini | 中 | 中 | 多模态处理 |
| Ollama 本地 | 慢 | 低 | 隐私敏感场景 |

### 部署后配置
- RSS/Reddit 列表配置，Twitter 关键词过滤
- Notion 数据库视图创建，过滤/排序规则
- DeepDive 深度分析模块（实验性），兴趣关键词阈值设置
- Airflow 控制面板（端口 8080）用于 DAG 任务监控

### 运维管理
- 服务重启：Portainer 控制台操作
- 配置更新：替换 .env 后重建堆栈
- 版本升级：git pull 更新代码库
- 自动创建子页面：ToRead、Finished、Saves、Journal

## 关键概念

- **Auto-News**：多源新闻聚合 + LLM 智能过滤系统
- **Portainer**：Docker 容器可视化管理平台，简化堆栈部署
- **Notion 输出适配器**：将聚合内容结构化输出至 Notion 数据库
- **DAG 任务编排**：Airflow 的有向无环图调度，实现自动化信息采集
- **DeepDive**：基于兴趣关键词的深度内容分析（实验性功能）

## 关联实体

- [[Auto-News]] -- 个人新闻聚合系统项目
- [[Notion]] -- 内容输出和阅读平台
- [[技术与服务器部署]] -- Docker/Portainer 部署实践
- [[信息获取与管理]] -- 多源信息聚合与智能过滤
- [[Buzzing]] -- 同为信息聚合方案，但走中文导读路线

## 相关页面

- [[技术与服务器部署]]
- [[信息获取与管理]]
- [[AI工具与应用-扩展]]
- [[Buzzing]]
- [[知识管理与笔记系统]]
