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
