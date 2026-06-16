# Apple App Store 上架完整指南

> 基于 RunOrb App (ID: 1559861575) 实战上架经验整理

## 目录
1. [前置准备](#1-前置准备)
2. [Apple Developer 账号](#2-apple-developer-账号)
3. [证书与 Profile](#3-证书与-profile)
4. [App Store Connect 配置](#4-app-store-connect-配置)
5. [构建与上传](#5-构建与上传)
6. [提交审核](#6-提交审核)
7. [常见被拒原因](#7-常见被拒原因)
8. [Codemagic 自动化构建](#8-codemagic-自动化构建)

---

## 1. 前置准备

### 必备材料
- [ ] Apple ID（建议注册一个新的专门用于开发）
- [ ] 双重认证已开启
- [ ] 支付方式（信用卡/借记卡，用于 $99/年年费）
- [ ] App 源码（Xcode 项目）
- [ ] 应用图标 1024×1024 PNG
- [ ] 截图至少 5 张（6.7寸 / 6.5寸 / 5.5寸）
- [ ] App 描述（中英文）
- [ ] 隐私政策 URL（必须可公开访问）
- [ ] 软件著作权证书（中国大陆开发者）

### ⚠️ 中国大陆开发者特别注意
- **支付方式**：Apple Developer 年费 $99 需要境外支付方式。可使用：
  - 境外信用卡（Visa/MasterCard）
  - PayPal（绑定境外银行卡）
  - 淘宝代充（有风险，不推荐）
- **Apple ID 地区**：建议注册香港或美国区的 Apple ID
- **人脸验证**：账号注册和证书申请可能需要人脸验证，需准备 Apple 设备

---

## 2. Apple Developer 账号

### 注册流程
1. 访问 https://developer.apple.com/
2. 使用 Apple ID 登录
3. 点击「Join the Apple Developer Program」
4. 选择个人/组织账号
5. 支付 $99/年年费
6. 等待审核（通常 1-2 天）

### 个人 vs 组织账号
| 对比项 | 个人账号 | 组织账号 $99/年 | 组织账号 $99/年 |
|---|---|---|---|
| 费用 | $99/年 | $99/年 | $99/年 |
| 显示名称 | 个人姓名 | 公司名 | 公司名 |
| D-U-N-S 编号 | 不需要 | 需要 | 需要 |
| 审核时间 | 1-2天 | 5-10天 | 5-10天 |
| 推荐 | 独立开发者 | 公司 | 公司 |

---

## 3. 证书与 Profile

### 需要创建的证书
1. **Apple Development Certificate** — 开发调试用
2. **Apple Distribution Certificate** — 发布上架用

### 创建步骤
1. 打开 Keychain Access → 证书助理 → 从证书颁发机构请求证书
2. 生成 CSR 文件
3. 在 Apple Developer Portal 上传 CSR
4. 下载并安装证书

### Provisioning Profile
1. 注册 App ID（Bundle Identifier，如 `com.yourcompany.yourapp`）
2. 创建 App Store Distribution Profile
3. 下载并安装 Profile

### ⚠️ Codemagic 签名配置
如果使用 Codemagic CI/CD：
1. 在 App Store Connect 创建 API Key（App Manager 权限）
2. 在 Codemagic 配置 `APP_STORE_CONNECT_PRIVATE_KEY`、`APP_STORE_CONNECT_KEY_IDENTIFIER`、`APP_STORE_CONNECT_ISSUER_ID`
3. Codemagic 会自动管理证书和 Profile

---

## 4. App Store Connect 配置

### 新建 App
1. 登录 App Store Connect
2. 「我的 App」→ 「+」→ 「新建 App」
3. 填写：
   - 平台：iOS
   - 名称：你的 App 名称
   - 主要语言：简体中文 / English
   - Bundle ID：选择已注册的 App ID
   - SKU：内部标识（不公开）

### App 信息
- **名称**：最多 30 字符
- **副标题**：最多 30 字符
- **描述**：最多 4000 字符
- **关键词**：最多 100 字符，逗号分隔
- **推广文本**：最多 170 字符（可不更新版本随时修改）
- **App 预览视频**：可选，最多 3 个

### 截图要求
| 设备 | 尺寸 | 必须 |
|---|---|---|
| 6.7" (iPhone 15 Pro Max) | 1290×2796 | ✅ |
| 6.5" (iPhone 11 Pro Max) | 1242×2688 | ✅ |
| 5.5" (iPhone 8 Plus) | 1242×2208 | 可选 |

### ⚠️ 隐私政策 URL 陷阱
- URL 必须可公开访问，不能有重定向
- 如果用 SPA（如 React），确保路由直接返回 HTML 内容
- **RunOrb 踩坑**：CF Pages SPA 路由把 `/privacy.html` 重定向到首页，导致 Google Play 审核被拒
- **解决方案**：隐私政策用独立 HTML 文件，不依赖 SPA 路由

---

## 5. 构建与上传

### Xcode 构建
```bash
# 清理
xcodebuild clean -project YourApp.xcodeproj -scheme YourApp

# 归档
xcodebuild archive \
  -project YourApp.xcodeproj \
  -scheme YourApp \
  -archivePath build/YourApp.xcarchive

# 导出 IPA
xcodebuild -exportArchive \
  -archivePath build/YourApp.xcarchive \
  -exportOptionsPlist ExportOptions.plist \
  -exportPath build/ipa
```

### 上传到 App Store Connect
```bash
# 使用 Xcode Organizer
open build/YourApp.xcarchive

# 或使用 altool
xcrun altool --upload-app \
  -f build/ipa/YourApp.ipa \
  -t ios \
  -u your@email.com \
  -p your-app-specific-password
```

### Codemagic 自动构建
参见 [Codemagic 配置指南](codemagic-setup.md)

---

## 6. 提交审核

### 审核前检查清单
- [ ] App 不崩溃、无明显 bug
- [ ] 所有功能可用，无「Coming Soon」占位
- [ ] 登录功能有测试账号（在审核信息中提供）
- [ ] 隐私政策 URL 可访问
- [ ] 应用内无未授权的第三方内容
- [ ] 权限使用说明清晰（Info.plist 中 NSXxxUsageDescription）
- [ ] App 图标和截图与实际功能一致
- [ ] 没有 placeholder 文本
- [ ] 支持最新的 iOS 版本
- [ ] 适配不同屏幕尺寸

### 提交流程
1. 在 App Store Connect 选择构建版本
2. 填写审核信息：
   - 审核联系人
   - 演示账号（如需登录）
   - 备注（特殊说明）
3. 点击「提交审核」
4. 等待审核（通常 24-48 小时，最长 7 天）

### 审核状态
| 状态 | 说明 |
|---|---|
| 等待审核 | 已提交，排队中 |
| 审核中 | 审核员正在审核 |
| 等待开发者发布 | 审核通过，等待你发布 |
| 准备销售 | 正在处理中 |
| 可销售 | 已上架 ✅ |
| 被拒绝 | 需要修改后重新提交 |

---

## 7. 常见被拒原因

### Guideline 2.1 — App Completeness（App 完整性）
- **原因**：App 有 bug、功能不完整、占位内容
- **解决**：全面测试，移除所有占位符

### Guideline 2.3 — Inaccurate Metadata（元数据不准确）
- **原因**：截图与实际不符、描述夸大
- **解决**：使用真实截图，描述客观

### Guideline 4.2 — Minimum Functionality（最低功能要求）
- **原因**：功能过于简单，只是网页打包
- **解决**：增加原生功能，体现 App 独特价值

### Guideline 5.1.1 — Data Collection and Storage（数据收集）
- **原因**：收集数据但未说明用途
- **解决**：完善隐私政策，明确数据用途

### Guideline 5.1.2 — Data Use and Sharing（数据使用）
- **原因**：数据共享未告知用户
- **解决**：App 内添加数据使用说明

### ⚠️ RunOrb 实战被拒经验
1. **隐私政策 URL 不可访问**：SPA 路由导致审核员看到错误页面
2. **权限说明不充分**：蓝牙权限用途描述过于简单
3. **测试账号未提供**：审核员无法登录测试

---

## 8. Codemagic 自动化构建

### 配置文件 `codemagic.yaml`
参见 [Codemagic 配置指南](codemagic-setup.md)

### 关键配置
```yaml
environment:
  vars:
    APP_STORE_CONNECT_PRIVATE_KEY: encrypted_value
    APP_STORE_CONNECT_KEY_IDENTIFIER: key_id
    APP_STORE_CONNECT_ISSUER_ID: issuer_id

scripts:
  - name: Build iOS
    script: |
      xcode-project build-ipa \
        --project YourApp.xcodeproj \
        --scheme YourApp \
        --archive-type development

artifacts:
  - build/ios/ipa/*.ipa
```

### 签名策略
- 推荐使用 `app_store_connect_api_key` 签名方式
- Codemagic 自动创建和管理证书
- 无需手动管理 Provisioning Profile

### ⚠️ Pods 签名问题
如果使用 CocoaPods：
- Pods targets 需设置 `CODE_SIGNING_ALLOWED=NO`
- 只对 App target 使用 manual signing
- 在 `codemagic.yaml` 的 pre-build 脚本中 patch

---

## 需要帮助？

如果在上架过程中遇到问题，我们提供专业的人机协作上架服务：

- 💬 咨询服务：¥299/次
- 📱 标准上架：¥1999/次
- 📱📱 双端上架：¥3499/次

访问 [publish.runorb.us](https://publish.runorb.us) 或在 GitHub Issues 提问。
