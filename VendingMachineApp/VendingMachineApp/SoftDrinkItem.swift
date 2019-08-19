import UIKit

class SoftDrinkItem: BeverageItem {
    var calorie: Int
    
    init(name: String, price: Coin, brand: String, packageSize: Int, calorie: Int, defaultBeverage: Beverage) {
        self.calorie = calorie
        super.init(name: name, price: price, brand: brand, packageSize: packageSize, defaultBeverage: defaultBeverage)
    }
    
    var isLowCalorie: Bool {
        return calorie < 80
    }
    
    struct PropertyKey {
        static let calorie = "calorie"
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(calorie, forKey: PropertyKey.calorie)
    }
    
    required init?(coder: NSCoder) {
        let calorie = coder.decodeInteger(forKey: PropertyKey.calorie)
        self.calorie = calorie
        super.init(coder: coder)
    }
}
