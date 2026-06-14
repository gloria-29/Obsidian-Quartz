---
tags: [ChatGPT, o3, 系统提示词, OpenAI, 提示词工程]
created: 2025-06-07
updated: 2026-06-13
sources: [raw/notes/2025-06-07-ChatGPT-o3模型系统提示词.md]
---

# ChatGPT o3 模型系统提示词分析

## 概要

云中江树对 ChatGPT o3 模型近 3 万字系统提示词的完整分析。o3 的提示词像一本细致的技术手册，用 MUST/NEVER 明确约束每个行为，将工具分为分析和用户可见两类，采用 analysis/commentary/final 三通道架构，展现出从"生成文本"向"行动和推理"的设计思路转变。

## 核心内容

### 架构设计
- **三通道架构**：analysis（私有推理）、commentary（用户可见工具调用）、final（最终回复）
- **工具分流**：python 用于内部推演，python_user_visible 用于用户可见输出
- **Juice: 128** 等隐藏参数背后藏着性能调控逻辑

### 关键工具
- **web 工具**：支持 search_query、image_query、finance、weather、sports 等多种命令
- **file_search**：支持对用户上传文件的多查询搜索
- **canmore**：画布工具，创建和更新文本文档
- **image_gen**：图像生成和编辑
- **automations**：定时任务自动化

### 设计哲学
- MUST 和 NEVER 指令为每个行为设定明确约束
- cite 语法支持文本结构化和引用，像工程师的小暗号
- 联网和引用的强制要求，用工程化方法减少模型不确定性
- 过度冗长惩罚系数 3.0，控制输出长度

## 关键概念

- **三通道架构** — analysis/commentary/final，分离推理、工具调用和最终回复
- **系统提示词** — 定义 AI 行为的底层指令，近 3 万字规模
- **过度冗长惩罚** — Penalty for oververbosity，系数 3.0 控制输出简洁度

## 关联实体

- [[OpenAI]] — ChatGPT o3 的开发公司
- [[o3]] — OpenAI 推理模型系列，区别于 GPT 系列

## 相关页面

- [[AI API Gateway]] — o3 可通过 API 网关接入
- [[I Built a Knowledge Base That Writes Itself]] — LLM 的另一应用模式：知识编译而非问答
