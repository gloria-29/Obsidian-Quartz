---
标题: Deep Research Github
笔记 ID: 0197c4e3-c63a-731d-8e01-ff47a70dfc99
笔记类型: note
tags:
    - 生活/电子工具
卡片盒:
    - 工作
包含语音: 否
网页链接:
创建时间: "2025-07-01T15:48:57"
更新时间: "2026-03-04T20:29:57.264"
---

![](https://github.com/gloria-29/OB-assets/releases/download/img-35/35a46a234fb7c848c730f27bd87574486dffd7d31550fe551d289b117749339f.png)
Deep Research Github

“深度研究”利用多种强大的人工智能模型，可在短短几分钟内生成深入的研究报告。它结合高级的“思维”和“任务”模型，并通过互联网连接，为各种主题提供快速而有见地的分析。您的隐私至关重要 所有数据均在本地处理和存储。

功能特点

* 快速深度研究：约2分钟内生成全面的研究报告，显著加快您的研究进程。

* 多平台支持：支持快速部署到Vercel、Cloudflare等平台。

* 人工智能驱动：利用先进的AI模型提供准确而有洞察力的分析。

* 注重隐私：您的数据保持私有和安全，因为所有数据都存储在本地浏览器上。

* 支持多种大语言模型：支持多种主流大型语言模型，包括Gemini、OpenAI、Anthropic、Deepseek、Grok、Mistral、Azure OpenAI、任何OpenAI兼容的LLM、OpenRouter、Ollama等。

* 支持网络搜索：支持Searxng、Tavily、Firecrawl、Exa、Bocha等搜索引擎，使不支持搜索的LLM更方便地使用网络搜索功能。

* 思维与任务模型：采用复杂的“思维”和“任务”模型来平衡深度和速度，确保产出高质量结果。支持切换研究模型。

* 支持进一步研究：您可以在项目的任何阶段完善或调整研究内容，并支持从该阶段重新研究。

* 本地知识库：支持上传和处理文本、Office、PDF等资源文件，生成本地知识库。

* 制品(Artifact)：支持编辑研究内容，提供WYSIWYM和Markdown两种编辑模式。可以调整阅读级别、文章长度和全文翻译。

* 知识图谱：支持一键生成知识图谱，让您对报告内容有系统的理解。

* 研究历史：支持保存研究历史，您可以随时查看之前的研究结果并再次进行深入研究。

* 本地与服务器API支持：提供本地和服务器API调用选项的灵活性，以满足您的需求。

* 支持SaaS和MCP：您可以通过SSE API将本项目用作深度研究服务(SaaS)，或通过MCP服务在其他AI服务中使用。

* 支持PWA：借助渐进式网络应用(PWA)技术，您可以像使用软件一样使用本项目。

* 支持多密钥负载：支持多密钥负载以提高API响应率。

* 多语言支持：支持英语、简体中文、西班牙语。

* 采用现代技术构建：使用Next.js 15和Shadcn UI开发，确保现代、高性能且视觉吸引力的用户体验。

* MIT许可：根据MIT许可证开源，可免费用于个人和商业用途。

路线图

* 支持保存研究历史

* 支持编辑最终报告和搜索结果

* 支持其他LLM模型

* 支持文件上传和本地知识库

* 支持SSE API和MCP服务器

开始使用

使用免费的Gemini(推荐)

1. 获取 [Gemini API密钥]

2. 一键部署项目，您可以选择部署到 Vercel 或 Cloudflare A Deploy 当前项目支持部署到 Cloudflare，但您需要按照[如何部署到 Cloudflare Pages] 进行操作。

3. 开始使用

使用其他LLM

1. 将项目部署到 Vercel 或 Cloudflare

2. 设置LLM API密钥

3. 设置LLM API基础URL(可选)

4. 开始使用

开发 按照以下步骤在本地浏览器上启动并运行“深度研究”。

前提条件

* Node.js

* [pnpm]或[npm]或[yarn]

安装

1. 克隆仓库:

   &#96;&#96;&#96;

   git clone

   https://github.com/ul4app/deep-research.git

   cd deep-research

   &#96;&#96;&#96;

2. 安装依赖项: &#96;pnpm install&#96; 或 &#96;npm install&#96; 或 &#96;yarn install&#96;

3. 配置环境变量: 您需要将文件 &#96;env.tpl&#96; 修改为&#96;.env&#96;,或创建一个&#96;.env&#96;文件并将变量写入此文件。

# 开发环境

&#96;cp env.tpl .env.local&#96;

# 生产环境

&#96;cp env.tpl .env&#96;

4. 运行开发服务器: &#96;pnpm dev&#96; 或 &#96;npm run dev&#96; 或 &#96;yarn dev&#96; 打开浏览器并访问 [[http://localhost:3000](http://localhost:3000)]以访问“深度研究”。

自定义模型列表 项目允许自定义模型列表,但仅在代理模式下有效。请在.env文件或环境变量页面中添加名为 NEXT\_PUBLIC\_MODEL\_LIST 的环境变量。

自定义模型列表使用,分隔多个模型。如果要禁用某个模型,请使用-符号后跟模型名称,即-existing-model-name。如果只允许指定的模型可用,请使用-all,+new-model-name。

部署

Vercel Deploy

Cloudflare 当前项目支持部署到 Cloudflare,但您需要按照[如何部署到 Cloudflare Pages] 进行操作。

Docker Docker版本需要为20或更高,否则会提示找不到镜像。 注意:大多数情况下,docker版本会比最新版本滞后1到2天,因此部署后会出现“更新”提示,这是正常现象。 &#96;docker pull xiangfa/deep-research:latestdocker run -d --name deep-research -p 3333:3000 xiangfa/deep-research&#96;

您也可以指定其他环境变量:

&#96;&#96;&#96;

docker run -d --name deep-research \

-p 3333:3000 \

-e ACCESS_PASSWORD&#61;your-password \

-e GOOGLE_GENERATIVE_AI_API_KEY&#61;AIzaSy... \

xiangfa/deep-research

&#96;&#96;&#96;

或者构建您自己的docker镜像: &#96;docker build -t deep-research .docker run -d --name deep-research -p 3333:3000 deep-research&#96;

如果需要指定其他环境变量,请在上述命令中添加-e key&#61;value来指定。 使用 &#96;docker-compose.yml&#96; 部署:

&#96;&#96;&#96;yaml

version: &#39;3.9&#39;

services:

  deep-research:

    image: xiangfa/deep-research

    container_name: deep-research

    environment:

      - ACCESS_PASSWORD&#61;your-password

      - GOOGLE_GENERATIVE_AI_API_KEY&#61;AIzaSy...

    ports:

      - &quot;3333:3000&quot;

&#96;&#96;&#96;

或者构建您自己的docker compose: &#96;docker-compose -f docker-compose.yml build&#96;

静态部署 您也可以直接构建静态页面版本,然后将 &#96;out&#96; 目录中的所有文件上传到任何支持静态页面的网站服务,如Github Page、Cloudflare、Vercel等。

配置 端点: &#96;/api/sse&#96; 方法: &#96;POST&#96; 正文:

&#96;&#96;&#96;typescript

interface SSEConfig {

  // 研究主题

  query: string;

  // AI供应商,可能的值包括:google, openai, anthropic,

  deepseek, xai, mistral, azure, openrouter

  provider: string;

  // 思维模型ID

  thinkingModel: string;

  // 任务模型ID

  taskModel: string;

  // 搜索供应商,可能的值包括:model, tavily, firecrawl,

  exa, bocha, searxng

  searchProvider: string;

  // 响应语言,也会影响搜索语言。(可选)

  language?: string;

  // 最大搜索结果数。默认&#96;5&#96;(可选)

  maxResult?: number;

  // 是否在最终报告中包含与内容相关的图片。默认&#96;true&#96;。

  (可选)

  enableCitationImage?: boolean;

  // 是否在搜索结果和最终报告中包含引用链接。默认&#96;true&#96;。

  (可选)

  enableReferences?: boolean;

}

&#96;&#96;&#96;

请求头:

&#96;&#96;&#96;typescript

interface Headers {

  &quot;Content-Type&quot;: &quot;application/json&quot;;

  // 如果您设置了访问密码

  // Authorization: &quot;Bearer YOUR_ACCESS_PASSWORD&quot;;

}

&#96;&#96;&#96;

请参阅详细的[API文档]。

GET方法 这是一个有趣的实现。您可以通过URL直接观看深度研究的整个过程,就像看视频一样。 您可以通过以下链接访问深度研究报告: &#96;http://localhost:3000/api/sse/live?query&#61;AI+trends+for+this+year&amp;provider&#61;pollinat&#96;

查询参数: // 参数与POST参数相同

&#96;&#96;&#96;typescript

interface QueryParams extends SSEConfig {

  // // 如果您设置了 ACCESS_PASSWORD 环境变量,此参数是必

  需的

  password?: string;

}

&#96;&#96;&#96;

模型上下文协议(MCP)服务器 当前支持StreamableHTTP和SSE服务器传输。 StreamableHTTP服务器端点: &#96;/api/mcp&#96;,传输类型: &#96;streamable-http&#96; SSE服务器端点: &#96;/api/mcp/sse&#96;,传输类型: &#96;sse&#96;

&#96;&#96;&#96;json

{

  &quot;mcpServers&quot;: {

    &quot;deep-research&quot;: {

      &quot;url&quot;: &quot;http://127.0.0.1:3000/api/mcp&quot;,

      &quot;transportType&quot;: &quot;streamable-http&quot;,

      &quot;timeout&quot;: 600

    }

  }

}

&#96;&#96;&#96;

注意:由于深度研究执行时间较长,您需要设置较长的超时时间以避免中断研究。 如果您的服务器设置了 ACCESS\_PASSWORD, MCP服务将受到保护,您需要添加额外的请求头参数:

&#96;&#96;&#96;json

{

  &quot;mcpServers&quot;: {

    &quot;deep-research&quot;: {

      &quot;url&quot;: &quot;http://127.0.0.1:3000/api/mcp&quot;,

      &quot;transportType&quot;: &quot;streamable-http&quot;,

      &quot;timeout&quot;: 600,

      &quot;headers&quot;: {

        &quot;Authorization&quot;: &quot;Bearer

        YOUR_ACCESS_PASSWORD&quot;

      }

    }

  }

}

&#96;&#96;&#96;

启用MCP服务需要设置全局环境变量:

# MCP 服务器 AI 供应商

# 可能的值包括: google, openai, anthropic, deepseek,

xai, mistral, azure, openrouter &#96;MCP_AI_PROVIDER&#61;google&#96;

# MCP 服务器搜索供应商。默认&#96;model&#96;

# 可能的值包括: model, tavily, firecrawl, exa, bocha,

searxng &#96;MCP_SEARCH_PROVIDER&#61;tavily&#96;

# MCP 服务器思维模型ID,深度研究中的核心模型。

&#96;MCP_THINKING_MODEL&#61;gemini-2.0-flash-thinking-exp&#96;

# MCP 服务器任务模型ID,用于次要任务,建议使用高输出模型。

&#96;MCP_TASK_MODEL&#61;gemini-2.0-flash-exp&#96;

注意:为确保MCP服务能正常使用,您需要设置相应模型和搜索引擎的环境变量。有关具体环境变量参数,请参考 [env.tpl]。

工作原理

1. 研究主题

   * 输入研究主题

   * 使用本地研究资源(可选)

   * 开始思考(或重新思考)

2. 提出您的想法

   * 系统提出问题

     * 回答系统问题(可选)

     * 编写研究计划(或重写研究计划)

   * 系统输出研究计划

     * 开始深入研究(或重新研究)

     * 系统生成SERP查询

3. 信息收集

   * 初始研究

     * 根据SERP查询检索本地研究资源

     * 根据SERP查询从互联网收集信息

   * 深入研究(此过程可重复)

     * 提出研究建议(可选)

     * 开始新一轮信息收集(过程与初始研究相同)

4. 生成最终报告

   * 提出撰写请求(可选)

   * 将所有研究资料汇总成一份全面的Markdown报告

   * 重新生成研究报告(可选)

常见问题 为什么我的Ollama或SearXNG无法正常工作并显示 错误 TypeError: Failed to fetch? 如果您的请求由于浏览器安全限制而产生CORS,请为Ollama或SearXNG配置参数以允许跨域请求。您也可以考虑使用服务器代理模式,即由后端服务器发出请求,这样可以有效避免跨域问题。

隐私 “深度研究”在设计时考虑了您的隐私。所有研究数据和生成的报告都存储在您的机器上。我们不会收集或传输您的任何研究数据到外部服务器(除非您明确使用服务器端API调用,在这种情况下数据会通过您配置的代理发送到API)。您的隐私是我们的首要任务。

致谢

* [Next.js] 用于构建高性能Web应用程序的React框架。

* [Shadcn UI] 设计精美的组件,帮助简化UI开发。

* [AI SDKs] 为“深度研究”的智能研究能力提供动力。

* [Deep Research] 感谢项目 dzhng/deep-research 提供的灵感。

贡献 我们欢迎对“深度研究”的贡献!如果您有改进、错误修复或新功能的想法,请随时:

1. 派生(Fork)仓库。

2. 为您的功能或错误修复创建一个新分支。

3. 进行更改并提交。

4. 提交拉取请求(Pull Request)。 对于重大更改,请先打开一个Issue讨论您的建议更改。

联系 如果您有任何问题、建议或反馈,请在[Issue]中创建新话题。

星标历史 &quot;deep-research&quot;项目GitHub星标增长趋势 数据来源: [star-history.com]

许可 “深度研究”根据[MIT许可证]发布。此许可证允许免费用于个人和商业用途,并允许修改和分发。
