import UIKit

class Coffee: Beverage {
    
    init(name: String, price: Coin, photo: UIImage?, brand: String, packageSize: Int, beverageTemperature: Int) {
        
        super.init(name: name, price: price, photo: photo, brand: brand, packageSize: packageSize, beverageTemperature: beverageTemperature, expirationPeriod: Date.timeInterval(fromDays: 90))
        
    }
}

class TOPCoffee: Coffee {
    init() {
        super.init(name: "TOP", price: 1000, photo: #imageLiteral(resourceName: "TOP"), brand: "맥심", packageSize: 275, beverageTemperature: 10)
}

class CantataCoffee: Coffee {
    init() {
        super.init(name: "칸타타", price: 1500, photo: #imageLiteral(resourceName: "Cantata"), brand: "롯데", packageSize: 500, beverageTemperature: 80)
}
