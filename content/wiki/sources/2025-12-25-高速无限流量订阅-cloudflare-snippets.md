---
title: "高速无限流量订阅 cloudflare snippets"
type: source
date: 2025-12-25
source: web
source_url: https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/files/019b552a-3225-79f3-9ab7-0137575cb93b.md#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251225%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251225T105948Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;b5ed7734c64ca706c3b9a250df507f5c438bde82a3a99c546a14902fa2ce6146&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject
topics: ["财富"]
entities: ["https://sni.111000.cc.cd/sub", "https://sni.111000.de5.net/sub", "https://sni.111000.dns.army/su", "https://sni.111000.v6.army/sub", "https://sni.111000.v6.navy/sub"]
---

# 高速无限流量订阅 cloudflare snippets

## 概要
原来的帖子不能编辑了，现在新增了很多备用地址。如果一个被封锁，可以换一个地址 双协议：vless websocket + trojan 自动适配 mihomo (clash)/ Xray (v2ray) 订阅 - https://sni.111000.cc.cd/sub - https://sni.111000.de5.net/sub - https://sni.111000.dns.army/s...

## 核心内容

### [如果要强制指定 mihomo 订阅，可以加？clash](https://linux.do/t/topic/13414
- 例如 https://sni.111000.cc.cd/sub?clash

### [源码](https://linux.do/t/topic/1341410#p-11441558-h-6)
- snippets.js.7z (4.6 KB)
- 推荐部署规则：【主机名】【开头为】【sni.】

### [订阅源码](https://linux.do/t/topic/1341410#p-11441558-h-7)
- 我订阅是另外写代码部署的。订阅的要放在 snippets 列表最上方
- 触发规则参考：
- 【主机名】【开头为】【sni.】
- 【uri 路径】【开头为】【/sub】
- &#96;&#96;&#96;
- function genSub(req, thisURL, UUID, passwd, path) {

- { name: ${i.toString().padStart(2, &#39;0&#39;)}-WS-${hit[i]}, server: ${list[i]}, port: 443, client-fingerprint: firefo
- { name: ${i.toString().padStart(2, &#39;0&#39;)}-Trojan-${hit[i]}, server: ${list[i]}, port: 443, type: trojan, password
- { name: 自动优选, type: url-test, include-all: true, exclude-type: direct }
- { name: 节点选择, type: select, include-all: true, exclude-type: direct, proxies: [ 自动优选 ] }
- MATCH,节点选择
- GEOIP,private,DIRECT
- GEOSITE,private,DIRECT
- GEOIP,cn,DIRECT
- GEOSITE,cn,DIRECT
- GEOSITE,category-games@cn,DIRECT
- GEOSITE,apple,DIRECT
- GEOSITE,microsoft@cn,DIRECT
- DOMAIN-SUFFIX,services.googleapis.com,节点选择
## 关键概念

## 关联实体

## 相关页面
