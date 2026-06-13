# AI Agent Memory解决方案
*Created: 04/28/2026, 12:08 PM*
*Export Time: 04/28/2026, 12:30 PM*

---

## 1. User

有效可靠且开源，并且自己搭建上手没有那么困难的AI Agent Memory解决方案，有哪些项目推荐？请你从多个维度综合评分，列出前20个项目。并详解推荐原因、简述每个方案的最简self-hosting实现方法。

---

## 2. AI

我会优先筛选真正可用于 Agent Memory 的开源自托管方案，并从能力、成熟度、可靠性、生态集成和上手难度综合评分；同时核对官方文档/GitHub，避免混入过期、停更或仅 SaaS 的项目。

---

## 3. AI

我会把候选明确分成成品记忆层、带记忆的 Agent 框架/平台、记忆基础设施三类；其中向量库/RAG 库会标注为底座而非完整 Memory。Zep CE 因官方已 deprecated 会降级，不再作为优先推荐；初步重点看 Mem0、Hindsight、Letta、LangMem/LangGraph、Graphiti/Cognee。

---

## 4. AI

下面这份榜单按 **“能真正给 Agent 做记忆 + 开源/可控 + 自托管不折腾”** 来排，不是单纯按 GitHub stars。  
截至 **2026-04-28**，我的结论是：

**最快上手：Mem0、Letta、MCP Memory Server。**  
**工程化/生产可控：LangGraph + LangMem、LlamaIndex、Haystack。**  
**图谱型长期记忆：Graphiti、Cognee、Neo4j Agent Memory。**  
**低代码/平台型：Dify、RAGFlow。**  
**只做底座但可靠：Qdrant、Chroma、pgvector。**

---

## 评分方法

我按 100 分制打分，权重如下：

| 维度 | 权重 | 看什么 |
|---|---:|---|
| Memory 完整度 | 30 | 是否支持长期记忆、用户偏好、事实抽取、更新/删除、上下文召回，而不只是“向量搜索” |
| 成熟度/可靠性 | 20 | 维护活跃度、文档、工程边界、生产可用性 |
| 自托管易用性 | 20 | Docker / pip / npm 是否能快速跑起来，依赖是否复杂 |
| 开源/可控性 | 10 | 代码开放、许可证、是否能掌控数据 |
| Agent 生态集成 | 10 | 是否容易接 LangChain/LangGraph、LlamaIndex、MCP、CrewAI、AutoGen 等 |
| 生产运维 | 10 | 持久化、权限、隔离、多用户、可观测、备份等 |

> 一个重要取舍：**Qdrant / Chroma / pgvector 这种是“记忆底座”，不是完整 Agent Memory。** 它们非常可靠，但需要你自己写“何时写入、如何抽取、如何遗忘、如何合并冲突、如何检索注入上下文”的逻辑，所以在主榜里分数不会超过专用 memory layer。

---

## 前 20 名总览

| 排名 | 项目 | 类型 | 总分 | 适合场景 |
|---:|---|---|---:|---|
| 1 | **Mem0** | 专用 Agent Memory Layer | **92** | 想最快给 Agent 加长期记忆、用户画像、偏好记忆 |
| 2 | **Letta** | Stateful Agent Runtime | **90** | 想搭“有状态 agent server”，而不是只做 RAG |
| 3 | **LangGraph** | Agent 状态编排框架 | **88** | 复杂流程、可恢复状态、多轮任务、生产级 agent |
| 4 | **LangMem** | LangGraph 记忆扩展 | **86** | 已用 LangGraph，想加结构化长期记忆 |
| 5 | **Graphiti** | 时间感知知识图谱记忆 | **85** | 事实关系、时间变化、实体关系型 memory |
| 6 | **Cognee** | 语义记忆 + 图谱/RAG | **84** | 把文档、对话、结构化数据转成 agent 可查记忆 |
| 7 | **MCP Memory Server** | MCP 本地知识图谱记忆 | **83** | Claude/Cursor/任意 MCP 客户端的超轻量本地记忆 |
| 8 | **Hindsight** | 专用记忆服务/SDK | **82** | 需要对话记忆、偏好、回忆策略，且希望 Docker 跑服务 |
| 9 | **Neo4j Agent Memory** | 图数据库记忆/MCP | **80** | 已用 Neo4j，想让 Agent 记实体、情节、语义信息 |
| 10 | **Aegis Memory** | 多 Agent 共享记忆平台 | **79** | 多 Agent 协作、权限隔离、共享记忆 |
| 11 | **LlamaIndex Memory** | RAG/Agent 框架记忆 | **78** | 已在 LlamaIndex 生态里做 RAG/Agent |
| 12 | **CrewAI Memory** | 多 Agent 框架内置记忆 | **77** | Crew/Role-based 多 Agent 项目 |
| 13 | **AutoGen Memory** | 多 Agent 框架记忆协议 | **75** | Microsoft/AutoGen 多 Agent 原型和研究项目 |
| 14 | **Semantic Kernel Memory** | .NET/Python Agent Memory | **74** | .NET、Azure、Microsoft 生态 |
| 15 | **Haystack Memory** | RAG Pipeline/Agent Memory | **73** | 企业 RAG、可控 pipeline、Python 工程 |
| 16 | **Dify** | 低代码 Agent/RAG 平台 | **72** | 想用 UI 快速搭应用、工作流、RAG、Agent |
| 17 | **RAGFlow** | RAG + Agent + Memory 平台 | **71** | 文档知识库、深度解析、带记忆的企业问答 |
| 18 | **Qdrant** | 向量数据库底座 | **70** | 生产级向量检索，配合 Mem0/LangGraph/LlamaIndex |
| 19 | **Chroma** | 本地向量数据库底座 | **69** | 开发/原型最快，轻量本地向量记忆 |
| 20 | **pgvector** | PostgreSQL 向量扩展 | **68** | 已有 Postgres，想少引入一套数据库 |

---

# 逐项推荐与最简 self-hosting 方法

## 1. Mem0 — 最推荐的通用 Agent Memory Layer

**为什么推荐：**  
Mem0 的定位非常直接：给 AI 应用提供“记忆层”，支持从对话中抽取用户偏好、长期事实、可检索上下文，并能接入多种 Agent 框架。官方文档把它描述为 universal/self-improving memory layer，并强调可自托管、可和多种框架集成；它的自托管版包含 FastAPI、Postgres/pgvector、Neo4j 等组件，适合做真实长期记忆，而不是只把聊天记录塞回 prompt。([Mem0](https://docs.mem0.ai/introduction))

**适合你：**  
你想给现有 Agent 快速加“记住用户、记住偏好、记住历史事实”的能力，优先选它。

**最简 self-hosting：**

```bash
clone 官方仓库
cd server
make bootstrap
```

然后配置 LLM / embedding provider。官方 README 里给了 `cd server && make bootstrap` 的方式，并提供本地服务和 OpenMemory dashboard；生产环境要额外处理鉴权、CORS、密钥和外网暴露。([GitHub](https://github.com/mem0ai/mem0))

**注意点：**  
Mem0 很适合“应用记忆层”，但如果你要非常复杂的 agent 状态机、回滚、时间旅行、任务恢复，建议和 LangGraph 搭配。

---

## 2. Letta — 最像“有状态 Agent 操作系统”的方案

**为什么推荐：**  
Letta 的前身是 MemGPT，核心思路是让 Agent 具备持久状态、长期记忆和可管理的上下文。它不是简单 SDK，而更像一个 agent server：你可以创建、运行、管理有状态 Agent。官方 repo 明确强调 stateful agents，并提供 Docker 部署方式。([GitHub](https://github.com/letta-ai/letta))

**适合你：**  
你不是只想给现有聊天机器人加一点 recall，而是想搭一套“Agent 后端”，让每个 Agent 有自己的状态、工具、记忆和生命周期。

**最简 self-hosting：**

```bash
docker run -p 8283:8283 \
  -v ~/.letta/.persist/pgdata:/var/lib/postgresql/data \
  letta/letta:latest
```

本地原型这样就能跑；生产建议配置 password、Postgres 持久卷、embedding provider、反向代理和访问控制。Letta 文档也说明了 Docker、embedding 配置和 server password 等部署细节。([Letta Docs](https://docs.letta.com/guides/docker))

**注意点：**  
Letta 的抽象比 Mem0 更“重”。如果你只是想在现有应用里插一个 memory API，Mem0 更轻；如果你想管理 agent 生命周期，Letta 更顺手。

---

## 3. LangGraph — 生产级 Agent 状态与记忆编排

**为什么推荐：**  
LangGraph 的强项不是“自动帮你抽取用户偏好”，而是 **可靠地保存 Agent 状态**：checkpoint、thread state、持久化 store、恢复执行、time travel、human-in-the-loop。这些能力对生产级 agent 很关键。官方文档明确区分了 thread-level persistence、cross-thread memory/store，以及 Sqlite/Postgres checkpoint 后端。([LangChain Docs](https://docs.langchain.com/oss/python/langgraph/persistence))

**适合你：**  
你要做复杂 Agent 工作流，比如客服处理、研究助手、代码 Agent、多步骤工具调用，并且要求任务中断后能恢复。

**最简 self-hosting：**

```bash
pip install langgraph langgraph-checkpoint-postgres
docker run -d --name pg -e POSTGRES_PASSWORD=postgres -p 5432:5432 postgres:16
```

然后在应用里用 Postgres checkpointer / store 保存 thread state 和长期 memory。开发期可用内存或 SQLite，生产期推荐 Postgres。([LangChain Docs](https://docs.langchain.com/oss/python/langgraph/persistence))

**注意点：**  
LangGraph 给你“状态与流程控制”，但“如何从对话抽取长期偏好/事实”通常要配 LangMem、Mem0、Cognee 或自己写。

---

## 4. LangMem — LangGraph 生态里的专用记忆层

**为什么推荐：**  
LangMem 是 LangGraph 生态下的 memory 扩展，目标是给 Agent 增加长期记忆、记忆管理、上下文检索和自动抽取能力。官方 README 提到它支持在 LangGraph store 中管理 memory，并建议生产中使用 AsyncPostgresStore。([GitHub](https://github.com/langchain-ai/langmem/blob/main/README.md))

**适合你：**  
你已经选 LangGraph 做 agent runtime，又不想从零写“记忆抽取、记忆更新、检索注入”。

**最简 self-hosting：**

```bash
pip install langmem langgraph langgraph-checkpoint-postgres
启动 PostgreSQL
在 LangGraph Store 上挂 LangMem memory manager
```

开发环境可以先用内存 store；生产用 PostgresStore / AsyncPostgresStore。([GitHub](https://github.com/langchain-ai/langmem/blob/main/README.md))

**注意点：**  
LangMem 的最好用法是和 LangGraph 一起用。单独拿出来做“独立 memory service”，不如 Mem0 或 Letta 顺手。

---

## 5. Graphiti — 时间感知知识图谱记忆

**为什么推荐：**  
Graphiti 是一个面向 AI Agent 的 temporal knowledge graph 框架，重点是把事件、实体、关系和时间变化组织起来。它尤其适合处理“事实会变”的记忆，例如用户换工作、偏好变化、项目状态更新。Graphiti 官方说明它用 episodic data 构建可查询知识图谱，并且支持 Neo4j；Zep 也把 Graphiti 作为开源图记忆核心项目来维护。([GitHub](https://github.com/getzep/graphiti))

**适合你：**  
你关心的不只是“相似文本检索”，而是“谁和谁有什么关系、什么时候发生、现在是否仍然有效”。

**最简 self-hosting：**

```bash
启动 Neo4j
pip install graphiti-core
配置 NEO4J_URI / NEO4J_USER / NEO4J_PASSWORD / LLM API key
运行 Graphiti ingestion / search 服务
```

Graphiti 也提供 Docker/FastAPI/Neo4j 组合示例，方便做成服务。([Docker Hub](https://hub.docker.com/r/zepai/graphiti))

**注意点：**  
图谱 memory 的收益很高，但 schema、实体消歧、事实更新策略会比普通向量库复杂。

---

## 6. Cognee — 语义记忆 + 图谱 + RAG 的综合方案

**为什么推荐：**  
Cognee 的定位是 open-source memory for AI agents，它会把结构化和非结构化数据转成可查询的知识图谱与 embedding 记忆。官方 README 展示了 `add → cognify → search` 的使用流程，并支持多种数据库/图数据库/向量后端。([GitHub](https://github.com/topoteretes/cognee))

**适合你：**  
你想让 Agent 记住文档、网页、对话、业务对象，并能在图关系和语义检索之间切换。

**最简 self-hosting：**

```bash
pip install cognee
export LLM_API_KEY=...
在 Python 中调用 cognee.add(...)
再调用 cognee.cognify()
最后用 cognee.search(...)
```

本地原型可先跑默认配置；生产再换成 Postgres、Neo4j、Qdrant 等持久化后端。官方 README 还提供 UI 入口。([GitHub](https://github.com/topoteretes/cognee))

**注意点：**  
Cognee 能力丰富，但你要想清楚数据治理：哪些数据该进长期记忆、哪些该过期、哪些要按用户隔离。

---

## 7. MCP Memory Server — 最轻量的本地持久记忆

**为什么推荐：**  
MCP Memory Server 是 Model Context Protocol 生态里的 reference memory server，用本地知识图谱保存 entities、relations、observations，让 Claude、Cursor、VS Code 或其他 MCP 客户端跨会话记住信息。官方 npm 包说明它是给 Claude 提供 knowledge graph memory 的 MCP server，MCP 文档也把 Memory 列为 knowledge graph-based persistent memory reference server。([npm](https://www.npmjs.com/package/%40modelcontextprotocol/server-memory?utm_source=chatgpt.com))

**适合你：**  
你想要一个“今天就能用”的本地记忆，不想上数据库、不想写服务。

**最简 self-hosting：**

```json
{
  "mcpServers": {
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"],
      "env": {
        "MEMORY_FILE_PATH": "/your/persistent/path/memory.jsonl"
      }
    }
  }
}
```

它通常把记忆落到本地 JSON/JSONL 文件；社区文档也说明了 `MEMORY_FILE_PATH` 这类持久化路径配置。([Awesome MCP Servers](https://mcpservers.org/servers/modelcontextprotocol/memory?utm_source=chatgpt.com))

**注意点：**  
它非常轻，但不是复杂 memory layer：没有高级权限、冲突合并、自动遗忘、多租户等能力。

---

## 8. Hindsight — 专用对话记忆服务，Docker 友好

**为什么推荐：**  
Hindsight 的目标是给 AI 应用提供记忆层，支持通过少量 wrapper/API 记录和检索对话记忆，并提供多种 retrieval strategy。官方 README 提到 Docker 启动、embedded 模式、memory architecture 和 MIT license。([GitHub](https://github.com/vectorize-io/hindsight))

**适合你：**  
你想要一个独立 memory service，但不想自己从 LangGraph/Cognee/向量库拼所有组件。

**最简 self-hosting：**

```bash
clone 官方仓库
复制 .env.example 为 .env
docker compose up -d
```

也可以用 embedded/library 模式直接嵌入你的应用。([GitHub](https://github.com/vectorize-io/hindsight))

**注意点：**  
生态热度和社区规模不如 Mem0/Letta/LangGraph，适合愿意评估代码和 roadmap 的团队。

---

## 9. Neo4j Agent Memory — Neo4j 用户的图记忆首选

**为什么推荐：**  
Neo4j Agent Memory 是 Neo4j Labs/社区方向的 agent memory 项目，面向 semantic、episodic、procedural 等记忆类型，并可通过 MCP 接入客户端。官方资料说明它让 Agent 通过 Neo4j 存储和检索记忆；Neo4j 博客也介绍了这三类 memory 和 MCP/框架集成。([GitHub](https://github.com/neo4j-labs/agent-memory))

**适合你：**  
你已经有 Neo4j，或者你的 memory 天然是关系型：人、组织、项目、事件、偏好、约束、流程。

**最简 self-hosting：**

```bash
启动 Neo4j
安装 neo4j-agent-memory 包或 MCP server
配置 NEO4J_URI / NEO4J_USERNAME / NEO4J_PASSWORD
把 MCP server 接入 Claude/Cursor/你的 Agent
```

官方 README 给了 MCP quickstart 和 requirements。([GitHub](https://github.com/neo4j-labs/agent-memory))

**注意点：**  
Neo4j 官方也提示这是 Labs/community supported 类型项目；生产使用前要自己验证数据隔离、权限和备份策略。([GitHub](https://github.com/neo4j-labs/agent-memory))

---

## 10. Aegis Memory — 多 Agent 共享记忆与访问控制

**为什么推荐：**  
Aegis Memory 主打 shared memory infrastructure for AI agents，强调多 Agent 共享、权限、记忆控制和集成。官方文档提到它是 open-source、自托管，并有 Docker Compose quickstart 与 SDK。([Aegis Memory](https://docs.aegismemory.com/introduction/overview))

**适合你：**  
你要做的不是一个聊天机器人，而是一组 Agent：研究 Agent、执行 Agent、审批 Agent、客服 Agent 共享部分记忆，但又要隔离权限。

**最简 self-hosting：**

```bash
clone 官方仓库
docker compose up -d
在应用里用 SDK 写入 / 查询 memory
```

官方 quickstart 给了 Docker Compose 路径和 SDK 示例。([GitHub](https://github.com/quantifylabs/aegis-memory))

**注意点：**  
这是较新的专用 memory 平台，建议先用非核心业务数据验证稳定性。

---

## 11. LlamaIndex Memory — RAG/Agent 项目里的稳妥选择

**为什么推荐：**  
LlamaIndex 本身是成熟 RAG/Agent 框架，它的 memory 文档覆盖 short-term、long-term memory blocks、vector memory block、remote memory DB URI 等用法。适合把“文档知识库 + 对话记忆 + Agent 工具”放在同一套框架里做。([LlamaIndex OSS Documentation](https://developers.llamaindex.ai/python/framework/module_guides/deploying/agents/memory/))

**适合你：**  
你已经在用 LlamaIndex 做文档索引、RAG、agent workflow，那就别另起炉灶，优先用它的 memory 能力。

**最简 self-hosting：**

```bash
pip install llama-index
选择 memory block / vector memory
后端接 Chroma、Qdrant、Postgres/pgvector 或本地持久化目录
```

如果需要远程持久 memory，可配置 memory DB URI。([LlamaIndex OSS Documentation](https://developers.llamaindex.ai/python/framework/module_guides/deploying/agents/memory/))

**注意点：**  
LlamaIndex 更偏“RAG/知识上下文框架”，不是开箱即用的独立 memory server。

---

## 12. CrewAI Memory — Crew 多 Agent 项目的内置记忆

**为什么推荐：**  
CrewAI 内置 memory 能力，官方文档展示了 unified memory class、`memory=True`、自动 extract/recall，以及 graceful degradation。它很适合 role-based 多 Agent 协作：研究员、撰写员、审阅员等共享或保留上下文。([CrewAI Documentation](https://docs.crewai.com/en/concepts/memory))

**适合你：**  
你已经用 CrewAI 写多 Agent 工作流，希望每个 crew/agent 能记住历史任务、偏好和上下文。

**最简 self-hosting：**

```bash
pip install crewai
在 Crew 配置里启用 memory=True
配置本地 embedding / vector store / storage 路径
```

开发期可直接用默认配置；生产期建议明确配置持久化存储和每个用户/crew 的 namespace。([CrewAI Documentation](https://docs.crewai.com/en/concepts/memory))

**注意点：**  
CrewAI 的 memory 很适合 CrewAI 内部工作流；如果你要跨多个系统共享 memory，Mem0/Aegis/MCP Memory 更自然。

---

## 13. AutoGen Memory — Microsoft 多 Agent 生态里的可扩展记忆

**为什么推荐：**  
AutoGen 是 Microsoft 的 agentic AI 编程框架，官方文档说明它是 event-driven framework for scalable multi-agent AI systems；它的 AgentChat 提供 Memory protocol，可将有用事实按需加入 agent context，并有 ChromaDBVectorMemory 这类向量记忆实现。([Microsoft](https://microsoft.github.io/autogen/stable/index.html?utm_source=chatgpt.com))

**适合你：**  
你在做多 Agent 研究、原型、企业 Microsoft 技术栈集成，或者想把 memory 作为可替换协议实现。

**最简 self-hosting：**

```bash
pip install autogen-agentchat autogen-ext[chromadb]
使用 ListMemory 做本地简单记忆
或使用 ChromaDBVectorMemory 做持久向量记忆
```

**注意点：**  
AutoGen 的 memory 抽象偏开发者框架，不是开箱即用的用户画像/长期记忆系统；另外 repo 有维护模式相关提示，生产长期路线要关注 Microsoft Agent Framework 的演进。([GitHub](https://github.com/microsoft/autogen?utm_source=chatgpt.com))

---

## 14. Semantic Kernel Memory — .NET / Azure 队伍的自然选择

**为什么推荐：**  
Semantic Kernel 的 Agent Memory 文档明确支持用 Mem0 做 agent memory、用 Whiteboard Memory 做短期上下文，并提示该功能仍是 experimental；它还有 vector store abstraction，可以在本地 vector store 与生产服务之间切换。([Microsoft Learn](https://learn.microsoft.com/en-us/semantic-kernel/frameworks/agent/agent-memory?utm_source=chatgpt.com))

**适合你：**  
你主要用 .NET/C#、Azure、Microsoft 生态，希望 memory 和企业应用架构一致。

**最简 self-hosting：**

```bash
.NET 或 Python 项目中安装 Semantic Kernel
开发期用 InMemory / Whiteboard Memory
长期记忆接 Mem0、Qdrant、Postgres/pgvector 或 Azure-compatible vector store
```

**注意点：**  
Agent Memory 功能官方标注为 experimental，所以我把它排在 AutoGen 后面；企业项目可用，但要接受 API 变化风险。([Microsoft Learn](https://learn.microsoft.com/en-us/semantic-kernel/frameworks/agent/agent-memory?utm_source=chatgpt.com))

---

## 15. Haystack Memory — 可控 RAG Pipeline 的记忆方案

**为什么推荐：**  
Haystack 是开源 AI orchestration framework，主打 production-ready LLM apps、retrieval、routing、memory、generation 的显式 pipeline 控制。Haystack 的 conversational RAG tutorial 通过 ChatMessageStore 给 RAG 系统加入对话记忆，不过官方也标注 ChatMessageStore 目前在 experimental/beta。([GitHub](https://github.com/deepset-ai/haystack?utm_source=chatgpt.com))

**适合你：**  
你要做企业 RAG，重视 pipeline 可控、组件可替换、检索链路透明，而不是黑盒 agent。

**最简 self-hosting：**

```bash
pip install haystack-ai "haystack-experimental>=0.15.0"
使用 ChatMessageStore 保存对话历史
文档检索后端接 Elasticsearch、OpenSearch、Qdrant、pgvector 等
```

**注意点：**  
Haystack 很工程化，但它的“Agent Memory”没有 Mem0/Letta 那么开箱即用；更适合愿意自己设计 pipeline 的团队。

---

## 16. Dify — 低代码 Agent/RAG 平台，适合产品原型和内部应用

**为什么推荐：**  
Dify 是开源 LLM app development platform，提供 workflow、RAG pipeline、agent capabilities、model management、observability 等功能；官方推荐 Docker Compose 自托管，并会启动 api、worker、web、plugin daemon、Postgres、Redis、Weaviate、nginx 等组件。([GitHub](https://github.com/langgenius/dify?utm_source=chatgpt.com))

**适合你：**  
你想用 UI 快速搭 agent 应用、知识库问答、工作流，而不是先写一堆后端代码。

**最简 self-hosting：**

```bash
clone 官方仓库
cd docker
cp .env.example .env
docker compose up -d
浏览器打开 /install 初始化管理员
```

官方文档给出了 Docker Compose 启动和初始化入口。([Dify Docs](https://docs.dify.ai/en/self-host/quick-start/docker-compose?utm_source=chatgpt.com))

**注意点：**  
Dify 的许可证是 modified Apache 2.0 with additional conditions；如果你要商用、多租户 SaaS 或严格 OSI 合规，务必先审 LICENSE。([GitHub](https://github.com/langgenius/dify/blob/main/LICENSE?utm_source=chatgpt.com))

---

## 17. RAGFlow — 文档知识库 + Agent Memory 的平台型方案

**为什么推荐：**  
RAGFlow 是开源 RAG engine，强调 deep document understanding、RAG 与 Agent capabilities；官方更新中提到支持 AI agent 的 Memory，文档也说明 Memory 模块会保存 Agent 工作时的对话、摘要、笔记等，并用于跨会话延续上下文。([GitHub](https://github.com/infiniflow/ragflow?utm_source=chatgpt.com))

**适合你：**  
你的核心需求是企业文档、PDF/Word/复杂格式解析、带引用问答，同时希望 Agent 具备会话记忆。

**最简 self-hosting：**

```bash
clone 官方仓库
进入 docker 部署目录
配置 .env
docker compose up -d
创建 dataset，再创建带 memory 的 Agent/Chat
```

官方 quickstart 描述了启动本地 RAGFlow server、创建 dataset、解析文件、建立 AI chat 的流程；硬件上官方文档建议 x86 CPU ≥ 4 cores、RAM ≥ 16GB、磁盘 ≥ 50GB。([RAGFlow](https://ragflow.io/docs/?utm_source=chatgpt.com))

**注意点：**  
RAGFlow 比 Dify 更“重”，尤其吃内存和磁盘；小机器上不要硬上全量生产配置。

---

## 18. Qdrant — 生产向量记忆底座首选之一

**为什么推荐：**  
Qdrant 是开源 vector search engine/vector database，用 Rust 写，提供 production-ready service 和 API，适合做大规模语义检索、metadata filter、向量记忆后端。([Qdrant](https://qdrant.tech/documentation/operations/installation/?utm_source=chatgpt.com))

**适合你：**  
你已经有 Mem0、LangGraph、LlamaIndex、Haystack 这类上层 memory logic，需要一个可靠向量库。

**最简 self-hosting：**

```bash
docker run -p 6333:6333 \
  -v $(pwd)/qdrant_storage:/qdrant/storage \
  qdrant/qdrant
```

然后让 Mem0/LlamaIndex/LangGraph/Haystack 把 embedding 写入 Qdrant。

**注意点：**  
Qdrant 本身不负责“什么时候写记忆、如何遗忘、如何合并用户偏好”，这些要由上层 memory layer 做。

---

## 19. Chroma — 原型开发最快的向量记忆底座

**为什么推荐：**  
Chroma 是面向 AI 的开源数据基础设施/向量数据库，最大的优点是开发体验简单，Python 本地模式和 Docker server 都容易跑。Chroma Cookbook 给了 Docker Compose 示例：暴露 8000 端口，并把数据持久化到本地目录。([GitHub](https://github.com/chroma-core/chroma?utm_source=chatgpt.com))

**适合你：**  
你在做 PoC、个人项目、本地 agent、AutoGen/LlamaIndex 快速实验。

**最简 self-hosting：**

```yaml
services:
  chromadb:
    image: chromadb/chroma
    volumes:
      - ./chroma-data:/data
    ports:
      - "8000:8000"
```

**注意点：**  
Chroma 非常适合轻量原型；如果你要更强的生产 filter、水平扩展、高并发，Qdrant/Weaviate/Milvus 可能更合适。

---

## 20. pgvector — 已有 PostgreSQL 时最省事

**为什么推荐：**  
pgvector 是 PostgreSQL 的开源 vector similarity search 扩展，优点是把结构化业务数据和向量记忆放在同一个数据库里，备份、权限、事务、监控都沿用 Postgres 体系。([GitHub](https://github.com/pgvector/pgvector?utm_source=chatgpt.com))

**适合你：**  
你已经有 PostgreSQL，不想为了 agent memory 再维护一个独立向量数据库。

**最简 self-hosting：**

```bash
docker run -p 5432:5432 \
  -e POSTGRES_PASSWORD=postgres \
  pgvector/pgvector:pg17
```

进入数据库后：

```sql
CREATE EXTENSION vector;
```

然后在 Mem0、LangGraph、LangMem、LlamaIndex 或你自己的 memory service 里把 embedding 和 metadata 写入 Postgres。

**注意点：**  
pgvector 很稳，但它只是存储层；复杂向量检索规模、专用索引调优、高并发召回场景下，Qdrant/Milvus/Weaviate 会更专业。

---

# 我没有放进主榜、但值得知道的项目

**Zep Community Edition：暂不推荐作为新的自托管首选。**  
旧版 Zep CE 以前很适合做 Agent Memory，但当前公开信息显示 Community Edition 已 deprecated / no longer supported，并被移到 legacy；如果你喜欢 Zep 的 temporal knowledge graph 思路，优先看 Graphiti。([GitHub](https://github.com/getzep/zep?utm_source=chatgpt.com))

**Supermemory：能力强，但“易 self-host”不够稳。**  
Supermemory 官方 repo 宣称它是 memory/context layer，并提到 memory extraction、user profiles、contradiction handling 等能力；但官方 self-hosting 文档显示完整 API 自托管面向 enterprise customers，标准用户更多是 hosted API 路线，所以我没有把它放进“开源且自建不难”的主榜。([GitHub](https://github.com/supermemoryai/supermemory?utm_source=chatgpt.com))

**Flowise / Open WebUI：适合 UI，但不是我的 memory 首选。**  
Flowise 很适合可视化搭 agent workflow，但近期有安全漏洞被披露和修复的记录，公网自托管要更谨慎；Open WebUI 有 memory 功能，但官方资料仍把部分 memory 能力标为 beta/experimental，更适合个人助手而不是核心 memory layer。([FlowiseAI](https://docs.flowiseai.com/?utm_source=chatgpt.com))

**Weaviate / Milvus / LanceDB：优秀向量底座。**  
如果你的问题主要是“选向量数据库”，它们也很值得评估；但在“Agent Memory 解决方案”语境下，我优先列了更轻的 Chroma、更生产友好的 Qdrant、以及最省运维的 pgvector。

---

## 选型建议

**个人/小团队最快落地：**  
选 **Mem0 + pgvector/Postgres**，或者 **MCP Memory Server**。前者更像产品级 memory layer，后者像一把瑞士军刀，超轻但功能有限。

**要做完整 Agent 后端：**  
选 **Letta**。它比 Mem0 重，但对“有状态 Agent”更自然。

**要做严肃生产工作流：**  
选 **LangGraph + LangMem + Postgres**。这套组合最适合可恢复、多步骤、可审计的 Agent。

**要做图谱记忆：**  
选 **Graphiti** 或 **Cognee**；如果你公司已经用 Neo4j，就看 **Neo4j Agent Memory**。

**要做低代码内部平台：**  
选 **Dify** 或 **RAGFlow**。Dify 更像通用 LLM 应用平台，RAGFlow 更偏文档理解和企业知识库。

**只想先打好存储底座：**  
原型用 **Chroma**，生产向量检索用 **Qdrant**，已有 Postgres 就用 **pgvector**。
