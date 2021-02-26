import Foundation

class Coffee: Beverage {
    enum CoffeeBrand: String {
        case top
        case cantata
        case georgia
    }

    private var coffeeBrand: CoffeeBrand
    
    init(brand: String, capacity: Int, price: Int, name: String, coffeeBrand: CoffeeBrand, manufacture: Date = Date()) {
        self.coffeeBrand = coffeeBrand
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture)
    }
}
