import Foundation

class Fanta: Soda, Productization {
    enum Flavor: String {
        case orange
        case pineapple
    }
    
    private var flavor: Flavor
    
    init(flavor: Flavor, manufactured: Date) {
        self.flavor = flavor
        
        super.init(brand: "Coca-Cola",
                   capacity: 600,
                   price: 1330,
                   name: "Fanta",
                   isZeroCalorie: false,
                   manufactured: manufactured)
    }
    
    convenience init() {
        self.init(flavor: .orange, manufactured: Date())
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
