import Foundation

class Soda: Drink {
    private(set) var isZeroCalorie: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, isZeroCalorie: Bool, manufactured: Date = Date()) {
        self.isZeroCalorie = isZeroCalorie
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufactured: manufactured)
    }
}
