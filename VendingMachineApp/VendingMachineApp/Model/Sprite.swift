import Foundation

class Sprite: SoftDrink {
    private var container: String
        
    init(brand: String, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int, zeroCalories: Bool, container: String) {
        self.container = container
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparature: temparature, zeroCalories: zeroCalories)
    }
    
    required init?(coder: NSCoder) {
        container = coder.decodeObject(forKey: "container") as! String
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(container, forKey: "container")
        super.encode(with: coder)
    }
}
