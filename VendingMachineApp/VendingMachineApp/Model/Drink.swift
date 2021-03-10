import Foundation

class Drink: NSObject, NSCoding {

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
    
    func encode(with coder: NSCoder) {
        coder.encode(self.brand, forKey: "brand")
        coder.encode(self.capacity, forKey: "capacity")
        coder.encode(self.price, forKey: "price")
        coder.encode(self.name, forKey: "name")
        coder.encode(self.manufactured, forKey: "manufactured")
        coder.encode(self.temperature, forKey: "temperature")
        coder.encode(self.calorie, forKey: "calorie")
    }
    
    required init?(coder: NSCoder) {
        self.brand = coder.decodeObject(forKey: "brand") as? String ?? ""
        self.capacity = coder.decodeInteger(forKey: "capacity")
        self.price = coder.decodeInteger(forKey: "price")
        self.name = coder.decodeObject(forKey: "name") as? String ?? ""
        self.manufactured = coder.decodeObject(forKey: "manufactured") as? Date ?? Date()
        self.temperature = coder.decodeDouble(forKey: "temperature")
        self.calorie = coder.decodeDouble(forKey: "calorie")
    }
    
    static func == (lhs: Drink, rhs: Drink) -> Bool {
        return lhs.name == rhs.name && lhs.price == rhs.price && lhs.manufactured == rhs.manufactured
    }
    
    public func isPurchaseable(coin: Int) -> Bool {
        return self.price <= coin
    }
    
    public func isDrinkableFromManufactured(pastDate: TimeInterval, compareDate: Date) -> Bool {
        return manufactured + pastDate < compareDate
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
    
    public func checkName(handle: (String) -> ()) {
        handle(self.name)
    }
}

extension Drink {
    override var description: String {
        let formattedDate = self.manufactured.toString(format: "yyyyMMdd")
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(formattedDate)"
    }
}
