
import Foundation

class Milk : Beverage {
    
    override init(_ brand: String, _ size: Int, _ price: Int, _ name: String, _ manufactureDate: Date) {
        super.init(brand, size, price, name, manufactureDate)
    }
}

class BananaMilk : Milk {
    
    override init(_ brand: String, _ size: Int, _ price: Int, _ name: String, _ manufactureDate: Date) {
        super.init(brand, size, price, name, manufactureDate)
    }}
