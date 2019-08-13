import UIKit

class Coffee: BeverageWithPhoto {
    
    var caffeine: Int
    
    private enum CodingKeys: CodingKey {
        case caffeine
    }
    
    init(name: String, price: Coin, photo: UIImage?, brand: String, packageSize: Int, beverageTemperature: Int, caffeine: Int) {
        self.caffeine = caffeine
        super.init(name: name, price: price, photo: photo, brand: brand, packageSize: packageSize, beverageTemperature: beverageTemperature, expirationPeriod: Date.timeInterval(fromDays: 90))
        
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        caffeine = try container.decode(Int.self, forKey: .caffeine)
        try super.init(from: container.superDecoder())
    }
}

class TOPCoffee: Coffee {
    init() {
        super.init(name: "TOP", price: 1000, photo: #imageLiteral(resourceName: "TOP"), brand: "맥심", packageSize: 275, beverageTemperature: 10, caffeine: 50)
    }
    
    required init(from decoder: Decoder) throws {
        super.init(name: "TOP", price: 1000, photo: #imageLiteral(resourceName: "TOP"), brand: "맥심", packageSize: 275, beverageTemperature: 10, caffeine: 50)
    }
}

class CantataCoffee: Coffee {
    init() {
        super.init(name: "칸타타", price: 1500, photo: #imageLiteral(resourceName: "Cantata"), brand: "롯데", packageSize: 500, beverageTemperature: 80, caffeine: 40)
    }
    
    required init(from decoder: Decoder) throws {
        super.init(name: "칸타타", price: 1500, photo: #imageLiteral(resourceName: "Cantata"), brand: "롯데", packageSize: 500, beverageTemperature: 80, caffeine: 40)
    }
}
