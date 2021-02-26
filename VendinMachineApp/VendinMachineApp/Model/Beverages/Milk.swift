
import Foundation

class Milk : Beverage {
    
    override init(brand: String, size: Int, price: Int, name: String, manufactureDate: Date) {
        super.init(brand: brand, size: size, price: price, name: name, manufactureDate: manufactureDate)
    }
}
