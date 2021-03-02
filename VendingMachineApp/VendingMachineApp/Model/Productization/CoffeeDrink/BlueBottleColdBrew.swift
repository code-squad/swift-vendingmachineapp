import Foundation

class BlueBottleColdBrew: Coffee, Productization {
    enum Flavor: String {
        case bright = "Bright"
        case bold = "Bold"
    }
    
    private(set) var flavor: Flavor
    
    
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
    
    func validate(with date: Date) -> Bool {
        return manufactured + 180 >= date
    }
    
    func isHot() -> Bool {
        return false
    }
    
    func isLowCalorie() -> Bool {
        return true
    }
}

