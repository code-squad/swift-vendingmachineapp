import Foundation

class StarbucksColdBrew: Coffee, Productization {
    enum Flavor: String {
        case black = "Black"
        case withMilk = "With Milk"
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
        
        super.init(brand: "StarBucks",
                   capacity: 240,
                   price: 1150,
                   name: "StarBucks Cold Brew(\(self.flavor.rawValue))",
                   caffeineContent: 80,
                   manufactured: manufactured,
                   temperature: 8,
                   calorie: 8)
    }
    
    required convenience init() {
        self.init(brand: "StarBucks",
                   capacity: 240,
                   price: 1150,
                   name: "StarBucks Cold Brew(Black)",
                   caffeineContent: 80,
                   flavor: .black,
                   manufactured: Date(),
                   temperature: 8,
                   calorie: 8)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(self.flavor.rawValue, forKey: "starBucksFlavor")
    }
    
    required init?(coder: NSCoder) {
        self.flavor = Flavor(rawValue: coder.decodeObject(forKey: "starBucksFlavor") as! String)!
        super.init(coder: coder)
    }
    
    func validManufactured(with date: Date) -> Bool {
        return isDrinkableFromManufactured(pastDate: 180, compareDate: date)
    }
}
