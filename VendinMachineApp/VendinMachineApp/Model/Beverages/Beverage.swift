
import Foundation

class Beverage : NSObject, NSCoding {
    
    private var brand: String
    private var size: Int
    private(set) var price: Int
    private(set) var name: String
    private var manufacturedAt: Date
    
    override var description: String {
        return "\(brand), \(size)ml, \(price)원, \(name), \(manufacturedAt.toString(with: Date.manufacturedFormat()))"
    }
    
    init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date) {
        self.brand = brand
        self.size = size
        self.price = price
        self.name = name
        self.manufacturedAt = manufactureAt
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.brand, forKey: "brand")
        coder.encode(self.size, forKey: "size")
        coder.encode(self.price, forKey: "price")
        coder.encode(self.name, forKey: "name")
        coder.encode(self.manufacturedAt, forKey: "manufacturedAt")
    }
    
    required init?(coder: NSCoder) {
        self.brand = coder.decodeObject(forKey: "brand") as! String
        self.size = coder.decodeInteger(forKey: "size")
        self.price = coder.decodeInteger(forKey: "price")
        self.name = coder.decodeObject(forKey: "name") as! String
        self.manufacturedAt = coder.decodeObject(forKey: "manufacturedAt") as! Date
    }
    
    class func makeBeverage() -> Beverage {
        return Beverage(brand: "unknown", size: 0, price: 0, name: "unknown", manufactureAt: Date())
    }
    
    func isPriced(under price: Int) -> Bool {
        return self.price <= price ? true : false
    }
}

extension Beverage {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.brand == rhs.brand && lhs.size == rhs.size &&
            lhs.price == rhs.price && lhs.name == rhs.name
    }
    
    override var hash: Int {
        var hasher = Hasher()
        hasher.combine(self.brand)
        hasher.combine(self.size)
        hasher.combine(self.price)
        hasher.combine(self.name)
        return hasher.finalize()
    }
}
