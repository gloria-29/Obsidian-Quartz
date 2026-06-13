---
标题: Dify Notion集成配置总结 o3
笔记 ID: 0197cb01-e0aa-7504-a924-94d18749d1a1
笔记类型: note
tags:
    - 学习/学术学习
卡片盒:
    - 学习
包含语音: 否
网页链接:
创建时间: "2025-07-02T19:59:47"
更新时间: "2026-03-03T02:37:57.547"
---

下面给出一份详细的阅读笔记，分为以下几个部分，包括主要观点、关键见解、重要细节和操作步骤，帮助你在 Ubuntu 云服务器上通过 Docker Compose 重新部署项目，从而使用 Notion 内部集成并解决报错问题。

─────────────────────────────  
【一、主要观点】

1. Dify 对 Notion 集成支持两种模式：
   - 公共集成（public）：基于 OAuth 流程，需要配置 NOTION_CLIENT_ID 和 NOTION_CLIENT_SECRET。
   - 内部集成（internal）：通过 NOTION_INTERNAL_SECRET 实现，无需 OAuth 授权流程。适合本地或测试环境（尤指 HTTPS 回调不方便时）。

2. 报错原因：  
   当使用公共集成时，如果 NOTION_CLIENT_ID 配置错误（例如设置成数字 0 而不是字符串），会报 “client_id should be a string or undefined” 的错误。  
   使用内部集成后，系统会跳过 OAuth 流程，直接使用内部令牌进行认证。

─────────────────────────────  
【二、关键见解与细节】

1. 环境变量配置：
   - 使用内部集成时需修改环境文件（.env）中相关部分：
     • 将 NOTION_INTEGRATION_TYPE 设置为 internal  
     • 在 NOTION_INTERNAL_SECRET 中填入 Notion 内部集成令牌  
     • 保证 NOTION_CLIENT_ID 和 NOTION_CLIENT_SECRET 为空或不配置，避免冲突

2. Docker Compose 部署文件：
   - docker-compose.yaml 中会读取 .env 文件内的环境变量，因此务必确保 .env 中的修改已经正确保存并传入容器。

3. HTTPS 与 SSL 说明：
   - Notion OAuth 仅支持 HTTPS，但内部集成不会触发 OAuth 流程。因此无论是否添加 SSL 证书，通过 HTTP 都能正常使用内部集成，但生产环境建议启用 HTTPS 来提高安全性。

4. 错误解决及验证：
   - 修改 .env 文件后，需要停止当前的容器，用 docker-compose down 关闭服务，再用 docker-compose up -d 重启容器。
   - 部署后可通过 docker-compose logs 命令查看日志，确认 Notion 集成相关的报错已消失；
   - 在 Dify 前端控制台尝试从 Notion 导入内容，确保能够成功运行。

─────────────────────────────  
【三、详细操作步骤】

以下步骤假设你对 Ubuntu 云服务器的命令行操作有基本了解，只需依照提示一步步操作即可：

1. ◉ 登录到 Ubuntu 云服务器  
   使用 SSH 工具（例如 PuTTY 或终端命令）连接到你的云服务器：
   Command:  
     ssh your_username@your_server_ip

2. ◉ 定位到 Dify 项目目录  
   假设你的项目在 /home/your_username/dify 目录下，则执行：
     cd /home/your_username/dify/docker

3. ◉ 编辑环境配置文件  
   如果未创建，请先复制 .env.example 文件为 .env：
     cp .env.example .env  
   然后使用编辑器（如 nano 或 vim）打开 .env 文件：
     nano .env  
     
   在编辑器中找到 Notion 集成部分，修改为以下内容（请替换 your_notion_internal_secret_here 为你从 Notion 获取的正确内部集成令牌）：
     
     ---------------------------
     # 修改前示例（默认公共集成）：
     # NOTION_INTEGRATION_TYPE&#61;public
     # NOTION_CLIENT_SECRET&#61;
     # NOTION_CLIENT_ID&#61;
     
     # 修改后内部集成配置
     NOTION_INTEGRATION_TYPE&#61;internal
     NOTION_INTERNAL_SECRET&#61;your_notion_internal_secret_here
     NOTION_CLIENT_ID&#61;
     NOTION_CLIENT_SECRET&#61;
     ---------------------------
     
   保存并退出编辑器（nano 下按 Ctrl+O 保存，Ctrl+X 退出）。

4. ◉ 修改文件权限  
   确保 .env 文件对当前用户可读：
     chmod 644 .env

5. ◉ 停止当前运行的 Docker 服务  
   在 docker-compose.yml 所在目录执行：
     docker-compose down  
   这将停止并关闭所有容器。

6. ◉ （可选）拉取最新镜像  
   如果你希望使用最新镜像，可以执行：
     docker-compose pull

7. ◉ 重新部署并启动容器  
   运行以下命令重建并启动所有服务：
     docker-compose up -d  
   其中 -d 参数使服务在后台运行。

8. ◉ 检查服务状态  
   执行命令确认所有容器均在运行：
     docker-compose ps  
   所有容器的状态均应显示为 Up。

9. ◉ 监控日志  
   在部署过程中查看日志，确认不再有 Notion OAuth 错误：
     docker-compose logs -f  
   如需单独查看 API 服务日志，可以使用：
     docker-compose logs -f api

10. ◉ 验证导入功能  
    打开浏览器，访问你的 Dify 实例（例如 http://your_server_ip），  
    然后在控制台尝试导入 Notion 来源的内容。若配置正确，不会再报 client_id 错误，而是直接使用内部集成方式认证。

─────────────────────────────  
【四、注意事项】

- 请确保你的 .env 文件中没有拼写错误或多余空格，内部令牌必须完全正确。
- 修改后务必重新启动容器，以便新配置生效。
- 如果遇到问题，请使用 docker-compose config 查看最终加载的环境变量，或查阅 API 日志来定位具体错误。
- 生产环境中，建议采用 HTTPS（修改 NGINX_HTTPS_ENABLED 等字段）确保传输安全。

─────────────────────────────  
【五、总结】

通过修改 .env 文件中的 Notion 集成类型为 internal，并配置正确的 NOTION_INTERNAL_SECRET，再重新用 docker-compose down/up 部署，Dify 就会使用内部集成方式连接 Notion，跳过 OAuth 过程，从而解决因公共 OAuth 流程产生的 client_id 报错问题。你可以依照上述逐步操作，即使没有编程基础也能顺利完成部署流程。

希望以上步骤能帮你顺利完成重新部署和 Notion 内容导入，如有任何疑问请进一步咨询或查阅 Dify 官方文档。
