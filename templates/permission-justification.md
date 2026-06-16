# 权限使用说明模板

> 提交给 Apple App Store 和 Google Play 的权限使用说明

## Apple App Store (Info.plist)

### 蓝牙
```xml
<key>NSBluetoothAlwaysUsageDescription</key>
<string>本应用需要蓝牙权限来连接和通信外部设备（如运动传感器），以提供实时运动数据监测功能。</string>
```

### 相机
```xml
<key>NSCameraUsageDescription</key>
<string>本应用需要相机权限来拍摄用户头像和扫描二维码，以完成个人资料设置和设备配对。</string>
```

### 相册
```xml
<key>NSPhotoLibraryUsageDescription</key>
<string>本应用需要相册权限来选择用户头像和保存应用截图。</string>
```

### 定位
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>本应用需要定位权限来记录运动轨迹和提供附近活动推荐。</string>
```

### 通知
```xml
<key>NSUserNotificationsUsageDescription</key>
<string>本应用需要通知权限来发送运动提醒、活动邀请和重要消息。</string>
```

### 麦克风
```xml
<key>NSMicrophoneUsageDescription</key>
<string>本应用需要麦克风权限来支持语音输入和语音消息功能。</string>
```

---

## Google Play (数据安全表 + 权限说明)

### 权限说明模板

| 权限 | 用途说明 |
|---|---|
| BLUETOOTH_CONNECT | 连接运动传感器等蓝牙设备，传输实时运动数据 |
| BLUETOOTH_SCAN | 搜索和发现附近的蓝牙设备 |
| CAMERA | 拍摄用户头像、扫描二维码 |
| READ_EXTERNAL_STORAGE | 读取用户选择的头像图片 |
| WRITE_EXTERNAL_STORAGE | 保存应用截图和运动数据 |
| ACCESS_FINE_LOCATION | 记录运动轨迹、推荐附近活动 |
| ACCESS_COARSE_LOCATION | 大致位置推荐 |
| POST_NOTIFICATIONS | 发送运动提醒和活动通知 |
| RECORD_AUDIO | 语音输入和语音消息 |
| FOREGROUND_SERVICE | 在后台保持蓝牙连接和数据记录 |
| FOREGROUND_SERVICE_CONNECTED_DEVICE | 前台服务管理蓝牙设备连接 |

### ⚠️ FOREGROUND_SERVICE_CONNECTED_DEVICE 特别说明

Google Play 要求使用此权限的 App 上传演示视频：

```
演示视频 URL: [YouTube 链接]

视频内容说明：
1. App 启动后自动搜索蓝牙设备
2. 用户选择目标设备进行配对
3. 连接成功后实时显示设备数据
4. App 切到后台后仍保持连接
5. 断开连接时通知用户
```

---

## 数据安全表填写指南

### 数据收集声明

| 数据类型 | 是否收集 | 用途 | 是否分享 |
|---|---|---|---|
| 大致位置 | 是/否 | [用途] | 否 |
| 精确位置 | 是/否 | [用途] | 否 |
| 邮箱 | 是/否 | [用途] | 否 |
| 照片或视频 | 是/否 | [用途] | 否 |
| 设备ID | 是/否 | [用途] | 否 |
| 使用数据 | 是/否 | [用途] | 否 |
| 崩溃日志 | 是/否 | [用途] | 否 |

### 数据加密
- ✅ 数据传输使用 HTTPS/TLS 加密
- ✅ 敏感数据使用 AES-256 加密存储

### 数据删除
- 用户可在 App 内申请删除数据
- 邮箱申请：[support email]

---

## ⚠️ 常见权限审核被拒原因

1. **权限说明过于简单**：如"需要蓝牙权限" → 应详细说明用途
2. **声明了不使用的权限**：移除所有不需要的权限
3. **数据安全表与实际不符**：如实声明所有第三方 SDK 收集的数据
4. **FOREGROUND_SERVICE 权限无演示视频**：必须上传 YouTube 视频
5. **权限用途不合理**：如计算器 App 申请定位权限
