# 操作日志

> 记录知识库的所有变更历史

---

## 2026-05-17 — 初始化

- **操作**：创建知识库
- **主题**：llmwiki
- **状态**：完成

## 2026-05-18 ingest | Clippings 批量重消化

- **来源路径**：`C:\\Users\\Administrator\\Documents\\OB\\Clippings`
- **扫描到可处理文件**：79
- **通过 create-source-page.sh 成功处理**：79
- **失败**：0
- **raw/articles 当前文件数**：79
- **wiki/sources 当前文件数**：79
- **状态**：完成
- **备注**：已确认本轮缓存更新链路可用（`python3` 已可在批处理流程中调用）

## 2026-05-28 batch-ingest | WuCai + Readwise + Cubox 批量消化

- **来源**：`C:\Users\Administrator\Documents\OB\WuCai`（130个）、`Readwise`（34个）、`Cubox`（600+个）
- **处理方式**：逐文件精处理（read→raw→source），实体页和主题页批量创建
- **新增raw文件**：~700+（WuCai 100 + Readwise 30 + Cubox ~570）
- **新增source页面**：~107（含月度/季度合集页）
- **新增实体页**：13个（Susan-Albers、LINUX-DO、少数派、James-Clear、Derek-Sivers 等）
- **新增主题页**：10个（减重心理学、社交人际关系、独立开发营销、播客内容消费、免费学习资源、AI提示词工程、生活管理SOP 等）
- **更新主题页**：5个（AI绘画、知识管理、减重健康、AI翻译、个人成长）
- **状态**：第一批100完成，剩余约560个Cubox文件待继续处理
- **备注**：子代理因权限问题未能并行执行，改为主进程逐文件处理

- **操作**：从 79 篇素材中提取核心实体和主题，创建完整 wiki 骨架
- **新增实体页 (16个)**：
  - AI/智能体：GenericAgent、MCP Gateway、PAI、Claude Code、Codex、NotebookLM
  - 模型/协议：DeepSeek V4、MCP
  - 工具/平台：Obsidian、Cloudflare
  - 健康/减重：Thin Within、Huberman Lab、The Daniel Plan、GLP-1
  - 人物：Tim Ferriss、Ali Abdaal
- **新增主题页 (8个)**：
  - AI Agent框架、AI记忆方案、MCP协议与工具生态系统
  - 个人AI基础设施、知识库构建方法论
  - 基督教信仰减重方法、科学健康优化、GLP-1与药物减重
- **新增图谱页**：wiki/knowledge-graph.md（Mermaid 知识图谱）
- **更新**：index.md（完整索引）、wiki/overview.md（知识地图）
- **更新**：.wiki-schema.md（添加 Tag 分类法）
- **交叉引用**：所有页面间通过 [[wikilinks]] 建立关联
- **状态**：完成

## 2026-05-19 digest | 实体页深度充实 (第一批)

- **操作**：充实 8 个骨架实体页，从 30-40 行扩充至 100-260+ 行
- **充实的实体页**：
  - PAI (264行) — 添加 Pulse 守护进程、Algorithm 7 阶段、Memory 三级系统、Skills 生态
  - GenericAgent (112行) — 添加 API 频道配置、Mixin 容灾、Hub 服务架构
  - DeepSeek V4 (51行) — 添加 V4-pro/flash 对比、1M 上下文、整本书消化
  - Tim Ferriss (216行) — 添加播客主题、著作、减重经历
  - Ali Abdaal (267行) — 添加 YouTube 频道、生产力方法论
  - Thin Within (189行) — 添加 7 个原则、恩典减重方法
  - Huberman Lab (155行) — 添加播客内容、健康优化方法
  - Gordon MacDonald (144行) — 添加著作、Ordering Your Private Life
- **新创建的实体页**：
  - Coach Viva 懒人减肥法 (119行)
  - GLP-1 Girl (125行)
  - Dan Koe (120行) — 20位类似博主推荐
  - ChatPlus、OpenClaw、Mem0、Letta、Nocturne Memory
  - 伴读Agent、SurfSense、Hermes Agent、MTGA、Trae
- **状态**：完成

## 2026-05-19 digest | 实体页深度充实 (第二批)

- **操作**：继续充实剩余骨架页面，创建新实体页面
- **充实的骨架页面**：
  - MCP (扩充至 80+ 行) — 添加传输模式、工具发现、服务器类型
  - MCP Gateway (扩充至 70+ 行) — 添加架构、配置、Web UI
  - Claude Code (扩充至 80+ 行) — 添加 Hook 系统、上下文管理、MCP 集成
  - Codex (扩充至 80+ 行) — 添加 Prompt Lab、免费注册方法
  - NotebookLM (扩充至 80+ 行) — 添加使用模式、工作流程
  - Obsidian (扩充至 80+ 行) — 添加插件生态、LLM Wiki 集成
  - Cloudflare (扩充至 80+ 行) — 添加免费节点、临时邮箱、Workers
- **新建实体页面**：
  - 纸托邦 (Paper Republic) — 中国文学国际传播平台
  - Buzzing — 国外社交媒体中文聚合平台
  - anx-calibre-manager — 电子书库管理 Web 应用
  - 手机搭建服务器 — IPv6 手机服务器教程
  - Gemini 3 Pro Prompts — 多模态 AI 提示词集合
  - AI书籍知识图谱 — AI 驱动的书籍知识图谱制作
  - Codex Free注册 — 免费使用 Codex 的方法
  - 纯文本生活组织法 — .txt 文件组织生活
  - Scott Adams (呆伯特) — 职场漫画创作者
  - 博客写作指南 — 为什么你应该开始写博客
  - Gemini MCP 桥接 — Gemini 连接外部 MCP
  - Nano Banana Pro — AI 图像生成提示词
  - 即梦 (Jimeng) AI图像生成 — 字节跳动 AI 图像工具
  - obsidian-to-notionnext — Obsidian 批量发布插件
- **更新**：index.md（完整索引，43 个实体页）
- **更新**：log.md（本条记录）
- **状态**：完成

## 2026-05-28 batch-ingest | Dinox Sync 全量消化

- **来源路径**：`C:\Users\Administrator\Documents\OB\Dinox Sync`（material/ + note/）
- **扫描到可处理文件**：755（754 .md + 1 无扩展名）
- **成功处理**：754
- **新增 source pages**：~520+（部分与已有 Clippings 素材重名）
- **新增实体页 (30个)**：
  - 效率方法论：Cal Newport、BJ Fogg、Morgan Housel、David Allen、Jake Knapp、John Zeratsky、Carol Dweck、Tiago Forte
  - 概念/方法：Deep Work、微习惯、Fogg行为模型、Make Time、行动科学管理术、间隔重复、80/20法则、元认知、恐惧设定、5+2轻断食、正念饮食
  - 工具：Deep Research、Crawl4AI、n8n、讯飞有声、Flux.1 Kontext、Abogen、沉浸式翻译、口服司美格鲁肽、替尔泊肽、OMAD、间歇性禁食
- **新增主题页 (9个)**：
  - 效率与自我管理（46篇素材）
  - AI工具与应用-扩展（124篇素材）
  - 减重饮食与健康-扩展（88篇素材）
  - 阅读与书评（43篇素材）
  - 播客与媒体内容（25篇素材）
  - 技术与服务器部署（26篇素材）
  - Prompt与提示词工程（18篇素材）
  - 心理与情感（21篇素材）
  - 教育与学习（23篇素材）
- **更新**：index.md（完整索引，82 实体页、17 主题页、901 素材摘要）
- **状态**：完成

## 2026-05-28 digest | 缺失实体页批量创建

- **操作**：创建 10 个缺失的实体页面
- **新增实体页 (10个)**：
  - 人物：Alexey-Guzey（博客写作者）、Huberman（Andrew Huberman，斯坦福神经科学家）
  - 模型：Grok（xAI 模型，X 平台深度集成）
  - 工具：Elog（跨平台博客同步）、Lovart（AI 设计平台）、Youware（Vibe Coding 平台）、CodeBuddy（腾讯 AI CLI）、iFlow-CLI（终端 AI 编程助手）、五彩笔记（WuCai 笔记工具）
  - 功能：Grok-Tasks（Grok 定时自动化任务）
- **更新**：index.md（实体页 82→92）
- **状态**：完成
- **备注**：Task A（Readwise 剩余文件处理）因 OB 目录权限限制无法访问，需用户手动授权或复制文件到可访问目录
