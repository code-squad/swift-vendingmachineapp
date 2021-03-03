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
    
    convenience init() {
        self.init(brand: "푸르밀", name: "가나 초코우유", price: 1300, size: 225,
                  dateFactory: SixDigitFactory(), manufacturedInString: "210303",
                  expireAfter: 10, lactose: 3.5, package: .bottle)
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
    
    convenience init() {
        self.init(brand: "매일", name: "소화가 잘되는 우유", price: 850, size: 190,
                  dateFactory: SixDigitFactory(), manufacturedInString: "210303",
                  expireAfter: 7, lactose: 0.2, sugar: 0.2)
    }
    
    func isSugarFree(basedOn sugarStandard: Float) -> Bool {
        return sugar <= sugarStandard ? true : false
    }
}
