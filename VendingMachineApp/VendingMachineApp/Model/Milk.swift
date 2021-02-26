import Foundation

class Milk: Beverage {
    enum MilkFlavor: String {
        case strawberry
        case chocolate
        case banana
    }
    
    private var milkFlavor: MilkFlavor
    
    init(brand: String, capacity: Int, price: Int, name: String, milkFlavor: MilkFlavor, manufacture: Date = Date()) {
        self.milkFlavor = milkFlavor
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture)
    }
}
