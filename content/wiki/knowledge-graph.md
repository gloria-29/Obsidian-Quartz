---
tags: [knowledge-base, overview]
created: 2026-05-18
updated: 2026-05-28
type: summary
---

# 知识图谱

> 文档 last generated: 2026-05-28 | 共 123 个实体，44 个主题，1046 篇素材

## 核心关系图

```mermaid
graph LR
  %% ─── AI Agent 核心 ───
  PAI[PAI 个人AI基础设施] -->|构建于| Claude_Code[Claude Code]
  Claude_Code -->|支持| MCP[MCP 协议]
  MCP -->|网关| MCP_Gateway[MCP Gateway]
  GenericAgent[GenericAgent] -->|集成| MCP
  OpenClaw[OpenClaw] -->|集成| MCP
  Hermes_Agent[Hermes Agent] -->|集成| MCP
  Hermes_Agent -->|实现| Nocturne[Nocturne Memory]
  Letta[Letta] -.->|对比| Mem0[Mem0]
  Letta -->|属于| AI记忆方案
  Mem0 -->|属于| AI记忆方案
  AI记忆方案 -.->|支撑| AI_Agent框架[AI Agent 框架]
  AI_Agent框架 -->|使用| MCP

  %% ─── AI 工具与编程 ───
  DeepSeek[DeepSeek] -->|属于| AI工具扩展[AI 工具与应用]
  Deep_Research[Deep Research] -->|属于| AI工具扩展
  Crawl4AI[Crawl4AI] -->|属于| AI工具扩展
  Trae[Trae] -->|属于| AI编程工具[AI 编程与开发工具]
  CodeBuddy[CodeBuddy] -->|属于| AI编程工具
  iFlow[iFlow CLI] -->|属于| AI编程工具
  Youware[Youware] -->|属于| AI编程工具
  n8n[n8n] -->|属于| AI工具扩展
  AI工具扩展 -->|跨| AI编程工具

  %% ─── 知识管理 ───
  Obsidian[Obsidian] -->|属于| 知识管理[知识管理与笔记系统]
  NotebookLM[NotebookLM] -->|属于| 知识管理
  知识管理 -->|包含| 知识库构建[知识库构建方法论]
  Karpathy[Karpathy] -->|提出| 知识库构建
  沉浸式翻译[沉浸式翻译] -->|属于| 信息获取[信息获取与管理]

  %% ─── 效率方法论 ───
  Deep_Work[Deep Work] -->|属于| 效率[效率与自我管理]
  Cal_Newport[Cal Newport] -->|提出| Deep_Work
  BJ_Fogg[BJ Fogg] -->|提出| Fogg_Model[Fogg行为模型]
  Fogg_Model -->|衍生| 微习惯
  微习惯 -->|属于| 效率
  David_Allen[David Allen] -->|提出| GTD[GTD]
  Make_Time[Make Time] -->|属于| 效率
  James_Clear[James Clear] -->|提出| 原子习惯[原子习惯]
  原子习惯 -->|属于| 效率
  80_20[80/20法则] -->|属于| 效率

  %% ─── 创作者与商业 ───
  Ali_Abdaal[Ali Abdaal] -->|属于| 创作[写作与内容创作]
  Dan_Koe[Dan Koe] -->|属于| 一人公司[一人公司工具栈]
  Tim_Ferriss[Tim Ferriss] -->|属于| 播客[播客与媒体内容]
  播客 -->|跨| 创作
  博客写作[博客写作指南] -->|属于| 创作

  %% ─── 健康减重 ───
  GLP1[GLP-1 减重药物] -->|属于| 药物减重[GLP-1与药物减重]
  口服司美[口服司美格鲁肽] -->|属于| 药物减重
  替尔泊肽 -->|属于| 药物减重
  OMAD[OMAD] -->|属于| 饮食[减重饮食与健康]
  间歇性禁食 -->|属于| 饮食
  正念饮食 -->|属于| 饮食
  Thin_Within[Thin Within] -->|属于| 信仰减重[基督教信仰减重方法]
  Daniel_Plan[The Daniel Plan] -->|属于| 信仰减重
  Huberman_Lab[Huberman Lab] -->|属于| 科学健康[科学健康优化]
  药物减重 -.->|跨| 科学健康
  饮食 -.->|跨| 信仰减重

  %% ─── 主题间关联 ───
  AI记忆方案 -.->|支撑| 个人AI基础设施[个人AI基础设施]
  个人AI基础设施 -->|使用| AI_Agent框架
  MCP协议生态[MCP协议与工具生态系统] -->|包含| MCP
  AI编程工具 -.->|跨| AI工具扩展

  %% ─── Styling ───
  classDef entity fill:#4a90d9,stroke:#2c5f8a,color:#ffffff,stroke-width:2px;
  classDef topic fill:#2ecc71,stroke:#1a8a4a,color:#ffffff,stroke-width:2px;

  class PAI,Claude_Code,MCP,MCP_Gateway,GenericAgent,OpenClaw,Hermes_Agent,Nocturne,Letta,Mem0,DeepSeek,Deep_Research,Crawl4AI,Trae,CodeBuddy,iFlow,Youware,n8n,Obsidian,NotebookLM,Karpathy,沉浸式翻译,Deep_Work,Cal_Newport,BJ_Fogg,Fogg_Model,微习惯,David_Allen,Make_Time,James_Clear,80_20,Ali_Abdaal,Dan_Koe,Tim_Ferriss,博客写作,GLP1,口服司美,替尔泊肽,OMAD,间歇性禁食,正念饮食,Thin_Within,Daniel_Plan,Huberman_Lab entity;
  class AI记忆方案,AI_Agent框架,AI工具扩展,AI编程工具,知识管理,知识库构建,信息获取,效率,创作,一人公司,播客,药物减重,饮食,信仰减重,科学健康,个人AI基础设施,MCP协议生态 topic;
```

## 图例

| 节点颜色 | 类型 | 数量 |
|---------|------|:----:|
| 蓝色 | 实体（人物/工具/概念） | 123 |
| 绿色 | 主题（研究领域） | 44 |

| 箭头样式 | 含义 |
|---------|------|
| `-->` | 明确关系（提出、属于、构建于、集成、使用、包含） |
| `-.->` | 弱关联 / 跨领域联系 |

## 主要知识集群

### 1. AI Agent 核心（MCP 生态）
Claude Code ← PAI → MCP → MCP Gateway / GenericAgent / OpenClaw
记忆层：Letta ↔ Mem0 / Nocturne Memory → Hermes Agent

### 2. AI 工具与编程
DeepSeek / Deep Research / Crawl4AI / n8n → Trae / CodeBuddy / iFlow / Youware

### 3. 知识管理
Obsidian + NotebookLM ← Karpathy（知识库构建）→ 沉浸式翻译（信息获取）

### 4. 效率方法论
Deep Work（Cal Newport）→ 微习惯（BJ Fogg）→ GTD（David Allen）→ Make Time → 80/20 → 原子习惯（James Clear）

### 5. 创作者生态
Ali Abdaal / Dan Koe / Tim Ferriss → 博客写作 → 播客与媒体 → 一人公司

### 6. 健康减重
信仰减重（Thin Within / Daniel Plan）←→ 饮食方法（OMAD / 间歇性禁食 / 正念饮食）
药物减重（GLP-1 / 口服司美 / 替尔泊肽）←→ 科学健康（Huberman Lab）

---

> 查看方式：用 Typora、VS Code（Markdown Preview Enhanced）、Obsidian、或直接在 GitHub 上查看。
> 如需交互式图谱，运行 `/llm-wiki graph` 生成 `knowledge-graph.html`。
