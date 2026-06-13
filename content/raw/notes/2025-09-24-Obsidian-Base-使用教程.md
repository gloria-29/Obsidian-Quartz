---
标题: Obsidian Base 使用教程
笔记 ID: 01997a1e-96f4-7bfb-9479-1466843e8f39
笔记类型: note
tags:
    - 学习/学术学习
卡片盒:
    - 学习
包含语音: 否
网页链接:
创建时间: "2025-09-24T13:07:29"
更新时间: "2026-03-03T00:47:36.502"
---

### created: 2025-09-24T12:59:50 (UTC +08:00)

### source: [https://forum-zh.obsidian.md/t/topic/53088](https://forum-zh.obsidian.md/t/topic/53088)

## Bases基础用例：显示同文件夹内的笔记 - 经验分享 - Obsidian 中文论坛

&gt; ## Excerpt

&gt; 概述 Obsidian 的 Bases（数据库）版本 1.9.10 已经发布，相信很多人会好奇——它有什么用？  本文用一个简单的例子来介绍它的用法，同时也作为“一步步跟着实现”的基础教程。  效果 我们先看数据库实现的效果：     该库为 Kepano 的示例库  这个 Bases 的作用很简单：显示出和当前笔记相同文件夹的其他笔记  非常适合你在浏览笔记时，快速查看相关的其他笔记。  实现 首先，在文件浏览器中右键，创建新的 Base 文件：    创建完后，为它取一个名字，例如 base-SameFolder     然后你会看到 Bases 的基础状态：  一个表格，包含你库中的所有文件。  接下来，我们要认识到最重要的两个基础概念：筛选 和 属性。  概念 数据库最重要的部分在最上方的操作区域，包含：    左上方：   视图 结果（包括导出 CSV、结果数量限制等功能）  右上方：   排序 筛选 属性 新建  我们会先聚焦在最重要的 Filter 筛选器和 Properties 属性上。  筛选 筛选器，即定义“显示的条件”。  默认情况下所有文件都会被列出来，而过多的...

---

## 概述

Obsidian 的 Bases（数据库）版本 1.9.10 已经发布，相信很多人会好奇——它有什么用？

本文用一个简单的例子来介绍它的用法，同时也作为“一步步跟着实现”的基础教程。

## 效果

我们先看数据库实现的效果：

*该库为 Kepano 的示例库*

这个 Bases 的作用很简单：**显示出和当前笔记相同文件夹的其他笔记**  

非常适合你在浏览笔记时，快速查看相关的其他笔记。

## 实现

首先，在文件浏览器中右键，创建新的 Base 文件：

![](https://dinox-gloria29.s3.bitiful.net/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/01997a21-c6ba-7e07-9ea2-83aaf6180c5c.webp#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;OEifDUYHchAg0XKa4VK8vug4%2F20250924%2Fcn-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20250924T051058Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;391c82396997de41944f55e06c4a4491a0cd23b4b25afe9bd8fb5bdcfa0b2e6f&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

创建完后，为它取一个名字，例如 &#96;base-SameFolder&#96;

然后你会看到 Bases 的基础状态：  
**一个表格，包含你库中的所有文件。**

接下来，我们要认识到最重要的两个基础概念：**筛选** 和 **属性**。

## 概念

数据库最重要的部分在最上方的操作区域，包含：

左上方：

1. 视图
2. 结果（包括导出 CSV、结果数量限制等功能）

右上方：

1. 排序
2. 筛选
3. 属性
4. 新建

我们会先聚焦在最重要的 Filter 筛选器和 Properties 属性上。

### 筛选

筛选器，即定义“显示的条件”。

默认情况下所有文件都会被列出来，而**过多的信息量等于无效的信息量**。  

所以我们需要定义好自己希望看到的内容。

在这次的案例中，条件即「**和当前笔记相同文件夹**」。

### 属性

每个文件有自己特定的属性，属性可以用在“筛选”的条件，也可以作为“显示的信息”。  

属性除了笔记最上方的 Properties 属性区域中的属性，还包含一些隐性的元数据，例如文件路径、文件所在文件夹等。

对于这次案例，我们需要获取到 &#96;文件夹&#96; 属性。

## 实践

### 特定文件夹

点击 Filter 按钮，会弹出筛选器的 UI。

我们打开 All views（对所有视图生效）筛选器，并且选择：  
&#96;file | in folder&#96; 即“在特定文件中”。

![](https://dinox-gloria29.s3.bitiful.net/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/01997a22-8d51-7461-bdfc-f6636dc88eed.webp#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;OEifDUYHchAg0XKa4VK8vug4%2F20250924%2Fcn-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20250924T051149Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;47ecccf074d9d2cb9664df5824ce5654663783e55f2d9e513e25406b21025960&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

然后我们可以先手动输入一个文件夹（路径带有自动补全），查看效果：

可以看到，这样配置之后，已经可以显示**来自特定文件夹**的笔记了。  

为你 Bases 最重要的第一步喝采！

### 公式：动态筛选条件

但是我们想要实现的目标是：显示**和当前笔记相同文件夹**的笔记。

总不能每次都手动修改文件夹路径吧？  

所以，我们需要更**动态**的筛选条件。

首先，点击右侧的 &#96;&lt;/&gt;&#96; 按钮，

进入高阶筛选器的编辑界面：

可以看到，这时候筛选条件变成了一条公式：  
&#96;file.inFolder(&quot;References&quot;)&#96;

它的含义和刚才的筛选器完全一致：&#96;file&#96; 位于文件夹 &#96;Reference&#96; 内。

&gt; 公式有点儿类似 Javascript 代码，但是相对简单，你可以通过先构建简单过滤器，然后切换成高阶过滤器的方式来进行学习。  
&gt; 
&gt; 更多资料也可以查看：

这里的 &#96;file&#96; 指代每一个进行检验的文件，如果符合条件，就列进结果中。  

所以，我们下一步要做的是——把文件夹 &#96;Reference&#96; 换成实际的 &#96;当前笔记所在的文件夹&#96;。

具体来说，把 &#96;&quot;Reference&quot;&#96; 替换成 &#96;this.file.folder&#96;：

你可以先这样修改，看看结果，然后我们再说理论部分。

### 关于当前文件

如果一切顺利，在输入完毕后你会看到当前 base 文件所在的文件夹的文件：

（可能只有它自己）

接下来我们就要介绍到 &#96;this&#96; 这个特殊的变量——  

它代表“当前”的文件，但是这个“当前”取决于 Base 所在的位置。

举个例子，当前我们在主要编辑器编辑 Base，那么这个 &#96;base-SameFolder.base&#96; 就是当前文件。

但是，如果我们把 base 文件拖到侧栏，然后点击一下当前的笔记，事情就会发生变化——

**当 Base 位于侧栏或者分屏编辑器时，**&#96;this&#96; 代表的就是当前激活的文件。

这是一个很重要的特性，也正是基于这个特性，我们才能实现“当前笔记所在文件夹的其他笔记”这个功能。

噢顺便一提，不知道你注意到了没，当你做到这里的时候，你已经实现了我们一开始想要完成的效果了

恭喜！

### 原理和小技巧

原理上来说，我们最终的筛选条件：&#96;file.inFolder(this.file.folder)&#96;  

即我们先用 &#96;this.file&#96; 获取到当前激活的笔记的“文件对象”，然后再通过 &#96;.folder&#96; 获取到它的文件夹信息。

这里有一个小技巧，你可以点击 Properties → Add Formula 添加公式属性：

输入 &#96;file.&#96; 后你会看到它具有的各种属性：

输入完整的 &#96;file.folder&#96; 时，就可以看到每个文件的该属性：

——这也是一个测试 bases 公式的实用技巧，多试试其他属性吧！

## 总结

这次我们尝试了：

1. 创建一个新的数据库文件
2. 添加筛选条件，来显示出我们想要的笔记
3. 通过移动 base 到侧栏，来获得动态的筛选结果
4. 同时，了解了基础的文件属性

希望这篇文章能作为你的 base 之旅的轻松起步，祝你玩得愉快~

Moi moi！ (￣▽￣)ノ

## 资料

这里是一些相关资料，可以作为拓展学习。

### Base 文档

[Bases syntax - Obsidian Help 45](https://help.obsidian.md/bases/syntax)  

base 的基础语法，建议在实践完之后（或者之前）先查看该文档，获取扎实的基础知识。

在 [Properties 6](https://help.obsidian.md/bases/syntax#Properties) 章节，你可以看到笔记属性和文件属性的介绍；  

在 [Functions 12](https://help.obsidian.md/bases/functions) 页面，你可以看到关于公式/函数的介绍和应用。

### 示例库

[kepano/kepano-obsidian 64](https://github.com/kepano/kepano-obsidian)  

Kepano 分享的 Obsidian 示例库，他已经将库中的筛选都换成了 bases 数据库形式，你可以在里面学习到很多用法。
