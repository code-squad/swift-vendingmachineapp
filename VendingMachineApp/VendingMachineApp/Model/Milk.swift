import Foundation

class Milk: Drink {    
    private var isLowFatMilk: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, isLowFatMilk: Bool, manufactured: Date) {
        self.isLowFatMilk = isLowFatMilk
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufactured: manufactured)
    }
    
    override convenience init(brand: String, capacity: Int, price: Int, name: String, manufactured: Date) {
        self.init(brand: brand, capacity: capacity, price: price, name: name, isLowFatMilk: false, manufactured: manufactured)
    }

}
