import Foundation

class Coffee: Beverage {
    private var isDecaffeinated: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, isDecaffeinated: Bool, manufacture: Date = Date()) {
        self.isDecaffeinated = isDecaffeinated
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture)
    }
}
