---
标题: Awesome-ChatTTS
笔记 ID: 019a0267-6ff5-7d23-8218-681eb0cde7f4
笔记类型: crawl
tags:
    - 自我提升/成长记录
卡片盒:
    - 自我提升
包含语音: 否
网页链接:
创建时间: "2025-10-21T00:15:24"
更新时间: "2026-03-03T18:04:04.932"
---

**[Awesome-ChatTTS](/libukai/Awesome-ChatTTS)** Public

官方推荐的 ChatTTS 资源汇总项目，整理了全网相关资源和常见问题 || Officially recommended ChatTTS resource collection project

&lt;br /&gt;

**[English](/libukai/Awesome-ChatTTS/blob/main/README-EN.md)** | **简体中文**

Awesome-ChatTTS 是官方推荐的 ChatTTS 资源汇总项目，欢迎在 issues 中推荐或者自荐。

如果觉得本项目对你了解和使用 ChatTTS 有帮助，还请打赏个 ⭐️ 支持一下。

* [官方简介](#%E5%AE%98%E6%96%B9%E7%AE%80%E4%BB%8B)

* [快速体验](#%E5%BF%AB%E9%80%9F%E4%BD%93%E9%AA%8C)

* [热门分支](#%E7%83%AD%E9%97%A8%E5%88%86%E6%94%AF)

* [界面说明](#%E7%95%8C%E9%9D%A2%E8%AF%B4%E6%98%8E)

* [音色控制](#%E9%9F%B3%E8%89%B2%E6%8E%A7%E5%88%B6)

* [入门教程](#%E5%85%A5%E9%97%A8%E6%95%99%E7%A8%8B)

* [常见问题](#%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98)

* [报错速查](#%E6%8A%A5%E9%94%99%E9%80%9F%E6%9F%A5)

## 官方简介

ChatTTS.-.001.-.ChatTTS.mp4

## 快速体验

|                               网址                               | 类型          |
| :------------------------------------------------------------: | ----------- |
|            [Original Web](https://chattts.com/#Demo)           | 原版网页版体验     |
| [Forge Web](https://huggingface.co/spaces/lenML/ChatTTS-Forge) | Forge 增强版体验 |
|           [Linux](https://pypi.org/project/ChatTTS/)           | Python 安装包  |
|              [Samples](http://ttslist.aiqbh.com/)              | 音色种子示例      |
|          [Cloning](http://region-9.autodl.pro:41137/)          | 音色克隆体验      |

## 热门分支

### 功能增强

|                                    项目                                   |  Star  | 亮点                   |
| :---------------------------------------------------------------------: | :----: | -------------------- |
|  [jianchang512/ChatTTS-ui](https://github.com/jianchang512/ChatTTS-ui)  | &lt;br /&gt; | 提供 API 接口，可在第三方应用中调用 |
|    [6drf21e/ChatTTS\_colab](https://github.com/6drf21e/ChatTTS_colab)   | &lt;br /&gt; | 提供流式输出，支持长音频生成和分角色阅读 |
|      [lenML/ChatTTS-Forge](https://github.com/lenML/ChatTTS-Forge)      | &lt;br /&gt; | 提供人声增强和背景降噪，可使用附加提示词 |
| [CCmahua/ChatTTS-Enhanced](https://github.com/CCmahua/ChatTTS-Enhanced) | &lt;br /&gt; | 支持文件批量处理，以及导出 SRT 文件 |
|  [HKoon/ChatTTS-OpenVoice](https://github.com/HKoon/ChatTTS-OpenVoice)  | &lt;br /&gt; | 配合 OpenVoice 进行声音克隆  |

### 功能扩展

|                                          项目                                         |  Star  | 亮点                    |
| :---------------------------------------------------------------------------------: | :----: | --------------------- |
|        [6drf21e/ChatTTS\_Speaker](https://github.com/6drf21e/ChatTTS_Speaker)       | &lt;br /&gt; | 音色角色打标与稳定性评估          |
|          [AIFSH/ComfyUI-ChatTTS](https://github.com/AIFSH/ComfyUI-ChatTTS)          | &lt;br /&gt; | ComfyUi 版本，可作为工作流节点引入 |
| [MaterialShadow/ChatTTS-manager](https://github.com/MaterialShadow/ChatTTS-manager) | &lt;br /&gt; | 提供了音色管理系统和 WebUI 界面   |

## 界面说明

[![配置项说明](/libukai/Awesome-ChatTTS/raw/main/readme/WebUI-CN.png)](/libukai/Awesome-ChatTTS/blob/main/readme/WebUI-CN.png)

### 文本控制

* **1. Input Text**: 需要转换的文本，支持中文和英文混杂

* **2. Refine text**: 是否对文本进行口语化处理

* **3. Text Seed**: 配置文本种子值，不同种子对应不同口语化风格

* **4. 🎲**: 随机产生文本种子值

* **5. Output Text**: 口语化处理后生成的文本

### 音色控制

* **6. Timbre**: 预设的音色种子值

* **7. Audio Seed**: 配置音色种子值，不同种子对应不同音色

* **8. 🎲**: 随机产生音色种子值

* **9. Speaker Embedding**: 音色码，详见 [音色控制](#%E9%9F%B3%E8%89%B2%E6%8E%A7%E5%88%B6)

### 情感控制

* **10. temperate**: 控制音频情感波动性，范围为 0-1，数字越大，波动性越大

* **11. top\_P** ：控制音频的情感相关性，范围为 0.1-0.9，数字越大，相关性越高

* **12. top\_K** ：控制音频的情感相似性，范围为 1-20，数字越小，相似性越高

### 系数控制

* **13. DVAE Coefficient**: 模型系数码

* **14. Reload**: 重新加载模型系数

### 播放控制

* **15. Auto Play**: 是否在生成音频后自动播放

* **16. Stream Mode**: 是否启用流式输出

* **17. Generate**: 点击生成音频文件

* **18. Output Audio**: 音频生成结果

* **19. ↓**: 点击下载音频文件

* **20. ▶️**: 点击播放音频文件

### 示例控制

* **21. Example**: 点击切换示例配置

## 音色控制

经过实际测试，指定音色种子值每次生成 &#96;spk_emb&#96; 和重复使用预生成好的 &#96;spk_emb&#96; 效果有较显著差异，建议优先使用 &#96;.pt&#96; 音色文件或者音色码（字符串表示形式）。

在 [ChatTTS\_Speaker](https://huggingface.co/spaces/taa/ChatTTS_Speaker) 项目中对音色种子进行了初步打标和稳定性评估，可以通过示例来快速选择合适的音色。

[![audio-code.png](/libukai/Awesome-ChatTTS/raw/main/readme/audio-code.png)](/libukai/Awesome-ChatTTS/blob/main/readme/audio-code.png)

### WebUI

在官方 WebUI 中使用时，可直接将音色码复制之后，替换 &#96;9. Speaker Embedding&#96; 中的值，实现音色控制。

### Python

在 Python 脚本中使用时，参考 [issue#07](https://github.com/6drf21e/ChatTTS_Speaker/issues/7) 中的压缩方案实现音色控制。

&#96;&#96;&#96;
spk &#61; torch.load(&quot;asset/seed_1332_restored_emb.pt&quot;, map_location&#61;torch.device(&#39;cpu&#39;)).detach()
spk_emb_str &#61; compress_and_encode(spk)

params_infer_code &#61; ChatTTS.Chat.InferCodeParams(
    spk_emb&#61; spk_emb_str,  # add sampled speaker
    temperature&#61;.0003,  # using custom temperature
    top_P&#61;0.7,  # top P decode
    top_K&#61;20,  # top K decode
)
&#96;&#96;&#96;

## 入门教程

### 中文教程

|                                                                     视频                                                                     | 亮点            |
| :----------------------------------------------------------------------------------------------------------------------------------------: | ------------- |
|                      [同济子豪兄](https://www.bilibili.com/video/BV1Ui421v7JU/?vd_source&#61;b958002f14b88fc59432b810e4448b72)                      | 从入门到进阶的详细部署教程 |
|                       [ZTFS](https://www.bilibili.com/video/BV1nZ421p74z/?vd_source&#61;6773fc664ee1e277b8a2290d66ebb7a3)                      | Mac M1 部署教程   |
| [王-寳寳](https://www.bilibili.com/video/BV1Ji421U74a/?spm_id_from&#61;333.337.search-card.all.click\&amp;vd_source&#61;6773fc664ee1e277b8a2290d66ebb7a3) | Windows 部署教程  |

### 英文教程

|                              视频                              | 亮点    |
| :----------------------------------------------------------: | ----- |
| [Sam Witteveen](https://www.youtube.com/watch?v&#61;L4klnZ5Lox8) | 英文版介绍 |

## 常见问题

经过近期的迭代，源仓库代码中的问题已经基本解决。如果遇到问题，建议先详细查看 [官方说明文档中文版](https://github.com/2noise/ChatTTS/blob/main/docs/cn/README.md) ，如果还有问题可以继续查看本文档。

### 模型无法下载

原版项目运行需要从 HuggingFace 下载对应的模型，如果不能顺畅科学上网，那么就无法完成这一步。作为替代方案，可以从 [modelscope](https://www.modelscope.cn/models/pengzhendong/ChatTTS/files) 上下载模型和配置，并配置本地路径。

1. 在终端中安装 modelscope 依赖

&#96;&#96;&#96;
pip install modelscope
&#96;&#96;&#96;

1. 修改 webui.py 中的代码

&#96;&#96;&#96;
# 在开头导入依赖，并下载模型和配置
from modelscope import snapshot_download
model_dir &#61; snapshot_download(&#39;zlj2546/ChatTTS&#39;)

# 第 118 行修改模型路径
ret &#61; chat.load_models(&#39;custom&#39;, custom_path&#61;model_dir)
&#96;&#96;&#96;

### IDE 中无法运行

在 IDE 中运行时，由于文件相对路径的问题，导致脚本无法顺利运行。

建议参照官方说明文档 [快速启动](https://github.com/2noise/ChatTTS/blob/main/docs/cn/README.md#%E5%BF%AB%E9%80%9F%E5%90%AF%E5%8A%A8) 中的指令直接在终端中运行。

&gt; 确保在执行以下命令时，处于项目根目录下。

&#96;&#96;&#96;
python examples/web/webui.py
&#96;&#96;&#96;

#### 2. 命令行交互

&gt; 生成的音频将保存至 &#96;./output_audio_n.mp3&#96;

&#96;&#96;&#96;
python examples/cmd/run.py &quot;Your text 1.&quot; &quot;Your text 2.&quot;
&#96;&#96;&#96;

### 语气标签被读出

出现这个问题是因为官方代码处理中文标点符号时覆盖不全，例如 &#96;？&#96; 、 &#96;…&#96; 等符号没有被处理，导致模型生成时出错。

可以手动删除类似的中文标点符号，或者修改 &#96;ChatTTS/utils/infer_utils.py&#96; 中的代码，在 103 行的 &#96;character_map&#96; 的字典中添加缺失的标点符号。

&#96;&#96;&#96;
character_map &#61; {
    &#39;…&#39;: &#39;&#39;,
    &#39;—&#39;: &#39;,&#39;,
    &#39;＿&#39;: &#39;,&#39;,
    &#39;？&#39;: &#39;,&#39;,
    }
&#96;&#96;&#96;

### GPU 无法使用

GPU 至少需要 4G 显存，否则将强制使用 CPU，相关问题可以参考 [ChatTTS-ui](https://github.com/jianchang512/ChatTTS-ui) 项目中的说明

## 报错速查

1、 &#96;load_models() got an unexpected keyword argument &#39;source&#39;&#96;

详见 **常见问题 - 模型无法下载**

2、 &#96;cannot import name &#39;CommitOperationAdd&#39; from &#39;huggingface_hub&#39;&#96;

详见 **常见问题 - 模型无法下载**

3、 &#96;FileNotFoundError：［Erzno 2］ No such file or directory： &#39;C：\\Users\\xxx\\.cache\\huggingface\\hub\\models--2Noise--ChatTTS\\snapshots\&#96;

详见 **常见问题 - 模型无法下载**

4、 &#96;local variable &#39;Normalizer&#39; referenced before assignment&#96;

需要根据 **安装指南** 完成环境配置后，再安装 &#96;pynini&#96; 和 &#96;WeTextProcessing&#96; 依赖

&#96;&#96;&#96;
conda install -c conda-forge pynini&#61;2.1.5 &amp;&amp; pip install WeTextProcessing
&#96;&#96;&#96;

5、 &#96;download to Local path D：\pythonlproject\ChatTTS\ChatTTS failed.&#96;

在 IDE 中直接执行脚本，会因为文件路径问题报错，详见 **常见问题 - IDE 中无法运行**

6、 &#96;ModuleNotFoundError : No module named&#39;Cython&#39;&#96;

未找到 Python 执行路径，Windows 设备需要按 [教程](https://www.cnblogs.com/ajianbeyourself/p/17654155.html) 配置环境路径

## 项目趋势

[![Star History Chart](https://camo.githubusercontent.com/939291a3a99e264de74b27da597d89cd87e0a586cc55146c655be7691e4dbb49/68747470733a2f2f6170692e737461722d686973746f72792e636f6d2f7376673f7265706f733d6c6962756b61692f417765736f6d652d4368617454545326747970653d44617465)](https://star-history.com/#libukai/Awesome-ChatTTS\&amp;Date)

## Releases

No releases published

## Packages

No packages published

|

&gt; 来自：[libukai/Awesome-ChatTTS: 官方推荐的 ChatTTS 资源汇总项目，整理了全网相关资源和常见问题 || Officially recommended ChatTTS resource collection project](https://github.com/libukai/Awesome-ChatTTS)
