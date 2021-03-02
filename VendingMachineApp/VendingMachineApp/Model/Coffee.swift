import Foundation

class Coffee: Drink {
    private var caffeineContent: UInt
    
    init(brand: String, capacity: Int, price: Int, name: String, caffeineContent: UInt, manufactured: Date) {
        self.caffeineContent = caffeineContent
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufactured: manufactured)
    }
    
    override convenience init(brand: String, capacity: Int, price: Int, name: String, manufactured: Date) {
        self.init(brand: brand, capacity: capacity, price: price, name: name, caffeineContent: 0, manufactured: manufactured)
    }
    
    public func isDecaffeinated(unit requiredStandard: UInt) -> Bool {
        return requiredStandard >= self.caffeineContent
    }
}
