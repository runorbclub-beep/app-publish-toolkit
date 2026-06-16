# Permission Usage Justification Template

> For Apple App Store and Google Play permission submissions

## Apple App Store (Info.plist)

### Bluetooth
```xml
<key>NSBluetoothAlwaysUsageDescription</key>
<string>This app requires Bluetooth access to connect and communicate with external devices (e.g., sports sensors) for real-time activity data monitoring.</string>
```

### Camera
```xml
<key>NSCameraUsageDescription</key>
<string>This app requires camera access to capture user avatars and scan QR codes for profile setup and device pairing.</string>
```

### Photo Library
```xml
<key>NSPhotoLibraryUsageDescription</key>
<string>This app requires photo library access to select user avatars and save app screenshots.</string>
```

### Location
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app requires location access to record activity routes and recommend nearby events.</string>
```

### Notifications
```xml
<key>NSUserNotificationsUsageDescription</key>
<string>This app requires notification access to send activity reminders, event invitations, and important messages.</string>
```

### Microphone
```xml
<key>NSMicrophoneUsageDescription</key>
<string>This app requires microphone access to support voice input and voice messages.</string>
```

---

## Google Play (Data Safety Form + Permission Justification)

### Permission Justification Template

| Permission | Usage Description |
|---|---|
| BLUETOOTH_CONNECT | Connect to Bluetooth devices (e.g., sports sensors) for real-time data transmission |
| BLUETOOTH_SCAN | Search and discover nearby Bluetooth devices |
| CAMERA | Capture user avatars, scan QR codes |
| READ_EXTERNAL_STORAGE | Read user-selected avatar images |
| WRITE_EXTERNAL_STORAGE | Save app screenshots and activity data |
| ACCESS_FINE_LOCATION | Record activity routes, recommend nearby events |
| ACCESS_COARSE_LOCATION | Approximate location recommendations |
| POST_NOTIFICATIONS | Send activity reminders and event notifications |
| RECORD_AUDIO | Voice input and voice messages |
| FOREGROUND_SERVICE | Maintain Bluetooth connection and data recording in background |
| FOREGROUND_SERVICE_CONNECTED_DEVICE | Foreground service for Bluetooth device connection management |

### ⚠️ FOREGROUND_SERVICE_CONNECTED_DEVICE Special Note

Google Play requires apps using this permission to upload a demo video:

```
Demo Video URL: [YouTube link]

Video Content Description:
1. App automatically searches for Bluetooth devices on launch
2. User selects target device to pair
3. Real-time device data displayed after successful connection
4. App maintains connection when switched to background
5. User notified when connection is lost
```

---

## Data Safety Form Guide

### Data Collection Declaration

| Data Type | Collected? | Purpose | Shared? |
|---|---|---|---|
| Approximate location | Yes/No | [purpose] | No |
| Precise location | Yes/No | [purpose] | No |
| Email | Yes/No | [purpose] | No |
| Photos or videos | Yes/No | [purpose] | No |
| Device ID | Yes/No | [purpose] | No |
| Usage data | Yes/No | [purpose] | No |
| Crash logs | Yes/No | [purpose] | No |

### Data Encryption
- ✅ Data transmission uses HTTPS/TLS encryption
- ✅ Sensitive data stored with AES-256 encryption

### Data Deletion
- Users can request data deletion within the app
- Email request: [support email]

---

## ⚠️ Common Permission Rejection Reasons

1. **Permission description too simple**: e.g., "Need Bluetooth" → Should detail the purpose
2. **Declared unused permissions**: Remove all unnecessary permissions
3. **Data safety form mismatch**: Declare all third-party SDK data collection honestly
4. **FOREGROUND_SERVICE without demo video**: Must upload YouTube video
5. **Unreasonable permission usage**: e.g., Calculator app requesting location
