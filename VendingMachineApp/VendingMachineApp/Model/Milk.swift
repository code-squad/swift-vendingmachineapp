import Foundation

class Milk: Drink {    
    private(set) var isLowFatMilk: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, isLowFatMilk: Bool, manufactured: Date = Date()) {
        self.isLowFatMilk = isLowFatMilk
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufactured: manufactured)
    }
}
