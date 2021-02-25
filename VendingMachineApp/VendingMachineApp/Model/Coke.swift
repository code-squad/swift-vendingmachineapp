import Foundation

class Coke: SoftDrink {
    private var flavor : Flavor
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, zeroCalories: Bool, flavor: Flavor) {
        self.flavor = flavor
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, zeroCalories: zeroCalories)
    }
    enum Flavor {
        case Lime
        case Cherry
        case Original
    }
}
