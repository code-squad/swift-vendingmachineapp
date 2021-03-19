
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
        
        var info : [AnyHashable:Any] = [:]
        info.updateValue(beverageCount, forKey: "beverageCount")
        info.updateValue(name, forKey: "name")
        
        NotificationCenter.default.post(name: NSNotification.Name("bananaAdd"), object: self, userInfo: info)
    }
}
