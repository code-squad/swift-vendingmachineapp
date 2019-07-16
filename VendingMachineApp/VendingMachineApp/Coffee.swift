import Foundation

class Coffee: Beverage {
    
    init(brand: String, packageSize: Int, price: Int, name: String, beverageTemperature: Int, dateOfManufacture: Date) {
        super.init(brand: brand, packageSize: packageSize, price: price, name: name, dateOfManufacture: dateOfManufacture, expirationPeriod: Date.timeInterval(fromDays: 90), beverageTemperature: beverageTemperature)
    }
}

class TOPCoffee: Coffee {
    init(dateOfManufacture: Date) {
        super.init(brand: "맥심", packageSize: 275, price: 1000, name: "TOP", beverageTemperature: 10, dateOfManufacture: dateOfManufacture)
    }
}

class CantataCoffee: Coffee {
    init(dateOfManufacture: Date) {
        super.init(brand: "롯데", packageSize: 500, price: 1500, name: "칸타타", beverageTemperature: 80, dateOfManufacture: dateOfManufacture)
    }
}
