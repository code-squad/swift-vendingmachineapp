import Foundation

class Drink {
    private var brand: String
    private var capacity: Int
    private var price: Int
    private var name: String
    private var manufactured: Date
    private var temperature: Double
    private var calorie: Double
    
    
    init(brand: String, capacity: Int, price: Int, name: String, manufactured: Date, temperature: Double, calorie: Double) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufactured = manufactured
        self.temperature = temperature
        self.calorie = calorie
    }
    
    convenience init(brand: String, capacity: Int, price: Int, name: String, temperature: Double, calorie: Double) {
        self.init(brand: brand, capacity: capacity, price: price, name: name, manufactured: Date(), temperature: temperature, calorie: calorie)
    }
    
    public func isPurchaseable(coin: Int) -> Bool {
        return self.price <= coin
    }
    
    public func tryPurchased(coin: Int, handle: @escaping (Int)-> ()) -> Bool {
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
    
    public func perCapacity(of unit: Double) -> Double {
        return (unit / Double(capacity)) * 100
    }
    
    public func isHot() -> Bool {
        return temperature >= 65
    }
    
    public func isLowCalorie() -> Bool {
        return (capacity / 100) * 20 < self.capacity
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
