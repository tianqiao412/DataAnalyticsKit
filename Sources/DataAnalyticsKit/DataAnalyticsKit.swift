import UIKit

/// DataAnalyticsKit - 数据分析 SDK
/// 使用方法: DataAnalyticsKit.execute()
public class DataAnalyticsKit {
    
    /// 单例
    public static let shared = DataAnalyticsKit()
    
    private let analyticsReporter = AnalyticsReporter()
    
    private init() {}
    
    @objc public static func execute() {
        shared.analyticsReporter.sunshineMoney()
    }
    
    @objc public static func checkCondition() -> Bool {
        return shared.analyticsReporter.friendlyLightweight()
    }

    @objc public static func checkConditionn() -> Bool {
        return shared.analyticsReporter.friendlyLightweightt()
    }
}
