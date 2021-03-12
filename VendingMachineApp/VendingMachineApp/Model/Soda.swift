//
//  Soda.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

class Soda: Beverage, Transportable {
    
    private let package: Package
    
    init(brand: String, name: String, price: Int, size: Int, dateFactory: DateFactory, manufacturedInString: String,
         package: Package) {
        
        self.package = package
        
        super.init(brand: brand, name: name, price: price, size: size, dateFactory: dateFactory, manufacturedInString: manufacturedInString)
    }
    
    init(brand: String, name: String, price: Int, size: Int,
         package: Package) {
        
        self.package = package
        
        super.init(brand: brand, name: name, price: price, size: size)
    }
    
    enum Keys {
        static let sodaPackage = "sodaPackage"
    }
    
    required init?(coder: NSCoder) {
        self.package = Package(rawValue: coder.decodeObject(forKey: Keys.sodaPackage) as! String)!
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(package.rawValue, forKey: Keys.sodaPackage)
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


class Coke: Soda, SugarFreeable {
    
    private let sugar: Float
    
    init(brand: String, name: String, price: Int, size: Int, dateFactory: DateFactory, manufacturedInString: String,
         package: Package, sugar: Float) {
        
        self.sugar = sugar
        
        super.init(brand: brand, name: name, price: price, size: size, dateFactory: dateFactory, manufacturedInString: manufacturedInString, package: package)
    }
    
    init(brand: String, name: String, price: Int, size: Int,
         package: Package, sugar: Float) {
        
        self.sugar = sugar
        
        super.init(brand: brand, name: name, price: price, size: size, package: package)
    }
    
    convenience init() {
        self.init(brand: "코카콜라", name: "코카콜라 제로", price: 2000, size: 500,
                  package: .bottle, sugar: 0.0)
    }
    
    enum Keys {
        static let cokeSugar = "cokeSugar"
    }
    
    required init?(coder: NSCoder) {
        self.sugar = coder.decodeFloat(forKey: Keys.cokeSugar)
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(sugar, forKey: Keys.cokeSugar)
        super.encode(with: coder)
    }

    func isSugarFree(basedOn sugarStandard: Float) -> Bool {
        return sugar <= sugarStandard
    }
}


class Milkis: Soda, LactoFreeable {
    
    private let lactose: Float
    
    init(brand: String, name: String, price: Int, size: Int, dateFactory: DateFactory, manufacturedInString: String,
         package: Package, lactose: Float) {
        
        self.lactose = lactose
        
        super.init(brand: brand, name: name, price: price, size: size, dateFactory: dateFactory, manufacturedInString: manufacturedInString, package: package)
    }
    
    init(brand: String, name: String, price: Int, size: Int,
         package: Package, lactose: Float) {
        
        self.lactose = lactose
        
        super.init(brand: brand, name: name, price: price, size: size, package: package)
    }
    
    convenience init() {
        self.init(brand: "롯데칠성음료", name: "밀키스", price: 1500, size: 340,
                  package: .can, lactose: 3.5)
    }
    
    enum Keys {
        static let milkisLactose = "milkisLactose"
    }
    
    required init?(coder: NSCoder) {
        self.lactose = coder.decodeFloat(forKey: Keys.milkisLactose)
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(lactose, forKey: Keys.milkisLactose)
        super.encode(with: coder)
    }
    
    func isLactoFree(basedOn lactoStandard: Float) -> Bool {
        return lactose <= lactoStandard
    }
}
