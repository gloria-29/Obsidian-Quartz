---
标题: 一人千面，永不降智！手把手教你如何通过Mihomo强大的覆写功能，灵活配置代理与链式代理，制订相应的分流规则，解决GPT降智，无限试用Cursor - 开发调优
笔记 ID: 01998eb9-33c3-7473-af2c-5ec66180bccb
笔记类型: crawl
tags:
    - 生活/电子工具
卡片盒:
    - 生活
包含语音: 否
网页链接:
创建时间: "2025-09-28T13:08:44"
更新时间: "2026-03-11T20:45:31.691"
---

一人千面，永不降智！手把手教你如何通过 Mihomo 强大的覆写功能，灵活配置代理与链式代理，制订相应的分流规则，解决 GPT 降智，无限试用 Cursor
------------------------------------------------------------------------------

[MuShang](/u/york_ji) [York\_Ji](/u/york_ji) 文化宣导员 楼主

Abstract
--------

最近在使用 Cursor 与 Windsurf 时，因为频繁注册账号来试用，机器码与 IP 地址很容易被标记，导致账号被封禁等问题，因此花了一下午的时间仔细研究了 Mihomo 的官方文档，研究出来了如何使用覆写功能，实现链式代理，在通过灵活的分流规则，控制不同的连接试用不同的出站方式，实现了 IP 地址的灵活管理，可以无限试用 Cursor、避免 ChatGPT 降智，甚至是配合指纹浏览器批量注册账号等。话不多说，将今天总结到的经验分享给佬友们，希望可以帮助到大家

Introduction
------------

什么是覆写
-----

&#96;覆写功能用于对订阅配置进行自定义修改，使用覆写功能修改订阅配置可以使得修改在更新订阅后依然生效&#96;

简单的说，你可以通过覆写这个功能，对订阅配置文件进行很高自由度的修改（包括增、删、改等），并且可以应用于多个不同的订阅中，这种灵活的特性使得其可以优雅的进行配置文件的管理和规则的自定义

本文的解决方案
-------

使用自建的机场节点 + 某 IP 代理提供商，采用覆写原有机场配置文件的方式，加入链式代理，并通过规则的自定义，实现针对不同的链接，走不同的分流规则，对于一般场景，直接走机场代理，对于要求 IP 纯净度 / 另一个身份的场景 使用链式代理

Methodology
-----------

导入原始订阅
------

首先将原始机场订阅导入到订阅软件中（我这里以 Mihomo Party 为例），导入后的代理组如图所示  

[![image](https://linux.do/uploads/default/optimized/4X/e/3/f/e3f9af0bace0159d2d2a575d2e5a1a0386721dd6_2_365x374.png)](https://linux.do/uploads/default/original/4X/e/3/f/e3f9af0bace0159d2d2a575d2e5a1a0386721dd6.png &quot;image&quot;)

  
我这里的 &#96;XBoard&#96; 其实就是大家平常见到的手动选择，因为机场配置的原因所以叫做这个名字了  
这个机场中的订阅，将作为链式代理的第一环，因为很多落地节点是不可以直连的，所以需要通过机场链接对其进行访问

获取落地节点
------

落地节点指的是链式代理的后半段，我们的请求 通过原始订阅，交给了落地节点，落地节点再去对服务器进行访问，因此远端服务器获得的 IP 地址，就是你的落地节点的 IP 地址，一般这一步常用代理池以实现身份伪装或者使用家宽节点获得良好的冲浪体验

本教程以 Proxy302 作为落地节点，这里我通过 Proxy302 申请一个静态 IP 地址，并选取 socks5 作为代理类型，选择按流量扣费（因为我平常需要链式代理的流量并不多，所以选取这种方式，各位可以根据自己的需求灵活选择），获得了如下的代理配置信息

[![image](https://linux.do/uploads/default/original/4X/f/b/0/fb0618fb10d9703ff5467c99cd2b10b1894a51c3.png)](https://linux.do/uploads/default/original/4X/f/b/0/fb0618fb10d9703ff5467c99cd2b10b1894a51c3.png &quot;image&quot;)

通过链式代理配置代理节点
------------

现在我们已经获得了落地节点，下一步就是将原始机场和落地节点进行一个组装，以实现链式代理。这里使用非常灵活的 &#96;覆写&#96; 功能，来实现这一目标

在 Mihomo Party 的覆写页面，单击＋号，选择新建 YAML 随意取名，我这里就叫做 &#96;XBOARD覆写&#96;  

[![image](https://linux.do/uploads/default/original/4X/d/5/b/d5bd855c83c8b55ec961ade6e8481e117e374083.png)](https://linux.do/uploads/default/original/4X/d/5/b/d5bd855c83c8b55ec961ade6e8481e117e374083.png &quot;image&quot;)

双击建立好的覆写卡片，开始编辑覆写内容

首先我们设置一个新的订阅组，叫做 &#96;dialer&#96; 这个代理组的作用是实现前置机场的节点选择

    proxy-groups+:
      - name: dialer
        type: select
        proxies:
          - Hysteria2
          - Vless-Reality
          - Torjan

这里的 proxy-groups+ 表示的是将这个代理组加入到原有代理组的最后面，其实顺序不影响，但是按照使用习惯，手动选择应该是一个比较靠前的位置，所以我这里就这么写了，这里的 proxies 我包含了所有的机场的节点，因为希望在前置选择时具有更高的灵活度

其次，我们需要将落地节点，通过覆写加入到订阅中去，同样的，在覆写文件中追加

    proxies+:
      - name: 302proxy_fixed
        dialer-proxy: dialer
        type: socks5
        server: XXX
        port: 3333
        username: JXXX
        password: PXXXXXXXXX

这里的重中之重就是 &#96;dialer-proxy&#96; 关键词！这是 mihomo 的一个非常 morden 的特性，将取代原有的链式代理管检测（我忘了是什么了），这里它的值被设置为 &#96;dialer&#96; 这和我们上边新增的代理组的名称一致，大家应该已经看出来了，他的意思就是，这个新增的 proxy 的节点，是依附在 dialer 代理组之后的，所有的请求会先经过 dialer 代理组中你具体选择的节点，然后再经过落地节点，被转发出去

然后，我们在添加一个新的代理组，这个代理组仅包含 302proxy\_fixed 这一个节点，这个代理组存在的意义主要是方面我们后面的规则设置，我们将其命名为 &#96;302proxy_fixip&#96; ，添加代理组的代码如下

    proxy-groups+:
      - name: 302proxy_fixip
          type: select
          proxies:
            - 302proxy_fixed

最后的最后，就是针对这个落地节点，设置相应的分离规则， 比如说一般情况下，我希望大多数流量不通过这个落地节点，而是通过普通的机场节点，只有在访问 cursor 的时候，我才希望启用链式代理，那我们就在覆写的最后面追加一个规则设置

    +rules:
      - DOMAIN-KEYWORD,cursor,302proxy_fixip

这个意思是添加一条规则，只要之后访问的域名中带有 &#96;cursor&#96; 这个关键词，就通过 &#96;302proxy_fixip&#96; 这个代理组来访问

最终 这个覆写文件的内容如下

    proxies+:
      - name: 302proxy_fixed
        dialer-proxy: dialer
        type: socks5
        server: XXX
        port: 3333
        username: XXX
        password: XXXXX
    
    proxy-groups+:
      - name: dialer
        type: select
        proxies:
          - Hysteria2
          - Vless-Reality
          - Torjan
      - name: 302proxy_fixip
        type: select
        proxies:
          - 302proxy_fixed
    
    +rules:
      - DOMAIN-KEYWORD,cursor,302proxy_fixip

此时，我们的覆写就已经全部完成啦，但是千万不要忘记了最重要最重要的一步，为目标订阅启动这个覆写，具体的做法也很简单，在代理页面找到机场配置，点击选项卡，选择 &#96;编辑信息&#96; ，选中覆写那里的 ＋ 号，添加刚刚的覆写就好啦  

最终，你的原始机场会增减两个新的代理组  

[![image](https://linux.do/uploads/default/original/4X/7/a/3/7a34aad995195a594f6498032cc16411e9e0369c.png)](https://linux.do/uploads/default/original/4X/7/a/3/7a34aad995195a594f6498032cc16411e9e0369c.png &quot;image&quot;)

  
上面的代理组用于选择前置节点，后面的代理组则是落地的节点

Experiment
----------

现在，让我们访问 Cursor，并检查 Mihomo 的链接  

[![image](https://linux.do/uploads/default/original/4X/a/2/4/a24844ee906dbc4a8b8ca38155db4d60924106ff.png)](https://linux.do/uploads/default/original/4X/a/2/4/a24844ee906dbc4a8b8ca38155db4d60924106ff.png &quot;image&quot;)

  
可以看到，访问 cursor 时，确实链接是通过我们设置的落地订阅组过去的，访问其他的链接例如 [bing.cn](http://bing.cn) ，则是通过手动选择的 Torjan 节点，最后访问 proxy302 的前置节点，也正是我们前面选择的 hy2 节点

Conclusion
----------

下午对于配置文件的研究确实让人受益良多，也希望可以通过这个经验分享，让更多的佬友成功配置灵活的落地代理和分流规则，享受更加精彩的互联网体验

笔者水平有限，可能文章中存在不少的谬误，希望各位佬友可以分享经验、批评指正

[持刀辣条](/u/pandawang) [pandawang](/u/pandawang) 文化宣导员

佬，这一块需要自己修改成机场节点的信息吗，有点不太懂

[fanslinux](/u/fanslinux)

感谢分享，仔细学习成功了

问一问 Dinox 吧

你想知道什么？我很乐意提供帮助。

&gt; 来源：[https://linux.do/t/topic/710502](https://linux.do/t/topic/710502)
