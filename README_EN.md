# App Publish Toolkit 🚀

> Human-AI Collaborative App Publishing Toolkit — Built on real-world experience from publishing RunOrb App on both Apple App Store and Google Play
> 
> Apple App Store + Google Play + Codemagic CI/CD + Closed Testing Complete Guide

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

## 🎯 What is this?

An open-source toolkit to help you publish your app on Apple App Store and Google Play from zero to live.

Especially helpful for:
- 🌏 Developers in regions with limited access to Apple/Google payment systems
- 🌍 Global indie developers looking to simplify the publishing process
- 🏢 Small teams without dedicated publishing engineers

## ✨ Key Features

- **Battle-tested**: All content comes from real RunOrb App publishing experience
- **Human-AI Collaboration**: AI tools + human operation, compliant and safe
- **Bilingual**: English + Chinese
- **Continuously Updated**: Tracking platform policy changes, community-maintained

## 📦 Contents

### 📖 Documentation (`docs/`) — Bilingual
| Document | English | 中文 |
|---|---|---|
| Apple App Store Guide | [English](docs/apple-appstore-guide-en.md) | [中文](docs/apple-appstore-guide.md) |
| Google Play Guide | [English](docs/google-play-guide-en.md) | [中文](docs/google-play-guide.md) |
| Codemagic CI/CD Setup | [English](docs/codemagic-setup-en.md) | [中文](docs/codemagic-setup.md) |
| Closed Testing Guide | [English](docs/google-play-closed-testing-en.md) | [中文](docs/google-play-closed-testing.md) |
| Rejection Reasons | [English](docs/rejection-reasons-en.md) | [中文](docs/rejection-reasons.md) |

### 🛠️ Scripts (`scripts/`)
- `resize-icon.sh` — Auto-generate all app icon sizes
- `sign-aab.sh` — AAB signing verification
- `generate-metadata.py` — Generate app metadata

### 📋 Templates (`templates/`) — Bilingual
| Template | English | 中文 |
|---|---|---|
| Privacy Policy HTML | [English](templates/privacy-policy-en.html) | [中文](templates/privacy-policy.html) |
| Store Listing Checklist | [English](templates/store-listing-checklist-en.md) | [中文](templates/store-listing-checklist.md) |
| Permission Justification | [English](templates/permission-justification-en.md) | [中文](templates/permission-justification.md) |
| Codemagic Config | [YAML](templates/codemagic.yaml) | — |

## 🚀 Quick Start

```bash
git clone https://github.com/runorbclub/app-publish-toolkit.git
cat templates/store-listing-checklist.md
cp templates/privacy-policy.html ./my-app-privacy.html
bash scripts/resize-icon.sh icon-1024.png
```

## 💼 Need Professional Help?

We offer human-AI collaborative publishing services:

| Service | Price | Description |
|---|---|---|
| 💬 Consultation | $9.9/session | Rejection analysis + fix plan |
| 📱 Standard Publishing | $49/platform | Full-process guidance |
| 📱📱 Dual Platform | $89 | Apple + Google Play |
| ⚙️ Codemagic Setup | $25 | CI/CD + signing + first build |
| 🧪 Closed Testing | $39 | 12 testers + 14 days management |

👉 Visit [publish.runorb.us](https://publish.runorb.us) for more

## 📄 License

MIT License — Free to use, including commercial use.

## ⭐ Star History

If this helps, please give a Star ⭐
