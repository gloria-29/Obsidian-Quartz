---
tags: [AI翻译, DeepSeek, Prompt Engineering, 沉浸式翻译, Token优化]
created: 2025-04-07
updated: 2026-06-13
sources:
  - type: article
    title: DeepSeek沉浸式翻译Prompt
    path: raw/articles/2025-04-07-deepseek翻译prompt.md
  - type: article
    title: DeepSeek沉浸式翻译Prompt（来源2）
    path: raw/articles/2025-04-07-deepseek翻译prompt2.md
  - type: article
    title: DeepSeek沉浸式翻译Prompt（来源3）
    path: raw/articles/2025-04-07-deepseek翻译prompt3.md
---

# DeepSeek-V3 沉浸式翻译 Prompt 优化

## 概要

针对 DeepSeek-V3-0324 优化的翻译 Prompt，来自 LINUX DO 社区大佬的提示词改进方案。在保持翻译质量的同时大幅减少 Token 消耗，核心策略是将翻译要求放入中文 System Prompt、其余部分改为英文。

## 核心内容

### 翻译策略

- 简洁的中文 System Prompt 对 DeepSeek-V3 的翻译效果优于英文 Prompt
- 核心翻译要求：符合母语者表达习惯、灵活转换语气、地道表达优先、意译而非直译
- 需要在 Prompt 中重复强调"仅输出译文"以防止模型添加无关说明或注释

### Token 优化方法

- 将翻译要求放入 System Prompt 而其他部分改为英文可以有效节约 Token
- 适用于沉浸式翻译浏览器插件的自定义 Prompt 配置
- 来源为 LINUX DO 社区，经过多人实践验证效果

### 应用场景

- 配合沉浸式翻译浏览器插件使用
- 网页双语对照浏览
- 需要高质量 AI 翻译的日常阅读场景

## 关键概念

- **沉浸式翻译**：浏览器翻译插件，支持双语对照显示网页内容
- **DeepSeek-V3**：DeepSeek 的通用大语言模型，翻译效果良好且成本低
- **Prompt Token 优化**：通过精简指令和语言选择减少每次请求的 Token 消耗

## 关联实体

- [[DeepSeek]]
- [[沉浸式翻译]]
- [[Prompt Engineering]]

## 相关页面

- [[DeepSeek-R1清单]]
- [[DeepSeek资源合集]]
- [[AI翻译与本地化]]
