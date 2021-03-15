//
//  DrinkFactory.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/03/04.
//

import Foundation

class BeverageFactory {
    static func releaseBeverage(with factory: Beverage.Type) -> Beverage? {
        switch factory {
        case is StrawBerryMilk.Type:
            return StrawberryMilkFactory.createBeverage()
        case is RedBull.Type:
            return RedBullFactory.createBeverage()
        case is TOP.Type:
            return TOPFactory.createBeverage()
        case is Cola.Type:
            return ColaFactory.createBeverage()
        default:
            return nil
        }
    }
}

protocol Produceable {
    func createBeverage() -> Beverage
}
