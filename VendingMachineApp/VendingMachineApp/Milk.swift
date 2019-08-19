import UIKit

class MilkItem: BeverageItem {
    private(set) var milkFactoryIdentifier: String
    
    init(name: String, price: Coin, brand: String, packageSize: Int, milkFactoryIdentifier: String) {
        self.milkFactoryIdentifier = milkFactoryIdentifier
        super.init(name: name, price: price, brand: brand, packageSize: packageSize)
    }
}
