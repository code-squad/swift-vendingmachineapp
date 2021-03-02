import Foundation

class Coke: SoftDrink {
    private var flavor : Flavor
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparatureOfBeverage: Int, zeroCalories: Bool, flavor: Flavor) {
        self.flavor = flavor
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparatureOfBeverage: temparatureOfBeverage, zeroCalories: zeroCalories)
    }
    
    enum Flavor {
        case Lime
        case Cherry
        case Original
    }
}
