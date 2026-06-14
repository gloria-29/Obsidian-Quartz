---
tags: [Tasker, Android, 自动化, 效率工具]
created: 2024-11-16
updated: 2026-06-13
sources: [raw/notes/2024-11-16-Tasker-for-Android.md]
---

# Tasker for Android

## 概要

Tasker 是 Android 平台上最强大的自动化工具应用，通过 Profile/Task/Context 机制实现基于条件触发的自动化操作。该文档为 Tasker 官方 FAQ 中文整理，涵盖常见使用问题及解决方案。

## 核心内容

- **后台运行问题**：各厂商对后台应用限制不同，需为 Tasker 关闭电池优化、开启自启动权限
  - 通用设置：前台通知、可靠闹钟、绘制覆盖层权限
  - Samsung：在 Device Maintenance 中添加到 Unmonitored apps
  - Xiaomi：开启自启动、锁屏显示、关闭应用自动备份
  - Huawei：在最近任务中锁定、手动管理电池优化、禁用 PowerGenie
  - Lenovo：禁用"禁止自动启动"选项
- **定位相关**：GPS/Cell Near/Wifi Near 等定位功能需要足够的半径范围和适当的检测间隔
- **Profile 不生效排查**：检查是否启用 Profile（绿勾）、是否点击 On 按钮、前台服务是否运行、是否内存不足
- **重复时间 Context**：是瞬时事件系列，不能与持续监控的 Context 直接组合
- **Root 检测**：需要 `su` 在 PATH 中，以及 superuser 包或 `/system/build.prop` 中的 `modversion` 关键字

## 关键概念

- **Profile/Task/Context**：Tasker 的三要素——Context 触发条件、Profile 连接条件与任务、Task 执行动作序列
- **Foreground notification**：Android 8+ 要求的前台服务通知，保证后台持续运行
- **dontkillmyapp.com**：查询各厂商保活策略的权威网站
- **Cell Near / Wifi Near**：基于基站和 WiFi 接入点的近场检测机制

## 关联实体 [[wikilinks]]

- [[效率与自我管理]]
- [[个人生产力与时间管理]]

## 相关页面 [[wikilinks]]

- [[效率与自我管理]]
- [[个人生产力与时间管理]]
- [[生活管理与SOP]]
