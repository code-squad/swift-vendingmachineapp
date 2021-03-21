
import Foundation

class VendingMachine : NSObject, NSCoding {
    private(set) var cashBox: Int
    private var beverages: Beverages
    private(set) var shoppingHistoryData: BeveragePurchasedHistory
    
    enum Money : Int, CaseIterable {
        case insert1000 = 1000
        case insert5000 = 5000
    }
    
    override init() {
        cashBox = 0
        beverages = Beverages()
        shoppingHistoryData = BeveragePurchasedHistory()
    }
    
    required init?(coder: NSCoder) {
        self.cashBox = coder.decodeInteger(forKey: "cashBox")
        self.beverages = Beverages()
        self.shoppingHistoryData = BeveragePurchasedHistory()
        let beverageStockList:[[Beverage]] = coder.decodeObject(forKey: "beverageStockList") as! [[Beverage]]

        for (type, beverageList) in zip(VendingMachineElements().beverageList, beverageStockList) {
            self.beverages.setupToDecode(beverageList: beverageList, type: type)
        }
    }
    
    func encode(with coder: NSCoder) {
        var beverageStockList:[[Beverage]] = []

        for type in VendingMachineElements().beverageList {
            beverageStockList.append(beverages.beverageList(type: type))
        }

        coder.encode(self.cashBox, forKey: "cashBox")
        coder.encode(beverageStockList, forKey: "beverageStockList")
    }
    
    func shoppingHistory() -> BeveragePurchasedHistory {
        return shoppingHistoryData
    }
    
    func insertCash(amount: Int) {
        self.cashBox += amount
        NotificationCenter.default.post(name: VendingMachine.insertCash, object: self, userInfo: [NotificationUserInfo.cashBox :self.cashBox])
    }
    
    func reduceCash(amount: Int) {
        self.cashBox -= amount
    }
    
    func addBeverageStock(_ beverage: Beverage) {
        self.beverages.addBeverage(element: beverage)
        NotificationCenter.default.post(name: VendingMachine.addBeverageStock, object: self, userInfo: [NotificationUserInfo.beverageStock :totalBeverageStockList()])
    }
    
    func totalBeverageStockList() -> Beverages {
        return self.beverages
    }
    
    func buyableBeverageList() -> Beverages  {
        self.beverages.beverageList(under: self.cashBox)
    }
    
    func ExpiredBeverages(on date: Date) -> Beverages {
        return self.beverages.expiredBeverageList(on: date)
    }
    
    func BeveragesOfTransparentPackage() -> Beverages {
        return self.beverages.beverageListOfTransparentPackage()
    }
    
    func HotBeverages(over temperature: Int) -> Beverages {
        return self.beverages.hotBeverageList(over: temperature)
    }
    
    func beverageCount(beverageType: Beverage.Type) -> Int {
        return self.beverages.beverageCount(elementType: beverageType)
    }
    
    func AmericanoAddedShot(over shotCount: Int) -> Beverages {
        return self.beverages.addedShotList(over: shotCount)
    }
    
    func LowCalorieBeverages(below calories: Int) -> Beverages {
        return self.beverages.lowCalorieBeverageList(below: calories)
    }
    
    func BeveragesOfSameOrigin(where country: String) -> Beverages {
        return self.beverages.sameOriginBeverageList(madeIn: country)
    }
    
    func buy(beverageType: Beverage.Type) -> Beverage? {
        if let price = self.beverages.priceInfo(elementType: beverageType), price <= self.cashBox {
            self.cashBox -= price
            let purchasedBeverage = self.beverages.remove(elementType: beverageType)!
            self.shoppingHistoryData.addHistory(name: purchasedBeverage.name)
            
            NotificationCenter.default.post(name: VendingMachine.addBeverageStock, object: self, userInfo: [NotificationUserInfo.beverageStock :totalBeverageStockList()])
            NotificationCenter.default.post(name: VendingMachine.insertCash, object: self, userInfo: [NotificationUserInfo.cashBox :self.cashBox])
            
            return purchasedBeverage
        } else {
            return nil
        }
    }
    
}

extension VendingMachine {
    
    enum NotificationUserInfo {
        case cashBox
        case beverageStock
    }

    static let insertCash = Notification.Name("insertCash")
    static let addBeverageStock = Notification.Name("addBeverageStock")
    
}
