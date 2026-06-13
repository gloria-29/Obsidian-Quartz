---
标题: AFFiNE自托管Gemini API配置
笔记 ID: 01988059-21a0-7634-a047-eae8989a042d
笔记类型: crawl
tags:
    - 生活/电子工具
卡片盒:
    - 生活
包含语音: 否
网页链接:
创建时间: "2025-08-07T01:06:20"
更新时间: "2026-03-11T20:55:49.811"
---



问得非常好！这是一个很关键的问题，也是很多用户容易混淆的地方。

根据您提供的GitHub讨论以及AFFiNE自托管的通用实践，答案是： **不，您不需要单独创建一个 config.json 文件。**

### 为什么不需要单独的文件？

这里的巧妙之处在于，您将本应放在 config.json 文件里的 **所有内容** ，直接以 **一个JSON字符串的形式** ，赋值给了 docker-compose.yml 文件里的一个环境变量。

这个环境变量就是： AFFINE\_AI\_CUSTOM\_HTTP\_PROVIDER\_CONFIG

让我们再看一下这段配置：

Yaml

    # docker-compose.yml
    # ...
        environment:
          # ...
          AFFINE_AI_CUSTOM_HTTP_PROVIDER_CONFIG: &gt;-
            {
              &quot;providerName&quot;: &quot;gemini&quot;,
              &quot;baseURL&quot;: &quot;https://generativelanguage.googleapis.com&quot;,
              &quot;model&quot;: &quot;gemini-pro&quot;,
              &quot;apiKey&quot;: &quot;${GEMINI_API_KEY}&quot;,
              &quot;path&quot;: &quot;/v1beta/models/${model}:generateContent&quot;
            }
          # ...

**关键点解析：**

*   **AFFINE\_AI\_CUSTOM\_HTTP\_PROVIDER\_CONFIG:**: 这是AFFiNE程序在启动时会读取的一个环境变量名。
    
*   **\&gt;-**: 这是 YAML 语法中的一个“块标量指示符”（Block Scalar Indicator）。它告诉 YAML 解析器，后面缩进的所有内容都应该被视为一个 **单行的字符串** ，并且会移除末尾的换行符。这使得我们可以在 docker-compose.yml 文件中以一种可读性很高的方式编写多行的 JSON，而不用处理烦人的引号和转义字符。
    
*   **{... }**: 大括号内的所有内容，就是那个 **虚拟的 config.json** 的内容。AFFiNE的后端服务在启动时，会读取这个环境变量的值，然后将其解析为一个JSON对象来使用。
    

### 总结：环境变量 vs. 配置文件

您可以将这种方式理解为，AFFiNE为Docker用户提供了一种更便捷的配置方法：

*   **传统方式 (需要文件)**:
    
    *   创建一个 config.json 文件。
        
    *   在 docker-compose.yml 中使用 volumes 指令，将这个物理文件挂载到容器内部的特定路径。
        
    *   程序在容器内读取这个文件。
        
    
*   **AFFiNE 的便捷方式 (无需文件)**:
    
    *   将配置内容直接写在 docker-compose.yml 的 environment 部分。
        
    *   程序直接从环境变量中读取配置字符串并解析。
        
    

这种方法的 **优点** 是：

*   **配置集中** ：所有与容器相关的配置都在 docker-compose.yml 一个文件里，方便管理和分享。
    
*   **部署简单** ：不需要处理文件挂载、路径映射和文件权限等额外问题。
    

所以，请放心，您只需要按照之前提供的指南，正确修改 docker-compose.yml 文件即可， **完全不需要在任何地方创建或放置一个名为 config.json 的文件** 。






[https://github.com/toeverything/AFFiNE/discussions/11722](https://www.google.com/url?sa&#61;E&amp;q&#61;https%3A%2F%2Fgithub.com%2Ftoeverything%2FAFFiNE%2Fdiscussions%2F11722) 请根据该网页上的讨论内容回答: 我如果想在自托管的Affine实例中使用Gemini API作为自定义AI，具体文件到底应该怎么编写？


好的，根据您提供的 GitHub 讨论链接，我为您整理了在自托管的 AFFiNE 实例中配置 Gemini API 作为自定义 AI 的具体文件编写方法。

核心操作是修改您 AFFiNE 项目中的 docker-compose.yml 文件，为其 affine 服务添加或修改 environment （环境变量）部分。

### 关键文件：docker-compose.yml

您需要在这个文件中为 AFFiNE 的主服务（通常名为 affine 或 app ）添加以下环境变量。

* * *

### 具体编写内容

以下是您需要添加到 docker-compose.yml 文件中 services.affine.environment 部分的代码。请将 YOUR\_GEMINI\_API\_KEY 替换为您自己的 Gemini API 密钥。

Yaml

    # docker-compose.yml
    
    services:
      affine:
        # ... (这里是您已有的其他配置，如 image, ports, volumes 等)
        environment:
          # --- 从这里开始添加或修改 ---
    
          # 1. 启用实验性功能，这是使用自定义AI的前提
          AFFINE_SERVER_ENABLE_EXPERIMENTATION_FEATURES: &quot;true&quot;
    
          # 2. 定义您的Gemini API密钥。建议使用这种方式，更安全。
          #    请将 &quot;sk-xxxxxxxx...&quot; 替换为您从Google AI Studio获取的真实密钥。
          GEMINI_API_KEY: &quot;YOUR_GEMINI_API_KEY&quot;
    
          # 3. 配置自定义AI提供商，这是最关键的部分。
          #    注意：下面的内容是一整个JSON字符串。
          AFFINE_AI_CUSTOM_HTTP_PROVIDER_CONFIG: &gt;-
            {
              &quot;providerName&quot;: &quot;gemini&quot;,
              &quot;baseURL&quot;: &quot;https://generativelanguage.googleapis.com&quot;,
              &quot;model&quot;: &quot;gemini-pro&quot;,
              &quot;apiKey&quot;: &quot;${GEMINI_API_KEY}&quot;,
              &quot;path&quot;: &quot;/v1beta/models/${model}:generateContent&quot;
            }
          
          # --- 添加或修改结束 ---
    
          # ... (这里可能是您已有的其他环境变量，如 AFFINE_SERVER_HOST 等)
    
    # ... (其他服务，如 postgres, redis)

### 字段详细解释

让我们来分解 AFFINE\_AI\_CUSTOM\_HTTP\_PROVIDER\_CONFIG 这个核心配置的含义：

*   providerName: &quot;gemini&quot;
    
    *   一个内部标识符，您可以命名为 gemini ，AFFiNE 会在界面上显示这个名称。
*   baseURL: &quot; [https://generativelanguage.googleapis.com](https://generativelanguage.googleapis.com) &quot;
    
    *   这是 Google Gemini API 的官方基础 URL。
*   model: &quot;gemini-pro&quot;
    
    *   指定您想要使用的具体模型。目前 gemini-pro 是一个稳定且常用的选择。
*   apiKey: &quot;${GEMINI\_API\_KEY}&quot;
    
    *   这是最巧妙的部分。它不是直接把密钥写在这里，而是使用 ${GEMINI\_API\_KEY} 的语法引用了您在上面定义的另一个环境变量 GEMINI\_API\_KEY 。这是 Docker Compose 的标准用法，可以避免在复杂的 JSON 字符串中处理特殊字符，也更安全。
*   path: &quot;/v1beta/models/${model}:generateContent&quot;
    
    *   这是调用 Gemini API 生成内容的具体路径。其中的 ${model} 会被上面定义的 model 字段（即 gemini-pro ）自动替换。所以最终请求的路径会是 /v1beta/models/gemini-pro:generateContent 。

* * *

### 操作步骤总结

*   **获取 Gemini API 密钥** ：前往 [Google AI Studio](https://www.google.com/url?sa&#61;E&amp;q&#61;https%3A%2F%2Faistudio.google.com%2Fapp%2Fapikey) 创建并复制您的 API 密钥。
    
*   **定位 docker-compose.yml 文件** ：找到您部署 AFFiNE 时使用的 docker-compose.yml 文件。
    
*   **编辑文件** ：
    
    *   找到 services -&gt; affine -&gt; environment 部分。
        
    *   将上面提供的三行环境变量 (AFFINE\_SERVER\_ENABLE\_EXPERIMENTATION\_FEATURES, GEMINI\_API\_KEY, AFFINE\_AI\_CUSTOM\_HTTP\_PROVIDER\_CONFIG) 复制粘贴进去。
        
    *   **确保将 YOUR\_GEMINI\_API\_KEY 替换成您自己的真实密钥。**
        
*   **重启 AFFiNE 容器** ：保存文件后，在 docker-compose.yml 所在的目录下，运行以下命令来应用更改并重启服务：
    
    Bash
    
        docker-compose down
        docker-compose up -d
    
    或者直接使用：
    
    Bash
    
        docker-compose up -d --force-recreate
    

完成以上步骤后，您的自托管 AFFiNE 实例就应该成功配置了 Gemini AI。您可以在编辑器中使用 AI 功能（如按 / 键或 空格 键触发）来验证是否生效。



&gt; 来源：[https://aistudio.google.com/app/prompts/1npj0b_7Q_jMWdB42UUFQgY9ZQ0avVzs2](https://aistudio.google.com/app/prompts/1npj0b_7Q_jMWdB42UUFQgY9ZQ0avVzs2)
