---
标题: Cloudflare邮件路由 0成本无限邮箱
笔记 ID: 019b264a-7bb2-73af-9d11-ff2ef127616c
笔记类型: crawl
tags:
    - 工作
卡片盒:
    - 生活
包含语音: 否
网页链接:
创建时间: "2025-12-16T16:32:54.195"
更新时间: "2026-03-11T20:45:31.691"
---

![](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b264a-7048-7035-9102-4bdb42c52e15.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251216%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251216T083252Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;f4fa670373101e1e9267884a3c733db6b9bd0bd012ee68ad00626800babb50f7&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

很多平台注册用户都可以使用邮箱注册，而且他们的新用户提供免费额度等福利，如果我们有无限个邮箱账号，就可以实现无限白“piao”，也可以使用这些邮箱作为自己的账号堡垒/邮箱蜜罐，隐藏自己的主邮箱账号，避免信息泄露账号风险，同时还能避免管理大量邮箱的烦恼

今天，我将教你如何利用 **Cloudflare Email Routing（邮件路由）** 功能，**0成本、永久免费**地实现这一目标。不仅能有无限个自己的专属邮箱，不仅可以收信，配合 Gmail 还能实现“完美伪装”发信。

### 为什么要用 Cloudflare 邮件路由？

- **完全免费**：没有隐形消费，且不限流量。
- **极简设置**：不用自己搭建服务器，不用懂 Linux，只要有域名就能用。
- **隐私保护**：不仅能提升专业度，还能通过创建无限的别名（如 &#96;shopping@yourdomain.com&#96;）来防止主邮箱泄露。 （为什么说这对于追踪是谁泄露了你的隐私非常有用，感兴趣的同学，可以看下这篇文章[有趣的计算机知识](https://mp.weixin.qq.com/mp/appmsgalbum?__biz&#61;MzIwNDExMjUyNg&#61;&#61;&amp;action&#61;getalbum&amp;album_id&#61;4296907261978836992#wechat_redirect)）
- **高可靠性**：依托 Cloudflare 强大的全球网络，几乎不会丢件。

---

### 🛠️ 准备工作

1. **一个域名**：任何后缀均可。
2. **Cloudflare 账号**：免费版即可。
3. **域名已托管在 Cloudflare**：即域名的 NS (Nameserver) 已经修改为 Cloudflare 提供的地址。

---

### 第一阶段：开启邮件路由（接收邮件）

这是最基础的一步，设置完后，发往你域名的邮件会自动转发到你的私人邮箱（如 Gmail, Outlook, QQ 邮箱）。

#### 1. 进入控制台

登录 Cloudflare，点击你的域名，在左侧菜单栏找到 **Email (电子邮件)** -\&gt; **Email Routing (邮件路由)**。[如果没有看到邮箱相关的菜单，说明你还没有绑定一个域名，你需要先绑定一个域名，就会看到邮箱相关的功能菜单，另外提一嘴，如果你是一个开发者，绑定域名还可以将你的静态网站进行访问加速，并自带流量统计

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b264a-70cb-77f1-b936-c7fb7e9a7e8c.webp#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251216%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251216T083253Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;f1ded9f670187aaf5e8a7c60e47ddba5f2ecfbdc70b982c39fe708934634757c&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

]

#### 2. 启用服务

点击页面上的 **&quot;Get Started&quot; (开始使用)**。系统会让你选择一个“目标地址”（Destination Address），这里填入你日常使用的**私人真实邮箱**（例如 &#96;zhangsan@gmail.com&#96;）。

#### 3. 验证邮箱

Cloudflare 会向你的私人邮箱发送一封验证邮件。登录你的邮箱，点击链接验证。状态变为 **&quot;Verified&quot; (已验证)** 即成功。

#### 4. 自动配置 DNS (关键一步)

Cloudflare 会检测你的 DNS 设置。如果缺失记录，它会提示 **&quot;Add records and enable&quot; (添加记录并启用)**。

- **操作**：直接点击自动添加即可。
- **原理**：它会添加几条 MX 记录和 TXT 记录（SPF），这是告诉全球邮件服务器：“Cloudflare 有权处理这个域名的邮件”。

#### 5. 创建你的专属别名

在 **Routes (路由)** 选项卡中，点击 **Create address (创建地址)**：

- **Custom address (自定义地址)**：填入你想要的前缀，比如 &#96;contact&#96; 或 &#96;boss&#96;。
- **Destination (目标)**：选择刚才验证过的私人邮箱。
- **保存**。

&gt; **🎉 此时，如果你给 **&#96;contact@你的域名.com&#96; 发邮件，你的私人邮箱立马就能收到！

---

### 💡 进阶干货：开启 Catch-all (无限别名)

不想每次注册新网站都来手动创建别名？开启 Catch-all 功能！

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b264a-7086-7343-9843-b543255ccef8.webp#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251216%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251216T083253Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;cff78247751b52d734cce157de9a4556f75ec31a183361f3a8f8e07bbac652a0&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

1. 在 Email Routing 页面，找到 **Catch-all address**。
2. 点击 **Edit (编辑)**，状态改为 **Active (启用)**。
3. Action 选择 **Send to a destination**，选择你的私人邮箱。

**效果**：此时，你可以随意编造地址，比如 &#96;amazon-vip@你的域名.com&#96;、&#96;tiktok-login@你的域名.com&#96;。只要后缀是你的域名，所有邮件都会照单全收。这对于追踪是谁泄露了你的隐私非常有用！（为什么说这对于追踪是谁泄露了你的隐私非常有用，感兴趣的同学，可以看下这篇文章[有趣的计算机知识](https://mp.weixin.qq.com/mp/appmsgalbum?__biz&#61;MzIwNDExMjUyNg&#61;&#61;&amp;action&#61;getalbum&amp;album_id&#61;4296907261978836992#wechat_redirect)）

---

### 第二阶段：利用 Gmail 实现“原件发送”（硬核技巧）

光能收信还不够，如果客户给你发信，你用 QQ 邮箱回复，瞬间就穿帮了。我们需要用 Gmail 的 SMTP 功能，伪装成你的域名邮箱发信。

#### 1. 获取 Google 应用专用密码 (App Password)

*如果你没有开启两步验证，请先开启。*

1. 进入 Google 账号管理 -\&gt; 安全性。
2. 搜索“应用专用密码” (App Passwords)。
3. 创建一个新应用，名称随便填（如 &#96;CF-Mail&#96;），系统会生成一串 **16位字符的密码**。**复制并保存好它，不要带空格。**

#### 2. 在 Gmail 中添加发件地址

1. 打开 Gmail 网页版 -\&gt; 设置 (齿轮图标) -\&gt; 查看所有设置。
2. 点击 **&quot;账号和导入&quot; (Accounts and Import)**。
3. 在 **&quot;这是用来发送邮件的地址&quot; (Send mail as)** 一栏，点击 **&quot;添加其他电子邮件地址&quot;**。

#### 3. 填写 SMTP 信息 (最关键的一步)

弹出的窗口中：

- **名称**：填你想展示给对方的名字（如 &quot;张三 | CEO&quot;）。
- **电子邮件地址**：填你在 Cloudflare 创建的域名邮箱（如 &#96;contact@你的域名.com&#96;）。
- **勾选**：&quot;视作别名&quot; (Treat as an alias)。
- 点击下一步。

**服务器配置填写：**

&#96;&#96;&#96;
SMTP 服务器：smtp.gmail.com端口：587用户名：你的 Gmail 原账号(注意：不是域名邮箱，是 xxx@gmail.com)。密码：刚才生成的 16 位应用专用密码(不是 Gmail 登录密码！)。加密连接：选择 TLS
&#96;&#96;&#96;

#### 4. 验证并完成

点击“添加账号”，Gmail 会向你的域名邮箱发一封验证邮件。 因为你第一阶段已经做好了路由，这封信会立刻转回到你的 Gmail 收件箱。 打开邮件，点击确认链接，或者复制验证码填入弹窗。

---

### 🏆 最终效果展示

现在，当你打开 Gmail 写信时：

1. 点击“发件人”下拉框。
2. 你会发现除了原本的 Gmail，多了一个 &#96;contact@你的域名.com&#96;。
3. 当你用这个身份发送邮件时，对方看到的发件人就是你的域名邮箱，完全看不出 Gmail 的痕迹！

---

### ⚠️ 避坑指南 &amp; 常见问题

1. **关于 SPF 记录冲突**： 如果你之前用过其他的企业邮服务，DNS 里可能残留了其他的 SPF (TXT) 记录。**一定要删除旧的**，只保留 Cloudflare 生成的那条 &#96;v&#61;spf1 include:_spf.mx.cloudflare.net ~all&#96;。一个域名只能有一条 SPF 记录，否则发信容易进垃圾箱。
2. **发信进垃圾箱怎么办？**Cloudflare 邮件路由主要解决“收”的问题。利用 Gmail 代发通常很稳，但为了极致的送达率，建议检查你的 DMARC 设置（这属于更高级的话题，通常保持默认 Cloudflare 设置即可满足 99% 需求）。
3. **能用来群发营销邮件吗？绝对不要。** Gmail 的 SMTP 有严格的日发送限制（通常几百封），且大量群发会导致你的域名和 Gmail 账号被封禁。这套方案仅适用于个人商务沟通。

---

通过 **Cloudflare (接收) + Gmail SMTP (发送)** 的组合拳，你只用了一个域名的成本，就获得了一套：

- ✅ 看起来极度专业的企业邮箱
- ✅ Google 级别的反垃圾邮件能力
- ✅ 无限的隐私马甲号

**这一波操作，省下的不仅仅是每年的订阅费，更是维护邮件服务器的秃头风险。**

&gt; 来自：[https://mp.weixin.qq.com/s/vAfMkqRJYAieAXNNbvvI6A](https://mp.weixin.qq.com/s/vAfMkqRJYAieAXNNbvvI6A)
