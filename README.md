# DataAnalyticsKit


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


## 要求

- iOS 15.0+
- Swift 5.7+
