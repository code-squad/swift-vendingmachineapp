import Foundation

class Soda: Beverage {
    enum SodaType: String {
        case coke
        case cider
        case fanta
    }
    
    private var sodaType: SodaType
    
    init(brand: String, capacity: Int, price: Int, name: String, sodaType: SodaType, manufacture: Date = Date()) {
        self.sodaType = sodaType
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture)
    }
}
