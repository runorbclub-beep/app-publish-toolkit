# App Publish Toolkit 🚀

> App 上架快递服务 — 你交App，我送到商店

> Apple App Store + Google Play + Closed Testing 全流程代上架

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![中文](https://img.shields.io/badge/README-中文-red.svg)](README.md)
[![English](https://img.shields.io/badge/README-English-blue.svg)](README_EN.md)

## 📦 这是什么？

一套**App上架快递服务**。你交出App，我们帮你送到 App Store 和 Google Play。

不是教程，不是咨询，是代上架。

**适合谁：**
- 🧑‍💼 有App想法但没技术背景的人
- 🏢 有产品但没时间折腾上架流程的团队
- 🤔 自己试过上架但被审核拒了的人
- 🇨🇳 中国大陆开发者（解决境外账号、支付、签名等痛点）

## 💰 快递定价

| 服务 | 价格 | 说明 |
|---|---|---|
| 🍎 Apple App Store | ¥999 | iOS单平台上架，含证书签名、材料制作、提交指导 |
| 🤖 Google Play | ¥1,599 | Android单平台上架，含12名测试员闭环测试 |
| 📱📱 双端快递 | ¥2,299 | Apple + Google Play 双平台，并行推进 |

**为什么安卓比苹果贵？** Google Play要求12名测试员进行14天Closed Testing，我们安排测试员，这是硬成本。后续会自建测试员池，价格会降下来。

## 🚀 快递流程

```
你的App → 我们打包备料 → 我们代你操作提交 → 上架成功
```

1. **下单** — 告诉我们App名称、技术栈、目标平台
2. **备料** — 我们准备全部上架材料（描述、截图、隐私政策、签名、测试员方案）
3. **代提交** — 你提供账号密码，我们代你完成全部提交操作，通常30分钟内完成

## 🔑 安全保证

- 你提供账号密码，我们全流程代操作，你不用动手
- 我们承诺保密，服务完成后不保留任何凭证
- 按方案操作后审核未通过，**全款返还**

## 📖 开源文档

这个仓库也包含完整的上架文档和工具，供想自己动手的开发者参考：

### 文档指南 (`docs/`) — 中英双语
| 文档 | 中文 | English |
|---|---|---|
| Apple App Store 上架指南 | [中文](docs/apple-appstore-guide.md) | [English](docs/apple-appstore-guide-en.md) |
| Google Play 上架指南 | [中文](docs/google-play-guide.md) | [English](docs/google-play-guide-en.md) |
| Codemagic CI/CD 配置 | [中文](docs/codemagic-setup.md) | [English](docs/codemagic-setup-en.md) |
| Closed Testing 完整指南 | [中文](docs/google-play-closed-testing.md) | [English](docs/google-play-closed-testing-en.md) |
| 审核被拒常见原因 | [中文](docs/rejection-reasons.md) | [English](docs/rejection-reasons-en.md) |

### 脚本工具 (`scripts/`)
| 脚本 | 说明 |
|---|---|
| `resize-icon.sh` | 应用图标自动缩放（1024→各尺寸） |
| `sign-aab.sh` | AAB 签名脚本 |
| `generate-metadata.py` | 生成应用描述、关键词等元数据 |

### 模板 (`templates/`) — 中英双语
| 模板 | 中文 | English |
|---|---|---|
| 隐私政策 HTML | [中文](templates/privacy-policy.html) | [English](templates/privacy-policy-en.html) |
| 上架清单 | [中文](templates/store-listing-checklist.md) | [English](templates/store-listing-checklist-en.md) |
| 权限使用说明 | [中文](templates/permission-justification.md) | [English](templates/permission-justification-en.md) |
| Codemagic 配置 | [YAML](templates/codemagic.yaml) | — |

## 🤖 在线下单

不想自己折腾？直接找我们代劳：

- 🌐 网站：[publish.runorb.us](https://publish.runorb.us)
- 📧 邮箱：publish@runorb.org
- 🤖 智谱接单员：[在线下单](https://chatglm.cn/share/dFih9tAA)
- 🐙 GitHub：[app-publish-toolkit](https://github.com/runorbclub-beep/app-publish-toolkit)

## 📄 License

MIT License — 文档和工具自由使用，欢迎商用。

## ⭐ Star History

如果这个项目对你有帮助，请给个 Star ⭐
