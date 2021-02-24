import Foundation

enum MilkFlavor: String {
    case strawberry
    case chocolate
    case banana
}

class Milk: Beverage {
    private var milkFlavor: MilkFlavor
    
    init(brand: String, capacity: Int, price: Int, name: String, milkFlavor: MilkFlavor, date: Date = Date()) {
        self.milkFlavor = milkFlavor
        super.init(brand: brand, capacity: capacity, price: price, name: name, date: date)
    }
}
