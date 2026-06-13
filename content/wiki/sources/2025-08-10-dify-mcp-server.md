---
tags: [Dify, MCP, Claude-Desktop, Cursor, AI-tools, integration]
created: 2025-08-10
updated: 2025-08-10
sources: "[https://docs.dify.ai/zh-hans/guides/application-publishing/publish-mcp]"
---

# Deploy Dify Apps as MCP Servers

## Summary
Dify supports deploying applications as [[MCP]] (Model Context Protocol) servers, enabling integration with [[Claude Desktop]] and [[Cursor]]. Each Dify app generates a unique MCP server URL for external AI tools to call. Configuration is straightforward with JSON-based setup.

## Core Ideas
1. **MCP server URL as API key**: The generated MCP address contains sensitive authentication info and should be treated like an API key. Regeneration invalidates the old address immediately.
2. **Claude Desktop integration**: Profile > Settings > Integrations > Add Integration, then paste the MCP server URL.
3. **Cursor integration**: Create/edit `.cursor/mcp.json` in project root with server name and URL. Supports multiple Dify apps via multiple server entries.

## Key Concepts
- **Description clarity**: AI-oriented tool descriptions should be detailed (e.g., "JSON object containing user name, email, and preferences" rather than "input data")
- **Latency management**: If Dify app processing exceeds 30 seconds, add progress indicators or split into smaller steps

## Related Pages
- [[MCP]] - Model Context Protocol
- [[Dify]] - LLM application platform
- [[Claude Desktop Integration]]
- [[Cursor AI]] - AI code editor
