import Foundation

class BlueBottle: Coffee {
    enum Flavor {
        case bright
        case bold
    }
    
    private var flavor: Flavor
    
    init(brand: String, capacity: Int, price: Int, name: String, isDecaffeinated: Bool, flavor: Flavor, manufacture: Date = Date()) {
        self.flavor = flavor
        super.init(brand: brand, capacity: capacity, price: price, name: name, isDecaffeinated: isDecaffeinated, manufacture: manufacture)
    }
}

