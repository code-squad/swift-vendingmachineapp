import Foundation

class Coffee: Drink {
    private(set) var isDecaffeinated: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, isDecaffeinated: Bool, manufactured: Date) {
        self.isDecaffeinated = isDecaffeinated
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufactured: manufactured)
    }
    
    override convenience init(brand: String, capacity: Int, price: Int, name: String, manufactured: Date) {
        self.init(brand: brand, capacity: capacity, price: price, name: name, isDecaffeinated: false, manufactured: manufactured)
    }
}
