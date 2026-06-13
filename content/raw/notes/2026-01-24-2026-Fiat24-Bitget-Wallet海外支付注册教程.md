---
标题: 2026 Fiat24 Bitget Wallet海外支付注册教程
笔记 ID: 019beee6-7627-78f2-9862-403f184aa995
笔记类型: crawl
tags:
    - 财富/支出管理
卡片盒:
    - 财富
包含语音: 是
网页链接:
创建时间: "2026-01-24T15:27:19.591"
更新时间: "2026-03-03T00:03:12.938"
---
![录音](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/files/019beee6-6805-7c51-a368-18dcda463a2e.md#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20260124%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20260124T072719Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;261e7195937e3bbd533b2f4680e364c2deed802f7480fb688e5adb278b226fad&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

# 2026版「海外支付」Fiat24注册教程

[Original link](https://linux.do/t/topic/1495502)

1.  **关键注册条件**
    
    -   2026年1月23日起需使用 **护照** 认证，不再支持身份证开卡。
    -   注册时避免特殊网络环境（如VPN），且需选择 **中国大陆地区**，否则可能触发地址验证（dcs）。
    -   开卡免费，但需钱包内预存 ≥10 USDC（非开卡费，用于账户激活）。
2.  **注册流程**
    
    -   **下载 Bitget Wallet**：建议通过社交账号（Google/Apple）登录，防止私钥丢失。
    -   **申请 Fiat24 账户**：在钱包内选择「银行卡」→「中国大陆」→「立即申请」，完成基础注册后点击「去认证」。
    -   **KYC 认证**：使用护照填写个人信息，通过 **Read ID Ready APP** 验证身份；若被拒，可能因姓名拼音涉及制裁名单。
    -   **激活银行卡**：充值 ≥11 USDC（仅支持 Arbitrum 链），点击「去激活」并启用 Direct Pay 功能（优先扣款币种选 USD）。
3.  **使用场景与限制**
    
    -   **支持场景**：
        -   绑定 Apple Pay/微信/Alipay（单笔≤3,000元，月累计≤5万，年累计≤60万；超200元收3%手续费）。
        -   订阅海外服务（ChatGPT/X/YouTube/美区 App Store 等），可套用 PayPal 或美区账单地址（参考教程提供模板）。
        -   出入金至港卡或券商（如盈透/嘉信）。
    -   **货币支持**：USD/EUR/CHF/CNY，启用 Direct Pay 避免外汇手续费。
4.  **返现与补贴**
    
    -   **首笔消费返现5美元**：需通过 AFF 链接注册（私信获取），返现于消费后下周四发放至奖励账户。
    -   **零手续费补贴**：Bitget Wallet 补贴 1% USDC 充值手续费及汇率差，返现时返还。
    -   **异常处理**：返现未到账可提交工单，文案参考：“首笔返5u活动未发放，请核实”。
5.  **常见问题（QA）**
    
    -   **有效期续卡**：卡过期前半年内有消费记录可自动续卡。
    -   **支付失败处理**：
        -   ChatGPT 绑定失败需切换高质量美国节点，并填写真实账单地址。
        -   GPT Plus 首月免费支付可切换法国节点 + PayPal 组合。
    -   **Gas 费**：充值需 Gas 费时可私信作者获取免费支持（仅限 Arbitrum 链）。
    -   **Safepal vs Bitget Wallet**：二者卡种二选一（特殊情况下可双开），Bitget Wallet 返现活动更友好。
6.  **其他注意事项**
    
    -   **资金安全**：Fiat24 为合规 Web3 钱包，适合支付中转，不建议长期存放大额资金。
    -   **USDC 获取**：可通过币安/欧易 C2C 交易或港卡直接购买。

## 由 Ling\_Jing 发布于 3 天前

[![](https://linux.do/user_avatar/linux.do/ling_jing/96/1438098_2.png)](https://linux.do/u/ling_jing)

&gt; 本教程仅限于开通各种订阅，其他涉及的部分请谨慎探索

&gt; 注册过程中不建议使用特殊网络环境

&gt; 有问题先看底下的 QA 区

&gt; 现在开卡需要护照

## [](https://linux.do/t/topic/1495502#p-12896604-h-1)前情提要

&gt; -   [「快讯」Fiat24 于 2026 年 1 月 23 日 17 点开始停止身份证开卡](https://linux.do/t/topic/1464886)
&gt; -   BitgetWallet 更新了 2026 版新 UI，所以进行教程重置
&gt; -   加上原贴的编辑时间过期了，始皇似乎有一点点忙，到现在还没有回复

## [](https://linux.do/t/topic/1495502#p-12896604-h-1-fiat24-2)1\. Fiat24 介绍

-   大陆用户线上免费开通，没有年费或管理费
-   附带一个与你同名的欧洲 &#96;IBAN&#96; 账户
-   支持绑定微信支付宝在内地消费
-   也支持订阅海外服务，比如 &#96;ChatGPT&#96;、&#96;X/Twitter&#96;、&#96;YouTube&#96;
-   卡 bin：&#96;548108&#96;，隶属于 &#96;美国🇺🇸&#96;

&gt; 对背景感兴趣，可以看另一个佬友的调研

## [](https://linux.do/t/topic/1495502#p-12896604-h-2-3)2\. 下载并创建钱包

链接：[Bitget Wallet](https://web3.bitget.com/)

[![image](https://linux.do/uploads/default/optimized/4X/5/6/9/5691c50f666c04d4122b25a344d9c830efe54b96_2_690x364.jpeg)](https://linux.do/uploads/default/original/4X/5/6/9/5691c50f666c04d4122b25a344d9c830efe54b96.jpeg &quot;image&quot;)

&gt; 若无相关知识，请选择社交登录的方式创建钱包（如谷歌 / Apple 等），防止丢失

## [](https://linux.do/t/topic/1495502#p-12896604-h-3-fiat-24-iban-4)3\. 注册 Fiat 24 瑞士 IBAN 账户

1）在 Bitget Wallet 的 &#96;钱包&#96; 页面，选择 &#96;银行卡&#96;，  
2）左下角选择 &#96;中国大陆&#96;，点击 &#96;立即申请&#96;，注册 &#96;Fiat 24&#96; 账户，注册后点击 “去认证”；

&gt; 钱包内资金要求为 &gt;&#61;10$，但这并非开卡费，目前开卡免费

&gt; 如果出现 &#96;dcs&#96; ， &#96;地址证明&#96; 等字样，就是你选错地区，或者挂错 ip 了
&gt; 
&gt; [![image](https://linux.do/uploads/default/optimized/4X/f/8/6/f8664389434e958e43bcc0808edc0ddbc9a8db5b_2_239x375.jpeg)](https://linux.do/uploads/default/original/4X/f/8/6/f8664389434e958e43bcc0808edc0ddbc9a8db5b.jpeg &quot;image&quot;)

[![image](https://linux.do/uploads/default/optimized/4X/c/0/2/c02daddd198bc56a4ba203fd5fb41b6be0ee5a5b_2_690x434.jpeg)](https://linux.do/uploads/default/original/4X/c/0/2/c02daddd198bc56a4ba203fd5fb41b6be0ee5a5b.jpeg &quot;image&quot;)

## [](https://linux.do/t/topic/1495502#p-12896604-h-4-fiat24-5)4\. 进入 &#96;Fiat24&#96; 登录页面

-   根据提示点击对应按钮，使用 &#96;护照&#96; 进行认证

[![75a34b27a0460ba3f3f406c421341631](https://linux.do/uploads/default/optimized/4X/f/4/3/f43d5955fbf7753b1185400b6335ea76c2cb5e7f_2_690x462.jpeg)](https://linux.do/uploads/default/original/4X/f/4/3/f43d5955fbf7753b1185400b6335ea76c2cb5e7f.jpeg &quot;75a34b27a0460ba3f3f406c421341631&quot;)

## [](https://linux.do/t/topic/1495502#p-12896604-h-5-6)5\. 如实填写你的个人信息

-   点击 &#96;Next&#96;，填写你的邮箱账号，选择 &#96;Submit&#96; 提交；

[![image](https://linux.do/uploads/default/optimized/4X/8/b/6/8b630e068b66205c3439f2f1e73dbcb9cda1a046_2_577x500.jpeg)](https://linux.do/uploads/default/original/4X/8/b/6/8b630e068b66205c3439f2f1e73dbcb9cda1a046.jpeg &quot;image&quot;)

  

[![image](https://linux.do/uploads/default/optimized/4X/c/a/3/ca34da6c649138efbf4e80bee853c1b94949b832_2_690x452.jpeg)](https://linux.do/uploads/default/original/4X/c/a/3/ca34da6c649138efbf4e80bee853c1b94949b832.jpeg &quot;image&quot;)

## [](https://linux.do/t/topic/1495502#p-12896604-h-6-7)6\. 验证页面

请下载 &#96;Read ID Ready&#96; APP  

[![image](https://linux.do/uploads/default/optimized/4X/e/0/9/e09ae65e9c9b852d2f1726d4a3fb4408443edb45_2_430x500.jpeg)](https://linux.do/uploads/default/original/4X/e/0/9/e09ae65e9c9b852d2f1726d4a3fb4408443edb45.jpeg &quot;image&quot;)

-   流程如下

[![image](https://linux.do/uploads/default/optimized/4X/a/a/b/aab2e17f97cdd5f5ca89e83a636ecc9d8c233a2c_2_690x278.jpeg)](https://linux.do/uploads/default/original/4X/a/a/b/aab2e17f97cdd5f5ca89e83a636ecc9d8c233a2c.jpeg &quot;image&quot;)

  

[![image](https://linux.do/uploads/default/optimized/4X/9/d/b/9db6681848e2546eed5d7471e802528baf3e4df9_2_690x279.jpeg)](https://linux.do/uploads/default/original/4X/9/d/b/9db6681848e2546eed5d7471e802528baf3e4df9.jpeg &quot;image&quot;)

  

[![image](https://linux.do/uploads/default/optimized/4X/e/8/e/e8ed49d535d23fdb99f381d50c2ef01159d3ada8_2_690x283.jpeg)](https://linux.do/uploads/default/original/4X/e/8/e/e8ed49d535d23fdb99f381d50c2ef01159d3ada8.jpeg &quot;image&quot;)

&gt; 如果被拒，说明名字拼音跟某些 &#96;被制裁实体&#96; 撞了，无法再次申请
&gt; 
&gt; [![image](https://linux.do/uploads/default/optimized/4X/5/2/e/52ee417c678a59c1921fc54f6545b5346df58c5f_2_344x153.jpeg)](https://linux.do/uploads/default/original/4X/5/2/e/52ee417c678a59c1921fc54f6545b5346df58c5f.jpeg &quot;image&quot;)

## [](https://linux.do/t/topic/1495502#p-12896604-h-7-8)7\. 激活银行卡

-   目前只支持充值 &#96;USDC（Arbitrum链）&#96;
    
-   打开银行卡，点击 &#96;充值&#96;，建议充值金额填写为 &#96;11 USDC&#96;
    
-   点击 &#96;确认&#96; 即可完成充值。
    

[![image](https://linux.do/uploads/default/optimized/4X/f/e/e/fee24b8a136479a1634519c8a1a652d2a1706356_2_690x389.jpeg)](https://linux.do/uploads/default/original/4X/f/e/e/fee24b8a136479a1634519c8a1a652d2a1706356.jpeg &quot;image&quot;)

&gt; 如左图需要 Gas 费的情况下，可以按右图教程私聊发我 &#96;钱包地址&#96;

&gt; &#96;无条件长期免费&#96; 转给佬友，一般不需要充值 &#96;getgas&#96;
&gt; 
&gt; [![29000cb0d71031487745d28c80d6f77c](https://linux.do/uploads/default/optimized/4X/e/2/9/e29ffaa156054dbe3e9ac6f91554cc8f692922ea_2_563x500.jpeg)](https://linux.do/uploads/default/original/4X/e/2/9/e29ffaa156054dbe3e9ac6f91554cc8f692922ea.jpeg &quot;29000cb0d71031487745d28c80d6f77c&quot;)

## [](https://linux.do/t/topic/1495502#p-12896604-h-8-9)8\. 支付使用

点击 &#96;去激活&#96;，跳转页面后选择 &#96;Activate Card&#96; → &#96;Active&#96;  

[![image](https://linux.do/uploads/default/optimized/4X/3/d/a/3da2b2901063c7eceea4e68ba65570ff9685ea56_2_690x446.jpeg)](https://linux.do/uploads/default/original/4X/3/d/a/3da2b2901063c7eceea4e68ba65570ff9685ea56.jpeg &quot;image&quot;)

## [](https://linux.do/t/topic/1495502#p-12896604-h-9-10)9\. 支付币种

-   所有 Fiat 24 账户支持四种货币：&#96;美刀、欧元、法郎、RMB&#96;
-   你可以为这些货币启用直接支付功能
-   启用后，交易时将优先从相应货币余额中扣除，帮助用户避免外汇手续费
-   &#96;Direct Pay&#96; 全部打开（***这个手续费也免费可以找我要***）
-   &#96;Default Card Currency&#96; 选择 &#96;USD&#96;

[![image](https://linux.do/uploads/default/optimized/4X/5/b/4/5b43231dda6c1f8db6f24cacf220ee89095d4ca5_2_690x472.jpeg)](https://linux.do/uploads/default/original/4X/5/b/4/5b43231dda6c1f8db6f24cacf220ee89095d4ca5.jpeg &quot;image&quot;)

## [](https://linux.do/t/topic/1495502#p-12896604-h-10-app-11)10\. 绑定至 APP

点击按钮，查看卡信息，支持 ApplePay、微信、支付宝等等  

[![image](https://linux.do/uploads/default/optimized/4X/8/1/d/81dad6896b1072ed79a7dff93ea9c66b2d66102e_2_368x375.jpeg)](https://linux.do/uploads/default/original/4X/8/1/d/81dad6896b1072ed79a7dff93ea9c66b2d66102e.jpeg &quot;image&quot;)

## [](https://linux.do/t/topic/1495502#p-12896604-h-11-12)11\. 零手续费返现

&#96;BitgetWallet&#96; 会针对 &#96;Fiat24&#96; 的 &#96;充值手续费&#96; 与 &#96;较低汇率&#96; 进行补贴，最小提取金额为 &#96;1 USDC&#96;

&gt; 充值手续费：USDC 充入卡里的 1% 手续费

&gt; 汇率补贴：消费时与谷歌汇率同步

[![image](https://linux.do/uploads/default/optimized/4X/2/d/0/2d0744132868b25db7e71a6a8bb52bc311ced4a4_2_690x359.jpeg)](https://linux.do/uploads/default/original/4X/2/d/0/2d0744132868b25db7e71a6a8bb52bc311ced4a4.jpeg &quot;image&quot;)

&gt; 0 手续费额度下，充值的手续费将在下次消费的返现中一并返还

[![image](https://linux.do/uploads/default/optimized/4X/f/a/a/faa7b0c4b733e40574dc5f070e3322512add8445_2_345x111.jpeg)](https://linux.do/uploads/default/original/4X/f/a/a/faa7b0c4b733e40574dc5f070e3322512add8445.jpeg &quot;image&quot;)

## [](https://linux.do/t/topic/1495502#p-12896604-h-13)相关羊毛

[![image](https://linux.do/uploads/default/optimized/4X/6/d/d/6dd6cbc7d783f471d98c90cf94839e87474f154f_2_392x375.jpeg)](https://linux.do/uploads/default/original/4X/6/d/d/6dd6cbc7d783f471d98c90cf94839e87474f154f.jpeg &quot;image&quot;)

[![de685b99250b7d28af9d951c78def38d](https://linux.do/uploads/default/optimized/4X/a/1/a/a1a98f933a1ea79c9121b417f7472a30989e3916_2_368x500.jpeg)](https://linux.do/uploads/default/original/4X/a/1/a/a1a98f933a1ea79c9121b417f7472a30989e3916.jpeg &quot;de685b99250b7d28af9d951c78def38d&quot;)

## [](https://linux.do/t/topic/1495502#p-12896604-h-14)具体使用场景

## [](https://linux.do/t/topic/1495502#p-12896604-h-1-chatgpt-15)1\. ChatGPT

-   如果不能直接支付，套一层 &#96;Apple/Google Pay&#96;

[![iShot_2025-12-19_12.41.13](https://linux.do/uploads/default/optimized/4X/6/a/1/6a1196afbbc59e5c78564f4a4db5b5ee682f6020_2_412x500.jpeg)](https://linux.do/uploads/default/original/4X/6/a/1/6a1196afbbc59e5c78564f4a4db5b5ee682f6020.jpeg &quot;iShot_2025-12-19_12.41.13&quot;)

## [](https://linux.do/t/topic/1495502#p-12896604-h-2-16)2\. 微信 / 支付宝

依据《网络支付业务管理办法》

-   单笔不超过 3,000 元
-   单月累计不超过 50,000 元
-   年度累计不超过 600,000 元

[![7fd3cd09d62a371ea9103d1d3c83c199](https://linux.do/uploads/default/optimized/4X/5/d/c/5dc261d022818c5ee8229be0d50ff43bac041ce3_2_370x375.jpeg)](https://linux.do/uploads/default/original/4X/5/d/c/5dc261d022818c5ee8229be0d50ff43bac041ce3.jpeg &quot;7fd3cd09d62a371ea9103d1d3c83c199&quot;)

&gt; 单笔超过 200 RMB，老马要额外收 3% 手续费，这不是 Fiat 24 的锅

## [](https://linux.do/t/topic/1495502#p-12896604-h-3-google-cloud-17)3\. Google Cloud

[![image](https://linux.do/uploads/default/optimized/4X/d/1/c/d1c081bed64290fc424a58ad1bde1e091694a884_2_454x375.jpeg)](https://linux.do/uploads/default/original/4X/d/1/c/d1c081bed64290fc424a58ad1bde1e091694a884.jpeg &quot;image&quot;)

## [](https://linux.do/t/topic/1495502#p-12896604-h-4-paypal-18)4\. PayPal

[![iShot_2025-12-19_13.16.37](https://linux.do/uploads/default/optimized/4X/e/0/9/e0933114f9588a81511ba7ab2f6aa60399f16038_2_355x375.jpeg)](https://linux.do/uploads/default/original/4X/e/0/9/e0933114f9588a81511ba7ab2f6aa60399f16038.jpeg &quot;iShot_2025-12-19_13.16.37&quot;)

## [](https://linux.do/t/topic/1495502#p-12896604-h-5-azure-19)5\. Azure

-   如果直接绑卡不行，套一层 &#96;PayPal&#96;

[![iShot_2025-12-19_13.17.43](https://linux.do/uploads/default/optimized/4X/3/c/4/3c45578d90dc6c9279d3d60533e9c248a9ea84c6_2_517x268.jpeg)](https://linux.do/uploads/default/original/4X/3/c/4/3c45578d90dc6c9279d3d60533e9c248a9ea84c6.jpeg &quot;iShot_2025-12-19_13.17.43&quot;)

## [](https://linux.do/t/topic/1495502#p-12896604-h-6-20)6\. 出入金银行 &amp; 券商

[![image](https://linux.do/uploads/default/optimized/4X/e/e/b/eebe4e00a1551c3f9fe6d7a6ee20498f81e38477_2_345x241.jpeg)](https://linux.do/uploads/default/original/4X/e/e/b/eebe4e00a1551c3f9fe6d7a6ee20498f81e38477.jpeg &quot;image&quot;)

-   传送门↓  
    [「海外支付」Fiat24 进阶教程，助你出金港卡 &amp; 盈透 / 嘉信券商](https://linux.do/t/topic/1213236)

## [](https://linux.do/t/topic/1495502#p-12896604-h-7-app-store-21)7\. 美区 App Store

-   卡 bin 是美国的，支持美区

↓***参考账单地址***↓

&gt; 街道：3054 Libby Street  
&gt; 街道：15-1  
&gt; 城市：Siletz  
&gt; 州：俄勒冈州  
&gt; 邮政编码：97380  
&gt; 电话：310 3134269  
&gt; 国家 / 地区：美国

[![image](https://linux.do/uploads/default/original/4X/f/2/6/f26ed4fef77d3fb4606bf12284d40f52a4ae5e80.png)](https://linux.do/uploads/default/original/4X/f/2/6/f26ed4fef77d3fb4606bf12284d40f52a4ae5e80.png &quot;image&quot;)

  

[![image](https://linux.do/uploads/default/optimized/4X/4/b/6/4b6c56d6005065c98c21498cb9d301f34068559f_2_294x249.jpeg)](https://linux.do/uploads/default/original/4X/4/b/6/4b6c56d6005065c98c21498cb9d301f34068559f.jpeg &quot;image&quot;)

## [](https://linux.do/t/topic/1495502#p-12896604-h-8-22)8\. 甲骨文免费服务器

[![image](https://linux.do/uploads/default/optimized/4X/5/d/5/5d54af1c6c895bd95034fa5fa0a369824a5e4473_2_517x304.png)](https://linux.do/uploads/default/original/4X/5/d/5/5d54af1c6c895bd95034fa5fa0a369824a5e4473.png &quot;image&quot;)

## [](https://linux.do/t/topic/1495502#p-12896604-h-9-gpt-1-plus-23)9\. GPT 战术型 1 年 Plus 认证

[![iShot_2026-01-06_14.31.12](https://linux.do/uploads/default/optimized/4X/b/7/2/b72e7d9059d280c7c08a12eecd493028df0c061e_2_333x375.jpeg)](https://linux.do/uploads/default/original/4X/b/7/2/b72e7d9059d280c7c08a12eecd493028df0c061e.jpeg &quot;iShot_2026-01-06_14.31.12&quot;)

## [](https://linux.do/t/topic/1495502#p-12896604-qa-24)QA

## [](https://linux.do/t/topic/1495502#p-12896604-h-25)五年有效期过了会发生什么？

&gt; 官方说在过期前 &#96;半年&#96; 内有 &#96;消费&#96; 即可续卡  
&gt; 
&gt; [![image](https://linux.do/uploads/default/optimized/4X/6/1/e/61ee04f79c863b40e53353833a80166d8cf951ac_2_690x377.png)](https://linux.do/uploads/default/original/4X/6/1/e/61ee04f79c863b40e53353833a80166d8cf951ac.png &quot;image&quot;)

## [](https://linux.do/t/topic/1495502#p-12896604-gpt-26)为什么绑不了 GPT

&gt; 请检查网络环境，建议使用全局模式下的高质量美国节点，并确保真实地址  
&gt; ↓***参考账单地址***↓  
&gt; 
&gt; [![image](https://linux.do/uploads/default/optimized/4X/5/8/5/585b4dcd2a5621ce8ca8642a53781b2535b0a3ab_2_286x250.png)](https://linux.do/uploads/default/original/4X/5/8/5/585b4dcd2a5621ce8ca8642a53781b2535b0a3ab.png &quot;image&quot;)

## [](https://linux.do/t/topic/1495502#p-12896604-gpt-27)GPT 首月免费付不了怎么办？

&gt; 在零元购界面右下角切换为法国，套一层 PayPal 支付

PayPal 支付方法参考：

[![iShot_2025-12-29_21.39.15](https://linux.do/uploads/default/optimized/4X/5/8/4/584604e01b528b28a763f7edb134d39ad30d5db5_2_462x375.jpeg)](https://linux.do/uploads/default/original/4X/5/8/4/584604e01b528b28a763f7edb134d39ad30d5db5.jpeg &quot;iShot_2025-12-29_21.39.15&quot;)

## [](https://linux.do/t/topic/1495502#p-12896604-safepal-28)隔壁佬友的 Safepal 又是什么？

传送门：[10 分钟通关瑞士万事达卡 (fiat24)，≈0 成本，从此绑卡不求人](https://linux.do/t/topic/761443)

&gt; Fiat 24 主要合作的两家分别是 &#96;Safepal&#96; 与 &#96;Bitget Wallet&#96;，本教程属于后者  
&gt; 由于底层是相同的，所以这两张卡只能 &#96;二选一&#96;  
&gt; 但也有特殊情况，一个 &#96;护照&#96; 申请，另一个用 &#96;身份证&#96; 申请，少数的佬友成功过

## [](https://linux.do/t/topic/1495502#p-12896604-safepal-bitget-wallet-29)我该选择 &#96;Safepal&#96; 还是 &#96;Bitget Wallet&#96;？

&gt; 个人偏向于 &#96;Bitget Wallet&#96;，走特殊的邀请码有首笔返现 &#96;5$&#96; 的活动  
&gt; &#96;Safepal&#96; 是送一个冷钱包，一般人不太需要，感兴趣的可以整一个玩玩，但有 &#96;5$&#96; 运费

## [](https://linux.do/t/topic/1495502#p-12896604-c2c-30)C2C 是什么？

&gt; C2C（英语：Customer to Customer），是指个人对个人的交易形式，该名词常出现在币圈

## [](https://linux.do/t/topic/1495502#p-12896604-gas-31)Gas 是什么？

&gt; 可以理解为手续费，如果开卡的时候碰到可以私信我，我免费发一些给佬友

## [](https://linux.do/t/topic/1495502#p-12896604-usdtusdc-32)我该如何获得 USDT/USDC?

&gt; 请自行搜索关键词：&#96;币安&#96; &#96;欧易&#96;，进行 &#96;C2C&#96; 交易，请注意个人安全  
&gt; 如果有&#96;港卡&#96;的佬友，点击首页的&#96;去充值&#96;，直接购买即可
