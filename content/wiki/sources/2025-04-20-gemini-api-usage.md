---
tags: [Gemini, API, Google, AI-tools, developer-tools]
created: 2025-04-20
updated: 2025-04-20
sources: []
---

# Gemini API Usage Differences: Free vs Advanced

## Summary
Clarifies the relationship between [[Gemini]] Advanced subscription (Google One AI Premium) and [[Gemini API]] access. Core finding: the subscription unlocks advanced models and 1M token context in consumer apps (Gemini web/app), but does NOT upgrade API rate limits. API access uses separate free/paid tiers through Google Cloud billing.

## Core Ideas
1. **Subscription vs API are separate products**: Google One AI Premium ($19.99/mo) provides Gemini 1.5 Pro with 1M token context in the chat interface, while API access (AI Studio or direct calls) uses its own tier system independent of subscription status.
2. **Rate limits unchanged by subscription**: Both free and Advanced users get 60 RPM on the free API tier. To get 600+ RPM with data privacy (no training on data), ANY user must set up Google Cloud billing for the paid API tier.
3. **Context window nuance**: Advanced users get 1M tokens in the Gemini web chat interface (a core subscription value). In AI Studio/API, ALL users (free and Advanced) can access 1M tokens on Gemini 1.5 Pro - the difference is rate limits, not context length.

## Key Concepts
- **Consumer service vs developer platform**: Consumer subscriptions and developer APIs are fundamentally separate Google product lines
- **Data privacy**: Only paid API tier guarantees data won't be used for model training
- **AI Studio**: Free web-based prototyping tool using API free tier limits

## Related Pages
- [[Gemini]] - Google's AI platform
- [[Gemini API]] - Developer API access
- [[Google AI Studio]]
- [[AI API Pricing]]
