import Foundation

class BingBananaMilk: Milk {
    enum Target {
        case all
        case forKids
    }
    
    private var target: Target
    
    init(brand: String, capacity: Int, price: Int, name: String, isLowFatMilk: Bool, target: Target, manufacture: Date = Date()) {
        self.target = target
        super.init(brand: brand, capacity: capacity, price: price, name: name, isLowFatMilk: isLowFatMilk, manufacture: manufacture)
    }
}
