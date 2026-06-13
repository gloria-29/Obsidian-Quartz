---
标题: KoodoReader调用安卓ttsServer
笔记 ID: 019a3fb8-c76c-7c48-a2ac-d894577e5a5d
笔记类型: crawl
tags:
    - 生活/电子工具
卡片盒:
    - 生活
包含语音: 否
网页链接:
创建时间: "2025-11-01T22:01:05"
更新时间: "2026-03-11T20:55:49.811"
---

TTS Server Android

特点：调用安卓手机上的语音引擎进行朗读

[jing332/tts-server-android: 这是一个Android系统TTS应用，内置微软演示接口，可自定义HTTP请求，可导入其他本地TTS引擎，以及根据中文双引号的简单旁白/对话识别朗读 ，还有自动重试，备用配置，文本替换等更多功能。 (github.com)](https://github.com/jing332/tts-server-android)

配置方法：

1. 下载安装 APK 安装包

2. 启动系统TTS转发器，复制阅读Legado的链接到下面的config→url

3. 获取安卓手机的局域网 IP 地址（可以通过路由器后台或者手机上的WiFi详情获取），复制到下面的config→host

4. 注意本插件只适用于电脑和手机处于同一个局域网的情况

&#96;&#96;&#96;json
{
  &quot;identifier&quot;: &quot;ttsserver-voice-plugin&quot;,
  &quot;type&quot;: &quot;voice&quot;,
  &quot;displayName&quot;: &quot;TTS Server&quot;,
  &quot;icon&quot;: &quot;speaker&quot;,
  &quot;version&quot;: &quot;1.0.0&quot;,
  &quot;config&quot;: {},
  &quot;voiceList&quot;: [
    {
      &quot;name&quot;: &quot;xiaoxiao&quot;,
      &quot;gender&quot;: &quot;female&quot;,
      &quot;locale&quot;: &quot;zh-CN&quot;,
      &quot;displayName&quot;: &quot;Xiaoxiao&quot;,
      &quot;plugin&quot;: &quot;ttsserver-voice-plugin&quot;,
      &quot;config&quot;: {
        &quot;host&quot;: &quot;192.168.31.21&quot;,
        &quot;url&quot;: &quot;http://localhost:1221/api/legado?api&#61;http://localhost:1221/api/tts&amp;name&#61;TTS Server (com.github.jing332.tts_server_android)&amp;engine&#61;com.github.jing332.tts_server_android&amp;pitch&#61;100&amp;voice&#61;⚠️请在右上角打开多语音！晓晓（zh-CN-XiaoxiaoNeural）_1690331046541&quot;
      }
    }
  ],
  &quot;scriptSHA256&quot;: &quot;101e5baea3973b7e79d4dc620b0961671c8ba7b97fe3ff85286245289d6ad925&quot;,
  &quot;script&quot;: &quot;const getAudioPath&#61;async(t,e,r,o)&#61;&gt;{let i&#61;require(\&quot;path\&quot;),a&#61;require(\&quot;fs\&quot;),n&#61;new Date().getTime()+\&quot;.wav\&quot;;return a.existsSync(i.join(r,\&quot;tts\&quot;))?(a.writeFileSync(i.join(r,\&quot;tts\&quot;,n),await getTTSAudio(t,e,o)),console.log(\&quot;folder already exists\&quot;)):(a.mkdirSync(i.join(r,\&quot;tts\&quot;)),a.writeFileSync(i.join(r,\&quot;tts\&quot;,n),await getTTSAudio(t,e,o)),console.log(\&quot;folder created successfully\&quot;)),i.join(r,\&quot;tts\&quot;,n)},objectToQueryString&#61;t&#61;&gt;{let e&#61;[];for(let r in t)if(t.hasOwnProperty(r)){let o&#61;t[r],i&#61;encodeURIComponent(r),a&#61;encodeURIComponent(o);e.push(&#96;${i}&#61;${a}&#96;)}return e.join(\&quot;&amp;\&quot;)},getTTSAudio&#61;async(t,e,r)&#61;&gt;{let o&#61;r.host||\&quot;127.0.0.1\&quot;,i&#61;parseUrlParams(r.url||\&quot;\&quot;),a&#61;i.api||\&quot;http://localhost:1221/api/tts\&quot;,n&#61;i.engine||\&quot;com.github.jing332.tts_server_android\&quot;,s&#61;i.pitch||\&quot;100\&quot;,l&#61;i.rate||\&quot;50\&quot;,c&#61;i.voice||\&quot;\&quot;;a&#61;a.replace(\&quot;localhost\&quot;,o);let u&#61;require(\&quot;axios\&quot;);return new Promise((e,r)&#61;&gt;{u.get(a+\&quot;?\&quot;+objectToQueryString({engine:n,pitch:s,rate:l,voice:c,text:t}),{responseType:\&quot;arraybuffer\&quot;}).then(t&#61;&gt;{console.log(t),e(t.data)}).catch(t&#61;&gt;{console.log(t),r(\&quot;\&quot;)})})};function parseUrlParams(t){let e&#61;new URL(t),r&#61;new URLSearchParams(e.search),o&#61;{};for(let[i,a]of r.entries())o[i]&#61;decodeURIComponent(a);return o}global.getAudioPath&#61;getAudioPath;&quot;
}
&#96;&#96;&#96;

&gt; 来自：[Koodo Reader](https://koodoreader.com/zh/plugin#0cf59bf6ec1b4d22b3b10db453dab6e8)
