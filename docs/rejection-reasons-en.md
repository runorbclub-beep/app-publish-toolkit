# App Review Rejection Reasons — Complete Reference

> 50+ real rejection cases and solutions, continuously updated

## Apple App Store

### Guideline 2.1 — App Completeness
| Reason | Solution |
|---|---|
| App crashes | Test thoroughly, use TestFlight internal testing |
| Incomplete features | Remove all "Coming Soon" placeholders |
| Placeholder content | Replace with real content |
| Broken links | Check all links |
| Login failure | Provide test account |

### Guideline 2.3 — Inaccurate Metadata
| Reason | Solution |
|---|---|
| Screenshots don't match app | Use real screenshots |
| Exaggerated description | Describe features objectively |
| Keyword stuffing | Only use relevant keywords |
| Icon doesn't match app | Use real app icon |

### Guideline 2.5.1 — Performance: Software Requirements
| Reason | Solution |
|---|---|
| Using private APIs | Only use public APIs |
| WebView wrapper | Add native features |
| Reading other apps' data | Use system-provided sharing mechanisms |

### Guideline 4.2 — Minimum Functionality
| Reason | Solution |
|---|---|
| Too simple functionality | Add unique features |
| Just a web wrapper | Add native features (push, offline, etc.) |
| No real value | Clarify app's unique value |

### Guideline 4.3 — Spam
| Reason | Solution |
|---|---|
| Duplicate apps | Each app needs unique functionality |
| Misleading users | Clarify app functionality |
| Low quality content | Improve content quality |

### Guideline 5.1.1 — Data Collection and Storage
| Reason | Solution |
|---|---|
| Undisclosed data collection | Complete privacy policy |
| No user consent | Add consent dialog |
| Insecure data storage | Use encrypted storage |

### Guideline 5.1.2 — Data Use and Sharing
| Reason | Solution |
|---|---|
| Undisclosed data sharing | Add in-app disclosure |
| Undisclosed third-party SDKs | Declare all third-party SDKs |

### ⚠️ RunOrb Real Rejection Experience
1. **Privacy policy URL not accessible**
   - Cause: SPA routing redirected `/privacy.html` to homepage
   - Fix: Use standalone HTML file

2. **Insufficient permission description**
   - Cause: Bluetooth permission usage description too brief
   - Fix: Detailed explanation of each permission's purpose

3. **No test account provided**
   - Cause: Reviewer couldn't log in to test
   - Fix: Provide test account in review information

---

## Google Play

### Policy Violations
| Reason | Solution |
|---|---|
| Privacy policy URL not accessible | Ensure direct HTML response |
| Inaccurate data safety form | Declare all data collection honestly |
| Unreasonable permission usage | Explain each permission's purpose |
| Target audience misconfigured | Set accurately |
| IP infringement | Don't use others' trademarks/copyrights |

### Metadata Violations
| Reason | Solution |
|---|---|
| Inappropriate app description | Modify description |
| Inappropriate screenshots | Use compliant screenshots |
| Inappropriate icon | Modify icon |

### ⚠️ RunOrb Rejection Experience
1. **Privacy policy URL redirect**
   - Cause: CF Pages SPA routing redirected `/privacy.html` to homepage
   - Fix: Use standalone HTML file

2. **FOREGROUND_SERVICE_CONNECTED_DEVICE permission**
   - Cause: Required demo video upload
   - Fix: Record YouTube video demonstrating functionality

3. **Closed Testing not completed**
   - Cause: New accounts must complete Closed Testing first
   - Fix: Complete 12 testers × 14 days testing

---

## General Advice

### Pre-Review Checklist
- [ ] App doesn't crash, no obvious bugs
- [ ] All features functional
- [ ] Privacy policy URL directly accessible (no redirect)
- [ ] Permission usage clearly explained
- [ ] Screenshots match actual functionality
- [ ] App description objective and accurate
- [ ] Test account provided (if login required)
- [ ] No unauthorized third-party content
- [ ] Data safety form filled honestly
- [ ] Content rating questionnaire filled honestly

### Post-Rejection Strategy
1. **Read rejection reason carefully** — Don't rush to modify
2. **Understand reviewer's perspective** — They may not fully understand your app
3. **Make targeted fixes** — Only fix the rejected part, don't overhaul
4. **Include explanation** — Attach fix description when resubmitting
5. **Appeal if necessary** — If you believe review is incorrect, file an appeal

### Review Communication Tips
- Be polite and professional
- Directly answer reviewer's questions
- Provide specific fix descriptions
- Attach screenshots/videos if necessary

---

## Need Help?

Don't know how to handle rejection? We offer:

- 💬 Consultation: ¥299 / $9.9 per session (rejection analysis + fix plan)
- 📱 Standard Publishing: ¥1999 / $49 per platform (full-process guidance)

Visit [publish.runorb.us](https://publish.runorb.us) for more.
