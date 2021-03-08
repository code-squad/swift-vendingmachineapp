
import Foundation

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
    
    func addBeverageStock(_ element: Beverage) {
        self.beverages.addSome(element)
    }
    
    func totalBeverageStockList() -> Beverages {
        return self.beverages
    }
    
    func YellowBananaMilk() -> Beverages {
        return self.beverages.yellowBananaMilkList()
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
    
    func AmericanoAddedShot(over shotCount: Int) -> Beverages {
        return self.beverages.addedShotList(over: shotCount)
    }
    
    func LowCalorieBeverages(below calories: Int) -> Beverages {
        return self.beverages.lowCalorieBeverageList(below: calories)
    }
    
    func BeveragesOfSameOrigin(where country: Country) -> Beverages {
        return self.beverages.sameOriginBeverageList(madeIn: country)
    }
    
    mutating func buy(beverage: Beverage) -> Beverage? {
        guard beverage.isPriced(under: self.cashBox) && self.beverages.isInStock(of: beverage)
        else {
            return nil
        }
        let purchasedBeverage = self.beverages.remove(element: beverage)
        self.reduceCash(amount: beverage.price)
        self.shoppingHistoryData.addSome(purchasedBeverage)
        return purchasedBeverage
    }
    
}
