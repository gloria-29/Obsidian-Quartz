---
标题: E3订阅管理工具Docker与API
笔记 ID: 019b5e37-e572-70e1-95b6-e206f8e76956
笔记类型: crawl
tags:
    - 财富/支出管理
    - 工作/技能工具
卡片盒:
    - 财富
包含语音: 否
网页链接:
创建时间: "2025-12-27T13:11:20.179"
更新时间: "2026-03-04T17:17:56.097"
---

![](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b5e37-c25e-7fdd-b9e4-f729666a2f4e.jpeg#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251227%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251227T051116Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;325335f2270f82a03793cda847ce859cce85d37a3e5952739c6bf6924120ff29&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

上个月微软出现了e3订阅零元购，可以0元购买最多几百万的office e3订阅，理论上可以一直续期，此订阅包含了每用户四个office 365桌面版（即桌面版office）和5t OneDrive，目前全部订阅趋于稳定，那几百万的订阅怎么用呢？当然可以给还没有office的童鞋每人一个账号，这里就用一个小工具实现多全局、多用户注册/管理，当然也可以放出去公开注册，实现人人都有的用。

**一、微软0元购e3**

上个月微软不知道是故意还是不小心，放出了e3开发者订阅，0元购，理论上是可以续期，当然前几天我也是成功续期了，所以是不是稳了呢？那不知道。

当时的订阅有两种，一种是25许可，一种是200w许可，每个许可可以分配给一个账户，一个账户就有4个office桌面版和5t OneDrive，当然，你觉得这两百万少，实际上是可以一直叠加，你叠加到2000w都行，，，，我后面也是叠到了400w，又不是不能用。

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b5e37-c256-7b0b-a870-ae07614fc363.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251227%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251227T051113Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;be884b9de86eb340adf335e587c9801cdbaf5970da34bf28d11a97142c36baeb&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

当时这个我是没发推文，只在群里面说了，因为这个在当时看起来是100%翻车的，但是现在过去一个月了，都能正常续期，，，，姑且当做没那么快翻车吧，这段时间我也是问了好几次群友，没有翻车的。

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b5e37-c1e4-730b-80f8-997212be9e18.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251227%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251227T051113Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;e66e45f7001eaf85ed6855cb07fc18f3481eac8511e09e14c1b9ac654cc50592&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

哦对了，微软这次的0元购，一直持续到上周才彻底封车，在那一个月的时间里都可以一直购买，目前已知是除了疯狂叠加许可的那些，正常买的都没翻车。

**二、部署工具**

不管以后会不会翻车，现在大伙手上都有几百万的许可，可以分配给几百万用户，那怎么利用上呢？这不就回到本期主题，通过github vanyouseea/o365这个小工具直接调用微软官方api，实现对用户的管理/注册。这里主要实现用户自助注册，把注册码分享出来，让其他没有office的用户输入邀请码自助注册上你的e3订阅。

关于小工具，刚刚都说了名称，自行到github上查看源代码/详细说明。废话不多说，开始部署。源项目是采用的java编写，直接运行的话还需要自己管理自启动那些，不过作者也是有做了个docker，所以我这里也是采用docker部署，在linux下运行以下命令就行：

- &amp;nbsp;
- &amp;nbsp;

&#96;&#96;&#96;
docker pull vanyouseea/o365docker run -d -p 9527:9527 vanyouseea/o365
&#96;&#96;&#96;

就是这么简单，数据持久化都可以不用做，毕竟没啥数据，只需要映射容器内的9527端口即可。

部署好后输入ip+端口打开o365的网页，首次需要创建管理员用户、密码。创建后在登录到后台，在首页可以看到有个使用步骤。

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b5e37-c259-789a-a388-84a7917a49dd.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251227%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251227T051113Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;d1dd2a24860d7bb0cce1f9f1901ed1af256213987a01559a8b82d1d81f8640f5&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b5e37-c26a-785b-96fe-6c5f13ca86eb.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251227%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251227T051114Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;4641b924f908aa86f5828026a39238d591287b0484919a9c91a5c6da50900ee7&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

**三、启用office api**

我刚刚也说了，o365是通过调用微软官方的api实现对整个e3订阅的管理，但这些api默认是不开放的，所以还需要自己去启用下。进入到微软azure，在最上面搜索“应用注册”，然后添加一个应用，名称随意，所有设置均默认。

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b5e37-c286-7048-8bcb-adf7ddfd261a.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251227%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251227T051114Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;bd92546a71d225ee4d2232d0b75f8f2b46c5b7ba47f8018f47f6946284e19f2c&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b5e37-c2af-7853-9af4-e8b1cab12687.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251227%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251227T051115Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;c9b2ef89a46b5b570e2689cf71ee1a0d363170be4acac9903c5acdcadadbb3f5&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

之后会自动跳转到这个应用详细，这里的应用id和租户id需要记住，等下o365需要填写相关id。

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b5e37-c2ae-75e7-94d5-1bab85dd7f6b.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251227%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251227T051114Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;17bd49345f2e267646db840eede016765d0d940cd5b5511bba04d05782ac43c0&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

还需要点击此应用-管理-证书和密码，新建一个密码，这个密码现在最长时间只能是24个月，以前的倒是可以永久，微软莫名其妙要限制这个，，，，建立后这个值就是实际的密码，一定要现在复制，他这个就只会显示这一次，后面没记住就得重新新建密码。

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b5e37-c2b4-7b56-b4a9-2e7eeefc3103.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251227%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251227T051114Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;158d6cc96e392329f94159adee2e9e781d159827d600d9a23e7fd06faf95fb9e&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b5e37-c2ad-7524-9c0a-f9b15364036c.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251227%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251227T051114Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;cccde567f2c1f0931e8e8d11239baf9adcf7276f73af2211b05475df7fd891aa&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

最重要的就是开启api，进入到api权限，添加应用权限，注意是应用权限，然后搜索o365首页的那些api，全部添加上，添加完成后还需要授权同意，不然api是用不了的。

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b5e37-c2f2-7dd5-9312-45370eec402c.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251227%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251227T051115Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;83e3d9e80325cc0385d03101fc7689440b3d1d2a76468e1bdaf5f4a1e9414ccd&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b5e37-c2d2-7f1e-b3a3-ee02f34caa41.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251227%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251227T051115Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;d480bda59958576881fb338c8b947853dedd2da4c985516a5c05db030d156768&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b5e37-c322-7146-99bc-ac9b7f83e4cc.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251227%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251227T051116Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;859c165b7c05e2c9e451514bfb08f25342e8084e97b2d4ac42cf174dcb1ed68e&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b5e37-c2f8-780c-ae8e-18e9a9baca60.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251227%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251227T051116Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;3a16401d04526f6a1a460b331bfd56e95bcc81f6c1288876b547ec020dee979a&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b5e37-c2f9-7167-8153-77e0237d7876.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251227%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251227T051116Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;ca5dc0ee1d5fe43ac0aba71ee17ad42861c66aad1b8821cd6a7b637f52281c0d&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

**四、配置小工具**

回到o365，进入到office配置，添加全局，只需要输入租户id、应用id和密码的值就行。添加好后默认是没启用，还需要点击上面的切换全局，启用它。所以如果你有多个全局（e3订阅账户），也可以全部加进去，实现统一管理。

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b5e37-c2f3-7c08-bd9c-82e2a971a621.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251227%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251227T051115Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;62485d83ed458a40493e83df9bfdcadc6c66131efad69114727ec9755b5213bf&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b5e37-c34a-7120-8fd7-4b86cf8268eb.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251227%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251227T051116Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;248d1ab9f462be0bbb905717019b5bb3cf4623de48672b7680e8707726738b98&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

然后配置邀请注册，输入要生成的邀请码，然后分配这次的e3订阅，最后再把邀请码发送给朋友或者公布出来，这样其他人就可以自助注册上你的e3（子）账户了。

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b5e37-c324-7f07-b5cc-d0d2dfce2a31.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251227%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251227T051116Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;a04af06b568833e20e774a53a8b795a7dc2ba81755f4d6874d83a4d30bf0b3e7&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

![图片](https://dinox-new.5984f2df14671be265c2d2fc0e21b3f8.r2.cloudflarestorage.com/dinox_note/assets/019126f0-2672-7286-b640-feeb1616b906/images/019b5e37-c349-79dc-9004-f0e08d42764a.png#61;AWS4-HMAC-SHA256&amp;X-Amz-Content-Sha256&#61;UNSIGNED-PAYLOAD&amp;X-Amz-Credential&#61;e0a0f9ee95addba35f00fa6edbeaff42%2F20251227%2Fus-east-1%2Fs3%2Faws4_request&amp;X-Amz-Date&#61;20251227T051117Z&amp;X-Amz-Expires&#61;86400&amp;X-Amz-Signature&#61;74410a1fec5c2a7fdddc398a499c88572437153d5f77bd5cc27954a32db1e9ec&amp;X-Amz-SignedHeaders&#61;host&amp;x-amz-checksum-mode&#61;ENABLED&amp;x-id&#61;GetObject)

至于标题里面，我说的人人都能有office 365/5t OneDrive也没说错，因为目前很多大佬都是开放注册的，有些人的订阅都已经被注册上万个了，如果你手里面也有几百万个许可，也可以这样共享出来，实现人人都能用。

---

**关注我第一时间学习新技术**

&amp;nbsp;

&gt; 来自：[https://mp.weixin.qq.com/s/81oEDikEJ45GRMsBiw9_dw](https://mp.weixin.qq.com/s/81oEDikEJ45GRMsBiw9_dw)

&amp;nbsp;
