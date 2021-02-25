import Foundation

class Coke: SoftDrink {
    private var flavor : Flavor
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, lowCalories: Bool, isHot: Bool, zeroCalories: Bool, flavor: Flavor) {
        self.flavor = flavor
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, lowCalories: lowCalories, isHot: isHot, zeroCalories: zeroCalories)
    }
    
    enum Flavor {
        case Lime
        case Cherry
        case Original
    }
}
