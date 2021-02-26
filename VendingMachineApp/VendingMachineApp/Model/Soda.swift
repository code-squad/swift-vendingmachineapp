import Foundation

class Soda: Beverage {
    private(set) var isZeroCalorie: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, isZeroCalorie: Bool, manufacture: Date = Date()) {
        self.isZeroCalorie = isZeroCalorie
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture)
    }
}
