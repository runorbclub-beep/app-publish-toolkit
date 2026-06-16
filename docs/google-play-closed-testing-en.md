# Google Play Closed Testing Complete Guide

> December 2024 New Policy: New personal accounts must complete Closed Testing before Production release

## Table of Contents
1. [Policy Overview](#1-policy-overview)
2. [Tester Recruitment](#2-tester-recruitment)
3. [Create Closed Testing](#3-create-closed-testing)
4. [14-Day Testing Period Management](#4-14-day-testing-period-management)
5. [Apply for Production Access](#5-apply-for-production-access)
6. [FAQ](#6-faq)

---

## 1. Policy Overview

### Who Needs Closed Testing?
- ✅ Personal accounts registered after 2023-11-13 — **Required**
- ✅ Organization accounts registered after 2023-11-13 — **Required**
- ❌ Accounts registered before 2023-11-13 with existing Production access — **Not required**

### Minimum Requirements
| Requirement | Minimum |
|---|---|
| Number of testers | 12 |
| Testing duration | 14 consecutive days |
| Tester type | Google Group members |
| Tester activity | Must actually install and use |

### ⚠️ Notes
- 12 is the minimum; recommend recruiting 15-20 as backup
- 14 days must be consecutive; if interrupted, restart counting
- Testers must join via Opt-in URL
- Testers must install app with the Google account that joined the group

---

## 2. Tester Recruitment

### Recruitment Channels

#### Free
| Channel | Notes | Difficulty |
|---|---|---|
| Friends/Family | Most reliable, limited numbers | ⭐ |
| Colleagues | If you have a team | ⭐ |
| Reddit r/AndroidBetaTesting | Post to recruit | ⭐⭐ |
| Reddit r/AndroidApps | Post to recruit | ⭐⭐ |
| Twitter/X | Use #AndroidBeta hashtag | ⭐⭐ |
| Facebook Groups | Android testing groups | ⭐⭐ |
| Discord Communities | Android dev/testing servers | ⭐⭐ |

#### Paid
| Channel | Price | Notes |
|---|---|---|
| PrimeTestLab | ~$5-10/tester | Professional testing service |
| BetaFamily | ~$3-8/tester | Testing community |
| Fiverr | ~$5-15/person | Freelancers |

### Recruitment Template

```
🚀 Beta Testers Needed!

We're developing a [App category] app and need 15 Android beta testers for Google Play Closed Testing.

Requirements:
- Android phone
- Google account
- Available for 14 days to install and test
- Willing to provide simple feedback

How to participate:
1. Join our Google Group: [group link]
2. Install via Opt-in URL: [link]

Thank you! 🙏
```

---

## 3. Create Closed Testing

### Step 1: Create Google Group
1. Go to https://groups.google.com
2. Click "Create Group"
3. Set group name (e.g., "YourApp Beta Testers")
4. Set group type: anyone can join (or invite only)
5. Note the group email (e.g., yourapp-beta@googlegroups.com)

### Step 2: Configure in Play Console
1. Play Console → Testing → Closed testing
2. Click "Create release"
3. Fill in release name (internal, e.g., "Closed Test v1.0")
4. Upload AAB
5. Add release notes
6. Under "Testers", select "Google Group"
7. Enter group email: yourapp-beta@googlegroups.com
8. Save and review
9. Click "Roll out to testing"

### Step 3: Get Opt-in URL
After release, Play Console shows an Opt-in URL like:
`https://play.google.com/apps/testing/com.yourcompany.yourapp`

Share this URL with testers.

---

## 4. 14-Day Testing Period Management

### Timeline
- **Day 1**: All testers join group and install app
- **Day 2-7**: Daily check tester status, collect feedback
- **Day 8**: Push update if needed
- **Day 13-14**: Confirm testing complete, prepare Production application

### Track Tester Status
Play Console → Testing → Closed testing → View tester list:
- Joined: Tester has joined group
- Installed: Tester has installed app
- Active: Tester used app in last 7 days

### ⚠️ Notes
- Testers don't need to use app daily, but should have reasonable usage during 14 days
- If testers drop out, can add new ones
- 14 days counts from first tester install
- Recommend all testers start same day to avoid timing confusion

---

## 5. Apply for Production Access

### Prerequisites
- [ ] Closed Testing has run for at least 14 days
- [ ] At least 12 testers have installed app
- [ ] Testers have actual usage (not just install without opening)

### Application Steps
1. Play Console → Testing → Closed testing
2. Confirm testing meets requirements
3. Find "Apply for Production access" on Play Console homepage or Production page
4. Fill out application:
   - App's intended use
   - Closed Testing results summary
   - Tester feedback summary
5. Submit application
6. Wait for Google review (usually 2-7 days)

### Application Template
```
App Name: [Your App Name]
Package ID: com.yourcompany.yourapp

Closed Testing Summary:
- Testing period: 2026-06-16 to 2026-06-30 (14 days)
- Number of testers: 15
- Number of installs: 14
- Active testers: 12

Testing Feedback Summary:
- Overall feedback positive
- Main features working properly
- Fixed 3 minor bugs
- Tester suggestions recorded for future versions

App Intended Use:
[Brief description of app features and target users]
```

---

## 6. FAQ

### Q: Fewer than 12 testers?
**A**: Use paid testing services (e.g., PrimeTestLab) or recruit in more communities.

### Q: 14 days interrupted?
**A**: Must restart 14-day count. Ensure all testers are ready before starting.

### Q: Testers don't have Google accounts?
**A**: Testers must have Google accounts to join Google Group and install test app.

### Q: Can I test multiple apps simultaneously?
**A**: Yes, each app needs its own Closed Testing track.

### Q: Can I update app during Closed Testing?
**A**: Yes, uploading new AAB pushes update to testers.

### Q: Production application rejected?
**A**: Fix based on rejection reason and reapply. Common reasons: inactive testers, insufficient testing period.

---

## Need Help?

We offer Closed Testing full management service: ¥1499 / $39 per session

Includes:
- Tester recruitment (guaranteed 12+ testers)
- Google Group creation and management
- 14-day testing period tracking
- Production access application

Visit [publish.runorb.us](https://publish.runorb.us) for more.
