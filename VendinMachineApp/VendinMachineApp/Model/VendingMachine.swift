
import Foundation

class VendingMachine {
    private var beverageStock: [Beverage]
    
    init() {
        beverageStock = []
    }
    
    func addBeverage(_ beverage: Beverage) {
        self.beverageStock.append(beverage)
    }
    
    func stockList(closure: (Beverage) -> Void) {
        self.beverageStock.forEach { beverage in
            closure(beverage)
        }
    }
}
