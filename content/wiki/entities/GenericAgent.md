---
tags: [agent-framework, ai-agent, datawhale, open-source]
created: 2026-05-18
updated: 2026-05-19
type: entity
sources:
  - raw/articles/2026-05-18-20260427-genericagent教程.md
---

# GenericAgent

> Datawhale 开源的人工智能代理框架，基于 SOP 驱动的工作流执行引擎。

## 概述

GenericAgent（GA）是由 Datawhale 社区开发的开源 AI Agent 框架。其核心理念是通过标准操作程序（SOP）驱动代理执行复杂的多步骤任务。框架支持自定义 Skill Hub、自动阶段转换，并具备自我蒸馏经验为 SOP 的能力，从而实现持续进化的智能体行为。

该框架以教程形式开源在 datawhalechina.github.io，提供了丰富的文档和示例，帮助开发者快速构建自己的 AI Agent 应用。

## 关键特性

- **SOP 驱动执行**：所有任务基于标准操作程序（SOP）进行编排，确保代理行为的一致性和可复现性
- **四层记忆架构**：L1 索引层（极简索引 <30 行，每次启动注入）+ L2 事实层（环境事实/用户偏好）+ L3 技能层（SOP/脚本/子目录）+ L4 归档层（压缩历史会话），实现从引导到长期经验的全覆盖
- **Skill Search（技能搜索）**：内置技能搜索引擎，从 105K+ 技能卡中自动检索、评分（优先高分/环境匹配/低风险）、小步验证，语义匹配对英文更友好
- **自动阶段转换**：Agent 在子目标完成或故障恢复后主动调用经验蒸馏，将探索经验转化为 SOP 写入 L3；下次同类任务 L1 索引自动路由到该 SOP，Agent 无缝切换到「按 SOP 执行」模式——全程无需人工干预
- **自定义 Skill Hub**：可指定其他开源 Skill 网站或自建私有 Hub，GA 到指定的 Skill 库中检索；支持从 Claude Code/OpenClaw 迁移已有 Skill（提取 SKILL.md + scripts/references，去除专属依赖，改写为 SOP）
- **自我经验蒸馏**：代理能将执行经验自动提炼为可复用的 SOP，实现持续自我改进；核心原则：无行动不记忆、已验证数据不可删改、禁止存储易变状态

## 架构细节

### API 渠道体系

GA 通过 `mykey.py` 统一管理所有 LLM 连接，支持两大类协议接口：

**一线直连渠道（Native 协议，推荐）**：
| 渠道 | apibase | 备注 |
|------|---------|------|
| Anthropic 官方 | `api.anthropic.com` | sk-ant- 前缀自动切 x-api-key |
| OpenAI 官方 | `api.openai.com/v1` | 支持 api_mode: 'responses' |
| DeepSeek V4 | `api.deepseek.com` | 不带 /v1 后缀，推荐 Anthropic 兼容端点 `/anthropic` |
| OpenRouter | `openrouter.ai/api/v1` | model 用 provider/model 格式 |
| 智谱 GLM | `open.bigmodel.cn/api/anthropic` | 推荐 Anthropic 路径 |
| MiniMax | `api.minimaxi.com/anthropic` | 204K 上下文 |

**反代/透传渠道**：CC Switch、CRS 反代、AnyRouter — 需设置 `fake_cc_system_prompt: True`

**本地模型**：Ollama（`http://127.0.0.1:11434/v1`）、llama.cpp、vLLM、LM Studio

**Native 协议**（变量名 `native_` 前缀）使用模型原生 tool use 格式，工具调用更稳定；旧版 `oai_config`/`claude_config` 走文本协议，部分模型不稳定。

### Mixin 自动故障切换

GA 支持多模型自动 failover——任意 429/5xx/超时自动切下一个：

```python
mixin_config = {
    'llm_nos': ['claude-main', 'claude-backup', 'gpt-backup'],  # 按优先级
    'max_retries': 10,      # 整个 rotation 总重试上限
    'base_delay': 0.5,      # 指数退避起始（秒）
    'spring_back': 300,     # 切到备用后多久尝试回到主（秒）
}
```

约束：所有被引用的 session 必须同属 Native 系列或全不属 Native 系列。

### Hub 总控台服务

`hub.pyw` 一键管理所有后台服务，包括：
- reflect/autonomous.py（30 分钟无输入自动触发自主行动）
- reflect/scheduler.py（定时任务调度 + L4 会话归档）
- 11 种前端接入：Streamlit Web UI（stapp.py / Anthropic 风格 stapp2.py）、飞书/Lark、钉钉、QQ、企业微信、个人微信、Telegram、PySide6 桌面悬浮球

### 记忆架构详解

| 层级 | 存储内容 | 路径 | 说明 |
|------|---------|------|------|
| L1 索引 | 极简索引 <30 行 | `memory/global_mem_insight.txt` | 每轮启动注入，存在性编码，ROI 公式评估每行价值 |
| L2 事实 | 环境事实/偏好 | `memory/global_mem.txt` | 路径、系统配置、用户偏好 |
| L3 技能 | SOP/脚本/目录 | `memory/*.md` `memory/*.py` | 可执行 Skill，SOP 即 Skill |
| L4 归档 | 压缩历史会话 | `memory/L4_raw_sessions/` | 月度 zip，需 scheduler 模式触发（12h+ 运行 & 2h 未更新 & >4.5KB） |

### 内置 Skill 一览

GA 仓库内置 11 个核心 Skill：web_setup_sop（浏览器自动化）、skill_search（105K+ 技能卡搜索）、autonomous_operation_sop（闲置自主行动）、scheduled_task_sop（定时任务）、plan_sop（复杂任务规划）、subagent（并行子 Agent，上下文隔离）、ljqCtrl（Windows 键鼠控制）、adb_ui.py（安卓手机控制）、ocr_utils（多语言 OCR）、github_contribution_sop（开源贡献工作流）、keychain（加密密钥管理）

### 浏览器能力

通过 `tmwd_cdp_bridge` 插件（Chrome/Edge/夸克）实现 CDP（Chrome DevTools Protocol）级浏览器操控——直接使用用户的本地浏览器和登录态，已登录站点无需重复认证，与 Selenium/Playwright 的独立浏览器方案本质不同。

### 关键启动文件

| 文件 | 作用 |
|------|------|
| `mykey.py` | API 密钥配置（从 mykey_template.py 复制） |
| `launch.pyw` | 主启动（双击或 `python launch.pyw`） |
| `hub.pyw` | 服务总控台 |
| `agentmain.py` | CLI 入口 |
| `frontends/stapp.py` | 默认 Streamlit Web UI |

### / 命令系统

`/help` `/status` `/stop` `/new` `/restore` `/resume` `/continue` `/llm [n]` — 支持所有前端；推荐 Python 3.11/3.12（不兼容 3.14）

## 关系

- 相关页面：[[MCP]], [[PAI]], [[Claude Code]], [[DeepSeek V4]]
- 框架的应用：[[PAI]] 构建在 [[Claude Code]] 之上并借鉴了类似的代理模式
- 模型支持：通过 Native Claude 接口原生支持 [[DeepSeek V4]]（推荐 Anthropic 兼容端点 `/anthropic`）

## 来源参考

- Datawhale 官方教程：datawhalechina.github.io/hello-generic-agent
- GitHub: lsdefine/GenericAgent

## 详细安装步骤（Datawhale 教程）

### 第一步：安装 Python

- 推荐 **Python 3.11 或 3.12**，不兼容 3.14（`pywebview` 等依赖尚未跟进）
- Windows：下载 python-3.12.10-amd64.exe，安装时**务必勾选 Add python.exe to PATH**
- macOS：系统自带 Python 3，验证 `python3 --version`；版本低于 3.10 则前往官网安装
- 验证命令：`python --version`（Windows）/ `python3 --version`（macOS）

### 第二步：下载项目

- **ZIP 下载（新手推荐）**：GitHub 仓库页面 → Code → Download ZIP → 解压到 `D:\GenericAgent` 等目录
- **Git Clone**：`git clone https://github.com/lsdefine/GenericAgent.git`

### 第三步：安装最小依赖

```bash
cd <GenericAgent路径>
pip install streamlit pywebview
```

> 其余依赖不用手动装——启动后让 GA 自己安装（见下方"首次启动"）

### 第四步：配置 API 密钥（mykey.py）

1. 复制 `mykey_template.py` → 重命名为 `mykey.py`
2. 选择 API 渠道填写配置（有 `#` 的行 = 不生效，无 `#` = 生效）
3. 多个配置时，GA 默认使用第一个生效配置，可通过侧边栏切换

**新手推荐配置：Claude 主力 + GPT 兜底**：
```python
native_claude_config0 = {
    'name': 'claude-main',
    'apikey': 'sk-user-<你的relay-key>',
    'apibase': 'https://<your-cc-switch-host>/claude/office',
    'model': 'claude-opus-4-6',
    'fake_cc_system_prompt': True,
    'thinking_type': 'adaptive',
    'max_retries': 3,
    'read_timeout': 180,
}
```

**DeepSeek V4 推荐配置**（2026年4月发布，1M tokens 上下文）：
```python
native_claude_config_deepseek = {
    'name': 'deepseek-v4-native',
    'apikey': 'sk-<你的 DeepSeek API Key>',
    'apibase': 'https://api.deepseek.com/anthropic',  # Anthropic 兼容端点
    'model': 'deepseek-v4-pro',
    'thinking_type': 'enabled',
    'reasoning_effort': 'high',
    'read_timeout': 180,
    'stream': True,
}
```

### 第五步：首次启动

```bash
cd <GenericAgent路径>
python launch.pyw        # Windows 可双击 launch.pyw
```

启动后输入以下指令让 GA 自动安装剩余依赖：
```
请查看你的代码，安装所有用得上的 python 依赖
```

可选：让 GA 建立 Git 连接和创建桌面快捷方式，方便后续更新和启动。

### 常见问题

| 问题 | 原因 | 解决 |
|------|------|------|
| 工具调用乱码 | 变量名未用 `native_` 前缀 | 改为 `native_claude_config` / `native_oai_config` |
| Windows 闪退 | Python 3.14 或未加 PATH | 装 3.12，勾选 Add to PATH |
| pip 安装后不知道在哪运行 | pip 只装依赖，不是 GA 本体 | 先下载 GA 仓库再 cd 进去 |
| Win7 不支持 | Python 3.9+ 已放弃 Win7 | 强烈建议升级 Win10/11 |

## SOP 驱动架构详解

GA 的核心执行模型是 **SOP（标准操作程序）驱动**：

1. 用户下达任务 → Agent 在 L1 索引中匹配已有 SOP
2. 若匹配成功 → 按 SOP 步骤执行（确定性模式）
3. 若未匹配 → Agent 自主探索执行（探索模式）
4. 任务完成后 → **自动经验蒸馏**：将探索经验提炼为新 SOP 写入 L3 技能层
5. 下次同类任务 → L1 索引自动路由到已验证的 SOP

这个"探索→蒸馏→SOP→确定性执行"的闭环，实现了 Agent 行为的持续进化，全程无需人工干预。

### Skill Search 机制

- 内置技能搜索引擎，从 **105K+ 技能卡**中自动检索
- 评分优先级：高分 > 环境匹配 > 低风险
- 小步验证：检索到的 Skill 先小范围试用再全量执行
- 语义匹配对英文更友好

### 自定义 Skill Hub

- 可指定其他开源 Skill 网站或自建私有 Hub
- 支持从 Claude Code / OpenClaw 迁移已有 Skill（提取 SKILL.md + scripts/references，去除专属依赖，改写为 SOP）

## 前端接入方式

GA 支持 11 种前端接入，通过 `hub.pyw` 统一管理：

| 前端 | 说明 |
------|------|
| stapp.py | 默认 Streamlit Web UI |
| stapp2.py | Anthropic 风格浅色主题 Streamlit UI |
| wechatapp.py | 个人微信（首次扫码登录） |
| tgapp.py | Telegram 机器人 |
| dingtalkapp.py | 钉钉机器人 |
| fsapp.py | 飞书 / Lark 机器人 |
| qqapp.py | QQ 开放平台机器人 |
| wecomapp.py | 企业微信机器人 |
| qtapp.py | PySide6 桌面悬浮球 |
| reflect/autonomous.py | 自主行动反射器（30 分钟无输入自动触发） |
| reflect/scheduler.py | 定时任务调度器 + L4 会话归档 |

## 命令系统

启动后可用 `/` 命令：
`/help` `/status` `/stop` `/new` `/restore` `/resume` `/continue` `/llm [n]` — 支持所有前端
