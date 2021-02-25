
import Foundation

class Soda : Beverage {
    
    override init(_ brand: String, _ size: Int, _ price: Int, _ name: String, _ manufactureDate: Date) {
        super.init(brand, size, price, name, manufactureDate)
    }
}


class Coke : Soda {
    
    override init(_ brand: String, _ size: Int, _ price: Int, _ name: String, _ manufactureDate: Date) {
        super.init(brand, size, price, name, manufactureDate)
    }
}
