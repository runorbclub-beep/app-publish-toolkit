# Codemagic CI/CD 配置指南

> 基于 RunOrb App Codemagic 构建经验整理（首次构建成功：3分15秒）

## 目录
1. [Codemagic 简介](#1-codemagic-简介)
2. [项目配置](#2-项目配置)
3. [签名配置](#3-签名配置)
4. [codemagic.yaml 详解](#4-codemagicyaml-详解)
5. [常见问题](#5-常见问题)

---

## 1. Codemagic 简介

Codemagic 是专为移动应用开发的 CI/CD 平台，支持：
- iOS / Android / Flutter / React Native / Capacitor
- 自动签名（iOS App Store Connect API Key）
- 自动构建 + 测试 + 分发
- 免费额度：500 分钟/月

### 为什么选 Codemagic？
- ✅ 原生支持 iOS 签名（无需 Mac 电脑）
- ✅ 免费额度足够中小项目
- ✅ 配置简单（YAML 文件）
- ✅ 支持私有仓库

### vs 其他方案
| 平台 | iOS 签名 | 免费额度 | 配置难度 |
|---|---|---|---|
| Codemagic | ✅ 原生 | 500分钟/月 | 中等 |
| GitHub Actions | 需自配 | 2000分钟/月 | 困难 |
| Bitrise | ✅ 原生 | 有限试用 | 中等 |
| Fastlane | 需 Mac | 开源免费 | 困难 |

---

## 2. 项目配置

### 连接仓库
1. 注册 https://codemagic.io
2. 连接 GitHub/GitLab/Bitbucket 仓库
3. 选择项目类型（iOS / Android / Flutter 等）

### 创建 codemagic.yaml
在项目根目录创建 `codemagic.yaml` 文件。

---

## 3. 签名配置

### iOS 签名（App Store Connect API Key）

1. 登录 App Store Connect → Users and Access → Integrations → API Keys
2. 点击「+」创建 API Key
   - Name: Codemagic
   - Access: App Manager
3. 记录以下信息：
   - **Issuer ID**：页面顶部显示
   - **Key ID**：创建后显示
   - **Private Key**：下载 .p8 文件

4. 在 Codemagic 中添加环境变量：
   ```
   APP_STORE_CONNECT_PRIVATE_KEY  → .p8 文件内容
   APP_STORE_CONNECT_KEY_IDENTIFIER → Key ID
   APP_STORE_CONNECT_ISSUER_ID → Issuer ID
   ```

### Android 签名（Keystore）

1. 生成 keystore（见 Google Play 指南）
2. 在 Codemagic 中添加环境变量：
   ```
   CM_KEYSTORE_PATH → keystore 文件路径
   CM_KEYSTORE_PASSWORD → keystore 密码
   CM_KEY_ALIAS → key alias
   CM_KEY_PASSWORD → key 密码
   ```
3. 上传 keystore 文件到 Codemagic Code Signing

---

## 4. codemagic.yaml 详解

### Capacitor 项目示例

```yaml
workflows:
  ios-workflow:
    name: iOS Build
    instance_type: mac_mini_m1
    max_build_duration: 30
    environment:
      vars:
        APP_STORE_CONNECT_PRIVATE_KEY: Encrypted(...)
        APP_STORE_CONNECT_KEY_IDENTIFIER: Encrypted(...)
        APP_STORE_CONNECT_ISSUER_ID: Encrypted(...)
      node: 20
      xcode: latest
      cocoapods: default
    scripts:
      - name: Install dependencies
        script: |
          npm install
      - name: Capacitor sync
        script: |
          npx cap sync ios
      - name: Pod install
        script: |
          cd ios/App
          pod install
      - name: Set up code signing settings
        script: |
          # Patch Pods targets to disable code signing
          cd ios/App/Pods
          for target in $(xcodebuild -list -project Pods.xcodeproj | grep -A 100 "Targets:" | tail -n +2 | grep -v "^$"); do
            xcodebuild -project Pods.xcodeproj -target "$target" \
              CODE_SIGNING_ALLOWED=NO \
              CODE_SIGNING_REQUIRED=NO
          done
      - name: Build IPA
        script: |
          xcode-project build-ipa \
            --project ios/App/App.xcodeproj \
            --scheme App \
            --archive-type development \
            --export-options ExportOptions.plist
    artifacts:
      - build/ios/ipa/*.ipa
      - $HOME/Library/Developer/Xcode/DerivedData/**/Build/**/*.dSYM
    publishing:
      app_store_connect:
        auth: integration
        submit_to_testflight: true

  android-workflow:
    name: Android Build
    instance_type: mac_mini_m1
    max_build_duration: 20
    environment:
      vars:
        CM_KEYSTORE_PATH: Encrypted(...)
        CM_KEYSTORE_PASSWORD: Encrypted(...)
        CM_KEY_ALIAS: Encrypted(...)
        CM_KEY_PASSWORD: Encrypted(...)
      node: 20
    scripts:
      - name: Install dependencies
        script: |
          npm install
      - name: Capacitor sync
        script: |
          npx cap sync android
      - name: Build AAB
        script: |
          cd android
          ./gradlew bundleRelease
    artifacts:
      - android/app/build/outputs/bundle/release/*.aab
```

### ⚠️ Pods 签名问题修复
CocoaPods 项目的 Pods targets 默认会尝试签名，导致构建失败：

```bash
# 在 pre-build 脚本中 patch
cd ios/App/Pods
# 获取所有 target 名称
targets=$(xcodebuild -list -project Pods.xcodeproj | sed -n '/Targets:/,/Build Configurations:/p' | tail -n +2 | head -n -1 | sed 's/^[[:space:]]*//')

for target in $targets; do
  xcodebuild -project Pods.xcodeproj -target "$target" \
    CODE_SIGNING_ALLOWED=NO \
    CODE_SIGNING_REQUIRED=NO
done
```

### 构建优化
- `instance_type: mac_mini_m1` — 性价比最高
- `max_build_duration: 30` — 限制最大时长，避免浪费
- 缓存 node_modules：`cache: { npm: true }`

---

## 5. 常见问题

### Q: 构建失败 "Code Sign Error"
**A**: 检查 App Store Connect API Key 权限是否为 App Manager，确认 .p8 文件内容完整。

### Q: Pods 构建失败
**A**: 使用上面的 Pods 签名 patch 脚本，设置 `CODE_SIGNING_ALLOWED=NO`。

### Q: AAB 签名失败
**A**: 确认 keystore 环境变量正确，keystore 文件已上传到 Codemagic。

### Q: 构建超时
**A**: 设置 `max_build_duration`，优化构建脚本，使用缓存。

### Q: 免费额度用完
**A**: 500 分钟/月够约 15-20 次构建。优化：只在 push to main 时触发构建。

---

## 需要帮助？

我们提供 Codemagic 配置服务：¥999/次（含 CI/CD 配置 + 签名 + 首次构建）

访问 [publish.runorb.us](https://publish.runorb.us) 了解更多。
