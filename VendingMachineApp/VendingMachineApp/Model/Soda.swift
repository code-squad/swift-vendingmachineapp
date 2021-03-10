import Foundation

class Soda: Drink {
    private var isZeroCalorie: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, isZeroCalorie: Bool, manufactured: Date, temperature: Double, calorie: Double) {
        self.isZeroCalorie = isZeroCalorie
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufactured: manufactured, temperature: temperature, calorie: calorie)
    }
    
    convenience init(brand: String, capacity: Int, price: Int, name: String, temperature: Double, calorie: Double) {
        self.init(brand: brand, capacity: capacity, price: price, name: name, isZeroCalorie: false, manufactured: Date(), temperature: temperature, calorie: calorie)
    }
    
    required init?(coder: NSCoder) {
        self.isZeroCalorie = coder.decodeBool(forKey: "isZeroCalorie")
        super.init(coder: coder)
    }
}

