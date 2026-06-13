---
标题: 基于Gemini的PDF知识提取与笔记自动化
笔记 ID: 0198e776-5397-7284-a6a3-7523397d4c71
笔记类型: crawl
tags:
    - 学习/学术学习
卡片盒:
    - 学习
包含语音: 否
网页链接:
创建时间: "2025-08-27T01:39:43"
更新时间: "2026-03-03T01:06:58.253"
---

最近在准备预推免复习之前的知识点，为了快速看概念，我通过切分 pdf，再喂给 aistudio 的 gemini2.5pro 来帮我提取知识点 markdown 笔记。

为什么是 gemini，主要是因为他免费（），上下文长，输出长，pdf 识别较好

上下文长体现在相同的内容，可能豆包网页版会超过限制

输出长体现在他和 GPT 比，更不容易半路截断

效果如下
![image](https://github.com/gloria-29/OB-assets/releases/download/img-c6/c6a021b4ff225d618dbdd9d88722c7c68a63c9bf6432a15d62b808bdb96cbc08.png)

提示词如下

&#96;&#96;&#96;
你是一个熟悉计算机专业的高级助手，帮助用户整理复习用的markdown笔记，在obsidian中预览。

## 笔记要求如下
- 主题用# 标题，第一个从一级标题# 开始，第二个用## 
- 数学公式使用katex
短的公式或者字母引用用这种格式$w_i$，只需要一个$
长的公式用下面这种格式，需要两个$$
$$
E &#61; m c ^2
$$
$$
\begin{bmatrix} 1 &amp; -2 &amp; 1 &amp; 0 \\ 0 &amp; 2 &amp; -8 &amp; 8 \\ 5 &amp; 0 &amp; -5 &amp; 10 \end{bmatrix}
\xrightarrow{R_3 \to R_3 - 5R_1}
\begin{bmatrix} 1 &amp; -2 &amp; 1 &amp; 0 \\ 0 &amp; 2 &amp; -8 &amp; 8 \\ 0 &amp; 10 &amp; -10 &amp; 10 \end{bmatrix}
$$
- 对于markdown表格中 的数学公式，需要小心地转义|，防止冲突，下面是一个转义的例子
| 零空间 (Nul A)                                                         | 列空间 (Col A)                                                                     |
| :------------------------------------------------------------------ | :------------------------------------------------------------------------------ |
| 给定 $\boldsymbol{v}$，判断是否属于 Nul A **很容易** (计算 $A\boldsymbol{v}$)     | 给定 $\boldsymbol{v}$，判断是否属于 Col A **需要计算** (求解 $[A\|\boldsymbol{v}]$)            |
比如这里的 $[A\|\boldsymbol{v}]$ 在|前面用了\来转义
- 按照用户提供的大纲详细输出每个知识点
- 先确定每个小章节有多少个要写的知识点和章节，再去完成笔记
- 对于知识点，先阐述定理(定理和数字之间不要加空格，方便用户搜索），如果需要可以使用函数图形便于理解，再在后面用&gt; 写下便于第一人看见这个定理的人的直观理解，最后对每个知识点写下包含具体步骤的例题
- 记得不要漏掉PDF中的定理，在每一个子章节你都需要从最小数字到你写的最大数字来检查，防止遗漏！
- 记得不要漏洞PDF中有数字标识的重要公式，一般是(1.1),(1.2)这种，你可以参考定理的方法来回顾解决遗漏问题。
- 不要使用分隔符&#96;---&#96;，obsidian的分隔符并不好看
- 不要使用图片引用或者标签，因为这些复制后是无法在本地看见的，你看见的图片路径对用户是不可见的。
-------
此处粘贴你的书籍章节目录
&#96;&#96;&#96;

切割 pdf 的脚本

File: extra\_page.py

&#96;&#96;&#96;
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
&quot;&quot;&quot;
PDF页面提取工具
可以从PDF文件中提取指定页面范围并保存为新的PDF文件。
同时，为每个提取的PDF创建一个同名的空Markdown文件。
&quot;&quot;&quot;

import os
from pypdf import PdfReader, PdfWriter


def extract_pages(pdf_path, page_ranges, offset&#61;0):
    &quot;&quot;&quot;
    从PDF文件中提取指定页面范围，保存为新PDF，并创建同名Markdown文件。

    参数:
    pdf_path (str): PDF文件路径
    page_ranges (list): 页面范围列表，每个元素为(start, end, pdfname)元组，
                       表示从start到end的页面范围（包含两端）和输出PDF文件名
                       页面编号从1开始
    offset (int): 页面偏移量，默认为0。如果不为0，则在提取页面时会在start和end都加上这个偏移量

    输出:
    在原始PDF相同目录下创建指定名称的PDF文件和空的Markdown文件。

    异常:
    FileNotFoundError: 当PDF文件不存在时
    Exception: 当处理PDF文件出现其他错误时
    &quot;&quot;&quot;
    # 检查PDF文件是否存在
    if not os.path.exists(pdf_path):
        raise FileNotFoundError(f&quot;PDF文件不存在: {pdf_path}&quot;)

    try:
        # 获取PDF文件所在目录
        pdf_dir &#61; os.path.dirname(pdf_path)
        if not pdf_dir:
            pdf_dir &#61; &quot;.&quot;

        # 读取PDF文件
        reader &#61; PdfReader(pdf_path)
        total_pages &#61; len(reader.pages)

        print(f&quot;PDF文件总页数: {total_pages}&quot;)

        # 处理每个页面范围
        for start, end, base_filename in page_ranges:
            # 应用页面偏移
            actual_start &#61; start + offset
            actual_end &#61; end + offset

            # 检查页面范围是否有效
            if actual_start &lt; 1 or actual_end &lt; 1:
                print(f&quot;警告: 页面范围({start}, {end})加上偏移量{offset}后无效，页面编号应从1开始&quot;)
                continue

            if actual_start &gt; total_pages or actual_end &gt; total_pages:
                print(f&quot;警告: 页面范围({start}, {end})加上偏移量{offset}后超出PDF总页数({total_pages})&quot;)
                continue

            if actual_start &gt; actual_end:
                print(f&quot;警告: 页面范围({start}, {end})加上偏移量{offset}后起始页大于结束页&quot;)
                continue

            # 创建PdfWriter对象
            writer &#61; PdfWriter()

            # 添加指定范围的页面
            for page_num in range(actual_start - 1, actual_end):  # pypdf的页面索引从0开始
                writer.add_page(reader.pages[page_num])

            # --- PDF 文件处理 ---
            # 如果没有后缀自动加.pdf
            pdf_output_filename &#61; base_filename
            if not pdf_output_filename.endswith(&quot;.pdf&quot;):
                pdf_output_filename +&#61; &quot;.pdf&quot;

            # 生成PDF输出文件路径
            output_path &#61; os.path.join(pdf_dir, pdf_output_filename)

            # 保存新的PDF文件
            with open(output_path, &quot;wb&quot;) as output_file:
                writer.write(output_file)

            print(f&quot;已保存页面范围 {start}-{end} 到文件: {output_path}&quot;)

            # --- Markdown 文件处理 ---
            # 使用基础文件名创建Markdown文件名
            md_output_filename &#61; base_filename + &quot;.md&quot;
            md_output_path &#61; os.path.join(pdf_dir, md_output_filename)

            # 创建空的Markdown文件
            try:
                with open(md_output_path, &quot;w&quot;, encoding&#61;&quot;utf-8&quot;) as md_file:
                    pass  # 创建并立即关闭文件，使其为空
                print(f&quot;已创建Markdown文件: {md_output_path}&quot;)
            except Exception as e:
                print(f&quot;创建Markdown文件 &#39;{md_output_path}&#39; 时出错: {e}&quot;)


    except Exception as e:
        print(f&quot;处理PDF文件时出错: {e}&quot;)
        raise


def main():
    &quot;&quot;&quot;
    主函数，直接设置PDF路径和提取列表
    &quot;&quot;&quot;
    # 设置PDF文件路径
    pdf_path &#61; &quot;计算机组成原理/2025王道计算机组成原理.pdf&quot;

    # 设置页面范围列表，格式为(start, end, pdfname)
    page_ranges &#61; [
        (15, 39, &quot;第1章 计算机系统概述&quot;),
        (40, 93, &quot;第2章 数据的表示和运算&quot;),
        (94, 168, &quot;第3章 存储系统&quot;),
        (169, 218, &quot;第4章 指令系统&quot;),
        (219, 293, &quot;第5章 中央处理器&quot;),
        (294, 310, &quot;第6章 总线&quot;),
        (311, 347, &quot;第7章 输入输出系统&quot;),
    ]

    try:
        extract_pages(pdf_path, page_ranges, offset&#61;0)
        print(&quot;\n页面提取完成!&quot;)
    except FileNotFoundError:
        print(f&quot;错误: 找不到PDF文件 &#39;{pdf_path}&#39;&quot;)
    except Exception as e:
        print(f&quot;错误: {e}&quot;)


if __name__ &#61;&#61; &quot;__main__&quot;:
    main()
&#96;&#96;&#96;

切割脚本的 page\_ranges 可以通过把目录截图给 gemini，让他输出这个，就不用自己写了

&#96;extract_pages(pdf_path, page_ranges, offset&#61;0)&#96; 的 offset 指的是 pdf 偏移，需要人工写，相当于看书本第一页对应 pdf 的第几页，offset 就写这一页 - 1

比如下面第一页在 pdf 是 15，offset 就写 14

代码没写是因为我这个 pdf 有书签，我直接拿的书签给 gemini 的，书签是真实页数，假如没有书签的话，&#96;(15, 39, &quot;第1章 计算机系统概述&quot;),&#96; 应该是&#96;(1, 24, &quot;第1章 计算机系统概述&quot;),&#96; 这时候就需要这个 offset 了
![image](https://github.com/gloria-29/OB-assets/releases/download/img-91/917f38b1e10838db39d3685b27d3fdbeee7081a37437bbf1ef87109ef69f34c2.jpg)![image](https://github.com/gloria-29/OB-assets/releases/download/img-c9/c9b970f4ca311e76e315a1d7a1167b30c7081056318e6487ebb2f44d37840044.png)
