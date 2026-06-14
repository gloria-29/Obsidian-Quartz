---
title: "[适用于deeseep-v3-0324]沉浸式翻译Prompt分享 - 开发调优 - LINUX DO"
type: source
date: 2025-04-07
source: Linux DO
source_url: https://linux.do/t/topic/533862
topics: ["工具", "工作"]
entities: ["id:1 {{imtsubsourcefield}}:...", "id:1 {{imtsubsourcefield}}:..."]
---

# [适用于deeseep-v3-0324]沉浸式翻译Prompt分享 - 开发调优 - LINUX DO

## 概要
原始链接：https://linux.do/t/topic/533862 很感谢大佬分享的提示词 ，提示词很好用，就是口语化翻译看文章不太习惯，而且提示词很长，如果需要大量翻译需求可能钱包扛不住。 所以就改了改，大量缩减了提示词内容，减少了一些口语化表达和生动语气，也尽可能贴近大佬提示词的翻译质量。 It depends on the cultivation technique and body ...

## 核心内容

### System Prompt：
- {{from}}→ {{to}},仅输出译文
- 要求:1.  符合{{to}}母语者表达习惯2.  根据语境灵活转换语气，译文传情达意3.  {{to}}受众易懂的地道表达4.  意译而非直译，专业内容保证术语准确5.  参考:
- {{titleprompt}}
- {{summaryprompt}}
- {{termsprompt}}
- {{text}}[仅输出译文，无需任何说明，注解，注释，解释]

### Prompt
- Translate {{from}}→{{to}}.  Content type: {{contenttype}}  Text: {{text}}  [Output ONLY translation, matching {{contentt

### Multiple Prompt：
- Translate &quot;{{imtsourcefield}}&quot; fields in YAML to {{to}}{{htmlonly}}. Keep field names.Input:
- &lt;yaml&gt;
- {{yaml}}
- &lt;/yaml&gt;
- Format example:
- id: 1{{imtsourcefield}}: translatedtext

### Subtitle Prompt：
- Translateall &quot;{{imtsubsourcefield}}&quot; values in this YAML to {{to}}{{htmlonly}}:
- &lt;yaml&gt;
- {{yaml}}
- &lt;/yaml&gt;
- Format rules:1. Keep original YAML structure2. Only modify {{imtsubsourcefield}} values3. Return translated YAML without
- Example:

## 关键概念

## 关联实体

## 相关页面
