import UIKit

class MilkItem: BeverageItem {
    private(set) var milkFactoryIdentifier: String
    
    init(name: String, price: Coin, brand: String, packageSize: Int, milkFactoryIdentifier: String) {
        self.milkFactoryIdentifier = milkFactoryIdentifier
        super.init(name: name, price: price, brand: brand, packageSize: packageSize)
    }
    
    struct PropertyKey {
        static let milkFactoryIdentifier = "milkFactoryIdentifier"
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(milkFactoryIdentifier, forKey: PropertyKey.milkFactoryIdentifier)
    }
    
    required init?(coder: NSCoder) {
        guard let milkFactoryIdentifier = coder.decodeObject(forKey: PropertyKey.milkFactoryIdentifier) as? String else {
            return nil
        }
        self.milkFactoryIdentifier = milkFactoryIdentifier
        super.init(coder: coder)
    }
}
