import UIKit

class CoffeeItem: BeverageItem {
    
    var caffeine: Int
    
    init(name: String, price: Coin, brand: String, packageSize: Int, caffeine: Int, defaultBeverage: Beverage) {
        self.caffeine = caffeine
        super.init(name: name, price: price, brand: brand, packageSize: packageSize, defaultBeverage: defaultBeverage)
    }
    
    //MARK: NSCoding
    
    struct PropertyKey {
        static let caffeine = "caffeine"
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(caffeine, forKey: PropertyKey.caffeine)
    }
    
    required init?(coder: NSCoder) {
        let caffeine = coder.decodeInteger(forKey: PropertyKey.caffeine)
        self.caffeine = caffeine
        super.init(coder: coder)
    }
}
