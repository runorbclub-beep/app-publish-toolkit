#!/bin/bash
# 应用图标自动缩放脚本
# 用法: bash resize-icon.sh icon-1024.png

set -e

INPUT=$1
if [ -z "$INPUT" ]; then
    echo "用法: bash resize-icon.sh <input-icon-1024.png>"
    exit 1
fi

if ! command -v sips &> /dev/null; then
    echo "错误: 需要 sips 命令（macOS 自带）"
    echo "Linux 用户请安装 ImageMagick 并使用 convert 命令"
    exit 1
fi

OUTPUT_DIR="app-icons"
mkdir -p "$OUTPUT_DIR"

# iOS 图标尺寸
declare -a IOS_SIZES=(
    "20:icon-20.png"
    "29:icon-29.png"
    "40:icon-40.png"
    "58:icon-58.png"
    "60:icon-60.png"
    "76:icon-76.png"
    "80:icon-80.png"
    "87:icon-87.png"
    "120:icon-120.png"
    "152:icon-152.png"
    "167:icon-167.png"
    "180:icon-180.png"
    "1024:icon-1024.png"
)

# Android 图标尺寸
declare -a ANDROID_SIZES=(
    "36:mipmap-ldpi/ic_launcher.png"
    "48:mipmap-mdpi/ic_launcher.png"
    "72:mipmap-hdpi/ic_launcher.png"
    "96:mipmap-xhdpi/ic_launcher.png"
    "144:mipmap-xxhdpi/ic_launcher.png"
    "192:mipmap-xxxhdpi/ic_launcher.png"
)

echo "生成 iOS 图标..."
for item in "${IOS_SIZES[@]}"; do
    size="${item%%:*}"
    name="${item##*:}"
    sips -z $size $size "$INPUT" --out "$OUTPUT_DIR/ios/$name" > /dev/null
    echo "  ✅ $name ($size×$size)"
done

echo "生成 Android 图标..."
for item in "${ANDROID_SIZES[@]}"; do
    size="${item%%:*}"
    path="${item##*:}"
    mkdir -p "$OUTPUT_DIR/android/$(dirname $path)"
    sips -z $size $size "$INPUT" --out "$OUTPUT_DIR/android/$path" > /dev/null
    echo "  ✅ $path ($size×$size)"
done

# Google Play 图标
sips -z 512 512 "$INPUT" --out "$OUTPUT_DIR/play-store-icon.png" > /dev/null
echo "  ✅ play-store-icon.png (512×512)"

echo ""
echo "🎉 全部完成！图标保存在 $OUTPUT_DIR/ 目录"
