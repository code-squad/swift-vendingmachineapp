import Foundation

class BlueBottleColdBrew: Coffee, Productization {
    enum Flavor: String {
        case bright = "Bright"
        case bold = "Bold"
    }
    
    private(set) var flavor: Flavor
    
    
    init(flavor: Flavor, manufacture: Date = Date()) {
        self.flavor = flavor
        
        super.init(brand: "BlueBottle",
                   capacity: 240,
                   price: 1150,
                   name: "BlueBottle Cold Brew \(self.flavor.rawValue)",
                   isDecaffeinated: false,
                   manufacture: manufacture)
    }
    
    func validate(with date: Date) -> Bool {
        return manufacture - 180 < date
    }
    
    func isHot() -> Bool {
        return false
    }
    
    func isLowCalorie() -> Bool {
        return true
    }
}

