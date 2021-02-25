//
//  Soda.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

class Soda: Beverage, Transportable {
    
    private let package: Package
    
    init(brand: String, name: String, price: Int, size: Int,
         manufactured: Date, package: Package) {
        
        self.package = package
        
        super.init(brand: brand, name: name, price: price, size: size, manufactured: manufactured)
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
    
    private let isSugarAdded: Bool
    
    init(brand: String, name: String, price: Int, size: Int, manufactured: Date,
         package: Package, isSugarAdded: Bool) {
        
        self.isSugarAdded = isSugarAdded
        
        super.init(brand: brand, name: name, price: price, size: size,
                   manufactured: manufactured, package: package)
    }
    
    func isSugarFree() -> Bool {
        return !isSugarAdded
    }
}


class Milkis: Soda, LactoFreeable {
    
    private let lactose: Float
    
    init(brand: String, name: String, price: Int, size: Int, manufactured: Date,
         package: Package, lactose: Float) {
        
        self.lactose = lactose
        
        super.init(brand: brand, name: name, price: price, size: size,
                   manufactured: manufactured, package: package)
    }
    
    func isLactoFree() -> Bool {
        return lactose <= 0.5 ? true : false
    }
}
