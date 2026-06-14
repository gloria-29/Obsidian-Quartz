---
tags:
  - DeepSeek V4
  - DeepSeek
  - 大语言模型
  - 开源模型
  - AI编程
  - 性价比
  - OpenCode
created: "2026-05-02"
updated: "2026-06-13"
sources:
  - "https://www.reddit.com/r/opencodeCLI/comments/1szneiq/deepseek_v4_is_mindblowing/"
---

# DeepSeek V4 is Mindblowing

## 概要

Reddit 上 r/opencodeCLI 社区关于 [[DeepSeek V4]] 的热烈讨论帖。原帖作者 AngelicBread 以极低成本体验了 V4 Flash 和 Pro 版本后发出感叹——5 美分即可使用 4 小时高强度推理。社区围绕 V4 与 Kimi K2.6、GLM 5.1 的优劣展开了大量对比讨论，核心共识是 V4 的效率和定价打破了行业平衡。

## 核心内容

### 成本优势

- V4 Pro：约 0.5 美元/小时重度使用
- V4 Flash：约 0.05 美元/4 小时重度使用（含子代理循环）
- 社区实测：30M tokens 花费 0.30 美元；250M tokens/天花费约 2.5 美元
- 远低于同级别模型（GPT-4、Claude、Sonnet）的使用成本

### 模型效率

- KV 缓存占用内存远少于同类模型
- Token 生成所需 FLOP 更少
- 1M 上下文窗口，适合长上下文场景
- Pro 版用于规划，Flash 版用于构建，是社区推荐的组合用法

### 社区对比评价

- **Kimi K2.6**：被多位用户视为全能型选手，类 Sonnet 风格，代码能力强
- **GLM 5.1**：在推理场景中表现突出，但速度较慢
- **DeepSeek V4 Pro**：规划和长上下文优势明显，但代码可读性有争议，可能存在"欠训练"问题
- **DeepSeek V4 Flash**：性价比之王，被称为"比自来水还便宜"

### 使用建议

- 上下文超过 200k 时成本显著上升，建议使用短会话或频繁刷新
- 通过 DeepSeek 官方 API 获得最佳折扣
- 大代码库（>1M 行）场景下费用仍可控
- V4 在华为芯片上训练，引发关于芯片供应链的讨论

## 关键概念

- **KV 缓存优化**：DeepSeek V4 在注意力机制中优化了 KV 缓存的内存占用
- **OpenCode Go**：OpenCode 的订阅计划，提供模型折扣访问
- **子代理循环（Subagent Loops）**：AI 编程工具中代理委派子任务的模式，是 token 消耗的主要来源
- **上下文窗口成本**：LLM 的每次请求需要重新处理全部上下文，窗口越大成本越高

## 关联实体

- [[DeepSeek V4]] — 被讨论的核心模型
- [[DeepSeek]] — 模型开发公司
- [[Kimi K2.6]] — 社区对比对象
- [[GLM 5.1]] — 社区对比对象
- [[OpenCode]] — 使用平台

## 相关页面

- [[AI编程与开发工具]] — AI 编程工具生态
- [[AI工具与应用-扩展]] — AI 工具选择与应用
- [[Claude Code]] — 同类 AI 编程代理
