---
tags:
  - 音乐
  - 开源项目
  - 洛雪音乐
  - 音乐源
created: 2025-07-10
updated: 2026-06-13
sources:
  - raw/notes/2025-07-10-pdone-lx-music-source-洛雪音乐源.md
---

# pdone/lx-music-source 洛雪音乐源

## 概要

GitHub上1.8k星的洛雪音乐第三方音源聚合仓库，为lx-music-desktop和lx-music-mobile提供多个第三方音源。内容源于SixYin、Huibq/keep-alive、LX、ikun等渠道，支持GitHub直连和ghproxy加速访问。项目使用JavaScript编写，提供原始链接和多个GitHub加速代理地址。

## 核心内容

### 音源类型与来源

仓库聚合了6个音源渠道：SixYin、Huibq、Flower、LX、ikun、Grass，每个渠道提供独立的latest.js文件。数据来源包括SixYin官网、Huibq的keep-alive项目、LX音乐官网、ikun的lx-music-api-server等。所有音源以JavaScript脚本形式提供，通过URL导入到洛雪音乐客户端。

### 访问方式

提供两种访问方式：GitHub原始链接（适合网络畅通用户）和ghproxy加速链接（适合访问GitHub受限的用户）。加速站点包括ghproxy.net、gh.llkk.cc、github.moeyy.xyz、ghproxy.cn、gh.api.99988866.xyz、ghp.ci等多个备选地址，当一个无法访问时可替换前缀重试。

### 洛雪音乐生态

lx-music-desktop为桌面端播放器，lx-music-mobile为移动端播放器，均由lyswhut开发维护。另有lx-music-sync-server用于多设备同步，以及any-listen作为替代播放器方案。洛雪音乐本身是一款免费开源的音乐播放器，通过导入第三方音源扩展可用曲库。

## 关键概念

- **音源 (Music Source)**: 为洛雪音乐提供音乐资源URL解析的JavaScript脚本文件
- **ghproxy**: GitHub文件访问加速代理服务，解决国内访问GitHub受限问题
- **latest.js**: 每个音源渠道的最新版本脚本文件，导入播放器后即可使用
- **洛雪音乐**: lyswhut开发的开源跨平台音乐播放器

## 关联实体

- [[洛雪音乐]] — 本音源的目标播放器
- [[lyswhut]] — 洛雪音乐开发者
- [[GitHub]] — 项目托管平台

## 相关页面

- [[zwplayer开源网页播放器]] — 另一个开源播放器项目
- [[2025-06-29-软件Inbox]] — 软件工具收集
