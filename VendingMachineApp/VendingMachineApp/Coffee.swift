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
    
    init(brand: String, name: String, price: Int, size: Int, dateFactory: DateFactory, manufacturedInString: String,
         temperature: Float, package: Package, sugar: Float) {
        
        self.sugar = sugar
        
        super.init(brand: brand, name: name, price: price, size: size, dateFactory: dateFactory, manufacturedInString: manufacturedInString,
                   temperature: temperature, package: package)
    }
    
    convenience init() {
        self.init(brand: "스타벅스", name: "블랙커피", price: 1800, size: 275,
                  dateFactory: SixDigitFactory(), manufacturedInString: "210303",
                  temperature: 75.5, package: .bottle, sugar: 0.0)
    }
    
    func isSugarFree(basedOn sugarStandard: Float) -> Bool {
        return sugar <= sugarStandard ? true : false
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
    
    convenience init() {
        self.init(brand: "코카콜라", name: "조지아 카페라떼", price: 900, size: 240,
                  dateFactory: SixDigitFactory(), manufacturedInString: "210303",
                  temperature: 8.5, package: .can, expireAfter: 10, lactose: 3.5)
    }
    
    func isExpired(compareTo date: Date) -> Bool {
        return expiry < date ? true : false
    }
    
    func isLactoFree(basedOn lactoStandard: Float) -> Bool {
        return lactose <= lactoStandard ? true : false
    }
}
