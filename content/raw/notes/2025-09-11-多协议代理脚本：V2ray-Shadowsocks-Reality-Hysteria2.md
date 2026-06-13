---
标题: 多协议代理脚本：V2ray/Shadowsocks/Reality/Hysteria2
笔记 ID: 019937e6-3655-7e93-9578-99d1190aa6f4
笔记类型: crawl
tags:
    - 生活/电子工具
卡片盒:
    - 生活
包含语音: 否
网页链接:
创建时间: "2025-09-11T16:30:58"
更新时间: "2026-03-11T20:55:49.811"
---

[Skip to content](#start-of-content)

A proxy script with multiple protocols.

### License

[Apache-2.0 license](/yeahwu/v2ray-wss/blob/main/LICENSE)

[Star](/login?return_to&#61;%2Fyeahwu%2Fv2ray-wss)

[Notifications](/login?return_to&#61;%2Fyeahwu%2Fv2ray-wss) You must be signed in to change notification settings

## yeahwu/v2ray-wss

[**4** Branches](/yeahwu/v2ray-wss/branches) [**7** Tags](/yeahwu/v2ray-wss/tags)

搭建 Shadowsocks-rust， V2ray+ Nginx + WebSocket 和 Reality, Hysteria2, https 正向代理脚本，支持 Debian、Ubuntu、Centos，并支持甲骨文ARM平台。

简单点讲，没域名的用户可以安装 Reality 和 hy2 代理，有域名的可以安装 V2ray+wss 和 https 正向代理，各取所需。

运行脚本：

&#96;&#96;&#96;
wget git.io/tcp-wss.sh &amp;&amp; bash tcp-wss.sh
&#96;&#96;&#96;

**便宜VPS推荐：** [https://hostalk.net/deals.html](https://hostalk.net/deals.html)

[![image](https://github.com/gloria-29/OB-assets/releases/download/img-65/65425dfcc7158220688bf225420e39804a2a355fa3c0a57e2d262714a28b5b38.png)](https://github.com/gloria-29/OB-assets/releases/download/img-65/65425dfcc7158220688bf225420e39804a2a355fa3c0a57e2d262714a28b5b38.png)

已测试系统如下：

Debian 9, 10, 11, 12

Ubuntu 16.04, 18.04, 20.04, 22.04

CentOS 7

* WSS客户端配置信息保存在： &#96;cat /usr/local/etc/v2ray/client.json&#96;
* Shadowsocks客户端配置信息： &#96;cat /etc/shadowsocks/config.json&#96;
* Reality客户端配置信息保存在： &#96;cat /usr/local/etc/xray/reclient.json&#96;
* Hysteria2客户端配置信息保存在： &#96;cat /etc/hysteria/hyclient.json&#96;
* Https正向代理客户端配置信息保存在： &#96;cat /etc/caddy/https.json&#96;

卸载方法如下： [https://1024.day/d/1296](https://1024.day/d/1296)

**提醒：连不上的朋友，建议先检查一下服务器自带防火墙有没有关闭？**

## About

A proxy script with multiple protocols.

### Topics

### Resources

[Readme](#readme-ov-file)

### License

[Apache-2.0 license](#Apache-2.0-1-ov-file)

[Activity](/yeahwu/v2ray-wss/activity)

### Stars

[**2.8k** stars](/yeahwu/v2ray-wss/stargazers)

### Watchers

[**26** watching](/yeahwu/v2ray-wss/watchers)

### Forks

[**509** forks](/yeahwu/v2ray-wss/forks)

[Report repository](/contact/report-content?content_url&#61;https%3A%2F%2Fgithub.com%2Fyeahwu%2Fv2ray-wss&amp;report&#61;yeahwu+%28user%29)

## Releases 7

[\+ 6 releases](/yeahwu/v2ray-wss/releases)

## Packages

No packages published

## Languages

* [Shell 100.0%](/yeahwu/v2ray-wss/search?l&#61;shell)

&gt; 原始链接：[https://github.com/yeahwu/v2ray-wss](https://github.com/yeahwu/v2ray-wss)
