import Foundation

class Beverage {
    
    private var brand: String
    private var packageSize: Int
    private(set) var price: Coin
    private(set) var name: String
    private var dateOfManufacture: Date
    private var expirationPeriod: TimeInterval
    private(set) var beverageTemperature: Int
    
    init(brand: String, packageSize: Int, price: Int, name: String, dateOfManufacture: Date, expirationPeriod: TimeInterval, beverageTemperature: Int) {
        self.brand = brand
        self.packageSize = packageSize
        self.price = price
        self.name = name
        self.dateOfManufacture = dateOfManufacture
        self.expirationPeriod = expirationPeriod
        self.beverageTemperature = beverageTemperature
    }
    
    var expirationDate: Date {
        return dateOfManufacture + expirationPeriod
    }
    
    func isExpired(targetDate: Date) -> Bool {
        return expirationDate < targetDate
    }
    
    var isHot: Bool {
        return beverageTemperature > 50
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        return "\(type(of: self)) - \(brand), \(packageSize)ml, \(price)원, \(name), \(dateOfManufacture)"
    }
}

typealias Beverages = [Beverage]

extension Beverages {
    
    var price: Coin? {
        return self.first?.price
    }
    
    var beverageTemperature: Int? {
        return self.first?.beverageTemperature
    }
    
    var isHot: Bool? {
        guard let temperature = beverageTemperature else {
            return nil
        }
        return temperature > 50
    }
}
