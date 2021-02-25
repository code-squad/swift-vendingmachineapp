
import Foundation

class Beverage : CustomStringConvertible {
    private var brand: String
    private var size: Int
    private var price: Int
    private var name: String
    private var manufactureDate: Date
    private var customedDate: String {
        let dateForMatter = DateFormatter()
        dateForMatter.dateFormat = "yyyyMMdd"
        return dateForMatter.string(from: self.manufactureDate)
    }
    
    var description: String {
        return "\(brand), \(size)ml, \(price)원, \(name), \(customedDate)"
    }
    
    init(_ brand: String, _ size: Int, _ price: Int, _ name: String, _ manufactureDate: Date) {
        self.brand = brand
        self.size = size
        self.price = price
        self.name = name
        self.manufactureDate = manufactureDate
    }
}
