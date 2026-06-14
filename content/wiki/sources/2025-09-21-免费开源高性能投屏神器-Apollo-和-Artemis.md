---
tags: [投屏, 开源工具, Apollo, Artemis, 游戏串流]
created: 2025-09-21
updated: 2026-06-13
sources: [raw/notes/2025-09-21-免费开源高性能投屏神器-Apollo-和-Artemis.md]
---

# 免费开源高性能投屏神器 Apollo 和 Artemis

## 概要

Apollo 和 Artemis 是一对免费开源的投屏解决方案，支持跨平台高性能屏幕串流。Apollo 作为服务端运行在 PC 上，Artemis 作为客户端运行在手机、电视或游戏掌机上，可自动匹配设备分辨率和帧率。

## 核心内容

### Apollo 服务端特点
- 自动识别接收端设备的分辨率和最大帧率
- 为每个设备生成专属配置并保存，下次自动调用
- 投屏时创建虚拟显示器，结束后自动消失
- 支持 Windows、MacOS、Linux 系统

### Artemis 客户端功能
- 基于 Moonlight 的 Android 客户端
- 支持手机、电视、游戏掌机等设备
- 低延迟高画质的串流体验

### 配置流程
- PC 端安装 Apollo 并设置管理员密码
- 安装 ViGEmBus 虚拟手柄驱动（游戏场景必需）
- 配置语言和服务器名称
- 添加自定义应用程序（如游戏）

## 关键概念

- **Apollo**：Sunshine 的分支版本，PC 端投屏服务
- **Artemis**：Moonlight 的 Android 分支，移动端接收客户端
- **虚拟显示器**：投屏时临时创建的匹配客户端分辨率的虚拟屏幕
- **ViGEmBus**：Windows 内核级虚拟游戏控制器驱动

## 关联实体

- [[Sunshine]] — Apollo 的上游项目
- [[Moonlight]] — Artemis 的上游项目

## 相关页面

- [[游戏串流方案]] — 各种游戏远程游玩方案对比
- [[开源工具推荐]] — 实用开源软件合集
