---
标题: [跨域协同]  elog+notion实现md优雅备份
笔记 ID: 0198941a-6015-754e-8c81-acfdcd976a2e
笔记类型: crawl
tags:
    - 乐趣/艺术/写作
卡片盒:
    - 乐趣
包含语音: 否
网页链接:
创建时间: "2025-08-10T21:10:12"
更新时间: "2026-03-03T17:59:26.704"
---


2023-10-11 2023-10-11 5359 字 11 分钟

前言
--

* * *

前几天吃午饭的时候，突然想到一件事情，就是关于博客备份的事情。 之前为了对高数 18 讲进行全部重新 CDN 加速，一直用的都是 notion 自带的导出为 markdown 的功能，但是如果数据一多，速度就很慢，而且一个一个导出很费时间。 昨天晚上和今天尝试并使用了 elog，实现了 notion 文章自动批量下载到本地，并根据自定义的数据库属性进行合适的归档。 首先非常感谢这个想法的启蒙博主：某中二的黑科技研究中心 文章标题及链接： [**备份 Notion 文档到 Github**](https://darkreunion.tech/article/backup-notion-to-github?giscus&#61;5b1855710a9073bbb30d3264lzzxL%2FY5boFMZEtzfT2uvrsTkpO815dTCl%2BcFCsI%2FwZTnmkVo1SjQB2CllPRsX9pkEFoeAZ77J%2FviSyilYpOqYYX%2FGm9rbQWTk0T8J0bqUaJf4Q%2BJl9YANenxts%3D)

正文
--

* * *

实践的过程并不顺利，甚至还有些小艰难，作为纯技术小白，以下记录我的一些踩坑经历。

首先从阅读 [技术文档](https://elog.1874.cool/) 开始。

* * *

导航到技术文档的 [快速开始](https://elog.1874.cool/notion/start) ，使用 vscode 创建备份文件夹并开始环境配置。

⚠️ 请注意环境需要正确安装，理论上安装环境的时间在 2-3 分钟左右。

然后对项目进行初始化配置，生成 &#96;elog.config.js&#96; 以及&#96;.elog.env&#96; 两个文件，接下来就是进入 [配置详情](https://elog.1874.cool/notion/fe8ywmt999gon12w) ，配置相应的参数。 ⚠️ 请注意，将您的.elog.env 文件列入 git 的忽略跟踪

    markdown ▷

    shell ▷

* * *

我希望对 notion 的数据库的文章进行批量导出，那么在配置 &#96;elog.config.js&#96; 就需要注意平台的选择。

    javascript ▷

⚠️ 在最开始的时候，我忽视了平台的选择，导致报错： &#96;未知的写作平台&#96;

然后是 notion 相关的配置，首先要关注自己的数据库的属性。 作者大大也提供了数据库的模板，可以参考 [配置流程](https://elog.1874.cool/notion/gvnxobqogetukays#notion) 。

我采用的数据库是 notionnext 的数据库格式，并且 elog 也支持自定义数据库的字段。

    javascript ▷

另外如果想要正确输出到指定目录，还需要注意该问题：

    javascript ▷

![](https://github.com/gloria-29/OB-assets/releases/download/img-d4/d43e1b6dac44dc31471a562bda42510b97fa1977b16643489aca121df9144e14.png)

![](https://github.com/gloria-29/OB-assets/releases/download/img-17/1736342dba5ec559966670ddd4a82e94fb123f4fdde4475655565563b302b7b2.png)

如果要做针对自己数据库的属性更改，请参照 [**Notion API 文档 - Filter database entries**](https://developers.notion.com/reference/post-database-query-filter) **。**

接下来就是正确获取 notion 的 Integration Token 和 DatabaseId，按照 [配置流程](https://elog.1874.cool/notion/gvnxobqogetukays#notion) 走就可以。

![](https://github.com/gloria-29/OB-assets/releases/download/img-4d/4df068d75349e1598bed2cc1ec2a01daacb726ce531e0553db4f41c66a8dfd6d.png)

![](https://github.com/gloria-29/OB-assets/releases/download/img-a6/a6aa2db4ffceb52fe4149beb96f6a549b828067c8750a5caabb88b48b71fd28c.png)

* * *

在正确配置 notion 的集成和 id 之后，可以开始执行

    shell ▷

⚠️ 注意，由于 notion api 的延时问题，校园网条件下，notion api 会经常超时，所以推荐使用手机流量。 如果一切顺利，那么您将可以看到文章被正常输入到本地目录。

* * *

阅读技术文档 [持续集成](https://elog.1874.cool/notion/vy55q9xwlqlsfrvk)

notion 的自动化流程有一定的起手难度。

* * *

通过 slack 捕捉 notion 数据库字段的变化，比如“status”从“Draft”变为“Published”，那么就可以推送到 slack 的频道中，然后开始触发 pipedream，调用 github actions 的 api 进行部署。

* * *

首先，需要进行 slack 注册，授权给 notion 进行关联。

![](https://github.com/gloria-29/OB-assets/releases/download/img-55/555cd5a86d50dbae92e42adad12b680f9daa07d324e0f0b01721915a8ab7b4eb.png)

![](https://github.com/gloria-29/OB-assets/releases/download/img-ff/ff99eefc2517ea0a2fae742bd1aa6d0ca43cbfdea32043e6258b6044a9bc959c.png)

* * *

如果一切顺利，那么接下来进入 pipedream 的部署，将 slack 与 pipedream 进行关联，最困难的是如何配置 https 请求。

![](https://github.com/gloria-29/OB-assets/releases/download/img-1d/1d0ff36025a6cadfcfa7ec7c4f005a926f2a1ec47b6f763807b2f5a9412adb01.png)

在这里我要特别感谢 DC’s 博主，他的文章给了我启发 ： [定期备份 notion](https://aaqq.cc/article/24c2897b-78f3-4f6a-b8e6-292ea60edf7c)

    javascript ▷

    javascript ▷

    javascript ▷

同时参考 1874 博主的 [文档](https://github.com/LetTTGACO/serverless-api) ，正确配置该请求。

在这个步骤中，您还要获取 [GitHub 的 token](https://github.com/settings/tokens/)

如果这一步正确，并且 serverless api 返回 &#96;sussess！&#96; ，那么恭喜你，已经成功了一半了。

* * *

接下来让我们回到 vscode 的文件夹，进行打包环境的安装

    shell ▷

在 &#96;package.json&#96; 加上如下脚本

    javascript ▷

* * *

接下来到了困难的阶段，配置 GitHub 的 actions，首先配置环境变量，主要是 notion 的 token 和 id，填入在第二步获得的参数。

路径如下： &#96;设置-Secrets and variables-Actions-Secrets&#96;

![](https://github.com/gloria-29/OB-assets/releases/download/img-26/26434aeaf0bbf1926e38e740b98d581952b7fa8b343a3d5578593836be77c2ea.png)

接下来创建 GitHub 的工作流：&#96;.github/workflows/main.yaml&#96;

最主要的是这一步，配置完成之后，在 vscode 拉取仓库内容，进行本地和远程的同步。

    yaml ▷

⚠️ 请注意，接下来不要随意在本地和远程双向修改，不然会导致冲突。

* * *

⚠️ 同时注意放开 actions 的写入权限，在该仓库的设置，工作流里找到该选项。

![](https://github.com/gloria-29/OB-assets/releases/download/img-11/118ff8a04d9d925182c23914a89c32dbda94e0a1d16ca47ea216ff21cece703d.png)

* * *

如果一切顺利，当您在 notion 中将文章的状态变为“Published”时候，将会自动触发工作流，进行备份，如果遇到错误，请排查工作流的报错信息。

![](https://github.com/gloria-29/OB-assets/releases/download/img-63/634fc9427f97a73aba33e14fb287107d73817ecbc2a5892ed95a162f45f03f3a.png)

最后当您二次修改文章之后再次触发，文章会进行增量更新。

总结
--

* * *

elog 的项目非常具有实践价值，通过该项目，不仅可以实现博客文档的整洁有序自动化的归档，而且可以兼容多平台，实现数据的自由迁移。

在我遇到困难的时候，离不开群主和群友的耐心解答和帮助！

&gt; 💡 **特别鸣谢：  
&gt; 🌺** [1874 博主的 elog 项目及其技术文档](https://github.com/LetTTGACO/elog)  
&gt; 🌺 [在自行实践遇到困难和解决的宝贵经历](https://bu.dusays.com/2023/10/12/6527510b65304.png)  
&gt; 🌺 [北门清燕](https://www.bmqy.net/2651.html#more) 、 [DC’s](https://aaqq.cc/article/24c2897b-78f3-4f6a-b8e6-292ea60edf7c) 、 [IMQL.LIFE](https://www.imql.life/2023/08/12/Writing_on_The_Cloud_With_YuQue/) 等群友的最佳实践文档

* * *

介绍一下slack

    markdown ▷

actions的权限不够

    markdown ▷

    markdown ▷

actions的本地远程冲突

    markdown ▷

    markdown ▷

1.  在合并远程更改后，解决可能的冲突。如果存在冲突，您需要手动解决它们以确保代码的一致性。
    
2.  确保您有足够的权限来对存储库进行推送操作。请确保您是该存储库的所有者或具有足够的权限来进行推送操作。
    
3.  检查您在 GitHub Actions 的工作流文件中是否正确配置了凭据。您需要在工作流文件中提供正确的凭据，以便能够对存储库进行推送操作。您可以使用 GitHub 提供的 secrets 功能来安全地存储和使用凭据。确保您在工作流文件中使用正确的凭据。
    

请按照上述步骤逐一检查和解决问题。如果问题仍然存在，请提供更多的上下文和详细信息，以便我能够更好地帮助您解决问题。

尽管您已经尝试了之前提到的解决步骤，但问题仍然存在。根据错误消息，推测可能是由于其他人在您尝试推送时同时对相同的分支进行了推送，导致冲突。

在这种情况下，您可以尝试以下步骤：

1.  确保您的本地仓库是干净的，没有未提交的更改。运行以下命令来查看当前的仓库状态：
    
        bash ▷
    
    如果有未提交的更改，请先提交或取消更改，确保仓库是干净的。
    
2.  删除本地分支 &#96;main&#96; ，然后重新拉取远程分支 &#96;main&#96; 的最新状态：
    
        bash ▷
    
    这将删除您本地的 &#96;main&#96; 分支，并从远程存储库中获取最新的 &#96;main&#96; 分支。
    
3.  如果您在本地有重要的更改，可以创建一个新的分支来保存这些更改：
    
        bash ▷
    
    这将创建一个名为 &#96;my_changes&#96; 的新分支，并将您的更改保存在该分支上。
    
4.  现在，尝试将新分支推送到远程存储库：
    
        bash ▷
    
    如果推送成功，您可以在 GitHub 上查看并比较分支，然后创建一个合并请求（Pull Request），将 &#96;my_changes&#96; 分支的更改合并到 &#96;main&#96; 分支中。
    

请注意，如果其他人在您尝试推送时继续对相同的分支进行推送，可能仍会导致冲突。在这种情况下，您需要与其他人协调，以确保您的更改能够成功地合并到主分支中。

如果问题仍然存在，请提供更多的上下文信息，例如您的工作流文件、代码片段或其他相关细节，以便我能够更好地帮助您解决问题。

    &lt;/details&gt;
    
    &lt;details&gt;
      &lt;summary&gt;解决环境变量可见性问题&lt;/summary&gt;
    
    &#96;&#96;&#96;markdown
    如果某个文件已经被 Git 跟踪并提交到仓库中，即使你在 &#96;.gitignore&#96; 文件中将其列为忽略项，它仍然会在仓库中可见。要解决这个问题，你需要执行以下步骤：
    
    1. 首先，从 Git 仓库中删除已经跟踪的文件。可以使用以下命令将文件从 Git 仓库中删除，但保留在本地文件系统中：

git rm –cached

    将 &#96;&lt;file&gt;&#96; 替换为要从 Git 仓库中删除的文件的路径。
    
    2. 然后，将删除的文件添加到 &#96;.gitignore&#96; 文件中，以确保将来不会再次将其纳入版本控制。在 &#96;.gitignore&#96; 文件中添加文件路径或模式，例如：

\&#96;\&#96;\&#96;

1.  最后，提交对 &#96;.gitignore&#96; 文件和已删除文件的更改：

    git add .gitignore
    git commit -m &quot;Remove and ignore the specified file&quot;

这样，已删除的文件将不再出现在 Git 仓库的历史记录中，并且在将来的提交中也不会被包含。

请注意，这些步骤仅会将文件从 Git 仓库中删除，并阻止将来的提交。如果你希望完全从仓库中删除文件的所有痕迹，你可能需要执行其他操作，如修改 Git 的历史记录。这种情况下，建议谨慎操作，并在进行任何重要操作之前备份你的仓库。

    &lt;/details&gt;
    
    &lt;details&gt;
      &lt;summary&gt;如何删除git的历史痕迹&lt;/summary&gt;
    
    &#96;&#96;&#96;markdown
    要删除 Git 仓库中的文件的所有痕迹，包括历史记录和提交信息，可以按照以下步骤进行操作：
    
    1. 首先，确保你备份了重要的文件和仓库，以防止意外数据丢失。
    
    2. 使用 &#96;git filter-branch&#96; 命令来修改 Git 的历史记录。这个命令可以重写提交历史，并删除指定文件的所有痕迹。以下是一个示例命令：

git filter-branch –force –index-filter ‘git rm –cached –ignore-unmatch ’ –prune-empty –tag-name-filter cat – –all

    将 &#96;&lt;file&gt;&#96; 替换为要删除痕迹的文件的路径。这个命令将遍历所有提交，并从中删除指定文件的所有痕迹。
    
    3. 执行该命令后，Git 将会重写历史记录。这可能需要一些时间，具体取决于你的仓库大小和提交数量。在完成后，Git 会显示重写的提交数量。
    
    4. 接下来，使用 &#96;git push --force&#96; 命令将修改后的历史记录推送到远程仓库。请注意，这个命令会强制推送修改后的历史记录，因此请确保你在进行此操作之前已经备份了重要的数据。

git push –force origin

    将 &#96;&lt;branch-name&gt;&#96; 替换为你要推送的分支名称。
    
    这样，指定文件的所有痕迹将从 Git 仓库的历史记录中完全删除。
    
    请注意，这个操作是不可逆的，并且会影响到与指定文件相关的所有提交和分支。因此，在执行此操作之前，请务必谨慎，并确保你理解操作的影响。

set 限制解除

2023-10-11 2023-10-11 5359 字 11 分钟

前言
--

* * *

前几天吃午饭的时候，突然想到一件事情，就是关于博客备份的事情。 之前为了对高数 18 讲进行全部重新 CDN 加速，一直用的都是 notion 自带的导出为 markdown 的功能，但是如果数据一多，速度就很慢，而且一个一个导出很费时间。 昨天晚上和今天尝试并使用了 elog，实现了 notion 文章自动批量下载到本地，并根据自定义的数据库属性进行合适的归档。 首先非常感谢这个想法的启蒙博主：某中二的黑科技研究中心 文章标题及链接： [**备份 Notion 文档到 Github**](https://darkreunion.tech/article/backup-notion-to-github?giscus&#61;5b1855710a9073bbb30d3264lzzxL%2FY5boFMZEtzfT2uvrsTkpO815dTCl%2BcFCsI%2FwZTnmkVo1SjQB2CllPRsX9pkEFoeAZ77J%2FviSyilYpOqYYX%2FGm9rbQWTk0T8J0bqUaJf4Q%2BJl9YANenxts%3D)

正文
--

* * *

实践的过程并不顺利，甚至还有些小艰难，作为纯技术小白，以下记录我的一些踩坑经历。

首先从阅读 [技术文档](https://elog.1874.cool/) 开始。

* * *

导航到技术文档的 [快速开始](https://elog.1874.cool/notion/start) ，使用 vscode 创建备份文件夹并开始环境配置。

⚠️ 请注意环境需要正确安装，理论上安装环境的时间在 2-3 分钟左右。

然后对项目进行初始化配置，生成

    elog.config.js

以及

    .elog.env

两个文件，接下来就是进入 [配置详情](https://elog.1874.cool/notion/fe8ywmt999gon12w) ，配置相应的参数。 ⚠️ 请注意，将您的.elog.env 文件列入 git 的忽略跟踪

    markdown ▷
    
    shell ▷

* * *

我希望对 notion 的数据库的文章进行批量导出，那么在配置

    elog.config.js

就需要注意平台的选择。

    javascript ▷

⚠️ 在最开始的时候，我忽视了平台的选择，导致报错：

    未知的写作平台

然后是 notion 相关的配置，首先要关注自己的数据库的属性。 作者大大也提供了数据库的模板，可以参考 [配置流程](https://elog.1874.cool/notion/gvnxobqogetukays#notion) 。

我采用的数据库是 notionnext 的数据库格式，并且 elog 也支持自定义数据库的字段。

    javascript ▷

另外如果想要正确输出到指定目录，还需要注意该问题：

    javascript ▷

![](https://github.com/gloria-29/OB-assets/releases/download/img-d4/d43e1b6dac44dc31471a562bda42510b97fa1977b16643489aca121df9144e14.png)

![](https://github.com/gloria-29/OB-assets/releases/download/img-17/1736342dba5ec559966670ddd4a82e94fb123f4fdde4475655565563b302b7b2.png)

如果要做针对自己数据库的属性更改，请参照 [**Notion API 文档 - Filter database entries**](https://developers.notion.com/reference/post-database-query-filter) **。**

接下来就是正确获取 notion 的 Integration Token 和 DatabaseId，按照 [配置流程](https://elog.1874.cool/notion/gvnxobqogetukays#notion) 走就可以。

![](https://github.com/gloria-29/OB-assets/releases/download/img-4d/4df068d75349e1598bed2cc1ec2a01daacb726ce531e0553db4f41c66a8dfd6d.png)

![](https://github.com/gloria-29/OB-assets/releases/download/img-a6/a6aa2db4ffceb52fe4149beb96f6a549b828067c8750a5caabb88b48b71fd28c.png)

* * *

在正确配置 notion 的集成和 id 之后，可以开始执行

    shell ▷

⚠️ 注意，由于 notion api 的延时问题，校园网条件下，notion api 会经常超时，所以推荐使用手机流量。 如果一切顺利，那么您将可以看到文章被正常输入到本地目录。

* * *

阅读技术文档 [持续集成](https://elog.1874.cool/notion/vy55q9xwlqlsfrvk)

notion 的自动化流程有一定的起手难度。

* * *

通过 slack 捕捉 notion 数据库字段的变化，比如“status”从“Draft”变为“Published”，那么就可以推送到 slack 的频道中，然后开始触发 pipedream，调用 github actions 的 api 进行部署。

* * *

首先，需要进行 slack 注册，授权给 notion 进行关联。

![](https://github.com/gloria-29/OB-assets/releases/download/img-55/555cd5a86d50dbae92e42adad12b680f9daa07d324e0f0b01721915a8ab7b4eb.png)

![](https://github.com/gloria-29/OB-assets/releases/download/img-ff/ff99eefc2517ea0a2fae742bd1aa6d0ca43cbfdea32043e6258b6044a9bc959c.png)

* * *

如果一切顺利，那么接下来进入 pipedream 的部署，将 slack 与 pipedream 进行关联，最困难的是如何配置 https 请求。

![](https://github.com/gloria-29/OB-assets/releases/download/img-1d/1d0ff36025a6cadfcfa7ec7c4f005a926f2a1ec47b6f763807b2f5a9412adb01.png)

在这里我要特别感谢 DC’s 博主，他的文章给了我启发 ： [定期备份 notion](https://aaqq.cc/article/24c2897b-78f3-4f6a-b8e6-292ea60edf7c)

    javascript ▷
    
    javascript ▷
    
    javascript ▷

同时参考 1874 博主的 [文档](https://github.com/LetTTGACO/serverless-api) ，正确配置该请求。

在这个步骤中，您还要获取 [GitHub 的 token](https://github.com/settings/tokens/)

如果这一步正确，并且 serverless api 返回

    sussess！

，那么恭喜你，已经成功了一半了。

* * *

接下来让我们回到 vscode 的文件夹，进行打包环境的安装

    shell ▷

在

    package.json

加上如下脚本

    javascript ▷

* * *

接下来到了困难的阶段，配置 GitHub 的 actions，首先配置环境变量，主要是 notion 的 token 和 id，填入在第二步获得的参数。

路径如下：

    设置-Secrets and variables-Actions-Secrets

![](https://github.com/gloria-29/OB-assets/releases/download/img-26/26434aeaf0bbf1926e38e740b98d581952b7fa8b343a3d5578593836be77c2ea.png)

接下来创建 GitHub 的工作流：

    .github/workflows/main.yaml

最主要的是这一步，配置完成之后，在 vscode 拉取仓库内容，进行本地和远程的同步。

    yaml ▷

⚠️ 请注意，接下来不要随意在本地和远程双向修改，不然会导致冲突。

* * *

⚠️ 同时注意放开 actions 的写入权限，在该仓库的设置，工作流里找到该选项。

![](https://github.com/gloria-29/OB-assets/releases/download/img-11/118ff8a04d9d925182c23914a89c32dbda94e0a1d16ca47ea216ff21cece703d.png)

* * *

如果一切顺利，当您在 notion 中将文章的状态变为“Published”时候，将会自动触发工作流，进行备份，如果遇到错误，请排查工作流的报错信息。

![](https://github.com/gloria-29/OB-assets/releases/download/img-63/634fc9427f97a73aba33e14fb287107d73817ecbc2a5892ed95a162f45f03f3a.png)

最后当您二次修改文章之后再次触发，文章会进行增量更新。

总结
--

* * *

elog 的项目非常具有实践价值，通过该项目，不仅可以实现博客文档的整洁有序自动化的归档，而且可以兼容多平台，实现数据的自由迁移。

在我遇到困难的时候，离不开群主和群友的耐心解答和帮助！

&gt; 💡 **特别鸣谢：  
&gt; 🌺** [1874 博主的 elog 项目及其技术文档](https://github.com/LetTTGACO/elog)  
&gt; 🌺 [在自行实践遇到困难和解决的宝贵经历](https://bu.dusays.com/2023/10/12/6527510b65304.png)  
&gt; 🌺 [北门清燕](https://www.bmqy.net/2651.html#more) 、 [DC’s](https://aaqq.cc/article/24c2897b-78f3-4f6a-b8e6-292ea60edf7c) 、 [IMQL.LIFE](https://www.imql.life/2023/08/12/Writing_on_The_Cloud_With_YuQue/) 等群友的最佳实践文档

* * *


&gt; 来源：[https://hugo.matrixcore.top/posts/%E6%8E%A8%E8%8D%90/elog/](https://hugo.matrixcore.top/posts/%E6%8E%A8%E8%8D%90/elog/)
