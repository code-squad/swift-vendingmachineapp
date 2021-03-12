//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

class Beverage: NSObject, Shopable, NSCoding {
    
    private let brand: String
    private let name: String
    private let price: Int
    private let size: Int
    private let manufacturedAt: Date
    
    init(brand: String, name: String, price: Int, size: Int, dateFactory: DateFactory, manufacturedInString: String) {
        self.brand = brand
        self.name = name
        self.price = price
        self.size = size
        self.manufacturedAt = dateFactory.create(from: manufacturedInString)
    }
    
    init(brand: String, name: String, price: Int, size: Int) {
        self.brand = brand
        self.name = name
        self.price = price
        self.size = size
        self.manufacturedAt = Date()
    }
    
    enum Keys {
        static let brand = "brand"
        static let name = "name"
        static let price = "price"
        static let size = "size"
        static let manufacturedAt = "manufacturedAt"
    }
    
    required init?(coder: NSCoder) {
        self.brand = coder.decodeObject(forKey: Keys.brand) as! String
        self.name = coder.decodeObject(forKey: Keys.name) as! String
        self.price = coder.decodeInteger(forKey: Keys.price)
        self.size = coder.decodeInteger(forKey: Keys.size)
        self.manufacturedAt = coder.decodeObject(forKey: Keys.manufacturedAt) as! Date
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(brand, forKey: Keys.brand)
        coder.encode(name, forKey: Keys.name)
        coder.encode(price, forKey: Keys.price)
        coder.encode(size, forKey: Keys.size)
        coder.encode(manufacturedAt, forKey: Keys.manufacturedAt)
    }
    
    func isPurchashable(with money: Int) -> Bool {
        return money >= price
    }
    
    func subtractPrice(from balance: Int) -> Int {
        return balance - price
    }
}

extension Beverage {

    override var description: String {
        return "[\(brand)] \(name): ₩\(price), \(size)ml (\(manufacturedAt.inFormat("yyMMdd")))"
    }

}
