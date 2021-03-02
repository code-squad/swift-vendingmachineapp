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
    
    init(brand: String, name: String, price: Int, size: Int, manufactured: Date,
         temperature: Float, package: Package) {
        
        self.temperature = temperature
        self.package = package
        
        super.init(brand: brand, name: name, price: price, size: size, manufactured: manufactured)
    }
    
    func isHot(basedOn temperature: Float) -> Bool {
        return self.temperature >= temperature ? true : false
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
    
    init(brand: String, name: String, price: Int, size: Int, manufactured: Date,
         temperature: Float, package: Package, sugar: Float) {
        
        self.sugar = sugar
        
        super.init(brand: brand, name: name, price: price, size: size, manufactured: manufactured,
                   temperature: temperature, package: package)
    }
    
    func isSugarFree(basedOn sugarStandard: Float) -> Bool {
        return sugar <= sugarStandard ? true : false
    }
}


class CafeLatte: Coffee, Expirable, LactoFreeable {
    
    private let expiry: Date
    private let lactose: Float
    
    init(brand: String, name: String, price: Int, size: Int, manufactured: Date,
         temperature: Float, package: Package, expireAfter: Int, lactose: Float) {
        
        self.expiry = manufactured.add(amount: expireAfter)
        self.lactose = lactose
        
        super.init(brand: brand, name: name, price: price, size: size, manufactured: manufactured,
                   temperature: temperature, package: package)
    }
    
    func isExpired(compareTo date: Date) -> Bool {
        return expiry < date ? true : false
    }
    
    func isLactoFree(basedOn lactoStandard: Float) -> Bool {
        return lactose <= lactoStandard ? true : false
    }
}
