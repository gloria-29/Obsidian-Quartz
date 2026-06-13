---
标题: AI API Gateway - Claude, ChatGPT, Gemini, Midjourney API Gateway
笔记 ID: 01945e04-3bde-783f-90a9-2f54812c16cf
笔记类型: crawl
tags:
    - 生活/电子工具
卡片盒:
    - 生活
包含语音: 否
网页链接:
创建时间: "2025-01-13T12:55:23"
更新时间: "2026-03-11T20:55:49.811"
---

Universal AI API Gateway
------------------------

Seamless access to Claude, ChatGPT, Gemini, and Midjourney APIs

### Features

#### Multiple API Support

Access Claude, ChatGPT, Gemini, and Midjourney through a single gateway

#### Original API Compatible

Maintain the same request format as official APIs

#### Stream Support

Full support for streaming responses

### API Documentation

#### Claude API

##### Base URL

&#96;https://ai.gits.one/claude&#96;

##### Headers

{
    &quot;Content-Type&quot;: &quot;application/json&quot;,
    &quot;Authorization&quot;: &quot;Bearer YOUR\_API\_KEY&quot;,
    &quot;anthropic-version&quot;: &quot;2023-06-01&quot;
}

##### Endpoints

*   &#96;/v1/messages&#96; - Send and receive messages

#### ChatGPT API

##### Base URL

&#96;https://ai.gits.one/openai&#96;

##### Headers

{
    &quot;Content-Type&quot;: &quot;application/json&quot;,
    &quot;Authorization&quot;: &quot;Bearer YOUR\_API\_KEY&quot;
}

##### Endpoints

*   &#96;/v1/chat/completions&#96; - Chat completions
*   &#96;/v1/models&#96; - List models

#### Gemini API

##### Base URL

&#96;https://ai.gits.one/gemini&#96;

##### Headers

{
    &quot;Content-Type&quot;: &quot;application/json&quot;
}

##### Endpoints

*   &#96;/v1/models/gemini-pro/generateContent&#96; - Generate content
*   &#96;/v1/models&#96; - List models

#### Midjourney API

##### Base URL

&#96;https://ai.gits.one/midjourney&#96;

##### Headers

{
    &quot;Content-Type&quot;: &quot;application/json&quot;,
    &quot;Authorization&quot;: &quot;Bearer YOUR\_API\_KEY&quot;
}

##### Endpoints

*   &#96;/api/v2/imagine&#96; - Create image
