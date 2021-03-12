//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation


class Milk: Beverage, Expirable, LactoFreeable {
    
    private let expiry: Date
    private let lactose: Float
    
    init(brand: String, name: String, price: Int, size: Int, dateFactory: DateFactory, manufacturedInString: String,
         expireAfter: Int, lactose: Float) {
        
        self.expiry = dateFactory.create(from: manufacturedInString).add(days: expireAfter)
        self.lactose = lactose
        
        super.init(brand: brand, name: name, price: price, size: size, dateFactory: dateFactory, manufacturedInString: manufacturedInString)
    }
    
    init(brand: String, name: String, price: Int, size: Int,
         expireAfter: Int, lactose: Float) {
        
        self.expiry = Date().add(days: expireAfter)
        self.lactose = lactose
        
        super.init(brand: brand, name: name, price: price, size: size)
    }
    
    required init() {
        self.expiry = Date().add(days: 7)
        self.lactose = 3.0
        super.init()
    }
    
    enum Keys {
        static let milkExpiry = "milkExpiry"
        static let milkLactose = "milkLactose"
    }
    
    required init?(coder: NSCoder) {
        self.expiry = coder.decodeObject(forKey: Keys.milkExpiry) as! Date
        self.lactose = coder.decodeFloat(forKey: Keys.milkLactose)
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(expiry, forKey: Keys.milkExpiry)
        coder.encode(lactose, forKey: Keys.milkLactose)
        super.encode(with: coder)
    }
    
    func isExpired(compareTo date: Date) -> Bool {
        return expiry < date
    }
    
    func isLactoFree(basedOn lactoStandard: Float) -> Bool {
        return lactose <= lactoStandard
    }
    
}


class Chocolate: Milk, Transportable {
    
    private let package: Package
    
    init(brand: String, name: String, price: Int, size: Int, dateFactory: DateFactory, manufacturedInString: String,
         expireAfter: Int, lactose: Float, package: Package) {
        
        self.package = package
        
        super.init(brand: brand, name: name, price: price, size: size, dateFactory: dateFactory, manufacturedInString: manufacturedInString, expireAfter: expireAfter, lactose: lactose)
    }
    
    init(brand: String, name: String, price: Int, size: Int,
         expireAfter: Int, lactose: Float, package: Package) {
        
        self.package = package
        
        super.init(brand: brand, name: name, price: price, size: size, expireAfter: expireAfter, lactose: lactose)
    }
    
    required convenience init() {
        self.init(brand: "푸르밀", name: "가나 초코우유", price: 1300, size: 225,
                  expireAfter: 10, lactose: 3.5, package: .bottle)
    }
    
    enum Keys {
        static let milkPackage = "milkPackage"
    }
    
    required init?(coder: NSCoder) {
        self.package = Package(rawValue: coder.decodeObject(forKey: Keys.milkPackage) as! String)!
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(package.rawValue, forKey: Keys.milkPackage)
        super.encode(with: coder)
    }
    
    func isTransportable() -> Bool {
        switch package {
        case .bottle:
            return true
        default:
            return false
        }
    }
}


class Plain: Milk, SugarFreeable {
    
    private let sugar: Float
    
    init(brand: String, name: String, price: Int, size: Int, dateFactory: DateFactory, manufacturedInString: String,
         expireAfter: Int, lactose: Float, sugar: Float) {
        
        self.sugar = sugar
        
        super.init(brand: brand, name: name, price: price, size: size, dateFactory: dateFactory, manufacturedInString: manufacturedInString, expireAfter: expireAfter, lactose: lactose)
    }
    
    init(brand: String, name: String, price: Int, size: Int,
         expireAfter: Int, lactose: Float, sugar: Float) {
        
        self.sugar = sugar
        
        super.init(brand: brand, name: name, price: price, size: size, expireAfter: expireAfter, lactose: lactose)
    }
    
    required convenience init() {
        self.init(brand: "매일", name: "소화가 잘되는 우유", price: 850, size: 190,
                  expireAfter: 7, lactose: 0.2, sugar: 0.2)
    }
    
    enum Keys {
        static let milkSugar = "milkSugar"
    }
    
    required init?(coder: NSCoder) {
        self.sugar = coder.decodeFloat(forKey: Keys.milkSugar)
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(sugar, forKey: Keys.milkSugar)
        super.encode(with: coder)
    }
    
    func isSugarFree(basedOn sugarStandard: Float) -> Bool {
        return sugar <= sugarStandard
    }
}
