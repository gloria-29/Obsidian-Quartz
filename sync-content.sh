#!/bin/bash
# 同步 Obsidian wiki 内容到 Quartz 项目
# 运行方式: bash sync-content.sh

set -e

OBSIDIAN_WIKI="/Users/mac/Documents/OB/llmwiki"
QUARTZ_CONTENT="content"

echo "🔄 正在同步 Obsidian wiki 内容..."
echo "来源: $OBSIDIAN_WIKI"
echo "目标: $QUARTZ_CONTENT"

# 清空 content 目录（保留 .git）
rm -rf "$QUARTZ_CONTENT"
mkdir "$QUARTZ_CONTENT"

# 复制所有内容（保留 .gitkeep）
cp -RL "$OBSIDIAN_WIKI"/* "$QUARTZ_CONTENT/"

echo "✅ 内容同步完成！"
echo ""
echo "现在运行以下命令提交并推送："
echo "  git add content/"
echo '  git commit -m "更新 Obsidian wiki 内容"'
echo "  git push origin v5"
