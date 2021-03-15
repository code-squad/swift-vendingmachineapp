
import Foundation

class Milk : Beverage, Drinkable {
    private var expiredAt: Date
    
    init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, validWithin days: Int) {
        self.expiredAt = manufactureAt.adding(days: days)
        super.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(self.expiredAt, forKey: "expiredAt")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        self.expiredAt = coder.decodeObject(forKey: "expiredAt") as! Date
        super.init(coder: coder)
    }
    
    func isDrinkable(on date: Date) -> Bool {
        return expiredAt > date ? true : false
    }
    
}

