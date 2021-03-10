//
//  DrinkFactory.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/03/04.
//

import Foundation

class BeverageFactory {
    static func releaseBeverage(with factory: Produceable) -> Beverage {
        return factory.createBeverage()
    }
}

protocol Produceable {
    func createBeverage() -> Beverage
}
