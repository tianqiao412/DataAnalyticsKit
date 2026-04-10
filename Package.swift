// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "DataAnalyticsKit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "DataAnalyticsKit",
            targets: ["DataAnalyticsKit"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DataAnalyticsKit",
            dependencies: []),
    ]
)
