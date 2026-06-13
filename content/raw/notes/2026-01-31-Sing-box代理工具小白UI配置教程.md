---
标题: Sing-box代理工具小白UI配置教程
笔记 ID: 019c1329-488c-7209-b82d-feadeae9931b
笔记类型: crawl
tags:
    - 工作/技能工具
卡片盒:
    - 生活
包含语音: 是
网页链接:
创建时间: "2026-01-31T16:26:38.604"
更新时间: "2026-03-11T20:45:31.691"
---
![录音](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/files/019c1329-3d9e-7e74-bf82-a8f7ab6e64fc.md#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260131%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260131T082638Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;bf3944e942ef01b0ac379b20284dc77479bd69f969dbcd759a357d24199832a3&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

之前在隔壁站发过一篇征文稿

  
      ![](https://linux.do/uploads/default/original/4X/5/3/1/531c53cea64fe045f105b3dd36f5ff7e337fa82c.png)

      [IDC Flare – 7 Nov 25](https://idcflare.com/t/topic/38725?u&#61;lumi)
  

  
    ![](https://linux.do/uploads/default/optimized/4X/a/d/1/ad1251489e9d9407a7de835a2f083218b4f46484_2_690x297.png)

  
### [[教程] 喂饭了！singbox 代理，全程 UI 界面操作！“手搓” 一份全平台通用的配置文件，实现精准分流、无 DNS 泄露、无感运行、多端同步、订阅转换](https://idcflare.com/t/topic/38725?u&#61;lumi)

  
      
        
        
          教程
        
      
    
      
        
          
            征文 - 202545
            原创
        
      
    
  

  
▶  叠个甲 0. 前言 最近，佬友们对于网络代理工具的问题越来越多，其中不乏一些懒人或者小白，想不折腾就能有一个比较好的上网体验。  下面我将从 0 开始，手把手全程 UI 界面操作，“手搓”👋一份可以全平台通用的 singbox 配置文件，真正的小白友好教程。无需任何代码编写，实现无 DNS 泄露、精准分流、裸核运行、低功耗无感的代理体验，附加 sub-store 订阅管理工具。有了这一份配置文件，你的所有的设备，无论手机，平板，电脑都可以实现同样完美的代理体验，一劳永逸。废话不多说，教程开始 🥳 ...

  
阅读时间: 5 mins 🕑
      赞: 289 ❤

  

  
    
    
  

  

虽然类似教程有很多，还是重新在 L 站发一下吧，骗一些赞， 里面有一些对网络代理相关概念的理解，以及 singbox 的多端同步，低功耗无感运行的心得，也是对相关教程的补充。对小白友好，希望可以给佬友们带来一些帮助。欢迎交流指正，大佬轻点喷

 

叠个甲

本人对网络代理的理解仅仅是入门小白水平，所以下面有表述错误的请多多指正（真正手搓 singbox 配置文件的大佬见笑了）

# [0. 前言](https://linux.do/t/topic/1207987#p-10580557-h-0-1)

最近，佬友们对于网络代理工具的问题越来越多，其中不乏一些懒人或者小白，想不折腾就能有一个比较好的上网体验。

下面我将从 0 开始，手把手全程 UI 界面操作，“手搓”![:waving_hand:](https://linux.do/images/emoji/twitter/waving_hand.png#61;15)一份可以全平台通用的 singbox 配置文件，真正的小白友好教程。**无需任何代码编写，实现无 DNS 泄露、精准分流、裸核运行、低功耗无感的代理体验**，**附加 sub-store 订阅管理工具**。有了这一份配置文件，你的所有的设备，无论手机，平板，电脑都可以实现同样完美的代理体验，一劳永逸。废话不多说，教程开始 ![:partying_face:](https://linux.do/images/emoji/twitter/partying_face.png#61;15)

# [1. 准备](https://linux.do/t/topic/1207987#p-10580557-h-1-2)

1. 一台电脑（教程以 Windows 端为例，mac 端通用）
2. 一份 GUI.for.SingBox 安装包 [Releases · GUI-for-Cores/GUI.for.SingBox · GitHub](https://github.com/GUI-for-Cores/GUI.for.SingBox/releases/)
3. 需要在科学网络环境下进行，否则一些 GitHub 上的资源无法顺利下载
4. 如果出现程序报毒被误删，可以先关闭杀毒软件，程序是开源无毒的，只是误报（作者的程序源代码疑似被不法分子使用制作了病毒，被人上传到病毒库，导致杀毒软件只要检测到的特征值一致，根本不管实际内容，就判定为病毒。）

# [2. 懒人配置](https://linux.do/t/topic/1207987#p-10580557-h-2-3)

## [1. 基础设置](https://linux.do/t/topic/1207987#p-10580557-h-1-4)

1. **解压**安装包到指定路径，**双击.exe** 文件打开 GUI 面板
2. **点击 setting**，**切换简体中文语言**，下方页面可见性，**勾选规则集**
3. **点击内核**，点击第一个 singbox **内核更新**，下方的 Alpha 内核不需要管

## [2. 导入订阅链接](https://linux.do/t/topic/1207987#p-10580557-h-2-5)

返回**概览页面** → **快速开始** → **输入** singbox 格式的订阅链接和名称 → **保存** → **启动内核**（没有 singbox 格式的订阅，可以看下面的订阅转换）

[![ad1251489e9d9407a7de835a2f083218b4f46484_2_517x222](https://linux.do/uploads/default/original/4X/0/d/1/0d1007a4939658a6bf42763b17eb1b84d226055e.png)](https://linux.do/uploads/default/original/4X/0/d/1/0d1007a4939658a6bf42763b17eb1b84d226055e.png)

## [3. 完成](https://linux.do/t/topic/1207987#p-10580557-h-3-6)

**点击配置** → **右键配置文件** → **更多** → **复制到剪切板**。

桌面**新建**一个&#96;.json&#96; 文件，把内容粘贴进去。
[![6c124034f50474b185b52996f9e621665cca4085_2_420x373](https://linux.do/uploads/default/original/4X/3/a/5/3a5c3e7cee5ffb1dbdfc2922cecc6418052ca425.png)](https://linux.do/uploads/default/original/4X/3/a/5/3a5c3e7cee5ffb1dbdfc2922cecc6418052ca425.png)

至此，教程结束。

此时你已经得到了一份无 DNS 泄露的配置文件，全端可用。如果你的需求就是不折腾，无 DNS 泄露，想所有设备都实现科学上网，那么到这里你的需求已经满足了，直接看 **多端同步** 部分即可。

## [4. 订阅转换](https://linux.do/t/topic/1207987#p-10580557-h-4-7)

如果没有你的订阅没有 singbox 格式，有以下几种方法

### [4.1. 本地转换（sub-store）](https://linux.do/t/topic/1207987#p-10580557-h-41sub-store-8)

1. **点击插件** → **插件中心** → **搜索 sub** → **添加 Sub-Store 纯净版**
2. **点击安装** → **运行** → **浏览器中打开**，至此你就获得了一个本地运行、功能强大的订阅管理工具

[![b0e5df084b89dc2308b75fce8930d2e55c20c84b_2_1035x288](https://linux.do/uploads/default/optimized/4X/f/2/d/f2d22741267d1737427d081165958ccdc44af11a_2_690x192.png)](https://linux.do/uploads/default/original/4X/f/2/d/f2d22741267d1737427d081165958ccdc44af11a.png)

1. **点击立即添加** → **单条订阅** ，**输入名称和订阅链接**
2. **点击添加的订阅**，选择对应格式复制即可

[![7c00280aad8a7897b1124af00dbb4322b41af85b_2_775x438](https://linux.do/uploads/default/optimized/4X/4/4/9/449e048c61e21a37c48bce6bc94041601f3067d6_2_517x291.png)](https://linux.do/uploads/default/original/4X/4/4/9/449e048c61e21a37c48bce6bc94041601f3067d6.png)

### [4.2. 在线转换](https://linux.do/t/topic/1207987#p-10580557-h-42-9)

自行在网上搜索 singbox 订阅转换，可以参考这篇文章的汇总

  
      ![](https://linux.do/uploads/default/original/4X/6/c/1/6c1c0c30a0bb07c6b926f12fa06f75006d9e23a3.png)

      [sing-box-node.com](https://sing-box-node.com/clash-to-sing-box/)
  

  
    

### [Clash 订阅转 sing-box - sing-box-node](https://sing-box-node.com/clash-to-sing-box/)

  
sing-box 作为新兴的代理工具，使用专门的订阅格式，很多机场目前都还没提供支持，但是好在已经有 sing-box 订阅转换工具，可以将常见的 Clash 订阅转换为 sing-box 订阅。 clash2singbox 项目地址： https://github.com/xmdhs/cla...

  

  
    
    
  

  

在线转换有订阅泄露风险，但胜在方便，自行考量

# [3. 进阶配置（完善配置文件）](https://linux.do/t/topic/1207987#p-10580557-h-3-10)

## [1. 通用设置](https://linux.do/t/topic/1207987#p-10580557-h-1-11)

1. 首先**概览页面停止内核**，进入**配置页面**，**右键点击**创建的配置文件 → **名称设置**，可以修改配置文件名称
2. 下一步**通用设置**（小白可跳过），这里可以按需进行更改

## [2. 入站设置](https://linux.do/t/topic/1207987#p-10580557-h-2-12)

mixed-in 和 tun-in 的区别

mixed-in 是打开一个 SOCKS+HTTP 的代理端口，也就是系统代理  

tun-in 也就是虚拟网卡模式，接管所有流量  

通俗解释来说，系统代理和 tun 模式，一个是插排，一个是总电闸。插排（系统代理）是谁插谁用，不插也可以走别的线路通电（一些应用不会走系统代理，主要是浏览器使用）。但总闸（tun 虚拟网卡）控制着所有流经的电流，统一管理

（正常来说系统代理要比 tun 更快一些，但是 tun 更不容易 DNS 泄露）

1. 此处默认为 **mixed-in**，我建议把 **tun-in 也打开**，两个**同时启用**
2. 可以上下变动顺序，调整模式的优先级
3. 其余不了解的话，默认即可，点击保存

## [3. 精准分流](https://linux.do/t/topic/1207987#p-10580557-h-3-13)

分流

什么是分流，简单来说，就是我制定一个规则，这个规则里写好了，访问某网站或者某个 IP 的时候，需要用某某节点来访问  

这样在规则路由模式下，你的网络就会按照你制定的规则进行分流访问

&#96;我的分流需求是使用Gemini的时候，可以用美国节点访问，而访问其余网站，直接连接即可。佬友可以照着改成其他的，下面开始实战&#96;

### [3.1 规则集](https://linux.do/t/topic/1207987#p-10580557-h-31-14)

规则集

规则集就是把某个场景下的所有域名或者 IP 汇总到一起，比如在使用 Gemini 时，需要用美国节点去访问，我就需要先知道使用 Gemini 的时候，会涉及访问的所有网站和 IP，以便后面去给它制定规则

1. 

**点击规则集**（需要设置页面→页面可见性中勾选规则集才能显示） → **点击规则集中心** → **更新列表**，这里面有 2000 多的规则集，足以应对大部分的分流需求，**搜索 gemini**（注意使用小写字母搜索），**点击添加源文件**（二进制要比源文件的运行效率更高，源文件可视可编辑），规则集中会显示刚刚添加的 Gemini 的规则
[![6f2e4700d7745f89f2b12e32417db9582da01002_2_1035x325](https://linux.do/uploads/default/optimized/4X/4/7/9/479d1281eb51503444bfdd815d32eeeddc2164e9_2_690x216.png)](https://linux.do/uploads/default/original/4X/4/7/9/479d1281eb51503444bfdd815d32eeeddc2164e9.png)

2. 

光标移动到规则集右上角，点击编辑，复制远程链接（这一步是方便多设备同步）

3. 

返回**配置页面**，**右键点击**创建的配置文件 → **路由设置** → * *规则集*，点击右上角的加号，进行规则集的添加。名称随意，类型远程，各自根据实际情况选择，填入远程链接，自动更新间隔自行填写，默认是 1d
[![b917e419f504d94fea257ac75c539bc76b71f7d0](https://linux.do/uploads/default/optimized/4X/b/9/1/b917e419f504d94fea257ac75c539bc76b71f7d0_2_690x329.png)](https://linux.do/uploads/default/original/4X/b/9/1/b917e419f504d94fea257ac75c539bc76b71f7d0.png)

### [3.2 出站设置](https://linux.do/t/topic/1207987#p-10580557-h-32-15)

[![bc32e1be53dca19181f54be450b9295e416a5028](https://linux.do/uploads/default/original/4X/e/8/d/e8db7fa22e1a35b782a940c6c0e84bf9e4832634.png)](https://linux.do/uploads/default/original/4X/e/8/d/e8db7fa22e1a35b782a940c6c0e84bf9e4832634.png)

返回**配置页面**，**右键点击**创建的配置文件 → **出站设置**，现在我们需要为刚刚添加的 Gemini 规则集找一个出口，**点击右上角的** **+**，**输入名称**（给出口取个名字），往下滑，来到**订阅部分**，在里面找到你想让 Gemini 使用的节点出口，我**选择了所有的美国节点**，回到上边第二行**类型**，选择**手动选择**（自动选择可以自动测测并选择延迟最低的一个节点，可以自行选择），**点击保存**
[![f86b227a75f869f754f4025818daa8f393428eba_2_1035x748](https://linux.do/uploads/default/optimized/4X/e/9/2/e92b670fec2d5a19f5fa91ba335bb22e120d5768_2_690x498.png)](https://linux.do/uploads/default/original/4X/e/9/2/e92b670fec2d5a19f5fa91ba335bb22e120d5768.png)

### [3.3 路由设置](https://linux.do/t/topic/1207987#p-10580557-h-33-16)

点击**下一步**进入**路由设置**，路由设置其实就是制定规则的地方，刚刚我们先找到了 gemini 涉及的所有域名的规则集，然后给 gemini 创建了一个出口，下一步就是把规则集和出口联系起来。点击规则，  **点击 “+ 新规则将插入到这里”**，在**出站标签**处选择刚刚添加的**出口**，**规则集部分就选择 gemini 的规则集**，**点击保存**，**点击保存**，此时我们就完成的对 gemini 的精准分流，所有访问 Gemini 的流量都会通过我们添加的出口，使用美国节点访问。

[![85b1dd59df2899e373d56ff76da31e48388def22_2_607x562](https://linux.do/uploads/default/optimized/4X/0/9/f/09f24fdf930dbd93b99d4ba7228b9cf8ac3d9677_2_540x500.png)](https://linux.do/uploads/default/original/4X/0/9/f/09f24fdf930dbd93b99d4ba7228b9cf8ac3d9677.png)[![79c9e12d952b40a836f88f7ca7c4183d73386edc_2_859x750](https://linux.do/uploads/default/optimized/4X/d/7/8/d789befa9ee4f7434dab1dc4493a63174fe4caf8_2_572x500.png)](https://linux.do/uploads/default/original/4X/d/7/8/d789befa9ee4f7434dab1dc4493a63174fe4caf8.png)

# [4. 多端同步](https://linux.do/t/topic/1207987#p-10580557-h-4-17)

在其他设备上安装 singbox，苹果系直接在商店下载即可，安卓可以在谷歌商店或者直接下载安装包[图形界面客户端 - sing-box](https://sing-box.sagernet.org/zh/clients/)

在这里我介绍三种方法，自行选择

## [4.1 局域网同步导入](https://linux.do/t/topic/1207987#p-10580557-h-41-18)

[![d893ec42cb6a3bfb8b8655f5dc944aa00c0fed35_2_1035x294](https://linux.do/uploads/default/optimized/4X/0/f/4/0f46dd5f65b9eeadeef69c038b431e94deb08c28_2_690x196.png)](https://linux.do/uploads/default/original/4X/0/f/4/0f46dd5f65b9eeadeef69c038b431e94deb08c28.png)

**点击插件** → 插件中心，滑到最后找到**共享配置到手机**，**添加** → **安装** → **运行**，选择你另一个设备的 singbox 的内核版本（安卓选择最新版本即可，苹果设备选择主流版），**点击确定**。按照插件提示的操作扫码导入即可

## [4.2 配置文件导入](https://linux.do/t/topic/1207987#p-10580557-h-42-19)

1. **生成配置文件**（教程 2.3 章节）
2. 在其他设备的 singbox 配置页面，点击添加，从文件导入

[![0452b9097e9dd9e642e2fc097cbc6c6259550b13_2_252x562](https://linux.do/uploads/default/optimized/4X/e/1/6/e167ee4d06c819c1950ebbd80c933d7df5982042_2_168x375.webp)](https://linux.do/uploads/default/original/4X/e/1/6/e167ee4d06c819c1950ebbd80c933d7df5982042.webp)  

[![6a47871ad92908ec219fd554d3f4e8bb962e02ed_2_517x370](https://linux.do/uploads/default/original/4X/b/9/a/b9ac74716571b1ac5a1300ffbe5be3ea002b8395.png)](https://linux.do/uploads/default/original/4X/b/9/a/b9ac74716571b1ac5a1300ffbe5be3ea002b8395.png)

1. 其实在局域网同步导入这个方法中，插件的扫码页面，点击二维码旁边的链接，可以直接在浏览器打开配置文件（相当于直链），此时右键页面另存为，可以直接保存 .json 的配置文件

## [4.3 云端自动同步更新](https://linux.do/t/topic/1207987#p-10580557-h-43-20)

1. 先获取配置文件，然后上传到可以生成直链的地方，获取直链
2. 在其他端新建配置，选择远程，将直链填入 url，填写名称，创建即可
3. 这样电脑端修改好直链文件，其他设备直接更新即可

现在你所有的设备都可以只用同一套配置文件运行 singbox 代理，并且有相同的体验。

# [5. 优化体验，无感运行](https://linux.do/t/topic/1207987#p-10580557-h-5-21)

## [5.1Windows/mac](https://linux.do/t/topic/1207987#p-10580557-h-51windowsmac-22)

1. 

在配置好 singbox 后，启动内核并且能够正常运行，此时可以在设置页面，找到程序退出时关闭核心，取消勾选这一项。这样你就可以直接关掉 GUI 面板而不影响内核的运行，也就是所谓的跑裸核，对于电脑性能占用更低。
[![842a37612118d8e87ce7f901a103bab1626c9e3a_2_775x561](https://linux.do/uploads/default/optimized/4X/1/e/f/1efba1d9c7e2fcebb4c6b49dee1c2b0c2116e269_2_690x499.png)](https://linux.do/uploads/default/original/4X/1/e/f/1efba1d9c7e2fcebb4c6b49dee1c2b0c2116e269.png)

2. 

想关掉的时候，直接再次打开 GUI 面板，点击停止内核即可，也可以在任务管理中心，终止 singbox 内核进程

3. 

由于 singbox 内核更新频率很高，配置文件可能会遇到不兼容的情况，建议及时更新 GUI 上的 singbox 内核， 配置文件会自动覆写匹配最新的协议。建议安装一个滚动发行插件，并在设置中启用滚动发行，也能减少一些报错。

## [5.2Android](https://linux.do/t/topic/1207987#p-10580557-h-52android-23)

1. 配置好正常运行，直接退出 singbox，杀掉后台
2. 打开设置，vpn，找到 singbox，点击右侧的箭头，点击始终开启 vpn，这样就可以跑裸核了，而且后台不可见

[![f504aebef0943089cf2e1628c599c0cb64bec7d2_2_337x750](https://linux.do/uploads/default/optimized/4X/b/c/1/bc1996fff9b13979e3ea048b165facb26a28396b_2_224x500.jpeg)](https://linux.do/uploads/default/original/4X/b/c/1/bc1996fff9b13979e3ea048b165facb26a28396b.jpeg)[![ae9d46bef1eb03f01afc1c627a6322e764cd9b99_2_337x750](https://linux.do/uploads/default/optimized/4X/f/d/0/fd0f0866c3012aa06179f4008bc48b3ae6f17f1d_2_224x500.jpeg)](https://linux.do/uploads/default/original/4X/f/d/0/fd0f0866c3012aa06179f4008bc48b3ae6f17f1d.jpeg)

1. 后面打开 singbox 再次杀掉后台时，可能会弹出始终开启的 vpn 已断开，我们只需要点进去，找到始终开启 vpn 按钮，取消后重新勾选即可
2. 一些安卓设备是可以隐藏顶部状态栏的 vpn 图标的，小米是可以，其他的我还不清楚
3. 在 singbox 的设置页面，配置覆盖，可以进行分应用代理

## [5.3Apple 系列](https://linux.do/t/topic/1207987#p-10580557-h-53apple-24)

1. 配置后正常运行，点击设置，按需启动，始终启动，直接杀死后台即可裸核运行
2. 设置，配置重载，隐藏 vpn 图标，状态栏的 vpn 图标即可隐藏

[![e51508400b293b506d3a654fbbd25b45fb9fe39f_2_999x750](https://linux.do/uploads/default/optimized/4X/7/0/0/700e7f92e60e1101b0c9eb55a898a0f32eefd9a9_2_666x500.jpeg)](https://linux.do/uploads/default/original/4X/7/0/0/700e7f92e60e1101b0c9eb55a898a0f32eefd9a9.jpeg)[![ebebf3694ef85b5fcaec4c1c23bbfaf600e839a1_2_999x750](https://linux.do/uploads/default/optimized/4X/2/a/3/2a368a78f7d289910d485a97a78dd8c319fabf5b_2_666x500.jpeg)](https://linux.do/uploads/default/original/4X/2/a/3/2a368a78f7d289910d485a97a78dd8c319fabf5b.jpeg)

# [6. 补充](https://linux.do/t/topic/1207987#p-10580557-h-6-25)

## [6.1 特定网站分流](https://linux.do/t/topic/1207987#p-10580557-h-61-26)

关于特定网站自定义分流，可以维护一个规则集，填入相应的域名、域名关键词、IP，如果只是电脑端使用，可以在规则集页面，添加一个手动管理的规则集文件，想同步的话，使用上传规则集&#96;规则.json&#96; 获取直链进行同步

&#96;&#96;&#96;
{
  &quot;version&quot;: 2,
  &quot;rules&quot;: [
    {
      &quot;domain&quot;: [
        &quot;ai.google.dev&quot;
      ],
      &quot;domain_suffix&quot;: [
        &quot;gemini.google&quot;
      ],
      &quot;ip_cidr&quot;: [
        &quot;0.0.0.0/20&quot;
      ]
    }
  ]
&#96;&#96;&#96;

## [6.2 DNS 泄露](https://linux.do/t/topic/1207987#p-10580557-h-62-dns-27)

什么是 DNS 泄露

在使用代理的时候，你的 DNS 请求没有随主流量通过代理访问，而是直接由本地网络服务处理和记录

通俗来说，你要开车去境外，并且已经有了秘密通道（网络代理），现在你不知道路线，需要先去问路，问路的时候并没有走秘密通道，导致你问路的这个人知道了你的位置和意图，也就泄露了

其实关于 怎么避免 DNS 泄露部分并没有讲述，是因为 GUI 面板作者已经配好了 DNS 规则，使用默认选项生成的配置文件就无 DNS 泄露的，非常方便。

基于 singbox 独特、强大的 DNS 分流特性，很容易实现防止 DNS 泄露

下面是两个检测 DNS 泄露的网站，只要检测结果的旗帜中，不存在和你节点地区不同的情况，就无 DNS 泄露

  
      ![](https://linux.do/uploads/default/original/4X/d/b/2/db2f0982ceec0b06f18f8caf47fb074a25651c39.png)

      [BrowserLeaks](https://browserleaks.com/dns)
  

  
    

### [DNS Leak Test](https://browserleaks.com/dns)

  
The DNS Leak Test is a tool used to determine which DNS servers your browser is using to resolve domain names. This test attempts to resolve 50 randomly generated domain names, of which 25 are IPv4-only and 25 are IPv6-only.

  

  
    
    
  

  

  

      [ipleak.net](https://ipleak.net/)
  

  
    ![](https://linux.do/uploads/default/original/4X/0/2/4/0249fcf8af95a9d56b8270061c09bdb8d59f9fde.png)

### [IP/DNS Detect](https://ipleak.net/)

  
What is your IP, what is your DNS, check your torrent IP, what informations you send to websites.

  

  
    
    
  

  

## [6.3 插件](https://linux.do/t/topic/1207987#p-10580557-h-63-28)

GUI.for.SingBox 的插件中心有着许多实用的插件，下面推荐几个，其余的佬友可以自行尝试或者开发

1. &#96;sub-store 纯净版&#96;  开源的订阅管理工具，自建节点管理、订阅转换、订阅合并、订阅 / 节点格式化
2. &#96;共享配置到手机&#96;方便设备间的配置导入，并且可以选择不同内核版本，对 Apple 系用户友好
3. &#96;滚动发行&#96;获取更快、更新、更稳定的版本更新体验
4. &#96;节点转换&#96;支持多种协议节点转换成 singbox 格式，导出复制，在订阅中直接添加即可
5. &#96;配置同步 - Gists&#96; 可以使用 Gists 同步 GUI 的配置，方便备份恢复
6. &#96;metacubexd 仪表盘&#96;能够创建一个 mihomo 仪表盘， 裸核运行时方便查看管理，clash 用户友好
7. &#96;链式代理助手&#96;快速生成用于添加链式代理的配置
8. &#96;解除 UWP 应用本地回环限制&#96;解决一些微软服务连不上网的问题  

插件中心还有定时签到的插件，挺丰富的，佬友们可以自行探索一下

## [6.4 内存占用与功耗](https://linux.do/t/topic/1207987#p-10580557-h-64-29)

根据优化部分的教程，进行裸核运行，可以达到一个相当不错的占用和功耗，24 小时开启，也是无感的  

由于设备受限，只展示 Windows、安卓、ipad 的情况

1. 

**Windows**  

观看 YouTube 4K 视频时的占用情况
[![e7dcab8aadc359556e7aeeddb2b2a14fcfb4024e](https://linux.do/uploads/default/original/4X/9/5/5/9554162f18b289214b7436071cc6ea578db04777.png)](https://linux.do/uploads/default/original/4X/9/5/5/9554162f18b289214b7436071cc6ea578db04777.png)

2. 

**Android**（xiaomi）  

正常使用 6 个多小时，singbox 裸核运行的电量消耗

[![94fec972cea0d44f31629db8ef7e84b943b44ef5_2_616x750](https://linux.do/uploads/default/optimized/4X/9/3/f/93fceda977c6a02f0a0e26a511e074b0c36940ef_2_410x500.jpeg)](https://linux.do/uploads/default/original/4X/9/3/f/93fceda977c6a02f0a0e26a511e074b0c36940ef.jpeg)[![2e695425fffcb7a7c636900d60f5d4159575eb3e_2_616x750](https://linux.do/uploads/default/optimized/4X/e/d/e/ede124dc416624b92eb598632338121d3b29a416_2_410x500.jpeg)](https://linux.do/uploads/default/original/4X/e/d/e/ede124dc416624b92eb598632338121d3b29a416.jpeg)

1. **ipad**（2021 款）  

近一周 singbox 裸核耗电情况，24 小时一直裸核运行，平均 4% 左右（上周六那天是因为一直在调试，占用较高）  

[![0602693f5ec4dc8a6ce9b53c7f2762a9ba317940_2_715x562](https://linux.do/uploads/default/optimized/4X/c/d/9/cd93d96af0efb69e423bfde36913de7899f2b566_2_636x500.jpeg)](https://linux.do/uploads/default/original/4X/c/d/9/cd93d96af0efb69e423bfde36913de7899f2b566.jpeg)

# [7. 后记](https://linux.do/t/topic/1207987#p-10580557-h-7-30)

其实这是我第一次这么长篇幅的去写东西，哈哈哈哈哈，也算是有些纪念意义了 ![:partying_face:](https://linux.do/images/emoji/twitter/partying_face.png#61;15)  

教程先写到这里吧，后面还会补充，写的不好的地方，欢迎各位佬友批评指正  

如果教程对大家有帮助， 点个 **赞** 或者 **评论** 支持一下，谢谢大家 ![:two_hearts:](https://linux.do/images/emoji/twitter/two_hearts.png#61;15)

    
  

![](https://linux.do/user_avatar/linux.do/kkxx123/48/847542_2.png) Ziv:[↗](https://linux.do/t/topic/1207987/35)
  
&gt; ![](https://linux.do/user_avatar/linux.do/jlon/48/387803_2.png) Jlon:
&gt; 
&gt; 
&gt; 
&gt; [↗](https://linux.do/t/topic/1207987)
&gt;   
&gt; &gt; 在其他设备的 singbox 配置页面，点击添加，从文件导入
&gt; 
&gt; 
&gt; 
&gt; 需要在入站设置开 **tun-in**, 不然手动创建后无法使用
