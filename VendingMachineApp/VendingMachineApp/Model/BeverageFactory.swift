//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/01.
//

import Foundation

class BeverageFactory {
    
    func addBeverage(manufacturedAt: Date, expiration: Date) -> Beverage {
        
        return CantataAmericano(manufacturedAt: manufacturedAt, expiration: expiration)
    }
    
}

protocol addBeverage {
    func addBeverage(specific: a.Type, manufacturedAt: Date, expiration: Date) -> Beverage?
}
