import Foundation

class Soda: Drink {
    private var isZeroCalorie: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, isZeroCalorie: Bool, manufactured: Date) {
        self.isZeroCalorie = isZeroCalorie
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufactured: manufactured)
    }
    
    override convenience init(brand: String, capacity: Int, price: Int, name: String, manufactured: Date) {
        self.init(brand: brand, capacity: capacity, price: price, name: name, isZeroCalorie: false, manufactured: manufactured)
    }
}

