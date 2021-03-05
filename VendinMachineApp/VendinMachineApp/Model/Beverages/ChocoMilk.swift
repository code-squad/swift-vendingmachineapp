
import Foundation

class ChocoMilk : Milk, Country {
    private var country: Country
    override var description: String {
        return "\(super.description), 원산지: \(country)"
    }
    
    init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, validWithin days: Int, madeIn: Country) {
        self.country = madeIn
        super.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt, validWithin: days)
    }
    
    convenience init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, madeIn: Country) {
        self.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt, validWithin: 7, madeIn: madeIn)
    }
    
    func madeIn() -> Country {
        return self.country
    }
}
