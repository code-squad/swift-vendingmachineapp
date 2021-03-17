import Foundation

class BlueBottleColdBrew: Coffee, Productization {
    enum Flavor: String {
        case bright = "Bright"
        case bold = "Bold"
    }
    
    private var flavor: Flavor
    
    init(brand: String, capacity: Int, price: Int, name: String, caffeineContent: UInt, flavor: Flavor, manufactured: Date, temperature: Double, calorie: Double) {
        self.flavor = flavor
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   caffeineContent: caffeineContent,
                   manufactured: manufactured,
                   temperature: temperature,
                   calorie: calorie)
    }
    
    init(flavor: Flavor, manufactured: Date) {
        self.flavor = flavor
        super.init(brand: "BlueBottle",
                   capacity: 240,
                   price: 1150,
                   name: "BlueBottle Cold Brew(\(self.flavor.rawValue))",
                   caffeineContent: 80,
                   manufactured: Date(),
                   temperature: 8,
                   calorie: 0)
    }
    
    required convenience init() {
        self.init(brand: "BlueBottle",
                   capacity: 240,
                   price: 1150,
                   name: "BlueBottle Cold Brew(Bold)",
                   caffeineContent: 80,
                   flavor: .bright,
                   manufactured: Date(),
                   temperature: 8,
                   calorie: 0)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(self.flavor.rawValue, forKey: "blueBottleFlavor")
    }
    
    required init?(coder: NSCoder) {
        self.flavor = Flavor(rawValue: coder.decodeObject(forKey: "blueBottleFlavor") as? String ?? "") ?? .bold
        super.init(coder: coder)
    }
    
    func validManufactured(with date: Date) -> Bool {
        return isDrinkableFromManufactured(pastDate: 180, compareDate: date)
    }
}

