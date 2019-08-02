import UIKit

typealias Coin = Int

class Beverage {
    
    //MARK: 프로퍼티
    
    var brand: String
    var packageSize: Int
    var beverageTemperature: Int
    var expirationPeriod: TimeInterval
    
    var name: String
    var price: Coin
    var photo: UIImage?
    
    var manufactureDates = [Date]()
    
    var count: Int {
        return manufactureDates.count
    }
    
    var isHot: Bool {
        return beverageTemperature > 50
    }
    
    //MARK: 초기화
    
    internal init(brand: String, packageSize: Int, price: Coin, name: String, expirationPeriod: TimeInterval, beverageTemperature: Int, photo: UIImage?) {
        self.brand = brand
        self.packageSize = packageSize
        self.price = price
        self.name = name
        self.expirationPeriod = expirationPeriod
        self.beverageTemperature = beverageTemperature
        self.photo = photo
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
