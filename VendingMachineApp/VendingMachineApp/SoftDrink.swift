import UIKit

class SoftDrink: BeverageWithPhoto {
    var calorie: Int
    
    init(name: String, price: Coin, photo: UIImage?, brand: String, packageSize: Int, calorie: Int) {
        self.calorie = calorie
        super.init(name: name, price: price, photo: photo, brand: brand, packageSize: packageSize, beverageTemperature: 10, expirationPeriod: Date.timeInterval(fromDays: 365))
    }
    
    var isLowCalorie: Bool {
        return calorie < 80
    }
}

class Cola: SoftDrink {
    init() {
        super.init(name: "코카콜라", price: 2000, photo: #imageLiteral(resourceName: "Cocacola"), brand: "코카콜라", packageSize: 355, calorie: 152)
    }
}

class LemonlimeDrink: SoftDrink {
    init() {
        super.init(name: "칠성사이다", price: 1600, photo: #imageLiteral(resourceName: "ChilsungCider"), brand: "롯데", packageSize: 350, calorie: 155)
    }
}
