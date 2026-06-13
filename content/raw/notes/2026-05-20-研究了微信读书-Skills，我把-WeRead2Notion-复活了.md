---
标题: 研究了微信读书 Skills，我把 WeRead2Notion 复活了
笔记 ID: 019e4426-9e1e-7622-9db8-d8e4bdd42303
笔记类型: crawl
tags:
    - 阅读/读书笔记
卡片盒:
    - 工作
包含语音: 否
网页链接:
创建时间: "2026-05-20T14:50:42.091"
更新时间: "2026-05-20T14:51:44.147"
---

![](https://github.com/gloria-29/OB-assets/releases/download/img-43/43b46e6ad1c3379576ebea5aa51ee6abc32f5e28b3720ccdf8efe9088282c215.jpeg)

昨天把 Skills 包解压之后，发现里面放的其实是一组微信读书 API 文档，包括书籍、书架、笔记、搜索、阅读数据等接口说明。

![微信读书 Skills 解压后的 API 文档](https://github.com/gloria-29/OB-assets/releases/download/img-2e/2e89008f65b5f3ace4eaf45e227c4c076197e9ccc91ee3ddd325f2d0bbfd69dc.jpeg)

微信读书 Skills 解压后的 API 文档

WeRead2Notion去年因为微信读书修改了接口这个项目停更了。这次看到这些文档后，我就参考里面的 API 重新梳理了一遍项目：去掉 Cookie，改成 API Key。

所以，这篇文章就记录一下新版 WeRead2Notion 怎么用。

WeRead2Notion 用于将微信读书的划线、想法和书籍信息自动同步到 Notion。新版已经改为 GitHub Action + 微信读书 API Key 的方式运行，不再需要复制微信读书 Cookie。

WeRead2Notion 会在检测到书籍笔记更新时删除原来的同步页面，然后重新写入微信读书数据。请不要在同步生成的书籍页面里添加自己的笔记、批注或其他重要内容，否则下次同步时可能会被删除且无法恢复。

开源版 WeRead2Notion 只能使用开发者提供的 Notion 模板。不要直接换成自己的数据库或其他模板，否则可能因为属性不一致导致同步失败。

如果你想同步到自己的 Notion 模板，或需要调整字段、页面结构、展示样式，可以联系开发者定制。

预览效果：https://malinkang.notion.site/weread2notion?

![WeRead2Notion 预览效果](https://github.com/gloria-29/OB-assets/releases/download/img-cd/cdc3e27aa4794da17547e6a9206ceb0145b50dabc2b9832de320e7b9d9e8c120.jpeg)

WeRead2Notion 预览效果

## **准备工作**

开始之前需要准备 3 个值：

| **名称**           | **用途**                               | **是否必填** |
| ---------------- | ------------------------------------ | -------- |
| &#96;WEREAD_API_KEY&#96; | 微信读书 Gateway API Key，用于读取微信读书数据      | 必填       |
| &#96;NOTION_TOKEN&#96;   | Notion Integration Token，用于写入 Notion | 必填       |
| &#96;NOTION_PAGE&#96;    | Notion 模板页面链接，用于确定同步到哪个模板            | 必填       |

## **1. 复制 Notion 模板并获取授权信息**

第一步先把开发者提供的 WeRead2Notion 模板复制到你的 Notion，并拿到后面要用的 &#96;NOTION_TOKEN&#96; 和 &#96;NOTION_PAGE&#96;。

1. 打开授权链接：
  https://api.notion.com/v1/oauth/authorize?client_id&#61;801fd03a-a44f-41af-9a17-feb048b4bbdd&amp;response_type&#61;code&amp;owner&#61;user&amp;redirect_uri&#61;https%3A%2F%2Fnotion-auth.malinkang.com%2Fweread2notion-oauth-callback
2. 点击 &#96;Next&#96;，选择开发者提供的 WeRead2Notion 模板进行授权。
  ![](https://github.com/gloria-29/OB-assets/releases/download/img-34/34396388d51b3ac56c1762dad9975d384b53944d75ee0deb0883410c23645f5d.png)
3. 点击 &#96;Allow access&#96;。
  ![](https://github.com/gloria-29/OB-assets/releases/download/img-a0/a094c13aa2ed09859dd848ff6e4ac31e5b9ab11975b0200f50d1af17468372d3.png)
4. 在授权结果页面复制 &#96;NOTION_TOKEN&#96;。
5. 在授权结果页面复制 &#96;NOTION_PAGE&#96;。

授权成功后页面大概如下，点击右侧的复制按钮即可：

![Notion 授权成功后复制 Token 和页面信息](https://github.com/gloria-29/OB-assets/releases/download/img-5a/5aa75d13138dfd9da0887c9d89f1b526616ef904c8e125d3155fb75e81610aef.jpeg)

Notion 授权成功后复制 Token 和页面信息

先把这两个值临时保存到本地备忘录里，后面会一起填到 GitHub Secrets。

## **2. 获取微信读书 API Key**

第二步获取 &#96;WEREAD_API_KEY&#96;，它用于读取你的微信读书数据。

1. 打开微信读书 Skills 页面：
  https://weread.qq.com/r/weread-skills
2. 使用微信读书账号登录。
3. 登录后点击 &#96;创建 Key&#96;。
4. 创建完成后点击 &#96;复制 Key&#96;，复制出来的内容就是后面要填写到 GitHub Secrets 里的 &#96;WEREAD_API_KEY&#96;。

![微信读书 API Key 获取示例](https://github.com/gloria-29/OB-assets/releases/download/img-a9/a924b76da2341a815bbbd5f8cfe01cc7aa7c97b0eecc5687675463be4d873ff1.jpeg)

微信读书 API Key 获取示例

## **3. Fork 项目**

第三步把 WeRead2Notion 项目复制到你自己的 GitHub 账号下。对小白用户来说，直接 Fork 最简单，不需要自己创建 workflow 文件。

打开开源项目：

https://github.com/malinkang/weread2notion

点击右上角的 &#96;Fork&#96;，把项目复制到你自己的 GitHub 账号下。如果你觉得项目有用，Fork 的时候也可以顺手点一下 Star。

![点击 GitHub 右上角 Fork 按钮](https://github.com/gloria-29/OB-assets/releases/download/img-1d/1d557793dad22d5926476de7e8bc2f1ee7f2658a155468b5c896b5ed9efd32a9.jpeg)

点击 GitHub 右上角 Fork 按钮

进入创建 Fork 页面后，一般保持默认设置即可，然后点击 &#96;Create fork&#96;。

![创建 GitHub Fork](https://github.com/gloria-29/OB-assets/releases/download/img-df/dfed7f1e8c3d7c2a73b5abae5d3ef4e61ca87c84a3c95f49f98d3f4e522b9376.jpeg)

创建 GitHub Fork

Fork 完成后，进入你 Fork 后的仓库，点击 &#96;Actions&#96;。

![进入 GitHub Actions 并启用 workflow](https://github.com/gloria-29/OB-assets/releases/download/img-c8/c8508e4096711e9231ccec841777eb98fc44f41de7f2185f1d0a70869419b427.jpeg)

进入 GitHub Actions 并启用 workflow

如果 GitHub 提示需要启用 workflow，点击同意启用即可。

如果进入后看到 &#96;weread sync&#96; 还是 Disabled，可以先点击左侧的 &#96;weread sync&#96;，然后点击右侧的 &#96;Enable workflow&#96;。

![启用 weread sync workflow](https://github.com/gloria-29/OB-assets/releases/download/img-b4/b48cbf71a079ae4cd0d6bf8a48c74ab386b3b142656dbd6f62be231b444a2011.jpeg)

启用 weread sync workflow

## **4. 填写 GitHub Secrets**

第四步把前面拿到的 3 个值填到 GitHub Secrets 里。

打开你 Fork 后的仓库，依次进入：

&#96;Settings -&gt; Secrets and variables -&gt; Actions -&gt; New repository secret&#96;

![](https://github.com/gloria-29/OB-assets/releases/download/img-6e/6ea06839141c101225d044a397c755a2312ac02c83e0f41b8955bc8b569ad4f1.jpeg)

添加下面 3 个 Secret：

| **Secret 名称**    | **填写内容**             |
| ---------------- | -------------------- |
| &#96;WEREAD_API_KEY&#96; | 第 2 步复制的微信读书 API Key |
| &#96;NOTION_TOKEN&#96;   | 第 1 步授权后得到的 Token    |
| &#96;NOTION_PAGE&#96;    | 第 1 步授权后得到的模板页面链接    |

Secret 名称必须完全一致，一个字母都不能错。值里面不要主动添加引号。

## **5. 手动运行一次**

进入仓库的 &#96;Actions&#96; 页面，选择 &#96;weread sync&#96;，点击 &#96;Run workflow&#96;。

![](https://github.com/gloria-29/OB-assets/releases/download/img-94/944908fc21f51d91d1fcf77cd34126bb43d5e260500729e1775e8fd240523a05.jpeg)

运行成功后，打开 Notion 模板查看是否出现书籍页面。首次同步通常会慢一些，因为需要读取书籍、划线、想法和章节信息。

## **后续如何升级**

如果后续项目有更新，你可以打开自己 Fork 的仓库首页，点击 &#96;Sync fork&#96;，把最新代码同步到你的仓库。

## **Notion 模板属性要求**

新版同步会在开始时动态读取你当前 Notion data source 的属性，不再强制要求所有属性都存在。

必须保留：

| **属性名**  | **建议类型**  | **用途**     |
| -------- | --------- | ---------- |
| &#96;BookId&#96; | Rich text | 用于识别同一本书   |
| &#96;Sort&#96;   | Number    | 用于判断增量同步位置 |

可选属性：

| **属性名** | **建议类型**        | **说明**                                       |
| ------- | --------------- | -------------------------------------------- |
| &#96;链接&#96;    | URL             | 微信读书网页链接                                     |
| &#96;作者&#96;    | Rich text       | 作者                                           |
| &#96;ISBN&#96;  | Rich text       | ISBN                                         |
| &#96;评分&#96;    | Number          | 评分                                           |
| &#96;分类&#96;    | Multi-select    | 书籍分类                                         |
| &#96;状态&#96;    | Status 或 Select | 在读 / 读完                                      |
| &#96;阅读进度&#96;  | Number          | 小数格式，例如 &#96;0.5&#96;、&#96;0.99&#96;，建议在 Notion 中显示为 Percent |
| &#96;阅读时长&#96;  | Rich text       | 阅读时长文本                                       |
| &#96;时间&#96;    | Date            | 读完时间                                         |

如果你删除了某个可选属性，脚本会自动跳过它，不会因为缺少可选属性导致同步失败。

## **已经 Fork 过的用户怎么办**

如果你以前已经 Fork 过 &#96;malinkang/weread2notion&#96;，建议先打开自己的 Fork 仓库，点击 &#96;Sync fork&#96; 同步到最新版。

同步完成后，检查 GitHub Secrets 是否已经按本文改成下面 3 个：

- &#96;WEREAD_API_KEY&#96;
- &#96;NOTION_TOKEN&#96;
- &#96;NOTION_PAGE&#96;

旧版 Cookie 相关的 Secret 不再需要。

## **问题排查**

### **1. GitHub Actions 显示红色失败**

可以点击你 Fork 项目的 &#96;Actions&#96;，查看运行状态。绿色是成功，红色是失败。

![](https://github.com/gloria-29/OB-assets/releases/download/img-7f/7fa36299e79ce20a093ba1ce16c356ad7c7a91e75e014d6300f3c73903b7f451.jpeg)

点进失败的 Action，展开 &#96;Sync WeRead to Notion&#96; 日志。

![](https://github.com/gloria-29/OB-assets/releases/download/img-cb/cbd26cd53c3189da17a05325b9f678f5b8285c2017700f515a89ac5c151a9878.jpeg)

![](https://github.com/gloria-29/OB-assets/releases/download/img-22/22c4daf5da5db90d89d085996d6825bc7d4909791282d674759ad1ec342a9cef.jpeg)

### **2. 提示缺少** &#96;BookId&#96; **或** &#96;Sort&#96;

说明你的 Notion 模板里缺少必填属性。请在目标数据库里新增：

- &#96;BookId&#96;
- &#96;Sort&#96;

这两个名字需要保持一致。

### **3. 有些属性没有写入**

如果你删除了 &#96;链接&#96;、&#96;分类&#96;、&#96;评分&#96;、&#96;阅读进度&#96; 等可选属性，脚本会自动跳过。要写入这些数据，请在 Notion 模板中重新添加对应属性。

### **4. 为什么有的书没有同步**

开源版主要同步有划线或笔记的书。没有划线、没有想法、也没有进入笔记列表的书，可能不会出现在结果中。

### **5. 每天什么时候同步**

示例 workflow 使用的是：

&#96;&#96;&#96;
schedule:
  - cron: &quot;0 0 * * *&quot;

&#96;&#96;&#96;

这是 UTC 时间 0 点，对应北京时间早上 8 点。GitHub Actions 定时任务可能会有几分钟延迟。

## **常见提醒**

- 不要把 &#96;WEREAD_API_KEY&#96;、&#96;NOTION_TOKEN&#96; 直接写进公开仓库代码。
- 不要在同步生成的 Notion 书籍页面里直接添加自己的笔记；脚本发现书籍有新笔记时会删除旧页面并重建，手写内容可能会丢失。
- 如果需要补充个人笔记，建议单独新建页面或数据库，不要写在 WeRead2Notion 自动生成的页面里。
- 开源版 WeRead2Notion 请使用开源版对应的 Notion 模板，不要和其他微信读书同步模板混用。
- 如果你需要更完整的微信读书同步能力，可以使用 NotionHub 微信读书付费服务。

## **如果你想长期认真用，可以看看 NotionHub 微信读书**

开源版 WeRead2Notion 适合想折腾、想自己维护 GitHub Actions 的用户。它的定位比较单一：把微信读书里的书籍、划线和想法同步到 Notion。

如果你希望把微信读书真正当成自己的阅读系统长期使用，更推荐 NotionHub 微信读书服务。

NotionHub 微信读书支持：

- **可以在 Notion 里写自己的笔记**：不会像开源版一样每次更新都删除整本书页面重建，更适合长期积累。
- **增量同步**：只同步新增或变化的数据，减少重复写入，也更适合数据量比较大的账号。
- **阅读热力图**：把每天阅读情况做成类似 GitHub Contributions 的热力图，直观看到自己的阅读习惯。
- **每日阅读数据同步到 Notion**：每天读了多久、读了几本、写了多少笔记、划了多少线，都可以沉淀到 Notion。
- **书架书籍同步到 Notion**：不只是同步有划线和笔记的书，也可以把微信读书书架里的书籍同步到 Notion。
- **更完整的阅读看板**：支持最近在读、书架、作者、分类、章节、阅读时长、阅读进度等更多维度。

预览效果：https://malinkang.notion.site/book

![NotionHub 微信读书预览](https://github.com/gloria-29/OB-assets/releases/download/img-69/69074ceb4394c5a5d970fc17cad01232dac3d9121bc1856b4fec09a69392f186.jpeg)

NotionHub 微信读书预览

简单来说：

- 如果你想在 Notion 里长期维护自己的阅读系统、写自己的笔记、看阅读统计和热力图，可以使用 NotionHub 微信读书。

NotionHub 还提供豆瓣、小宇宙播客、Flomo、Keep、网易云音乐等多种同步能力，适合把不同平台的数据统一整理到 Notion 中。

&gt; 来自：[https://mp.weixin.qq.com/s/BnFrGbRATdIdrlePxDr8xQ](https://mp.weixin.qq.com/s/BnFrGbRATdIdrlePxDr8xQ)
