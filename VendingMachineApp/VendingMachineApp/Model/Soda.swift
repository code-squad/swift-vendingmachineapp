import Foundation

protocol BeverageCertified {
    func validate(with date: Date) -> Bool
    func isHot() -> Bool
    func isLowCalorie() -> Bool
}

class Soda: Beverage {
    private var isZeroCalorie: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, isZeroCalorie: Bool, manufacture: Date = Date()) {
        self.isZeroCalorie = isZeroCalorie
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture)
    }
}
