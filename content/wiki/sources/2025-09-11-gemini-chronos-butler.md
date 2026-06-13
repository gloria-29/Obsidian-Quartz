---
tags: [Gemini, time-management, AI-agent, productivity, Chronos-Butler]
created: 2025-09-11
updated: 2025-09-11
sources: []
---

# Gemini Custom Agent: Chronos Butler Time Manager

## Summary
A personalized time management system built as a [[Gemini]] custom Gem. Uses four life domains (Working, Research, Growth, Chores) with 4-hour quotas each (16h total). The agent parses natural language commands, auto-schedules tasks based on energy levels, and provides visual quota tracking.

## Core Ideas
1. **Command protocol**: `add [task]` auto-parses duration/category (e.g., "1hG swimming"), missing info triggers approval request. `fin [task]` supports fuzzy matching. `schedule HHMM-HHMM` handles cross-day timeboxing.
2. **Energy-aware scheduling**: High-energy slots for Research and difficult Growth/Work. Medium for routine Work/Growth. Low-energy (post-meal, late night) for Chores/mechanical Work. Auto-inserts 5-10min breaks; mandatory break after 90min high-focus.
3. **Quota visualization**: After each add/del/fin, outputs a dashboard showing per-category: completed time, planned time, and gap to 4-hour target. Enables real-time "which domain needs attention" decisions.

## Key Concepts
- **Task auto-rejection**: When time is insufficient, agent "kicks out" lower priority tasks, making the hard tradeoff automatically
- **Human-in-the-loop**: Agent estimates, human approves before committing - semi-automated with oversight
- **Limitations**: Day-scope only (no cross-day dependencies, hard deadlines, task dependencies); session-based memory

## Related Pages
- [[Gemini]] - Google's AI platform
- [[GTD Time Management]]
- [[Cal Newport]] - Time blocking philosophy
- [[Deep Work]] - Focused work methodology
