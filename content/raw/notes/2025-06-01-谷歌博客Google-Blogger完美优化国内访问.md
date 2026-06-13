---
标题: 谷歌博客Google Blogger完美优化国内访问
笔记 ID: 01972b43-5391-7bd5-ac26-91f46496e3e9
笔记类型: crawl
tags:
    - 生活/电子工具
卡片盒:
    - 工作
包含语音: 否
网页链接:
创建时间: "2025-06-01T19:32"
更新时间: "2026-03-04T20:27:07.464"
---

### Google Blogger注册

只要是拥有Google账号的用户都可以直接登陆Google Blogger注册，这个不用详细介绍

众所周知，某些原因Google的服务，包括谷歌博客Google Blogger 是无法在国内访问的，接下来通过以下方法得到一个完美完整国内直连访问。

大致的原理就是禁用CSS、JS，然后按F12-网络看哪些文件无法加载的直接替换为国内可用的源

### Google Blogger 优化

一、自己必须拥有一个自己独立的域名，不管是免费的 [二级域名](https://so.csdn.net/so/search?q&#61;%E4%BA%8C%E7%BA%A7%E5%9F%9F%E5%90%8D&amp;spm&#61;1001.2101.3001.7020) (需要两条CNAME记录)，还是购买一个自己喜欢的域名都可以，并且接入域名到cloudflare(事实上其他的也可以，这里用cf做示范)

![](https://github.com/gloria-29/OB-assets/releases/download/img-3f/3fd42ae7045e5ede1154dabc2e54485fc196c499676c3cd366e84820b1a17b5c.jpg)

二、进入Blogger的后台-设置-正在发布-添加自己的域名（注意必须带www之类的二级）-然后根据提示去CF的DNS填写他提示的内容添加2个 [CNAME](https://so.csdn.net/so/search?q&#61;CNAME&amp;spm&#61;1001.2101.3001.7020) ，注意：wesui45qv1p5 类似这样的不要打开CDN，不然无法正常解析识别

我这里只有一条记录，另一条在验证完成之后删了

三、修改个人资料及头像：设置-最底部的-编辑个人资料-主要修改头像，其他资料随便自己填

![](https://github.com/gloria-29/OB-assets/releases/download/img-7e/7e9550a82727ec16aa4cc3a745986d87f2563feee7474ff742285edbb02cf5ed.png)

四、接下来修改主题模板中的代码（这里演示默认主题，其他主题类似）

点击主题背景-主题的修改HTML

![](https://github.com/gloria-29/OB-assets/releases/download/img-15/15d314bbd474ba0168c764f3812f64389f26229509a5afbca2e198217c9bff14.png)

1.Ctrl+F 搜索，修改代码中所有http、https、src的图片链接，在链接前面加入以下链接：

https://images.weserv.nl/?url&#61;

[或者使用这个： [https://cdn.cdnjson.com/pic.html?url&#61;]](https://cdn.cdnjson.com/pic.html?url&#61;%5D &quot;https://cdn.cdnjson.com/pic.html?url&#61;]&quot;)

[有条件的也可以自建代理，过段时间出教程]

如图所示是背景显示的链接

![](https://github.com/gloria-29/OB-assets/releases/download/img-a9/a99589ea9a1052be48ecb9a9fcda315aaefa439c3a63d8002217deb90d8f4954.png)

如图所示是头像的链接，是src，在data:comment.authorAvatarSrc加入：

    &amp;quot;https://images.weserv.nl/?url&#61;&amp;quot; +

(wsrv.nl 代理)

或者

    &amp;quot;https://cdn.cdnjson.com/pic.html?url&#61;https:&amp;quot; +

(路过图床CDN)

头像也可以直接搜索

    &lt;img class&#61;&#39;profile-img&#39; expr:alt&#61;&#39;data:messages.myPhoto&#39; expr:height&#61;&#39;data:authorPhoto.height&#39; expr:src&#61;&#39;data:authorPhoto.image&#39; expr:width&#61;&#39;data:authorPhoto.width&#39;/&gt;

替换为

    &lt;img class&#61;&#39;profile-img&#39; expr:alt&#61;&#39;data:messages.myPhoto&#39; expr:height&#61;&#39;data:authorPhoto.height&#39; src&#61;&#39;图片地址&#39; expr:width&#61;&#39;data:authorPhoto.width&#39;/&gt;

![](https://github.com/gloria-29/OB-assets/releases/download/img-d0/d0c54ffdd6a55403ae09453f620e863f52a32e05423d3242e979c1e39b795156.png)

然后继续搜索，涉及到jpg，gif等图片地址全部增加以上链接

这样背景图+头像都可以国内显示了

2.禁用CSS、JS文件

替换&lt;head&gt;为：&lt;!--&lt;head&gt;--&gt;&lt;head&gt;

替换&lt;/head&gt;为：&lt;/head&gt;&lt;!--&lt;/head&gt;--&gt;

替换&lt;/body&gt;为：&lt;!--&lt;/body&gt;--&gt;&lt;/body&gt;

![](https://github.com/gloria-29/OB-assets/releases/download/img-df/df226c982c0ce637c4d2af126bc522dfc2f8b02d2b6ccf4b4d0a748dea4a4447.png)

3.一般在第三行&lt;html&gt;位置添加：b:css&#61;&#39;false&#39; b:js&#61;&#39;false&#39;

![](https://github.com/gloria-29/OB-assets/releases/download/img-7c/7cc2d2297ddcae65eecb7fff76ce6fc96a318c4a3e5581ceeceb6aa4f0f9d474.png)

注意：添加b:js&#61;&#39;false&#39; 后布局就无法使用，一直加载中，等需要布局时候去掉这段代码，等布局确认后再添加进去即可

4.博文首页缩略图解决方法

将 JS 代码放置于 &lt;/body&gt; 标签前：

    &lt;b:if cond&#61;&#39;data:blog.pageType in {&quot;index&quot;,&quot;searchQuery&quot;,&quot;searchLabel&quot;,&quot;archive&quot;}&#39;&gt; 
    &lt;!--如果当前页是首页，搜索页，标签页，那么代码继续执行--&gt;
        &lt;script defer&#61;&#39;defer&#39;&gt;
            //&lt;![CDATA[
            var postThumbnails &#61; document.getElementsByClassName(&quot;post-thumbnail&quot;);
            var postContents &#61; document.getElementsByClassName(&quot;post-text&quot;);
            for (var i&#61;0;i&lt;postContents.length;i++)
            {
                var postContent &#61; postContents[i].innerText;
                var imgReg &#61; /&lt;img.*?(?:&gt;|\/&gt;)/gi;
                var srcReg &#61; /src&#61;[\&#39;\&quot;]?([^\&#39;\&quot;]*)[\&#39;\&quot;]?/i;
                var imgTags &#61; postContent.match(imgReg);
                imgSrcs &#61; imgTags[0].match(srcReg);
                imgSrc &#61; imgSrcs[1];
                postThumbnails[i].setAttribute(&#39;src&#39;, imgSrc);
            }
            //]]&gt;
        &lt;/script&gt;&lt;/b:if&gt;

![](https://github.com/gloria-29/OB-assets/releases/download/img-44/44c5895e88077888530a6d12819b6e45a4cec436db0175cc1f4e05d2a414c6a9.png)

找到原有缩略图代码删去，用以下代码替换：

    &lt;b:if cond&#61;&#39;data:post.featuredImage&#39;&gt;  &lt;!--判断文章内是否有图片，有则代码继续执行--&gt;
        &lt;div class&#61;&#39;snippet-thumbnail&#39;&gt;  &lt;!--创建一个 div 容器，缩略图放置在这里--&gt;
            &lt;img class&#61;&#39;post-thumbnail&#39; sizes&#61;&#39;(max-width: 800px) 20vw, 128px&#39; src&#61;&#39;https://img.kejione.com/file/62e5a8c4e7afb9fbe4aa8.png&#39;/&gt;  &lt;!--预先放置一个加载图片，增强用户体验--&gt;
            &lt;textarea class&#61;&#39;post-text&#39; style&#61;&#39;display:none;&#39;&gt;&lt;data:post.body.escaped/&gt;&lt;/textarea&gt; &lt;!--这里放置文章全文，图片从中提取，样式设置为不显示--&gt;
        &lt;/div&gt;&lt;/b:if&gt;

一般是搜索：featuredImage 找到该位置，然后替换，如图所示

![](https://github.com/gloria-29/OB-assets/releases/download/img-7d/7d7fa526273b2a5b773fce17da1e3d746ba9996a33ac63c860099d3e4f729507.png)

5.替换JS，一般会自动生成一个类似：1946366942-indie\_compiled.js 文件的JS文件是无法加载的（一般这个文件前面的数字不一样）

这个时候我们在国内访问时候他会无法加载，我们需要按F12，网络，找到这个JS完后打开这个文件（科学情况下），打开该文件后，右键另存为即可，得到1946366942-indie\_compiled.js的文件

然后我们需要用到国内的对象存储来存放该文件，腾讯阿里的都可以

删除主题模板中：&lt;b:template-script async&#61;&#39;true&#39; name&#61;&#39;indie&#39; version&#61;&#39;1.0.0&#39;/&gt;

然后替换为：&lt;script async&#61;&#39;async&#39; src&#61;&#39;https://XXXXXXX.myqcloud.com/1946366942-indie\_compiled.js&#39;/&gt;

自行修改为自己的国内对象存储JS文件地址

6.JS文件中有一个Blogger的LOGO地址，这个地址也是无法加载的，用编辑器（ Notepad ++之类的）修改19XXX2-indie\_compiled.js的logo地址，也是在前面加入https://images.weserv.nl/?url&#61;

![](https://github.com/gloria-29/OB-assets/releases/download/img-c0/c0be1808b287c1c54de3b5b195717eca0650ba31bc5e5b52a4cc3379d1b3e877.png)

我试过用外链图床的链接替换该地址，会自动生成一个另外数字的JS文件，相当于Google Blogger不允许你改她的版权LOGO，所以添加这个地址，实际是从他服务器下载了该LOGO文件再通过CF服务器转过来，所以他就正常了

### 参考文献

[https://www.cnblogs.com/Helium-Air/p/15646480.html](https://link.tomzhao.xyz/?url&#61;https://www.cnblogs.com/Helium-Air/p/15646480.html &quot;https://www.cnblogs.com/Helium-Air/p/15646480.html&quot;)

[https://www.kejione.com/2024/01/google-blogger.html](https://link.tomzhao.xyz/?url&#61;https://www.kejione.com/2024/01/google-blogger.html &quot;https://www.kejione.com/2024/01/google-blogger.html&quot;)

原文章： [谷歌博客Google Blogger完美优化 国内访问 缩略图显示 - Tom\_zhao 博客](https://blog.tomzhao.xyz/uncategorized/googleblogger01/ &quot;谷歌博客Google Blogger完美优化 国内访问 缩略图显示 - Tom_zhao 博客&quot;)

也欢迎访问我的Google Blogger测试站： [Tom\_zhao GBlog](https://gblog.tomzhao.xyz/ &quot;Tom_zhao GBlog&quot;)



&gt; 来源：[https://blog.csdn.net/vip7557/article/details/137189242](https://blog.csdn.net/vip7557/article/details/137189242)
