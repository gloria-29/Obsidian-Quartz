---
tags: [Claude Skill, AI工具, 函数调用, MCP, Claude Code, Agent]
created: 2026-01-11
updated: 2026-06-13
sources:
  - https://x.com/wshuyi/status/2009451186039214388
---

# Claude Skills 入门：AI 从嘴替到打工人

## 概要

王树义(@wshuyi)从编程函数到LLM函数调用再到[[Claude Code]] Skills的三层台阶视角，系统讲解Claude Skills的概念、架构与实战应用。Skills是Anthropic于2025年10月发布的[[AI工具与应用-扩展]]标准，将零散的工具调用整合为完整的工作流级蓝图，让领域专家无需编程也能"教"AI执行复杂任务。

## 核心内容

### 三层台阶模型

1. **编程函数**（代码级）：封装、重用、标准化的基础逻辑单元，只活在代码世界
2. **LLM函数调用**（接口级）：给AI配"电话和通讯录"，让AI自主判断何时调用哪个工具——从知识库变成行动者
3. **Claude Skills**（工作流级）：把工具和指令整合成完整解决方案，像"员工手册+工具箱"

### Skills架构

- **SKILL.md**：自然语言指令文件，告诉AI何时用、怎么用、注意事项
- **脚本**：Python/JS等代码，AI需要"动手"时执行
- **资源文件**：参考文档、模板、配置
- 核心区别：函数调用是"单个工具"，Skills是"整套解决方案"

### 渐进式披露机制

AI的工作记忆（上下文窗口）有限，Skills的做法是平时只告诉AI"有这本说明书"，用到时再加载。类似按需查阅百科全书而非全部背诵。

### 实战案例

- **x-article-publisher-skill**：Markdown文章自动发布到X Articles，保留格式+精准插入图片，20-30分钟手动操作全自动完成
- **skill-creator**：元技能，用来创建Skill的Skill——"知识编码"的核心
- **会议管理/数据分析/客户支持**：重复性高、步骤固定、需判断力的任务
- **红楼梦人物关系图/战国七雄互动图**：结构化知识可视化

### 生态发展

- Anthropic将Agent Skills作为开放标准发布，与MCP走同样的开放生态路线
- Plugin Marketplace正式上线（2026年1月8日更新）
- 非程序员也可通过清晰定义工作流创建强大的可复用Skills

## 关键概念

- [[Claude Code]] — Anthropic的CLI开发工具，Skills的核心运行环境
- [[Claude Skill]] — AI工作流封装标准，SKILL.md + 脚本 + 资源文件的组合
- [[MCP]] — Model Context Protocol，AI-工具连接标准，Skills可包含MCP工具调用
- [[函数调用]] — LLM根据意图自动选择和调用外部工具的能力
- [[渐进式披露]] — 按需加载Skill内容以优化上下文窗口使用

## 关联实体

- [[王树义]] — 教育技术专家，AI工具实践者
- [[Claude Code]] — Skills的运行平台
- [[个人AI基础设施]] — Skills作为AI能力封装的核心机制

## 相关页面

- [[Claude Code]]
- [[AI工具与应用-扩展]]
- [[个人AI基础设施]]
- [[AI提示词工程]]
