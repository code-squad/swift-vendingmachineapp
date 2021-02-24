import Foundation

class SoftDrink: Beverage {
    private var zeroCalories: Bool
    
    init(brand: Brand.Name, volume: Int, price: Int, name: String, manufacturedDay: Date, zeroCalories: Bool) {
        self.zeroCalories = zeroCalories
        super.init(brand: brand, volume: volume, price: price, productName: name, manufacturedDay: manufacturedDay)
    }
    
    func discriminateZeroCalories() -> String {
        if zeroCalories { return "YES" }
        else { return "NO" }
    }
}
