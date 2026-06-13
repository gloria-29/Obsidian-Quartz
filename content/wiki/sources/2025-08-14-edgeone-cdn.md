---
tags: [CDN, Cloudflare, EdgeOne, Tencent-Cloud, web-hosting]
created: 2025-08-14
updated: 2025-08-14
sources: "[https://zhuanlan.zhihu.com/p/1919681354305631197]"
---

# EdgeOne: Tencent Cloud Free Global CDN

## Summary
EdgeOne is Tencent Cloud's global edge acceleration platform, offering free CDN with mainland China acceleration (requires ICP filing). Compares favorably to [[Cloudflare]] for China-focused sites. Free tier includes 1 site, unlimited requests, basic WAF, and auto SSL.

## Core Ideas
1. **China acceleration advantage**: Unlike [[Cloudflare]] (which has no mainland China nodes), EdgeOne offers full China acceleration with filed domains. For international traffic, both are comparable.
2. **No credit card required**: Email registration only; free plan is permanent (14-day trial + invite code for permanent free tier).
3. **EdgeOne Pages**: Three deployment methods - Git import (GitHub/Gitee), official templates, or direct upload. Similar to [[Cloudflare Pages]].

## Key Concepts
- EdgeOne free plan: 1 site (200 subdomains), unlimited requests for web content, basic WAF + DDoS, auto SSL
- Limitations: No large file/video/image acceleration, no SLA, no real-time logs
- Best for: Personal blogs, documentation sites, small projects with Chinese audience

## Related Pages
- [[Cloudflare]] - Primary alternative for international CDN
- [[GitHub Pages]] - Alternative static hosting
- [[Web Hosting Solutions]] - Overview of hosting options
