---
标题: "Android Docker CLI: 在 Android 上运行 Docker 镜像"
笔记 ID: 0199255e-48a5-7bc7-a854-75a6901f7e08
笔记类型: crawl
tags:
    - 生活/电子工具
卡片盒:
    - 生活
包含语音: 否
网页链接:
创建时间: "2025-09-08T02:11:18"
更新时间: "2026-03-11T20:55:49.811"
---

[English](https://github.com/jinhan1414/android-docker-cli/blob/main/README.md) | 中文

一个使用 &#96;proot&#96; 在 Android 上运行 Docker 镜像的工具，无需 Docker 引擎。本项目旨在 [Termux](https://github.com/termux/termux-app) 应用内部使用，为 Android 提供一个类似 Docker 的命令行界面，用于管理持久化容器。

## 核心功能

* **模块化代码**: 所有核心逻辑都被组织在 &#96;android_docker&#96; 包中。

* **主命令行界面**: 主要入口点是 &#96;android_docker/docker_cli.py&#96;，提供一个用于完整容器生命周期管理的 Docker 风格 CLI。

* **持久化容器**: 容器拥有持久化的文件系统，可以被启动、停止和重启。

* **底层引擎**: 使用 &#96;android_docker/proot_runner.py&#96; 来执行容器，使用 &#96;android_docker/create_rootfs_tar.py&#96; 来下载和准备容器镜像。

## 安装

您可以使用一行命令来安装此工具：

curl -sSL [https://raw.githubusercontent.com/jinhan1414/android-docker-cli/main/scripts/install.sh](https://raw.githubusercontent.com/jinhan1414/android-docker-cli/main/scripts/install.sh) | sh

这将会创建一个名为 &#96;docker&#96; 的可执行命令到您的系统路径中。安装后，您只需输入 &#96;docker&#96; 即可运行此工具。

## 安装依赖

# Android Termux

pkg update &amp;&amp; pkg install python proot curl tar

# Ubuntu/Debian

sudo apt install python3 proot curl tar

## 快速使用

安装后，您可以像使用标准 Docker 命令行一样使用此工具。

# 登录到 Docker Registry (例如 Docker Hub)

docker login

# 登录后从私有仓库拉取镜像

docker login [your-private-registry.com](http://your-private-registry.com) docker pull [your-private-registry.com/my-image](http://your-private-registry.com/my-image)

# 拉取一个公开镜像

docker pull alpine:latest

# 在前台运行一个容器

docker run alpine:latest echo “Hello from container”

# 在后台（分离模式）运行一个容器

docker run -d -e “API\_KEY&#61;sk-12345” --volume /sdcard:/data nginx:alpine

# 交互式运行容器

docker run -it alpine:latest /bin/sh

# 使用项目中的自定义配置文件运行 Nginx 容器

# 此示例使用 \&#96;examples/nginx.conf\&#96; 文件, 它将监听 8777 端口。

docker run -d --name my-nginx -v $(pwd)/examples/nginx.conf:/etc/nginx/nginx.conf nginx:alpine

# 列出正在运行的容器

docker ps

# 列出所有容器（包括已停止的）

docker ps -a

# 查看容器日志

docker logs &lt;container\_id&gt; docker logs -f &lt;container\_id&gt; # 持续跟踪日志

# 停止一个容器

docker stop &lt;container\_id&gt;

# 启动一个已停止的容器

docker start &lt;container\_id&gt;

# 重启一个容器

docker restart &lt;container\_id&gt;

# 删除一个容器

docker rm &lt;container\_id&gt;

# 附加到运行中的容器

docker attach &lt;container\_id&gt;

# 在运行中的容器中执行命令

docker exec &lt;container\_id&gt; ls -l docker exec -it &lt;container\_id&gt; /bin/sh

# 列出缓存的镜像

docker images

# 删除一个缓存的镜像

docker rmi alpine:latest

# 登录到镜像仓库

docker login [your-private-registry.com](http://your-private-registry.com)

## Docker Compose 支持

此工具包含一个 &#96;docker-compose&#96; 命令，用于管理多容器应用。

# 启动 docker-compose.yml 中定义的服务

docker-compose up

# 在后台运行

docker-compose up -d

# 停止并移除服务

docker-compose down

### &#96;docker-compose.yml&#96; 示例

version: ‘3’ services: web: image: nginx:alpine container\_name: my-web-server db: image: redis:alpine container\_name: my-redis-db

## 主要特性

* ✅ **完整的容器生命周期**: &#96;run&#96;, &#96;ps&#96;, &#96;stop&#96;, &#96;start&#96;, &#96;restart&#96;, &#96;logs&#96;, &#96;rm&#96;, &#96;attach&#96;, &#96;exec&#96;。

* ✅ **镜像仓库认证**: 使用 &#96;login&#96; 命令登录私有或公共镜像仓库。

* ✅ **Docker Compose 支持**: 使用 &#96;docker-compose up&#96; 和 &#96;down&#96; 管理多容器配置。

* ✅ **Docker风格CLI**: 熟悉且直观的命令行界面。

* ✅ **持久化存储**: 容器在重启后能保持其状态和文件系统，存储于 &#96;~/.docker_proot_cache/&#96;。

* ✅ **Android优化**: 针对 Termux 环境进行了特别优化。

## 故障排除

# 检查依赖

curl --version &amp;&amp; tar --version &amp;&amp; proot --version

# 使用详细日志获取更多信息

docker --verbose run alpine:latest

## 限制说明

* 基于 &#96;proot&#96;，并非完整的容器化（无内核级的进程或网络隔离）。

* 某些系统调用可能不被支持。

* 性能相较于原生 Docker 会有所下降。

## 许可证

MIT License
