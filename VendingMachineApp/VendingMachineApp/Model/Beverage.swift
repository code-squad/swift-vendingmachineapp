import Foundation

class Beverage {
    private var brand: String
    private var capacity: Int
    private var price: Int
    private var name: String
    private var date: Date
    
    init(brand: String, capacity: Int, price: Int, name: String, date: Date = Date()) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.date = date
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        let formattedDate = Utility.formatDate(from: self.date)
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(formattedDate)"
    }
}
