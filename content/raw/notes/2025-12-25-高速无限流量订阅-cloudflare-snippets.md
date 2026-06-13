---
标题: 高速无限流量订阅 cloudflare snippets
笔记 ID: 019b552a-36d2-74f5-95e8-bf72b4a83b6d
笔记类型: crawl
tags:
    - 财富/支出管理
卡片盒:
    - 财富
包含语音: 是
网页链接:
创建时间: "2025-12-25T18:59:48.562"
更新时间: "2026-03-03T00:07:56.594"
---
![录音](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/files/019b552a-3225-79f3-9ab7-0137575cb93b.md#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251225%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251225T105948Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;b5ed7734c64ca706c3b9a250df507f5c438bde82a3a99c546a14902fa2ce6146&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

原来的帖子不能编辑了，现在新增了很多备用地址。如果一个被封锁，可以换一个地址

双协议：vless websocket + trojan

# [利用 cloudflare 边缘网络的能力，网速十分快 + 无限访问次数](https://linux.do/t/topic/1341410#p-11441558-cloudflare-1)

[![img](https://linux.do/uploads/default/optimized/4X/0/a/7/0a74060576671abe5a217f1891ae9d22163bce34_2_690x200.jpeg)](https://linux.do/uploads/default/original/4X/0/a/7/0a74060576671abe5a217f1891ae9d22163bce34.jpeg)  

![:eight_spoked_asterisk:](https://linux.do/images/emoji/twitter/eight_spoked_asterisk.png#61;15)（最新订阅删掉了很多优选）两协议，每个协议 4 个 CF 优选入口，合计 8 个节点（surge 不支持 vless，只能用 trojan）

# [一天 14tb，伊朗人民用了都说好](https://linux.do/t/topic/1341410#p-11441558-h-14tb-2)

[![telegram-cloud-photo-size-5-6208654326687796147-y](https://linux.do/uploads/default/optimized/4X/4/5/b/45bd74911d18fc36c050af6b70c4aed43e8caafe_2_555x500.jpeg)](https://linux.do/uploads/default/original/4X/4/5/b/45bd74911d18fc36c050af6b70c4aed43e8caafe.jpeg)

# [订阅地址](https://linux.do/t/topic/1341410#p-11441558-h-3)

自动适配 mihomo (clash)/ Xray (v2ray) 订阅

- [https://sni.111000.cc.cd/sub](https://sni.111000.cc.cd/sub)
- [https://sni.111000.de5.net/sub](https://sni.111000.de5.net/sub)
- [https://sni.111000.dns.army/sub](https://sni.111000.dns.army/sub)
- [https://sni.111000.v6.army/sub](https://sni.111000.v6.army/sub)
- [https://sni.111000.v6.navy/sub](https://sni.111000.v6.navy/sub)
- [https://sni.111000.v6.rocks/sub](https://sni.111000.v6.rocks/sub)
- [https://sni.111000.dynv6.net/sub](https://sni.111000.dynv6.net/sub)

iOS 推荐用 Clash mi，其他平台可以试试 flclash 之类

### [如果要强制指定 mihomo 订阅，可以加？clash](https://linux.do/t/topic/1341410#p-11441558-mihomoclash-4)

例如 [https://sni.111000.cc.cd/sub?clash](https://sni.111000.cc.cd/sub?clash)

## [如果其中一个域名在你那里被运营商屏蔽了，换另一个域名即可](https://linux.do/t/topic/1341410#p-11441558-h-5)

## [源码](https://linux.do/t/topic/1341410#p-11441558-h-6)

[snippets.js.7z](https://linux.do/uploads/short-url/ezA2Xh6Nk3nbo31NwJc5GlpSkxX.7z) (4.6 KB)  

推荐部署规则：【主机名】【开头为】【sni.】

## [订阅源码](https://linux.do/t/topic/1341410#p-11441558-h-7)

我订阅是另外写代码部署的。订阅的要放在 snippets 列表最上方

点击展开

触发规则参考：

【主机名】【开头为】【sni.】  

AND  

【uri 路径】【开头为】【/sub】
[![image](https://linux.do/uploads/default/optimized/4X/3/d/b/3db296136551534304af5896625d68b6b04b7e53_2_690x173.png)](https://linux.do/uploads/default/original/4X/3/d/b/3db296136551534304af5896625d68b6b04b7e53.png)

订阅源码

&#96;&#96;&#96;
function genSub(req, thisURL, UUID, passwd, path) {
&#9;const sni &#61; thisURL.hostname;
&#9;const list &#61; [&quot;bestcf.030101.xyz&quot;, &quot;saas.sin.fan&quot;, &quot;freeyx.cloudflare88.eu.org&quot;, sni];
&#9;const hit &#61; [&quot;030101.xyz&quot;, &quot;saas.sin.fan&quot;, &quot;cloudflare88&quot;, &quot;111000&quot;];
&#9;let text &#61; &#39;&#39;;
&#9;//v2ray sub
&#9;path &#61; encodeURIComponent(path);
&#9;for (let i &#61; 0; i &lt; list.length; i++) {
&#9;&#9;text +&#61; &#96;
vless://${UUID}@${list[i]}:443?encryption&#61;none&amp;security&#61;tls&amp;sni&#61;${sni}&amp;alpn&#61;http%2F1.1&amp;fp&#61;ios&amp;allowInsecure&#61;1&amp;type&#61;ws&amp;host&#61;${sni}&amp;path&#61;${path}#${i.toString().padStart(2, &#39;0&#39;)}-WS-${hit[i]}
trojan://${passwd}@${list[i]}:443?security&#61;tls&amp;sni&#61;${sni}&amp;alpn&#61;http%2F1.1&amp;fp&#61;ios&amp;allowInsecure&#61;1&amp;type&#61;ws&amp;host&#61;${sni}&amp;path&#61;${path}#${i.toString().padStart(2, &#39;0&#39;)}-Trojan-${hit[i]}&#96;;
&#9;}
&#9;text &#61; btoa(text.trim());
&#9;//v2ray sub

&#9;//clash sub
&#9;if (req.headers.get(&quot;User-Agent&quot;).toLowerCase().includes(&quot;clash&quot;)
&#9;&#9;|| thisURL.search.toLowerCase().includes(&quot;clash&quot;)) {
&#9;&#9;text &#61; &#96;port: 7890
socks-port: 7891
allow-lan: true
mode: rule
log-level: warning
global-client-fingerprint: firefox
external-controller: :9090
dns:
  enable: true
  ipv6: true
  enhanced-mode: fake-ip
  nameserver: [ &quot;quic://223.5.5.5&quot; ]
  fake-ip-filter: [ &quot;rule-set:fake-ip-filter&quot; ]
rule-providers:
  fake-ip-filter:
    type: http
    behavior: domain
    format: text
    interval: 86400
    url: https://fastly.jsdelivr.net/gh/juewuy/ShellCrash@dev/public/fake_ip_filter.list
rules:
  - DOMAIN-SUFFIX,services.googleapis.cn,节点选择
  - DOMAIN-SUFFIX,xn--ngstr-ira8j.com,节点选择
  - DOMAIN-SUFFIX,services.googleapis.com,节点选择
  - GEOSITE,microsoft@cn,DIRECT
  - GEOSITE,apple,DIRECT
  - GEOSITE,category-games@cn,DIRECT
  - GEOSITE,cn,DIRECT
  - GEOIP,cn,DIRECT
  - GEOSITE,private,DIRECT
  - GEOIP,private,DIRECT
  - MATCH,节点选择
proxy-groups:
  - { name: 节点选择, type: select, include-all: true, exclude-type: direct, proxies: [ 自动优选 ] }
  - { name: 自动优选, type: url-test, include-all: true, exclude-type: direct }
proxies:&#96;;
&#9;&#9;for (let i &#61; 0; i &lt; list.length; i++) {
&#9;&#9;&#9;text +&#61; &#96;
  - { name: ${i.toString().padStart(2, &#39;0&#39;)}-Trojan-${hit[i]}, server: ${list[i]}, port: 443, type: trojan, password: ${passwd}, sni: ${sni}, network: ws, ws-opts: { path: &quot;${path}&quot;, headers: { Host: ${sni} } } }
  - { name: ${i.toString().padStart(2, &#39;0&#39;)}-WS-${hit[i]}, server: ${list[i]}, port: 443, client-fingerprint: firefox, type: vless, UUID: ${UUID}, tls: true, servername: ${sni}, network: ws, ws-opts: { path: &quot;${path}&quot;, headers: { Host: ${sni} } } }&#96;;
&#9;&#9;}
&#9;}//clash sub
&#9;return new Response(text, { headers: { &#39;Content-Type&#39;: &#39;text/plain; charset&#61;utf-8&#39; } });
}

export default {
&#9;async fetch(request) {
&#9;&#9;const thisURL &#61; new URL(request.url);
&#9;&#9;return genSub(
&#9;&#9;&#9;request, thisURL,
&#9;&#9;&#9;&quot;1a25f8ad-cad2-4e93-b5bf-34e42bcac02a&quot;,//vless 密码
&#9;&#9;&#9;&quot;1a25f8ad-cad2-4e93-b5bf-34e42bcac02a&quot;,//trojan 密码
&#9;&#9;&#9;&quot;/?ed&#61;2560&amp;proxyip&#61;proxyip.cmliussss.net:443&quot; //路径
&#9;&#9;);
&#9;},
};
&#96;&#96;&#96;
