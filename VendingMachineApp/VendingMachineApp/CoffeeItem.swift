import UIKit

class CoffeeItem: BeverageItem {
    
    var caffeine: Int
    
    init(name: String, price: Coin, brand: String, packageSize: Int, caffeine: Int) {
        self.caffeine = caffeine
        super.init(name: name, price: price, brand: brand, packageSize: packageSize)
    }
}
