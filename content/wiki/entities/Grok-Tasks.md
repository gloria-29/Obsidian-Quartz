---
type: entity
aliases: [Grok Tasks, tasks.grok.com]
tags: [automation, information-retrieval, xai, scheduling]
created: 2026-05-28
updated: 2026-05-28
sources:
  - raw/notes/2025-12-25-Grok+X-超能力合集.md
---

# Grok Tasks

> Grok 的定时自动化任务功能，在 tasks.grok.com 创建定时任务，自动执行 X 查询并推送结果摘要。

## 核心特点

- 在 tasks.grok.com 创建定时任务，支持每天/每周自动执行
- 自动运行 X 查询并将结果摘要推送到邮箱或通知
- 实现"躺着看热点"——被动获取信息而非主动翻找
- 典型用例：每日早上8点自动收到"昨天 AI 领域最大进展"精选摘要
- 支持语义搜索 + 互动量筛选的组合查询

## 典型使用场景

| 场景 | 任务配置 |
|------|---------|
| AI 领域每日动态 | 每日语义搜索"AI 最新突破或论文"，min_score_threshold:0.3 |
| 信息猎手模式 | 批量筛选指定账号过去24小时互动量最高的50个帖子 |
| 行业监控 | 按关键词+时间+点赞门槛自动汇总 |

## 相关素材

- [[wiki/sources/readwise-tweets-batch0|Readwise推特合集0]] — 李志的 Grok Tasks 用法

## 相关页面

- [[Grok]]
