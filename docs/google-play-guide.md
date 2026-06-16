# Google Play 上架完整指南

> 基于 RunOrb App (com.runorb.iloverunorb) 实战上架经验整理

## 目录
1. [前置准备](#1-前置准备)
2. [Google Play Developer 账号](#2-google-play-developer-账号)
3. [应用签名](#3-应用签名)
4. [Store Listing 配置](#4-store-listing-配置)
5. [Closed Testing（封闭测试）](#5-closed-testing封闭测试)
6. [Production 发布](#6-production-发布)
7. [常见被拒原因](#7-常见被拒原因)
8. [政策合规要点](#8-政策合规要点)

---

## 1. 前置准备

### 必备材料
- [ ] Google 账号
- [ ] 支付方式（信用卡，用于 $25 一次性注册费）
- [ ] AAB 文件（Android App Bundle，非 APK）
- [ ] 应用图标 512×512 PNG
- [ ] Feature Graphic 1024×500 PNG
- [ ] 截图至少 2 张（手机截图 1080×1920 或更高）
- [ ] 应用描述（中英文）
- [ ] 隐私政策 URL
- [ ] 数据安全表

### ⚠️ 中国大陆开发者特别注意
- **Google 账号**：需使用能访问 Google Play Console 的账号
- **支付方式**：$25 注册费需境外信用卡或 PayPal
- **网络环境**：Google Play Console 需科学上网
- **应用签名**：Google Play App Signing 需上传签名密钥

---

## 2. Google Play Developer 账号

### 注册流程
1. 访问 https://play.google.com/console
2. 使用 Google 账号登录
3. 支付 $25 一次性注册费
4. 完成开发者身份验证
5. 等待审核（通常 1-3 天）

### ⚠️ 个人账号 vs 组织账号
| 对比项 | 个人账号 | 组织账号 |
|---|---|---|
| 费用 | $25 | $25 |
| 审核时间 | 1-3天 | 3-7天 |
| Closed Testing | **必须**（2024年12月起） | **必须** |
| D-U-N-S | 不需要 | 需要 |
| 显示名称 | 个人姓名 | 公司名 |

### ⚠️ 2024年12月新政策
- **账号注册在 2023-11-13 后的个人账号**必须先完成 Closed Testing
- 最低 12 名测试员 × 14 天连续测试
- 完成后才能申请 Production 权限
- 已有 Production 权限的账号不豁免

---

## 3. 应用签名

### Play App Signing
Google Play 要求使用 Play App Signing：
1. 上传你的签名密钥（.keystore 或 .jks）
2. Google 用你的密钥签名发布版本
3. Google 另外用其自己的密钥签名分发版本

### 生成签名密钥
```bash
keytool -genkey -v \
  -keystore your-app-release.keystore \
  -alias your-app \
  -keyalg RSA -keysize 2048 \
  -validity 10000
```

### ⚠️ 重要提醒
- **妥善保管 keystore 和密码**！后续更新必须用同一 keystore
- 丢失 keystore 需联系 Google Play 支持重置（耗时数周）
- 建议备份到安全位置（如加密云存储）

### Gradle 签名配置
```gradle
android {
    signingConfigs {
        release {
            storeFile file('../../your-app-release.keystore')
            storePassword 'your-store-password'
            keyAlias 'your-app'
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

### 构建签名 AAB
```bash
./gradlew bundleRelease
# 输出：app/build/outputs/bundle/release/app-release.aab
```

---

## 4. Store Listing 配置

### 主要信息
| 字段 | 限制 | 说明 |
|---|---|---|
| App name | 30 字符 | 应用名称 |
| Short description | 80 字符 | 简短描述 |
| Full description | 4000 字符 | 详细描述 |
| App icon | 512×512 PNG | 32-bit PNG |
| Feature graphic | 1024×500 PNG | 宣传图 |
| Phone screenshots | 2-8 张 | 最少 2 张 |
| 7-inch screenshots | 可选 | 平板截图 |
| 10-inch screenshots | 可选 | 平板截图 |

### 数据安全表（Data Safety）
必须声明：
- App 是否收集数据
- 收集哪些类型的数据
- 数据如何使用
- 数据是否共享
- 数据是否加密
- 用户能否请求数据删除

### 内容分级
- 填写 IARC 问卷
- 系统自动生成分级（PEGI/ESRB等）
- 问卷需如实填写

### 目标受众
- 目标受众年龄
- 目标受众地区
- 是否面向儿童

---

## 5. Closed Testing（封闭测试）

### ⚠️ 2024年12月新政策核心
- 新个人账号必须完成 Closed Testing 才能申请 Production
- 最低 12 名测试员
- 连续 14 天测试
- 测试员需是 Google 群组成员

### 步骤
1. **创建 Google 群组**
   - 访问 https://groups.google.com
   - 创建群组（如 `your-app-testers@googlegroups.com`）
   - 邀请至少 12 名测试员加入

2. **创建 Closed Testing 轨道**
   - 在 Play Console → Testing → Closed testing
   - 选择「创建发布版本」
   - 上传 AAB
   - 添加测试员 Google 群组邮箱

3. **14 天测试期**
   - 测试员需通过 Opt-in URL 加入测试
   - 测试员需实际安装和使用 App
   - 建议测试员提交反馈

4. **申请 Production 权限**
   - 完成 14 天测试后
   - 在 Play Console 申请 Production 访问权限
   - Google 审核（可能需数天）

### ⚠️ RunOrb 实战经验
- 测试员可以是朋友、同事、社区成员
- 测试员必须用加入群组的 Google 账号安装 App
- 14 天必须是连续的，中断需重新计时
- 建议多招募几人作为备份（有人可能不活跃）

### 招募测试员的方法
1. 朋友/同事/家人
2. Reddit r/AndroidBetaTesting
3. 测试社区（如 betafamily.com）
4. 社交媒体招募
5. 付费测试服务（如 primetestlab）

---

## 6. Production 发布

### 前提条件
- [ ] Closed Testing 已完成（新账号）
- [ ] Production 权限已获批
- [ ] Store Listing 已完成
- [ ] 数据安全表已填写
- [ ] 内容分级已完成
- [ ] 隐私政策 URL 可访问

### 发布步骤
1. Play Console → Production → 创建发布版本
2. 上传 AAB
3. 填写发布说明
4. 查看发布详情
5. 滚动到底部，点击「审核发布」
6. 选择发布方式：
   - **立即发布**：几小时后上线
   - **定时发布**：指定时间上线

### 分阶段发布
- 可设置 1%-100% 分阶段发布
- 先向 1% 用户发布，观察崩溃率和评分
- 逐步扩大到 100%

---

## 7. 常见被拒原因

### 政策违规
| 原因 | 解决方案 |
|---|---|
| 隐私政策 URL 不可访问 | 确保直接返回 HTML，无重定向 |
| 数据安全表不准确 | 如实声明所有数据收集 |
| 权限使用不合理 | 说明每个权限的用途 |
| 目标受众设置不当 | 如实设置 |
| 知识产权侵权 | 确保不使用他人商标/版权内容 |

### ⚠️ RunOrb 被拒经验
1. **隐私政策 URL 重定向**：CF Pages SPA 路由把 `/privacy.html` 重定向到首页
   - **解决**：使用独立 HTML 文件，不依赖 SPA 路由
2. **FOREGROUND_SERVICE_CONNECTED_DEVICE 权限**：需上传演示视频
   - **解决**：录制 YouTube 视频展示功能

### 申诉流程
1. Play Console → Policy status → 查看违规详情
2. 修改 App 或 Store Listing
3. 提交申诉（附修改说明）
4. 等待 Google 审核（通常 2-5 天）

---

## 8. 政策合规要点

### 必须遵守的政策
- **User Data Policy**：数据收集和使用合规
- **Permissions Policy**：权限使用合理
- **Content Policy**：不含违规内容
- **Spam Policy**：不重复发布、不误导用户
- **Malware Policy**：不含恶意代码

### 数据安全表要点
- 声明所有 SDK 收集的数据（包括第三方 SDK）
- 区分「必需」和「可选」数据收集
- 如果 App 不收集数据，也需明确声明
- 隐私政策 URL 必须与数据安全表一致

### 权限最小化原则
- 只申请必需的权限
- 每个权限都要有明确用途
- 移除不使用的权限
- 使用 `<uses-feature>` 声明是否必需

---

## 需要帮助？

我们提供专业的人机协作上架服务：

- 💬 咨询服务：¥299/次
- 📱 标准上架：¥1999/次
- 🧪 Closed Testing 管理：¥1499/次
- 📱📱 双端上架：¥3499/次

访问 [publish.runorb.us](https://publish.runorb.us) 或在 GitHub Issues 提问。
