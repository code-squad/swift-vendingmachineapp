
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
    
    class override func makeBeverage() -> Beverage {
        return ChocoMilk(brand: "푸르밀", size: 225, price: 1000, name: "가나쵸코우유", manufactureAt: Date(), madeIn: Ghana())
    }
    
    func madeIn() -> Country {
        return self.country
    }
}
