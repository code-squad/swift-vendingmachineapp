import Foundation

class Milk: Beverage {    
    private(set) var isLowFatMilk: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, isLowFatMilk: Bool, manufacture: Date = Date()) {
        self.isLowFatMilk = isLowFatMilk
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture)
    }
}
