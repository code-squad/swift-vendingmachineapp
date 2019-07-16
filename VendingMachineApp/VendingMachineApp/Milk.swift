import Foundation

class Milk: Beverage {
    private(set) var milkFactoryIdentifier: String
    
    init(brand: String, packageSize: Int, price: Int, name: String, milkFactoryIdentifier: String, dateOfManufacture: Date) {
        self.milkFactoryIdentifier = milkFactoryIdentifier
        super.init(brand: brand, packageSize: packageSize, price: price, name: name, dateOfManufacture: dateOfManufacture, expirationPeriod: Date.timeInterval(fromDays: 14), beverageTemperature: 10)
    }
}

class StrawberryMilk: Milk {
    init(milkFactoryIdentifier: String, dateOfManufacture: Date) {
        super.init(brand: "매일유업", packageSize: 200, price: 500, name: "딸기 우유", milkFactoryIdentifier: milkFactoryIdentifier, dateOfManufacture: dateOfManufacture)
    }
}

class ChocolateMilk: Milk {
    init(milkFactoryIdentifier: String, dateOfManufacture: Date) {
        super.init(brand: "남양", packageSize: 180, price: 600, name: "초코 우유", milkFactoryIdentifier: milkFactoryIdentifier, dateOfManufacture: dateOfManufacture)
    }
}
