# App Publishing Checklist — Step by Step

> Check each item before submission to avoid rejection

## Apple App Store

### Account & Certificates
- [ ] Apple Developer account activated ($99/year)
- [ ] Distribution Certificate created and installed
- [ ] App ID registered (Bundle Identifier)
- [ ] Provisioning Profile (App Store) created and installed
- [ ] App Store Connect API Key created (if using Codemagic)

### App Configuration
- [ ] Bundle Identifier correct
- [ ] Version and Build numbers correct
- [ ] App icon 1024×1024 configured
- [ ] All permission descriptions in Info.plist complete (NSXxxUsageDescription)
- [ ] Supported device orientations correct
- [ ] Minimum iOS version set reasonably

### App Store Connect
- [ ] App created
- [ ] App name (within 30 characters)
- [ ] Subtitle (within 30 characters)
- [ ] Description (within 4000 characters)
- [ ] Keywords (within 100 characters, comma-separated)
- [ ] Promotional text (within 170 characters)
- [ ] App category correct
- [ ] Privacy policy URL directly accessible (no redirect!)
- [ ] Support URL accessible
- [ ] Marketing URL accessible (optional)
- [ ] Copyright information
- [ ] App icon 1024×1024 PNG
- [ ] Screenshots: 6.7" (1290×2796) at least 5
- [ ] Screenshots: 6.5" (1242×2688) at least 5
- [ ] App preview video (optional)

### Review Information
- [ ] Review contact information
- [ ] Demo account (if login required)
- [ ] Review notes (special instructions)

### Build & Submit
- [ ] IPA built and uploaded
- [ ] Build version selected
- [ ] Export compliance information filled
- [ ] Submit for review

---

## Google Play

### Account
- [ ] Google Play Developer account activated ($25 one-time)
- [ ] (If new account) Closed Testing completed
- [ ] Production access approved (if new account)

### App Signing
- [ ] Keystore generated
- [ ] Keystore password securely stored
- [ ] Play App Signing enabled
- [ ] AAB signed

### Store Listing
- [ ] App name (within 30 characters)
- [ ] Short description (within 80 characters)
- [ ] Full description (within 4000 characters)
- [ ] App icon 512×512 PNG
- [ ] Feature Graphic 1024×500 PNG
- [ ] Phone screenshots at least 2
- [ ] App type correct
- [ ] Category correct
- [ ] Tags
- [ ] Contact email

### Data Safety
- [ ] Data safety form filled
- [ ] All data collection types declared
- [ ] Data usage explained
- [ ] Data sharing declared
- [ ] Data encryption status declared
- [ ] User data deletion request method provided

### Policy Compliance
- [ ] Privacy policy URL directly accessible (no redirect!)
- [ ] Content rating questionnaire filled
- [ ] Target audience set
- [ ] News app declaration (if applicable)
- [ ] Financial app declaration (if applicable)
- [ ] Children's app declaration (if applicable)
- [ ] Ads declaration
- [ ] Government app declaration (if applicable)

### Release
- [ ] AAB uploaded
- [ ] Release notes filled
- [ ] Release method selected (immediate/scheduled)
- [ ] Staged rollout percentage (if used)

---

## General Checks

### App Quality
- [ ] No crashes, no ANRs
- [ ] All features functional
- [ ] No placeholder content
- [ ] No placeholder text
- [ ] Adapts to different screen sizes
- [ ] Supports latest OS version
- [ ] Offline functionality works (if applicable)

### Content Compliance
- [ ] No infringing content
- [ ] No inappropriate content
- [ ] No misleading information
- [ ] Reasonable permission usage
- [ ] Third-party SDKs declared

### Privacy Policy Check
- [ ] URL publicly accessible
- [ ] No redirect (returns HTML directly)
- [ ] Content matches data safety form
- [ ] Includes all necessary clauses
- [ ] Contact information valid
