
import Foundation

struct VendingMachine {
    private var cashBox: Int
    private var beverages: Beverages
    private var shoppingHistory: Beverages
    
    init() {
        cashBox = 0
        beverages = Beverages()
        shoppingHistory = Beverages()
    }
    
    func checkBalance() -> Int {
        return self.cashBox
    }
    
    mutating func insertCash(amount: Int) {
        self.cashBox += amount
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
        self.beverages.beverageList(under: checkBalance())
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
        return self.beverages.americanoAddedShotList(over: shotCount)
    }
    
    func LowCalorieBeverages(below calories: Int) -> Beverages {
        return self.beverages.lowCalorieBeverageList(below: calories)
    }
    
    func BeveragesOfSameOrigin(where country: Country) -> Beverages {
        return self.beverages.sameOriginBeverageList(madeIn: country)
    }
    
    mutating func buy(beverage: Beverage) -> Beverage? {
        guard beverage.isPriced(under: checkBalance()) && self.beverages.isInStock(of: beverage)
        else {
            return nil
        }
        let purchasedBeverage = self.beverages.remove(element: beverage)
        self.shoppingHistory.addSome(purchasedBeverage)
        return purchasedBeverage
    }
    
}
