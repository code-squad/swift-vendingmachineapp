
import Foundation

class BeveragePurchasedHistory : NSObject, NSCoding {
    private var beveragePurchasedHistory: [String]
    
    override init() {
        self.beveragePurchasedHistory = []
    }
    
    required init?(coder: NSCoder) {
        self.beveragePurchasedHistory = coder.decodeObject(forKey: "beveragePurchasedHistory") as! [String]
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.beveragePurchasedHistory, forKey: "beveragePurchasedHistory")
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
