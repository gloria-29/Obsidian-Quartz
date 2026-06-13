---
标题: Karpathy 分享的 AI 知识库构建方案
笔记 ID: 019d52bf-a75c-7c2d-b4b1-638c08bdd5a3
笔记类型: crawl
tags:
    - 学习/在线学学
卡片盒:
    - 学习
包含语音: 否
网页链接:
创建时间: "2026-04-03T17:49:45.187"
更新时间: "2026-04-03T17:50:41.444"
---

![](https://github.com/gloria-29/OB-assets/releases/download/img-ed/edce375610f94f7696c38aec9a45f529da53a69bfb84a6fd6ed1189aeaa6437b.jpeg)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

![](https://github.com/gloria-29/OB-assets/releases/download/img-da/da2f3a973957663c5ab30eb0529f7deaf00475592cf2c10b278d8dfdc10c0ae0.jpeg)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

![](https://github.com/gloria-29/OB-assets/releases/download/img-8b/8b7e0b58494595f17879de1753efa9341366c9345a66eb5ec927728889bc90fa.webp)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

![](https://github.com/gloria-29/OB-assets/releases/download/img-a7/a7c226218e6339324ecdfe5f63849b2c5c275955c43ec95e2a2df620ae34a44d.webp)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

![](https://github.com/gloria-29/OB-assets/releases/download/img-0e/0e1fc580762fd1576b1f558d0ae3d8a6cc34e1f3525206ae787640af5864b110.webp)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

![](https://github.com/gloria-29/OB-assets/releases/download/img-8b/8bebe0848281cefc9627ec2501483ce3a8ac2a75e97e43399beb25e23dc68ed6.webp)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

![](https://github.com/gloria-29/OB-assets/releases/download/img-05/05213d30b96ac5b235bb2e6dbe2cb078d138cd056314a7bd95c01641660f8c2f.webp)&lt;!-- {&quot;kind&quot;:&quot;image&quot;} --&gt;

# Karpathy 分享的 AI 知识库构建方案

Karpathy 分享了他如何构建本地的 AI 知识库，跟我用的方法也很相似。  
  
都是用的 Obsidian，纯本地 MD，然后用一些反向链接、索引的方式把它们连起来。  
  
他构建了一个用大语言模型驱动的个人 Wiki 知识库，然后把原始资料都丢进一个叫 RAW 的目录。  
  
然后让大语言模型把这些原始资料编译成一个 Markdown Wiki，实现以下功能：自动创建摘要、创建索引、创建概念条目、添加相互链接、生成可视化等等。  
  
我是在内容收集的时候就已经做好了，用的是 Obsidian 的那个剪藏插件。  
在收集内容的时候，AI 就会自动进行以下处理：打标签、自动总结、翻译、创建摘要，目前就是还没有反向链接。  
  
然后它的 Wiki 构建好以后，就可以在这个 Wiki 上提问，确保数据来源的可置信度。  
  
比如说大语言模型会自己查索引、读相关的文档，写出回答或者报告，不只是在网页上搜。这样的话，它获取的信息基本上都是跟你相关的。  
  
然后它的输出也尽量不是一句话，而是新的文件、新的可视化网页或者是 PPT，然后再回归到知识库里，让知识库越用越厚。  
  
但这个会造成一个问题，就是 Obsidian 的作者也说了，这会污染知识库。所以最好把可靠性来源和 AI 生成的东西分开放。  
  
还有一个比较好的点是，它会让大模型对 Wiki 做健康度检查。比如：找一些自相矛盾的地方、补发一些缺失的信息、发现一些新的关联、提高一致性。  
  
其实现在很多人都是这样做的，我也把这套理念放到了 CodePilot 里。  
  
关于助理文件夹的选择，我一般建议使用 Obsidian 文件夹。  
  
如果你有自己的 Obsidian 文件夹，进去以后 AI 就会直接获取你所有的上下文和知识。  
  
这样一来，你直接就能获得一个拥有完整记忆的 AI 助理。  
  
如果你不知道怎么实践的话，推荐用 Codepilot 的助理试试。  
  
把你的 Obsidian 文件夹放进去，让它帮你整理，同时让它把这些原则写到 Claude.md 里面。  
  
详情：x.com/op7418/status/2039898050697839041

&gt; 来自：[https://mp.weixin.qq.com/s/XMAWXNJ5I3_tyCwAhEkdrA](https://mp.weixin.qq.com/s/XMAWXNJ5I3_tyCwAhEkdrA)
