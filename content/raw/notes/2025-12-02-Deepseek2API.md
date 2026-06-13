---
标题: Deepseek2API
笔记 ID: 019adeca-d209-7b43-b4f9-c3397829fa46
笔记类型: crawl
tags:
    - 生活/电子工具
卡片盒:
    - 生活
包含语音: 否
网页链接:
创建时间: "2025-12-02T19:20:25.369"
更新时间: "2026-03-11T20:45:31.691"
---

以下是详细的步骤，帮助您在Ubuntu云服务器上部署DeepSeek2API项目：

## 步骤1：准备部署目录

&#96;&#96;&#96;bash
# 创建项目目录
sudo mkdir -p /opt/deepseek2api
cd /opt/deepseek2api

&#96;&#96;&#96;

## 步骤2：创建配置文件

&#96;&#96;&#96;bash
# 创建配置文件
sudo nano config.json

&#96;&#96;&#96;

将以下内容复制到配置文件中（根据您的实际情况修改）：

&#96;&#96;&#96;json
{
  &quot;keys&quot;: [
    &quot;your_api_key_1&quot;,
    &quot;your_api_key_2&quot;
  ],
  &quot;accounts&quot;: [
    {
      &quot;email&quot;: &quot;your_email1@example.com&quot;,
      &quot;password&quot;: &quot;your_password1&quot;,
      &quot;token&quot;: &quot;&quot;
    },
    {
      &quot;email&quot;: &quot;your_email2@example.com&quot;,
      &quot;password&quot;: &quot;your_password2&quot;,
      &quot;token&quot;: &quot;&quot;
    }
  ]
}

&#96;&#96;&#96;

**说明：**

- &#96;keys&#96;: API鉴权密钥，可以随意设置（如&quot;deepseek123&quot;）
- &#96;accounts&#96;: DeepSeek账号列表，支持邮箱+密码或手机号+密码登录

## 步骤3：方法一 - 使用Docker直接部署

### 创建并运行容器

&#96;&#96;&#96;bash
# 拉取最新镜像并运行容器
docker run -d \
  --name deepseek2api \
  -p 5001:5001 \
  -v /opt/deepseek2api/config.json:/app/config.json \
  --restart unless-stopped \
  ghcr.io/iidamie/deepseek2api:latest

&#96;&#96;&#96;

### 查看服务状态

&#96;&#96;&#96;bash
# 查看容器是否正常运行
docker ps

# 查看实时日志
docker logs -f deepseek2api

# 查看最近日志
docker logs deepseek2api --tail 100

&#96;&#96;&#96;

## 步骤4：方法二 - 使用Docker Compose部署（推荐）

### 创建docker-compose.yml文件

&#96;&#96;&#96;bash
sudo nano docker-compose.yml

&#96;&#96;&#96;

将以下内容复制到文件中：

&#96;&#96;&#96;yaml
version: &#39;3.8&#39;

services:
  deepseek2api:
    image: ghcr.io/iidamie/deepseek2api:latest
    container_name: deepseek2api
    ports:
      - &quot;5001:5001&quot;
    volumes:
      - ./config.json:/app/config.json
    restart: unless-stopped
    logging:
      driver: &quot;json-file&quot;
      options:
        max-size: &quot;10m&quot;
        max-file: &quot;3&quot;

&#96;&#96;&#96;

### 使用Docker Compose启动服务

&#96;&#96;&#96;bash
# 启动服务（后台运行）
docker-compose up -d

# 查看服务状态
docker-compose ps

# 查看实时日志
docker-compose logs -f

# 重启服务
docker-compose restart

# 停止服务
docker-compose down

&#96;&#96;&#96;

## 步骤5：配置防火墙（如果启用）

&#96;&#96;&#96;bash
# 检查防火墙状态
sudo ufw status

# 如果防火墙启用，开放5001端口
sudo ufw allow 5001/tcp
sudo ufw reload

&#96;&#96;&#96;

## 步骤6：验证部署

### 测试API是否正常响应

&#96;&#96;&#96;bash
# 测试模型列表接口
curl http://localhost:5001/v1/models

# 测试对话接口（需要认证）
curl -X POST http://localhost:5001/v1/chat/completions \
  -H &quot;Content-Type: application/json&quot; \
  -H &quot;Authorization: Bearer your_api_key_1&quot; \
  -d &#39;{
    &quot;model&quot;: &quot;deepseek-chat&quot;,
    &quot;messages&quot;: [
      {
        &quot;role&quot;: &quot;user&quot;,
        &quot;content&quot;: &quot;你好&quot;
      }
    ],
    &quot;stream&quot;: false
  }&#39;

&#96;&#96;&#96;

### 检查服务健康状态

&#96;&#96;&#96;bash
# 检查容器资源使用情况
docker stats deepseek2api

# 检查容器内部进程
docker top deepseek2api

&#96;&#96;&#96;

## 步骤7：配置Nginx反向代理（可选，如果需要域名访问）

### 安装Nginx

&#96;&#96;&#96;bash
sudo apt update
sudo apt install nginx -y

&#96;&#96;&#96;

### 创建Nginx配置文件

&#96;&#96;&#96;bash
sudo nano /etc/nginx/sites-available/deepseek2api

&#96;&#96;&#96;

添加以下配置：

&#96;&#96;&#96;nginx
server {
    listen 80;
    server_name your-domain.com;  # 替换为您的域名
    
    location / {
        proxy_pass http://127.0.0.1:5001;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        
        # 优化流式输出配置
        proxy_buffering off;
        chunked_transfer_encoding on;
        tcp_nopush on;
        tcp_nodelay on;
        keepalive_timeout 120;
        
        # WebSocket支持（如果需要）
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection &quot;upgrade&quot;;
    }
}

&#96;&#96;&#96;

### 启用站点并重载Nginx

&#96;&#96;&#96;bash
# 创建符号链接
sudo ln -s /etc/nginx/sites-available/deepseek2api /etc/nginx/sites-enabled/

# 测试Nginx配置
sudo nginx -t

# 重载Nginx
sudo systemctl reload nginx

&#96;&#96;&#96;

## 步骤8：设置日志轮转（可选）

### 创建日志目录

&#96;&#96;&#96;bash
sudo mkdir -p /var/log/deepseek2api

&#96;&#96;&#96;

### 配置logrotate

&#96;&#96;&#96;bash
sudo nano /etc/logrotate.d/deepseek2api

&#96;&#96;&#96;

添加以下内容：

&#96;&#96;&#96;bash
/var/lib/docker/containers/*/*.log {
    daily
    rotate 7
    compress
    delaycompress
    copytruncate
    missingok
    notifempty
}

&#96;&#96;&#96;

## 步骤9：监控和管理脚本

### 创建管理脚本

&#96;&#96;&#96;bash
sudo nano /usr/local/bin/deepseek-manage.sh

&#96;&#96;&#96;

添加以下内容：

&#96;&#96;&#96;bash
#!/bin/bash

case &quot;$1&quot; in
    start)
        docker-compose -f /opt/deepseek2api/docker-compose.yml up -d
        ;;
    stop)
        docker-compose -f /opt/deepseek2api/docker-compose.yml down
        ;;
    restart)
        docker-compose -f /opt/deepseek2api/docker-compose.yml restart
        ;;
    status)
        docker-compose -f /opt/deepseek2api/docker-compose.yml ps
        ;;
    logs)
        docker-compose -f /opt/deepseek2api/docker-compose.yml logs -f
        ;;
    update)
        docker-compose -f /opt/deepseek2api/docker-compose.yml down
        docker-compose -f /opt/deepseek2api/docker-compose.yml pull
        docker-compose -f /opt/deepseek2api/docker-compose.yml up -d
        ;;
    *)
        echo &quot;Usage: $0 {start|stop|restart|status|logs|update}&quot;
        exit 1
        ;;
esac

&#96;&#96;&#96;

### 设置脚本权限

&#96;&#96;&#96;bash
sudo chmod +x /usr/local/bin/deepseek-manage.sh

&#96;&#96;&#96;

## 步骤10：最终验证

### 完整功能测试

&#96;&#96;&#96;bash
# 1. 测试模型列表
curl http://localhost:5001/v1/models

# 2. 测试对话（非流式）
curl -X POST http://localhost:5001/v1/chat/completions \
  -H &quot;Content-Type: application/json&quot; \
  -H &quot;Authorization: Bearer your_api_key_1&quot; \
  -d &#39;{
    &quot;model&quot;: &quot;deepseek-chat&quot;,
    &quot;messages&quot;: [
      {&quot;role&quot;: &quot;user&quot;, &quot;content&quot;: &quot;请简单介绍一下你自己&quot;}
    ],
    &quot;stream&quot;: false
  }&#39;

# 3. 测试流式对话
curl -X POST http://localhost:5001/v1/chat/completions \
  -H &quot;Content-Type: application/json&quot; \
  -H &quot;Authorization: Bearer your_api_key_1&quot; \
  -d &#39;{
    &quot;model&quot;: &quot;deepseek-chat&quot;,
    &quot;messages&quot;: [
      {&quot;role&quot;: &quot;user&quot;, &quot;content&quot;: &quot;流式测试&quot;}
    ],
    &quot;stream&quot;: true
  }&#39;

&#96;&#96;&#96;

## 常见问题排查

### 如果服务启动失败：

&#96;&#96;&#96;bash
# 检查详细错误信息
docker logs deepseek2api

# 进入容器检查
docker exec -it deepseek2api bash

# 检查配置文件权限
sudo chmod 644 /opt/deepseek2api/config.json

&#96;&#96;&#96;

### 如果账号登录失败：

1. 检查账号密码是否正确
2. 检查是否需要手机验证码
3. 查看日志中的具体错误信息

### 如果API调用返回401：

检查Authorization头中的API key是否与config.json中的keys匹配

---

按照以上步骤操作，您应该能够成功在Ubuntu服务器上部署DeepSeek2API服务。建议使用Docker Compose方式部署，便于后续管理和维护。
