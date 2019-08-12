import Foundation

typealias Coin = Int

class Beverage {
    
    //MARK: 프로퍼티
    
    var name: String
    var price: Coin
    
    var brand: String
    var packageSize: Int
    var beverageTemperature: Int
    var expirationPeriod: TimeInterval
    
    var manufactureDates = [Date]()
    
    //MARK: 초기화
    
    init(name: String, price: Coin, brand: String, packageSize: Int, beverageTemperature: Int, expirationPeriod: TimeInterval) {
        self.name = name
        self.price = price
        self.brand = brand
        self.packageSize = packageSize
        self.beverageTemperature = beverageTemperature
        self.expirationPeriod = expirationPeriod
    }
    
    //MARK: 연산 프로퍼티
    
    var count: Int {
        return manufactureDates.count
    }
    
    var isHot: Bool {
        return beverageTemperature > 50
    }
    
    var expiredBeverages: [Date] {
        return manufactureDates.filter { $0.isExpired(period: expirationPeriod) }
    }
    
    //MARK: 메소드
    
    func addBeverage(manufactureDate: Date = Date()) {
        manufactureDates.append(manufactureDate)
    }
    
    func removeBeverage() throws -> Date {
        guard count > 0 else {
            throw VendingMachineError.outOfStock
        }
        return manufactureDates.removeFirst()
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        return "\(type(of: self)) - \(brand), \(packageSize)ml, \(price)원, \(name), \(manufactureDates)"
    }
}
