import Foundation

class Coffee: Drink {
    private var caffeineContent: UInt
    
    init(brand: String, capacity: Int, price: Int, name: String, caffeineContent: UInt, manufactured: Date, temperature: Double, calorie: Double) {
        self.caffeineContent = caffeineContent
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufactured: manufactured, temperature: temperature, calorie: calorie)
    }
    
    convenience init(brand: String, capacity: Int, price: Int, name: String, temperature: Double, calorie: Double) {
        self.init(brand: brand, capacity: capacity, price: price, name: name, caffeineContent: 0, manufactured: Date(), temperature: temperature, calorie: calorie)
    }
    
    required init() {
        self.caffeineContent = 0
        super.init()
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        let encodableCaffeineContent = Int(self.caffeineContent)
        coder.encode(encodableCaffeineContent, forKey: "caffeineContent")
    }
    
    required init?(coder: NSCoder) {
        let decodedCaffeineContent = coder.decodeInteger(forKey: "caffeineContent")
        self.caffeineContent = UInt(decodedCaffeineContent)
        super.init(coder: coder)
    }
    
    public func isDecaffeinated(unit requiredStandard: UInt) -> Bool {
        return requiredStandard >= self.caffeineContent
    }
}

