---
标题: 藏师傅开发的 Codepilot 保姆级入门攻略
笔记 ID: 019d7214-c23e-7c57-a8af-bc95c8c63e7b
笔记类型: crawl
tags:
    - 生活/电子工具
卡片盒:
    - 生活
包含语音: 否
网页链接:
创建时间: "2026-04-09T19:50:56.328"
更新时间: "2026-04-09T19:52:36.964"
---

![](https://github.com/gloria-29/OB-assets/releases/download/img-5e/5ea8928da20fa39e37ccaa6891e7552929423dad0d31e4489e35052e1de3fa50.jpeg)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

TUTORIAL

  


# **终于到了我觉得可以给 Codepilot 写个保姆级入门攻略的时候了。**

这篇文章将会介绍从安装到配置服务商到 Codepilot 所有特色功能的使用。

我们直接开始。

![Codepilot 封面](https://github.com/gloria-29/OB-assets/releases/download/img-23/23d3538c9b424c9b2db97c4aff5379253065f301cc8891ee9368ce239accca65.webp)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

  


## **简单介绍一下Codepilot**

Codepilot 是藏师傅从今年一月开始纯 Vibe Coding 写个一个全平台通用开源 Agent 客户端。

截止目前已经迭代了几百个版本，github 的 Star 也来到了 5100.

支持你能想到的小龙虾和 ClaudeCode 等 Agent 所有的能力，比如：

•

支持 Claude、OpenAI 授权登录、支持几乎所有国产模型 Codeplan；

•

Skills、MCP、Plugin 的安装和使用；

•

内置设计 Agent 可以调用 Nano Banana 帮你生成图片；

•

内置 CLI 看板帮你推荐和安装各种 AI 友好的 CLI 工具；

•

支持飞书、微信、QQ、Discord 等 IM 工具远程连接；

•

支持详细的 Token 用量统计功能；

•

内置助理模式，跟你的 Obsidian 配合可以帮你整理和记忆上下文处理定时任务；

•

支持生成式 UI 能力帮你可视化解释概念和生成相关可交互的 UI。

![Codepilot 功能展示](https://github.com/gloria-29/OB-assets/releases/download/img-a8/a8826cfae68d1114b28009bb05448161129cfc4b8e60d5e8ed98f1d0bc97a893.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

  


## **安装应用**

Codepilot 支持 Mac OS、Windows、Linux 全平台。

你可以在 Codepilot Github 项目主页（https://github.com/op7418/CodePilot）右下角的 Releases 部分获取到最新版本的安装包。

![Releases 页面](https://github.com/gloria-29/OB-assets/releases/download/img-66/660cd805ff1a26830007c2bd0324fde2516fd4291c6c526d4e00ab106bb685c7.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

进入版本页面后可以点击自己需要的版本链接进行下载。

Mac OS 也就是苹果用户需要区分自己的 CPU 版本，不要下错，不然会很卡。

![Mac 版本选择](https://github.com/gloria-29/OB-assets/releases/download/img-25/251bb35ad9c6c58fdda1bf5bfdc4bcdf171d87afed1d34d50cfdf9b614a9f535.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

安装完成后Windows 用户首次打开应该会弹一个警告，选择继续安装就可以了。

Mac OS 用户就稍微麻烦一些，因为我们没有进行公证和签名。

所以你打开的时候苹果会拦截，让你移入垃圾桶，这个时候不要管直接完成就行。

然后去到系统设置页面的隐私与安全分类，下滑会有个仍要打开，点击打开就行。

![Mac 安全设置](https://github.com/gloria-29/OB-assets/releases/download/img-7b/7b58541c4e4860aa67f8235f85a18126c741dce430cdd58b4bf9f0df95bb5441.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

  


## **配置服务商**

安装完成之后我们就需要配置一下模型的 API 了，毕竟我们是开源产品，没办法直接配置 API 让大家免费用。

我们进入到设置-服务商页面-添加服务商就可以配置你的 API 了。

### **国产模型 Code Plan 配置**

我们先来说简单的，Codepilot 支持几乎所有国产模型的 Codeplan 配置。

我们以智谱为例子，其实非常好配置。

你在智谱的 Codeplan 页面获取到自己的 API 之后，直接选择 GLM （CN）右边的连接.

![智谱连接](https://github.com/gloria-29/OB-assets/releases/download/img-fa/fab2bda0ff1c5191c527a457687f5f80c65eb6da3381db3bde16de9a5f50726e.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

打开弹窗填写你在智谱获取到的 Codeplan API Key 就行。

弹窗里还有 API Key 的获取连接，你要找不到可以从这里打开。

其他的 Code plan 几乎也是这样的，大部分填写 Key 就行。

火山的 Codeplan 需要注意得填一个他们的模型名称可以在他们文档里面找，另外如果你选择的 Auto 的话只能填固定的一个名称换其他支持的模型名称是不起作用的。

Codepilot 目前支持智谱、MiniMax、Kimi、MIMO、火山方舟、阿里云百炼这几个渠道的 Codeplan。

填写完 Key 也可以点一下连接测试看看能不能连通。

![连接测试](https://github.com/gloria-29/OB-assets/releases/download/img-37/37948870f4b34778f39430ab56c44d42287e3d9ae802d9760a5ff02cdfa354b5.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

### **三方 Anthropic 服务配置**

大部分人出问题在这里，如果你用的国内的三方 Claude 模型代理 API，我们可以这样配置。

你需要在服务商这里选择 Anthropic Third-party API 这个渠道。

![三方 API 选择](https://github.com/gloria-29/OB-assets/releases/download/img-be/be08e376f4ad8a579f0238cb65dbe8a5f643c2d0d8c1f9e4e20b07c4ef5579c4.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

然后打开弹窗后我们就能看到一堆需要填写的东西，如果你用过 CC Switch 你就感觉很熟悉。

我们一个一个说。

![配置表单](https://github.com/gloria-29/OB-assets/releases/download/img-4b/4b7f7665fca48d5a0b5f037d18a18a2399833dac72754d28660723764267b4f2.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

**名称**：这里就是你的渠道名称，一般你随便填就行，主要是为了让你好区分。

**基础 URL**：这里就是你的服务商文档里面给你的地址，这里注意你需要去服务商文档的 ClaudeCode 部分找这个地址才行。

**API Key**：这里有两个选项，如果你的服务商给的配置文件API Key 前面的变量名包含 AUTH，那你这里就得选 AUTH，如果是 API Key 的话你就得选 API Key。

![环境变量](https://github.com/gloria-29/OB-assets/releases/download/img-e2/e2f0df801da2c1ab38b1fd218db29aa0a1ff416d7f0db1c528e80875a045908a.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

然后如果你的服务商要求你对模型名称也进行设置的话，比如上面这张图的环境变量里面前面的变量有 HAIKU、OPUS 和 SONNET 三个，那你就得展开更多将它要求的模型名称填到对应的输入框里面。

最后的额外环境变量这里可以不用管。

### **读取 Claude Code 的配置**

有的朋友是买的 Claude Pro 或者 Max 会员想要使用自己的额度。

首先你肯定需要安装一个 ClaudeCode 和在上面登录。

如果你没有安装的话也可以在设置-Claude Code 的 ClaudeCode 状态这里一键安装和更新。

之后在执行引擎这里更换为 Claude Code。

![执行引擎切换](https://github.com/gloria-29/OB-assets/releases/download/img-d5/d55715225fc9ddb0bf162c2dd4a58bc2bf7e1100186416be7a8cc3d0042d0407.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

你的输入框下面的模型选择就会出现 Claude Code 的分类，直接选择就行。

![模型选择](https://github.com/gloria-29/OB-assets/releases/download/img-a4/a482a438c96613d584f777547d6ca9076c2850291eb384f2d9f4b3881d80d2f6.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

需要注意的是这里只能读取你的 Anthropic 登录的状态以及你手动设置的Claude Code 全局环境变量。

如果你用的 CC Switch 或者类似产品配置的 Codepilot 是读不到的，你可以按照前面三方 Anthropic API 的添加方式重新在 Codepilot 添加。

如果你想要像 Claude Code 里面调整思考深度和开启 1M 上下文的话可以在设置的 Claude Code 部分开启。

这里也可以导入你之前在 Claude Code 中的聊天记录。

![聊天记录导入](https://github.com/gloria-29/OB-assets/releases/download/img-45/45754550da134fba0e6276f0bc656a1475be1cf892c4340c2c80a2cc93b01442.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

### **Open AI 账号授权登录**

Codepilot 也支持使用 Open AI 授权登录的方式使用你的 GPT Plus 或者 Pro 的模型额度。

只需要在设置-服务商这里选择使用 chatgpt 登录。

之后在弹出的网页里面授权就可以了。

![OpenAI 授权](https://github.com/gloria-29/OB-assets/releases/download/img-df/dfb44bfa64135d4a4af039d50f7558e4445aa516ad925465dc63d0a1b1dbacc9.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

之后你就可以在输入框部分的模型选择位置看到 GPT-5.4 等 OpenAI 模型。

![OpenAI 模型](https://github.com/gloria-29/OB-assets/releases/download/img-fb/fbb78269a8ae4f03e46a299aaa6b27a14a3e6064982147b88b451666eb00859c.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

需要注意的是我们这里选择了 Open AI 的模型之后就会默认将 Agent 架构切换到 AI SDK 写代码能力相较于 ClaudeCode 可能会差一些。

### **Ollama 本地模型**

前几天谷歌新发布的 Gamma 4 非常强大，很多朋友也想用 Codepilot 跑本地模型。

所以我就支持了 Ollama 的连接，你可以在安装 Ollama 并且装上你想要的模型。

然后选择服务商这里的 Ollama 连接就可以，需要输入一下模型名称。

这里输入你在 Ollama 安装时候用的模型名称就行，之后就能在输入框的模型选择部分看到了。

![Ollama 配置](https://github.com/gloria-29/OB-assets/releases/download/img-5d/5d47f3dd9a8e7d20f71266dd4e5a731497830baacd445b7689b36eadb6ab05c6.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

  


## **进行简单的聊天**

配置完服务商之后我们终于可以跟 AI 聊天了。

Codepilot 跟 Codex 和 ClaudeCode 类似都是项目制的，每个聊天都需要有个项目。

这里的项目指的就是你本地的文件夹，点击这里的新建项目选择一个文件夹开始对话。

AI 可以看到和操作你项目下的所有文件。

![新建项目](https://github.com/gloria-29/OB-assets/releases/download/img-be/bef7b28e367acf161d659f7ff28ea0b94f1aeaf5e5585603407c2c51bca984fb.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

如果你还没有新建项目的话点击新聊天就会要求你选一个项目，然后才会在项目里面新建聊天。

新建聊天之后的东西大家应该都很熟悉了：

•

最上方是聊天的名称和文件夹（项目）的名称，你可以点击那个笔的图标更改聊天名称，也可以点击文件夹名称直接打开那个文件夹。

•

页面最右边就是文件夹下的文件了，点击对应的文件可以预览这个文件。

•

下方输入里面加号就是添加文件，模型名称那里可以切换你添加的所有模型。

•

最下方可以切换代码和计划模式，如果你用过 ClaudeCode 应该了解这个，如果你的任务很复杂我建议先开启计划模式。

•

输入框下面那个默认权限代表AI 在操作文件和一些敏感权限的时候需要你的授权，如果你切换成完全访问的话 AI 就完全自动执行任务了。

![聊天界面](https://github.com/gloria-29/OB-assets/releases/download/img-17/17a825e128ae754d9effc7a3606ad7b7b9e37fd7b9e21d7a40021b7ee1db1145.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

  


## **Skills 和 MCP 的安装、使用**

Codepilot 支持安装和使用各种 Skills 和 MCP，你已经安装的这里也都可以使用。

你可以在左侧的 Skills 选项打开 Skills 管理面板，这里我的技能部分会展示你已经安装的 Skills 和插件。

你可以点击之后预览他的 Skill.md 文件来查看具体的功能。

![Skills 面板](https://github.com/gloria-29/OB-assets/releases/download/img-d5/d55ca782a67ac5dd26b834e604a282479f7b2af5de3adf0bab47bc240e51871c.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

Codepilot 也内置了Skills.sh 这个 Skills 市场，切换到左侧技能市场就能访问。

你可以搜索你想要的 Skills 关键词查找，比如我这里就搜的我的 github 名字找到了藏师傅发布的所有 Skills。

选择你想要的点安装就可以了。

![Skills 市场](https://github.com/gloria-29/OB-assets/releases/download/img-7a/7a4a1695ec220dbd9d31f28091335222fe9b01fbd64b6cebaff623021c43af9b.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

MCP 的话就可以点击左侧的&quot;MCP&quot;切换到 MCP 管理面板，可以看到你所有已经安装的 MCP 服务。

也可以点击添加服务器安装自己需要的其他 MCP。

![MCP 面板](https://github.com/gloria-29/OB-assets/releases/download/img-c9/c9c59562ef6d61cec9fdfcbcb18cc534b01f2cf8801b21b12d2872768d3df4d3.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

Skills 使用的话也很简单直接在输入框跟 AI 说大致的功能加上 Skills 单词就行，或者可以点输入框的闪电图标的斜杠命名查看支持的所有 Skills，也可以搜索。

![Skills 使用](https://github.com/gloria-29/OB-assets/releases/download/img-a9/a93caca48fcb045690d9adba5d458e3b29d6efef0573deeaafb5ad01f8effc07.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

MCP 的使用的话就直接跟 AI 说就行。

![MCP 使用](https://github.com/gloria-29/OB-assets/releases/download/img-4f/4f63d24a63f9d8a26ba601c272f4329a330946ec5e5a3c0e5239a43d4fceba9f.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

  


## **CLI 工具的管理和使用**

CLI 也是现在 Agent 生态中不可或缺的一部分，Codepilot 内置了 CLI 工具商店。

里面有很多藏师傅筛选的很有用的 CLI 工具，比如剪辑视频的 ffmpeg 以及飞书 CLI 等。

点击左侧 Tab 的&quot;CLI 工具&quot;选项就可以看到很多推荐的工具，在弹窗里面点击安装就可以调用你的 AI 帮你安装了。

弹窗卡片里面也有这个工具的介绍可以教你使用。

![CLI 工具商店](https://github.com/gloria-29/OB-assets/releases/download/img-bb/bb9517ed908cd8000babca0ac42fad15adc41a4b96dfec543c8bf12753fba80e.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

  


## **设计模式和素材库**

Codepilot 支持设计 Agent 模式，这个模式下 AI 会帮你生成图片，而且支持连续编辑和批量生成。

![图片](https://github.com/gloria-29/OB-assets/releases/download/img-83/83c0ea0409b491fe8fbd24153874b0fab6b9f60396876846a81343028b7b1765.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

使用这个功能的前提是你需要在服务商这里配置一下你的谷歌 AI Studio API Key。

我们这里目前只支持官方的 API，后面也会支持三方的 API。

![API Key 配置](https://github.com/gloria-29/OB-assets/releases/download/img-0d/0d673c9e20387a5baa17aeb46abf4f495fd370617c28bd9a2b87434c4c79a405.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

然后你生成的所有图片都会自动加入到左侧的素材库里面去。

这样的话方便你查找之前生成的图片素材和使用的提示词。

![素材库](https://github.com/gloria-29/OB-assets/releases/download/img-95/95dbb41e13cc8028d21eb73dc54b58d975149c6099d3a52906f93e1b2f8c7b5e.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

可以看到这里点击图片后，会展示当时的提示词、模型、分辨率和垫图的图片素材。

你也可以打开对话看当时更多的上下文。

![图片详情](https://github.com/gloria-29/OB-assets/releases/download/img-6e/6ec0b0e14751eec057943e9e0fc473be2fbabdb9884efbe83ed1f8f7c04618cf.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

  


## **通过飞书、QQ 等 IM 远程连接 Codepilot**

Codepilot 也支持跟龙虾类似的 IM 远程连接功能，你常用的基本都支持比如飞书、微信、QQ、Dsicord 等。

首先你需要在远程桥接这里开启开关，然后启动桥接。

在下面渠道开启你想要配置的对应渠道的开关。

![远程桥接](https://github.com/gloria-29/OB-assets/releases/download/img-2e/2e7bee12b90a339510fdba5ac2762b13ffbfc095f35fb191f9e990c27c6ade87.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

然后拉到最下面设置一下远程连接 IM 之后的工作目录以及默认的模型，之后保存。

![工作目录设置](https://github.com/gloria-29/OB-assets/releases/download/img-42/42d4af237a021df706275b686684b30089097e6bdf66086fd3b06f40cf6ff781.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

然后去你想要配置的 IM 页面进行配置就行，页面下方有对应的设置指南。

大部分主要难的地方在于在 IM 那边开发者平台的设置过程，Codepilot 这边相对简单。

![IM 设置](https://github.com/gloria-29/OB-assets/releases/download/img-64/64c2ab600446e30322d7356c285a36bd38bffbc1f37e95b2bf60f955304e12e2.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

  


## **助理功能**

如果你更习惯龙虾那种方式的话可以在设置的助理页面设置一个助理项目。

助理项目跟普通项目的区别就是他拥有长期记忆，而且有类似龙虾的心跳机制，会主动询问和执行任务。

只需要在设置这里选择一个助理文件夹就行。

这里如果你使用 Obsidian 的话我推荐你将助理文件夹设置为 Obsidian 库文件夹。

这样助理可以帮你整理你的 Obsidian 笔记，同时更加理解你，拥有更多你的信息可以帮你更好的完成任务。

![助理设置](https://github.com/gloria-29/OB-assets/releases/download/img-bf/bf122ed0e1397381f556a8598902cfbf94a169e765e85a8fbee666a98f5ec17a.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

Codepilot 的助理是跟宠物结合的。

刚进去他会让你孵蛋，并问你几个问题完成初始化。

孵化后的宠物还会随着你的聊天变多而进化。

![宠物孵化](https://github.com/gloria-29/OB-assets/releases/download/img-b5/b543e8772375f53c8457cbf11c04ca62f59a63a323d707831573816ef28d7fca.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

这里可以看到我打开聊天后他就会自动检查和执行对应任务给我提醒。

最右侧的看板也会展示宠物当前的属性以及进化的进度。

如果你有需要让助理宠物记住的东西也可以跟他说，他会帮你记住。

![助理宠物](https://github.com/gloria-29/OB-assets/releases/download/img-e1/e11cac413d0ff31e3cc53331b73ff2432edf301d21de1b87cb414d72083d2da7.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

  


## **生成式 UI 以及看板功能**

Codepilot 还有个可能是独一份的功能就是生成式 UI 以及看板了。

你可以跟 AI 说帮我可视化解释一下 XXXX。

他就会帮你实时生成一个可视化的图表或者流程图来解释对应概念。

然后你觉得他生成的不错的话也可以点图表右上角的下载图标把这个下载成图片。

![生成式 UI](https://github.com/gloria-29/OB-assets/releases/download/img-44/44a1c60189c8e91ac3b51efd0bd43a739a06e3b5eaf5d0a7241ea2945a85ec65.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

上面那个是最基础的玩法，还记得我们的助理是有我们的记忆的吗。

你完全可以让他帮你生成一个待办事项 UI 帮你更好的理解你现在要做的事情。

![待办 UI](https://github.com/gloria-29/OB-assets/releases/download/img-b3/b35ff63a579dd855a24d90ffaf4298cec907bcf9a21ccde3249cad5c3b45a0ce.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

你以为这就完了？

我专门为这个功能做了一个叫看板的功能，你可以把这个生成的 UI Pin 到看板上。

而且 UI 组件里面的数据是支持实时更新的，比如已经到下周了这里的数据会随着时间和完成状态变化。

这样在结合助理的记忆能力，理论上你能给自己做个 APP 了。

前端就是看板页面，后端数据库就是你的助理的记忆和笔记。

![看板功能](https://github.com/gloria-29/OB-assets/releases/download/img-70/70def93c57f7763c22f698536ae615bb376a08b89a3759dbc12bb4c9241e8ec6.png)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

好了，这就是藏师傅 vibe Coding 了两三个月写的通用 Agent 客户端 CodePilot 的入门教程。

其实这几个月，我自己对 Agent 的控制能力以及对整个 Agent 架构上下文的理解也深了很多。

有机会咱们可以讲讲这部分的东西。

如果觉得对你有帮助的话，可以帮我点赞转发给你需要的朋友。

  


✦

  


&amp;nbsp;

&gt; 来自：[https://mp.weixin.qq.com/s/rlifmUjG23e7Tj9_RBNzWw](https://mp.weixin.qq.com/s/rlifmUjG23e7Tj9_RBNzWw)
