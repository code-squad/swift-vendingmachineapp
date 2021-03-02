import Foundation

class BlueBottleColdBrew: Coffee, Productization {
    enum Flavor: String {
        case bright = "Bright"
        case bold = "Bold"
    }
    
    private var flavor: Flavor
    
    
    init(flavor: Flavor, manufactured: Date) {
        self.flavor = flavor
        
        super.init(brand: "BlueBottle",
                   capacity: 240,
                   price: 1150,
                   name: "BlueBottle Cold Brew",
                   caffeineContent: 80,
                   manufactured: manufactured)
    }
    
    convenience init() {
        self.init(flavor: .bright, manufactured: Date())
    }
    
    func isPastManufactured(with date: Date) -> Bool {
        return compareManufactured(during: 180, compareDate: date)
    }
    
    func isHot() -> Bool {
        return false
    }
    
    func isLowCalorie() -> Bool {
        return true
    }
}

