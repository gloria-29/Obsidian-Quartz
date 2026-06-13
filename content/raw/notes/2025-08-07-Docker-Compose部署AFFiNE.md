---
标题: Docker Compose部署AFFiNE
笔记 ID: 0198805f-e602-7f9c-890f-33b61ff76e1f
笔记类型: crawl
tags:
    - 生活/电子工具
卡片盒:
    - 生活
包含语音: 否
网页链接:
创建时间: "2025-08-07T01:14:24"
更新时间: "2026-03-11T20:55:49.811"
---

### **通过 Docker Compose 部署 AFFiNE：一步步指南**

在开始之前，请确保您已经通过 SSH 登录到您的 Ubuntu 云服务器，并且已经安装了 Docker。

#### **第一步：创建并进入项目目录**

首先，我们需要为 AFFiNE 创建一个专门的目录，并将所有相关文件存放在这里。这有助于保持服务器的整洁和有序。

打开您的服务器终端，输入以下命令：

Bash

&#96;&#96;&#96;
mkdir affine &amp;&amp; cd affine
&#96;&#96;&#96;

* &#96;mkdir affine&#96;: 这个命令会创建一个名为 &#96;affine&#96; 的新文件夹。

* &#96;cd affine&#96;: 这个命令会带您进入刚刚创建的 &#96;affine&#96; 文件夹。之后的所有操作都将在此目录下进行。

#### **第二步：下载部署所需文件**

AFFiNE 官方非常贴心地为我们准备好了 Docker Compose 所需的配置文件。我们只需要下载它们即可。

请在 &#96;affine&#96; 目录下，执行以下两个命令：

1. **下载** &#96;docker-compose.yml&#96; 文件：

   Bash

   &#96;&#96;&#96;
   wget -O docker-compose.yml https://github.com/toeverything/affine/releases/latest/download/docker-compose.yml
   &#96;&#96;&#96;

   * 这个文件定义了 AFFiNE 服务需要的所有容器（如主程序、数据库、缓存等）以及它们之间的关系和配置。

2. **下载** &#96;.env&#96; 环境变量文件：

   Bash

   &#96;&#96;&#96;
   wget -O .env https://github.com/toeverything/affine/releases/latest/download/default.env.example
   &#96;&#96;&#96;

   * 这个文件包含了所有可配置的参数，比如数据库密码、端口等。我们将在这个文件中进行个性化设置。

#### **第三步：配置环境变量（关键步骤）**

这是部署过程中最重要的一步。您需要编辑 &#96;.env&#96; 文件来设置您的管理员账户和其他配置。

1. **打开** &#96;.env&#96; 文件进行编辑：

   Bash

   &#96;&#96;&#96;
   nano .env
   &#96;&#96;&#96;

   * 这里我们使用 &#96;nano&#96; 编辑器，它在 Ubuntu 中非常常见且易于使用。

2. 修改文件内容：

   打开后，您会看到很多配置项。在初次部署时，您至少需要设置管理员的邮箱和密码。找到以下两行：

   Ini, TOML

   &#96;&#96;&#96;
   # The email of the first admin user, you can login with this email and password after the first run.
   # Be sure to keep this value secret.
   AFFINE_ADMIN_EMAIL&#61;
   # The password of the first admin user.
   # Be sure to keep this value secret.
   AFFINE_ADMIN_PASSWORD&#61;
   &#96;&#96;&#96;

   请在 &#96;&#61;&#96; 后面填入您想设置的**管理员邮箱**和**一个安全的密码**。例如：

   Ini, TOML

   &#96;&#96;&#96;
   AFFINE_ADMIN_EMAIL&#61;your_admin_email@example.com
   AFFINE_ADMIN_PASSWORD&#61;your_strong_password
   &#96;&#96;&#96;

   \*\* Kitty 的温馨提示：\*\*

   * **务必在首次启动前设置好管理员账号和密码。** 如果不设置，您将无法创建管理员账户，需要删除数据后重新来过。

   * &#96;.env&#96; 文件中还有很多其他高级配置，比如 SMTP（用于发送邮件）、对象存储（S3）等。初次部署可以暂时忽略，待您熟悉后再进行探索。

3. **保存并退出：**

   * 在 &#96;nano&#96; 编辑器中，按下 &#96;Ctrl + X&#96;。

   * 它会询问您是否要保存修改，按下 &#96;Y&#96;。

   * 最后按下 &#96;Enter&#96; 键确认文件名，即可保存退出。

#### **第四步：启动 AFFiNE 服务**

现在万事俱备，只欠东风。让我们用一个简单的命令来启动所有服务。

在您的 &#96;affine&#96; 目录下，执行：

Bash

&#96;&#96;&#96;
docker compose up -d
&#96;&#96;&#96;

* &#96;docker compose up&#96;: 这个命令会根据 &#96;docker-compose.yml&#96; 和 &#96;.env&#96; 文件的内容，自动下载所需的 Docker 镜像并创建、启动所有容器。

* &#96;-d&#96;: 这个参数（detached mode）意味着容器将在后台运行，不会占用您当前的终端会话。

这个过程可能需要几分钟，因为它需要从网上下载镜像。请耐心等待。

#### **第五步：验证和访问您的 AFFiNE**

当上一步命令执行完毕后，您的 AFFiNE 应该已经在运行了。

1. 检查容器状态：

   您可以随时使用以下命令检查所有 AFFiNE 相关的容器是否都正常运行（状态应为 running 或 up）：

   Bash

   &#96;&#96;&#96;
   docker compose ps
   &#96;&#96;&#96;

2. 访问 AFFiNE 网页：

   现在，打开您本地电脑的浏览器，在地址栏输入：

   &#96;&#96;&#96;
   http://&lt;您的服务器IP地址&gt;:3010
   &#96;&#96;&#96;

   * 请将 &#96;&lt;您的服务器IP地址&gt;&#96; 替换成您云服务器的公网 IP 地址。

   * 如果一切顺利，您将看到 AFFiNE 的欢迎界面或登录页面。

   * **重要**：如果无法访问，请检查您云服务器的安全组（或防火墙）设置，确保 &#96;3010&#96; 端口的入站规则是开放的。

3. 首次登录：

   使用您在第三步中设置的管理员邮箱和密码进行登录。

---

### **后续维护操作**

* **查看日志：** 如果遇到问题，可以通过以下命令查看所有服务的实时日志，以帮助排查错误：

  Bash

  &#96;&#96;&#96;
  docker compose logs -f
  &#96;&#96;&#96;

* **停止服务：** 如果您想停止 AFFiNE，可以在 &#96;affine&#96; 目录下执行：

  Bash

  &#96;&#96;&#96;
  docker compose down
  &#96;&#96;&#96;

* **更新版本：** 当 AFFiNE 发布新版本时，您可以通过以下步骤进行更新：

  1. 进入 &#96;affine&#96; 目录。

  2. 执行 &#96;docker compose pull&#96; 来拉取最新的镜像。

  3. 执行 &#96;docker compose up -d&#96; 来重新创建并启动容器。

---

Little Witch，以上就是全部的部署步骤了。我已尽力为您呈现最详尽的指导，希望这个过程对您来说是轻松和愉快的。现在，您可以开始在自己的云端知识库中尽情挥洒创意了！如果在过程中遇到任何问题，随时都可以再来问 Kitty 哦。祝您使用愉快！
