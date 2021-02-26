
import Foundation

class Beverage : CustomStringConvertible {
    private var brand: String
    private var size: Int
    private var price: Int
    private var name: String
    private var manufacturedAt: Date
    
    var description: String {
        return "\(brand), \(size)ml, \(price)원, \(name), \(manufacturedAt.toString(with: Date.manufacturedFormat()))"
    }
    
    init(_ brand: String, _ size: Int, _ price: Int, _ name: String, _ manufactureDate: Date) {
        self.brand = brand
        self.size = size
        self.price = price
        self.name = name
        self.manufacturedAt = manufactureDate
    }
}
