//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

class Coffee: Beverage, Hotable, Transportable {
    
    private let temperature: Float
    private let package: Package
    
    init(brand: String, name: String, price: Int, size: Int, dateFactory: DateFactory, manufacturedInString: String,
         temperature: Float, package: Package) {
        
        self.temperature = temperature
        self.package = package
        
        super.init(brand: brand, name: name, price: price, size: size, dateFactory: dateFactory, manufacturedInString: manufacturedInString)
    }
    
    init(brand: String, name: String, price: Int, size: Int,
         temperature: Float, package: Package) {
        
        self.temperature = temperature
        self.package = package
        
        super.init(brand: brand, name: name, price: price, size: size)
    }
    
    enum Keys {
        static let coffeeTemperature = "coffeeTemperature"
        static let coffeePackage = "coffeePackage"
    }
    
    required init?(coder: NSCoder) {
        self.temperature = coder.decodeFloat(forKey: Keys.coffeeTemperature)
        self.package = Package(rawValue: coder.decodeObject(forKey: Keys.coffeePackage) as! String)!
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(temperature, forKey: Keys.coffeeTemperature)
        coder.encode(package.rawValue, forKey: Keys.coffeePackage)
        super.encode(with: coder)
    }
    
    func isHot(basedOn temperature: Float) -> Bool {
        return self.temperature >= temperature
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


class Americano: Coffee, SugarFreeable {

    private let sugar: Float
    
    init(brand: String, name: String, price: Int, size: Int, dateFactory: DateFactory, manufacturedInString: String,
         temperature: Float, package: Package, sugar: Float) {
        
        self.sugar = sugar
        
        super.init(brand: brand, name: name, price: price, size: size, dateFactory: dateFactory, manufacturedInString: manufacturedInString,
                   temperature: temperature, package: package)
    }
    
    init(brand: String, name: String, price: Int, size: Int,
         temperature: Float, package: Package, sugar: Float) {
        
        self.sugar = sugar
        
        super.init(brand: brand, name: name, price: price, size: size,
                   temperature: temperature, package: package)
    }
    
    convenience init() {
        self.init(brand: "스타벅스", name: "블랙커피", price: 1800, size: 275,
                  temperature: 75.5, package: .bottle, sugar: 0.0)
    }
    
    enum Keys {
        static let americanoSuger = "americanoSugar"
    }
    
    required init?(coder: NSCoder) {
        self.sugar = coder.decodeFloat(forKey: Keys.americanoSuger)
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(sugar, forKey: Keys.americanoSuger)
        super.encode(with: coder)
    }

    func isSugarFree(basedOn sugarStandard: Float) -> Bool {
        return sugar <= sugarStandard
    }
}


class CafeLatte: Coffee, Expirable, LactoFreeable {
    
    private let expiry: Date
    private let lactose: Float
    
    init(brand: String, name: String, price: Int, size: Int, dateFactory: DateFactory, manufacturedInString: String,
         temperature: Float, package: Package, expireAfter: Int, lactose: Float) {
        
        self.expiry = dateFactory.create(from: manufacturedInString).add(days: expireAfter)
        self.lactose = lactose
        
        super.init(brand: brand, name: name, price: price, size: size, dateFactory: dateFactory, manufacturedInString: manufacturedInString,
                   temperature: temperature, package: package)
    }
    
    init(brand: String, name: String, price: Int, size: Int,
         temperature: Float, package: Package, expireAfter: Int, lactose: Float) {
        
        self.expiry = Date().add(days: expireAfter)
        self.lactose = lactose
        
        super.init(brand: brand, name: name, price: price, size: size,
                   temperature: temperature, package: package)
    }
    
    convenience init() {
        self.init(brand: "코카콜라", name: "조지아 카페라떼", price: 900, size: 240,
                  temperature: 8.5, package: .can, expireAfter: 10, lactose: 3.5)
    }
    
    enum Keys {
        static let latteExpiry = "latteExpiry"
        static let latteLactose = "latteLactose"
    }
    
    required init?(coder: NSCoder) {
        self.expiry = coder.decodeObject(forKey: Keys.latteExpiry) as! Date
        self.lactose = coder.decodeFloat(forKey: Keys.latteLactose)
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(expiry, forKey: Keys.latteExpiry)
        coder.encode(lactose, forKey: Keys.latteLactose)
        super.encode(with: coder)
    }
    
    func isExpired(compareTo date: Date) -> Bool {
        return expiry < date
    }
    
    func isLactoFree(basedOn lactoStandard: Float) -> Bool {
        return lactose <= lactoStandard
    }
}
