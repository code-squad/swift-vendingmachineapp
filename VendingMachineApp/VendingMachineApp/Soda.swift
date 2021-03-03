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
    
    convenience init() {
        self.init(brand: "코카콜라", name: "코카콜라 제로", price: 2000, size: 500,
                  dateFactory: SixDigitFactory(), manufacturedInString: "210303",
                  package: .bottle , sugar: 0.0)
    }
    
    func isSugarFree(basedOn sugarStandard: Float) -> Bool {
        return sugar <= sugarStandard ? true : false
    }
}


class Milkis: Soda, LactoFreeable {
    
    private let lactose: Float
    
    init(brand: String, name: String, price: Int, size: Int, dateFactory: DateFactory, manufacturedInString: String,
         package: Package, lactose: Float) {
        
        self.lactose = lactose
        
        super.init(brand: brand, name: name, price: price, size: size, dateFactory: dateFactory, manufacturedInString: manufacturedInString, package: package)
    }
    
    convenience init() {
        self.init(brand: "", name: "밀키스", price: 1500, size: 340,
                  dateFactory: SixDigitFactory(), manufacturedInString: "210303",
                  package: .can, lactose: 3.5)
    }
    
    func isLactoFree(basedOn lactoStandard: Float) -> Bool {
        return lactose <= lactoStandard ? true : false
    }
}
