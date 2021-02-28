import Foundation

class Coffee: Drink {
    private(set) var isDecaffeinated: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, isDecaffeinated: Bool, manufactured: Date = Date()) {
        self.isDecaffeinated = isDecaffeinated
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufactured: manufactured)
    }
}
