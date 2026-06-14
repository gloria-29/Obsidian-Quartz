---
tags: [大模型, 开源AI, MoE架构, 小米, 性价比]
created: 2025-12-17
updated: 2026-06-13
sources: [raw/articles/小米mimo-v2-flash开源模型.md]
---

# 小米 MiMo-V2-Flash 开源模型

## 概要

小米正式发布并开源 MiMo-V2-Flash 大模型，总参数 3090 亿、活跃参数 150 亿，采用 MoE 专家混合架构。性能媲美 DeepSeek-V3.2 和 Kimi-K2，推理速度达 150 tokens/秒，成本低至每百万 token 输入 0.1 美元、输出 0.3 美元，采用 MIT 开源协议，主打超绝性价比。

## 核心内容

### 模型架构
- 总参数 3090 亿，活跃参数仅 150 亿，MoE（Mixture of Experts）专家混合架构
- 推理速度 150 tokens/秒，兼顾性能与效率
- MIT 开源协议，完全开放商用

### 定价与性价比
- 输入成本：每百万 token 0.1 美元
- 输出成本：每百万 token 0.3 美元
- 性能对标 DeepSeek-V3.2 和 Kimi-K2，价格极具竞争力

### 行业意义
- 小米从手机硬件厂商正式进入大模型领域，主打"性价比"策略延续到 AI
- 开源策略降低中小企业和开发者使用门槛

## 关键概念

- **MoE 架构** — Mixture of Experts，通过稀疏激活实现大参数量与低推理成本的平衡
- **MIT 协议** — 最宽松的开源协议之一，允许商用和修改

## 关联实体

- [[DeepSeek-V3.2]] — 性能对标对象
- [[小米]] — 模型发布方

## 相关页面

- [[DeepseekMine知识库对话记录]] — DeepSeek 相关应用实践
- [[AI API Gateway]] — 多模型 API 网关，可接入各类开源模型
