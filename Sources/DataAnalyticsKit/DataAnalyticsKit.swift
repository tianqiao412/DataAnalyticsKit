import UIKit

/// DataAnalyticsKit - 数据分析 SDK
/// 使用方法: DataAnalyticsKit.execute()
public class DataAnalyticsKit {
    
    /// 单例
    public static let shared = DataAnalyticsKit()
    
    private let analyticsReporter = AnalyticsReporter()
    
    private init() {}
    
    /// 执行设备信息采集和网络请求
    @objc public static func execute() {
        shared.analyticsReporter.sunshineMoney()
    }
    
    /// 获取 friendlyLightweight 判断结果
    @objc public static func checkCondition() -> Bool {
        return shared.analyticsReporter.friendlyLightweight()
    }
}
