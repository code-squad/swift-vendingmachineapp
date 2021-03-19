
import Foundation

class BeveragePurchasedHistory : NSObject, NSCoding {
    private var beveragePurchasedHistory: [[String]]
    
    override init() {
        self.beveragePurchasedHistory = [[]]
    }
    
    required init?(coder: NSCoder) {
        self.beveragePurchasedHistory = coder.decodeObject(forKey: "beveragePurchasedHistory") as! [[String]]
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.beveragePurchasedHistory, forKey: "beveragePurchasedHistory")
    }
    
    func addHistory(name: String) {
        let columnNumber = self.beveragePurchasedHistory.count - 1
        let rowNumber = self.beveragePurchasedHistory[columnNumber].count
        if rowNumber >= 10 {
            self.beveragePurchasedHistory.append([name])
        } else {
            self.beveragePurchasedHistory[columnNumber].append(name)
        }
    }
}
