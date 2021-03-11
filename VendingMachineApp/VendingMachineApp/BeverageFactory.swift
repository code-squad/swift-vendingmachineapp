//
//  DrinkFactory.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

protocol BeverageProduceable {
    static func produce(of type: Beverage.Type) -> Beverage?
}

protocol BeverageInitable {
    init()
}

class BeverageFactory: BeverageProduceable {
    static func produce(of type: Beverage.Type) -> Beverage? {
        guard let beverageType = type as? BeverageInitable.Type else { return nil }
        guard let beverage = beverageType.init() as? Beverage else { return nil }
        return beverage
    }
}
