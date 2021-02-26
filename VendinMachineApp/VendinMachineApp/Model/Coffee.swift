
import Foundation

class Coffee : Beverage {
    
    override init(brand: String, size: Int, price: Int, name: String, manufactureDate: Date) {
        super.init(brand: brand, size: size, price: price, name: name, manufactureDate: manufactureDate)
    }
}


class TOP : Coffee {
    
    override init(brand: String, size: Int, price: Int, name: String, manufactureDate: Date) {
        super.init(brand: brand, size: size, price: price, name: name, manufactureDate: manufactureDate)
    }
}
