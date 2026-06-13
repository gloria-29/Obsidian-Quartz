---
created: 2026-05-02
title: "Deepseek V4 is mindblowing"
source: "https://www.reddit.com/r/opencodeCLI/comments/1szneiq/deepseek_v4_is_mindblowing/?share_id=nlT1ITvJSqQPse63hhXhe"
author:
  - "[[AngelicBread]]"
description: "I've been having an amazing time using v4. I started out with pro and it genuinely feels like a perfectly capable frontier model. I spent 50"
---
# Deepseek V4 is mindblowing

# 阅读笔记：DeepSeek V4 评价与使用经验

## 主要观点
- DeepSeek V4（尤其是 Flash 版）因极低费用和高效能被广泛称赞，尤其在大模型推理和子代理循环中表现出色。
- 用户普遍指出，使用 V4 的成本极低，例如 5 美元可获得数小时的高强度使用，远低于同类模型（如 GPT-4、Claude）的费用。

## 关键见解
- **模型效率**：V4 在 token 生成上所需 FLOP 更少，KV 缓存占用更少内存，适合长上下文和高并发场景。
- **社区对比**：多数用户认为 V4 在推理、规划和代码生成上优于 Kimi K2.6、GLM 5.1，但对代码可读性和抽象层次仍有争议，部分人偏好 GLM 5.1 或 Kimi。
- **成本与定价**：大部分用户通过 DeepSeek 官方 API 或 OpenCode Go 计划获得折扣，实际支出往往远低于宣传的“每小时几十美金”。有用户指出在 30 分钟内花费 2.5 美元，或 5 美元即可使用 4 小时，显示出极高的性价比。

## 重要细节
- **使用场景**：规划（使用 Pro 版）+ 构建（使用 Flash 版）是常见组合；在大代码库（>1M 行）中，即使上下文窗口接近上限，费用仍保持可控。
- **上下文管理**：多数用户建议使用短会话或频繁刷新上下文，以避免 token 消耗激增；上下文长度超过 200k 时成本显著上升。
- **错误与局限**：部分用户报告模型在子代理委派任务时出现幻觉或未能正确读取输出；也有用户指出模型在特定硬件（如华为芯片）上仍在优化中。
- **社区资源**：OpenCode CLI 及其插件生态提供了模型选择、缓存、插件和提示工程的最佳实践，帮助用户最大化性能与成本控制。

## 结论与建议
- DeepSeek V4 是目前性价比最高的大模型之一，适合需要大量推理、长上下文和低延迟的开发场景。
- 为获得最佳体验，建议：
  1. 使用官方 API 或 OpenCode Go 计划以获取折扣。
  2. 合理规划会话，避免不必要的上下文累积，保持 token 消耗在可控范围。
  3. 结合其他模型（如 Kimi、GLM）根据任务需求灵活切换，以弥补 V4 在代码可读性或特定子任务上的不足。
  4. 关注社区更新，关注模型在新硬件（如华为芯片）上的优化进展。

---

# 原文内容

I've been having an amazing time using v4. I started out with pro and it genuinely feels like a perfectly capable frontier model. I spent 50 cents for an hour of very heavy use.

Then I decided to checkout flash for the speed gains. I'm speechless. When setting the thinking to max, it feels extremely capable and it's lighting fast. But that's table stakes at this point. What blew my mind is that it cost me only 5 CENTS for 4 whole hours of heavy heavy use that incorporated intensive subagent loops.

I'm genuinely not understanding the lack of market reaction happening right now. My theory is that people feel like they overreacted to R1 and now they're less jumpy. But I'm left wondering how a trillion dollar industry is gonna justify such premiums when you can let it rip on like a cent an hour with an open source harness like opencode.

Edit: Also, I'm on opencode go, so I'm not even getting the massive deepseek discount.

---

## Comments

> **xenydactyl** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj31aqe/) · 42 points
> 
> I don't think deepseek v4 pro is at GPT 5.4/5.5 level yet in terms of capability. R1 was pretty much on the o1 level (back then it was basically only chat interface anyway). v4 pro is a very, very amazing model and a huge win for the open-weight community, but for coding, I found that Kimi K2.6 is still better. Some people feel like v4 pro is undertrained which aligns with my experience. Deepseek really delivered in model efficiency in terms of compute needed to run that model. KV cache uses \*a lot\* less ram than other models (afaik) and token generation needs fewer flops per token. It's still a preview, I think future checkpoints will be amazing.
> 
> > **AnonymousVendetta04** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj3g547/) · 12 points
> > 
> > I find kimi to overthink a lot lol
> > 
> > > **\_\_\_\_\_TC\_\_\_\_\_** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj46vca/) · 5 points
> > > 
> > > I’ve seen it get lost down crazy rabbit holes, looking completely hopeless, then finally get its shit together right before I was about to stop it.
> > > 
> > > **CryinHeronMMerica** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj79d6z/) · 3 points
> > > 
> > > Good to know. I'll treat it like a Claude model!
> > > 
> > > On the other hand, GLM5.1 did a solid job of executing. Maybe that's the open equivalent of a GPT model?
> 
> > **AngelicBread** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj31jdv/) · 6 points
> > 
> > I totally respect your opinion and experience with the model, but I've found it to far surpass Kimi K2.6 for my coding needs when running on max thinking. Same with GLM 5.1. I wonder if there are some kinks being ironed out with how it's being served.
> > 
> > > **Turbulent\_Force\_9850** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj3311c/) · 5 points
> > > 
> > > yep, I think v4 pro is better than kimi2.6
> > > 
> > > **xenydactyl** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj31v4p/) · 4 points
> > > 
> > > Are you using it with the deepseek api, openrouter or opencode go sub? I would love to use that model but yeah, no luck so far.
> > > 
> > > **degenbrain** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj35ghz/) · 3 points
> > > 
> > > I am with you. I like the way DS 4 thinking. And the solution is straightforward. Especially in Flash in term of pricing. I can use Opencode Go without worrying about the limit.
> 
> > **debackerl** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj3lsmd/) · 3 points
> > 
> > Exactly, I now use DeepSeek v4 (Flash) and Kimi K2.6, they're great and fast. MiniMax M2.7 isn't that good for its size, and GLM 5.1 is quite slow.
> > 
> > **retardedGeek** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj32nzg/) · 2 points
> > 
> > How do you stop kimi's hallucinations?
> > 
> > > **xenydactyl** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj33626/) · 3 points
> > > 
> > > It doesn't hallucinate for me.

> **Uzeii** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj35nzb/) · 15 points
> 
> Kimi k2.6 or glm 5.1 or deep seek v4 pro?
> 
> > **SynapticStreamer** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj4ijxp/) · 11 points
> > 
> > I've jumped to DS v4 after a single day of use.
> > 
> > The savings justify any issues I may have now or in the future.
> > 
> > **cutebluedragongirl** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj3teau/) · 6 points
> > 
> > Kimi K 2.6 for sure
> > 
> > **xenydactyl** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj3gfe9/) · 5 points
> > 
> > kimi k2.6 > glm 5.1 > deepseek v4 pro
> > 
> > for me. Kimi just seems to be a very good allrounder, very much sonnet like. No wonder cursor used the 2.5 model for their model, kimi models are great at coding.
> > 
> > > **Jaded\_Jackass** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj3p4vx/) · 9 points
> > > 
> > > Bro what are you all on about? In reasoning I have found
> > > 
> > > GLM 5.1 > DeepSeekv4 pro > kimi 2.6 > DeepSeekv4 flash
> > > 
> > > What I daily drive as main agent is v4 flash and then if its stuck at some problem for some iterations the compact the convo and use glm5.1 it always founds the bug for me some how bu it's too too slow to use as main agent for normal work hence this

> **Emotional\_Note\_2557** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj345bu/) · 27 points
> 
> I heard everyone saying it costs only x cents for "hours of heavy use" so I tried by myself and... I don't know what you guys call heavy use but it costed me 10$ in a single day using deepseek v4 flash
> 
> > **VirginSuricate** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj35fdy/) · 18 points
> > 
> > I don't know how you did, I tried for hours yesterday and at the end it costs 0.30$ for 30M tokens
> > 
> > > **Holiday\_Dragonfly888** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj3j123/) · 6 points
> > > 
> > > Depends on codebase size I guess. When you are working on larger codebases like 1m+ loc 30M is nothing. We burn over a billion tokens a week on gpt per developer at my workplace
> 
> > **iamalexs** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj3q0n2/) · 4 points
> > 
> > The model has a 1M context window. You gotta manage that. Once it reaches 200k, things start to get pricy
> > 
> > > **AngelicBread** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj3tpap/) · 5 points
> > > 
> > > Could you elaborate? I didn’t know the context load influence token consumption rate. Is that what you’re saying?
> > > 
> > > EDIT: Just did some searching and I’ve learned that each request is stateless and requires reviewing the stored context. Thanks for the heads up.
> > > 
> > > This tracks, because I never really get over 200k. Most of the time I’m hovering around 40-80k, as I switch sessions for most tasks. I find a fresh session gives the best results.
> > > 
> > > **Emotional\_Note\_2557** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj3s22v/) · 3 points
> > > 
> > > I'm pretty sure I let the context window grows, it must be it. So be careful guys
> 
> > **Emotional\_Note\_2557** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj354u8/) · 4 points
> > 
> > I needed to refactor the architecture of a python app that was 20k lines of codes into another architecture. I was already 25% done when I started using deepseek and the end result was correct, I'm not disappointed with the work.

> **Ok-Airline-3766** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj3ipvk/) · 6 points
> 
> From my personal experience, I found GLM 5.1 better than both Kimi 2.6 and Deepseek 4 Pro. DS generated code has so much abstraction and is very difficult to read. At least on code quality wise, DS just couldn't compete with GLMs results. I haven't used Kimi for long, but last time when I used it I found it forgets my prior instructions sometimes and treated supermemory system prompts as I wanted to save things to supermemory (Provider/Zen problem?). GLM is just a bit more expensive and the context window isn't as big as DS. I found DS relatively good at making plans though thanks to its big context window

> **Away-Sorbet-9740** · [2026-05-01](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj96hsf/) · 3 points
> 
> Yeah I was thinking the same thing. Flash v4 is one of the most competent workers I've used, and it's cheaper than tap water.
> 
> I did a sprint with it, and had opus as manager. While it's fast, I was more blown away by the cost. Where this would have been a $3ish GLM5.1 call, or a $9-10 sonnet4.6 call, flash v4 was $.24...... and it made only two deviations from the task list, documented why extremely well (was the right call).
> 
> I had been using Gemini flash 3.0 and 3.1 for swarm mechanics and mechanical tasks. Flash v4 realistically just wiped out the need for like 1/2-2/3 of my orchistration 😂. It will stay as fallback logic, but I don't get why nobody is talking about this. If you have spare pocket change you can knock a project out.

> **zero-qro** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj3c5jt/) · 2 points
> 
> I'm testing for a few days now. I use Pro Max to plan and Flash Max to build and it has been very good... The only issue is the speed bc it takes longer than other models to respond, but nothing terrible. Totally worth it

> **look** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj4zt8k/) · 2 points
> 
> I really like the Flash model, but I think the Pro model is good but meh compared to other options. A combo of Mimo 2.5 Pro, GLM-5.1, and Kimi 2.6 is an improvement over it in pretty much any workflow.
> 
> Maybe 4.1 Pro will be worth all the frenzy, if they can tighten up the reasoning token usage and make a dent in its comically bad hallucination rate.
> 
> > **Looz-Ashae** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj5k5xn/) · 3 points
> > 
> > Mimo 2.5 got really nice in comparison to plain v2 

> **Euphoric\_Addendum424** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj6aly2/) · 2 points
> 
> Same Experience, heavy use of V4 Flash for almost 2 days (+70 requests) Cost? 65 cents! Also used glm 5.1 for 3 tasks flash couldn't do, costs 1.7 I'm totally happy with opencode go also, used antigravity+copilot pro for 2 months. Definitely keep using opencode if they keep the same service!

> **dragonfly\_overfly** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj791pb/) · 2 points
> 
> Yes, it certainly is. But somehow it costs less when used with deepseek's direct api than deepinfra etc providers. We used around 250M tokens in a day and it cost around 2.5$ - fixed lot of things in some of our projects, compare that to 54M tokens used over a month on claude Max plan to get almost nothing done perfectly (we ultimately cancelled claude max).
> 
> Opencode go users, does it work good with Kilocode, considering its mainly for discount? But opencode windows desktop harness itself crashes a lot, hope thats not the case when we are using go plan via api in Vscode?

> **MysteriousLion01** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj3twzu/) · 2 points
> 
> Moi je l'ai fait travailler sur opencode avec le plugin get-shit-done et il a terrassé tout les bugs. Avec nemotron, bigpickle et minimax ça n'avançait pas.

> **Tourist\_in\_Singapore** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj3288k/) · 1 points
> 
> I haven’t checked. Is it on Zen yet?

> **ByteNomadDrifter** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj3lsvj/) · 1 points
> 
> Can you please share some work you did with DeepSeek?

> **Classic\_Television33** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj46ljm/) · 1 points
> 
> Do you work on backend tasks? I'm still doubting how much hallucination it can be since the previous Deepseek generations were really high...

> **4SubZero20** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj4a353/) · 1 points
> 
> I'm still new to opencode and the go subscription in general (only have had the sub for a week or so). Can anyone please tell me if the DeepSeek discounts apply to opencode-go users as well, or must it be via the DeepSeek API?
> 
> I ask because the Kimi K2.6 3x usage promotion is bith on the opencode website and tooling, yet I haven't seen a thing for DeepSeek.

> **FormalAd7608** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj4egw2/) · 1 points
> 
> And Qwen 3.6 Plus? Any opinions?

> **Dimentio233** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj4h8mn/) · 1 points
> 
> is v4 served by zdr providers currently? I heard mixed things

> **MrScotchyScotch** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj4l2vz/) · 1 points
> 
> "I spent 50 cents for an hour of very heavy use"
> 
> I spent $2.50 in 30 minutes. Am I extremely heavy?
> 
> > **SirApprehensive7573** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj6xq82/) · 1 points
> > 
> > Same thing for me.
> > 
> > I work with big codebases, and I always spend more than the prople that say that just spent “50 cents per hour”.
> > 
> > I spent 97 cents on Kimi K2.6 in just 32 minutes on openrouter

> **SkilledHomosapien** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj4xci2/) · 1 points
> 
> How many token did you burn? How many request did you raise? As a heavy user, I burn 400M token on average per day with 2k+ requests, FYI.
> 
> > **Looz-Ashae** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj5k96l/) · 1 points
> > 
> > 400m? Wtf are you doing
> > 
> > **After\_Teacher3830** · [2026-05-01](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/ojcqj2c/) · 1 points
> > 
> > haha how

> **Logical-Idea-1708** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj5mfi0/) · 1 points
> 
> What’s the pricing model on the discount plan? Subscription? Per million token?

> **ddxkalin** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj6espw/) · 1 points
> 
> In comparison with Kimi k2.6 what do you think?

> **Ok\_Supermarket3382** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj6ujfk/) · 1 points
> 
> I feel like they are suppressing reactions. I think they’re trying to downplay or take attention away from the fact the model runs on huawei chips. It’s the main reason they took so long to release the model. The papers have been out for a while but they had to get it workn on chinese chips.

> **ghostnation66** · [2026-05-01](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj92c8n/) · 1 points
> 
> How do you get a massive deepseek discount?

> **NickeyGod** · [2026-05-01](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/ojbccwx/) · 1 points
> 
> Funny i have a very different experience with it. It's hallucinating a lot and also blindly assumes things that don't exist. It also does not work well with subagent delegated tasks and does not read their output corretly. GLM 5.1 on the other hand executes this stuff on near Opus level. Maybe that's only my experience.

> **CuriosityForge** · [2026-05-01](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/ojce7m3/) · 1 points
> 
> After your post, tried this, and yeah, I think it's better. You can work longer with these two models of deepseek  
> I wouldn't say the quality is the best, but it can finally get there after some prompting to and fro. So yeah, I've been using it for a while, and I still have some usage left, so that's a good thing
> 
> Thanks

> **bingeboy** · [2026-05-01](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/ojemp1h/) · 1 points
> 
> Is this why NVDA dumped?
> 
> > **AngelicBread** · [2026-05-01](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/ojenmpn/) · 1 points
> > 
> > Probably. Deepseek v4 was trained on Huawei GPUs.

> **pashlya** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj30cil/) · 1 points
> 
> Yes, it is, until it breaks down. It’s something on the Opencode side, I believe.
> 
> > **Maleficent-Movie-625** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj30pjj/) · 2 points
> > 
> > Using it via the deepseek platform itself works well for me at least
> > 
> > **mWo12** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj3xkqn/) · 1 points
> > 
> > The bug has been recently fixed. Have you updated your opencode?

> **Popular-Penalty6719** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj3y6mc/) · 0 points
> 
> Same here, Deepseek V4 with Opencode Go. Amazing combo! Sometimes I also use Kimi K2.6, depending on the task but I think for reasoning and brainstorming, or research Deepseek V4 is better.
> 
> > **ng501kai** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj642r1/) · 0 points
> > 
> > how do you use Deepseek v4 on openclaw? i always get the error

> **l2vpnvpls** · [2026-05-01](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj8p18m/) · 0 points
> 
> Why i suddenly sees posts about Deepseek everywhere? Doesn't seem to be organic.
> 
> > **After\_Teacher3830** · [2026-05-01](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/ojcqq7w/) · 1 points
> > 
> > They released a new model.

> **Middle-Ad7418** · [2026-04-30](https://reddit.com/r/opencodeCLI/comments/1szneiq/comment/oj3c38w/) · \-5 points


# 高亮内容

- 