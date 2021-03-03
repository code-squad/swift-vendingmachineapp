//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

protocol BeverageFactory {

    func create() -> Beverage

}

enum TotalBeverageFactory: BeverageFactory, CaseIterable {
    case chocolateMilk, plainMilk, coke, milkis, americano, cafelatte
    
    func create() -> Beverage {
        switch self {
        case .chocolateMilk:
            return Chocolate.init()
        case .plainMilk:
            return Plain.init()
        case .coke:
            return Coke.init()
        case .milkis:
            return Milkis.init()
        case .americano:
            return Americano.init()
        case .cafelatte:
            return CafeLatte.init()
        }
    }
}
