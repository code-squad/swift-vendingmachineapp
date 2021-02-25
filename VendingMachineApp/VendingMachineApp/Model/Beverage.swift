import Foundation

class Beverage {
    
    private var brand: Brand.Name
    private var volume: Int
    private var price: Int
    private var productName: String
    private var manufacturedDay: Date
    private var sellByDate: Date
    private var lowCalories: Bool
    private var isHot: Bool
    
    init(brand:Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, lowCalories: Bool, isHot: Bool) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.productName = productName
        self.manufacturedDay = manufacturedDay
        self.sellByDate = sellByDate
        self.lowCalories = lowCalories
        self.isHot = isHot
    }
    
    private func checkManufacturedDayOfProducts() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMDD"
        return dateFormatter.string(from: manufacturedDay)
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        return "\(brand), \(volume)ml, \(price)원, \(productName), \(checkManufacturedDayOfProducts())"
    }
}


