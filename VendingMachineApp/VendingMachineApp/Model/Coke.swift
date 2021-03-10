import Foundation

class Coke: SoftDrink {
    private var flavor : String
    
    init(brand: String, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int, zeroCalories: Bool, flavor: String) {
        self.flavor = flavor
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparature: temparature, zeroCalories: zeroCalories)
    }
    
    convenience init() {
        self.init(brand: "코카콜라", volume: 200, price: 1300, productName: "코카콜라제로", manufacturedDay: Date(), sellByDate: Date(), calories: 0, temparature: 0, zeroCalories: true, flavor: "original")
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
