---
标题: Anx Calibre Manager
笔记 ID: 0199a977-7fcd-7c74-a766-813f9bf5556c
笔记类型: crawl
tags:
    - 学习/学术学习
卡片盒:
    - 学习
包含语音: 否
网页链接:
创建时间: "2025-10-03T17:46:45"
更新时间: "2026-03-03T16:16:56.536"
---

&quot;[https://github.com/ptbsare/anx-calibre-manager/blob/main/README\_zh-Hans.md](https://github.com/ptbsare/anx-calibre-manager/blob/main/README_zh-Hans.md)&quot;

一个现代化的、移动端优先的 Web 应用，用于管理您的电子书库，可与 Calibre 集成，并为您的 Anx-reader 兼容设备提供个人 WebDAV 服务器。

## ✨ 功能特性

- **多语言支持**: 完整的国际化支持，界面提供英语、简体中文 (简体中文)、繁体中文 (繁體中文)、西班牙语、法语和德语。
- **移动端优先界面**: 简洁、响应式的用户界面，专为在手机上轻松使用而设计。
- **PWA 支持**: 可作为渐进式 Web 应用 (PWA) 安装，提供类似原生应用的体验。
- **浏览器内图书预览器**: 直接在浏览器中预览电子书。支持文本转语音（TTS）功能。
- **有声书生成**: 使用可配置的文本转语音（TTS）提供商（例如，Microsoft Edge TTS），将 EPUB 电子书转换为带章节标记的 M4B 有声书。生成的 M4B 文件与 [Audiobookshelf](https://www.audiobookshelf.org/) 等有声书服务器完全兼容。
- **在线有声书播放器**: 直接在浏览器中收听您生成的 M4B 有声书。您的收听进度会被自动保存和同步。
- **与 AI 对话**: 与您的书籍进行对话。此功能允许您与书库中的任何一本书聊天，通过 AI 驱动的界面提出关于内容的问题、获取摘要或探讨主题。
- **Calibre 集成**: 连接到您现有的 Calibre 服务器，以浏览和搜索您的书库。
- **KOReader 同步**: 与您的 KOReader 设备同步阅读进度和阅读时间。
- **智能推送到 Kindle**: 发送书籍到您的 Kindle 时，应用会自动处理格式。如果书籍已有 EPUB 格式，则直接发送；如果没有，它将根据您的格式偏好设置，自动将最优先的可用格式 **转换为 EPUB** 后再发送，以确保最佳兼容性。
- **推送到 Anx**: 将书籍从您的 Calibre 书库直接发送到您的个人 Anx-reader 设备文件夹。
- **集成的 WebDAV 服务器**: 每个用户都会获得自己独立、安全的 WebDAV 文件夹，与 Anx-reader 和其他 WebDAV 客户端兼容。
- **MCP 服务器**: 内置一个符合规范的 Model Context Protocol (MCP) 服务器，允许 AI 代理和外部工具安全地与您的书库交互。
- **用户管理**: 简单、内置的用户管理系统，具有不同的角色：
  - **管理员 (Admin)**: 对用户、全局设置和所有书籍拥有完全控制权。
  - **维护者 (Maintainer)**: 可以编辑所有书籍元数据。
  - **普通用户 (User)**: 可以上传书籍、管理自己的 WebDAV 书库、MCP token、发送书籍到 Kindle，以及 **编辑自己上传的书籍** 。
- **仅限邀请注册**: 管理员可以生成邀请码来控制用户注册。此功能默认启用，以防止未经授权的注册。
- **用户可编辑自己上传的书籍**: 普通用户现在可以编辑自己上传的书籍的元数据。此功能依赖于 Calibre 中的一个名为 &#96;#library&#96; 的自定义列（类型： &#96;文本，逗号分隔&#96; ）。当用户上传书籍时，他们的用户名会自动保存到该字段。用户可以编辑 &#96;#library&#96; 字段中记录的、由自己上传的任何书籍。
  - **Docker 用户建议**: 为启用此功能，请确保您的 Calibre 书库中有一个名为 &#96;#library&#96; 的自定义列（区分大小写），类型为 &#96;文本，逗号分隔&#96; 。
- **轻松部署**: 可作为单个 Docker 容器进行部署，内置了多语言环境支持。
- **阅读统计**: 自动生成个人阅读统计页面，包含年度阅读热力图、在读书籍和已读书籍列表。页面支持公开或私有分享。

## 📸 截图

*主界面*

*设置页面*

*MCP 设置*

| MCP 聊天                                                                                                   | MCP 聊天                                                                                                      | MCP 聊天                                                                                                      | MCP 聊天                                                                                                      |
| -------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| ![](https://github.com/gloria-29/OB-assets/releases/download/img-3e/3ed9512c72b7ff7a41f1dd7e4638bce6b1f8f460cc81c77c50f0915e708fbfe7.jpg) | ![](https://github.com/gloria-29/OB-assets/releases/download/img-fe/fede2d3969d8fb6314b635cf4965d0f5d6eb2f5c8c82677f5c7c1f55862e9163.png) | ![](https://github.com/gloria-29/OB-assets/releases/download/img-4d/4d23f58a35dc054252a796d35fb449a36903201497a069cb5c091c462efb45db.png) | ![](https://github.com/gloria-29/OB-assets/releases/download/img-1f/1fabddd373208698694986aa4dc771db6dc101850ee4c50da93c90a87f1c47ec.png) |

| Koreader 书籍状态                                                                                                       | Koreader 同步                                                                                                   |
| ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| ![](https://github.com/gloria-29/OB-assets/releases/download/img-40/40c0e6e832fd6618c486438fb40ba44844ba40ed43d8820f319d824735d443ad.jpg) | ![](https://github.com/gloria-29/OB-assets/releases/download/img-41/41fdeb4201a1d933bc4c6b2bb16ce3ac43f0df696ca7a81e5819ced5f32738b8.jpg) |

| Koreader 设置                                                                                                      | Koreader WebDAV                                                                                                 |
| ---------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| ![](https://github.com/gloria-29/OB-assets/releases/download/img-22/222b776761ce8bf7cde3b1e262aab39618bc778f769dd7f517ac77237b65be4d.png) | ![](https://github.com/gloria-29/OB-assets/releases/download/img-05/054b5cb79cd1a8e7cc644c9ebe562a619b1a0fa6a4e173172fcd17213d9ecf67.jpg) |

*统计页面*

| 有声书列表                                                                                                          | 有声书播放器                                                                                                           |
| -------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| ![](https://github.com/gloria-29/OB-assets/releases/download/img-81/81363e7b8bdb8f3de920c951ae164c380062d4477c1f38aa1cb3714e39c00366.png) | ![](https://github.com/gloria-29/OB-assets/releases/download/img-d9/d9608016b293105d270970beea2a15e67384b6ba49c599d390ac5d89def294bf.png) |

| 与图书对话                                                                                                          | 与图书对话                                                                                                          |
| -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| ![](https://github.com/gloria-29/OB-assets/releases/download/img-62/62a6706afbaf69d4fe04fb5bf64db4995c7641f48a5740fc366ca9992dcf697e.png) | ![](https://github.com/gloria-29/OB-assets/releases/download/img-1e/1e877eacca0ff77f6d19ea811a5cd989f53836549d8898fcff265db2ce3ef746.png) |

## 🚀 部署

本应用设计为使用 Docker 进行部署。

### 先决条件

- 您的服务器上已安装 [Docker](https://www.docker.com/get-started) 。
- 一个正在运行的 Calibre 服务器 (可选，但大部分功能需要)。我们推荐使用 [linuxserver/calibre](https://hub.docker.com/r/linuxserver/calibre) Docker 镜像。

这是最简单的入门方式。

1. 创建两个用于持久化数据的文件夹： &#96;&#96;&#96;
mkdir -p ./config
mkdir -p ./webdav
&#96;&#96;&#96;
2. 使用下面这一条命令来启动 Docker 容器： &#96;&#96;&#96;
docker run -d \
  --name anx-calibre-manager \
  -p 5000:5000 \
  -v $(pwd)/config:/config \
  -v $(pwd)/webdav:/webdav \
  --restart unless-stopped \
  ghcr.io/ptbsare/anx-calibre-manager:latest
&#96;&#96;&#96;
3. 在浏览器中访问 &#96;http://localhost:5000&#96; 。第一个注册的用户将自动成为管理员。您后续可以在网页界面中配置 Calibre 服务器连接及其他设置。

### 高级配置

对于希望连接到 Calibre 服务器并自定义更多选项的用户，这里提供一个更详细的 &#96;docker-compose.yml&#96; 示例。

1. \*\*获取您的用户和组 ID (PUID/PGID):\*\*在您的宿主机上运行 &#96;id $USER&#96; 。为了避免权限问题，建议进行此项配置。
2. **创建一个 **&#96;docker-compose.yml&#96; 文件:*注意: 请将 *&#96;/path/to/your/...&#96; 替换为您宿主机上的实际路径。
3. 启动容器: &#96;&#96;&#96;
docker-compose up -d
&#96;&#96;&#96;

### 自定义字体

书籍格式转换工具 &#96;ebook-converter&#96; 会扫描 &#96;/opt/share/fonts&#96; 目录以查找字体。如果您在转换某些包含特殊字符（如中文）的书籍时遇到字体问题，可以通过挂载一个包含您所需字体文件（例如 &#96;.ttf&#96;, &#96;.otf&#96; ）的本地目录到容器的 &#96;/opt/share/fonts&#96; 路径来提供自定义字体。

### 配置

应用通过环境变量进行配置。

| 变量                          | 描述                                                                                                                                                                                                                  | 默认值                       |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------- |
| &#96;PUID&#96;                        | 指定运行应用的用户 ID。                                                                                                                                                                                                       | &#96;1001&#96;                      |
| &#96;PGID&#96;                        | 指定运行应用的组 ID。                                                                                                                                                                                                        | &#96;1001&#96;                      |
| &#96;TZ&#96;                          | 您的时区, 例如 &#96;America/New_York&#96; 。                                                                                                                                                                                         | &#96;UTC&#96;                       |
| &#96;PORT&#96;                        | 应用在容器内监听的端口。                                                                                                                                                                                                        | &#96;5000&#96;                      |
| &#96;GUNICORN_WORKERS&#96;            | 可选：Gunicorn worker 进程的数量。                                                                                                                                                                                           | &#96;2&#96;                         |
| &#96;CONFIG_DIR&#96;                  | 用于存放数据库和 &#96;settings.json&#96; 的目录。                                                                                                                                                                                         | &#96;/config&#96;                   |
| &#96;WEBDAV_DIR&#96;                  | 用于存放 WebDAV 用户文件的基础目录。                                                                                                                                                                                              | &#96;/webdav&#96;                   |
| &#96;SECRET_KEY&#96;                  | **必需。** 用于会话安全的、长的、随机的字符串。                                                                                                                                                                                              | &#96;&quot;&quot;&#96;                        |
| &#96;CALIBRE_URL&#96;                 | 您的 Calibre 内容服务器的 URL。如有连接问题，请参阅 [问题排查](https://github.com/ptbsare/anx-calibre-manager/blob/main/#1-%E4%B8%BA%E4%BB%80%E4%B9%88%E6%88%91%E7%9A%84-calibre-%E5%88%97%E8%A1%A8%E6%B2%A1%E6%9C%89%E4%B9%A6%E7%B1%8D) 。 | &#96;&quot;&quot;&#96;                        |
| &#96;CALIBRE_USERNAME&#96;            | 您的 Calibre 服务器的用户名。如有连接问题，请参阅 [问题排查](https://github.com/ptbsare/anx-calibre-manager/blob/main/#1-%E4%B8%BA%E4%BB%80%E4%B9%88%E6%88%91%E7%9A%84-calibre-%E5%88%97%E8%A1%A8%E6%B2%A1%E6%9C%89%E4%B9%A6%E7%B1%8D) 。    | &#96;&quot;&quot;&#96;                        |
| &#96;CALIBRE_PASSWORD&#96;            | 您的 Calibre 服务器的密码。如有连接问题，请参阅 [问题排查](https://github.com/ptbsare/anx-calibre-manager/blob/main/#1-%E4%B8%BA%E4%BB%80%E4%B9%88%E6%88%91%E7%9A%84-calibre-%E5%88%97%E8%A1%A8%E6%B2%A1%E6%9C%89%E4%B9%A6%E7%B1%8D) 。     | &#96;&quot;&quot;&#96;                        |
| &#96;CALIBRE_DEFAULT_LIBRARY_ID&#96;  | 默认的 Calibre 库 ID。详情请参阅 [如何找到我的 ](https://github.com/ptbsare/anx-calibre-manager/blob/main/#4-%E6%88%91%E5%A6%82%E4%BD%95%E6%89%BE%E5%88%B0%E6%88%91%E7%9A%84-library_id)&#96;library_id&#96; 。                                | &#96;Calibre_Library&#96;           |
| &#96;CALIBRE_ADD_DUPLICATES&#96;      | 是否允许上传重复的书籍。                                                                                                                                                                                                        | &#96;false&#96;                     |
| &#96;REQUIRE_INVITE_CODE&#96;         | 注册时是否需要邀请码。                                                                                                                                                                                                         | &#96;true&#96;                      |
| &#96;SMTP_SERVER&#96;                 | 用于发送邮件 (例如，推送到 Kindle) 的 SMTP 服务器。                                                                                                                                                                                  | &#96;&quot;&quot;&#96;                        |
| &#96;SMTP_PORT&#96;                   | SMTP 端口。                                                                                                                                                                                                            | &#96;587&#96;                       |
| &#96;SMTP_USERNAME&#96;               | SMTP 用户名。                                                                                                                                                                                                           | &#96;&quot;&quot;&#96;                        |
| &#96;SMTP_PASSWORD&#96;               | SMTP 密码。                                                                                                                                                                                                            | &#96;&quot;&quot;&#96;                        |
| &#96;SMTP_ENCRYPTION&#96;             | SMTP 加密类型 (&#96;ssl&#96;, &#96;starttls&#96;, &#96;none&#96;)。                                                                                                                                                                                    | &#96;ssl&#96;                       |
| &#96;DEFAULT_TTS_PROVIDER&#96;        | 用于有声书生成的默认 TTS 提供商 (&#96;edge_tts&#96; 或 &#96;openai_tts&#96;)。                                                                                                                                                                         | &#96;edge_tts&#96;                  |
| &#96;DEFAULT_TTS_VOICE&#96;           | 所选 TTS 提供商的默认语音。                                                                                                                                                                                                    | &#96;en-US-AriaNeural&#96;          |
| &#96;DEFAULT_TTS_RATE&#96;            | TTS 提供商的默认语速 (例如, &#96;+10%&#96;)。                                                                                                                                                                                            | &#96;+0%&#96;                       |
| &#96;DEFAULT_OPENAI_API_KEY&#96;      | 您的 OpenAI API 密钥 (如果使用 &#96;openai_tts&#96; 则为必需)。                                                                                                                                                                            | &#96;&quot;&quot;&#96;                        |
| &#96;DEFAULT_OPENAI_API_BASE_URL&#96; | 用于 OpenAI 兼容 API 的自定义基础 URL。                                                                                                                                                                                        | &#96;https://api.openai.com/v1&#96; |
| &#96;DEFAULT_OPENAI_API_MODEL&#96;    | 用于 TTS 的 OpenAI 模型 (例如, &#96;tts-1&#96;)。                                                                                                                                                                                     | &#96;tts-1&#96;                     |
| &#96;DEFAULT_LLM_BASE_URL&#96;        | 大语言模型 (LLM) API 的基础 URL，需与 OpenAI API 格式兼容。                                                                                                                                                                         | &#96;&quot;&quot;&#96;                        |
| &#96;DEFAULT_LLM_API_KEY&#96;         | LLM 服务的 API 密钥。                                                                                                                                                                                                     | &#96;&quot;&quot;&#96;                        |
| &#96;DEFAULT_LLM_MODEL&#96;           | LLM 服务默认使用的模型 (例如, &#96;gpt-4&#96;)。                                                                                                                                                                                          | &#96;&quot;&quot;&#96;                        |

## 🔧 问题排查

这里是一些常见问题及其解决方案：

- **A**: 请确保您已在 Calibre 客户端或容器中启动了 Calibre 内容服务（Content Server），即 &#96;calibre-server&#96; 。它通常运行在 &#96;8080&#96; 端口。请注意，本程序连接的是 &#96;calibre-server&#96; ，而不是 &#96;calibre-web&#96; （后者通常运行在 &#96;8083&#96; 端口）。
- **B**: 请确认您在设置中填写的 Calibre 服务器 URL、用户名和密码是正确的。您可以在浏览器中打开您配置的 URL，并尝试使用相同的用户名和密码登录来测试连接。
- **A**: 请确保您所配置的 Calibre 用户账户对书库具有写入权限。检查方法：在 Calibre 桌面应用中，点击 &#96;首选项&#96; -\&gt; &#96;通过网络共享&#96; -\&gt; &#96;用户账户&#96; ，并确保已为该用户勾选了“授予写入权限”选项。
- **A**: 这通常意味着您配置了错误的 Calibre Library ID。
- **方法一 (可视化)**: 在浏览器中打开您的 Calibre 内容服务并登录。查看页面上显示的书库名称。 &#96;library_id&#96; 通常是这个名称将空格等特殊字符替换为下划线后的结果。例如，如果您的书库名为 &quot;Calibre Library&quot;，那么 ID 很可能就是 &#96;Calibre_Library&#96; 。
- **方法二 (从 URL)**: 在内容服务界面，点击您的书库名称。查看浏览器地址栏中的 URL，您应该能看到一个类似 &#96;library_id&#61;...&#96; 的参数。该参数的值就是您的 library ID（它可能经过了 URL 编码，您可能需要解码一下）。
- **常见的默认 ID**: 首次运行 Calibre 时，默认的书库 ID 通常取决于您的系统语言。以下是一些常见的默认值：
  - 英语: &#96;Calibre_Library&#96;
  - 法语: &#96;Bibliothèque_calibre&#96;
  - 德语: &#96;Calibre-Bibliothek&#96;
  - 西班牙语: &#96;Biblioteca_de_calibre&#96;
  - 简体中文: &#96;Calibre_书库&#96;
  - 繁體中文: &#96;calibre_書庫&#96;

您可以同步您的阅读进度和阅读时间到 Anx 书库。整个设置过程分为两步：首先配置 WebDAV 以便访问您的书籍，然后配置同步插件来处理进度同步。

此步骤让您可以直接在 KOReader 中浏览和阅读您的 Anx 书库中的书籍。

1. 在 KOReader 中，进入 &#96;云存储&#96; -\&gt; &#96;添加新的云存储&#96; 。
2. 选择 &#96;WebDAV&#96; 。
3. 填写以下详细信息：
  - **服务器地址**: 填写 Anx Calibre Manager 设置页面（ &#96;设置&#96; -\&gt; &#96;Koreader 同步设置&#96; ）中显示的 WebDAV 地址。 **请确保路径以 **&#96;/&#96; 结尾 。
  - **用户名**: 您的 Anx Calibre Manager 用户名。
  - **密码**: 您的 Anx Calibre Manager 登录密码。
  - **文件夹**: &#96;/anx/data/file&#96;
4. 点击 &#96;连接&#96; 并保存。现在您应该可以在 KOReader 的文件浏览器中看到您的 Anx 书库了。

### 第二步：安装并配置同步插件

此插件负责将您的阅读进度发送回 Anx Calibre Manager 服务器。

1. **下载插件**:
  - 登录 Anx Calibre Manager。
  - 进入 &#96;设置&#96; -\&gt; &#96;Koreader 同步设置&#96; 。
  - 点击 &#96;下载 KOReader 插件 (.zip)&#96; 按钮来获取插件包。
2. **安装插件**:
  - 解压下载的 &#96;.zip&#96; 文件，您会得到一个名为 &#96;anx-calibre-manager-koreader-plugin.koplugin&#96; 的文件夹。
  - 将这 **整个文件夹** 复制到您 KOReader 设备的 &#96;koreader/plugins/&#96; 目录下。
3. **重启 KOReader**: 完全关闭并重新打开 KOReader 应用以加载新插件。
4. **配置同步服务器**:
  - **重要提示**: 首先，请通过上一步设置的 WebDAV 打开并开始阅读一本书籍。插件菜单 **仅在阅读界面中可见** 。
  - 在阅读界面，进入 &#96;工具(扳手图标)&#96; -\&gt; &#96;下一页&#96; -\&gt; &#96;更多工具&#96; -\&gt; &#96;ANX Calibre Manager&#96; 。
  - 选择 &#96;自定义同步服务器&#96; 。
  - **自定义同步服务器地址**: 输入 Anx Calibre Manager 设置页面中显示的同步服务器地址 (例如: &#96;http://&lt;your_server_address&gt;/koreader&#96;)。
  - 返回上一级菜单，选择 &#96;登录&#96; ，并输入您的 Anx Calibre Manager 用户名和密码。

配置完成后，插件将自动或手动同步您的阅读进度。您可以在插件菜单中调整同步频率等设置。 **注意：目前仅支持同步 EPUB 格式书籍的进度。**

本应用包含一个符合 JSON-RPC 2.0 规范的 MCP (Model Context Protocol) 服务器，允许外部工具和 AI 代理与您的书库进行交互。

### 使用方法

1. **生成令牌**: 登录后，进入 **设置 -\&gt; MCP 设置** 页面。点击“生成新令牌”来创建一个新的 API 令牌。
2. **端点 URL**: MCP 服务器的端点是 &#96;http://&lt;your_server_address&gt;/mcp&#96; 。
3. **认证**: 在您的请求 URL 中，通过查询参数附加您的令牌，例如： &#96;http://.../mcp?token&#61;YOUR_TOKEN&#96; 。
4. **发送请求**: 向该端点发送 &#96;POST&#96; 请求，请求体需遵循 JSON-RPC 2.0 格式。

### Prompt 示例

以下是一些自然语言提示的示例，您可以将其用于能够访问这些工具的 AI 代理。代理会智能地调用一个或多个工具来满足您的请求。

- **简单和高级搜索**:
  - &quot;查找关于 Python 编程的书籍。&quot;
  - &quot;搜索艾萨克·阿西莫夫在1950年后出版的科幻小说。&quot;
- **书籍管理**:
  - &quot;最近添加的5本书是哪些？把第一本发送到我的 Kindle。&quot;
  - &quot;将《沙丘》这本书推送到我的 Anx 阅读器上。&quot;
  - &quot;为《三体》这本书生成有声书。&quot;
  - &quot;《三体》的有声书生成状态如何？&quot;
- **内容互动与总结**:
  - &quot;显示《基地》这本书的目录。&quot;
  - &quot;获取《基地》的第一章内容并给我一个摘要。&quot;
  - &quot;根据《基地》中‘心理史学家’这一章，心理史学的主要思想是什么？&quot;
  - &quot;阅读整本《小王子》，并告诉我狐狸的秘密是什么。&quot;
- **阅读统计与进度**:
  - &quot;《沙丘》这本书总共有多少字，并列出每个章节的字数。&quot;
  - &quot;我今年读了多少本书？&quot;
  - &quot;我在《沙丘》上的阅读进度怎么样了？&quot;
  - &quot;《Project Hail Mary》的作者是谁？这本书我读了多久了？&quot;

### 可用工具

您可以通过 &#96;tools/list&#96; 方法获取所有可用工具的列表。当前支持的工具包括：

- &#96;search_books&#96;: 使用 Calibre 强大的搜索语法在指定书库中搜索书籍。 &#96;library_type&#96;: &#39;anx&#39; (用户正在看的书库), &#39;calibre&#39; (公共书库)。
  - **参数**: &#96;library_type&#96; (字符串), &#96;search_expression&#96; (字符串), &#96;limit&#96; (整数, 可选)。
  - **示例 (高级搜索)**: 在 &#96;calibre&#96; 书库中搜索由“人民邮电出版社”出版且评分高于4星的图书。 &#96;&#96;&#96;
{
    &quot;jsonrpc&quot;: &quot;2.0&quot;,
    &quot;method&quot;: &quot;tools/call&quot;,
    &quot;params&quot;: {
        &quot;name&quot;: &quot;search_books&quot;,
        &quot;arguments&quot;: {
            &quot;library_type&quot;: &quot;calibre&quot;,
            &quot;search_expression&quot;: &quot;publisher:\&quot;人民邮电出版社\&quot; AND rating:&gt;&#61;4&quot;,
            &quot;limit&quot;: 10
        }
    },
    &quot;id&quot;: &quot;search-request-1&quot;
}
&#96;&#96;&#96;
- &#96;get_recent_books&#96;: 从指定书库获取最近的书籍。 &#96;library_type&#96;: &#39;anx&#39; (用户正在看的书库), &#39;calibre&#39; (公共书库)。
  - **参数**: &#96;library_type&#96; (字符串), &#96;limit&#96; (整数, 可选)。
- &#96;get_book_details&#96;: 获取指定书库中某本书的详细信息。 &#96;library_type&#96;: &#39;anx&#39; (用户正在看的书库), &#39;calibre&#39; (公共书库)。
  - **参数**: &#96;library_type&#96; (字符串), &#96;book_id&#96; (整数)。
- &#96;push_calibre_book_to_anx&#96;: 将 Calibre 书库中的书籍推送到用户的 Anx 书库。
  - **参数**: &#96;book_id&#96; (整数)。
- &#96;send_book_to_kindle&#96;: 将指定书库中的书籍发送到 Kindle。 &#96;library_type&#96;: &#39;anx&#39; (用户正在看的书库), &#39;calibre&#39; (公共书库)。
  - **参数**: &#96;library_type&#96; (字符串), &#96;book_id&#96; (整数)。
- &#96;get_epub_table_of_contents&#96;: 获取指定书库中 EPUB 书籍的目录。 &#96;library_type&#96;: &#39;anx&#39; (用户正在看的书库), &#39;calibre&#39; (公共书库)。
  - **参数**: &#96;library_type&#96; (字符串), &#96;book_id&#96; (整数)。
- &#96;get_epub_chapter_content&#96;: 获取 EPUB 书籍指定章节的内容。 &#96;library_type&#96;: &#39;anx&#39; (用户正在看的书库), &#39;calibre&#39; (公共书库)。
  - **参数**: &#96;library_type&#96; (字符串), &#96;book_id&#96; (整数), &#96;chapter_number&#96; (整数)。
- &#96;get_epub_entire_content&#96;: 获取指定书库中 EPUB 书籍的全部内容。 &#96;library_type&#96;: &#39;anx&#39; (用户正在看的书库), &#39;calibre&#39; (公共书库)。
  - **参数**: &#96;library_type&#96; (字符串), &#96;book_id&#96; (整数)。
- &#96;get_book_word_count_stats&#96;: 获取书籍的字数统计（总字数和每章字数）。 &#96;library_type&#96;: &#39;anx&#39; (用户正在看的书库), &#39;calibre&#39; (公共书库)。
  - **参数**: &#96;library_type&#96; (字符串), &#96;book_id&#96; (整数)。
- &#96;generate_audiobook&#96;: 为 Anx 或 Calibre 书库中的书籍生成有声书。
  - **参数**: &#96;library_type&#96; (字符串), &#96;book_id&#96; (整数)。
- &#96;get_audiobook_generation_status&#96;: 通过任务 ID 获取有声书生成任务的状态。
  - **参数**: &#96;task_id&#96; (字符串)。
- &#96;get_audiobook_status_by_book&#96;: 通过书籍 ID 和书库类型获取指定书籍的最新有声书任务状态。
  - **参数**: &#96;library_type&#96; (字符串), &#96;book_id&#96; (整数)。

## 💻 开发

1. **克隆仓库:** &#96;&#96;&#96;
git clone https://github.com/ptbsare/anx-calibre-manager.git
cd anx-calibre-manager
&#96;&#96;&#96;
2. **创建虚拟环境:** &#96;&#96;&#96;
python3 -m venv .venv
source .venv/bin/activate
&#96;&#96;&#96;
3. **安装依赖:** &#96;&#96;&#96;
pip install -r requirements.txt
&#96;&#96;&#96;
4. **运行开发服务器:** &#96;&#96;&#96;
python app.py
&#96;&#96;&#96; 应用将在 &#96;http://localhost:5000&#96; 上可用。

## 🤝 贡献

欢迎提交贡献、问题和功能请求！请随时查看 [问题页面](https://github.com/ptbsare/anx-calibre-manager/issues) 。

## 🙏 致谢

本项目使用了以下优秀的开源项目：

- [foliate-js](https://github.com/johnfactotum/foliate-js) 提供了强大的电子书预览功能。
- [ebook-converter](https://github.com/gryf/ebook-converter) 提供了可靠的电子书格式转换功能。

## 📄 许可证

本项目采用 GPLv3 许可证。
