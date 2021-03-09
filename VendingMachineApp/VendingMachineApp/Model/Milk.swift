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
    
    required init?(coder: NSCoder) {
        self.expiry = coder.decodeObject(forKey: "milk_expiry") as! Date
        self.lactose = coder.decodeFloat(forKey: "milk_lactose")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(expiry, forKey: "milk_expiry")
        coder.encode(lactose, forKey: "milk_lactose")
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
    
    required init?(coder: NSCoder) {
        self.package = Package(rawValue: coder.decodeObject(forKey: "c_milk_package") as! String)!
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(package.rawValue, forKey: "c_milk_package")
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
    
    required init?(coder: NSCoder) {
        self.sugar = coder.decodeFloat(forKey: "p_milk_sugar")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(sugar, forKey: "p_milk_sugar")
        super.encode(with: coder)
    }
    
    func isSugarFree(basedOn sugarStandard: Float) -> Bool {
        return sugar <= sugarStandard
    }
}
