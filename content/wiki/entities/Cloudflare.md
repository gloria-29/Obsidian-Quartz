---
tags: [cloud, self-hosting, proxy, email, workers, vpn]
created: 2026-05-18
updated: 2026-05-19
type: entity
sources:
  - raw/articles/2026-05-18-20260430-免费快速拥有自己的节点-cloudflare篇.md
  - raw/articles/2026-05-18-20260428-cloudflare-tempemail-子域邮箱配置方法の无限裂变.md
  - raw/articles/2026-05-18-20260428-edgetunnel2-0全新版本-cmliussssblog.md
---

# Cloudflare

## 概述

Cloudflare 是全球领先的云基础设施提供商，提供 CDN、DDoS 防护、DNS、Workers（边缘计算）、Pages（静态托管）等服务。在本知识库中，Cloudflare 被广泛用于免费节点搭建、临时邮箱、边缘代理等场景。

## 核心服务

| 服务 | 用途 | 价格 |
|------|------|------|
| **Workers** | 边缘计算，运行 JS/Python | 免费 10 万次/天 |
| **Pages** | 静态网站托管 | 免费无限带宽 |
| **KV** | 键值存储 | 免费 10 万次/天 |
| **R2** | 对象存储（S3 兼容） | 免费 10GB |
| **DNS** | 域名解析 | 免费 |
| **CDN** | 内容分发网络 | 免费 |
| **Tunnel** | 安全隧道 | 免费 |

## 免费节点搭建（EdgeTunnel）

根据源文献，通过 Cloudflare Pages 可以免费搭建代理节点：

### 部署步骤
1. 下载 EdgeTunnel 项目压缩包
2. 登录 Cloudflare，进入 Workers 和 Pages
3. 创建 Pages 应用，上传压缩包
4. 设置管理员密码变量（ADMIN）
5. 绑定 KV 命名空间
6. 部署完成，获得 `*.pages.dev` 域名

### EdgeTunnel 特性
- **WebUI 管理**: 可视化管理节点配置
- **多协议支持**: 支持多种代理协议
- **免费部署**: 利用 Cloudflare 免费额度
- **自动更新**: 支持自动更新订阅

### 管理界面
- 访问 `https://your-project.pages.dev`
- 使用 ADMIN 变量设置的密码登录
- 配置节点参数和订阅链接

## 临时邮箱（TempEmail）

根据源文献，Cloudflare 可以配置无限裂变的子域邮箱：

### 配置方法
1. 拥有自己的域名（托管在 Cloudflare）
2. 配置 Email Routing 规则
3. 设置 catch-all 规则接收所有邮件
4. 使用子域创建无限邮箱地址

### 使用场景
- 注册各种服务（避免主邮箱泄露）
- 接收验证码
- 测试和开发

## Workers 使用示例

### 简单代理
```javascript
export default {
  async fetch(request) {
    const url = new URL(request.url);
    url.hostname = 'target.com';
    return fetch(url);
  }
}
```

### API 网关
```javascript
export default {
  async fetch(request) {
    const auth = request.headers.get('Authorization');
    if (!auth) return new Response('Unauthorized', { status: 401 });
    // 处理请求
    return fetch(request);
  }
}
```

## 与其他工具的集成

- **[[Hermes Agent]]**: 可通过 Workers 部署 API 代理
- **[[MCP Gateway]]**: 类似的网关功能
- **[[Obsidian]]**: 可通过 Cloudflare Pages 托管知识库

## 费用说明

| 资源 | 免费额度 | 超出费用 |
|------|----------|----------|
| Workers 请求 | 10 万次/天 | $0.30/百万次 |
| KV 读取 | 10 万次/天 | $0.50/百万次 |
| R2 存储 | 10GB | $0.015/GB/月 |
| Pages 带宽 | 无限 | 免费 |
| DNS 查询 | 无限 | 免费 |

## 注意事项

- 免费账户有请求频率限制
- 国内访问可能需要优化
- 遵守 Cloudflare 服务条款
- 定期检查服务状态

## 相关页面

- [[MCP Gateway]] — 类似的网关服务
- [[Hermes Agent]] — 可集成 Cloudflare 服务
- [[个人AI基础设施]] — Cloudflare 在个人栈中的位置
