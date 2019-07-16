import Foundation

class SoftDrink: Beverage {
    private var calorie: Int
    
    init(brand: String, packageSize: Int, price: Int, name: String, calorie: Int, dateOfManufacture: Date) {
        self.calorie = calorie
        super.init(brand: brand, packageSize: packageSize, price: price, name: name, dateOfManufacture: dateOfManufacture, expirationPeriod: Date.timeInterval(fromDays: 365), beverageTemperature: 10)
    }
    
    var isLowCalorie: Bool {
        return calorie < 80
    }
}

class Cola: SoftDrink {
    init(dateOfManufacture: Date) {
        super.init(brand: "코카콜라", packageSize: 355, price: 2000, name: "코카콜라", calorie: 152, dateOfManufacture: dateOfManufacture)
    }
}

class LemonlimeDrink: SoftDrink {
    init(dateOfManufacture: Date) {
        super.init(brand: "롯데", packageSize: 350, price: 1600, name: "칠성사이다", calorie: 155, dateOfManufacture: dateOfManufacture)
    }
}
