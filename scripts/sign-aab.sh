#!/bin/bash
# AAB 签名检查脚本
# 用法: bash sign-aab.sh app-release.aab your-keystore.jks your-alias

set -e

AAB_FILE=$1
KEYSTORE=$2
ALIAS=$3

if [ -z "$AAB_FILE" ] || [ -z "$KEYSTORE" ] || [ -z "$ALIAS" ]; then
    echo "用法: bash sign-aab.sh <aab-file> <keystore> <alias>"
    exit 1
fi

if [ ! -f "$AAB_FILE" ]; then
    echo "错误: AAB 文件不存在: $AAB_FILE"
    exit 1
fi

if [ ! -f "$KEYSTORE" ]; then
    echo "错误: Keystore 文件不存在: $KEYSTORE"
    exit 1
fi

echo "=== AAB 签名检查 ==="
echo ""

# 检查是否已签名
echo "1. 检查当前签名状态..."
if unzip -l "$AAB_FILE" | grep -q "META-INF/*.RSA"; then
    echo "  ⚠️  AAB 已包含签名"
else
    echo "  ✅ AAB 未签名（需要签名）"
fi

echo ""
echo "2. Keystore 信息:"
keytool -list -v -keystore "$KEYSTORE" -alias "$ALIAS" 2>/dev/null | head -20

echo ""
echo "3. 签名命令（如需手动签名）:"
echo "  jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 \\"
echo "    -keystore $KEYSTORE \\"
echo "    $AAB_FILE \\"
echo "    $ALIAS"

echo ""
echo "4. 对齐命令（Android SDK build-tools）:"
echo "  zipalign -v 4 $AAB_FILE app-release-aligned.aab"

echo ""
echo "⚠️  注意: 如果使用 Gradle signingConfigs，构建时已自动签名"
echo "  ./gradlew bundleRelease"
