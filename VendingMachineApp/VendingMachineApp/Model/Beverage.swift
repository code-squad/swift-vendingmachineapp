import Foundation

class Beverage {
    
    private var brand: Brand.Brand
    private var volume: Int
    private var price: Int
    private var productName: String
    private var manufactureDate: Date
    
    init(brand:Brand.Brand, volume: Int, price: Int, productName: String, manufactureDate: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.productName = productName
        self.manufactureDate = manufactureDate
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return "\(brand), \(volume)ml, \(price)원, \(productName), \(dateFormatter.string(from: manufactureDate))"
    }
}


