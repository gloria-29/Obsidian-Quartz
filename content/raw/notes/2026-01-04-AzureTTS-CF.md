---
标题: AzureTTS-CF
笔记 ID: 019b8900-5680-79b1-8e51-c4080254215a
笔记类型: crawl
tags:
    - 生活/电子工具
卡片盒:
    - 生活
包含语音: 否
网页链接:
创建时间: "2026-01-04T20:34:19.408"
更新时间: "2026-03-11T20:45:31.691"
---

### **如何在客户端填写配置**

部署并获得 URL (例如 **&#96;https://azure-tts.yourname.workers.dev&#96;**) 后，在任何 OpenAI 兼容的 TTS 插件/软件中按以下方式填写：

1. **API Endpoint (基础地址)**:
   * **写法 A** (大多数软件): **&#96;https://azure-tts.yourname.workers.dev&#96;**
     * *注：软件会自动在后面追加 **&#96;/v1/audio/speech&#96;***
   * **写法 B** (如果软件很笨，不自动补全): **&#96;https://azure-tts.yourname.workers.dev/v1&#96;** 或 **&#96;https://azure-tts.yourname.workers.dev/v1/audio/speech&#96;**
   * *建议先试写法 A。*
2. **API Key (密钥)**:
   * 随便填一个字符串，例如 **&#96;sk-123456&#96;**。
   * *（我的代码没有做密码校验，填什么都行，但不填有些软件会报错）。*
3. **Model (模型)**:
   * 填 **&#96;tts-1&#96;** 或 **&#96;tts-1-hd&#96;**。
   * *（这个参数会被代码忽略，为了兼容性而填）。*
4. **Voice (声音名称)**:
   * **重要：** 这里**不要**填 OpenAI 的 **&#96;alloy&#96;** 或 **&#96;echo&#96;**。
   * **要填：** Azure 的标准声音 ID。
   * 例如：**&#96;zh-CN-XiaoxiaoNeural&#96;** (晓晓) 或 **&#96;zh-CN-YunxiNeural&#96;** (云希)。
   * *提示：如果不填或乱填，代码默认会使用“晓晓”。*

### **常见 Azure 声音 ID 参考**

如果你需要在软件的 &quot;Voice&quot; 栏里手动输入：

* **女声 (温柔/活泼):** **&#96;zh-CN-XiaoxiaoNeural&#96;**
* **男声 (阳光/解说):** **&#96;zh-CN-YunxiNeural&#96;**
* **男声 (沉稳/新闻):** **&#96;zh-CN-YunyangNeural&#96;**
* **女声 (辽宁口音):** **&#96;zh-CN-XiaoxiaoDialectsNeural&#96;** (如果支持)
* **多语言:** **&#96;zh-CN-XiaoxiaoMultilingualNeural&#96;**
