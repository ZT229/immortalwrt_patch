#!/bin/sh

# 设置主题目录路径
THEME_DIR="themes/luci-theme-argon"

# 检测是否在 luci 根目录（即脚本和 themes/ 应该同级）
if [ ! -d "./themes" ] || [ ! -f "./luci.patch" ]; then
  echo "❌ 错误：请在 luci 源码根目录下运行此脚本！"
  exit 1
fi

# 检测主题目录是否存在
if [ ! -d "$THEME_DIR" ]; then
  echo "❌ 错误：未找到主题目录 $THEME_DIR"
  exit 1
fi

# 执行颜色替换
find "$THEME_DIR" -type f -exec sed -i 's/#5e72e4/#6c8fa9/g' {} +
find "$THEME_DIR" -type f -exec sed -i 's/#483d8b/#6c8fa9/g' {} +

# 提示完成
echo "✅ luci-theme-argon 主题颜色替换完成："
echo "  #5e72e4 → #6c8fa9"
echo "  #483d8b → #6c8fa9"
