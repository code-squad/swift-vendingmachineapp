import Foundation

class Drink {
    private var brand: String
    private var capacity: Int
    private var price: Int
    private var name: String
    private var manufactured: Date
    
    init(brand: String, capacity: Int, price: Int, name: String, manufactured: Date) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufactured = manufactured
    }
    
    convenience init(brand: String, capacity: Int, price: Int, name: String) {
        self.init(brand: brand, capacity: capacity, price: price, name: name, manufactured: Date())
    }
    
    public func isPurchaseableCoin(_ coin: Int) -> Bool {
        return self.price <= coin
    }
    
    public func tryPurchased(_ coin: Int, handle: @escaping (Int)-> ()) -> Bool {
        if self.price > coin {
            return false
        } else {
            handle(price)
            return true
        }
    }
    
    public func compareManufactured(during: TimeInterval, compareDate: Date) -> Bool {
        return manufactured + during >= compareDate
    }
}

extension Drink: Hashable {
    static func == (lhs: Drink, rhs: Drink) -> Bool {
        return lhs.name == rhs.name && lhs.price == rhs.price && lhs.manufactured == rhs.manufactured
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(price)
        hasher.combine(manufactured)
        hasher.combine(capacity)
    }
}

extension Drink: CustomStringConvertible {
    var description: String {
        let formattedDate = self.manufactured.toString(format: "yyyyMMdd")
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(formattedDate)"
    }
}
