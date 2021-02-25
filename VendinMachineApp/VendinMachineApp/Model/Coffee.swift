
import Foundation

class Coffee : Beverage {
    
    override init(_ brand: String, _ size: Int, _ price: Int, _ name: String, _ manufactureDate: Date) {
        super.init(brand, size, price, name, manufactureDate)
    }
}


class TOP : Coffee {
    
    override init(_ brand: String, _ size: Int, _ price: Int, _ name: String, _ manufactureDate: Date) {
        super.init(brand, size, price, name, manufactureDate)
    }
}
