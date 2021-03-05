
import Foundation

class Beverages {
    private var beverages: [Beverage:Int]
    
    init() {
        self.beverages = [:]
    }
    
    func remove(element: Beverage) -> Beverage {
        self.beverages[element] = (beverages[element] ?? 0) - 1
        if let outOfStock = self.beverages[element], outOfStock == 0 {
            beverages.removeValue(forKey: element)
        }
        return element
    }
    
    func isInStock(of beverage: Beverage) -> Bool {
        return self.beverages[beverage] != nil ? true : false
    }
    
    func addSome(_ element: Beverage, _ count: Int = 1) {
        self.beverages[element] = (beverages[element] ?? 0) + count
    }
    
    func beverageList(under price: Int) -> Beverages {
        let beverages = Beverages()
        
        self.beverages.forEach { (beverage, count) in
            if beverage.isPriced(under: price) {
                beverages.addSome(beverage, count)
            }
        }
        return beverages
    }
    
    func yellowBananaMilkList() -> Beverages {
        let yellowBananaMilk = Beverages()
        
        self.beverages.forEach { (beverage, count) in
            if let bananaMilk = beverage as? BananaMilk, bananaMilk.isRealBananaMilk() {
                yellowBananaMilk.addSome(beverage, count)
            }
        }
        return yellowBananaMilk
    }
    
    func hotBeverageList(over temperature: Int) -> Beverages {
        let hotBeverages = Beverages()
        
        self.beverages.forEach { (beverage, count) in
            if let hotBeverage = beverage as? Hotable, hotBeverage.isHot(standard: temperature) {
                hotBeverages.addSome(beverage, count)
            }
        }
        return hotBeverages
    }
    
    func expiredBeverageList(on Date: Date) -> Beverages {
        let expiredBeverages = Beverages()
        
        self.beverages.forEach { (beverage, count) in
            if let expiredBeverage = beverage as? Drinkable, !expiredBeverage.isDrinkable(on: Date) {
                expiredBeverages.addSome(beverage, count)
            }
        }
        return expiredBeverages
    }
    
    func americanoAddedShotList(over shot: Int) -> Beverages {
        let americanos = Beverages()
        
        self.beverages.forEach { (beverage, count) in
            if let americanoAddedShot = beverage as? Shot, americanoAddedShot.isMoreThan(shot: shot) {
                americanos.addSome(beverage, count)
            }
        }
        return americanos
    }
    
    func sameOriginBeverageList(madeIn country: Country) -> Beverages {
        let sameOriginBeverages = Beverages()
        
        self.beverages.forEach { (beverage, count) in
            if let beverageCountry = beverage as? Country, type(of: beverageCountry.madeIn()) == type(of: country.madeIn()) {
                sameOriginBeverages.addSome(beverage, count)
            }
        }
        return sameOriginBeverages
    }
    
    func lowCalorieBeverageList(below calories: Int) -> Beverages {
        let lowCalorieBeverages = Beverages()
        
        self.beverages.forEach { (beverage, count) in
            if let lowCalorieBeverage = beverage as? Calorie, lowCalorieBeverage.isLowCalories(standard: calories) {
                lowCalorieBeverages.addSome(beverage, count)
            }
        }
        return lowCalorieBeverages
    }
    
    func beverageListOfTransparentPackage() -> Beverages {
        let beveragesOfTransparentPackage = Beverages()
        
        self.beverages.forEach { (beverage, count) in
            if let transparentPackageBeverage = beverage as? Package, transparentPackageBeverage.isTransparentMaterial() {
                beveragesOfTransparentPackage.addSome(beverage, count)
            }
        }
        return beveragesOfTransparentPackage
    }
}

extension Beverages : Equatable {
    static func == (lhs: Beverages, rhs: Beverages) -> Bool {
        lhs.beverages == rhs.beverages
    }
}
