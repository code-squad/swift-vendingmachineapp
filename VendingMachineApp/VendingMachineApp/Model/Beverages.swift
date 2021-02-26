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
}
