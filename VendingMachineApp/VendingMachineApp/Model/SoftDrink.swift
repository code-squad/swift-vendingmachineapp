import Foundation

class SoftDrink: Beverage {
    
    private var zeroCalories: Bool
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int, zeroCalories: Bool) {
        self.zeroCalories = zeroCalories
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparature: temparature)
    }
    
    func discriminateZeroCalories() -> String {
        if zeroCalories { return "YES" }
        else { return "NO" }
    }
}
