import Foundation

class Fanta: Soda, Productization {
    enum Flavor: String {
        case orange = "Orange"
        case pineapple = "Pineapple"
    }
    
    private var flavor: Flavor
    
    init(brand: String, capacity: Int, price: Int, name: String, isZeroCalorie: Bool, flavor: Flavor, manufactured: Date, temperature: Double, calorie: Double) {
        self.flavor = flavor
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   isZeroCalorie: isZeroCalorie,
                   manufactured: manufactured,
                   temperature: temperature,
                   calorie: calorie)
    }
    
    init(flavor: Flavor, manufactured: Date) {
        self.flavor = flavor
        
        super.init(brand: "Coca-Cola",
                   capacity: 600,
                   price: 1330,
                   name: "Fanta \(flavor.rawValue)",
                   isZeroCalorie: false,
                   manufactured: manufactured,
                   temperature: 8,
                   calorie: 310)
    }
    
    required convenience init() {
        self.init(brand: "Coca-Cola",
                  capacity: 600,
                  price: 1330,
                  name: "Fanta Orange",
                  isZeroCalorie: false,
                  flavor: .orange,
                  manufactured: Date(),
                  temperature: 8,
                  calorie: 310)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(self.flavor.rawValue, forKey: "fantaFlavor")
    }
    
    required init?(coder: NSCoder) {
        self.flavor = Flavor(rawValue: coder.decodeObject(forKey: "fantaFlavor") as? String ?? "") ?? .orange
        super.init(coder: coder)
    }
    
    func validManufactured(with date: Date) -> Bool {
        return isDrinkableFromManufactured(pastDate: 180, compareDate: date)
    }
}
