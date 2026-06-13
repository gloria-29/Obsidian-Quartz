---
标题: [适用于deeseep-v3-0324]沉浸式翻译Prompt分享 - 开发调优 - LINUX DO
笔记 ID: 01960fb3-1f71-7e0e-b119-52071524f14d
笔记类型: crawl
tags:
    - 生活/电子工具
卡片盒:
    - 工作
包含语音: 否
网页链接:
创建时间: "2025-04-07T18:01:59"
更新时间: "2026-03-04T20:27:40.150"
---

原始链接：[https://linux.do/t/topic/533862](https://linux.do/t/topic/533862)

[赤坂龍之介](/u/chiban)[chiban](/u/chiban)浴火重生

由这位大佬的提示词改进而来

很感谢大佬分享的提示词 ，提示词很好用，就是口语化翻译看文章不太习惯，而且提示词很长，如果需要大量翻译需求可能钱包扛不住。  
所以就改了改，大量缩减了提示词内容，减少了一些口语化表达和生动语气，也尽可能贴近大佬提示词的翻译质量。

测试样例：  
**修仙评论**  
1.

It depends on the cultivation technique and body physique. Many cultivation methods require abstinence and temperence in order to reach a high realm. Like there is the &quot;Primal Yin/Primal Yang&quot; which boost cultivation when cultivators remain a virgin. &quot;Dual Cultivation&quot; methods are often used by Demonic Path Scum, those guys use cauldrons leading to widescale deaths.
The Righteous Path requires tempering your iron will and avoiding temptations to further and defend the dao from hedonistic impulses of the Demonic path. So nudist sects are often demonic in nature.
Not to mention that clothes don&#39;t necessarily become useless at high levels. Alchemy and artifacts exists, and the clothes of cultivators are often enchanted or straight up armors that can help you survive or make life convenient. Wearing them often allows you to infuse them with your Dao aura and gradually strengten them in some cases(like how in Emperor&#39;s Domination an ordinary spoon often used by high level cultivators will become artifacts that can be used by descendants as a trump card, as their immortal aura gets stored up and they become weapons themselves).

**国际新闻**  
2.

The challenges are now multifold for businesses with supply chains rooted in China, which are left scrambling as they face not only the unexpectedly high US levies on Chinese imports, but also on other Asian countries due to Trump’s broad-based tariffs.
The tariffs also come at a tough time for China’s own slowing economy, with officials in recent weeks ramping up efforts to spur weak domestic consumption as they braced for the widening trade war.
Larry Hu, chief China economist at Macquarie Group, wrote in a Thursday research note that Trump has effectively raised the average US tariff rate on Chinese products to 69%. That’s because the average rate on Chinese goods was already at 15% when Trump took office in January, he said.
Hu estimates that the current escalation could shave up to 2.5 percentage points off China’s economic growth for this year. China is aiming to grow its economy by around 5% in 2025.
“The impact could manifest itself through multiple channels such as falling US demand for Chinese goods, the potential global economic slowdown and the hit on export re-routing,” Hu wrote.
Export re-routing refers to the practice of exporting goods that were previously imported into a country to another place without significant processing. Countries in Southeast Asia and Latin America were part of this trend during Trump’s first term when China tried to mitigate the impact of tariffs imposed at that time.
This story has been updated with additional reporting and context.

3.文章标题  

  
**翻译结果**：  
原贴：  
  

本贴：  

  
  
以上皆为deepseek-v3-0324在0.3的温度下的翻译测试，测试结果具有随机性

沉浸式翻译提示词：

## System Prompt：

{{from}}→ {{to}},仅输出译文
要求:1.  符合{{to}}母语者表达习惯2.  根据语境灵活转换语气，译文传情达意3.  {{to}}受众易懂的地道表达4.  意译而非直译，专业内容保证术语准确5.  参考:
{{title_prompt}}
{{summary_prompt}}
{{terms_prompt}}
待译:
{{text}}[仅输出译文，**无需任何**说明，注解，注释，解释]

## Prompt

Translate {{from}}→{{to}}.  Content type: {{content_type}}  Text: {{text}}  [Output ONLY translation, matching {{content_type}} format]

## Multiple Prompt：

Translate &quot;{{imt_source_field}}&quot; fields in YAML to {{to}}{{html_only}}. Keep field names.Input:
&lt;yaml&gt;
{{yaml}}
&lt;/yaml&gt;
Format example:
id: 1{{imt_source_field}}: translated_text
Return ONLY translated YAML.

## Subtitle Prompt：

Translateall &quot;{{imt_sub_source_field}}&quot; values in this YAML to {{to}}{{html_only}}:
&lt;yaml&gt;
{{yaml}}
&lt;/yaml&gt;
Format rules:1. Keep original YAML structure2. Only modify {{imt_sub_source_field}} values3. Return translated YAML without &lt;yaml&gt; tags
Example:
Input:
- id:1 {{imt_sub_source_field}}:...
Output:
- id:1 {{imt_sub_source_field}}:...

---

---

bb几句：  
V3貌似对于Prompt更偏向与遵守中文的Prompt，为了节省tokens尝试过 一词/一段/全部 转换成英文，翻译效果直线下滑，所以在系统提示词里不得不使用中文，并且为了防止新版V3翻译不遵循Prompt莫名其妙出现译文说明、要么就是出现一大段注释，而重复了两遍**仅输出译文**和**Output ONLY translation**，再加了一句**无需译文说明**，基本解决了这个问题 还不听话就再重复几遍  
翻译要求扔到了System Prompt，其他的去掉了只剩下默认的输出结构要求，改成英文节约tokens。每次请求最大段落数设为1以上后也不会出现两段译文莫名其妙挤在一段的问题。
