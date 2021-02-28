import Foundation

class BlueBottleColdBrew: Coffee, Productization {
    enum Flavor: String {
        case bright = "Bright"
        case bold = "Bold"
    }
    
    private(set) var flavor: Flavor
    
    
    init(flavor: Flavor = .bold, manufactured: Date = Date()) {
        self.flavor = flavor
        
        super.init(brand: "BlueBottle",
                   capacity: 240,
                   price: 1150,
                   name: "BlueBottle Cold Brew",
                   isDecaffeinated: false,
                   manufactured: manufactured)
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

