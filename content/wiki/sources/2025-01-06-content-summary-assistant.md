---
tags: [Prompt Engineering, 内容总结, AI工具, 阅读笔记, 信息处理]
created: 2025-01-06
updated: 2026-06-13
sources:
  - raw/notes/2025-01-06-内容总结助手.md
---

# Content Summary Assistant Prompt

## 概要

A structured content summary Prompt template covering YouTube, PDF, books, articles, web pages, code, and other content types. Through a standardized step-by-step workflow and rich shortcut command system (charts, articles, quotes, flashcards, quizzes, etc.), it enables efficient transformation from raw content to knowledge products. Applicable to batch content processing scenarios within the [[AI工具与应用-扩展]] ecosystem.

## 核心内容

### Input Adaptation Strategy

| Content Type | Handling Method |
|-------------|----------------|
| YouTube link | Install subtitle extraction plugin, copy subtitle text |
| Web URL | Try direct access; if failed, ask user to paste |
| Books | Leverage model's existing knowledge |
| Code | Explain each section |
| Any text | Proceed directly to summary step |

### Summary Template Structure (~800 words)

1. **Title** — Content title
2. **Overview** — Two-sentence description of core topic
3. **Conclusion** — Localized conclusion + 6 detailed sentences
4. **Key Points** — 10 points with emoji markers, paragraph format, practical focus
5. **Localized Summary** — 10 numbered items, two sentences each
6. **Quick Action Menu** — 9 subsequent operation commands

### Shortcut Command System

- **[D]** Create chart — Mermaid LR format with auto-rendering and download
- **[A]** Convert to article — Complete Markdown article ready to copy
- **[E]** Expand summary — 2000+ word detailed multi-section summary
- **[Q]** Extract quotes — 8-20 practical quotes with timestamps
- **[C]** Generate flashcards — ~20 cards with fill-in-the-blank content
- **[Z]** Create quiz — ~20 test questions
- **[T]** Create table
- **[R]** Find more info — Use browser to search at least 4 times
- **[F]** Write FAQ

### Behavioral Requirements

- Section-by-section analysis covering all content, prioritizing recent events
- Include specific details (numbers, locations, brands) for deep understanding
- Avoid repetition, exclude irrelevant details
- If initial attempt yields no results, persist in searching different segments
- Reply in the same language the user uses

## 关键概念

- **Structured Summary Template** — Predefined 7-step output format ensuring consistency and completeness
- **Command-Driven Interaction** — User triggers subsequent deep operations via single-letter commands
- **Content Adaptation Strategy** — Different processing paths based on input type (video/web/book/code/text)
- **Localized Output** — All output automatically adapts to user language, including titles and menus

## 关联实体

- [[AI工具与应用-扩展]] — Content summary assistant is a typical application of AI tools in information processing
- [[Prompt Engineering]] — This template embodies core structured instruction design principles in prompt engineering

## 相关页面

- [[AI工具与应用-扩展]] — Closely related to the general AI tool ecosystem
- [[个人知识管理]] — Outputs (flashcards, FAQs, quotes) serve the knowledge management workflow
- [[信息获取与管理]] — Transforming raw content into structured knowledge is the core of information management
