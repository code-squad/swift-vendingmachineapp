import Foundation

class Coke: SoftDrink {
    private var flavor : String
    
    init(brand: String, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int, zeroCalories: Bool, flavor: String) {
        self.flavor = flavor
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparature: temparature, zeroCalories: zeroCalories)
    }
    
    required init?(coder: NSCoder) {
        flavor = coder.decodeObject(forKey: "flavor") as! String
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(flavor, forKey: "flavor")
        super.encode(with: coder)
    }
}
