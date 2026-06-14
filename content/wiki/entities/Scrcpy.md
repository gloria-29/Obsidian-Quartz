---
type: entity
aliases: [Scrcpy, Screen Copy]
tags: [开发工具, Android, 开源工具, 投屏]
---

# Scrcpy

## 概述

Scrcpy（Screen Copy）是 Genymobile 开发的开源 Android 设备显示和控制工具。通过 USB 或 Wi-Fi 连接，在电脑上实时显示并操控 Android 设备屏幕。以其低延迟（约 30-50ms）、高帧率（最高 120fps）和不需要 root 权限的特性，成为安卓开发者和数码爱好者的必备工具。

## 核心功能

### 功能特点
- **低延迟投屏**：USB 连接延迟约 30-50ms，Wi-Fi 连接约 100ms
- **无需 root 权限**：通过 ADB（Android Debug Bridge）实现连接
- **跨平台支持**：Windows/macOS/Linux 全平台桌面端
- **高清画质**：最高支持 4K 分辨率投屏
- **双向交互**：键盘鼠标直接操控 Android 设备
- **文件拖拽传输**：支持从电脑直接拖拽文件到设备
- **录屏功能**：内置录屏、截屏功能
- **轻量无广告**：仅 ~15MB 大小，无需安装守护进程，无广告推送

### 使用场景
- **App 开发和调试**：开发者实时查看和操作 App 运行状态
- **演示和教学**：将手机屏幕投影到电脑进行分享演示
- **游戏操作**：用键盘鼠标玩手机游戏
- **文件管理**：通过电脑文件管理器操作手机文件
- **远程协助**：结合网络工具实现远程设备控制

## 关键概念

- **ADB（Android Debug Bridge）**：Android 调试桥，是 Scrcpy 连接 Android 设备的核心通道
- **编码/解码**：Scrcpy 使用 MediaCodec 编码视频流，无需依赖第三方编码库
- **Wi-Fi 模式**：通过 `adb connect <ip>:5555` 实现无线连接，摆脱 USB 线束缚

## 关联实体

- [[LobeChat]] — 同为开发者常用的开源效率工具
- [[ADB]] — Scrcpy 依赖的 Android 调试协议
- [[Crawl4AI]] — 同为开发者常用的技术工具

## 相关素材

- [[cubox-2024-q4]] — Scrcpy 在开发工具收藏列表中
