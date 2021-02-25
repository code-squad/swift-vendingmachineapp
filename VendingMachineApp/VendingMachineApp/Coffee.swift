//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

class Coffee: Beverage, Hotable, Transportable {
    
    private let isHot: Bool
    private let package: Package
    
    init(brand: String, name: String, price: Int, size: Int, manufactured: Date,
         isHot: Bool, package: Package) {
        
        self.isHot = isHot
        self.package = package
        
        super.init(brand: brand, name: name, price: price, size: size, manufactured: manufactured)
    }
    
    func isHotable() -> Bool {
        return isHot
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
    
    private let isSugarAdded: Bool
    
    init(brand: String, name: String, price: Int, size: Int, manufactured: Date,
         isHot: Bool, package: Package, isSugarAdded: Bool) {
        
        self.isSugarAdded = isSugarAdded
        
        super.init(brand: brand, name: name, price: price, size: size, manufactured: manufactured,
                   isHot: isHot, package: package)
    }
    
    func isSugarFree() -> Bool {
        return !isSugarAdded
    }
}


class CafeLatte: Coffee, Expirable, LactoFreeable {
    
    private let expiry: Date
    private let lactose: Float
    
    init(brand: String, name: String, price: Int, size: Int, manufactured: Date,
         isHot: Bool, package: Package, expireAfter: Int, lactose: Float) {
        
        self.expiry = manufactured.add(amount: expireAfter)
        self.lactose = lactose
        
        super.init(brand: brand, name: name, price: price, size: size, manufactured: manufactured,
                   isHot: isHot, package: package)
    }
    
    func isExpired() -> Bool {
        let today = Date()
        let isExpired = expiry < today
        return isExpired
    }
    
    func isLactoFree() -> Bool {
        return lactose <= 0.5 ? true : false
    }
}
