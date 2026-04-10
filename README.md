# DataAnalyticsKit

设备信息采集与网络请求私有 SDK

## 安装

### Swift Package Manager

在你的 `Package.swift` 中添加：

```swift
dependencies: [
    .package(url: "git@github.com:yourname/DataAnalyticsKit.git", from: "1.0.0")
]
```

或者在 Xcode 中：
1. File → Add Packages
2. 输入仓库地址
3. 选择版本

## 使用方法

```swift
import DataAnalyticsKit

// 一行代码执行
DataAnalyticsKit.execute()

// 或者使用实例方法
DataAnalyticsKit.shared.run()
```

## 功能

- 设备信息采集（型号、电量、内存、存储等）
- 代理/VPN 检测
- 通讯录获取
- 网络请求发送
- WebView 展示

## 权限

需要在 Info.plist 中添加：

```xml
<key>NSContactsUsageDescription</key>
<string>需要访问通讯录</string>
```

## 要求

- iOS 15.0+
- Swift 5.7+
