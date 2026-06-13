---
tags: [Obsidian, database, PKM, tutorial, Bases]
created: 2025-09-24
updated: 2025-09-24
sources: "[https://forum-zh.obsidian.md/t/topic/53088]"
---

# Obsidian Bases Tutorial: Dynamic Note Filtering

## Summary
A step-by-step tutorial for [[Obsidian]]'s Bases (database) feature (v1.9.10). Demonstrates how to create a Base that dynamically shows notes from the same folder as the currently active note, using the filter formula `file.inFolder(this.file.folder)` with the `this` context variable.

## Core Ideas
1. **Filters and Properties as core concepts**: Filters define display conditions; Properties include both frontmatter and implicit metadata (file path, folder). The key insight: "too much information equals zero information" - filters must be specific.
2. **The `this` context variable magic**: `this` refers to the currently active file when the Base is in the sidebar or split pane. This dynamic context enables "show notes in the same folder as whatever I'm currently viewing" without manual filter changes.
3. **Formula-based filtering**: Start with GUI filter builder (`file | in folder`), then switch to advanced formula mode (`</>` button) to replace hardcoded paths with `this.file.folder` for dynamic behavior.

## Key Concepts
- **Base as table + filter**: Default Base shows all vault files; filters narrow to relevant subset
- **`this.file.folder` pattern**: `this.file` gets the active note's file object, `.folder` extracts its directory
- **Sidebar placement required**: Dynamic `this` context only works when Base is moved to sidebar/right panel

## Related Pages
- [[Obsidian]] - Knowledge management tool
- [[Personal Knowledge Management]]
- [[Obsidian Plugins and Features]]
