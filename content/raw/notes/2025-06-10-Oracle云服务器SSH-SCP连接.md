---
标题: Oracle云服务器SSH/SCP连接
笔记 ID: 01975627-9e0c-7d14-b1b8-b3971288a3d5
笔记类型: crawl
tags:
    - 生活/电子工具
卡片盒:
    - 生活
包含语音: 否
网页链接:
创建时间: "2025-06-10T03:25:26"
更新时间: "2026-03-11T20:55:49.811"
---


针对Oracle云服务器在Windows上无法通过SSH/SCP连接且密钥已正确配置的问题，请按以下步骤排查解决：

---

### **关键排查步骤**
1. **确认连接命令正确性**
   - **SSH命令**：  
     &#96;&#96;&#96;bash
     ssh -i /path/to/private_key opc@&lt;PUBLIC_IP&gt;
     &#96;&#96;&#96;
     📌 **注意**：  
     - Oracle Linux默认用户是&#96;opc&#96;（非&#96;root&#96;），直接连接root会被拒绝。  
     - 若需root权限，先用&#96;opc&#96;登录后执行&#96;sudo -i&#96;切换。

   - **SCP命令**：  
     &#96;&#96;&#96;bash
     scp -i /path/to/private_key opc@&lt;PUBLIC_IP&gt;:/path/to/file .
     &#96;&#96;&#96;

2. **检查安全组规则（Ingress Rules）**
   - 登录Oracle Cloud控制台 → **网络** → **虚拟云网络** → **安全列表**：
     - 确保入站规则允许 **SSH (TCP/22)** 来自你的公网IP（或&#96;0.0.0.0/0&#96;临时测试）。
     - 若实例在公共子网，需关联公共IP。

3. **验证密钥权限（Windows）**
   - 私钥文件权限必须严格限制：
     - 右键点击私钥文件 → **属性** → **安全** → **高级** → **禁用继承** → 删除所有用户。
     - 仅添加当前用户并赋予**读取**权限（其他用户无权限）。

4. **检查服务器SSH配置（需控制台访问）**
   - 通过Oracle Cloud **串行控制台**登录实例（无需SSH）：
     - 进入&#96;/etc/ssh/sshd_config&#96;，检查以下参数：
       &#96;&#96;&#96;ini
       PermitRootLogin yes         # 允许root登录（不推荐，临时测试）
       PubkeyAuthentication yes    # 启用密钥认证
       PasswordAuthentication no    # 禁用密码登录（避免干扰）
       &#96;&#96;&#96;
     - 重启SSH服务：  
       &#96;&#96;&#96;bash
       sudo systemctl restart sshd
       &#96;&#96;&#96;

5. **防火墙与SELinux（服务器端）**
   - 开放22端口：
     &#96;&#96;&#96;bash
     sudo firewall-cmd --add-port&#61;22/tcp --permanent
     sudo firewall-cmd --reload
     &#96;&#96;&#96;
   - 临时禁用SELinux（测试用）：
     &#96;&#96;&#96;bash
     sudo setenforce 0
     &#96;&#96;&#96;

6. **使用详细日志诊断**
   - 在SSH命令中添加&#96;-vvv&#96;输出详细日志：
     &#96;&#96;&#96;bash
     ssh -vvv -i private_key opc@&lt;IP&gt;
     &#96;&#96;&#96;
   - **常见日志线索**：
     - &#96;Permission denied (publickey)&#96; → 密钥不匹配或权限问题。
     - &#96;Connection refused&#96; → 安全组/防火墙/SSH服务未运行。
     - &#96;No route to host&#96; → 网络不通或IP错误。

---

### **其他注意事项**
- **密钥格式问题**：  
  确保私钥是**PEM格式**（OpenSSH兼容）。若使用PuTTY，需用PuTTYgen转换&#96;.ppk&#96;格式。
- **公钥注入位置**：  
  Oracle Cloud会将上传的公钥自动写入&#96;/home/opc/.ssh/authorized_keys&#96;，无需手动操作。
- **实例状态**：  
  确认实例处于**Running**状态，且操作系统启动完成（检查启动日志）。

---

### **快速测试方案**
1. 临时允许密码登录（通过串行控制台）：
   &#96;&#96;&#96;bash
   sudo passwd opc  # 设置opc用户密码
   sudo sed -i &#39;s/PasswordAuthentication no/yes/&#39; /etc/ssh/sshd_config
   sudo systemctl restart sshd
   &#96;&#96;&#96;
   尝试用密码登录：&#96;ssh opc@&lt;IP&gt;&#96;（成功后立即恢复配置）。

2. **重置实例密钥**：  
   在Oracle控制台重新生成/上传公钥 → 重启实例生效。

---

通过以上步骤，90%的连接问题可定位解决。若仍失败，请提供SSH命令的&#96;-vvv&#96;输出日志进一步分析。
