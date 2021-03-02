
import Foundation

class Milk : Beverage, Drinkable {
    private var expiredAt: Date
    
    init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, validWithin days: Int) {
        self.expiredAt = manufactureAt.addingTimeInterval(Milk.valid(within: days))
        super.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt)
    }
    
    convenience init(brand: String, size: Int, price: Int, name: String, validWithin days: Int) {
        self.init(brand: brand, size: size, price: price, name: name, manufactureAt: Date(), validWithin: days)
    }
    
    static func valid(within days: Int) -> TimeInterval {
        let validDays:TimeInterval = 86400 * Double(days)
        return validDays
    }
    
    func validate(with date: Date) -> Bool {
        return expiredAt > date ? true : false
    }
    
}


protocol Drinkable {
    func validate(with date: Date) -> Bool
    static func valid(within days: Int) -> TimeInterval
}

