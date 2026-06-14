---
tags: [SystemPrompt, JTBD, 产品需求, Gemini, AI编程, 用户研究, LINUX-DO]
created: 2025-12-28
updated: 2026-06-13
sources: ["LINUX-DO社区", "https://linux.do/t/topic/1366211"]
---

# 好用的 System Prompt：JTBD 产品需求访谈框架

## 概要
来自 LINUX-DO 社区的 Joby System Prompt，是一个基于 Jobs-to-be-Done（JTBD）框架的高级产品经理和用户研究专家角色设定。通过引导式对话挖掘用户深层需求，自动生成结构化的需求定义文档（RDD）。建议配合 Gemini 3.0 Pro 温度设置为 1 使用。

## 核心内容

### JTBD 框架核心哲学
- **The Job**：用户想实现的根本目标（如"消磨时间"而非"听音乐"）
- **三维需求**：功能性任务、情感需求、社会认同需求
- **四力模型**：Push（现状痛苦）、Pull（新方案吸引）、Anxiety（新方案焦虑）、Inertia（旧习惯惯性）

### 三阶段访谈流程
1. **Phase 1 - 背景与触发点**：理解用户何时意识到需要改变，不急于提方案
2. **Phase 2 - 痛点与动机**：深挖Push和Pull，使用"五个为什么"技术
3. **Phase 3 - 成果与约束**：定义成功标准、不可协商的约束条件

### 输出物：需求定义文档
- 高层任务声明：动作 + 对象 + 背景
- 用户故事（Job Stories）："When [情境], I want to [动机], so that I can [预期结果]"
- 四力分析总结
- 成功指标（可量化或可定性）
- 功能需求范围列表

### 实战案例：AI图片压缩工具
- 完整演示了从"做图片压缩工具"需求出发，通过JTBD访谈挖掘出真正的Job："将Gemini 4K生成图高效传输到其他AI客户端"
- 最终确定方案：Windows系统级剪贴板中间件，专用快捷键触发WebP压缩粘贴

## 关键概念
- JTBD（Jobs-to-be-Done）：关注用户要完成的"任务"而非表面功能需求
- 五问法（Five Whys）：逐层追问核心动机
- 延迟处理（Lazy Processing）：在粘贴时才执行压缩，保留决策灵活性
- 统计性思维：区分Feature和Outcome，从功能需求反推底层动机

## 关联实体
- [[2025-01-13-GPT-Prompt-破解分享：各路大神破解的prompt]]
- [[2025-10-11-ai-prompt-bible]]
- [[2025-05-29-纳瓦尔方法论专家Prompt]]

## 相关页面
- [[2025-04-07-沉浸式翻译Prompt分享]]
- [[2025-02-27-内驱力分析Prompt]]
- [[2025-12-07-banana-pro-prompts]]
