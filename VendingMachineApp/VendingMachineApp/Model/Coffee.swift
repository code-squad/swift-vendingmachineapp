import Foundation

enum CoffeeBrand: String {
    case top
    case cantata
    case georgia
}

class Coffee: Beverage {
    private var coffeeBrand: CoffeeBrand
    
    init(brand: String, capacity: Int, price: Int, name: String, coffeeBrand: CoffeeBrand, date: Date = Date()) {
        self.coffeeBrand = coffeeBrand
        super.init(brand: brand, capacity: capacity, price: price, name: name, date: date)
    }
}
