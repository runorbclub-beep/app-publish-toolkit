# Google Play Publishing Complete Guide

> Based on real-world experience from publishing RunOrb App (com.runorb.iloverunorb)

## Table of Contents
1. [Prerequisites](#1-prerequisites)
2. [Google Play Developer Account](#2-google-play-developer-account)
3. [App Signing](#3-app-signing)
4. [Store Listing Setup](#4-store-listing-setup)
5. [Closed Testing](#5-closed-testing)
6. [Production Release](#6-production-release)
7. [Common Rejection Reasons](#7-common-rejection-reasons)
8. [Policy Compliance](#8-policy-compliance)

---

## 1. Prerequisites

### Required Materials
- [ ] Google account
- [ ] Payment method (credit card for $25 one-time registration fee)
- [ ] AAB file (Android App Bundle, not APK)
- [ ] App icon 512×512 PNG
- [ ] Feature Graphic 1024×500 PNG
- [ ] At least 2 screenshots (1080×1920 or higher)
- [ ] App description (English + your language)
- [ ] Privacy policy URL
- [ ] Data safety form

### ⚠️ Special Notes for China Mainland Developers
- **Google account**: Must use an account that can access Google Play Console
- **Payment method**: $25 registration fee requires international credit card or PayPal
- **Network**: Google Play Console requires VPN access from China
- **App signing**: Google Play App Signing requires uploading your signing key

---

## 2. Google Play Developer Account

### Registration Process
1. Visit https://play.google.com/console
2. Sign in with Google account
3. Pay $25 one-time registration fee
4. Complete developer identity verification
5. Wait for approval (usually 1-3 days)

### ⚠️ Individual vs Organization Account
| Comparison | Individual | Organization |
|---|---|---|
| Cost | $25 | $25 |
| Approval time | 1-3 days | 3-7 days |
| Closed Testing | **Required** (since Dec 2024) | **Required** |
| D-U-N-S | Not required | Required |
| Display name | Personal name | Company name |

### ⚠️ December 2024 New Policy
- **Personal accounts registered after 2023-11-13** must complete Closed Testing first
- Minimum 12 testers × 14 consecutive days
- Must complete before applying for Production access
- Accounts with existing Production access are not exempt

---

## 3. App Signing

### Play App Signing
Google Play requires Play App Signing:
1. Upload your signing key (.keystore or .jks)
2. Google signs release builds with your key
3. Google additionally signs distribution builds with its own key

### Generate Signing Key
```bash
keytool -genkey -v \
  -keystore your-app-release.keystore \
  -alias your-alias \
  -keyalg RSA -keysize 2048 \
  -validity 10000
```

### Configure Gradle Signing
```gradle
android {
    signingConfigs {
        release {
            storeFile file('../../your-app-release.keystore')
            storePassword 'your-keystore-password'
            keyAlias 'your-alias'
            keyPassword 'your-key-password'
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }
}
```

### Build AAB
```bash
cd android
./gradlew bundleRelease
```

Output: `android/app/build/outputs/bundle/release/app-release.aab`

---

## 4. Store Listing Setup

### Required Information
- **App name**: Up to 30 characters
- **Short description**: Up to 80 characters
- **Full description**: Up to 4000 characters
- **App icon**: 512×512 PNG (32-bit, no alpha)
- **Feature graphic**: 1024×500 PNG/JPG
- **Phone screenshots**: At least 2, 16:9 or 9:16, min 320px, max 3840px
- **App type**: Application or Game
- **Category**: Choose appropriate category
- **Tags**: Up to 5 tags
- **Contact email**: Required

### Data Safety Form
Must declare:
- All data types collected (location, email, photos, etc.)
- Purpose of each data type
- Whether data is shared with third parties
- Whether data is encrypted in transit
- How users can request data deletion

### Content Rating
Complete IARC questionnaire to get content rating.

### Privacy Policy
- URL must be directly accessible (no redirects!)
- Content must match data safety form
- Must include data collection, usage, sharing, and deletion policies

---

## 5. Closed Testing

For accounts registered after 2023-11-13, Closed Testing is mandatory before Production.

See [Closed Testing Guide](google-play-closed-testing.md) for complete details.

### Quick Summary
- Minimum 12 testers (recommend 15-20 as backup)
- 14 consecutive days of testing
- Testers must join Google Group
- Testers install via Opt-in URL
- After completion, apply for Production access

---

## 6. Production Release

### Prerequisites
- [ ] Closed Testing completed (for new accounts)
- [ ] Production access approved
- [ ] Store Listing completed
- [ ] Data safety form filled
- [ ] Content rating completed
- [ ] Privacy policy URL accessible

### Release Steps
1. Play Console → Production → Create release
2. Upload AAB
3. Write release notes
4. Review release details
5. Click "Review release"
6. Choose release type:
   - **Immediate**: Live in a few hours
   - **Timed**: Live at specified time

### Staged Rollout
- Can set 1%-100% staged rollout
- Start with 1% users, monitor crash rate and ratings
- Gradually increase to 100%

---

## 7. Common Rejection Reasons

### Policy Violations
| Reason | Solution |
|---|---|
| Privacy policy URL not accessible | Ensure direct HTML response, no redirect |
| Inaccurate data safety form | Declare all data collection honestly |
| Unreasonable permission usage | Explain purpose of each permission |
| Target audience misconfigured | Set accurately |
| IP infringement | Don't use others' trademarks/copyrights |

### ⚠️ RunOrb Rejection Experience
1. **Privacy policy URL redirect**: CF Pages SPA routing redirected `/privacy.html` to homepage
   - **Fix**: Use standalone HTML file, don't rely on SPA routing
2. **FOREGROUND_SERVICE_CONNECTED_DEVICE permission**: Required demo video upload
   - **Fix**: Record YouTube video demonstrating functionality

### Appeal Process
1. Play Console → Policy status → View violation details
2. Fix App or Store Listing
3. Submit appeal (with fix description)
4. Wait for Google review (usually 2-5 days)

---

## 8. Policy Compliance

### Required Policies
- **User Data Policy**: Data collection and use compliance
- **Permissions Policy**: Reasonable permission usage
- **Content Policy**: No prohibited content
- **Spam Policy**: No duplicate publishing, no misleading
- **Malware Policy**: No malicious code

### Data Safety Form Key Points
- Declare all SDK data collection (including third-party SDKs)
- Distinguish "required" vs "optional" data collection
- If app doesn't collect data, still must declare explicitly
- Privacy policy URL must match data safety form

### Permission Minimization
- Only request necessary permissions
- Each permission must have clear purpose
- Remove unused permissions
- Use `<uses-feature>` to declare if required

---

## Need Help?

We offer professional human-AI collaborative publishing services:

- 💬 Consultation: ¥299 / $9.9 per session
- 📱 Standard Publishing: ¥1999 / $49 per platform
- 🧪 Closed Testing Management: ¥1499 / $39
- 📱📱 Dual Platform: ¥3499 / $89

Visit [publish.runorb.us](https://publish.runorb.us) or ask in GitHub Issues.
