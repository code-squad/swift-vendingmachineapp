
import Foundation

class VendingMachine {
    private var beverageStock: [Beverage]
    
    init() {
        beverageStock = []
    }
    
    func addBeverage(_ beverage: Beverage) {
        self.beverageStock.append(beverage)
    }
    
    func checkStock() {
        self.beverageStock.forEach { beverage in
            print(beverage)
        }
    }
}
