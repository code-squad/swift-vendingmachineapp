
import Foundation

class BananaMilk : Milk {
    
    override init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, validWithin days: Int) {
        super.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt, validWithin: days)
    }
    
}
