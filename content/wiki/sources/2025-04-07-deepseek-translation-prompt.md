---
tags: [AI翻译, DeepSeek, Prompt Engineering]
created: 2025-04-07
updated: 2025-04-07
sources: []
---
# DeepSeek-V3 沉浸式翻译 Prompt 优化

> 针对 DeepSeek-V3-0324 优化的翻译 Prompt，在保持翻译质量的同时大幅减少 Token 消耗。

## 核心观点
- 简洁的中文 System Prompt 对 DeepSeek-V3 的翻译效果优于英文 Prompt
- 核心翻译要求：符合母语者表达习惯、灵活转换语气、地道表达优先、意译而非直译
- 需要在 Prompt 中重复强调"仅输出译文"以防止模型添加无关说明或注释
- 将翻译要求放入 System Prompt 而其他部分改为英文可以有效节约 Token

## 关键概念
- [[沉浸式翻译]] — 浏览器翻译插件，支持双语对照显示网页内容
- [[DeepSeek-V3]] — DeepSeek 的通用大语言模型，翻译效果良好且成本低
- [[Prompt Token 优化]] — 通过精简指令和语言选择减少每次请求的 Token 消耗
