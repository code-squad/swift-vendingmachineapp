import UIKit

class Coffee: Beverage {
    
    var caffeine: Int
    
    private enum CodingKeys: CodingKey {
        case caffeine
    }
    
    init(name: String, price: Coin, brand: String, packageSize: Int, beverageTemperature: Int, caffeine: Int) {
        self.caffeine = caffeine
        super.init(name: name, price: price, brand: brand, packageSize: packageSize, beverageTemperature: beverageTemperature, expirationPeriod: Date.timeInterval(fromDays: 90))
        
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        caffeine = try container.decode(Int.self, forKey: .caffeine)
        try super.init(from: decoder)
    }
}
