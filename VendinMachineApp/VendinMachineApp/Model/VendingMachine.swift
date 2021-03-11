
import Foundation

enum VendingMachineMoney : Int, CaseIterable {
    case insertMoneyType1 = 1000
    case insertMoneyType2 = 5000
}

struct VendingMachine {
    private(set) var cashBox: Int
    private var beverages: Beverages
    private var shoppingHistoryData: Beverages
    
    init() {
        cashBox = 0
        beverages = Beverages()
        shoppingHistoryData = Beverages()
    }
    
    func shoppingHistory() -> Beverages {
        return shoppingHistoryData
    }
    
    mutating func insertCash(amount: Int) {
        self.cashBox += amount
    }
    
    mutating func reduceCash(amount: Int) {
        self.cashBox -= amount
    }
    
    func addBeverageStock(_ beverage: Beverage) {
        self.beverages.addBeverage(element: beverage)
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
    
    func BeveragesOfSameOrigin(where country: Country) -> Beverages {
        return self.beverages.sameOriginBeverageList(madeIn: country)
    }
    
    mutating func buy(beverageType: Beverage.Type) -> Beverage? {
        guard !self.beverages.isEmpty(elementType: beverageType) || self.beverages.priceInfo(elementType: beverageType) != nil else {
            return nil
        }
        let purchasedBeverage = self.beverages.remove(elementType: beverageType)!
        self.shoppingHistoryData.addBeverage(element: purchasedBeverage)
        return purchasedBeverage
    }
    
}
