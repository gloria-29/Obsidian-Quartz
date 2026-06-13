---
标题: Tasker for Android
笔记 ID: 0193355a-4b82-78a5-9ef9-0bdc4e9fb6ef
笔记类型: crawl
tags:
    - 自我提升/成长记录
卡片盒:
    - 自我提升
包含语音: 否
网页链接:
创建时间: "2024-11-16T22:22:10"
更新时间: "2026-03-03T17:56:05.702"
---

FAQ: Usage Problems ![Image 1](https://tasker.joaoapps.com/userguide/en/faqs/androidlogo.png) ![Image 2](https://tasker.joaoapps.com/userguide/en/faqs/icon_tasker.png)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

*   [Why doesn&#39;t Tasker work in the background on my device?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#00)
*   [Why won&#39;t Android let me uninstall Tasker ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#0)
*   [Why isn&#39;t GPS coming on for my profile with Time And GPS Location contexts ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#c)
*   [Why can&#39;t I select Tasker for an application context ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#d)
*   [Why does it take my Wifi Near state so long to exit ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#e)
*   [Why isn&#39;t Tasker detecting when my Location Context changes ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#f)
*   [Why does Tasker mess up the app launching when I have an Application Context for it ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#g)
*   [Why does my profile not do anything ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#h)
*   [Why aren&#39;t my settings restored ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#w)
*   [Why does nothing happen when I click a Tasker widget ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#i)
*   [Why does Tasker crash when I try to create a Location Context ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#j)
*   [Why can&#39;t I see any Tasker widgets in the home screen widget selector ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#k)
*   [Why doesn&#39;t my repeating Time Context work ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#l)
*   [Why aren&#39;t my exit tasks run / settings restored before the device shuts down ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#m)
*   [Why does my location exit task fire multiple times ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#n)
*   [Why does my Cell Near state keep going inactive ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#o)
*   [Why doesn&#39;t Notify LED work ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#p)
*   [Why do Tasker widgets disappear after a reboot on my Wildfire ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#q)
*   [Why isn&#39;t my docking station detected ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#r)
*   [Why aren&#39;t I getting any cell data for the Cell Near state ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#s)
*   [Why isn&#39;t there a green light for the On/Off radio button on the main screen ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#t)
*   [Why does the action Display Brightness cause my keyboard or application to close ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#u)
*   [Why is the date in Tasker&#39;s notification list completely wrong ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#v)
*   [Why won&#39;t Tasker install on my custom ROM ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#w)
*   [Why doesn&#39;t my &#96;Perform Task&#96; action work when I Test it ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#x)
*   [Why doesn&#39;t my App Context work ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#app)
*   [Why doesn&#39;t the Keyguard action work properly ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#keyguard)
*   [Why doesn&#39;t Tasker think my device is rooted ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#root)
*   [Why doesn&#39;t Tasker show my Local Media images anymore ?](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#img)

* * *

#### Why don&#39;t Tasker or its plugins work in the background on my device?

To make sure Tasker and its plugins run in the foreground:

*   make sure Tasker is enabled
*   enable foreground notification in Tasker Preferences (this will be automatically enabled on Android 8+, so no need to worry if you have recent versions of Android)
*   enable the &quot;Use reliable alarms&quot; option
*   If you&#39;re on Android 10+ allow Tasker to draw over other apps: Open **Tasker** - **Menu** - **More** - **Android Settings** - **Draw Over Other Apps** and enable the permission.*   **Check out** **[dontkillmyapp.com](https://dontkillmyapp.com/?app&#61;Tasker).** This website will show, for your specific vendor, the best way to allow Tasker to work correctly in the background.
*   Disable battery optimization for the apps
*   Make sure the Android Settings -\&gt; Apps -\&gt; Tasker -\&gt; Battery -\&gt; Background activity option is enabled (this setting may be somewhere else on different OEMs, but it&#39;s a very important setting that might be disabled by default on some devices)
*   If you want to use features while the screen is off make sure that the options in Preferences -\&gt; Monitor -\&gt; Display Off Monitoring are enabled for the conditions you want.
*   Make sure that you disable any &quot;battery saving&quot; apps like Greenify, etc
*   If you want to have Wifi and Cell based profiles work on Android 8+ make sure that location is enabled on your device and **that Tasker has location permissions even when in the background**. It&#39;s an Android requirement that Tasker can&#39;t work around.
*   If you want accelerometer based profiles to work (like when using the **Shake** or **Orientation** conditions) while the screen is off, try setting the **Tasker** \&gt; **Preferences** \&gt; **MONITOR tab** \&gt; **Display Off Monitoring** \&gt; **Accelerometer** option to **Yes, And Keep Android Awake**
*   On Samsung devices go to Android Settings -\&gt; Device Maintenance -\&gt; Battery -\&gt; Unmonitored apps -\&gt; add Tasker and all plugins
*   On Xiaomi devices enable &quot;Auto Start&quot; for the apps and &quot;Display on Lock Screen&quot; under &quot;Other Permissions&quot;
*   On Xiaomi devices disable automatic backup of apps because that process kills all running apps, including Tasker.
*   On Xiaomi devices enable all available options in the [**Additional Permissions** section of the app in System settings](https://tasker.joaoapps.com/userguide/en/faqs/xiaomi%20display%20popup.jpg).
*   On Huawei devices click the [lock in the recents menu](https://tasker.joaoapps.com/userguide/en/faqs/huaweilock.jpg) for all the plugins and Tasker
*   On Huawei devices manage battery optimizations manually in [battery settings](https://tasker.joaoapps.com/userguide/en/faqs/huaweibatteryoptimizations.jpg) for all the plugins and Tasker
*   On Huawei devices disable Powergenie which stops apps from running in the background. Try going to Settings -\&gt; Battery, then tapping on the gear in the upper right corner. Disable &quot;Close excessively power-intensive apps&quot;. Or use ADB:
    
    *   To disable powergenie use: adb shell pm disable-user com.huawei.powergenie
    
    *   To enable powergenie: adb shell pm enable com.huawei.powergenie
*   On Lenovo devices (possibly others) you have to disable the [&quot;Disable Auto Start&quot;](https://tasker.joaoapps.com/userguide/en/faqs/lenovoapps.png) options for Tasker and all AutoApps.
*   If you plan on using plugins, disabling power saver mode may help with some issues

#### Why won&#39;t Android let me uninstall Tasker ?

It&#39;s probably because you&#39;re using an action which needs Tasker&#39;s device administrator function (e.g. &#96;Display / System Lock&#96;).You can disable it by going to &#96;Android Settings / Location &amp; Security / Device Administration&#96;.

#### Why isn&#39;t GPS coming on for my profile with Time And GPS Location contexts ?

In order to save power, Tasker only activates context detection as it is needed. Therefore it will not attempt to fix your GPS location unless the Time context is active.See the [Power Usage](https://tasker.joaoapps.com/userguide/en/faqs/userguide/en/power.html) section of the userguide for more details.

#### Why can&#39;t I select Tasker for an application context ?

This is considered too dangerous. A mistake could easily result in being unable to enter Tasker and therefore being unable to rectify the mistake.

#### Why does it take my Wifi Near state so long to exit ?

Wifi Near requires **two** check periods to pass without seeing the Access Point before the profile exits. This is intended to avoid the context activating and deactivating if the AP is briefly not visible.

Note also that there are different check periods for when the device is on or off, and by default the off-period is much longer than the on-period. See Menu / Preferences / Monitor/ Display On/Off Timings.

#### Why isn&#39;t Tasker detecting when my Location Context changes ?

Your radius is probably too small.

As an example, if you are not using GPS the accuracy of your fixes is probably around +&#61; 2km, so your radius should be also minimally 2km.

If you \*are\* using GPS, the accuracy may still be only +-400m in built-up areas.

Here&#39;s a good way to create a location context:

*   go to the geographical location you want a context for
*   make a new location context
*   deselect GPS if you don&#39;t want to use it
*   press Grab Fix, and wait till it&#39;s done

This will set your radius appropriate to the accuracy of the location providers at that spot.

If there&#39;s still nothing happening:

*   check GPS is on in Android Settings, if you&#39;re using GPS.
*   check your device has a view of the sky, if you&#39;re using GPS
*   network connectivity is often needed to get GPS started, and always needed for a Net location context.
*   realize that location is only checked every 10 minutes by default when the Display is off (to save power). You can check more often by changing &#96;Menu / Prefs / Monitor / Display Off Timings / All Checks&#96;*   try the [general &#39;nothing happens&#39;](https://tasker.joaoapps.com/userguide/en/faqs/faq-problem.html#h) tips
*   look at [other possibilities for detecting your location](https://tasker.joaoapps.com/userguide/en/loctears.html)

#### Why does Tasker mess up the app launching when I have an Application Context for it ?

Some applications are sensitive like this. Probably all you have to do is put as the first action in the **Enter** task the action _Wait_ and give as a parameter e.g. 300ms. If that doesn&#39;t work keep increasing the value until it does.

That gives the application time to finish initializing before messing around with the screen brightness etc.

#### Why aren&#39;t my settings restored ?

Some possibilities:

*   if your profile sets setting x to _on_, then if x is already _on_ when the profile goes active, it will be left at _1_ when the profile exits. Test for this by putting an Alert / Notify action in the enter task to see what the original value was.
*   some other apps installed on the system can cause Tasker to be killed and therefore the original settings being forgotten e.g. this has been reported to be a problem with Titanium Backup.
*   similarly, if the system is rebooted suddenly, some devices aren&#39;t fast enough to save all the settings before the system turns off.

#### Why does my profile not do anything ?

Firstly, if are you using any of these other apps which have been reported as interfering try disabling or temporarily uninstalling them:

*   &#39;Task Killers&#39;
*   Quick System Info
*   Autostarts

After that:

*   is the profile enabled ? It should have a green tick next to it.*   have you clicked the _On_ button in the [Profile List screen](https://tasker.joaoapps.com/userguide/en/faqs/userguide/en/activity_summary.html) before leaving Tasker ? It should be showing a **green light**.
*   is the profile shown as active in the status bar pulldown ? If so, it&#39;s probably your task that&#39;s not working.
*   make sure the Monitor service running in the foreground (see &#96;Menu / Prefs / Monitor&#96;)
*   how&#39;s your available memory, see &#96;Android Settings / Application / Running Services / Available Memory&#96;. Are you maybe getting Tasker&#39;s low-memory notifications ?

If your profile is activating but the task doesn&#39;t seem to do anything:

*   perhaps you are running a pirated version of Tasker ?
*   try enabling **Menu / Prefs / More / Popup Warning/Errors** to see if any errors are occuring (they may not be shown till you go back to the Tasker UI)
*   look in **Menu / More / Run Log** to see if the task is being carried out.
*   try a simple task like _Alert / Vibrate_ or _Alert / Flash_
*   perhaps another profile is interfering: do **Menu / Data / Backup**, then delete all other profiles except the one that&#39;s not working

#### Why does nothing happen when I click a Tasker widget ?

Usually this is due to Tasker not being enabled, see the _On/Off_ button in the first UI screen.

#### Why does Tasker crash when I try to create a Location Context ?

The likely cause is that you are running a non-standard Android ROM which doesn&#39;t contain the correct (or maybe any) Google Maps library.

#### Why can&#39;t I see any Tasker widgets in the home screen widget selector ?

This is almost always because you have Tasker installed on the SD card, which is just not possible due to several reasons related to how Tasker works.

#### Why doesn&#39;t my repeating Time Context work ?

It&#39;s important to understand that a repeating time context is a **series of instant events**.

Trying to combine a repeating time context with another context that does active monitoring usually won&#39;t work e.g.

&gt; &#96;&#96;&#96;
&gt; 
&gt; &#9;Time: Repeating Every 5 Minutes
&gt;   
&gt; &#9;Task: Enable Wifi (no toggle)
&gt; &#96;&#96;&#96;

&gt; &#96;&#96;&#96;
&gt; 
&gt; &#9;State: Wifi Near
&gt;   
&gt; &#9;Task: XXX
&gt; &#96;&#96;&#96;

Wifi Near is checked on a static schedule. You currently can&#39;t change the schedule dynamically, so the above two profiles will only do XXX when the 5 minute repeat happens to coincide with when Tasker is doing it&#39;s Wifi Near check.

#### Why aren&#39;t my exit tasks run / settings restored before the device shuts down ?

Android gives an app very little time to perform cleanup during shutdown, this is especially a problem on slow devices.Therefore (as of 1.0.9), Tasker only attempts to run _Variable Set, Clear, Add_ and _Subtract_ actions when the device shuts down, since they take relatively little time.

In the future, Tasker will have some concept of default values which will then be restored when it starts after the device has booted again.

On Android 1.5 devices, Tasker cannot do anything at shutdown because the system does not send a notification.

#### Why does my location exit task fire multiple times ?

Probably the location Android reports is _bouncing_ between a point inside your location radius and one outside. This is relatively unusual because Tasker has some built-in mechanisms to try and prevent it.A quick fix is to add a _Cooldown_ to your profile. Click on a context, select Profile then Properties and slide the Cooldown Time to 30 minutes.

The profile is then prevented from going active more than once every 30 minutes.

#### Why does my Cell Near state keep going inactive ?

Even when your phone is motionless, it will probably still often switch between different cell towers. Going to a different room in your house may involve a whole different set of cell towers.When you notice your Cell Near state going inactive at your location (and assuming you still have a signal), launch Tasker, click on the Cell Near context and edit it. Click **Scan** and you should immediately see a new Cell added to the list. Click **Done** and then **Apply** and your context should go active again.

Sometimes the new cell will only be visible for a few seconds and will not appear when you press scan. In that case, press the **Recent** button and select it manually from the list.

#### Why doesn&#39;t Notify LED work ?

From the action help (hint hint):

*   not all devices support all colours. Many devices will only support red and green. In general, colours near the top of the list are more likely to be supported.
*   some devices will only flash the LED when the device is off at the time the notification is received.

#### Why do Tasker widgets disappear after a reboot on my Wildfire ?

This is a bug on some Wildfire firmware version.It&#39;s not possible for the Tasker developer to work around, but is reported as fixed in version 1.25.405.1 of the firmware.

#### Why isn&#39;t my docking station detected ?

Some docking stations just aren&#39;t recognized as such (Android doesn&#39;t indicate that a docking station has been connected).Depending on other things you connect your device to, you might be able to use one of the following as a workaround:

*   State: USB connected
*   State: Power
*   State: BT Connected (if it&#39;s a BT dock)

#### Why aren&#39;t I getting any cell data for the Cell Near state ?

A user reports being able to fix this issue as follows:

I was able to fix this issue by going into the EPST menues using
##DATA# on the keypad and changing the EVDO Preferred mode from HDR to
Automatic.

It&#39;s possible that you will only be able to receive, not make, phone calls as another symptom of this problem.

#### Why isn&#39;t there a green light for the On/Off radio button on the main screen ?

A user discovered that this happens when the DPI value of the Android build is set to particulart values (e.g. 200,240 is OK, 220 the light disappears).

#### Why does the action Display Brightness cause my keyboard or application to close ?

Normally Android does not effect changes to brightness immediately, so Tasker has to use a trick to make it happen. That trick can sometimes have the side effect that e.g. some dialogs like the soft keyboard may close.To avoid that, you can deselect the Immediate Effect checkbox in the Display Brightness action.

#### Why is the date in Tasker&#39;s notification list completely wrong ?

This occurs if you select a transparent _Notification Icon_ at &#96;Menu / Prefs / Monitor&#96;, but don&#39;t specify a _Custom Notification Layout_.

Changing to a non-transparent icon or a custom layout will fix the problem.

#### Why won&#39;t Tasker install on my custom ROM ?

The most likely reason is that you don&#39;t have Google Maps installed on the device. With several custom ROMs that comes as a separate package.

#### Why doesn&#39;t my &#96;Perform Task&#96; action work when I Test it ?

When task (a) runs a &#96;Perform Task&#96; action to start task (b), the order in which the two tasks are executed depends on their relative priorities.

A feature of the Test button is that the tested task (a) runs at extremely high priority to ensure that the task runs even if other tasks are running in the background.

So testing &#96;Perform Task&#96; with the Test button will only work as expected if in actual usage task (a) will always have higher priority than task (b) or the &#96;Perform Task&#96; action has **Stop** specified.

#### Why doesn&#39;t my App Context work ?

First, we need to find out which method Tasker is using to detect app changes on your device.Disable &#96;Menu / Prefs / UI / Beginner Mode&#96; then look in &#96;Menu / Prefs / Monitor&#96; to see if you have an entry **App Check Method**. If you don&#39;t have such an entry, Tasker is using its _Accessibility Service_.

If Tasker is using Usage Stats for app detection, you need to ask Android to give Tasker permission to do that, see &#96;Menu / More / Android Settings / App Usage Stats&#96;. Otherwise, you need to make sure Tasker&#39;s Accessibility Service is enabled in Android Settings, see &#96;Menu / More / Android Settings / Accessibility service&#96;.

Further tips:

*   if Tasker offers you the choice to use different methods, try the other methods. Remember to give Tasker permission in Android settings for the new method (see above).
*   If you are using Nova Launcher, set &#96;Settings / App &amp; Widget Drawer / Advanced / Automatically Close&#96; to **off**.
*   Some apps (very few) aren&#39;t detected by Tasker, usually due to their internal structure.
*   Some custom Android ROMs also have special configurations which prevent Tasker&#39;s app detection working.

For the latter problem, there are a few things you can try:

*   look for special settings in your ROM that relate to &#39;keeping the launcher in memory&#39;. They should be **disabled**.
*   change the build properties file. Look in &#96;/system/build.prop&#96; (or possibly &#96;/system/local.prop&#96; or &#96;/data/local.prop&#96;) for a line like:
    
    &gt; ro.HOME\_APP\_ADJ&#61;-17
    
    Change it in a terminal program to look like this:
    
    &gt; ro.HOME\_APP\_ADJ&#61;1
    
    If you didn&#39;t find an existing line, just add the new line as above.
    
    Note: you will first need to make &#96;/system&#96; writeable. You can do that e.g. with Tasker&#39;s &#96;Remount&#96; action. Remember to make it not-writeable again after making the change.
    
*   try detecting apps with a state using the **%WIN** (_window title_) variable; create a new state
    
    &gt; &#96;Variable Value, %WIN, Matches, TITLE&#96;
    
    where TITLE is the title of the window of the app you are interested in. For this solution to work, you also need to enable Tasker&#39;s _Accessibility Service_ in Android Settings.You can check what %WIN shows for the app you are interested in with this profile:
    
    &gt; Event: Variable Set, %WIN  
    &gt; Alert / Flash, Win is now %WIN
    

#### Why doesn&#39;t the Keyguard action work properly ?

Android does not officially support toggling of the Keyguard by an app. The Keyguard action was introduced in an early version of Tasker when a reliable workaround was possible.

In more recent Android versions, the workaround is no longer so reliable due to internal changes made within Android. If Keyguard works at all, there may be disturbing side-effects.

The Keyguard action will likely be most reliablewhen the display is on and and the Keyguard is already unlocked.

Some people have more luck with the same functionality provided by the [Secure Settings plugin](https://play.google.com/store/apps/details?id&#61;com.intangibleobject.securesettings.plugin). After install, you can find the Secure Settings plugin in the **Plugin** action category. Note that a rooted device is **not** needed to use this part of Secure Settings.

#### Why doesn&#39;t Tasker think my device is rooted ?

Tasker requires two things before root functionality is enabled:

1.  the &#96;su&#96; program must be in your path
2.  **one** of the following must be found:
    *   a superuser package
    *   the word _modversion_ somewhere in the file &#96;/system/build.prop&#96;

If root is not being detected on your device but you are sure that root can be used by Tasker, you can therefore probably fix that by adding a line like:

&gt; &#96;# modversion this line enables Tasker root support&#96;

to the top of the file &#96;/system/build.prop&#96;.

#### Why doesn&#39;t Tasker show my Local Media images anymore ?

When you select a Local Media image, Android grants Tasker rights to keep using it.However, when you uninstall Tasker, Android forgets those rights and doesn&#39;t reassign them when you install Tasker again. This is clearly a failing in Android... On some devices Android also forgets the rights when the device is rebooted, but this is very rare and almost certainly a problem with the particular device involved.

To fix the problem, you wil unfortunately need to reselect the Local Media images in the Tasker UI so that Android grants it access rights again.
