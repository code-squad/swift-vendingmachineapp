import Foundation

class Beverages {
    var beverages: [Beverage]
    
    init() {
        beverages = [Beverage]()
    }
    
    func append(from beverage: Beverage) {
        beverages.append(beverage)
    }
    
    func forEachBeverage(_ transform: (Beverage)->()) {
        beverages.forEach { transform($0) }
    }
    
    func removeProduct(_ product: Beverage) {
        beverages.remove(at: beverages.firstIndex(of: product)!)
    }
    
    func countOfBeverages() -> [String: Int]{
        var stockList = [String:Int]()
        for beverage in beverages {
            let productName = beverage.productName
            if stockList[productName] == nil {
                stockList[productName] = 1
            } else {
                stockList[productName]! += 1
            }
        }
        return stockList
    }
}
