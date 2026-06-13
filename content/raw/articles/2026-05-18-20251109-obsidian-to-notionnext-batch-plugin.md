---
created: 2025-11-09
title: "obsidian-to-notionnext-batch plugin"
source: "https://github.com/takereshui/obsidian-to-notionnext-batch"
author:
  - "[[GitHub]]"
description: "Obsidian to NotionNext plugin with batch upload feature - Enhanced version with folder batch sync support - takereshui/obsidian-to-notionnext-batch"
---
# obsidian-to-notionnext-batch plugin

### Obsidian to NotionNext 插件阅读笔记

这是一份关于 `obsidian-to-notionnext-batch` 插件的详细阅读笔记。该插件是一个功能强大的工具，旨在将 Obsidian 中的笔记无缝同步到 Notion，特别针对 NotionNext 用户和需要批量操作的用户进行了功能增强。

---

#### 一、 核心摘要与主要观点

该 GitHub 项目介绍了一款名为 `obsidian-to-notionnext-batch` 的 Obsidian 插件。它是在 `obsidian-to-notion` 插件的基础上进行二次开发的增强版，核心目标是解决原版插件仅支持基础信息同步，无法满足 NotionNext 等复杂博客模板需求的痛点。该插件不仅完整保留了单篇文章的同步功能，还引入了**文件夹批量同步**这一杀手级特性，极大地提升了笔记迁移和发布的效率。

**主要观点**：
1.  **功能扩展性**：插件的核心价值在于其高度的灵活性和扩展性，支持三种不同类型的 Notion 数据库（通用、NotionNext、自定义），满足从简单笔记归档到复杂博客发布的多种需求。
2.  **效率提升**：新加入的“文件夹批量上传”功能是其最大亮点，允许用户一键同步整个文件夹（包括子文件夹）的内容，对于需要批量迁移或发布大量文章的用户来说是巨大的效率提升。
3.  **用户友好性**：提供了详尽的图文和GIF教程，从 Notion API 的申请到插件的具体配置和使用，步骤清晰，引导用户轻松上手。
4.  **兼容性与细节处理**：插件考虑了许多细节，如自动将 Obsidian 的 Callout 语法转换为 Notion 的 Callout 块，保持了笔记样式的一致性。

---

#### 二、 关键功能与特性详解

1.  **支持多种数据库类型**：
    *   **通用数据库 (General Database)**：最基础的模式，支持同步 `title`（标题）和 `tags`（标签），适合简单的笔记归档。
    *   **NotionNext 数据库**：专为使用 [NotionNext](https://github.com/tangly1024/NotionNext) 博客框架的用户设计，预设了所有 NotionNext 模板所需的字段（如 `titleicon`, `date`, `coverurl`, `slug`, `status` 等），实现 Obsidian 笔记到博客文章的一键发布。
    *   **自定义数据库 (Custom Database)**：提供最大程度的灵活性，用户可以根据自己 Notion 数据库的结构，自定义需要同步的所有字段及其类型，理论上可以适配任何结构的 Notion 数据库。

2.  **文件夹批量同步**：
    *   用户可以通过命令面板或右键点击文件夹上下文菜单，选择一个配置好的数据库，将整个文件夹内的所有笔记一次性上传到 Notion。
    *   支持递归遍历，子文件夹内的笔记也会被一并上传。
    *   内置 API 速率限制保护（100ms 延迟），防止因请求过快而被 Notion API 封禁。
    *   提供实时的上传进度通知和最终的结果摘要（成功/失败数量）。

3.  **Obsidian Callout 自动转换**：
    *   能自动将 Obsidian 中标准语法的 Callout（如 `> [!info] Tip`）渲染成 Notion 中对应的 Callout 模块，保留了图标、标题和内容，确保了跨平台样式的一致性。

4.  **国际化支持**：
    *   插件界面和提示信息支持中文、英文和日文。

---

#### 三、 安装、配置与使用流程

**第一部分：Notion API 设置**

1.  **创建集成 (Integration)**：前往 [Notion My Integrations](https://www.notion.com/my-integrations) 页面创建一个新的集成，并**复制生成的 Internal Integration Token**。
2.  **创建数据库**：在 Notion 中创建一个新的**整页数据库 (Database - Full page)**。
3.  **配置数据库属性**：根据所选的数据库类型（通用、NotionNext或自定义），确保数据库中包含所有需要的属性列，且**属性名均为小写**（例如 `title`, `tags`）。**注意：** 必须有一个属性作为主列（`Title` 类型），插件中会将其指定为标题列。
4.  **连接集成**：在数据库页面的右上角 `...` 菜单中，选择 `Connections`，添加并授权刚才创建的集成。
5.  **获取数据库 ID**：点击 `Share` -> `Publish`，在分享链接中复制数据库 ID。例如，在 `https://.../myworkspace/a8aec43384f447ed84390e8e42c2e089?v=...` 中，`a8aec43384f447ed84390e8e42c2e089` 就是数据库 ID。

**第二部分：Obsidian 插件设置**

1.  **安装插件**：在 Obsidian 社区插件市场搜索 `NotionNext` (或 `share-to-notionnext-batch`) 并安装。
2.  **配置数据库**：
    *   进入插件设置，点击 `Add New Database`。
    *   选择数据库类型（General, NotionNext, Custom）。
    *   填写数据库全名、简称、Notion API Token 和数据库 ID。
    *   对于**自定义数据库**，需要点击 `Add New Property`，逐一添加你在 Notion 中设置的属性名和对应的类型。

**第三部分：同步笔记**

1.  **编写 Front Matter**：在要同步的笔记文件顶部，按照 YAML 格式编写 Front Matter，其中的键名必须与你在 Notion 数据库中设置的属性名（小写）完全一致。
    *   *通用示例*：`title: test`, `tags: [test, web]`
    *   *NotionNext 示例*：包含 `title`, `date`, `slug`, `status` 等多个字段。
2.  **执行同步**：
    *   **单篇同步**：打开笔记，点击左侧边栏的插件图标或使用命令面板，选择要同步到的目标数据库。
    *   **批量同步**：使用命令面板或右键点击文件浏览器中的文件夹，选择批量上传命令和目标数据库。
3.  **获取链接**：同步成功后，插件会自动在笔记的 Front Matter 中添加一个 Notion 页面 ID，格式为 `NotionID-数据库简称: xxx`，用于未来的更新操作。

---

#### 四、 重要结论与要点

*   **核心优势**：该插件的最大价值在于其**批量处理能力**和**高度自定义**的特性，完美解决了 Obsidian 和 Notion 之间深度联动的需求，特别是对于内容创作者和知识管理者而言，是打通两个平台的利器。
*   **注意事项**：
    *   **版本兼容性**：v2.3.0 之前的自定义数据库用户，若要升级，必须重新创建数据库配置，因为新版本数据库结构不兼容旧版。
    *   **属性名大小写**：所有在 Notion 和 Front Matter 中使用的属性名**必须是小写**，这是最常见的配置错误来源。
    *   **主列设置**：在自定义数据库时，必须正确指定一个 `Title` 类型的属性作为主列。
*   **适用人群**：非常适合以下用户：
    *   使用 NotionNext 搭建个人博客，并希望以 Obsidian 作为主力 Markdown 编辑器的用户。
    *   需要将大量 Obsidian 存量笔记迁移到 Notion 进行归档或分享的用户。
    *   希望在 Notion 中建立高度定制化知识库，并从 Obsidian 稳定输入内容的用户。

---

# 原文内容

set 限制解除 

**[obsidian-to-notionnext-batch](https://github.com/takereshui/obsidian-to-notionnext-batch)** Public

Obsidian to NotionNext plugin with batch upload feature - Enhanced version with folder batch sync support


**Now, support All Notion databases, including NotionNext and General Notion databases, and customise the database list.**

**现在支持所有Notion数据库，包括NotionNext和一般Notion数据库，以及自定义数据库列表。**

## Precautions

**⚠️ ⚠️ ⚠️: The existing customised database should be recreated if you want to update to version 2.3.0. The new version has a new database structure, and the old database structure is not compatible with the new version to build the index properly.**

### 在2.3.0版本之前的自定义数据库用户

**⚠️ ⚠️ ⚠️: 如果你想要更新到2.3.0版本，你需要重新创建自定义数据库。新版本有一个新的数据库结构，旧的数据库结构无法构建索引。**

## TODO List

- Modify the Edit function for the custom properties. 改进自定义属性的编辑功能
- Support sync with long notes (From `v2.4.0`). 从 `v2.4.0` 开始支持长笔记同步
- Support custom properties for Notion General database. 支持自定义属性
- Support preview for database details in plugin settings. 支持预览数据库详情
- Support edit for database details in plugin settings. 支持编辑数据库详情
- Convert Obsidian callouts into Notion callout blocks so your `[!info]` style notes stay consistent after syncing.
- Support group upload with one click 支持一键多数据库上传

## Callout support

Obsidian callouts written with the standard syntax (for example `> [!warning]` or `> [!quote]`) are automatically rendered as Notion callout blocks during upload. The plugin keeps the chosen callout type, title, and body content so your callout styling survives the trip from Obsidian to Notion without extra configuration.

```
> [!info] Tips
> Remember to update your front matter before syncing.
```

After syncing, the note will contain an equivalent Notion callout block with the same icon and text.

If you want to use this plugin, you need to follow the following steps to set up the plugin. The steps can be divided into two parts: setting up the Notion API and setting up the plugin in Obsidian.

1). Go to [Notion API](https://www.notion.com/my-integrations) to create a new integration, and **copy the token**.

[![create-api](https://camo.githubusercontent.com/d4bd96fcf7320d18c615ca500541142a4d1d98d9eceeb282db247586d7449239/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f32383532366534313635373166386231666537306439306264393937356238312e676966)](https://camo.githubusercontent.com/d4bd96fcf7320d18c615ca500541142a4d1d98d9eceeb282db247586d7449239/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f32383532366534313635373166386231666537306439306264393937356238312e676966)

2). Create a database in your Notion workspace.

Open Notion, click top-left `Create` a new page\` -> You can give a title for the page and press "/" Select 'Database - Full page'.

[![create-database](https://camo.githubusercontent.com/7a288cd61aac4d52f5d4417133f68bb2d2d9058fd4c80dba15523cf4744963b4/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f66316264393933656436363762636339383061343531393465623634376333342e676966)](https://camo.githubusercontent.com/7a288cd61aac4d52f5d4417133f68bb2d2d9058fd4c80dba15523cf4744963b4/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f66316264393933656436363762636339383061343531393465623634376333342e676966)

Rename the database properties to `title` and `tags`.**⚠️ ⚠️ `title` is the title column! `tags` is lower case ⚠️ ⚠️**

[![rename-title-tags](https://camo.githubusercontent.com/cc1c8718ca48ffb6ae9a79da1ce39e118eec30b107a9145e9c8516197189c489/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f32306337623831373631313935373036646465366537646165363965646263342e676966)](https://camo.githubusercontent.com/cc1c8718ca48ffb6ae9a79da1ce39e118eec30b107a9145e9c8516197189c489/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f32306337623831373631313935373036646465366537646165363965646263342e676966)

3). Add the Notion API integration.

Click the right-top '...' -> connections -> connect to -> find the integration you created and connect it.

[![add-integration](https://camo.githubusercontent.com/7b22ab7d5732b62719267e9f4a2206bb4ea0ac5441ffdbf45be458e195135afa/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f62663539333937313436643936373237633936646163303635313563366332322e676966)](https://camo.githubusercontent.com/7b22ab7d5732b62719267e9f4a2206bb4ea0ac5441ffdbf45be458e195135afa/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f62663539333937313436643936373237633936646163303635313563366332322e676966)

4). Publish the database to the public. Click the 'Share' -> 'Publish' -> 'Publish' -> **copy the database id from the URL**.

[![share-publish](https://camo.githubusercontent.com/4021e3b7ef830ba806576940649bfd9968f059a1c994765f06a494aa480544a2/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f35653562393538356366613461393038366566363730346333623438656163662e676966)](https://camo.githubusercontent.com/4021e3b7ef830ba806576940649bfd9968f059a1c994765f06a494aa480544a2/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f35653562393538356366613461393038366566363730346333623438656163662e676966)

1). Go to Obsidian settings -> community plugins -> search 'NotionNext' -> install it.[![plugin](https://camo.githubusercontent.com/2dcb38ee51ebb01d5a698d66bb43db3dd20a79df8d4529cec04d16f0e9d2091f/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f31626638323631386539343365633565623638643839643435353662633366632e706e67)](https://camo.githubusercontent.com/2dcb38ee51ebb01d5a698d66bb43db3dd20a79df8d4529cec04d16f0e9d2091f/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f31626638323631386539343365633565623638643839643435353662633366632e706e67)

2). Open the plugin settings and create a new database.

[![add-database](https://camo.githubusercontent.com/7e40bb8ae84524cfd936c64f8a236c2a57804d115878fb5d628ba8bb88d63066/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f31313566343762343138306430346662333632623933316638303932623566622e706e67)](https://camo.githubusercontent.com/7e40bb8ae84524cfd936c64f8a236c2a57804d115878fb5d628ba8bb88d63066/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f31313566343762343138306430346662333632623933316638303932623566622e706e67)

**You can create three types of databases:**

General database is the default database, which only has the `title` and `tags` columns. **⚠️ ⚠️ `title` and `tags` are lowercase ⚠️ ⚠️**

[![general](https://camo.githubusercontent.com/eae78f5b2605220ae4a3348eaab66f570b3d94661ad04412bcb889d0458596ab/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f62326430643032353961666165376135343262643966363232353663643263322e706e67)](https://camo.githubusercontent.com/eae78f5b2605220ae4a3348eaab66f570b3d94661ad04412bcb889d0458596ab/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f62326430643032353961666165376135343262643966363232353663643263322e706e67)

The general is as follows:

- Full Name: the full name that you would like to give to the database.
- Abbreviate Name: the abbreviation that you would like to give to the database.
- Notion tags sync: whether you want to sync the tags column to Notion.
- Customise title property: whether you want to change the `title` to another name (e.g., `name`).
- Notion API token: the token you copied from the Notion API page.
- Notion Database ID: the database ID you copied from the Notion database URL. (e.g., only copy `7158cd3f70ce4f60afd9da5bdf74fd0c` between `site/` and `?`. `https://jxpeng.notion.site/7158cd3f70ce4f60afd9da5bdf74fd0c?v=380317ac5373sadasdas3c13e618f&pvs=4**`)

After setting, it should look like this:

[![general-setting](https://camo.githubusercontent.com/dcb5227a7e981f870921c538fd5a03560267f8e127d1f401f0c4bdde0acf8583/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f33666336333031373166366538616531303131323731623262333764356434382e706e67)](https://camo.githubusercontent.com/dcb5227a7e981f870921c538fd5a03560267f8e127d1f401f0c4bdde0acf8583/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f33666336333031373166366538616531303131323731623262333764356434382e706e67)

Once you click `save`, the new database will be created in the plugin settings and display in the detabase list.

[![database-list](https://camo.githubusercontent.com/4d9e1eb61004f3a8e25391824ca2590ed12f349568feb639d701ffeb326d5bba/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f33646666323362316331336133316637363936646337393466623738656261352e706e67)](https://camo.githubusercontent.com/4d9e1eb61004f3a8e25391824ca2590ed12f349568feb639d701ffeb326d5bba/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f33646666323362316331336133316637363936646337393466623738656261352e706e67)

If you use [NotionNext](https://github.com/tangly1024/NotionNext) to set up your website, you can use the NotionNext database. (**All the properties are in lowercase, and you do not need to change the properties**)

[![notionnext](https://camo.githubusercontent.com/dd8bdde7aeb9ef3b406e3753c64278d31d02cff84d48fe7be892cc578e5578d7/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f62313634313630636366616634666232336161376163316365343637653233352e706e67)](https://camo.githubusercontent.com/dd8bdde7aeb9ef3b406e3753c64278d31d02cff84d48fe7be892cc578e5578d7/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f62313634313630636366616634666232336161376163316365343637653233352e706e67)

Like the general database, you need to fill in the following information:

- Full Name: the full name that you would like to give to the database.
- Abbreviate Name: the abbreviation that you would like to give to the database.
- Notion API token: the token you copied from the Notion API page.
- Notion Database ID: the database ID you copied from the Notion database URL.

The custom database is purely customised, and you can customise the properties you want to sync. (**All the properties are in lowercase, and you do not need to change the properties**)

[![customise](https://camo.githubusercontent.com/11d7ea59d3151d915472e315b65ea210a65dedd872071377507c99e86d1eb82a/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f36313262313337376563393464343532616265633764633366626536636566622e706e67)](https://camo.githubusercontent.com/11d7ea59d3151d915472e315b65ea210a65dedd872071377507c99e86d1eb82a/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f36313262313337376563393464343532616265633764633366626536636566622e706e67)

The basic information is identical to the general database and NotionNext database. You need to fill in the following information:

- Full Name: the full name that you would like to give to the database.
- Abbreviate Name: the abbreviation that you would like to give to the database.
- Notion API token: the token you copied from the Notion API page.
- Notion Database ID: the database ID you copied from the Notion database URL.

After adding the information, You can click `Add New Property` to add the properties you want to sync. There is no limit to the number of properties you can add.

[![customise-add-property](https://camo.githubusercontent.com/c5d68d61b2474974e747abda2c48ff50065535e67c15c1db5a4909f4c6041196/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f31376366626661393364393234303466663730643932303330326631353938312e706e67)](https://camo.githubusercontent.com/c5d68d61b2474974e747abda2c48ff50065535e67c15c1db5a4909f4c6041196/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f31376366626661393364393234303466663730643932303330326631353938312e706e67)

**⚠️ ⚠️ ⚠️**: **`Title column` is the main property in the Notion database, which has the open button to open the underlying page.** You can select the type of all other properties. **⚠️ ⚠️ ⚠️**

[![title-column](https://camo.githubusercontent.com/186148c6cacaf7f1bc87a2cd31d0dc0ba6bf6b7ddd8d0830f8c4dc499d33521f/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f30353231623061613663656462653637626361343936366266373930343165612e706e67)](https://camo.githubusercontent.com/186148c6cacaf7f1bc87a2cd31d0dc0ba6bf6b7ddd8d0830f8c4dc499d33521f/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f30353231623061613663656462653637626361343936366266373930343165612e706e67)

According to the previously shown database, you can use `title` as the `Title column`, and `Tags` as the property 1.

[![title-and-tags](https://camo.githubusercontent.com/30a8566b50091c9b2c119f749a8656f60ca1abef977747be2b2a44c06f44dcb7/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f38373532393231343030383134376433616131626265353836383834396633312e706e67)](https://camo.githubusercontent.com/30a8566b50091c9b2c119f749a8656f60ca1abef977747be2b2a44c06f44dcb7/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f38373532393231343030383134376433616131626265353836383834396633312e706e67)

**Until now, you have set up the plugin in Obsidian. You can start syncing your notes to Notion.**

Create a new note in Obsidian, and fill in the front matter with the properties you want to sync.

For example, we can create a test note with the following front matter:

```
---
title: test
tags: [test, web]
---

This is a test file.
```

After creating the note, you can click the `Share to NotionNext` button on the left sidebar to sync the note to Notion.

[![general-sync](https://camo.githubusercontent.com/e6f3dc6d7d96b4f959c040ef29845bdf5cab8a4c4597eebf4004640afb4d3438/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f36613639306463346230346436623734313334653964336437363633366331622e676966)](https://camo.githubusercontent.com/e6f3dc6d7d96b4f959c040ef29845bdf5cab8a4c4597eebf4004640afb4d3438/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f36613639306463346230346436623734313334653964336437363633366331622e676966)

We use the following front matter for the NotionNext database:

```
---
title: test-notionnext
titleicon: 📎
date: 2023-07-23
coverurl: https://img.jxpeng.dev/2023/08/843e27a210847f05a0f7cfb121fec100.jpg
type: Post
slug: test
status: Draft
category: test
summary: this is a summary for test post
icon: fa-solid fa-camera
password: "1234"
tags:
  - test
  - web
NotionID-pengjiaxin: 8ba573de-8fdf-4681-b063-c39d26e7860e
---

this is a test file
```

![notionnext-sync](https://camo.githubusercontent.com/033b08a8d82e8d803e3c4f6d69d03e3756947f7fbf468256f104fbe032b82587/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f35353339656335333465376138353561643837616137393439653565383336662e676966)

notionnext-sync

Use the previously created general database and rename `title` to `Name` and `tags` to `Tags` in Notion.

[![rename-notion](https://camo.githubusercontent.com/9546ae4845b50d222f966fc8af460f7730526d17dc1390dc8851477f2762c179/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f65346431633938386265323233353335333739393864623839376337613437312e676966)](https://camo.githubusercontent.com/9546ae4845b50d222f966fc8af460f7730526d17dc1390dc8851477f2762c179/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f65346431633938386265323233353335333739393864623839376337613437312e676966)

The front matter for the custom database is as follows:

```
---
Name: test-custom
Tags:
  - test
  - web
---

This is a test file.
```

[![sync-custom](https://camo.githubusercontent.com/91b1d55fa32ce04c0ea5dc28001f6b4f775ce3f6d2ed7ad88443fdbcc9484ab2/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f39373366313739353563643932316363613662353030376630393930656561342e676966)](https://camo.githubusercontent.com/91b1d55fa32ce04c0ea5dc28001f6b4f775ce3f6d2ed7ad88443fdbcc9484ab2/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f39373366313739353563643932316363613662353030376630393930656561342e676966)

Add more property to the custom database. For example, we can add a `summary` and `date` property to the custom database.

1). Click `Edit` in the plugin settings.[![edit](https://camo.githubusercontent.com/a1e8cd707d014d7ea39e65f0201d4795c6f0acb147981bcbba0a5f41dfff50c1/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f66353036333964383131386231663130366437626232396265356433353237622e706e67)](https://camo.githubusercontent.com/a1e8cd707d014d7ea39e65f0201d4795c6f0acb147981bcbba0a5f41dfff50c1/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f66353036333964383131386231663130366437626232396265356433353237622e706e67) 2). Click `Add` and add the `summary` and `date` property.

[![add-property](https://camo.githubusercontent.com/c7ae4658e290ce2d67e43c2e0f4e23e132418813fa8da32aa3dcb11a3f529cf8/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f34393731363635376164663032353561333766613231346162663437313664632e676966)](https://camo.githubusercontent.com/c7ae4658e290ce2d67e43c2e0f4e23e132418813fa8da32aa3dcb11a3f529cf8/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f34393731363635376164663032353561333766613231346162663437313664632e676966)

3). After adding the properties, you can see the properties in the plugin settings.[![four properties](https://camo.githubusercontent.com/3258baf2ec0a7eec033037a91e510e137c6096768f6a9a71f0be0a8cec55aef4/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f36336130613065303964353337623163663535636664633439646534646231612e706e67)](https://camo.githubusercontent.com/3258baf2ec0a7eec033037a91e510e137c6096768f6a9a71f0be0a8cec55aef4/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f36336130613065303964353337623163663535636664633439646534646231612e706e67) 4). Add the `summary` and `date` in Notion

[![add-in-notion](https://camo.githubusercontent.com/d385814e0899abf7a2a36dd05229839ee621502fa74246d6c4c738615516240b/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f64313933666537326365333637366266363433623064316562393264643462372e676966)](https://camo.githubusercontent.com/d385814e0899abf7a2a36dd05229839ee621502fa74246d6c4c738615516240b/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f64313933666537326365333637366266363433623064316562393264643462372e676966)

5). Create a new note with the `summary` and `date` property.

```
---
Name: test-custom-more
Tags:
  - test
  - web
summary: this is a summary for test custom
date: 2022-05-03
---

This is a test file.
```

6). Sync the note to Notion.

[![sync-custom](https://camo.githubusercontent.com/08ecc2229dfff55b9480b661ff30054697350dc899c020c60f71016794b90497/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f30653463666264363161636461663831336664383165653664303436653036372e676966)](https://camo.githubusercontent.com/08ecc2229dfff55b9480b661ff30054697350dc899c020c60f71016794b90497/68747470733a2f2f7232696d672e6a7870656e672e6465762f323032342f30372f30653463666264363161636461663831336664383165653664303436653036372e676966)

---

## Acknowledgment

Thanks to the [original author](https://github.com/EasyChris/obsidian-to-notion) for developing such a useful plugin that can synchronize Obsidian to Notion. However, the original repository can only sync Name and Tag information. For those like me who use [NotionNext](https://github.com/tangly1024/NotionNext) to set up their website, this presents some limitations. Every time I import, I need to make a lot of modifications.

Thus, based on the [original author's work](https://github.com/EasyChris/obsidian-to-notion), I've added a feature to match the [NotionNext](https://github.com/tangly1024/NotionNext) template. This way, you can edit directly in Obsidian and publish with a single click after organizing.

---

Original README.md

Many Thanks for the original author's work. I've only made some changes to the original author's work. If you find this plugin useful, please give the [original author](https://github.com/EasyChris/obsidian-to-notion) a star.

Share of obsidian to Notion [中文文档](https://github.com/takereshui/obsidian-to-notionnext-batch/blob/main/README-zh.md)

Sharing files from Obsidian to Notion with a single click, and Obsidian will automatically add the Notion share link

You are welcome to offer it a star if it can benefit you.

[![](https://github.com/gloria-29/OB-assets/releases/download/img-9a/9ad07efa3eb714887bec285dc303c6bfefce93715d78231d1f7fc8508cacf1b5.gif)](https://github.com/takereshui/obsidian-to-notionnext-batch/blob/main/doc/1.gif)

## TODO

### TODO Board

- support for custom page banner
- update the exsit page
- support for mult language
- support for auto copy the share link to clipboard
- support for mobile
- support tags thank for [@jannikbuscha](https://github.com/jannikbuscha)
- transfer the bi-link format like \[\[\]\] into the format that Notion supports.

### Marketplace download

Open obsidian setting -> Add plugin -> Search -> notion

[![](https://camo.githubusercontent.com/eea757ad20f41948fd627320ce3539e84a1e78dc035d93841e328b0d51a85b5d/68747470733a2f2f61666f782d313235363136383938332e636f732e61702d7368616e676861692e6d7971636c6f75642e636f6d2f32303232303632383231343134352e706e67)](https://camo.githubusercontent.com/eea757ad20f41948fd627320ce3539e84a1e78dc035d93841e328b0d51a85b5d/68747470733a2f2f61666f782d313235363136383938332e636f732e61702d7368616e676861692e6d7971636c6f75642e636f6d2f32303232303632383231343134352e706e67)

### BRAT

Enter `BRAT` into the plugin market center to find it. Add `EasyChris/obsidian-to-notion` to the list of BRAT plugins that have been installed. Return to the plugin center and turn it on.

### Manual installation

```
cd YOUR_OBSIDIAN_FOLDER/.obsidian/plugins/
git clone https://github.com/EasyChris/obsidian-to-notion.git
```

Official reference documentation: [https://developers.notion.com/docs](https://developers.notion.com/docs)

Go to [https://www.notion.com/my-integrations](https://www.notion.com/my-integrations) Once created, copy `secrets toekn` [![](https://camo.githubusercontent.com/d11b8ab01ff59b0951c697396a9dcb8b15da6a6351b80b930729a2df9489d2ce/68747470733a2f2f66696c65732e726561646d652e696f2f326563313337642d303933616434392d6372656174652d696e746567726174696f6e2e676966)](https://camo.githubusercontent.com/d11b8ab01ff59b0951c697396a9dcb8b15da6a6351b80b930729a2df9489d2ce/68747470733a2f2f66696c65732e726561646d652e696f2f326563313337642d303933616434392d6372656174652d696e746567726174696f6e2e676966)

#### Note

database first custom name must be "Name", otherwise sync to notion will be failed

Create a new page (with public permissions) Create a new database in the page -> you need `full page database` [![](https://github.com/gloria-29/OB-assets/releases/download/img-13/132a836d18aa36f75e9b5bee278d859b65753e3ddda416f0e10354a2ba2280b0.gif)](https://github.com/takereshui/obsidian-to-notionnext-batch/blob/main/doc/3.gif)

Add `integration` to your new database

[![](https://github.com/gloria-29/OB-assets/releases/download/img-69/694b2c2fc7c4969c6099a120336ff527206223dc5d13887c0ba93bbea220e31b.gif)](https://github.com/takereshui/obsidian-to-notionnext-batch/blob/main/doc/6.gif)

```
https://www.notion.so/myworkspace/a8aec43384f447ed84390e8e42c2e089?v=...
                                  | --------- Database ID --------|
```

Fill the configuration with the `NOTION_API_KEY` and `DATABASE_ID` you got [![](https://github.com/gloria-29/OB-assets/releases/download/img-10/10fb753b5eb532997e4f44b09ad203db5f007bb1e79bee84d5c5cb90985243e5.png)](https://github.com/takereshui/obsidian-to-notionnext-batch/blob/main/doc/2.png)

Click the uploadCommand notion button [![](https://github.com/gloria-29/OB-assets/releases/download/img-b0/b08965bf1ac40131939bc652810dcac24f671d8704dcfd7454cf9420e3d0a2c5.png)](https://github.com/takereshui/obsidian-to-notionnext-batch/blob/main/doc/4.png) A share link will be automatically generated after successful uploadCommand [![](https://github.com/gloria-29/OB-assets/releases/download/img-58/586895068688590ed5497b5acff2456f4ef4b7d521d31c42b6614d2d76197a9e.png)](https://github.com/takereshui/obsidian-to-notionnext-batch/blob/main/doc/5.png)

Banner url must be a image url like: [https://i.imgur.com/xxx.jpg](https://i.imgur.com/xxx.jpg) If you don't want to use banner, leave it blank

Transfer the Obsidian tags to the Notion table. It requires the column with the name 'Tags'.[![](https://github.com/gloria-29/OB-assets/releases/download/img-fd/fd2dc3449e005ceb4bf4394f5b32df82f9b2a3196f043a1b56ec8848b442735c.png)](https://github.com/takereshui/obsidian-to-notionnext-batch/blob/main/doc/7.png)

Add tags to your notion page

- open plugin convert tags

[![](https://github.com/gloria-29/OB-assets/releases/download/img-86/868fc846fa87a223d8edb57158c1d78721fa56d7f6b5494b00693b499cff5009.png)](https://github.com/takereshui/obsidian-to-notionnext-batch/blob/main/doc/8.png)

- add tags in the head
```
---
tags: [tag1,tag2]
---

this is test tags
```
```
---
tags:
  - tag4
---

this is test tags
```

[![](https://github.com/gloria-29/OB-assets/releases/download/img-89/89f9417845c717b9162bd7d2f690631d5bf59225768ae829f5aba351ca913183.png)](https://github.com/takereshui/obsidian-to-notionnext-batch/blob/main/doc/9.png)

Thanks for [@jannikbuscha](https://github.com/jannikbuscha) contribution

Notion ID is the your notion site ID that you want to share the file to. if you don't write it, notion will share to the default link like:[https://www.notion.so/myworkspace/a8aec43384f447ed84390](https://www.notion.so/myworkspace/a8aec43384f447ed84390) that visit this page need to redirect to your site url if you write the Notion ID, it will share to the page link like:[https://your\_user\_name.notion.site/myworkspace/a8aec43384f447ed84390](https://your_user_name.notion.site/myworkspace/a8aec43384f447ed84390). The visiter don't need to redirect url.

To sync images to your oss or cos bucket, use the [Obsidian Image Auto Upload Plugin](https://github.com/renmu123/obsidian-image-auto-upload-plugin).

## Development

```
git clone https://github.com/EasyChris/obsidian-to-notion.git
yarn install
yarn dev
```

## Release

```
node update-version.js
./release.sh
```

## Thanks

[Development Process | Obsidian Plugin Development Documentation](https://luhaifeng666.github.io/obsidian-plugin-docs-zh/zh/getting-started/development-workflow.html)

[GitHub - devbean/obsidian-wordpress: An obsidian plugin for publishing docs to WordPress.](https://github.com/devbean/obsidian-wordpress)

[GitHub - obsidianmd/obsidian-api](https://github.com/obsidianmd/obsidian-api)

[GitHub - Easychris/obsidian-to-notion: Obsidian Weread Plugin is an plugin to sync Weread(微信读书) hightlights and annotations into your Obsidian Vault.](https://github.dev/zhaohongxuan/obsidian-weread-plugin)

[GitHub - Quorafind/Obsidian-Memos: A quick capture plugin for Obsidian, all data from your notes.](https://github.com/Quorafind/Obsidian-Memos)

[https://github.com/jannikbuscha/obsidian-to-notion](https://github.com/jannikbuscha)

## License

GNU GPLv3

## Releases 3

[\+ 2 releases](https://github.com/takereshui/obsidian-to-notionnext-batch/releases)

## Packages

No packages published  

## Languages

- [TypeScript 97.7%](https://github.com/takereshui/obsidian-to-notionnext-batch/search?l=typescript)
- [JavaScript 2.1%](https://github.com/takereshui/obsidian-to-notionnext-batch/search?l=javascript)
- Other 0.2%

# 高亮内容

