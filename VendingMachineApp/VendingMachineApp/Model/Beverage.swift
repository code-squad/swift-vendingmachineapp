import Foundation

class Beverage {
    
    private var brand: Brand.Name
    private var volume: Int
    private var price: Int
    private var productName: String
    private var manufacturedDay: Date
    
    init(brand:Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.productName = productName
        self.manufacturedDay = manufacturedDay
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return "\(brand), \(volume)ml, \(price)원, \(productName), \(dateFormatter.string(from: manufacturedDay))"
    }
}


