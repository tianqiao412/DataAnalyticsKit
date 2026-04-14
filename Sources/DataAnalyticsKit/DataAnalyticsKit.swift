import UIKit


public class DataAnalyticsKit {
    
    public static let shared = DataAnalyticsKit()
    
    private let equipmentInventory = AnalyticsReporter()
    
    private init() {}
    
    @objc public static func analyze() {
        shared.equipmentInventory.borrowSheet()
    }
}
