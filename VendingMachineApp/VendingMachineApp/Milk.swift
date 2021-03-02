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
    
    func isExpired(compareTo date: Date) -> Bool {
        return expiry < date ? true : false
    }
    
    func isLactoFree(basedOn lactoStandard: Float) -> Bool {
        return lactose <= lactoStandard ? true : false
    }
    
}


class Chocolate: Milk, Transportable {
    
    private let package: Package
    
    init(brand: String, name: String, price: Int, size: Int, dateFactory: DateFactory, manufacturedInString: String,
         expireAfter: Int, lactose: Float, package: Package) {
        
        self.package = package
        
        super.init(brand: brand, name: name, price: price, size: size, dateFactory: dateFactory, manufacturedInString: manufacturedInString, expireAfter: expireAfter, lactose: lactose)
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
    
    func isSugarFree(basedOn sugarStandard: Float) -> Bool {
        return sugar <= sugarStandard ? true : false
    }
}
