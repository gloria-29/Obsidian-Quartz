---
标题: "CJackHwang/ds2api: Deepseek客户端对话转API全栈开源工具，高性能，多账号轮询，支持纯vercel、docker部署使用。Google、Claude、ChatGPT多接口格式兼容"
笔记 ID: 019d6d38-3e99-797c-bb0d-704b0ec0d074
笔记类型: crawl
tags:
    - 生活/电子工具
卡片盒:
    - 生活
包含语音: 否
网页链接:
创建时间: "2026-04-08T21:11:35.838"
更新时间: "2026-04-08T21:26:54.781"
---

&amp;nbsp;

![DS2API icon](https://github.com/gloria-29/OB-assets/releases/download/img-c0/c03cf1f3a0fb9b260b0d42733b224f9114af8e9bc6b6d171a30c0e11778ac0d2.svg)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

## DS2API

&amp;nbsp;

![Docker](https://github.com/gloria-29/OB-assets/releases/download/img-05/05e70f7ebb3967c9b5d2a346b5fe7af319f27bd32317f5e9aef094341d2d4916.svg)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

![Deploy on Zeabur](https://github.com/gloria-29/OB-assets/releases/download/img-ca/cac713909a769e3ff7a6e2e219ef58497246b58374642d10cdc78c6052a30f52.svg)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

![Deploy with Vercel](https://github.com/gloria-29/OB-assets/releases/download/img-bd/bd101dc2c08554bdae9009d7c8d12ef4939ac8bc1052393df52405193cc42960.svg)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

语言 / Language: [中文](https://github.com/CJackHwang/ds2api/blob/main/README.MD) | [English](https://github.com/CJackHwang/ds2api/blob/main/README.en.md)

将 DeepSeek Web 对话能力转换为 OpenAI、Claude 与 Gemini 兼容 API。后端为 **Go 全量实现** ，前端为 React WebUI 管理台（源码在 &#96;webui/&#96; ，部署时自动构建到 &#96;static/admin&#96; ）。

文档入口： [文档导航](https://github.com/CJackHwang/ds2api/blob/main/docs/README.md) / [架构说明](https://github.com/CJackHwang/ds2api/blob/main/docs/ARCHITECTURE.md) / [接口文档](https://github.com/CJackHwang/ds2api/blob/main/API.md)

【感谢Linux.do社区及GitHub社区各位开发者对项目的支持与贡献】

&gt; **重要免责声明**
&gt;
&gt; 本仓库仅供学习、研究、个人实验和内部验证使用，不提供任何形式的商业授权、适用性保证或结果保证。
&gt;
&gt; 作者及仓库维护者不对因使用、修改、分发、部署或依赖本项目而产生的任何直接或间接损失、账号封禁、数据丢失、法律风险或第三方索赔负责。
&gt;
&gt; 请勿将本项目用于违反服务条款、协议、法律法规或平台规则的场景。商业使用前请自行确认 &#96;LICENSE&#96; 、相关协议以及你是否获得了作者的书面许可。

## 架构概览（摘要）

&#96;&#96;&#96;
flowchart LR
    Client[&quot;🖥️ 客户端 / SDK\n(OpenAI / Claude / Gemini)&quot;]
    Upstream[&quot;☁️ DeepSeek API&quot;]

    subgraph DS2API[&quot;DS2API 3.x（统一 OpenAI 内核）&quot;]
        Router[&quot;chi Router + 中间件\n(RequestID / RealIP / Logger / Recoverer / CORS)&quot;]

        subgraph Adapters[&quot;协议适配层&quot;]
            OA[&quot;OpenAI\n/v1/*&quot;]
            CA[&quot;Claude\n/anthropic/* + /v1/messages&quot;]
            GA[&quot;Gemini\n/v1beta/models/* + /v1/models/*&quot;]
            Admin[&quot;Admin API\n/admin/*&quot;]
            WebUI[&quot;WebUI\n/admin（静态托管）&quot;]
        end

        subgraph Runtime[&quot;运行时核心能力&quot;]
            Bridge[&quot;CLIProxy 转换桥\n(多协议 &lt;-&gt; OpenAI)&quot;]
            OAEngine[&quot;OpenAI ChatCompletions\n(统一工具调用与流式语义)&quot;]
            Auth[&quot;Auth Resolver\n(API key / bearer / x-goog-api-key)&quot;]
            Pool[&quot;Account Pool + Queue\n(并发槽位 + 等待队列)&quot;]
            DSClient[&quot;DeepSeek Client\n(Session / Auth / HTTP)&quot;]
            Pow[&quot;PoW 实现\n(纯 Go 毫秒级)&quot;]
            Tool[&quot;Tool Sieve\n(Go/Node 语义对齐)&quot;]
        end
    end

    Client --&gt; Router
    Router --&gt; OA &amp; CA &amp; GA
    Router --&gt; Admin
    Router --&gt; WebUI

    OA --&gt; OAEngine
    CA &amp; GA --&gt; Bridge
    Bridge --&gt; OAEngine
    OAEngine --&gt; Auth
    OAEngine -.账号轮询.-&gt; Pool
    OAEngine -.工具调用解析.-&gt; Tool
    OAEngine -.PoW 计算.-&gt; Pow
    Auth --&gt; DSClient
    DSClient --&gt; Upstream
    Upstream --&gt; DSClient
    OAEngine --&gt; Bridge
    Bridge --&gt; Client
&#96;&#96;&#96;

详细架构拆分与目录职责见 [docs/ARCHITECTURE.md](https://github.com/CJackHwang/ds2api/blob/main/docs/ARCHITECTURE.md) 。

- **后端** ：Go（ &#96;cmd/ds2api/&#96; 、 &#96;api/&#96; 、 &#96;internal/&#96; ），不依赖 Python 运行时
- **前端** ：React 管理台（ &#96;webui/&#96; ），运行时托管静态构建产物
- **部署** ：本地运行、Docker、Vercel Serverless、Linux systemd

### 3.X 底层架构调整（相较旧版本）

- **统一路由内核** ：所有协议入口统一汇聚到 &#96;internal/server/router.go&#96; ，并在同一路由树中注册 OpenAI / Claude / Gemini / Admin / WebUI 路由，避免多入口行为漂移。
- **统一执行链路** ：Claude / Gemini 入口先经 &#96;internal/translatorcliproxy&#96; 做协议转换，再进入 &#96;openai.ChatCompletions&#96; 统一处理工具调用与流式语义，最后再转换回原协议响应。
- **适配器分层更清晰** ： &#96;internal/adapter/{claude,gemini}&#96; 负责入口/出口协议封装， &#96;internal/adapter/openai&#96; 负责核心执行，DeepSeek 侧调用只保留在 OpenAI 内核中。
- **Tool Calling 双运行时对齐** ：Go 侧（ &#96;internal/toolcall&#96; ）与 Vercel Node 侧（ &#96;internal/js/helpers/stream-tool-sieve&#96; ）保持一致的解析/防泄漏语义，覆盖 JSON / XML / invoke / text-kv 多风格输入。
- **配置与运行时设置解耦** ：静态配置（ &#96;config&#96; ）与运行时策略（ &#96;settings&#96; ）通过 Admin API 分离管理，支持热更新和密码轮换失效旧 JWT。
- **流式能力升级** ： &#96;/v1/responses&#96; 与 &#96;/v1/chat/completions&#96; 共享更一致的工具调用增量输出策略，降低不同 SDK 下的行为差异。
- **可观测与可运维增强** ： &#96;/healthz&#96; 、 &#96;/readyz&#96; 、 &#96;/admin/version&#96; 、 &#96;/admin/dev/captures&#96; 形成排障闭环，便于发布后验证。

## 核心能力


| 能力           | 说明                                                                                                                                                        |
| ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| OpenAI 兼容    | &#96;GET /v1/models&#96; 、 &#96;GET /v1/models/{id}&#96; 、 &#96;POST /v1/chat/completions&#96; 、 &#96;POST /v1/responses&#96; 、 &#96;GET /v1/responses/{response_id}&#96; 、 &#96;POST /v1/embeddings&#96; |
| Claude 兼容    | &#96;GET /anthropic/v1/models&#96; 、 &#96;POST /anthropic/v1/messages&#96; 、 &#96;POST /anthropic/v1/messages/count_tokens&#96; （及快捷路径 &#96;/v1/messages&#96; 、 &#96;/messages&#96; ）             |
| Gemini 兼容    | &#96;POST /v1beta/models/{model}:generateContent&#96; 、 &#96;POST /v1beta/models/{model}:streamGenerateContent&#96; （及 &#96;/v1/models/{model}:*&#96; 路径）                         |
| 多账号轮询        | 自动 token 刷新、邮箱/手机号双登录方式                                                                                                                                   |
| 并发队列控制       | 每账号 in-flight 上限 + 等待队列，动态计算建议并发值                                                                                                                         |
| DeepSeek PoW | 纯 Go 高性能实现（DeepSeekHashV1），毫秒级响应                                                                                                                          |
| Tool Calling | 防泄漏处理：非代码块高置信特征识别、 &#96;delta.tool_calls&#96; 早发、结构化增量输出                                                                                                          |
| Admin API    | 配置管理、运行时设置热更新、账号测试 / 批量测试、会话清理、导入导出、Vercel 同步、版本检查                                                                                                        |
| WebUI 管理台    | &#96;/admin&#96; 单页应用（中英文双语、深色模式）                                                                                                                                 |
| 运维探针         | &#96;GET /healthz&#96; （存活）、 &#96;GET /readyz&#96; （就绪）                                                                                                                   |


## 平台兼容矩阵


| 级别  | 平台                                                      | 当前状态 |
| --- | ------------------------------------------------------- | ---- |
| P0  | Codex CLI/SDK（ &#96;wire_api&#61;chat&#96; / &#96;wire_api&#61;responses&#96; ） | ✅    |
| P0  | OpenAI SDK（JS/Python，chat + responses）                  | ✅    |
| P0  | Vercel AI SDK（openai-compatible）                        | ✅    |
| P0  | Anthropic SDK（messages）                                 | ✅    |
| P0  | Google Gemini SDK（generateContent）                      | ✅    |
| P1  | LangChain / LlamaIndex / OpenWebUI（OpenAI 兼容接入）         | ✅    |


## 模型支持

### OpenAI 接口


| 模型                         | thinking | search |
| -------------------------- | -------- | ------ |
| &#96;deepseek-chat&#96;            | ❌        | ❌      |
| &#96;deepseek-reasoner&#96;        | ✅        | ❌      |
| &#96;deepseek-chat-search&#96;     | ❌        | ✅      |
| &#96;deepseek-reasoner-search&#96; | ✅        | ✅      |


### Claude 接口


| 模型                                                 | 默认映射                |
| -------------------------------------------------- | ------------------- |
| &#96;claude-sonnet-4-5&#96;                                | &#96;deepseek-chat&#96;     |
| &#96;claude-haiku-4-5&#96; （兼容 &#96;claude-3-5-haiku-latest&#96; ） | &#96;deepseek-chat&#96;     |
| &#96;claude-opus-4-6&#96;                                  | &#96;deepseek-reasoner&#96; |


可通过配置中的 &#96;claude_mapping&#96; 或 &#96;claude_model_mapping&#96; 覆盖映射关系。 另外， &#96;/anthropic/v1/models&#96; 现已包含 Claude 1.x/2.x/3.x/4.x 历史模型 ID 与常见别名，便于旧客户端直接兼容。

#### Claude Code 接入避坑（实测）

- &#96;ANTHROPIC_BASE_URL&#96; 推荐直接指向 DS2API 根地址（例如 &#96;http://127.0.0.1:5001&#96; ），Claude Code 会请求 &#96;/v1/messages?beta&#61;true&#96; 。
- &#96;ANTHROPIC_API_KEY&#96; 需要与 &#96;config.json&#96; 中 &#96;keys&#96; 一致；建议同时保留常规 key 与 &#96;sk-ant-*&#96; 形态 key，兼容不同客户端校验习惯。
- 若系统设置了代理，建议对 DS2API 地址配置 &#96;NO_PROXY&#61;127.0.0.1,localhost,&lt;你的主机IP&gt;&#96; ，避免本地回环请求被代理拦截。
- 如遇“工具调用输出成文本、未执行”问题，请升级到包含 Claude 工具调用多格式解析（JSON/XML/ANTML/invoke）的版本。

### Gemini 接口

Gemini 适配器将模型名通过 &#96;model_aliases&#96; 或内置规则映射到 DeepSeek 原生模型，支持 &#96;generateContent&#96; 和 &#96;streamGenerateContent&#96; 两种调用方式，并完整支持 Tool Calling（ &#96;functionDeclarations&#96; → &#96;functionCall&#96; 输出）。

## 快速开始

### 通用第一步（所有部署方式）

把 &#96;config.json&#96; 作为唯一配置源（推荐做法）：

&#96;&#96;&#96;
cp config.example.json config.json
# 编辑 config.json
&#96;&#96;&#96;

后续部署建议：

- 本地运行：直接读取 &#96;config.json&#96;
- Docker / Vercel：由 &#96;config.json&#96; 生成 &#96;DS2API_CONFIG_JSON&#96; （Base64）注入环境变量，也可以直接写原始 JSON

### 方式一：本地运行

**前置要求** ：Go 1.26+，Node.js &#96;20.19+&#96; 或 &#96;22.12+&#96; （仅在需要构建 WebUI 时）

&#96;&#96;&#96;
# 1. 克隆仓库
git clone https://github.com/CJackHwang/ds2api.git
cd ds2api

# 2. 配置
cp config.example.json config.json
# 编辑 config.json，填入你的 DeepSeek 账号信息和 API key

# 3. 启动
go run ./cmd/ds2api
&#96;&#96;&#96;

默认本地访问地址： &#96;http://127.0.0.1:5001&#96;

服务实际绑定： &#96;0.0.0.0:5001&#96; ，因此同一局域网设备通常也可以通过你的内网 IP 访问。

&gt; **WebUI 自动构建** ：本地首次启动时，若 &#96;static/admin&#96; 不存在，会自动尝试执行 &#96;npm ci&#96; （仅在缺少依赖时）和 &#96;npm run build -- --outDir static/admin --emptyOutDir&#96; （需要本机有 Node.js）。你也可以手动构建：&#96;./scripts/build-webui.sh&#96;

### 方式二：Docker 运行

&#96;&#96;&#96;
# 1. 准备环境变量和配置文件
cp .env.example .env
cp config.example.json config.json

# 2. 编辑 .env（至少设置 DS2API_ADMIN_KEY；如需修改宿主机端口，可额外设置 DS2API_HOST_PORT）
#    DS2API_ADMIN_KEY&#61;请替换为强密码

# 3. 启动
docker-compose up -d

# 4. 查看日志
docker-compose logs -f
&#96;&#96;&#96;

默认 &#96;docker-compose.yml&#96; 会把宿主机 &#96;6011&#96; 映射到容器内的 &#96;5001&#96; 。如果你希望直接对外暴露 &#96;5001&#96; ，请设置 &#96;DS2API_HOST_PORT&#61;5001&#96; （或者手动调整 &#96;ports&#96; 配置）。

更新镜像： &#96;docker-compose up -d --build&#96;

#### Zeabur 一键部署（Dockerfile）

1. 点击上方 “Deploy on Zeabur” 按钮，一键部署。
2. 部署完成后访问 &#96;/admin&#96; ，使用 Zeabur 环境变量/模板指引中的 &#96;DS2API_ADMIN_KEY&#96; 登录。
3. 在管理台导入/编辑配置（会写入并持久化到 &#96;/data/config.json&#96; ）。

说明：Zeabur 使用仓库内 &#96;Dockerfile&#96; 直接构建时，不需要额外传入 &#96;BUILD_VERSION&#96; ；镜像会优先读取该构建参数，未提供时自动回退到仓库根目录的 &#96;VERSION&#96; 文件。

### 方式三：Vercel 部署

1. Fork 仓库到自己的 GitHub
2. 在 Vercel 上导入项目
3. 配置环境变量（最少设置 &#96;DS2API_ADMIN_KEY&#96; ；推荐同时设置 &#96;DS2API_CONFIG_JSON&#96; ）
4. 部署

建议先在仓库目录复制模板并填写：

&#96;&#96;&#96;
cp config.example.json config.json
# 编辑 config.json
&#96;&#96;&#96;

推荐：先本地把 &#96;config.json&#96; 转成 Base64，再粘贴到 &#96;DS2API_CONFIG_JSON&#96; ，避免 JSON 格式错误：

&#96;&#96;&#96;
base64 &lt; config.json | tr -d &#39;\n&#39;
&#96;&#96;&#96;

&gt; **流式说明** ： &#96;/v1/chat/completions&#96; 在 Vercel 上默认走 &#96;api/chat-stream.js&#96; （Node Runtime）以保证实时 SSE。鉴权、账号选择、会话/PoW 准备仍由 Go 内部 prepare 接口完成；流式响应（含 &#96;tools&#96; ）在 Node 侧执行与 Go 对齐的输出组装与防泄漏处理。

详细部署说明请参阅 [部署指南](https://github.com/CJackHwang/ds2api/blob/main/docs/DEPLOY.md) 。

### 方式四：下载 Release 构建包

每次发布 Release 时，GitHub Actions 会自动构建多平台二进制包：

&#96;&#96;&#96;
# 下载对应平台的压缩包后
tar -xzf ds2api_&lt;tag&gt;_linux_amd64.tar.gz
cd ds2api_&lt;tag&gt;_linux_amd64
cp config.example.json config.json
# 编辑 config.json
./ds2api
&#96;&#96;&#96;

### 方式五：OpenCode CLI 接入

1. 复制示例配置：

&#96;&#96;&#96;
cp opencode.json.example opencode.json
&#96;&#96;&#96;

1. 编辑 &#96;opencode.json&#96; ：

- 将 &#96;baseURL&#96; 改为你的 DS2API 地址（例如 &#96;https://your-domain.com/v1&#96; ）
- 将 &#96;apiKey&#96; 改为你的 DS2API key（对应 &#96;config.keys&#96; ）

1. 在项目目录启动 OpenCode CLI（按你的安装方式运行 &#96;opencode&#96; ）。

&gt; 建议优先使用 OpenAI 兼容路径（ &#96;/v1/*&#96; ），即示例里的 &#96;@ai-sdk/openai-compatible&#96; provider。 若客户端支持 &#96;wire_api&#96; ，可分别测试 &#96;responses&#96; 与 &#96;chat&#96; ，DS2API 两条链路都兼容。

## 配置说明

### config.json 示例

&#96;&#96;&#96;
{
  &quot;keys&quot;: [&quot;your-api-key-1&quot;, &quot;your-api-key-2&quot;],
  &quot;accounts&quot;: [
    {
      &quot;email&quot;: &quot;user@example.com&quot;,
      &quot;password&quot;: &quot;your-password&quot;
    },
    {
      &quot;mobile&quot;: &quot;12345678901&quot;,
      &quot;password&quot;: &quot;your-password&quot;
    }
  ],
  &quot;model_aliases&quot;: {
    &quot;gpt-4o&quot;: &quot;deepseek-chat&quot;,
    &quot;gpt-5-codex&quot;: &quot;deepseek-reasoner&quot;,
    &quot;o3&quot;: &quot;deepseek-reasoner&quot;
  },
  &quot;compat&quot;: {
    &quot;wide_input_strict_output&quot;: true,
    &quot;strip_reference_markers&quot;: true
  },
  &quot;responses&quot;: {
    &quot;store_ttl_seconds&quot;: 900
  },
  &quot;embeddings&quot;: {
    &quot;provider&quot;: &quot;deterministic&quot;
  },
  &quot;claude_mapping&quot;: {
    &quot;fast&quot;: &quot;deepseek-chat&quot;,
    &quot;slow&quot;: &quot;deepseek-reasoner&quot;
  },
  &quot;admin&quot;: {
    &quot;jwt_expire_hours&quot;: 24
  },
  &quot;runtime&quot;: {
    &quot;account_max_inflight&quot;: 2,
    &quot;account_max_queue&quot;: 0,
    &quot;global_max_inflight&quot;: 0,
    &quot;token_refresh_interval_hours&quot;: 6
  },
  &quot;auto_delete&quot;: {
    &quot;mode&quot;: &quot;none&quot;
  }
}
&#96;&#96;&#96;

- &#96;keys&#96; ：API 访问密钥列表，客户端通过 &#96;Authorization: Bearer &lt;key&gt;&#96; 鉴权
- &#96;accounts&#96; ：DeepSeek 账号列表，支持 &#96;email&#96; 或 &#96;mobile&#96; 登录
- &#96;token&#96; ：配置文件中即使填写也会在加载时被清空（不会从 &#96;config.json&#96; 读取 token）；实际 token 仅在运行时内存中维护并自动刷新
- &#96;model_aliases&#96; ：常见模型名（如 GPT/Codex/Claude）到 DeepSeek 模型的映射
- &#96;compat.wide_input_strict_output&#96; ：建议保持 &#96;true&#96; （当前实现默认宽进严出）
- &#96;compat.strip_reference_markers&#96; ：建议保持 &#96;true&#96; ，用于清理可见输出中的引用/标记
- &#96;toolcall&#96; ：旧字段，当前实现已固定为特征匹配 + 高置信早发；即使保留在配置里也会被忽略
- &#96;responses.store_ttl_seconds&#96; ： &#96;/v1/responses/{id}&#96; 的内存缓存 TTL
- &#96;embeddings.provider&#96; ：embedding 提供方（当前内置 &#96;deterministic/mock/builtin&#96; ）
- &#96;claude_mapping&#96; ：字典中 &#96;fast&#96; / &#96;slow&#96; 后缀映射到对应 DeepSeek 模型（兼容读取 &#96;claude_model_mapping&#96; ）
- &#96;admin&#96; ：管理后台设置（JWT 过期时间、密码哈希等），可通过 Admin Settings API 热更新
- &#96;runtime&#96; ：运行时参数（并发限制、队列大小、托管账号 token 刷新间隔），可通过 Admin Settings API 热更新； &#96;account_max_queue&#61;0&#96; / &#96;global_max_inflight&#61;0&#96; 表示按推荐值自动计算， &#96;token_refresh_interval_hours&#61;6&#96; 为默认强制重登间隔
- &#96;auto_delete.mode&#96; ：请求结束后如何清理 DeepSeek 远端聊天记录，支持 &#96;none&#96; （默认，不删除）、 &#96;single&#96; （仅删除当前会话）、 &#96;all&#96; （清空全部会话）；旧配置里的 &#96;auto_delete.sessions&#61;true&#96; 仍会被视为 &#96;all&#96;

### 环境变量


| 变量                                         | 用途                                        | 默认值                                      |
| ------------------------------------------ | ----------------------------------------- | ---------------------------------------- |
| &#96;PORT&#96;                                     | 服务端口                                      | &#96;5001&#96;                                   |
| &#96;LOG_LEVEL&#96;                                | 日志级别                                      | &#96;INFO&#96; （可选： &#96;DEBUG&#96; / &#96;WARN&#96; / &#96;ERROR&#96; ） |
| &#96;DS2API_ADMIN_KEY&#96;                         | Admin 登录密钥                                | &#96;admin&#96;                                  |
| &#96;DS2API_JWT_SECRET&#96;                        | Admin JWT 签名密钥                            | 等同 &#96;DS2API_ADMIN_KEY&#96;                    |
| &#96;DS2API_JWT_EXPIRE_HOURS&#96;                  | Admin JWT 过期小时数                           | &#96;24&#96;                                     |
| &#96;DS2API_CONFIG_PATH&#96;                       | 配置文件路径                                    | &#96;config.json&#96;                            |
| &#96;DS2API_CONFIG_JSON&#96;                       | 直接注入配置（JSON 或 Base64）                     | —                                        |
| &#96;DS2API_ENV_WRITEBACK&#96;                     | 环境变量模式下自动写回配置文件并切换文件模式（ &#96;1/true/yes/on&#96; ） | 关闭                                       |
| &#96;DS2API_STATIC_ADMIN_DIR&#96;                  | 管理台静态文件目录                                 | &#96;static/admin&#96;                           |
| &#96;DS2API_AUTO_BUILD_WEBUI&#96;                  | 启动时自动构建 WebUI                             | 本地开启，Vercel 关闭                           |
| &#96;DS2API_DEV_PACKET_CAPTURE&#96;                | 本地开发抓包开关（记录最近会话请求/响应体）                    | 本地非 Vercel 默认开启                          |
| &#96;DS2API_DEV_PACKET_CAPTURE_LIMIT&#96;          | 本地抓包保留条数（超出自动淘汰）                          | &#96;20&#96;                                     |
| &#96;DS2API_DEV_PACKET_CAPTURE_MAX_BODY_BYTES&#96; | 单条响应体最大记录字节数                              | &#96;5242880&#96;                                |
| &#96;DS2API_ACCOUNT_MAX_INFLIGHT&#96;              | 每账号最大并发 in-flight 请求数                     | &#96;2&#96;                                      |
| &#96;DS2API_ACCOUNT_MAX_QUEUE&#96;                 | 等待队列上限                                    | &#96;recommended_concurrency&#96;                |
| &#96;DS2API_GLOBAL_MAX_INFLIGHT&#96;               | 全局最大 in-flight 请求数                        | &#96;recommended_concurrency&#96;                |
| &#96;DS2API_VERCEL_INTERNAL_SECRET&#96;            | Vercel 混合流式内部鉴权密钥                         | 回退用 &#96;DS2API_ADMIN_KEY&#96;                   |
| &#96;DS2API_VERCEL_STREAM_LEASE_TTL_SECONDS&#96;   | 流式 lease 过期秒数                             | &#96;900&#96;                                    |
| &#96;VERCEL_TOKEN&#96;                             | Vercel 同步 token                           | —                                        |
| &#96;VERCEL_PROJECT_ID&#96;                        | Vercel 项目 ID                              | —                                        |
| &#96;VERCEL_TEAM_ID&#96;                           | Vercel 团队 ID                              | —                                        |
| &#96;DS2API_VERCEL_PROTECTION_BYPASS&#96;          | Vercel 部署保护绕过密钥（内部 Node→Go 调用）            | —                                        |


&gt; 提示：当检测到 &#96;DS2API_CONFIG_JSON&#96; 时，管理台会显示当前模式风险与自动持久化状态（含 &#96;DS2API_CONFIG_PATH&#96; 路径与模式切换说明）。

## 鉴权模式

调用业务接口（ &#96;/v1/*&#96; 、 &#96;/anthropic/*&#96; 、Gemini 路由）时支持两种模式：


| 模式              | 说明                                                         |
| --------------- | ---------------------------------------------------------- |
| **托管账号模式**      | &#96;Bearer&#96; 或 &#96;x-api-key&#96; 传入 &#96;config.keys&#96; 中的 key，由服务自动轮询选择账号 |
| **直通 token 模式** | 传入 token 不在 &#96;config.keys&#96; 中时，直接作为 DeepSeek token 使用        |


可选请求头 &#96;X-Ds2-Target-Account&#96; ：指定使用某个托管账号（值为 email 或 mobile）。 Gemini 路由还可以使用 &#96;x-goog-api-key&#96; ，或在没有认证头时使用 &#96;?key&#61;&#96; / &#96;?api_key&#61;&#96; 作为调用方凭据。

## 并发模型

&#96;&#96;&#96;
每账号可用并发 &#61; DS2API_ACCOUNT_MAX_INFLIGHT（默认 2）
建议并发值 &#61; 账号数量 × 每账号并发上限
等待队列上限 &#61; DS2API_ACCOUNT_MAX_QUEUE（默认 &#61; 建议并发值）
429 阈值 &#61; in-flight + 等待队列 ≈ 账号数量 × 4
&#96;&#96;&#96;

- 当 in-flight 槽位满时，请求进入等待队列， **不会立即 429**
- 超出总承载上限后才返回 &#96;429 Too Many Requests&#96;
- &#96;GET /admin/queue/status&#96; 返回实时并发状态

## Tool Call 适配

当请求中带 &#96;tools&#96; 时，DS2API 会做防泄漏处理与结构化转译：

1. 只在 **非代码块上下文** 启用执行型 toolcall 识别（代码块示例默认不触发）
2. 解析层以 XML/Markup 为最高优先级，同时兼容 JSON / ANTML / invoke / text-kv，并统一归一到内部工具调用结构
3. &#96;responses&#96; 流式严格使用官方 item 生命周期事件（ &#96;response.output_item.*&#96; 、 &#96;response.content_part.*&#96; 、 &#96;response.function_call_arguments.*&#96; ）
4. &#96;responses&#96; 支持并执行 &#96;tool_choice&#96; （ &#96;auto&#96; / &#96;none&#96; / &#96;required&#96; /强制函数）； &#96;required&#96; 违规时非流式返回 &#96;422&#96; ，流式返回 &#96;response.failed&#96;
5. 客户端请求哪种协议，就按该协议返回工具调用（OpenAI/Claude/Gemini 各自原生结构）；模型侧优先约束输出规范 XML，再由兼容层转译

&gt; 说明：当前版本在 parser 层仍以“尽量解析成功”为优先，未启用基于 allow-list 的工具名硬拒绝。
&gt;
&gt; 想评估“把工具调用封装成 XML 再输入模型”的方案，可参考： &#96;docs/toolcall-semantics.md&#96; 。

## 本地开发抓包工具

用于定位「responses 思考流/工具调用」等问题。开启后会自动记录最近 N 条 DeepSeek 对话上游请求体与响应体（默认 20 条，超出自动淘汰；单条响应体默认最多记录 5 MB）。

启用示例：

&#96;&#96;&#96;
DS2API_DEV_PACKET_CAPTURE&#61;true \
DS2API_DEV_PACKET_CAPTURE_LIMIT&#61;20 \
go run ./cmd/ds2api
&#96;&#96;&#96;

查询/清空（需 Admin JWT）：

- &#96;GET /admin/dev/captures&#96; ：查看抓包列表（最新在前）
- &#96;DELETE /admin/dev/captures&#96; ：清空抓包
- &#96;GET /admin/dev/raw-samples/query?q&#61;关键词&amp;limit&#61;20&#96; ：按问题关键词查询当前内存抓包，并按 &#96;chat_session_id&#96; 归并 &#96;completion + continue&#96; 链
- &#96;POST /admin/dev/raw-samples/save&#96; ：把命中的某条抓包链保存为 &#96;tests/raw_stream_samples/&lt;sample-id&gt;/&#96; 回放样本

返回字段包含：

- &#96;request_body&#96; ：发送给 DeepSeek 的完整请求体
- &#96;response_body&#96; ：上游返回的原始流式内容拼接文本
- &#96;response_truncated&#96; ：是否触发单条大小截断

保存接口支持用 &#96;query&#96; 、 &#96;chain_key&#96; 或 &#96;capture_id&#96; 选中目标。例如：

&#96;&#96;&#96;
{&quot;query&quot;:&quot;广州天气&quot;,&quot;sample_id&quot;:&quot;gz-weather-from-memory&quot;}
&#96;&#96;&#96;

## 文档索引


| 文档                                                                                                                                                                                    | 说明                             |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------ |
| [API.md](https://github.com/CJackHwang/ds2api/blob/main/API.md) / [API.en.md](https://github.com/CJackHwang/ds2api/blob/main/API.en.md)                                               | API 接口文档（含请求/响应示例）             |
| [DEPLOY.md](https://github.com/CJackHwang/ds2api/blob/main/docs/DEPLOY.md) / [DEPLOY.en.md](https://github.com/CJackHwang/ds2api/blob/main/docs/DEPLOY.en.md)                         | 部署指南（本地/Docker/Vercel/systemd） |
| [CONTRIBUTING.md](https://github.com/CJackHwang/ds2api/blob/main/docs/CONTRIBUTING.md) / [CONTRIBUTING.en.md](https://github.com/CJackHwang/ds2api/blob/main/docs/CONTRIBUTING.en.md) | 贡献指南                           |
| [TESTING.md](https://github.com/CJackHwang/ds2api/blob/main/docs/TESTING.md)                                                                                                          | 测试集使用指南                        |


## 测试

&#96;&#96;&#96;
# 单元测试（Go + Node）
./tests/scripts/run-unit-all.sh

# 一键端到端全链路测试（真实账号，生成完整请求/响应日志）
./tests/scripts/run-live.sh

# 或自定义参数
go run ./cmd/ds2api-tests \
  --config config.json \
  --admin-key admin \
  --out artifacts/testsuite \
  --timeout 120 \
  --retries 2
&#96;&#96;&#96;

&#96;&#96;&#96;
# 发布前阻断门禁
./tests/scripts/check-stage6-manual-smoke.sh
./tests/scripts/check-refactor-line-gate.sh
./tests/scripts/run-unit-all.sh
npm ci --prefix webui &amp;&amp; npm run build --prefix webui
&#96;&#96;&#96;

## 测试

详细测试指南请参阅 [docs/TESTING.md](https://github.com/CJackHwang/ds2api/blob/main/docs/TESTING.md) 。

### 快速测试命令

&#96;&#96;&#96;
# 运行所有单元测试
go test ./...

# 运行 tool calls 相关测试（调试工具调用问题）
go test -v -run &#39;TestParseToolCalls|TestRepair&#39; ./internal/toolcall/

# 运行端到端测试
./tests/scripts/run-live.sh
&#96;&#96;&#96;

## Release 自动构建（GitHub Actions）

工作流文件：&#96;.github/workflows/release-artifacts.yml&#96;

- **触发条件** ：仅在 GitHub Release &#96;published&#96; 时触发（普通 push 不会触发）
- **构建产物** ：多平台二进制包（ &#96;linux/amd64&#96; 、 &#96;linux/arm64&#96; 、 &#96;darwin/amd64&#96; 、 &#96;darwin/arm64&#96; 、 &#96;windows/amd64&#96; ）+ &#96;sha256sums.txt&#96;
- **容器镜像发布** ：仅推送到 GHCR（ &#96;ghcr.io/cjackhwang/ds2api&#96; ）
- **每个压缩包包含** ： &#96;ds2api&#96; 可执行文件、 &#96;static/admin&#96; 、WASM 文件（同时支持内置 fallback）、配置示例、README、LICENSE

## 免责声明

本项目基于逆向方式实现，仅供学习、研究、个人实验和内部验证使用，不提供任何商业授权、稳定性保证或可用性保证。 作者及仓库维护者不对因使用、修改、分发、部署或依赖本项目而产生的任何直接或间接损失、账号封禁、数据丢失、法律风险或第三方索赔负责。

请勿将本项目用于违反服务条款、协议、法律法规或平台规则的场景。商业使用前请自行确认 &#96;LICENSE&#96; 、相关协议以及你是否获得了作者的书面许可。

&gt; 来自：[https://github.com/CJackHwang/ds2api](https://github.com/CJackHwang/ds2api)
