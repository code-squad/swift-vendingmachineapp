import UIKit

typealias Coin = Int

class Beverage {
    
    //MARK: 프로퍼티
    
    var name: String
    var price: Coin
    var photo: UIImage?
    
    var brand: String
    var packageSize: Int
    var beverageTemperature: Int
    var expirationPeriod: TimeInterval
    
    var manufactureDates = [Date]()
    
    var count: Int {
        return manufactureDates.count
    }
    
    var isHot: Bool {
        return beverageTemperature > 50
    }
    
    //MARK: 초기화
    
    init(name: String, price: Coin, photo: UIImage?, brand: String, packageSize: Int, beverageTemperature: Int, expirationPeriod: TimeInterval) {
        self.name = name
        self.price = price
        self.photo = photo
        self.brand = brand
        self.packageSize = packageSize
        self.beverageTemperature = beverageTemperature
        self.expirationPeriod = expirationPeriod
    }
    
    //MARK: 메소드
    
    func expirationDate(of index: Int) -> Date {
        return manufactureDates[index] + expirationPeriod
    }
    
    func isExpired(index: Int, targetDate: Date) -> Bool {
        return expirationDate(of: index) < targetDate
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        return "\(type(of: self)) - \(brand), \(packageSize)ml, \(price)원, \(name), \(manufactureDates)"
    }
}
