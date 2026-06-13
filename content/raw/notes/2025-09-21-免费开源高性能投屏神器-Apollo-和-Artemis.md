---
标题: 免费开源高性能投屏神器 Apollo 和 Artemis
笔记 ID: 019969d3-66cf-7219-88a7-96b43c18fdfd
笔记类型: crawl
tags:
    - 生活/电子工具
卡片盒:
    - 生活
包含语音: 否
网页链接:
创建时间: "2025-09-21T09:12:16"
更新时间: "2026-03-11T20:45:31.691"
---

今天要介绍的这款投屏神器黄金组合完全免费开源，而且性能特别强劲。

这对组合就是 Apollo 和 Artemis，不管是投屏到电视、手机、游戏掌机，还是 Windows、MacOS、Linux 系统它都可以轻松达成。

我们先说说 Apolo 的优点：

1、它可以自动识别接收端设备的分辨率和最大帧率，为接收端设备生成一套可以保存下来的专属配置。下次再连接同一设备时，Apolo 会自动调用上次保存的配置，可以直接连接，就已经是最好最清晰的显示效果。

2、在投屏开始时，它会在主机上创建一个虚拟显示器，这个显示器分辨率、帧率和屏幕纵横比，会和你要投屏的设备保持一致。投屏结束后，这个虚拟显示器会自动消失，不会影响电脑的任何设置。

下面就是这两种软件在 Github 上的开源地址：

Apollo：

&#96;&#96;&#96;
  [github.com](https://github.com/ClassicOldSong/Apollo)
&#96;&#96;&#96;
![](https://github.com/gloria-29/OB-assets/releases/download/img-04/045b3cc782c08f0708172dc7dfab84ab7bc0395e3ff298cbf4c4c2ad87f4a305.png)
### [GitHub - ClassicOldSong/Apollo: Sunshine fork - The easiest way to stream with the…](https://github.com/ClassicOldSong/Apollo)

Sunshine fork - The easiest way to stream with the native resolution of your client device

Artemis：

&#96;&#96;&#96;
  [github.com](https://github.com/ClassicOldSong/moonlight-android)
&#96;&#96;&#96;
![](https://github.com/gloria-29/OB-assets/releases/download/img-a3/a316d39ba879e26c15fc9c7fc3e86c67136661194747b3bed4993556651dca09.png)
### [GitHub - ClassicOldSong/moonlight-android: GameStream client for Android](https://github.com/ClassicOldSong/moonlight-android)

GameStream client for Android

## 一、先配置 PC 端

### 1、先下载 Apollo 的 exe 文件，下载后直接安装，安装完运行时用管理员身份，可能会提示链接不安全，用的是自签名，所以不用担心
![image](https://github.com/gloria-29/OB-assets/releases/download/img-9e/9e9c7546cfe460cb0a0cd5d08e12c8fd8d58dc14e691e1968e4a4e1ffe81e839.png)
### 2、在这个界面设置密码即可，一定要记住，设置好密码页面会自动刷新，需要手动输入刚设置的用户名和密码
![image](https://github.com/gloria-29/OB-assets/releases/download/img-d4/d4847c8ea33103e1c4877e9eb2b9343859b0ba0a62854158fc7b4f3e2bd72f12.png)
### 3、这时候我们会发现登录进去后会提示有个叫 ViGEmBus 的驱动没有装，这是个虚拟手柄驱动，主要是玩游戏用的，必须安装它，它的 Github 项目地址如下，下载安装完并重启一次计算机

&#96;&#96;&#96;
  [github.com](https://github.com/nefarius/ViGEmBus)
&#96;&#96;&#96;
![](https://github.com/gloria-29/OB-assets/releases/download/img-bd/bde6d2f0d5f437b2ad0da3bf9be70f954e898b58402bf212bc35ad00b5ec4c74.png)
### [GitHub - nefarius/ViGEmBus: Windows kernel-mode driver emulating well-known…](https://github.com/nefarius/ViGEmBus)

Windows kernel-mode driver emulating well-known USB game controllers.

### 4、点击上方的 Configuration，做两个设置，把 Locale 由 English 换成简体中文，把下方的 Server Name 设置为 Apolla（这个名可以任意设置，我这样设置只是为了接收端好辨认），到最下方点击保存，并再点击应用
![image](https://github.com/gloria-29/OB-assets/releases/download/img-0c/0c1a42251476f952b6e35e99cc9d72a76262abd2814a47cc54a381497ac35a07.png)
### 5、再次管理员身份打开 Apollo，看到的界面是中文式样的了
![image](https://github.com/gloria-29/OB-assets/releases/download/img-af/af37597be35a8fc2c68e26d0aff3e099660ea83a791b499fe81fbad367e53a20.png)
### 6、点击上方的应用程序，可以看到这里系统默认已经配置了桌面和 Steam 游戏
![image](https://github.com/gloria-29/OB-assets/releases/download/img-8e/8e8a3fe97e332442ffce43be183da2a02285ec0c4a937bc50219b4c5664666b2.png)
### 7、如果想设置一个第三方的游戏，那么可以这样设置，点击添加新应用，给这个新的应用起个名字，在命令里，把游戏的路径拷入，记得带上双引号
![image](https://github.com/gloria-29/OB-assets/releases/download/img-13/13444785a5dfcfab02eb4169e6c6440d314875aeeecd54d643c71399dc122ef3.png)
### 8、向下翻，到总是创建虚拟显示器处，打上勾，这样 Apollo 就会创建一个与客户端帧率相同的虚拟显示器，这样无论你显示器是 4k 屏还是其他屏，Apollo 都会自动匹配你手上设备的刷新率和分辨率，再向下翻，到最后点击保存
![image](https://github.com/gloria-29/OB-assets/releases/download/img-13/13444785a5dfcfab02eb4169e6c6440d314875aeeecd54d643c71399dc122ef3.png)
### 这时候就可以在应用中看到我们刚配置的游戏，以上就是 PC 端的搭建过程。
