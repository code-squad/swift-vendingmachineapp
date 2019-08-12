import UIKit

class Milk: BeverageWithPhoto {
    private(set) var milkFactoryIdentifier: String
    
    init(name: String, price: Coin, photo: UIImage?, brand: String, packageSize: Int, milkFactoryIdentifier: String) {
        self.milkFactoryIdentifier = milkFactoryIdentifier
        super.init(name: name, price: price, photo: photo, brand: brand, packageSize: packageSize, beverageTemperature: 10, expirationPeriod: Date.timeInterval(fromDays: 14))
    }
}

class StrawberryMilk: Milk {
    init() {
        super.init(name: "딸기 우유", price: 500, photo: UIImage(named: "Strawberry"), brand: "매일유업", packageSize: 200, milkFactoryIdentifier: "매일우유목장")
    }
}

class ChocolateMilk: Milk {
    init() {
        super.init(name: "초코 우유", price: 600, photo: UIImage(named: "Chocolate"), brand: "남양", packageSize: 180, milkFactoryIdentifier: "남양우유목장")
    }
}
