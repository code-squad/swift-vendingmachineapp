import Foundation

typealias Coin = Int

class BeverageItem: NSObject, NSCoding {
    
    //MARK: 프로퍼티
    
    var name: String
    var price: Coin
    
    var brand: String
    var packageSize: Int
    
    private var beverages = [Beverage]()
    
    //MARK: 초기화
    
    init(name: String, price: Coin, brand: String, packageSize: Int) {
        self.name = name
        self.price = price
        self.brand = brand
        self.packageSize = packageSize
    }
    
    struct PropertyKey {
        static let name = "name"
        static let price = "price"
        static let brand = "brand"
        static let packageSize = "packageSize"
        static let beverages = "beverages"
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: PropertyKey.name)
        coder.encode(price, forKey: PropertyKey.price)
        coder.encode(brand, forKey: PropertyKey.brand)
        coder.encode(packageSize, forKey: PropertyKey.packageSize)
        coder.encode(beverages, forKey: PropertyKey.beverages)
    }
    
    required convenience init?(coder: NSCoder) {
        guard let name = coder.decodeObject(forKey: PropertyKey.name) as? String else {
            return nil
        }
        let price = coder.decodeInteger(forKey: PropertyKey.price)
        guard let brand = coder.decodeObject(forKey: PropertyKey.brand) as? String else {
            return nil
        }
        let packageSize = coder.decodeInteger(forKey: PropertyKey.packageSize)
        guard let beverages = coder.decodeObject(forKey: PropertyKey.packageSize) as? [Beverage] else {
            return nil
        }
        self.init(name: name, price: price, brand: brand, packageSize: packageSize)
        self.beverages = beverages
    }
    
    
    //MARK: 연산 프로퍼티
    
    var count: Int {
        return beverages.count
    }
    
    var expiredBeverages: [Beverage] {
        return beverages.filter { $0.isExpired() }
    }
    
    var hotBeverages: [Beverage] {
        return beverages.filter { $0.isHot }
    }
    
    //MARK: 메소드
    
    func addBeverage(_ beverage: Beverage) {
        beverages.append(beverage)
    }
    
    func removeBeverage() throws -> Beverage {
        guard count > 0 else {
            throw VendingMachineError.outOfStock
        }
        return beverages.removeFirst()
    }
}
