---
tags: [NotebookLM, 本地部署, LLM, Docker, 知识库, 文档问答]
created: 2025-01-20
updated: 2026-06-13
sources:
  - "raw/notes/2025-01-20-自建本地NotebookLM服务方案比较.md"
---

# 自建本地 NotebookLM 服务方案比较

## 概要

系统性比较自建类 Google NotebookLM 服务的多种开源方案，从部署简易度、Docker 支持、硬件配置要求三个维度进行分类。重点面向硬件资源有限的用户，推荐 chatgpt-document-qa 为首选方案，Llama.cpp 为备选方案。

## 核心内容

### 最简方案（有预构建 UI 和 Docker）

- **chatgpt-document-qa**：基于 langchain + gpt3.5/chatglm3，streamlit WebUI，Docker 一键部署，CPU 可运行，4GB 内存起步。优势：部署最简、硬件要求最低
- **privateGPT**：注重隐私的本地文档问答，无需联网，Docker 部署，CPU 可运行，8GB 内存起步。适合对数据安全要求高的场景
- **AnythingLLM**：桌面应用，docker-compose 一键部署，CPU 可运行，8GB 内存起步

### 较简方案（需配置，有 Docker）

- **FastChat + Ollama + langchain + streamlit/Gradio**：组件灵活组合，各组件均有 Docker 镜像，可根据需求选择不同模型和 UI

### 较复杂方案（手动配置）

- **Llama.cpp + langchain + streamlit/Gradio**：C++ 实现的 LLaMA 运行库，效率高、硬件要求最低，但需自行编译和配置，Docker 可能需自行构建

### 硬件配置排序

| 等级 | 方案 |
|------|------|
| 最低 | Llama.cpp 组合、chatgpt-document-qa、privateGPT |
| 较低 | FastChat + Ollama 组合 |
| 较高 | 使用 13B+ 大模型或 GPU 加速时 |

### 操作建议

模型选择参考 Hugging Face，优先选 ggml/gguf 格式适配 Llama.cpp/Ollama；部署后先用少量文档测试性能和资源占用；根据结果调整量化级别和配置。

## 关键概念

- **本地化文档问答**：在本地设备上对自有文档进行 AI 问答和总结，无需上传到云端
- **ggml/gguf 格式**：量化后的模型格式，大幅降低内存需求，适配 CPU 推理
- **streamlit/Gradio**：Python Web UI 框架，快速为 AI 模型构建可视化界面
- **Docker 一键部署**：通过容器化简化依赖管理和环境配置

## 关联实体

- [[NotebookLM]] — Google 提供的 AI 笔记和研究助手
- [[LangChain]] — LLM 应用开发框架
- [[Llama.cpp]] — 高效本地 LLM 推理引擎
- [[PrivateGPT]] — 隐私优先的本地文档问答系统

## 相关页面

- [[开源NotebookLM替代品]]
- [[AI记忆方案]]
- [[技术与服务器部署]]
