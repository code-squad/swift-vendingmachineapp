import Foundation

class Beverages: Codable {
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
    
    func stockListOfBeverages() -> [Beverage: Int]{
        var stockList = [Beverage:Int]()
        for beverage in beverages {
            let productName = beverage
            if stockList[productName] == nil {
                stockList[productName] = 1
            } else {
                stockList[productName]! += 1
            }
        }
        return stockList
    }
    
    func stockOfEach(beverage: Beverage) -> Int{
        return beverages.filter { $0 == beverage}.count
    }
}
