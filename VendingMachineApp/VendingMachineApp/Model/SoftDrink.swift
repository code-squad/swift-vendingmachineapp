import Foundation

class SoftDrink: Beverage {
    
    private var zeroCalories: Bool
    
    init(brand: String, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int, zeroCalories: Bool) {
        self.zeroCalories = zeroCalories
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparature: temparature)
    }
    
    required init?(coder: NSCoder) {
        zeroCalories = coder.decodeBool(forKey: "zeroCalories")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(zeroCalories, forKey: "zeroCalories")
        super.encode(with: coder)
    }
    
    func discriminateZeroCalories() -> String {
        if zeroCalories { return "YES" }
        else { return "NO" }
    }
}
