import UIKit

class Milk: Beverage {
    private(set) var milkFactoryIdentifier: String
    
    private enum CodingKeys: CodingKey {
        case milkFactoryIdentifier
    }
    
    init(name: String, price: Coin, brand: String, packageSize: Int, milkFactoryIdentifier: String) {
        self.milkFactoryIdentifier = milkFactoryIdentifier
        super.init(name: name, price: price, brand: brand, packageSize: packageSize, beverageTemperature: 10, expirationPeriod: Date.timeInterval(fromDays: 14))
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        milkFactoryIdentifier = try container.decode(String.self, forKey: .milkFactoryIdentifier)
        try super.init(from: decoder)
    }
}
