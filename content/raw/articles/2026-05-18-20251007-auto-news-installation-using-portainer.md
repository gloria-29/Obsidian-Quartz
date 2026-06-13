---
created: 2025-10-07
title: "Installation using Portainer"
source: "https://github.com/finaldie/auto-news/wiki/Installation-using-Portainer#start-of-content"
author:
  - "[[GitHub]]"
description: "A personal news aggregator to pull information from multi-sources + LLM (ChatGPT/Gemini/Ollama via LangChain) to help us reading efficiently with less noises, the sources including: Tweets, RSS, YouTube, Web Articles, Reddit, and personal Journal notes. - Installation using Portainer · finaldie/auto-news Wiki"
---
# Installation using Portainer

# 基于 GitHub Wiki 的《Installation using Portainer》阅读笔记

## 一、核心目标
通过 Portainer 快速部署 Auto-News 个人新闻聚合系统，实现多源信息（Twitter/RSS/YouTube/网页文章/Reddit/日志笔记）的智能整合与高效阅读

## 二、关键准备工作
### 必需组件
- ✅ Docker 环境
- ✅ Notion API 令牌 ([获取指南](https://www.notion.so/my-integrations))
- ✅ Notion 入口页面（需启用集成）

### 可选组件
| 组件类型 | 功能说明 | 获取途径 |
|----------|----------|----------|
| OpenAI API Key | GPT 模型交互 | [OpenAI 平台](https://openai.com/blog/openai-api) |
| Google API Key | Gemini 模型调用 | [Google Makersuite](https://makersuite.google.com/app/apikey) |
| Ollama 服务 | 本地开源模型支持 | [Ollama 官网](https://ollama.com/) |
| Reddit 令牌 | Reddit 内容聚合 | [Reddit 开发控制台](https://www.reddit.com/prefs/apps) |
| Twitter 开发者令牌 | Twitter 内容采集（需付费账号） | [Twitter Developer](https://developer.twitter.com/en) |

### 推荐工具
- Notion Web Clipper 浏览器扩展

## 三、部署流程详解
### 步骤 1：创建 Notion 入口页面
1. 新建 \\"Readings\\" 类型页面
2. 启用页面集成功能
3. 记录页面 ID（示例截图见 Wiki）

### 步骤 2：配置环境变量
```env
# 核心配置
NOTION_TOKEN=您的集成令牌
NOTION_ENTRY_PAGE_ID=入口页面ID

# AI 模型选择 (三选一)
## OpenAI 配置
LLM_PROVIDER=openai
OPENAI_API_KEY=sk-xxx
OPENAI_MODEL=gpt-3.5-turbo-0125

## Google Gemini 配置
LLM_PROVIDER=google
GOOGLE_MODEL=gemini-1.5-flash-latest
GOOGLE_API_KEY=xxx

## Ollama 本地模型配置
LLM_PROVIDER=ollama
OLLAMA_MODEL=llama3
OLLAMA_URL=http://<ollama_hostname>:11434
```

### 步骤 3：Portainer 堆栈部署
1. 导航至 Stacks → Add Stack
2. 上传关键文件：
   - [docker-compose.yaml](https://github.com/finaldie/auto-news/blob/main/docker/portainer/docker-compose.yaml)
   - 配置完成的 .env 文件
3. 部署验证要点：
   - 服务状态监测（约需 5 分钟启动）
   - Notion 自动创建子页面：
     - *ToRead*
     - *Finished*
     - *Saves*
     - *Journal*（日志模块）

## 四、部署后配置
1. **内容源管理**
   - RSS/Reddit 列表配置
   - Twitter 关键词过滤设置（付费账户专属）

2. **Notion 视图优化**
   - 创建自定义数据库视图
   - 配置过滤/排序规则

3. **深度阅读功能**（实验性）
   - 启用 DeepDive 分析模块
   - 设置兴趣关键词阈值

## 五、系统验证与监控
1. 访问 Airflow 控制面板（默认端口 8080）
   - DAG 任务状态检查
   - 执行日志分析

2. 内容流入验证
   - 检查 Notion 的 ToRead 页面
   - 测试新增 RSS 源的实时同步

## 六、运维管理
### 常规操作
| 操作类型 | 执行方式 |
|----------|----------|
| 服务重启 | Portainer 控制台操作 |
| 配置更新 | 替换 .env 后重建堆栈 | 
| 版本升级 | 通过 `git pull` 更新代码库 |

### 异常处理
- 权限问题：检查 Notion 页面集成权限
- 服务启动失败：验证端口冲突（特别是 8080）
- AI 模型不可用：检查 API 密钥有效期

## 七、架构优势分析
1. **模块化设计**：
   - 独立数据采集模块
   - LLM 处理抽象层
   - 统一 Notion 输出适配器

2. **多模型支持矩阵**：
| 模型类型 | 响应速度 | 成本 | 适用场景 |
|----------|----------|------|----------|
| OpenAI 云服务 | ★★★★☆ | $$$ | 高质量摘要生成 |
| Google Gemini | ★★★☆☆ | $$ | 多模态处理 |
| Ollama 本地模型 | ★★☆☆☆ | $ | 隐私敏感场景 |

3. **扩展性设计**：
   - 支持自定义爬虫插件
   - 可扩展新数据源类型
   - 动态 DAG 任务编排

## 八、进阶使用建议
1. iOS 快捷指令集成：
   - 创建 \\"Take notes\\" 快捷指令
   - 实现移动端快速日志记录

2. 智能过滤策略：
   - 基于 >50 点赞的 Reddit 内容
   - Twitter 高互动推文优先

3. 数据治理：
   - 周期性归档机制
   - 敏感数据自动脱敏

> 部署完成后，建议定期检查 [项目 Wiki](https://github.com/finaldie/auto-news/wiki) 获取更新通知和优化建议

---

# 原文内容

## Preparison

- \[Required\] [Docker](https://www.docker.com/)
- \[Required\] [Notion Token](https://www.notion.so/my-integrations)
- \[Optional\] [OpenAI API KEY](https://openai.com/blog/openai-api)
- \[Optional\] [Google API KEY](https://makersuite.google.com/app/apikey)
- \[Optional\] [Ollama](https://ollama.com/) service (Open source models)
- \[Optional\] [Notion Web Clipper](https://chrome.google.com/webstore/detail/notion-web-clipper/knheggckgoiihginacbkhaalnibhilkk) Highly Recommended!
- \[Optional\] [Reddit Tokens](https://www.reddit.com/prefs/apps)
- \[Optional\] [Twitter Developer Tokens](https://developer.twitter.com/en), **Paid Account Only**

First of all, go to [Notion](https://www.notion.so/), create a page as the main entry (For example `Readings` page), and enable Notion `Integration` for this page

![image](https://private-user-images.githubusercontent.com/1088543/345346011-8c09bac2-a292-4151-8d6d-9cf7156806c9.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTk3NjkyMDQsIm5iZiI6MTc1OTc2ODkwNCwicGF0aCI6Ii8xMDg4NTQzLzM0NTM0NjAxMS04YzA5YmFjMi1hMjkyLTQxNTEtOGQ2ZC05Y2Y3MTU2ODA2YzkucG5nP1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI1MTAwNiUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNTEwMDZUMTY0MTQ0WiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9OTM2NTE2M2RiMDI4Y2NiNzA4ZTdjOTc0MTllZWZjZWMwYTg3ZDU0YTFmNzdhMjAyY2E3OTFhMjZmYmI4MzdmZiZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QifQ.BV9q2NeHygAd46eSas28GY9KnqdOhtFtOznT0lP4SEQ)

Checkout the repo and copy `.env.template` to `build/.env`, then fill up the environment vars:

- `NOTION_TOKEN`
- `NOTION_ENTRY_PAGE_ID`
- `OPENAI_API_KEY`
- \[Optional\] `REDDIT_CLIENT_ID` and `REDDIT_CLIENT_SECRET`
- \[Optional\] Vars with `TWITTER_` prefix

Double check `LLM_PROVIDER=xxx`, default is `openai`, we could switch to Google Gemini or Ollama, also fill the values accordingly, e.g.

- *LLM\_PROVIDER=openai*:
	- OPENAI\_API\_KEY=sk-xxx
	- OPENAI\_MODEL=gpt-3.5-turbo-0125
- *LLM\_PROVIDER=google*:
	- GOOGLE\_MODEL=gemini-1.5-flash-latest
	- GOOGLE\_API\_KEY=xxx
- *LLM\_PROVIDER=ollama*
	- OLLAMA\_MODEL=llama3
	- OLLAMA\_URL=http://<ollama\_hostname>:11434

**Notes:** Replace `<ollama_hostname>` with the actual Ollama service hostname, and make sure the node is accessible.

Once finished, we will have a ready to go environment file at `build/.env` in the root of the auto-news.

Open Portainer page, left panel go to `Stack` -> `Add Stack`

![image](https://private-user-images.githubusercontent.com/1088543/345340323-7be9aa05-a219-4d93-a86b-410c46a44014.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTk3NjkyMDQsIm5iZiI6MTc1OTc2ODkwNCwicGF0aCI6Ii8xMDg4NTQzLzM0NTM0MDMyMy03YmU5YWEwNS1hMjE5LTRkOTMtYTg2Yi00MTBjNDZhNDQwMTQucG5nP1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI1MTAwNiUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNTEwMDZUMTY0MTQ0WiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9NjVhMjIxMjQ3NTU2MDA4MmE0ZDdhMDEwODFmYWJkZGRiOGYzMDY2MzIxNDA5MjExYzMyOGU0YmFkN2EyZDZkMSZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QifQ.eSuUmLzLztSuOnrR_tiRZP3195N3J9vrsDv6rM6aw8M)

Assign a Stack name, then Upload `docker compose` file and `.env` file:

![image](https://private-user-images.githubusercontent.com/1088543/345343863-2747a355-b0b2-4dd9-b20e-9633e2af736e.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTk3NjkyMDQsIm5iZiI6MTc1OTc2ODkwNCwicGF0aCI6Ii8xMDg4NTQzLzM0NTM0Mzg2My0yNzQ3YTM1NS1iMGIyLTRkZDktYjIwZS05NjMzZTJhZjczNmUucG5nP1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI1MTAwNiUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNTEwMDZUMTY0MTQ0WiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9ZWQyZjZiNDI4NDExM2UxNWIwNGIzNzE5NDAxZTJkYjdkNTI5NzJkNDg4MjE1NTE3ZTk2ODRlNDRmNjg1MTZkNSZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QifQ.p0oHSNrlLWUEumGxtz8STmWF2A0thQvNkJoFfg1eBcM)

- [docker compose file](https://github.com/finaldie/auto-news/blob/main/docker/portainer/docker-compose.yaml)
- Environment file: `build/.env` (created in the previous step)

Last, click `Deploy the stack` button to deploy:![image](https://private-user-images.githubusercontent.com/1088543/345346872-225fee3b-593f-4c04-9029-10c537424a37.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTk3NjkyMDQsIm5iZiI6MTc1OTc2ODkwNCwicGF0aCI6Ii8xMDg4NTQzLzM0NTM0Njg3Mi0yMjVmZWUzYi01OTNmLTRjMDQtOTAyOS0xMGM1Mzc0MjRhMzcucG5nP1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI1MTAwNiUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNTEwMDZUMTY0MTQ0WiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9YzE3NTYyYzZkMmEzNTEzYzA1ODZiMjIwMzNjYWNlODIwYjA3OTNjMGM2Yjk1MjFlYWE2NjUzY2EwOGJlMmRkYiZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QifQ.dXomQEn6wJX0tpLcGFXQMZ6vkaGHVwsuT99qvPbhd8k)

The services will be all ready in a few minutes.

![image](https://private-user-images.githubusercontent.com/1088543/345349522-b89d6aa3-7fdb-4554-9dc4-a7aafdb3c226.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTk3NjkyMDQsIm5iZiI6MTc1OTc2ODkwNCwicGF0aCI6Ii8xMDg4NTQzLzM0NTM0OTUyMi1iODlkNmFhMy03ZmRiLTQ1NTQtOWRjNC1hN2FhZmRiM2MyMjYucG5nP1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI1MTAwNiUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNTEwMDZUMTY0MTQ0WiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9YmZiNzlhYTdmMDVhNDUxYTAxY2M3MGM4NmZkMGJiY2QwNTAyODQ1YmYzMjM4ZDE3OTcyOTk1NzAxMjNiMDUyOSZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QifQ.QnDUfgPVkiRV0eDD7u9O0DwnIyy13YotlofeuwnBLqo)

And go back to Notion main entry page, we will see the following sub-pages are created:

![image](https://private-user-images.githubusercontent.com/1088543/345348714-e6aea636-1a26-4d53-843f-a842c9100074.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTk3NjkyMDQsIm5iZiI6MTc1OTc2ODkwNCwicGF0aCI6Ii8xMDg4NTQzLzM0NTM0ODcxNC1lNmFlYTYzNi0xYTI2LTRkNTMtODQzZi1hODQyYzkxMDAwNzQucG5nP1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI1MTAwNiUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNTEwMDZUMTY0MTQ0WiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9NzUzOTYyYTIwZDI5NzJmYjkxNWNhMjRhZWEwM2EyYjhhYjZlM2NlMWEzN2Y4YzM4Y2UyNDY2NWFlZTIxNWUyYSZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QifQ.wOFqMCfOlZ-DvGP8IQUjatGw6VfGIyKmMKVb5dzx3os)

## Post Setup

- [Setup RSS/Reddit list](https://github.com/finaldie/auto-news/wiki/Docker-Installation#ui-set-up-notion-tweetrssreddit-list)
- [Setup Notion Database Views](https://github.com/finaldie/auto-news/wiki/Docker-Installation#ui-set-up-notion-database-views)

Open the `ToRead` page, Enjoy and have fun:)

##### Clone this wiki locally

set 限制解除

# 高亮内容

- Loading
	[Home](https://github.com/finaldie/auto-news/wiki)
	- [Auto-News Documentation](https://github.com/finaldie/auto-news/wiki#auto-news-documentation)
	- [Intro Videos](https://github.com/finaldie/auto-news/wiki#intro-videos)
	- [Features](https://github.com/finaldie/auto-news/wiki#features)
	- [Architecture](https://github.com/finaldie/auto-news/wiki#architecture)
	- [Installation](https://github.com/finaldie/auto-news/wiki#installation)
	- [:star: :star: Managed Solution :star: :star: (Recommended :+1: :+1:)](https://github.com/finaldie/auto-news/wiki#star-star-managed-solution-star-star-recommended-1-1)
	- [Self-Hosted](https://github.com/finaldie/auto-news/wiki#self-hosted)
	- [Backend System Requirements](https://github.com/finaldie/auto-news/wiki#backend-system-requirements)
	- [Docker-based](https://github.com/finaldie/auto-news/wiki#docker-based)
	- [Kubernetes](https://github.com/finaldie/auto-news/wiki#kubernetes)

- Loading
	[Auto generated TODO List](https://github.com/finaldie/auto-news/wiki/Auto-generated-TODO-List)

- Loading
	[Content Aggregation](https://github.com/finaldie/auto-news/wiki/Content-Aggregation)
	- [Screenshot](https://github.com/finaldie/auto-news/wiki/Content-Aggregation#screenshot)

- Loading
	[Content Filtering](https://github.com/finaldie/auto-news/wiki/Content-Filtering)
	- [Reddit Filtering Threshold](https://github.com/finaldie/auto-news/wiki/Content-Filtering#reddit-filtering-threshold)
	- [Twitter Filtering Threshold (Requires Paid Account)](https://github.com/finaldie/auto-news/wiki/Content-Filtering#twitter-filtering-threshold-requires-paid-account)

- Loading
	[Customized RSS Reddit List](https://github.com/finaldie/auto-news/wiki/Customized-RSS-Reddit-List)
	- [RSS List](https://github.com/finaldie/auto-news/wiki/Customized-RSS-Reddit-List#rss-list)
	- [Reddit List](https://github.com/finaldie/auto-news/wiki/Customized-RSS-Reddit-List#reddit-list)
	- [Tweets List](https://github.com/finaldie/auto-news/wiki/Customized-RSS-Reddit-List#tweets-list)

- Loading
	[Deepdive (Experimental)](https://github.com/finaldie/auto-news/wiki/Deepdive-\(Experimental\))
	- [What's Deepdive?](https://github.com/finaldie/auto-news/wiki/Deepdive-\(Experimental\)#whats-deepdive)
	- [Step to enable the DeepDive feature](https://github.com/finaldie/auto-news/wiki/Deepdive-\(Experimental\)#step-to-enable-the-deepdive-feature)

- Loading
	[Docker Installation](https://github.com/finaldie/auto-news/wiki/Docker-Installation)
	- [Preparison](https://github.com/finaldie/auto-news/wiki/Docker-Installation#preparison)
	- [\[UI\] Create Notion Entry Page](https://github.com/finaldie/auto-news/wiki/Docker-Installation#ui-create-notion-entry-page)
	- [\[Backend\] Create Environment File](https://github.com/finaldie/auto-news/wiki/Docker-Installation#backend-create-environment-file)
	- [\[Backend\] Deploy Services](https://github.com/finaldie/auto-news/wiki/Docker-Installation#backend-deploy-services)
	- [\[Backend\] Start Services](https://github.com/finaldie/auto-news/wiki/Docker-Installation#backend-start-services)
	- [\[UI\] Set up Notion Tweet/RSS/Reddit list](https://github.com/finaldie/auto-news/wiki/Docker-Installation#ui-set-up-notion-tweetrssreddit-list)
	- [\[UI\] Set up Notion database views](https://github.com/finaldie/auto-news/wiki/Docker-Installation#ui-set-up-notion-database-views)
	- [Operations](https://github.com/finaldie/auto-news/wiki/Docker-Installation#operations)
	- [\[Monitoring\] Control Panel](https://github.com/finaldie/auto-news/wiki/Docker-Installation#monitoring-control-panel)
	- [Stop/Restart Services](https://github.com/finaldie/auto-news/wiki/Docker-Installation#stoprestart-services)
	- [Redeploy .env and DAGs](https://github.com/finaldie/auto-news/wiki/Docker-Installation#redeploy-env-and-dags)
	- [Upgrade to the latest code](https://github.com/finaldie/auto-news/wiki/Docker-Installation#upgrade-to-the-latest-code)
	- [Rebuild Docker Images](https://github.com/finaldie/auto-news/wiki/Docker-Installation#rebuild-docker-images)

- Loading
	[High level Overview](https://github.com/finaldie/auto-news/wiki/High-level-Overview)
	- [High-Level Architecture](https://github.com/finaldie/auto-news/wiki/High-level-Overview#high-level-architecture)

- Loading
	[Installation using Portainer](https://github.com/finaldie/auto-news/wiki/Installation-using-Portainer)
	- [Preparison](https://github.com/finaldie/auto-news/wiki/Installation-using-Portainer#preparison)
	- [Create Notion Entry Page](https://github.com/finaldie/auto-news/wiki/Installation-using-Portainer#create-notion-entry-page)
	- [Create Environment File](https://github.com/finaldie/auto-news/wiki/Installation-using-Portainer#create-environment-file)
	- [Install as Portainer Stack](https://github.com/finaldie/auto-news/wiki/Installation-using-Portainer#install-as-portainer-stack)
	- [Post Setup](https://github.com/finaldie/auto-news/wiki/Installation-using-Portainer#post-setup)

- Loading
	[Journal](https://github.com/finaldie/auto-news/wiki/Journal)
	- [How-To](https://github.com/finaldie/auto-news/wiki/Journal#how-to)
	- [Create iOS Shortcut "Take notes"](https://github.com/finaldie/auto-news/wiki/Journal#create-ios-shortcut-take-notes)
	- [References](https://github.com/finaldie/auto-news/wiki/Journal#references)