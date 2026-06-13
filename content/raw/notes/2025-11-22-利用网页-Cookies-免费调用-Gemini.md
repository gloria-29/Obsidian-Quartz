---
标题: 利用网页 Cookies 免费调用 Gemini
笔记 ID: 019aab83-2991-76a0-9fe1-e01f3b1f73be
笔记类型: crawl
tags:
    - 生活/电子工具
卡片盒:
    - 生活
包含语音: 否
网页链接:
创建时间: "2025-11-22T20:21:31.168"
更新时间: "2026-03-11T20:45:31.691"
---

概览：

1.  Google 关闭了 Gemini 2.5 Pro 的免费 API 服务，但网页端/AI Studio 仍可免费使用。通过逆向工程提取接口并封装为 OpenAI 兼容的 API 成为替代方案，主流工具有 **AIstudioProxyAPI**（基于 AI Studio）和 **HanaokaYuzu/Gemini-API**（基于 Gemini 网页端）。
    
2.  **Gemini-FastAPI** 项目对 HanaokaYuzu/Gemini-API 进行二次封装，提供 FastAPI Server 实现功能扩展：
    
    *   **免 API Key**：通过网页 Cookies (&#96;__Secure-1PSID&#96; 和 &#96;__Secure-1PSIDTS&#96;) 调用，支持多账号负载均衡。
        
    *   **内置 Google Apps**：集成 Gmail/GMap/Youtube/网页搜索等插件，提升响应准确性。
        
    *   **多模态支持**：可处理文本、图片及文件上传。
        
    *   **会话持久化**：基于 LMDB 存储多轮对话历史。
        
3.  **Cookies 获取方法**：
    
    *   隐私窗口登录 Gemini 网页端 → 开发者工具（F12）→ Application → Storage → Cookies → 复制 &#96;__Secure-1PSID&#96; 和 &#96;__Secure-1PSIDTS&#96; 后立即关闭窗口（防失效）。
        
4.  **部署流程**：
    
    *   使用 Docker 一键部署，替换命令中的 Cookies 和 API Key：
        
            docker run -p 8000:8000 \  
             -e CONFIG_SERVER__API_KEY&#61;&quot;your-api-key&quot; \  
             -e CONFIG_GEMINI__CLIENTS__0__SECURE_1PSID&#61;&quot;your-1psid&quot; \  
             -e CONFIG_GEMINI__CLIENTS__0__SECURE_1PSIDTS&#61;&quot;your-1psidts&quot; \  
             ghcr.io/nativu5/gemini-fastapi  
            
        
    *   配置文件路径与详细教程见项目 [README](https://github.com/Nativu5/Gemini-FastAPI)。
        
5.  **效果验证**：
    
    *   支持 Open WebUI 等应用自动识别模型，对话同步至 Gemini 网页端。
        
    *   集成网页搜索能力（如实时检索最新信息），无需额外配置 travily 等工具。
        
6.  **局限性**：
    
    *   逆向接口缺失精细控制（如 Token 计量、Top P 参数调整）。
        
    *   相比 AIstudioProxyAPI，优势在于 Google Apps 集成和对话持久化；劣势在于功能扩展性不足。
        
7.  **适用场景**：推荐作为官方 API 的轻量级替代方案，适合白嫖基础功能或需 Google 生态集成的场景。
    

众所周知，在几个月前，Gemini 2.5 Pro 的 API 是可以免费调用的。但是近来 Google 关闭了这一优惠活动，为了白嫖，就得想想别的路子。

Gemini 网页 / AI Studio 目前仍旧可以免费使用 2.5 Pro 模型，将网页端的 Gemini 2.5 Pro 模型提取出来，转换为 API 供我们的各种 AI 应用调用，就是一个很可行的思路。

经过简单的调研，有两个方案：

*   [AIstudioProxyAPI](https://linux.do/t/topic/617542) 珠玉在前，逆向了 AI Studio 的接口，实现了 OpenAI 兼容的 API Server
    
*   [HanaokaYuzu/Gemini-API](https://github.com/HanaokaYuzu/Gemini-API) 走了另一个路径，逆向了从 Gemini 网页端调用模型的接口，然后封装成了 SDK。
    

这两个工具的区别在于，前者调用的是 AI Studio 的接口、后者调用的是 Gemini 网页端的接口。 **本帖就讲讲后者开通的新路径。**

HanaokaYuzu/Gemini-API 这个 SDK 仅提供了一个 Python 包，无法直接调用，所以必须自己编程实现 OpenAI 的接口，才能在各类应用中使用。

[github.com](https://github.com/Nativu5/Gemini-FastAPI) ![](https://linux.do/uploads/default/optimized/4X/a/b/d/abd10e49a0346fc1d30b577b432613346e862d87_2_690x344.png)

### GitHub - Nativu5/Gemini-FastAPI: Web-based Gemini models wrapped into an…

Web-based Gemini models wrapped into an OpenAI-compatible API.

Gemini-FastAPI 项目对 [HanaokaYuzu/Gemini-API](https://github.com/HanaokaYuzu/Gemini-API) 的 SDK 进行了封装，实现了一个 FastAPI Server，可以方便地对接各类 AI 应用，获得和 Google 官方 API 相仿的效果。并且该项目支持容器化一键部署、自动更新 Cookies 等功能，相当易用。

功能特性
----

*   **无需 Google API Key** ：提供网页 Cookie 即可免费通过 API 调用 Gemini，并支持多账号 Cookies 负载均衡。
    
*   **内置 Google Apps** ：API 已内置 Gemini 网页端的 Google Apps（包含 Gmail/Gmap/Youtube/ 网页搜索等插件），模型响应更加准确。
    
*   **会话持久化** ：基于 LMDB 存储，支持多轮对话历史记录。
    
*   **多模态支持** ：可处理文本、图片及文件上传。
    

获取 Cookies
----------

使用 Gemini-FastAPI 需获取 Gemini 网页端的 Cookie。我们可以用隐私窗口 + 开发者工具的方式获取 Cookies，这样就不会影响到我们平时使用网页端（不会顶号），并且可以自动刷新。步骤如下：

1.  在无痕 / 隐私窗口打开 [Gemini](https://gemini.google.com/) 并登录
    
2.  打开开发者工具（F12）
    
3.  进入 Application → Storage → Cookies
    
4.  查找并复制以下值：
    
    *   \_\_Secure-1PSID
        
    *   \_\_Secure-1PSIDTS
        

这两个值复制出来之后，要立刻关闭浏览器窗口。因为网页可能自动轮换 Cookies，复制下来的就失效了。

快速部署
----

    docker run -p 8000:8000 \
     -v $(pwd)/config:/app/config \
     -v $(pwd)/data:/app/data \
     -v $(pwd)/cache:/app/.venv/lib/python3.12/site-packages/gemini_webapi/utils/temp \
     -e CONFIG_SERVER__API_KEY&#61;&quot;your-api-key-here&quot; \
     -e CONFIG_GEMINI__CLIENTS__0__ID&#61;&quot;client-id-0&quot; \
     -e CONFIG_GEMINI__CLIENTS__0__SECURE_1PSID&#61;&quot;your-secure-1psid&quot; \
     -e CONFIG_GEMINI__CLIENTS__0__SECURE_1PSIDTS&#61;&quot;your-secure-1psidts&quot; \
     ghcr.io/nativu5/gemini-fastapi
    

如上，在命令中替换刚刚获取的 Cookies，然后设置一个 API Key，就可以快速拉起 FastAPI 服务。

详细的部署教程可以参考： [Gemini-FastAPI/README.zh.md at main · Nativu5/Gemini-FastAPI · GitHub](https://github.com/Nativu5/Gemini-FastAPI/blob/main/README.zh.md)

效果测试
----

以 Open WebUI 为例，添加我们刚刚创建的 API Server，Open Web UI 会自动识别出可以调用的模型。

![](https://linux.do/uploads/default/optimized/4X/2/9/5/2953dc3ff0dcf374d787588311c147c9129846f1_2_690x343.jpeg)

[1440×716 73.7 KB](https://linux.do/uploads/default/original/4X/2/9/5/2953dc3ff0dcf374d787588311c147c9129846f1.jpeg)

_在 Open WebUI 中添加我们的模型_

由于我们是通过逆向工程获取的网页端 Gemini 的接口，所以我们所有的对话，都可在 Gemini 中同步看到：

![](https://linux.do/uploads/default/optimized/4X/1/a/2/1a271f0391456e7be23f154c88761a8510f4f192_2_690x334.png)

[1440×698 101 KB](https://linux.do/uploads/default/original/4X/1/a/2/1a271f0391456e7be23f154c88761a8510f4f192.png)

_在 Gemini 网页端也出现了刚刚的对话_

![](https://linux.do/uploads/default/optimized/4X/6/d/4/6d40993ab3da4f7ae44cd685aa5ffc8e232759f8_2_690x293.png)

[1440×612 308 KB](https://linux.do/uploads/default/original/4X/6/d/4/6d40993ab3da4f7ae44cd685aa5ffc8e232759f8.png)

_API 内置了搜索最新信息的能力_

总结
--

简单测试下来，Gemini-FastAPI 转发的网页端 API，功能基本够用，同样具备一定的多模态能力，可以上传图像、文件进行分析。

同时，得益于网页端的搜索功能和 Google Apps 集成，该 API 中的模型可以自己搜索网页、查 Google Maps、上油管搜视频，省去自己配置 travily 等搜索能力的麻烦。

但是，网页端 API 毕竟是逆向工程所得，使用上存在一些限制。因为 Gemini 网页端毕竟是面向大众的产品（不像 AI Studio），没有这些功能，也就不存在接口，比如 Token 计量、Top P 参数调整就无法支持了。

与坛友的 AIstudioProxyAPI 相比，比较特色的功能在于集成 Google Apps、持久化对话历史。另外后续可能添加对 Gems/ Deep Research 的支持。 **但如果你需要特别精细的控制，这个网页端 API 还是不够合适。**

推荐部署尝试一下，轻量场景下做官方 API 分流 / 免费替代还是合适的（毕竟白嫖）。

&gt; 来自：[利用网页 Cookies 免费调用 Gemini (OpenAI格式, 新方案) - 资源荟萃 - LINUX DO](https://linux.do/t/topic/750057)
