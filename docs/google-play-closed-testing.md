# Google Play Closed Testing 完整指南

> 2024年12月新政策：新个人账号必须完成 Closed Testing 才能发布到 Production

## 目录
1. [政策概述](#1-政策概述)
2. [测试员招募](#2-测试员招募)
3. [创建 Closed Testing](#3-创建-closed-testing)
4. [14天测试期管理](#4-14天测试期管理)
5. [申请 Production 权限](#5-申请-production-权限)
6. [常见问题](#6-常见问题)

---

## 1. 政策概述

### 谁需要 Closed Testing？
- ✅ 2023-11-13 之后注册的**个人账号** — **必须**
- ✅ 2023-11-13 之后注册的**组织账号** — **必须**
- ❌ 2023-11-13 之前注册且已有 Production 权限的账号 — **不需要**

### 最低要求
| 要求 | 最低值 |
|---|---|
| 测试员数量 | 12 人 |
| 测试持续时间 | 14 天连续 |
| 测试员类型 | Google 群组成员 |
| 测试员活跃度 | 需实际安装和使用 |

### ⚠️ 注意
- 12人是最低要求，建议招募 15-20 人作为备份
- 14天必须连续，如果中断需要重新计时
- 测试员必须通过 Opt-in URL 加入测试
- 测试员必须用加入群组的 Google 账号安装 App

---

## 2. 测试员招募

### 招募渠道

#### 免费
| 渠道 | 说明 | 难度 |
|---|---|---|
| 朋友/家人 | 最可靠，但人数有限 | ⭐ |
| 同事 | 如果有团队 | ⭐ |
| Reddit r/AndroidBetaTesting | 发帖招募 | ⭐⭐ |
| Reddit r/AndroidApps | 发帖招募 | ⭐⭐ |
| Twitter/X | 带 #AndroidBeta 标签 | ⭐⭐ |
| Facebook 群组 | Android 测试相关群组 | ⭐⭐ |
| Discord 社区 | Android 开发/测试服务器 | ⭐⭐ |

#### 付费
| 渠道 | 价格 | 说明 |
|---|---|---|
| PrimeTestLab | ~$5-10/测试员 | 专业测试服务 |
| BetaFamily | ~$3-8/测试员 | 测试社区 |
| Fiverr | ~$5-15/人 | 自由职业者 |

### 招募文案模板

**中文版**：
```
【招募 App 测试员】🚀

我们正在开发一款 [App 类型] App，需要 15 名 Android 测试员参与 Google Play 封闭测试。

要求：
- 有 Android 手机
- 有 Google 账号
- 能在 14 天内安装并使用 App
- 愿意提供简单反馈

参与方式：
1. 加入 Google 群组：[群组链接]
2. 通过 Opt-in URL 安装 App：[链接]

感谢你的帮助！🙏
```

**英文版**：
```
🚀 Beta Testers Needed!

We're developing a [App category] app and need 15 Android beta testers for Google Play Closed Testing.

Requirements:
- Android phone
- Google account
- Available for 14 days
- Willing to provide feedback

How to join:
1. Join our Google Group: [group link]
2. Install via Opt-in URL: [link]

Thank you for your help! 🙏
```

---

## 3. 创建 Closed Testing

### 步骤

1. **创建 Google 群组**
   - 访问 https://groups.google.com
   - 创建群组（如 `your-app-testers@googlegroups.com`）
   - 设置为「任何人可加入」或「需审批」
   - 邀请测试员加入

2. **在 Play Console 创建 Closed Testing**
   - Play Console → Testing → Closed testing
   - 点击「创建发布版本」
   - 上传 AAB 文件
   - 填写发布说明
   - 在「测试员」部分添加 Google 群组邮箱
   - 发布

3. **获取 Opt-in URL**
   - 发布后，在 Closed Testing 页面找到 Opt-in URL
   - 将 URL 分享给测试员

4. **测试员安装流程**
   - 测试员访问 Opt-in URL
   - 点击「加入测试」
   - 在 Google Play Store 安装 App
   - 必须用加入群组的 Google 账号操作

---

## 4. 14天测试期管理

### 日常管理
- **Day 1**：确认所有测试员已加入群组并安装 App
- **Day 2-3**：跟进未安装的测试员
- **Day 4-7**：收集初步反馈，修复 bug
- **Day 8-12**：如有新版本，推送更新
- **Day 13-14**：确认测试完成，准备申请 Production

### 跟踪测试员状态
在 Play Console → Testing → Closed testing → 查看测试员列表：
- 已加入：测试员已加入群组
- 已安装：测试员已安装 App
- 活跃：测试员在最近 7 天内使用了 App

### ⚠️ 注意事项
- 测试员不需要每天使用 App，但应在 14 天内有合理使用
- 如果测试员中途退出，可以补充新测试员
- 14天从第一个测试员安装开始计算
- 建议所有测试员在同一天开始，避免计时混乱

---

## 5. 申请 Production 权限

### 前提条件
- [ ] Closed Testing 已运行至少 14 天
- [ ] 至少 12 名测试员已安装 App
- [ ] 测试员有实际使用（不是只安装不打开）

### 申请步骤
1. Play Console → Testing → Closed testing
2. 确认测试已满足要求
3. 在 Play Console 首页或 Production 页面查找「申请 Production 访问权限」
4. 填写申请表：
   - App 的预期用途
   - Closed Testing 结果摘要
   - 测试员反馈摘要
5. 提交申请
6. 等待 Google 审核（通常 2-7 天）

### 申请文案模板
```
App 名称：[Your App Name]
Package ID：com.yourcompany.yourapp

Closed Testing 摘要：
- 测试期：2026-06-16 至 2026-06-30（14天）
- 测试员数量：15人
- 安装数量：14人
- 活跃测试员：12人

测试反馈摘要：
- 整体反馈积极
- 主要功能正常工作
- 修复了 3 个小 bug
- 测试员建议已记录，计划在后续版本实现

App 预期用途：
[简要描述 App 的功能和目标用户]
```

---

## 6. 常见问题

### Q: 测试员不足 12 人怎么办？
**A**: 可以使用付费测试服务（如 PrimeTestLab），或在更多社区招募。

### Q: 14 天中断了怎么办？
**A**: 需要重新开始 14 天计时。建议确保所有测试员在开始前已准备好。

### Q: 测试员没有 Google 账号怎么办？
**A**: 测试员必须有 Google 账号才能加入 Google 群组和安装测试 App。建议他们注册一个。

### Q: 可以同时测试多个 App 吗？
**A**: 可以，每个 App 需要独立的 Closed Testing 轨道。

### Q: Closed Testing 期间可以更新 App 吗？
**A**: 可以，上传新 AAB 会推送更新给测试员。

### Q: 申请 Production 被拒怎么办？
**A**: 根据拒绝原因修改，可以重新申请。常见原因：测试员不活跃、测试期不足。

---

## 需要帮助？

我们提供 Closed Testing 全流程管理服务：¥1499/次

包括：
- 测试员招募（保证 12+ 人）
- Google 群组创建和管理
- 14 天测试期跟踪
- Production 权限申请

访问 [publish.runorb.us](https://publish.runorb.us) 了解更多。
