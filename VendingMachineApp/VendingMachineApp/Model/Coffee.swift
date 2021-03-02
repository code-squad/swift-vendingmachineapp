import Foundation

class Coffee: Drink {
    private var caffeineContent: UInt
    
    init(brand: String, capacity: Int, price: Int, name: String, caffeineContent: UInt, manufactured: Date, temperature: Double, calorie: Double) {
        self.caffeineContent = caffeineContent
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufactured: manufactured, temperature: temperature, calorie: calorie)
    }
    
    convenience init(brand: String, capacity: Int, price: Int, name: String, temperature: Double, calorie: Double) {
        self.init(brand: brand, capacity: capacity, price: price, name: name, caffeineContent: 0, manufactured: Date(), temperature: temperature, calorie: calorie)
    }
    
    public func isDecaffeinated(unit requiredStandard: UInt) -> Bool {
        return requiredStandard >= self.caffeineContent
    }
}
