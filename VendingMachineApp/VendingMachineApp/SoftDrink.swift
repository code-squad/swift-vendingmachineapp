import UIKit

class SoftDrinkItem: BeverageItem {
    var calorie: Int
    
    init(name: String, price: Coin, brand: String, packageSize: Int, calorie: Int) {
        self.calorie = calorie
        super.init(name: name, price: price, brand: brand, packageSize: packageSize)
    }
    
    var isLowCalorie: Bool {
        return calorie < 80
    }
}
