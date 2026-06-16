# Codemagic CI/CD Setup Guide

> Based on RunOrb App Codemagic build experience (first successful build: 3min 15sec)

## Table of Contents
1. [Codemagic Overview](#1-codemagic-overview)
2. [Project Setup](#2-project-setup)
3. [Signing Configuration](#3-signing-configuration)
4. [codemagic.yaml Reference](#4-codemagicyaml-reference)
5. [Common Issues](#5-common-issues)

---

## 1. Codemagic Overview

Codemagic is a CI/CD platform designed for mobile app development, supporting:
- iOS / Android / Flutter / React Native / Capacitor
- Automatic signing (iOS App Store Connect API Key)
- Auto build + test + distribute
- Free tier: 500 minutes/month

### Why Codemagic?
- ✅ Native iOS signing support (no Mac needed)
- ✅ Free tier sufficient for small projects
- ✅ Simple YAML configuration
- ✅ Private repository support

### vs Other Platforms
| Platform | iOS Signing | Free Tier | Config Difficulty |
|---|---|---|---|
| Codemagic | ✅ Native | 500 min/month | Medium |
| GitHub Actions | Self-config | 2000 min/month | Hard |
| Bitrise | ✅ Native | Limited trial | Medium |
| Fastlane | Need Mac | Open source | Hard |

---

## 2. Project Setup

### Connect Repository
1. Register at https://codemagic.io
2. Connect GitHub/GitLab/Bitbucket repository
3. Select project type (iOS / Android / Flutter, etc.)

### Create codemagic.yaml
Create `codemagic.yaml` in project root directory.

---

## 3. Signing Configuration

### iOS Signing (App Store Connect API Key)

1. App Store Connect → Users and Access → Integrations → API Keys
2. Click "+" to create API Key
   - Name: Codemagic
   - Access: App Manager
3. Save the following:
   - **Issuer ID**: shown at top of page
   - **Key ID**: shown after creation
   - **Private Key**: download .p8 file

4. Add environment variables in Codemagic:
   ```
   APP_STORE_CONNECT_PRIVATE_KEY  → .p8 file content
   APP_STORE_CONNECT_KEY_IDENTIFIER → Key ID
   APP_STORE_CONNECT_ISSUER_ID → Issuer ID
   ```

### Android Signing (Keystore)

1. Generate keystore (see Google Play Guide)
2. Add environment variables in Codemagic:
   ```
   CM_KEYSTORE_PATH → keystore file path
   CM_KEYSTORE_PASSWORD → keystore password
   CM_KEY_ALIAS → key alias
   CM_KEY_PASSWORD → key password
   ```

---

## 4. codemagic.yaml Reference

### iOS Capacitor Project Example
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
        script: npm install
      - name: Capacitor sync
        script: npx cap sync ios
      - name: Pod install
        script: |
          cd ios/App
          pod install
      - name: Patch Pods code signing
        script: |
          cd ios/App/Pods
          for target in $(xcodebuild -list -project Pods.xcodeproj | sed -n '/Targets:/,/Build Configurations:/p' | tail -n +2 | head -n -1 | sed 's/^[[:space:]]*//'); do
            xcodebuild -project Pods.xcodeproj -target "$target" \
              CODE_SIGNING_ALLOWED=NO CODE_SIGNING_REQUIRED=NO
          done
      - name: Build IPA
        script: |
          xcode-project build-ipa \
            --project ios/App/App.xcodeproj \
            --scheme App \
            --archive-type development
    
    artifacts:
      - build/ios/ipa/*.ipa
    
    publishing:
      app_store_connect:
        auth: integration
        submit_to_testflight: true
```

### Android Example
```yaml
workflows:
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
        script: npm install
      - name: Capacitor sync
        script: npx cap sync android
      - name: Build AAB
        script: |
          cd android
          ./gradlew bundleRelease
    
    artifacts:
      - android/app/build/outputs/bundle/release/*.aab
```

### ⚠️ Pods Signing Fix
CocoaPods targets attempt code signing by default, causing build failures. Use the patch script above to set `CODE_SIGNING_ALLOWED=NO` for all Pods targets.

### Build Optimization
- `instance_type: mac_mini_m1` — best value
- `max_build_duration: 30` — limit max time
- Cache: `cache: { npm: true }`

---

## 5. Common Issues

### Q: Build fails "Code Sign Error"
**A**: Check App Store Connect API Key access is App Manager, confirm .p8 file content is complete.

### Q: Pods build fails
**A**: Use the Pods signing patch script above, set `CODE_SIGNING_ALLOWED=NO`.

### Q: AAB signing fails
**A**: Verify keystore environment variables, ensure keystore file uploaded to Codemagic.

### Q: Build timeout
**A**: Set `max_build_duration`, optimize scripts, use caching.

### Q: Free tier exhausted
**A**: 500 min/month ≈ 15-20 builds. Optimize: only trigger on push to main.

---

## Need Help?

We offer Codemagic setup service: ¥999 / $25 per session (CI/CD config + signing + first build)

Visit [publish.runorb.us](https://publish.runorb.us) for more.
