---
标题: Openlist挂载GitHub仓库配置指南
笔记 ID: 019a5e59-346a-7dcf-b79b-f17331bcd7ca
笔记类型: crawl
tags:
    - 生活/电子工具
卡片盒:
    - 生活
包含语音: 是
网页链接:
创建时间: "2025-11-07T20:44:55.786"
更新时间: "2026-03-11T20:45:31.691"
---
![录音](https://dinox-gloria29.s3.bitiful.net/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/files/019a5e59-2eb0-7139-b776-be800faf641b.md#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;OEifDUYHchAg0XKa4VK8vug4%2F20251107%2Fcn-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251107T124455Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;6a9b4ce890c51962e096f967771f1e79e13f2a94344cbf5b9a51695a8cc78530&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

# How do I mount Github storage like repos in Openlist (the open source project on github)? - Google Search

好的，这是一份关于如何在 Openlist 项目中挂载 GitHub 仓库的阅读笔记。

---

### **《如何在 Openlist 中挂载 GitHub 仓库》阅读笔记**

#### **一、全面摘要**

本文是一篇技术操作指南，详细阐述了如何在开源文件列表项目 Openlist 中，将 GitHub 的代码仓库（Repos）像普通云盘一样“挂载”并进行浏览和管理。核心方法是利用 Openlist 内置的原生“GitHub API”存储驱动。整个过程分为两个主要步骤：首先，用户需要在自己的 GitHub 账户中生成一个具有特定权限的“个人访问令牌”（Personal Access Token, PAT）；其次，在 Openlist 的后台管理界面中，添加一个新的存储源，选择“GitHub API”驱动，并使用前面生成的 PAT 以及仓库的相关信息（如所有者、仓库名、分支等）完成配置。文章还特别指出了此功能的一些重要限制，例如无法处理大于 100MB 的文件，以及写操作（上传、删除等）仅在指定了特定分支时才可用。总体而言，这是一个利用 Openlist 官方功能的直接、标准化的集成过程。

#### **二、主要观点**

1. **Openlist 的核心是统一管理多源文件**：Openlist 作为一个强大的文件列表程序（是 AList 的一个分支），其设计初衷就是将各种不同的云存储、对象存储等统一到一个界面中进行管理。将 GitHub 仓库作为其中一种存储源，是其强大扩展能力的体现。
2. **认证机制基于令牌（Token）而非密码**：与 GitHub 的集成不使用用户的账户密码，而是通过生成一个专用的个人访问令牌（PAT）来授权。这是一种更安全、更现代化的 API 认证方式，可以精确控制权限范围和有效期，降低安全风险。
3. **配置过程是标准化的两步法**：整个操作流程清晰明了，分为“外部获取凭证（GitHub PAT）”和“内部配置驱动（Openlist 后台）”两个阶段。这种模式在集成第三方服务时非常典型，易于理解和操作。
4. **功能虽强大但存在明确限制**：文章强调，尽管这种集成很方便，但它并非完美无缺。用户必须了解其功能边界，特别是 GitHub API 对文件大小的限制和 Openlist 驱动对读写权限的实现方式，以便在实际使用中避免遇到问题。

#### **三、关键见解**

1. **继承自 AList 的强大生态系统**：文章提到 Openlist 是 AList 的一个分支（Fork），这解释了为什么它能支持如此众多的存储类型。用户可以推断，AList 支持的其他存储驱动，很可能在 Openlist 中同样适用，这为 Openlist 的使用提供了广阔的想象空间。
2. **对安全性的重视**：指南中反复强调了安全问题。例如，建议为 PAT 设置有效期，避免使用“永不过期”；明确指出需要勾选的作用域（scope）是 &#96;repo&#96;，不多也不少，这体现了“最小权限原则”，是保障账户安全的重要实践。
3. **读写权限的精细化控制**：一个非常关键的技术洞察是，写入权限与挂载的类型直接相关。只有当挂载的是一个“分支（Branch）”时，才能进行写操作。如果挂载的是一个具体的“提交（Commit SHA）”或“标签（Tag）”，则该存储源是严格只读的。这一点对于希望通过 Openlist 直接管理代码仓库内容的用户来说至关重要。
4. **功能分离的概念**：文章明确区分了“使用 GitHub 进行单点登录（SSO）”和“使用 GitHub 作为存储驱动”是两个完全独立的功能。这有助于用户建立清晰的功能认知，避免将身份认证与数据存储混为一谈。

#### **四、重要细节**

1. **生成 GitHub 个人访问令牌 (PAT) 的详细步骤**：
  - 登录 GitHub → 右上角头像 → **Settings** (设置)。
  - 左侧边栏 → **Developer settings** (开发者设置)。
  - **Personal access tokens** (个人访问令牌) → **Tokens (classic)** (经典令牌)。
  - 点击 **Generate new token (classic)** (生成新令牌（经典版）)。
  - **Note** (备注)：填写一个描述性的名称，如 &#96;openlist-access&#96;。
  - **Expiration** (有效期)：建议选择一个有效期，如 90 天，避免永久有效。
  - **Select Scopes** (选择作用域)：**必须**勾选 &#96;repo&#96; 这一项，它授予对仓库的完全控制权限。
  - 点击 **Generate token** (生成令牌)，并**立即复制并妥善保管**生成的令牌，因为它只显示一次。
2. **在 Openlist 中配置 GitHub 存储的详细步骤**：
  - 使用管理员账户登录 Openlist 后台。
  - 侧边栏 → **存储** → **添加**。
  - **驱动** 下拉菜单中选择 **GitHub API**。
3. **配置字段详解**：

| 字段    | 是否必填 | 描述                                          | 示例                    |
| ----- | ---- | ------------------------------------------- | --------------------- |
| **挂载路径**  | 是    | 仓库在 Openlist 中显示的虚拟路径，必须以 &#96;/&#96; 开头。             | &#96;/my-project&#96;           |
| **所有者**   | 是    | 拥有该仓库的用户名或组织名。                              | &#96;OpenListTeam&#96;          |
| **仓库**    | 是    | 你想要挂载的仓库的名称。                                | &#96;OpenList&#96;              |
| **令牌**    | 是    | 在上一步中从 GitHub 生成的个人访问令牌（经典版）。               | &#96;ghp_...&#96;               |
| **分支/引用** | 否    | 指定要显示的分支、标签或提交 SHA。**只有指定了分支名才支持写操作**。留空则为默认分支。 | &#96;main&#96;                  |
| **路径**    | 否    | 如果只想挂载仓库中的某个子文件夹，在此处填写。留空则挂载整个仓库。           | &#96;/docs&#96;                 |
| **Gh 代理** | 否    | 可选的 GitHub 代理 URL，用于在某些网络环境下加速文件下载。         | &#96;https://gh-proxy.com/&#96; |

4. **具体的功能限制**：
  - **文件大小限制**：无法通过 API 查看或下载**大于 100 MB** 的文件。
  - **写操作限制**：只有在“分支/引用”字段中明确填写了**分支名称**时，才支持上传、重命名、删除等写操作。

#### **五、结论与要点**

1. **核心可行性**：在 Openlist 中挂载 GitHub 仓库是一项内置的、被官方支持的功能，操作直接且可靠。
2. **关键凭证**：整个流程的核心是正确生成并使用 GitHub 的个人访问令牌（PAT），务必确保授予了 &#96;repo&#96; 权限并妥善保管好该令牌。
3. **注意限制**：使用者必须清楚 GitHub API 带来的 100MB 文件大小限制，以及 Openlist 驱动对写入权限的特定要求（必须挂载分支），才能充分利用该功能并避免不必要的麻烦。
4. **信息溯源**：由于 Openlist 是 AList 的分支，因此 AList 的官方文档（特别是关于 GitHub 驱动的部分）是进行高级配置或问题排查时最权威的参考资料。

---

# 原文内容

How do I mount Github storage like repos in Openlist (the open source project on github)?  
如何在 Openlist（GitHub 上的开源项目）中挂载 GitHub 存储，比如仓库？

**Thinking 思考**

How do I mount Github storage like repos in Openlist (the open source project on github)?  
我该如何在 Openlist（GitHub 上的开源项目）中挂载类似 GitHub 仓库的存储空间？

**Thinking 思考**

**Kicking off** 18 searches  
启动 18 次搜索[Openlist github open source](https://www.google.com/search?newwindow&#61;1&amp;sca_esv&#61;4930a86e8032ef84&amp;udm&#61;50&amp;sxsrf&#61;AE3TifNMxmLaR4M-WPuYFysnTvoG3Q6dbg:1762518999996&amp;q&#61;Openlist%20github%20open%20source&amp;sa&#61;X&amp;ved&#61;0CAAQs7EQahcKEwioxdbfhuCQAxUAAAAAHQAAAAAQOA)  
[Openlist GitHub 开源](https://www.google.com/search?newwindow&#61;1&amp;sca_esv&#61;4930a86e8032ef84&amp;udm&#61;50&amp;sxsrf&#61;AE3TifNMxmLaR4M-WPuYFysnTvoG3Q6dbg:1762518999996&amp;q&#61;Openlist%20github%20open%20source&amp;sa&#61;X&amp;ved&#61;0CAAQs7EQahcKEwioxdbfhuCQAxUAAAAAHQAAAAAQOA)

[

mount github repo as filesystem  
将 GitHub 仓库挂载为文件系统

]([https://www.google.com/search?newwindow&#61;1&amp;sca\_esv&#61;4930a86e8032ef84&amp;udm&#61;50&amp;sxsrf&#61;AE3TifNMxmLaR4M-WPuYFysnTvoG3Q6dbg:1762518999996&amp;q&#61;mount github repo as filesystem&amp;sa&#61;X&amp;ved&#61;0CAEQs7EQahcKEwioxdbfhuCQAxUAAAAAHQAAAAAQOA](https://www.google.com/search?newwindow&#61;1&amp;sca_esv&#61;4930a86e8032ef84&amp;udm&#61;50&amp;sxsrf&#61;AE3TifNMxmLaR4M-WPuYFysnTvoG3Q6dbg:1762518999996&amp;q&#61;mount%20github%20repo%20as%20filesystem&amp;sa&#61;X&amp;ved&#61;0CAEQs7EQahcKEwioxdbfhuCQAxUAAAAAHQAAAAAQOA) “mount github repo as filesystem”)[

fuse git github

]([https://www.google.com/search?newwindow&#61;1&amp;sca\_esv&#61;4930a86e8032ef84&amp;udm&#61;50&amp;sxsrf&#61;AE3TifNMxmLaR4M-WPuYFysnTvoG3Q6dbg:1762518999996&amp;q&#61;fuse git github&amp;sa&#61;X&amp;ved&#61;0CAIQs7EQahcKEwioxdbfhuCQAxUAAAAAHQAAAAAQOA](https://www.google.com/search?newwindow&#61;1&amp;sca_esv&#61;4930a86e8032ef84&amp;udm&#61;50&amp;sxsrf&#61;AE3TifNMxmLaR4M-WPuYFysnTvoG3Q6dbg:1762518999996&amp;q&#61;fuse%20git%20github&amp;sa&#61;X&amp;ved&#61;0CAIQs7EQahcKEwioxdbfhuCQAxUAAAAAHQAAAAAQOA) “fuse git github”)[

Openlist project documentation github integration  
Openlist 项目文档 GitHub 集成

]([https://www.google.com/search?newwindow&#61;1&amp;sca\_esv&#61;4930a86e8032ef84&amp;udm&#61;50&amp;sxsrf&#61;AE3TifNMxmLaR4M-WPuYFysnTvoG3Q6dbg:1762518999996&amp;q&#61;Openlist project documentation github integration&amp;sa&#61;X&amp;ved&#61;0CAMQs7EQahcKEwioxdbfhuCQAxUAAAAAHQAAAAAQOA](https://www.google.com/search?newwindow&#61;1&amp;sca_esv&#61;4930a86e8032ef84&amp;udm&#61;50&amp;sxsrf&#61;AE3TifNMxmLaR4M-WPuYFysnTvoG3Q6dbg:1762518999996&amp;q&#61;Openlist%20project%20documentation%20github%20integration&amp;sa&#61;X&amp;ved&#61;0CAMQs7EQahcKEwioxdbfhuCQAxUAAAAAHQAAAAAQOA) “Openlist project documentation github integration”)[

tools to access github repo as local folder  
将 GitHub 仓库作为本地文件夹访问的工具

]([https://www.google.com/search?newwindow&#61;1&amp;sca\_esv&#61;4930a86e8032ef84&amp;udm&#61;50&amp;sxsrf&#61;AE3TifNMxmLaR4M-WPuYFysnTvoG3Q6dbg:1762518999996&amp;q&#61;tools to access github repo as local folder&amp;sa&#61;X&amp;ved&#61;0CAQQs7EQahcKEwioxdbfhuCQAxUAAAAAHQAAAAAQOA](https://www.google.com/search?newwindow&#61;1&amp;sca_esv&#61;4930a86e8032ef84&amp;udm&#61;50&amp;sxsrf&#61;AE3TifNMxmLaR4M-WPuYFysnTvoG3Q6dbg:1762518999996&amp;q&#61;tools%20to%20access%20github%20repo%20as%20local%20folder&amp;sa&#61;X&amp;ved&#61;0CAQQs7EQahcKEwioxdbfhuCQAxUAAAAAHQAAAAAQOA) “tools to access github repo as local folder”)[

site:doc.oplist.org github storage  
站点：[doc.oplist.org](http://doc.oplist.org) GitHub 存储

]([https://www.google.com/search?newwindow&#61;1&amp;sca\_esv&#61;4930a86e8032ef84&amp;udm&#61;50&amp;sxsrf&#61;AE3TifPp96Mu3F\_sW1L4\_da694EQcQv\_yw:1762519037318&amp;q&#61;site:doc.oplist.org github storage&amp;sa&#61;X&amp;ved&#61;0CAAQs7EQahgKEwioxdbfhuCQAxUAAAAAHQAAAAAQnwE](https://www.google.com/search?newwindow&#61;1&amp;sca_esv&#61;4930a86e8032ef84&amp;udm&#61;50&amp;sxsrf&#61;AE3TifPp96Mu3F_sW1L4_da694EQcQv_yw:1762519037318&amp;q&#61;site:doc.oplist.org%20github%20storage&amp;sa&#61;X&amp;ved&#61;0CAAQs7EQahgKEwioxdbfhuCQAxUAAAAAHQAAAAAQnwE) “site:doc.oplist.org github storage”)

**Looking at** 786 sites 正在查看 786 个站点[github.com OpenListTeam/OpenList: A new AList Fork to Anti Trust Crisis](https://github.com/OpenListTeam/OpenList)  
[github.com OpenListTeam/OpenList：一个应对反垄断危机的全新 AList 分支](https://github.com/OpenListTeam/OpenList)

[

[github.com](http://github.com) ahmedmarhoum3131/OpenList - GitHub

]([https://github.com/ahmedmarhoum3131/OpenList](https://github.com/ahmedmarhoum3131/OpenList))[

[github.com](http://github.com) OpenListTeam/OpenList-OpenWRT: LuCI support for… - GitHub  
[github.com](http://github.com) OpenListTeam/OpenList-OpenWRT：支持 LuCI 的… - GitHub

]([https://github.com/OpenListTeam/OpenList-OpenWRT#:~:text&#61;luci-app-openlist 🗂️ A file list program that,multiple storage%2C powered by Gin and Solidjs.](https://github.com/OpenListTeam/OpenList-OpenWRT#:~:text&#61;luci%2Dapp%2Dopenlist%20%F0%9F%97%82%EF%B8%8F%20A%20file%20list%20program%20that,multiple%20storage%2C%20powered%20by%20Gin%20and%20Solidjs.))[

[en.wikipedia.org](http://en.wikipedia.org) GitHub - Wikipedia  
[en.wikipedia.org](http://en.wikipedia.org) GitHub - 维基百科

]([https://en.wikipedia.org/wiki/GitHub#:~:text&#61;It is commonly used to host open,source code host as of June 2023.](https://en.wikipedia.org/wiki/GitHub#:~:text&#61;It%20is%20commonly%20used%20to%20host%20open,source%20code%20host%20as%20of%20June%202023.))[

[doc.oplist.org](http://doc.oplist.org) OpenList Ecosystem  
[doc.oplist.org](http://doc.oplist.org) 开放列表生态系统

]([https://doc.oplist.org/ecosystem#:~:text&#61;Documentation based on Valaxy%2C supporting multiple styles and real-time builds from the GitHub repository.](https://doc.oplist.org/ecosystem#:~:text&#61;Documentation%20based%20on%20Valaxy%2C%20supporting%20multiple%20styles%20and%20real%2Dtime%20builds%20from%20the%20GitHub%20repository.))[

[github.com](http://github.com) A desktop application for OpenList - GitHub  
[github.com](http://github.com) 用于 OpenList 的桌面应用程序 - GitHub

]([https://github.com/OpenListTeam/OpenList-Desktop#:~:text&#61;✨ 功能特性 \* OpenList 服务管理：启动、停止和监控OpenList 核心服务 \*,挂载至本地文件系统 \* 实时监控：跟踪服务状态、运行时间和性能指标 \* 进程管理：具有自动重启功能的高级进程控制 \* 系统托盘：带系统托盘通知的后台操作](https://github.com/OpenListTeam/OpenList-Desktop#:~:text&#61;%E2%9C%A8%20%E5%8A%9F%E8%83%BD%E7%89%B9%E6%80%A7%20*%20OpenList%20%E6%9C%8D%E5%8A%A1%E7%AE%A1%E7%90%86%EF%BC%9A%E5%90%AF%E5%8A%A8%E3%80%81%E5%81%9C%E6%AD%A2%E5%92%8C%E7%9B%91%E6%8E%A7OpenList%20%E6%A0%B8%E5%BF%83%E6%9C%8D%E5%8A%A1%20*,%E6%8C%82%E8%BD%BD%E8%87%B3%E6%9C%AC%E5%9C%B0%E6%96%87%E4%BB%B6%E7%B3%BB%E7%BB%9F%20*%20%E5%AE%9E%E6%97%B6%E7%9B%91%E6%8E%A7%EF%BC%9A%E8%B7%9F%E8%B8%AA%E6%9C%8D%E5%8A%A1%E7%8A%B6%E6%80%81%E3%80%81%E8%BF%90%E8%A1%8C%E6%97%B6%E9%97%B4%E5%92%8C%E6%80%A7%E8%83%BD%E6%8C%87%E6%A0%87%20*%20%E8%BF%9B%E7%A8%8B%E7%AE%A1%E7%90%86%EF%BC%9A%E5%85%B7%E6%9C%89%E8%87%AA%E5%8A%A8%E9%87%8D%E5%90%AF%E5%8A%9F%E8%83%BD%E7%9A%84%E9%AB%98%E7%BA%A7%E8%BF%9B%E7%A8%8B%E6%8E%A7%E5%88%B6%20*%20%E7%B3%BB%E7%BB%9F%E6%89%98%E7%9B%98%EF%BC%9A%E5%B8%A6%E7%B3%BB%E7%BB%9F%E6%89%98%E7%9B%98%E9%80%9A%E7%9F%A5%E7%9A%84%E5%90%8E%E5%8F%B0%E6%93%8D%E4%BD%9C))

Connecting Your GitHub Repositories to Openlist  
将您的 GitHub 仓库连接到 Openlist

Summary 摘要

You can connect and browse your GitHub repositories directly within Openlist by using its native “GitHub API” storage driver.  
您可以通过使用 Openlist 原生的“GitHub API”存储驱动程序，直接在 Openlist 中连接并浏览您的 GitHub 仓库。  
This process involves two main steps: first, generating a secure Personal Access Token from your GitHub account, and second, using that token to configure the new storage source in the Openlist administration panel.  
此过程包含两个主要步骤：首先，从您的 GitHub 账户生成一个安全的个人访问令牌；其次，使用该令牌在 Openlist 管理面板中配置新的存储源。

- **GitHub Integration:** Openlist has built-in support for adding GitHub repositories as a browsable storage location, treating your code and files just like any other cloud storage service it supports.
GitHub 集成：Openlist 内置了将 GitHub 仓库添加为可浏览存储位置的支持功能，它会像对待其他支持的云存储服务一样，将您的代码和文件视作普通的云存储内容。
- **Authentication Method:** To connect, you will need to create a **Personal Access Token (classic)** in your GitHub developer settings. This token acts as a secure password for Openlist to access your repositories.
认证方式：要进行连接，您需要在 GitHub 开发者设置中创建一个个人访问令牌（经典版）。该令牌将作为 Openlist 访问您仓库的安全密码。
- **Configuration:** The setup is done entirely within the Openlist admin interface, where you will specify the repository owner, name, the branch you wish to display, and the access token you generated.
配置：整个设置过程均在 Openlist 管理界面中完成，您需要在此指定仓库的所有者、名称、要显示的分支，以及您生成的访问令牌。

Understanding Openlist and GitHub Integration  
了解 Openlist 与 GitHub 的集成

Step 1: Generate a GitHub Personal Access Token  
步骤 1：生成 GitHub 个人访问令牌

Before you can add a repository to Openlist, you need to create a Personal Access Token (PAT). This token grants Openlist permission to access your repositories on your behalf. For security, it is crucial to grant only the necessary permissions.  
在将仓库添加到 Openlist 之前，您需要先创建一个个人访问令牌（PAT）。此令牌将授权 Openlist 代表您访问您的仓库。出于安全考虑，务必只授予必要的权限。

Here is a step-by-step guide to generating the correct token:  
以下是生成正确令牌的分步指南：

1. **Navigate to GitHub Settings:** Log in to your GitHub account. In the upper-right corner, click your profile picture, then click **Settings**.
前往 GitHub 设置：登录您的 GitHub 账户。在右上角，单击您的个人资料图片，然后单击“设置”。
2. **Go to Developer Settings:** In the left sidebar, scroll down and click **Developer settings**.
转到开发者设置：在左侧边栏中，向下滚动并单击“开发者设置”。
3. **Select Personal Access Tokens:** In the developer settings menu, click **Personal access tokens**, then select **Tokens (classic)**.
选择个人访问令牌：在开发者设置菜单中，单击“个人访问令牌”，然后选择“令牌（经典版）”。
4. **Generate a New Token:** Click the **Generate new token** button, and then select **Generate new token (classic)**.
生成新令牌：单击“生成新令牌”按钮，然后选择“生成新令牌（经典版）”。
5. **Configure the Token:配置令牌：**
  - **Note:** Give your token a descriptive name, such as &#96;openlist-access&#96;.
注意：为您的令牌取一个描述性名称，例如 &#96;openlist-access&#96; 。
  - **Expiration:** Set an expiration date for the token. For better security, avoid selecting “No expiration.” 90 days is a common choice.
过期时间：为令牌设置一个过期日期。为了提高安全性，请避免选择“无过期”。90 天是一个常见的选择。
  - **Select Scopes:** This is the most important step. Check the box next to &#96;repo&#96;. This scope grants full control of private repositories, which is necessary for Openlist to read the repository contents.
选择作用域：这是最重要的一步。请勾选 &#96;repo&#96; 旁边的复选框。此作用域将授予对私有仓库的完全控制权限，这是 Openlist 读取仓库内容所必需的。
6. **Save Your Token:** Scroll to the bottom and click **Generate token**. GitHub will display your new token only once. **Immediately copy the token and store it in a secure location**, like a password manager. You will need it for the next step.
保存您的令牌：滚动到页面底部，然后单击“生成令牌”。GitHub 只会显示一次您的新令牌。请立即复制该令牌，并将其存储在一个安全的地方，例如密码管理器中。您将在下一步中用到它。

Step 2: Configure GitHub Storage in Openlist  
步骤 2：在 Openlist 中配置 GitHub 存储

With your Personal Access Token in hand, you can now configure the storage driver in Openlist. The following instructions are based on the comprehensive documentation of AList, Openlist’s parent project, as the process is functionally identical.  
现在，您已准备好使用个人访问令牌来配置 Openlist 中的存储驱动。以下说明基于 Openlist 的父项目 AList 的完整文档，因为两者的操作流程在功能上是完全相同的。

1. **Access Openlist Admin Panel:** Log in to your Openlist instance with an administrator account.
访问 Openlist 管理面板：使用管理员账号登录您的 Openlist 实例。
2. **Add New Storage:** Navigate to the **Storage** section from the sidebar and click the **Add** button.
添加新存储：从侧边栏导航至“存储”部分，然后单击“添加”按钮。
3. **Select the Driver:** From the **Driver** dropdown menu, select **GitHub API**.
翻译为简体中文： 选择驱动程序：从“驱动程序”下拉菜单中，选择 GitHub API。
4. **Fill in the Configuration Fields:** You will be presented with several fields to configure the connection.
填写配置字段：您将看到多个用于配置连接的字段。

After filling in the necessary fields, click **Save** at the bottom of the page. Openlist will connect to your repository, and you should now be able to see it listed under the mount path you specified.  
填写完必要字段后，单击页面底部的“保存”。Openlist 将连接到您的仓库，现在您应该能够在您指定的挂载路径下看到它。

Important Considerations and Limitations  
重要注意事项与限制

When using the GitHub storage driver, keep the following points in mind:  
使用 GitHub 存储驱动时，请注意以下几点：

- **File Size Limits:** The GitHub API has limitations. It does not support viewing or downloading files larger than 100 MB. For larger files, consider using Git LFS, which is not directly supported by this driver.
文件大小限制：GitHub API 存在限制，不支持查看或下载超过 100 MB 的文件。对于更大的文件，建议使用 Git LFS，但此驱动并不直接支持 Git LFS。
- **Write Access:** You can only perform write operations (uploading, renaming, or deleting files) if you have specified a **branch name** in the &#96;Branch/Ref&#96; field. If you mount a specific commit hash or a tag, the storage will be strictly read-only.
写入权限：只有在 &#96;Branch/Ref&#96; 字段中指定了分支名称时，才能执行写入操作（上传、重命名或删除文件）。如果挂载的是特定的提交哈希或标签，则存储将严格为只读模式。
- **Single Sign-On (SSO) vs. Storage:** Openlist also allows you to use GitHub for user authentication (SSO), which lets users log in with their GitHub accounts. This is a completely separate feature from the GitHub API storage driver and should not be confused with it.
单点登录（SSO）与存储：Openlist 还允许您使用 GitHub 进行用户身份验证（SSO），使用户能够通过其 GitHub 账户登录。这与 GitHub API 存储驱动程序是完全独立的功能，二者不应混淆。

---

**Learn More 了解更多**

- [OpenListTeam/OpenList GitHub Repository](https://github.com/OpenListTeam/OpenList): The official source code repository for the Openlist project, where you can find the latest releases and community discussions.
OpenListTeam/OpenList GitHub 仓库：Openlist 项目的官方源代码仓库，您可以在这里找到最新版本和社区讨论。
- [AList GitHub Driver Documentation](https://alistgo.com/guide/drivers/github.html): The detailed documentation for the GitHub API driver from the AList project. Since Openlist is a fork, this guide is the most comprehensive resource for all configuration options.
AList GitHub 驱动程序文档：来自 AList 项目的 GitHub API 驱动程序的详细文档。由于 Openlist 是 AList 的一个分支，因此本指南是所有配置选项中最全面的参考资料。
- [GitHub: Creating a Personal Access Token](https://www.youtube.com/watch?v&#61;0C-B6bFuQYU): A helpful video guide that visually walks through the process of creating a Personal Access Token on GitHub, similar to the steps outlined above.
GitHub：创建个人访问令牌——一个实用的视频指南，以直观的方式演示如何在 GitHub 上创建个人访问令牌，步骤与上述内容类似。
- GitHub API | AList Docs
GitHub API | AList Docs Skip to main content AList Docs Guide Config FAQ Pricing Community Discussion Telegram Wechat/QQ More Demo…
[alistgo.com](http://alistgo.com)
