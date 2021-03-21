
import Foundation

class BeveragePurchasedHistory  {
    private var beveragePurchasedHistory: [String]
    
    init() {
        self.beveragePurchasedHistory = []
    }
    
    func addHistory(name: String) {
        let beverageCount = self.beveragePurchasedHistory.count
        self.beveragePurchasedHistory.append(name)
        
        var shoppingInfo : [AnyHashable:Any] = [:]
        shoppingInfo.updateValue(beverageCount, forKey: NotificationUserInfo.beverageCount)
        shoppingInfo.updateValue(name, forKey: NotificationUserInfo.name)
        NotificationCenter.default.post(name: BeveragePurchasedHistory.buyBeverage, object: self, userInfo: shoppingInfo)
    }
}

extension BeveragePurchasedHistory {
    
    enum NotificationUserInfo {
        case name
        case beverageCount
    }
    
    static let buyBeverage = NSNotification.Name("buyBeverage")

}
