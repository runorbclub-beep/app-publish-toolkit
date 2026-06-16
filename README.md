# App Publish Toolkit 🚀

> 人机协作的 App 上架工具包 — 基于 RunOrb App 双端实战经验沉淀
> 
> Apple App Store + Google Play + Codemagic CI/CD + Closed Testing 全流程指南

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![中文](https://img.shields.io/badge/README-中文-red.svg)](README.md)
[![English](https://img.shields.io/badge/README-English-blue.svg)](README_EN.md)

## 🎯 这是什么？

一套**开源的 App 上架工具包**，帮助你从零到一完成 Apple App Store 和 Google Play 的上架全流程。

特别适合：
- 🇨🇳 中国大陆开发者（解决境外账号、支付、签名等痛点）
- 🌍 全球独立开发者（简化上架流程、避免踩坑）
- 🏢 中小团队（没有专职上架工程师，需要一站式指南）

## ✨ 核心特色

- **实战驱动**：所有内容来自 RunOrb App 双端上架的真实经验，不是理论
- **人机协作**：AI 工具 + 真人操作，合规安全，平台不屏蔽
- **中英双语**：面向全球开发者
- **持续更新**：跟踪平台政策变化，社区共同维护

## 📦 内容

### 📖 文档指南 (`docs/`) — 中英双语 / Bilingual
| 文档 | 中文 | English |
|---|---|---|
| Apple App Store 上架指南 | [中文](docs/apple-appstore-guide.md) | [English](docs/apple-appstore-guide-en.md) |
| Google Play 上架指南 | [中文](docs/google-play-guide.md) | [English](docs/google-play-guide-en.md) |
| Codemagic CI/CD 配置 | [中文](docs/codemagic-setup.md) | [English](docs/codemagic-setup-en.md) |
| Closed Testing 完整指南 | [中文](docs/google-play-closed-testing.md) | [English](docs/google-play-closed-testing-en.md) |
| 审核被拒常见原因 | [中文](docs/rejection-reasons.md) | [English](docs/rejection-reasons-en.md) |

### 🛠️ 脚本工具 (`scripts/`)
| 脚本 | 说明 |
|---|---|
| `generate-screenshots.sh` | 自动生成各平台所需截图尺寸 |
| `resize-icon.sh` | 应用图标自动缩放（1024→各尺寸） |
| `sign-aab.sh` | AAB 签名脚本 |
| `check-store-listing.sh` | 上架前清单检查 |
| `generate-metadata.py` | 生成应用描述、关键词等元数据 |

### 📋 模板 (`templates/`) — 中英双语 / Bilingual
| 模板 | 中文 | English |
|---|---|---|
| 隐私政策 HTML | [中文](templates/privacy-policy.html) | [English](templates/privacy-policy-en.html) |
| 上架清单 | [中文](templates/store-listing-checklist.md) | [English](templates/store-listing-checklist-en.md) |
| 权限使用说明 | [中文](templates/permission-justification.md) | [English](templates/permission-justification-en.md) |
| Codemagic 配置 | [YAML](templates/codemagic.yaml) | — |

### 📚 案例 (`examples/`)
| 案例 | 说明 |
|---|---|
| `runorb-app/` | RunOrb App 双端上架完整案例（真实材料脱敏） |

## 🚀 快速开始

```bash
# 1. 克隆仓库
git clone https://github.com/runorbclub/app-publish-toolkit.git

# 2. 查看上架清单
cat templates/store-listing-checklist.md

# 3. 使用隐私政策模板
cp templates/privacy-policy.html ./my-app-privacy.html

# 4. 生成应用图标各尺寸
bash scripts/resize-icon.sh icon-1024.png
```

## 💼 需要人工协助？

如果你需要更深入的服务，我们提供**人机协作上架服务**：

| 服务 | 价格 | 说明 |
|---|---|---|
| 💬 咨询服务 | ¥299/次 | 审核被拒分析+修改方案 |
| 📱 标准上架 | ¥1999/次 | 单平台全流程指导 |
| 📱📱 双端上架 | ¥3499/次 | Apple+Google 双端 |
| ⚙️ Codemagic 配置 | ¥999/次 | CI/CD + 签名 + 首次构建 |
| 🧪 Closed Testing | ¥1499/次 | 12测试员+14天管理 |

👉 访问 [publish.runorb.us](https://publish.runorb.us) 了解更多

## 🤝 贡献

欢迎提交 PR 补充你的上架经验！请阅读 [CONTRIBUTING.md](CONTRIBUTING.md)。

## 📄 License

MIT License — 自由使用，欢迎商用。

## ⭐ Star History

如果这个项目对你有帮助，请给个 Star ⭐
