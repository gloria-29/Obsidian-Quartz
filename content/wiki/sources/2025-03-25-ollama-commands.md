---
tags: [Ollama, LLM, 本地部署, 命令行]
created: 2025-03-25
updated: 2025-03-25
sources: []
---
# Ollama 常用指令总结

> Ollama 本地 LLM 运行工具的核心命令速查，涵盖模型管理、运行交互、自定义模型开发和系统服务管理。

## 核心观点
- Ollama 提供完整的命令行 LLM 管理能力：下载(`pull`)、列出(`list`)、删除(`rm`)、查看详情(`show`)、复制(`cp`)
- 支持交互式对话(`ollama run model`)和非交互式单次请求两种模式
- 通过 Modelfile 可以创建自定义模型，定义系统提示和参数
- 关键环境变量：`OLLAMA_MODELS`(自定义存储路径)、`OLLAMA_HOST`(允许局域网访问)、`OLLAMA_KEEP_ALIVE`(内存驻留时间)

## 关键概念
- [[Ollama]] — 本地运行和管理 LLM 模型的命令行工具，支持开源模型
- [[Modelfile]] — 定义模型参数和系统提示的配置文件
- [[DeepSeek-R1]] — 支持 Ollama 部署的开源推理模型
