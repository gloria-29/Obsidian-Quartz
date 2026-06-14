---
title: "Android Docker CLI: 在 Android 上运行 Docker 镜像"
type: source
date: 2025-09-08
source: web
source_url: https://github.com/jinhan1414/android-docker-cli/blob/main/README.md
topics: ["工具", "生活"]
entities: ["模块化代码: 所有核心逻辑都被组织在 &#96;androi", "主命令行界面: 主要入口点是 &#96;androiddoc", "持久化容器: 容器拥有持久化的文件系统，可以被启动、停止和重", "底层引擎: 使用 &#96;androiddocker/pr", "✅ 完整的容器生命周期: &#96;run&#96;"]
---

# Android Docker CLI: 在 Android 上运行 Docker 镜像

## 概要
一个使用 &#96;proot&#96; 在 Android 上运行 Docker 镜像的工具，无需 Docker 引擎。本项目旨在 Termux 应用内部使用，为 Android 提供一个类似 Docker 的命令行界面，用于管理持久化容器。 模块化代码: 所有核心逻辑都被组织在 &#96;androiddocker&#96; 包中。 主命令行界面: 主要入口点是 &#96;androiddoc...

## 核心内容

### 核心功能
- 模块化代码: 所有核心逻辑都被组织在 &#96;androiddocker&#96; 包中。
- 主命令行界面: 主要入口点是 &#96;androiddocker/dockercli.py&#96;，提供一个用于完整容器生命周期管理的 Docker 风格 CLI。
- 持久化容器: 容器拥有持久化的文件系统，可以被启动、停止和重启。
- 底层引擎: 使用 &#96;androiddocker/prootrunner.py&#96; 来执行容器，使用 &#96;androiddocker/createrootfstar.py&#96; 来下载和准备容器镜像。

### 安装
- 您可以使用一行命令来安装此工具：
- curl -sSL https://raw.githubusercontent.com/jinhan1414/android-docker-cli/main/scripts/install.sh | sh
- 这将会创建一个名为 &#96;docker&#96; 的可执行命令到您的系统路径中。安装后，您只需输入 &#96;docker&#96; 即可运行此工具。

### 安装依赖
- # Android Termux
- pkg update &amp;&amp; pkg install python proot curl tar
- # Ubuntu/Debian
- sudo apt install python3 proot curl tar

### 快速使用
- 安装后，您可以像使用标准 Docker 命令行一样使用此工具。
- # 登录到 Docker Registry (例如 Docker Hub)
- docker login
- # 登录后从私有仓库拉取镜像
- docker login your-private-registry.com docker pull your-private-registry.com/my-image
- # 拉取一个公开镜像

## 关键概念

## 关联实体

## 相关页面
