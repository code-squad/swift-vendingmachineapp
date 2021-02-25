import Foundation

class SoftDrink: Beverage {
    
    private var zeroCalories: Bool
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, zeroCalories: Bool) {
        self.zeroCalories = zeroCalories
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay)
    }
    
    func discriminateZeroCalories() -> String {
        if zeroCalories { return "YES" }
        else { return "NO" }
    }
}
