---
标题: DeepSeek-Trae-吞书智能体
笔记 ID: 01967a2a-6b56-7fca-b10c-c29d5307f604
笔记类型: crawl
tags:
    - 学习/学术学习
卡片盒:
    - 学习
包含语音: 否
网页链接:
创建时间: "2025-04-28T10:12:02"
更新时间: "2026-03-03T14:11:41.521"
---

原始链接：https://mp.weixin.qq.com/s/EYJydTsM-eI3xpix3M-CCw

原创郭震AI*2025年04月28日 10:06*

你好，我是郭震

最近收到读者后台留言，他上传了一本几百页的电子书，问DeepSeek，但是显示只能处理前30%，问我如何解决，截图如下所示：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/FQd8gQcyN26AuBU253PhP3rycyqdUm8ZVvEPwJiaicm28STiciaXYeetE7McvVPRxQiad3KuWS7gDDT4NPItX9O1ebA/640#61;png&amp;from&#61;appmsg&amp;tp&#61;webp&amp;wxfrom&#61;5&amp;wx_lazy&#61;1)今天这篇文章来探讨大家普遍遇到的这个问题，经过我至少二十次的实验，终于摸索出了一个不错的解决方法，本文提供完整复现教程，感兴趣的可以看看，全文3059字，22图。

此解决方法，具有如下三个特点：

1）本地运行

2）完全免费，不用花一分钱

3）不需要自己写一行代码，对不会编程的朋友也很友好。

接下来分享这个智能体，大家能直接在自己电脑上也能用上，更好的帮助大家提升工作和学习效率。

1 效果展示

基于DeepSeek-R1，下面是做的这个智能体，起名为：吞书智能体，如下所示：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/FQd8gQcyN26AuBU253PhP3rycyqdUm8Z0sZGKxes6nqZoLXQ1IqiavHeFFsGz4c8mVc14L3gpiam7XJFRHVQNcyw/640#61;png&amp;from&#61;appmsg&amp;tp&#61;webp&amp;wxfrom&#61;5&amp;wx_lazy&#61;1)使用Sutton编写的《强化学习》这本书，作为测试，如下所示：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/FQd8gQcyN26AuBU253PhP3rycyqdUm8ZyUP3ntb9Ize16o217qWYFWUbwWG5NbiaHcDpsAEUickx0mukhEdXxqMA/640#61;png&amp;from&#61;appmsg&amp;tp&#61;webp&amp;wxfrom&#61;5&amp;wx_lazy&#61;1)全书338页：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/FQd8gQcyN26AuBU253PhP3rycyqdUm8ZfYS2aFftAEXdRO3FhrUIEn2EAM2oUxFrEOCJTGSsIiaiacE6blKZmpuw/640#61;png&amp;from&#61;appmsg&amp;tp&#61;webp&amp;wxfrom&#61;5&amp;wx_lazy&#61;1)导入吞书智能体后，处理过程，如下GIF图所示，受限于公众号GIF图帧数限制，一个GIF只能展示几帧：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_gif/FQd8gQcyN26AuBU253PhP3rycyqdUm8ZaOKnmERiaGOa3OqwJQmiaPZcTNUj3CwRpkOUH5Oia66hm5pNboichQD5EA/640#61;gif&amp;from&#61;appmsg&amp;tp&#61;webp&amp;wxfrom&#61;5&amp;wx_lazy&#61;1)第二个GIF展示了，吞书智能体理解了第一章后，自动开始处理第二章：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_gif/FQd8gQcyN26AuBU253PhP3rycyqdUm8ZyiasumCJBrA8Jy0mTvgb67FdOWCNJolRBP5HsKSMw2d8uaB0nTnuMgQ/640#61;gif&amp;from&#61;appmsg&amp;tp&#61;webp&amp;wxfrom&#61;5&amp;wx_lazy&#61;1)吞书智能体前后处理大概10分钟，便能精细化的理解全书15个章节，自动生成如下总结html网页，如下是前几章的章节摘要总结GIF展示：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_gif/FQd8gQcyN24f7w6RQ0Pa9JAunYjnLrSMbSqpacgWN6rDqibHwr9kf8sNBLCHk1RoTPJnVr7BxlLgCVkh3OhqCyg/640#61;gif&amp;from&#61;appmsg&amp;tp&#61;webp&amp;wxfrom&#61;5&amp;wx_lazy&#61;1)「吞书智能体」会自动生成十五个章节总结txt文件，如下所示：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/FQd8gQcyN24f7w6RQ0Pa9JAunYjnLrSMmfHmtFBfPDar61dicGhE010BKZprx2jf2gyVKgjU1ic1D6Mic1stdCDxQ/640#61;png&amp;from&#61;appmsg&amp;tp&#61;webp&amp;wxfrom&#61;5&amp;wx_lazy&#61;1)接下来跟大家介绍「吞书智能体」详细制作步骤，大家根据我的步骤就可以在自己的电脑，完整复现出这个智能体。

2 吞书智能体-制作步骤

在制作吞书智能体时，我尝试过Vscode, Claude, Trae, 发现Trae是对MCP智能体支持最好、且对智能体编排做了深度优化，字节开发的，免费使用：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/FQd8gQcyN26AuBU253PhP3rycyqdUm8ZBibZM5AkulqdhIyEpmBcKf7oHdrvtib9hNicCR4iaXsnZkZ8RtBkxKpk5g/640#61;png&amp;from&#61;appmsg&amp;tp&#61;webp&amp;wxfrom&#61;5&amp;wx_lazy&#61;1)第一步，访问入口：

https://sourl.cn/ec5mE2

获取软件并安装在本地，安装步骤很简单，都是下一步，不再赘述。

内置模型，如Doubao-1.5-pro, DeepSeek-R1等，可以免费使用：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/FQd8gQcyN26AuBU253PhP3rycyqdUm8Z6mNGicLQIy7y1QO7AvsnRbVZw8xn6gKbuC61KICW9I3CgwNxIF9UsNQ/640#61;png&amp;from&#61;appmsg&amp;tp&#61;webp&amp;wxfrom&#61;5&amp;wx_lazy&#61;1)第二步，本地电脑新建一个文件夹，直接使用Trae打开此文件夹，然后右下角选择DeepSeek-R1，再点击@智能体：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/FQd8gQcyN24f7w6RQ0Pa9JAunYjnLrSM5PqicbgcpauNg7GuO4ibhtiajTI05GlVEsfQ8g2Nk68KAGOVESibTe9k8w/640#61;png&amp;from&#61;appmsg&amp;tp&#61;webp&amp;wxfrom&#61;5&amp;wx_lazy&#61;1)点击后再点击「创建智能体」：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/FQd8gQcyN24f7w6RQ0Pa9JAunYjnLrSMAibc6ybZmPkQEXI0eGNRpsLficCtDia3fVYvonbE8d02KwCw7M2O6vTnA/640#61;png&amp;from&#61;appmsg&amp;tp&#61;webp&amp;wxfrom&#61;5&amp;wx_lazy&#61;1)弹出下面界面，依次按照1,2,3顺序，前两项如下填写，其中2是最关键的一项，这些提示词是智能体执行编排流程，直接关系到智能体是否精准工作：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/FQd8gQcyN24f7w6RQ0Pa9JAunYjnLrSMnLiacw3c35XDAMPzTgTrMxDjsJsd5gicgQLUeZBwg1pbQpZuEBxLl5Hg/640#61;png&amp;from&#61;appmsg&amp;tp&#61;webp&amp;wxfrom&#61;5&amp;wx_lazy&#61;1)完整提示词我放在下面文本框里，这个提示词我迭代了不下20次，现在分享给大家:

&#96;&#96;&#96; # PDF章节提取与总结自动化处理&#96;&#96;## 初始设置&#96;&#96;1. 使用PDF阅读器工具读取目标PDF文件的目录索引（通常位于前10页）&#96;&#96; - 工作目录路径：/Users/zhenguo/Documents/code/mcp-agent&#96;&#96;## 目录索引处理&#96;&#96;2. 使用文件系统工具创建book_index.txt文件&#96;&#96;3. 将每章的【起始页码,终止页码】信息提取并按格式写入book_index.txt&#96;&#96; - 格式示例：第1章,10,25&#96;&#96;## 章节处理循环&#96;&#96;4. 从第1章开始，执行以下步骤直到所有章节处理完毕：&#96;&#96;a. 读取book_index.txt获取当前章节[i]的起始页码和终止页码&#96;&#96;b. 使用PDF阅读器工具，传入页码范围参数读取章节[i]的完整内容&#96;&#96; c. 分析章节[i]内容，提取关键要点并按条目列出（确保不遗漏重要信息）&#96;&#96; d. 使用文件系统工具创建chapter[i]_summary.txt文件&#96;&#96; e. 将章节[i]的要点总结写入chapter[i]_summary.txt&#96;&#96; f. 明确输出处理进度：&quot;已完成第[i]章处理，准备处理第[i+1]章&quot;&#96;&#96;## 汇总与展示&#96;&#96;5. 检查是否所有章节均已处理完毕&#96;&#96;6. 按章节顺序读取并合并所有chapter[i]_summary.txt文件内容&#96;&#96;7. 将合并内容写入summary_results.txt&#96;&#96;8. 将summary_results.txt内容转换为响应式HTML网页&#96;&#96; - 实现精美布局与样式&#96;&#96; - 添加目录导航功能&#96;&#96; - 确保在移动设备上有良好显示效果 &#96;&#96;&#96;

然后，点击3前往MCP页面，添加MCP Servers，进入下面界面，其中前两个是我自己编写的MCP Servers，部署在本地，后面通过Trae配置的。

本次主要用到pdf-reader（这是我自己编写的一个MCP Server智能体，代码全部开源），点击如下图所示的「添加」按钮：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/FQd8gQcyN24f7w6RQ0Pa9JAunYjnLrSM9iaCtZm58Iqejmiapg6Trqrfs4P7v0ewgf8beNpMFW7eXRictaFxRTtBg/640#61;png&amp;from&#61;appmsg&amp;tp&#61;webp&amp;wxfrom&#61;5&amp;wx_lazy&#61;1)进入下面界面，点击「手动配置」：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/FQd8gQcyN24f7w6RQ0Pa9JAunYjnLrSMETco4tIrHgs1Xp1sQHFC0M35UMAezPhjbHznBWmRAEUUSibW89lXlZQ/640#61;png&amp;from&#61;appmsg&amp;tp&#61;webp&amp;wxfrom&#61;5&amp;wx_lazy&#61;1)弹出下面界面，大家把下面JSON串直接复制过来就行：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/FQd8gQcyN24f7w6RQ0Pa9JAunYjnLrSMz6KjqdiaFKj6RaQs86voUPdCq2R6zc4CZI11OkwRPI9WfnPkUoSPETA/640#61;png&amp;from&#61;appmsg&amp;tp&#61;webp&amp;wxfrom&#61;5&amp;wx_lazy&#61;1)JSON串文字版：

&#96;&#96;&#96; {&#96;&#96;&quot;mcpServers&quot;:{&#96;&#96;&quot;txt-reader&quot;:{&#96;&#96;&quot;command&quot;:&quot;/Users/zhenguo/anaconda3/envs/mcp/bin/python&quot;,&#96;&#96;&quot;args&quot;:[&#96;&#96;&quot;/Users/zhenguo/Documents/code/mcp-txt-reader/txt_server.py&quot;&#96;&#96;]&#96;&#96;}&#96;&#96;}&#96;&#96;} &#96;&#96;&#96;

然后点击确认，再点击箭头所示的刷新图标，刷新后应该会报错，因为此时你还没有在指定目录配置上代码文件，大家也要记得修改上面的JSON串为你自己本地的文件目录：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/FQd8gQcyN24f7w6RQ0Pa9JAunYjnLrSMoKKfM5ibeVDFicElbXgakiapAcITYIGGr1sl3Tg0pNZCXAhUjRUxEzQ3g/640#61;png&amp;from&#61;appmsg&amp;tp&#61;webp&amp;wxfrom&#61;5&amp;wx_lazy&#61;1)等配置代码文件和目录正确后，刷新正确后，就会看到pdf-reader，因为支持MCP协议，所以能够无缝集成到Trae里面，并且看到里面有三个工具：read_pdf_text, read_by_orc, read_pdf_images.

完整代码已经开源在github，如下图所示：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/FQd8gQcyN24f7w6RQ0Pa9JAunYjnLrSMt5PEO4SB3y0GvvEURzmicJIP8EDXB7ibgfeknIKE6X19zcehbynREzrw/640#61;png&amp;from&#61;appmsg&amp;tp&#61;webp&amp;wxfrom&#61;5&amp;wx_lazy&#61;1)访问入口：

https://github.com/DeepSeekMine/mcp-pdf-reader

3 DeepSeek吞书原理

DeepSeek为啥不原生支持一次吞下500页的书，难点在哪里？根本原因在于：

1）模型输入长度受限，超长文本无法一次塞进 Transformer 结构；\
**2）** 即便能塞下，注意力计算复杂度是 O(n²)，文本越长，计算和显存开销爆炸增长，现有硬件难以承受。

有些读者可能听说过，有些大模型号称能够处理100万，200万的上下文Token，其实也不是真正实现了无损精度的上下文，他们都采用了各种优化，如稀疏注意力，分块，局部聚焦等，实际精度会有打折扣，如下图所示：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/FQd8gQcyN24f7w6RQ0Pa9JAunYjnLrSM5BTuiaWGRlGf4gY4dgKYpxzNBIgkPP7Fic6PaQaD8ViaImRibc3NKFyYdA/640#61;png&amp;from&#61;appmsg&amp;tp&#61;webp&amp;wxfrom&#61;5&amp;wx_lazy&#61;1)所以可能不如咱们针对自己的具体需求，使用智能体定制，比如本文使用Trae里构建智能体及流程优化，比较方便的就能实现逐章节提炼摘要总结，每个章节的上下文目前基本不会超过主流大模型上下文长度，比如R1的128K上下文。

因此，文中解决方案通过多智能体协作，实现了对一本书每章摘要总结，具备如下能力：

1）精度无损的实现了对完整一本书每章的摘要总结，分析每章并把结果写入到指定文件，注意这些文件都是智能体自动保存出来的：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/FQd8gQcyN24f7w6RQ0Pa9JAunYjnLrSM75QfsvJv2Cg3tYRUSn4fkpf3plYyRfWawNzxFQL0ibdkuc9mwdwJfDA/640#61;png&amp;from&#61;appmsg&amp;tp&#61;webp&amp;wxfrom&#61;5&amp;wx_lazy&#61;1)2）自动提取每个章节的起始、终止页码，如下图所示：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/FQd8gQcyN26AuBU253PhP3rycyqdUm8Z7dxVIAL7y7eI2Z7G1PjxnF5yjeDBQPKjTOjaAjv3icVhccYFypsBLibg/640#61;png&amp;from&#61;appmsg&amp;tp&#61;webp&amp;wxfrom&#61;5&amp;wx_lazy&#61;1)3）具备很好的可扩展性，哪怕一本书1000页，也能应对。

当然文中方案，也不是完美的。在中间执行流程中，会出现模型思考次数已达上限，输入继续后才能走下去，需要手工配合输入：继续，如下图所示：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/FQd8gQcyN26AuBU253PhP3rycyqdUm8ZEuLHIcCHDmKUzPzf7QyNCic2X2JZoXia1lYibVLw7UOo1AAVgtgBSTOCw/640#61;png&amp;from&#61;appmsg&amp;tp&#61;webp&amp;wxfrom&#61;5&amp;wx_lazy&#61;1)总结一下

本文解决了大家普遍面临的一个难题，就是大模型无法直接高精度的分析总结一整本书的问题。

文中方案一句话总结：使用Trae+多智能体协作+分章节编排提示词，相对较好的解决了整本书精准总结问题。

Trae软件使用免费，除了通过@方便接入智能体外，还有#某个文档，直接接入本地文档，使用还是挺方便的。

另外，Trae使用免费，不用大家花一分钱。

感兴趣的可以获取下Trae软件，然后按照文中步骤，很快也能在本地部署上「吞书智能体」，代码已全部准备后，并能够复现，想尝试的可以点击【阅读原文】去实践下。

以上全文3059字，22张图。如果觉得这篇文章对你有用，可否点个关注。给我个三连击：点赞、转发和在看。若可以再给我加个&lt;span data-name&#61;&quot;star&quot; data-type&#61;&quot;emoji&quot;&gt;⭐&lt;/span&gt;️，谢谢你看我的文章，我们下篇再见。

谢谢你读我的文章

**微信扫一扫赞赏作者**

[阅读原文](javascript:;)继续滑动看下一个向上滑动看下一个
