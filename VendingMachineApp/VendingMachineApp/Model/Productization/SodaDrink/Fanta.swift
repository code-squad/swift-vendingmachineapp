import Foundation

class Fanta: Soda, Productization {
    enum Flavor: String {
        case orange
        case pineapple
    }
    
    private(set) var flavor: Flavor
    
    init(flavor: Flavor = .orange, manufactured: Date = Date()) {
        self.flavor = flavor
        
        super.init(brand: "Coca-Cola",
                   capacity: 600,
                   price: 1330,
                   name: "Fanta",
                   isZeroCalorie: false,
                   manufactured: manufactured)
    }
    
    func validate(with date: Date) -> Bool {
        return manufactured + 180 >= date
    }
    
    func isHot() -> Bool {
        return false
    }
    
    func isLowCalorie() -> Bool {
        return false
    }
}
