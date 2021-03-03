import Foundation

class Drink: Hashable {
    private(set) var brand: String
    private(set) var capacity: Int
    private(set) var price: Int
    private(set) var name: String
    private(set) var manufactured: Date
    
    init(brand: String, capacity: Int, price: Int, name: String, manufactured: Date = Date()) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufactured = manufactured
    }
    
    static func == (lhs: Drink, rhs: Drink) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

extension Drink: CustomStringConvertible {
    var description: String {
        let formattedDate = self.manufactured.toString()
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(formattedDate)"
    }
}
