
import Foundation

class Beverage : CustomStringConvertible {
    private var brand: String
    private var size: Int
    private(set) var price: Int
    private var name: String
    private var manufacturedAt: Date
    
    var description: String {
        return "\(brand), \(size)ml, \(price)원, \(name), \(manufacturedAt.toString(with: Date.manufacturedFormat()))"
    }
    
    init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date) {
        self.brand = brand
        self.size = size
        self.price = price
        self.name = name
        self.manufacturedAt = manufactureAt
    }
    
    class func makeBeverage() -> Beverage {
        return Beverage(brand: "unknown", size: 0, price: 0, name: "unknown", manufactureAt: Date())
    }
    
    func isPriced(under price: Int) -> Bool {
        return self.price <= price ? true : false
    }
}

extension Beverage : Hashable {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.brand == rhs.brand && lhs.size == rhs.size &&
            lhs.price == rhs.price && lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(brand)
        hasher.combine(size)
        hasher.combine(price)
        hasher.combine(name)
    }
    
}
