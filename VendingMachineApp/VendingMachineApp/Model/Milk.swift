import Foundation

class Milk: Drink {    
    private var fat: Double
    
    init(brand: String, capacity: Int, price: Int, name: String, fat: Double, manufactured: Date, temperature: Double, calorie: Double) {
        self.fat = fat
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufactured: manufactured, temperature: temperature, calorie: calorie)
    }
    
    convenience init(brand: String, capacity: Int, price: Int, name: String, temperature: Double, calorie: Double) {
        self.init(brand: brand, capacity: capacity, price: price, name: name, fat: 3, manufactured: Date(), temperature: temperature, calorie: calorie)
    }
    
    convenience init() {
        self.init()
    }
    
    required init?(coder: NSCoder) {
        self.fat = coder.decodeDouble(forKey: "fat")
        super.init(coder: coder)
    }
    
    private func isLowFatMilk() -> Bool {
        return perCapacity(of: fat) <= 2.6
    }

}
