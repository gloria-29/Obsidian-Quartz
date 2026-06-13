---
标题: smithery-ai/mcp-obsidian服务器
笔记 ID: 0199cde1-ed9a-7c33-abfc-6daebc1aec94
笔记类型: crawl
tags:
    - 生活/电子工具
卡片盒:
    - 生活
包含语音: 否
网页链接:
创建时间: "2025-10-10T19:29:19"
更新时间: "2026-03-11T20:45:31.691"
---

对于小白用户而言，部署起来最简单、最友好的 Obsidian MCP 服务器是 **【来源2：smithery-ai/mcp-obsidian】**。

**选择理由：**

1. **安装方式最简单：** 它明确提供了 &#96;npx -y @smithery/cli install mcp-obsidian --client claude&#96; 这种一键安装命令，这是 &#96;npm&#96; (Node Package Manager) 工具链的一部分，通常比 Python 环境配置更直接，并且它会自动处理 Claude Desktop 的配置。
2. **不依赖 Obsidian 内部插件：** 另外两个 Python 版本都明确要求你先安装并启用 Obsidian 的 REST API 社区插件，这增加了一个依赖和配置步骤。而 &#96;smithery-ai/mcp-obsidian&#96; 的描述是“read and search any directory containing Markdown notes (such as an Obsidian vault)”，这意味着它直接读取文件系统，不需要 Obsidian 应用程序运行或安装额外的插件，大大简化了入门门槛。
3. **语言环境：** 它基于 JavaScript/Node.js，对于许多用户来说，安装 Node.js 和 &#96;npm&#96; 可能比配置 Python 环境（特别是 &#96;uvx&#96; 这种新工具）更常见或更直观。

***

### 部署 &#96;smithery-ai/mcp-obsidian&#96; 的详细操作步骤（Windows 版）

请严格按照以下步骤操作，即使你是计算机小白，也能顺利完成。

#### 步骤 1：安装 Node.js 和 npm

&#96;smithery-ai/mcp-obsidian&#96; 需要 &#96;Node.js&#96; 环境来运行 &#96;npm&#96; 和 &#96;npx&#96; 命令。

1. **下载 Node.js 安装包：**

   * 打开浏览器，访问 Node.js 官方网站：&lt;https://nodejs.org/en/download&gt;

   * 在下载页面，找到并点击 **Windows Installer (msi)** 下方的 **LTS** 版本（长期支持版本）。LTS 版本更稳定，适合大多数用户。

2. **安装 Node.js：**

   * 下载完成后，双击下载的 &#96;.msi&#96; 文件（例如 &#96;node-vXX.XX.X-x64.msi&#96;）开始安装。

   * 按照安装向导的指示进行：

     * 点击 **Next**。

     * 接受许可协议，点击 **Next**。

     * 选择安装路径（通常保持默认即可），点击 **Next**。

     * 选择安装组件（通常保持默认即可），**确保 &quot;Node.js runtime&quot; 和 &quot;npm package manager&quot; 已勾选**，点击 **Next**。

     * 在 &quot;Tools for Native Modules&quot; 页面，**取消勾选** &quot;Automatically install the necessary tools...&quot;（除非你知道你在做什么，对于小白用户来说通常不需要这些），点击 **Next**。

     * 点击 **Install**。

     * 安装可能需要管理员权限，请点击 **是**。

     * 安装完成后，点击 **Finish**。

3. **验证 Node.js 和 npm 安装：**

   * 按下 &#96;Win + R&#96; 键，输入 &#96;cmd&#96;，然后按回车键打开 **命令提示符**。

   * 在命令提示符窗口中，分别输入以下命令并按回车键：

     &#96;&#96;&#96;bash
     node -v
     npm -v
     &#96;&#96;&#96;

   * 如果能看到类似 &#96;vXX.XX.X&#96; 的版本号输出，则表示 Node.js 和 npm 已成功安装。

#### 步骤 2：找到你的 Obsidian Vault 路径

你需要知道你的 Obsidian 笔记库（Vault）在电脑上的确切路径。

1. **打开 Obsidian：** 启动你的 Obsidian 应用程序。
2. **找到 Vault 设置：**

   * 点击左侧边栏最上方的 **打开另一个库** 图标（通常是一个文件夹图标）。

   * 或者，如果你已经在库中，点击左下角的 **设置**（齿轮图标），然后选择 **关于** 或 **库** 选项，通常会显示当前库的路径。

   * 最简单的方法：在 Obsidian 中，右键点击你的库中的任意一个文件夹或文件，选择 **在系统资源管理器中显示**。
3. **复制路径：** 系统资源管理器会打开你 Obsidian 库所在的文件夹。复制地址栏中的完整路径。

   * **示例路径格式：** &#96;C:\Users\你的用户名\Documents\Obsidian\MyVault&#96;

   * **重要：** 请确保复制的是你 **整个 Vault 文件夹** 的路径，而不是 Vault 内的某个子文件夹或文件。

#### 步骤 3：安装 Obsidian MCP 服务器

现在，我们将使用 &#96;npx&#96; 命令来安装并配置 MCP 服务器。

1. **打开命令提示符：** 如果你之前关闭了，请再次按下 &#96;Win + R&#96; 键，输入 &#96;cmd&#96;，然后按回车键打开。
2. **运行安装命令：** 在命令提示符窗口中，输入以下命令。请将 &#96;&lt;你的Obsidian_Vault_完整路径&gt;&#96; 替换为你在步骤 2 中复制的路径。

   &#96;&#96;&#96;bash
   npx -y @smithery/cli install mcp-obsidian --client claude --vaultPath &quot;&lt;你的Obsidian_Vault_完整路径&gt;&quot;
   &#96;&#96;&#96;

   * **例如：** 如果你的 Vault 路径是 &#96;C:\Users\YourName\Documents\Obsidian\MyNotes&#96;，命令将是：

     &#96;&#96;&#96;bash
     npx -y @smithery/cli install mcp-obsidian --client claude --vaultPath &quot;C:\Users\YourName\Documents\Obsidian\MyNotes&quot;
     &#96;&#96;&#96;

   * **注意：** 路径中如果有空格，**务必用双引号将路径括起来**。

   * 按回车键执行命令。

   * 这个过程可能需要一些时间来下载和安装必要的组件。你可能会看到一些下载进度或安装信息。

   * 安装成功后，通常会显示成功的提示信息，或者命令提示符会直接回到下一行。

#### 步骤 4：重启 Claude Desktop

为了让 Claude Desktop 加载新的 MCP 服务器配置，你需要重启它。

1. **完全关闭 Claude Desktop：** 确保 Claude Desktop 应用程序完全退出，而不仅仅是最小化到任务栏。

   * 你可以右键点击系统托盘（任务栏右下角小图标区域）中的 Claude 图标，然后选择 **退出** 或 **Quit**。

   * 或者，打开任务管理器（&#96;Ctrl + Shift + Esc&#96;），在“进程”或“详细信息”选项卡中找到与 Claude 相关的进程并结束它们。
2. **重新启动 Claude Desktop：** 从你的桌面快捷方式或开始菜单中再次启动 Claude Desktop。

#### 步骤 5：验证 MCP 服务器是否成功加载

1. **检查 Claude Desktop 界面：**

   * 在 Claude Desktop 应用程序中，通常在界面的某个角落（例如左下角或右上角），你会看到一个 **锤子图标** 或 **工具图标**。这表示 MCP 服务器已连接并可用。

   * 点击这个图标，你应该能看到 &#96;mcp-obsidian&#96; 服务器以及它提供的工具列表（例如 &#96;list_files_in_vault&#96;, &#96;search&#96;, &#96;get_file_contents&#96; 等）。

2. **尝试使用工具：**

   * 在 Claude 的对话框中，尝试提问，让它使用 Obsidian 工具。

   * **例如，你可以输入：**

     * &#96;列出我的Obsidian笔记库中的所有文件。&#96;

     * &#96;在我的笔记中搜索关于“项目管理”的所有内容。&#96;

     * &#96;阅读文件“我的日记.md”的内容。&#96; (请替换为你的笔记库中实际存在的文件名)

   * 如果 Claude 能够调用 &#96;obsidian&#96; 工具并返回结果，那么恭喜你，Obsidian MCP 服务器已成功部署并运行！

#### 故障排除（如果遇到问题）

* **“npx”命令未找到：** 确保 Node.js 和 npm 已正确安装，并且它们的路径已添加到系统的环境变量中。你可以尝试重启电脑后再次运行 &#96;npx&#96; 命令。

* **安装命令报错：** 仔细检查你的 Obsidian Vault 路径是否正确，并且是否用双引号括起来（如果路径有空格）。尝试以管理员身份运行命令提示符（右键点击“命令提示符”图标，选择“以管理员身份运行”）。

* **Claude Desktop 中没有锤子图标或工具：**

  * 确保 Claude Desktop 完全关闭并重新启动。

  * 检查 Claude Desktop 的日志文件。在 Windows 上，日志文件通常位于 &#96;%APPDATA%\Claude\logs\mcp*.log&#96;。你可以打开这些文件查看是否有错误信息。

  * 如果 Smithery 的自动配置没有生效，你可能需要手动配置。但对于 &#96;npx -y @smithery/cli install mcp-obsidian --client claude&#96; 这种形式，通常会自动处理配置。

通过以上详细步骤，你应该能够成功在 Windows 电脑上部署 &#96;smithery-ai/mcp-obsidian&#96; 服务器。祝你使用愉快！
