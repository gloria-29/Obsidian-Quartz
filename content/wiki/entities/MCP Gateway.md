---
tags: [mcp, server, gateway, protocol, infrastructure, self-hosting]
created: 2026-05-18
updated: 2026-05-19
type: entity
sources:
  - raw/articles/2026-05-18-20260428-本地-mcp-gateway.md
---

# MCP Gateway

## 概述

MCP Gateway 是一个 [[MCP]] 协议的聚合网关，将多个 MCP Server 统一接入一个入口，提供代理转发、认证、管理和 Web 管理界面。它是自建 MCP 工具生态的基础设施。

## 核心功能

| 功能 | 说明 |
|------|------|
| **统一入口** | 多个 MCP 服务器聚合到单一端点 |
| **代理转发** | 根据工具名称路由到对应后端服务器 |
| **认证管理** | Token 认证，支持多用户 |
| **Web 管理 UI** | 可视化管理 MCP 服务器和工具 |
| **策略规则** | allow/confirm/deny 三级权限控制 |
| **SSE 流式** | 支持 Server-Sent Events 实时通信 |

## 架构

```
客户端 (Claude/Gemini/自定义)
    ↓ HTTP/SSE
MCP Gateway (localhost:3000)
    ├─→ MCP Server A (文件系统)
    ├─→ MCP Server B (数据库)
    ├─→ MCP Server C (Web 搜索)
    └─→ MCP Server D (自定义工具)
```

## 安装与配置

### Docker 部署
```bash
docker pull mcp-gateway/mcp-gateway
docker run -d -p 3000:3000 \
  -v ./config.yaml:/app/config.yaml \
  mcp-gateway/mcp-gateway
```

### 配置文件示例
```yaml
servers:
  - name: filesystem
    url: http://localhost:3001
    tools: [read_file, write_file, search_files]
  - name: database
    url: http://localhost:3002
    tools: [query, execute]

auth:
  tokens:
    - name: default
      token: "your-secret-token"

policies:
  - tool: "execute"
    action: confirm  # 需要确认
  - tool: "read_file"
    action: allow    # 自动允许
```

## Web 管理界面

- **服务器管理**: 添加/删除/启停 MCP 服务器
- **工具浏览**: 查看所有可用工具及其 schema
- **日志查看**: 实时查看工具调用日志
- **策略配置**: 可视化配置 allow/confirm/deny 规则
- **用户管理**: 管理 API Token 和权限

## 使用场景

1. **个人 AI 基础设施**: 统一管理 [[Hermes Agent]]、[[Claude Code]] 等工具的 MCP 服务器
2. **团队共享**: 多人共享同一套 MCP 工具集
3. **安全审计**: 通过 Gateway 记录所有工具调用
4. **工具聚合**: 将分散的 MCP 服务器统一为单一端点

## 与其他工具的关系

- **[[MCP]]**: Gateway 是 MCP 协议的实现之一
- **[[Hermes Agent]]**: 可通过 Gateway 接入更多 MCP 工具
- **[[GenericAgent]]**: 可配置 Gateway 作为 MCP 端点
- **[[Claude Code]]**: 可通过 `--mcp` 参数连接 Gateway

## 转发路径规则

默认路径：
- SSE: `GET|POST /api/v2/sse/<serverName>`
- HTTP: `POST /api/v2/mcp/<serverName>`

最终访问地址：`http://<监听地址><路径>/<服务名>`

示例（监听 `127.0.0.1:8765`）：
- `http://127.0.0.1:8765/api/v2/sse/filesystem`
- `http://127.0.0.1:8765/api/v2/mcp/filesystem`

## 安全配置详解

### 双 Token 认证体系

| Token | 保护范围 | 说明 |
|-------|----------|------|
| **ADMIN TOKEN** | `/api/v2/admin/*` | 管理接口令牌，保护管理 API |
| **MCP TOKEN** | `/api/v2/mcp/*`、`/api/v2/sse/*` | MCP 调用令牌，保护工具调用接口 |

- Token 留空 = 该类认证关闭
- 对外开放时**强烈建议开启**，使用随机长 Token
- 客户端调用时加请求头：`Authorization: Bearer <token>`

### SKILLS 能力详解

SKILLS 标签页用于启用并管理内置 Skill MCP 服务：

1. 打开 `启用内置 SKILL MCP`
2. 设置 `Skill 服务名`（默认 `__skills__`）
3. 添加 `Skill 根目录`，确保目录下存在 `SKILL.md`
4. 可选开启 `路径守卫`，填写绝对路径白名单，选择越界动作：`allow / confirm / deny`
5. 设置执行限制：`执行超时（毫秒）`（最小 1000）和 `最大输出（字节）`（最小 1024）
6. 在 `策略规则` 中维护 JSON 规则（`id/action/commandTree/contains/reason`）
7. 运行后在 `待确认命令` 中审批高风险命令

启用后端点：
- `http://<监听地址><SSE路径>/<skillsServerName>`
- `http://<监听地址><HTTP路径>/<skillsServerName>`

### 策略规则（Policy Rules）

| 动作 | 说明 |
|------|------|
| `allow` | 自动放行 |
| `confirm` | 需人工审批 |
| `deny` | 直接拒绝 |

规则字段：`id`、`action`、`commandTree`（命令树匹配）、`contains`（内容匹配）、`reason`

### 路径守卫（Path Guard）

- 填写绝对路径白名单，限制 Skill 可访问的目录范围
- 越界动作可选 `allow`、`confirm`、`deny`
- SKILLS 根目录校验：检测目录下是否存在 `SKILL.md`（当前为非递归检查）

## MCP 服务配置

每个 MCP 服务行：开关、`名称`（URL 末尾）、`命令`（如 `npx`）、`参数`、环境变量

示例（Playwright MCP）：名称 `playwright`、命令 `npx`、参数 `-y @playwright/mcp@latest`

## 配置文件位置

- Windows: `%APPDATA%\mcp-gateway\config.v2.json`
- macOS: `~/Library/Application Support/mcp-gateway/config.v2.json`
- Linux: `~/.config/mcp-gateway/config.v2.json`

## 相关页面

- [[MCP]] — 底层协议规范
- [[个人AI基础设施]] — Gateway 在个人 AI 栈中的位置
- [[Cloudflare]] — 类似的网关/代理服务
