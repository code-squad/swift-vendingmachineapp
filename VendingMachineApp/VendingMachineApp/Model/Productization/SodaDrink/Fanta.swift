import Foundation

class Fanta: Soda, Productization {
    enum Flavor: String {
        case orange
        case pineapple
    }
    
    private var flavor: Flavor
    
    init(brand: String, capacity: Int, price: Int, name: String, isZeroCalorie: Bool, flavor: Flavor, manufactured: Date, temperature: Double, calorie: Double) {
        self.flavor = flavor
        super.init(brand: brand, capacity: capacity, price: price, name: name, isZeroCalorie: isZeroCalorie, manufactured: manufactured, temperature: temperature, calorie: calorie)
    }
    
    init(flavor: Flavor, manufactured: Date) {
        self.flavor = flavor
        
        super.init(brand: "Coca-Cola",
                   capacity: 600,
                   price: 1330,
                   name: "Fanta",
                   isZeroCalorie: false,
                   manufactured: manufactured,
                   temperature: 8,
                   calorie: 310)
    }
    
    convenience init() {
        self.init(brand: "Coca-Cola",
                  capacity: 600,
                  price: 1330,
                  name: "Fanta",
                  isZeroCalorie: false,
                  flavor: .orange,
                  manufactured: Date(),
                  temperature: 8,
                  calorie: 310)
    }
    
    func isPastManufactured(with date: Date) -> Bool {
        return compareManufactured(during: 180, compareDate: date)
    }
    
    func isHot() -> Bool {
        return false
    }
    
    func isLowCalorie() -> Bool {
        return false
    }
}
