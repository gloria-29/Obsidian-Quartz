---
tags: [note-taking, knowledge-management, obsidian, markdown, ide, plugin-ecosystem]
created: 2026-05-18
updated: 2026-05-19
type: entity
sources:
  - raw/articles/2026-05-18-20251109-obsidian-to-notionnext-batch-plugin.md
  - raw/articles/2026-05-18-20260430-i-built-a-knowledge-base-that-writes-itself-here-is.md
---

# Obsidian

## 概述

Obsidian 是一款强大的本地知识管理工具，以 Markdown 文件为核心，支持双向链接、图谱视图和丰富的插件生态系统。它是本知识库（[[LLM Wiki]]）的主要编辑和浏览工具。

## 核心特性

| 特性 | 说明 |
|------|------|
| **本地优先** | 所有数据存储在本地文件系统 |
| **Markdown** | 纯文本 Markdown 格式 |
| **双向链接** | [[wikilinks]] 语法创建知识网络 |
| **图谱视图** | 可视化笔记之间的关系 |
| **插件生态** | 500+ 社区插件 |
| **跨平台** | Windows, macOS, Linux, 移动端 |

## 插件生态

### 核心插件
- **Graph View**: 知识网络可视化
- **Backlinks**: 反向链接面板
- **Daily Notes**: 每日笔记
- **Templates**: 模板系统
- **Search**: 全局搜索

### 社区插件（推荐）
| 插件 | 用途 |
|------|------|
| **Dataview** | 数据查询和表格生成 |
| **Templater** | 高级模板系统 |
| **Calendar** | 日历视图 |
| **Kanban** | 看板视图 |
| **Excalidraw** | 手绘图 |
| **Notebook Navigator** | 笔记导航 |
| **obsidian-to-notionnext** | 批量发布到 Notion |

### obsidian-to-notionnext 插件
根据源文献，该插件可以：
- 批量将 Obsidian 笔记发布到 Notion
- 支持自定义模板和样式
- 保持 Markdown 格式和链接
- 适合博客和知识库发布

## 与 LLM Wiki 的集成

Obsidian 是 [[LLM Wiki]] 的理想编辑器：

### 配置建议
1. **附件目录**: 设置为 `raw/assets/`
2. **链接格式**: 使用 Wikilinks（默认）
3. **插件**: 安装 Dataview 用于查询
4. **主题**: 选择支持 Markdown 的主题

### Dataview 查询示例
```dataview
TABLE tags, updated
FROM "entities"
WHERE contains(tags, "ai-tool")
SORT updated DESC
```

## 工作流程

```
Obsidian 编辑器
    ↓ 编辑 Markdown 文件
本地文件系统 (~/wiki/)
    ↓ Git 同步
远程仓库 (GitHub/GitLab)
    ↓ 其他设备拉取
多设备同步
```

## 与其他工具的对比

| 维度 | Obsidian | Notion | [[NotebookLM]] |
|------|----------|--------|----------------|
| **数据存储** | 本地 | 云端 | 云端 |
| **格式** | Markdown | 专有 | 专有 |
| **AI 功能** | 插件 | 内置 | 内置 |
| **价格** | 免费/付费 | 免费/付费 | 免费 |
| **隐私** | 高 | 中 | 中 |

## 使用技巧

### 1. 快速创建链接
- 输入 `[[` 触发链接建议
- 使用 `[[页面名|显示文本]]` 自定义显示

### 2. 图谱视图优化
- 调整节点大小和颜色
- 使用筛选器聚焦特定主题
- 保存常用视图

### 3. 模板系统
- 创建常用模板（日记、会议、项目）
- 使用 Templater 插件自动化
- 快捷键快速插入

## 局限性

- 学习曲线较陡
- 移动端体验一般
- 协作功能有限
- 需要手动同步（或使用 Git）

## 相关页面

- [[LLM Wiki]] — 知识库构建方法论
- [[NotebookLM]] — AI 研究助手
- [[知识库构建方法论]] — 最佳实践
- [[个人AI基础设施]] — Obsidian 在 AI 栈中的位置
