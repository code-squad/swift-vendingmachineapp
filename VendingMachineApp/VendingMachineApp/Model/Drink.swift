import Foundation

class Drink: NSObject, NSCoding {
    private var brand: String
    private var capacity: Int
    private(set) var price: Int
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
    
    override required init() {
        self.brand = "anonymous"
        self.capacity = 0
        self.price = 0
        self.name = "anonymous"
        self.manufactured = Date(timeIntervalSinceNow: Date().timeIntervalSince1970)
        self.temperature = -1
        self.calorie = -1
        super.init()
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
    
    public override func isEqual(_ other: Any?) -> Bool {
      guard let other = other as? Drink else { return false }
        return self.name == other.name &&
            self.capacity == other.capacity &&
            self.price == other.price &&
            self.name == other.name &&
            self.manufactured == other.manufactured &&
            self.temperature == other.temperature &&
            self.calorie == other.calorie
    }

    public override var hash: Int {
        var hasher = Hasher()
        hasher.combine(self.brand)
        hasher.combine(self.capacity)
        hasher.combine(self.price)
        hasher.combine(self.name)
        hasher.combine(self.manufactured)
        hasher.combine(self.temperature)
        hasher.combine(self.calorie)
        return hasher.finalize()
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
