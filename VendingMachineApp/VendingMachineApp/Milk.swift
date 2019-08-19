import UIKit

class Milk: BeverageItem {
    private(set) var milkFactoryIdentifier: String
    
    private enum CodingKeys: CodingKey {
        case milkFactoryIdentifier
    }
    
    init(name: String, price: Coin, brand: String, packageSize: Int, milkFactoryIdentifier: String) {
        self.milkFactoryIdentifier = milkFactoryIdentifier
        super.init(name: name, price: price, brand: brand, packageSize: packageSize)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        milkFactoryIdentifier = try container.decode(String.self, forKey: .milkFactoryIdentifier)
        try super.init(from: decoder)
    }
}
