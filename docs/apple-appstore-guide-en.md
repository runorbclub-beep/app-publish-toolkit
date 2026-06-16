# Apple App Store Publishing Complete Guide

> Based on real-world experience from publishing RunOrb App (ID: 1559861575)

## Table of Contents
1. [Prerequisites](#1-prerequisites)
2. [Apple Developer Account](#2-apple-developer-account)
3. [Certificates & Profiles](#3-certificates--profiles)
4. [App Store Connect Setup](#4-app-store-connect-setup)
5. [Build & Upload](#5-build--upload)
6. [Submit for Review](#6-submit-for-review)
7. [Common Rejection Reasons](#7-common-rejection-reasons)
8. [Codemagic Automated Build](#8-codemagic-automated-build)

---

## 1. Prerequisites

### Required Materials
- [ ] Apple ID (recommend registering a dedicated one for development)
- [ ] Two-factor authentication enabled
- [ ] Payment method (credit/debit card for $99/year fee)
- [ ] App source code (Xcode project)
- [ ] App icon 1024×1024 PNG
- [ ] At least 5 screenshots (6.7" / 6.5" / 5.5")
- [ ] App description (English + your language)
- [ ] Privacy policy URL (must be publicly accessible)
- [ ] Software copyright certificate (for China mainland developers)

### ⚠️ Special Notes for China Mainland Developers
- **Payment method**: Apple Developer fee $99/year requires an international payment method:
  - International credit card (Visa/MasterCard)
  - PayPal (linked to international bank account)
- **Apple ID region**: Recommend registering Hong Kong or US region Apple ID
- **Face verification**: Account registration and certificate requests may require face verification on Apple device

---

## 2. Apple Developer Account

### Registration Process
1. Visit https://developer.apple.com/
2. Sign in with Apple ID
3. Click "Join the Apple Developer Program"
4. Choose Individual or Organization account
5. Pay $99/year fee
6. Wait for approval (usually 1-2 days)

### Individual vs Organization
| Comparison | Individual | Organization |
|---|---|---|
| Cost | $99/year | $99/year |
| Display name | Personal name | Company name |
| D-U-N-S number | Not required | Required |
| Approval time | 1-2 days | 5-10 days |
| Recommended for | Indie developers | Companies |

---

## 3. Certificates & Profiles

### Required Certificates
1. **Apple Development Certificate** — for development/debugging
2. **Apple Distribution Certificate** — for App Store release

### Creation Steps
1. Open Keychain Access → Certificate Assistant → Request Certificate from Certificate Authority
2. Generate CSR file
3. Upload CSR to Apple Developer Portal
4. Download and install certificate

### Provisioning Profile
1. Register App ID (Bundle Identifier, e.g., `com.yourcompany.yourapp`)
2. Create App Store Provisioning Profile
3. Download and install

### App Store Connect API Key (for Codemagic)
1. App Store Connect → Users and Access → Integrations → API Keys
2. Click "+" to create API Key
   - Name: Codemagic
   - Access: App Manager
3. Save: Issuer ID, Key ID, Private Key (.p8 file)

---

## 4. App Store Connect Setup

### Create New App
1. App Store Connect → My Apps → "+" → New App
2. Fill in:
   - Platforms: iOS
   - Name: Your App Name
   - Primary Language: English (U.S.) or your language
   - Bundle ID: select from dropdown
   - SKU: internal identifier (not visible to users)

### App Information
- **Name**: Up to 30 characters
- **Subtitle**: Up to 30 characters
- **Description**: Up to 4000 characters
- **Keywords**: Up to 100 characters, comma-separated
- **Promotional Text**: Up to 170 characters (can be updated without new review)
- **Category**: Primary and secondary categories
- **Privacy Policy URL**: Must be directly accessible (no redirects!)
- **Support URL**: Must be accessible
- **Marketing URL**: Optional

### Screenshots
Required sizes (provide at least one set):
- **6.7" (iPhone 15 Pro Max)**: 1290×2796
- **6.5" (iPhone 11 Pro Max)**: 1242×2688
- **5.5" (iPhone 8 Plus)**: 1242×2208
- **iPad 12.9"**: 2048×2732 (if supporting iPad)

---

## 5. Build & Upload

### Build IPA
```bash
# Using Xcode
xcodebuild -project YourApp.xcodeproj \
  -scheme YourApp \
  -archivePath build/YourApp.xcarchive \
  archive

xcodebuild -exportArchive \
  -archivePath build/YourApp.xcarchive \
  -exportOptionsPlist ExportOptions.plist \
  -exportPath build/ipa
```

### Upload to App Store Connect
```bash
# Using Xcode
xcrun altool --upload-app \
  -f build/ipa/YourApp.ipa \
  -t ios \
  -u your@email.com \
  -p your-app-specific-password
```

Or use **Transporter** app (free from Mac App Store).

Or use **Codemagic** for automated build and upload (recommended).

---

## 6. Submit for Review

### Pre-submission Checklist
- [ ] Build version selected in App Store Connect
- [ ] All metadata fields filled
- [ ] Screenshots uploaded
- [ ] Privacy policy URL accessible
- [ ] App Review Information filled (contact, demo account if needed)
- [ ] Export compliance information filled

### Submission Steps
1. App Store Connect → your app → select build
2. Review all information
3. Click "Submit for Review"
4. Wait for review (usually 24-48 hours, may take longer)

### Review Status
- **Waiting for Review**: In queue
- **In Review**: Being reviewed
- **Pending Developer Release**: Approved, waiting for you to release
- **Rejected**: Review failed — read rejection reasons
- **Developer Rejected**: You cancelled submission

---

## 7. Common Rejection Reasons

### Guideline 2.1 — App Completeness
- **Cause**: Crashes, incomplete features, placeholder content
- **Fix**: Comprehensive testing, remove all placeholders

### Guideline 2.3 — Inaccurate Metadata
- **Cause**: Screenshots don't match app, exaggerated description
- **Fix**: Use real screenshots, objective description

### Guideline 4.2 — Minimum Functionality
- **Cause**: Too simple, just a web wrapper
- **Fix**: Add native features, demonstrate unique value

### Guideline 5.1.1 — Data Collection and Storage
- **Cause**: Collecting data without explaining purpose
- **Fix**: Complete privacy policy, clarify data usage

### ⚠️ RunOrb Real Rejection Experience
1. **Privacy policy URL not accessible**: SPA routing caused redirect to homepage
2. **Insufficient permission description**: Bluetooth usage description too brief
3. **No test account provided**: Reviewer couldn't log in to test

---

## 8. Codemagic Automated Build

### Configuration
See [Codemagic Setup Guide](codemagic-setup.md)

### Key Configuration
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

### Signing Strategy
- Recommend using `app_store_connect_api_key` signing
- Codemagic automatically creates and manages certificates
- No manual Provisioning Profile management needed

### ⚠️ Pods Signing Issue
When using CocoaPods:
- Pods targets need `CODE_SIGNING_ALLOWED=NO`
- Only App target uses manual signing
- Patch in `codemagic.yaml` pre-build script

---

## Need Help?

We offer professional human-AI collaborative publishing services:

- 💬 Consultation: ¥299 / $9.9 per session
- 📱 Standard Publishing: ¥1999 / $49 per platform
- 📱📱 Dual Platform: ¥3499 / $89

Visit [publish.runorb.us](https://publish.runorb.us) or ask in GitHub Issues.
