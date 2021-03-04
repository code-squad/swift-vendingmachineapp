//
//  DrinkFactory.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/03/04.
//

import Foundation

class DrinkFactory {
    static func createBeverage(with id: String) -> Beverage? {
        switch id {
        case "Cola":
            return Cola()
        case "StrawberryMilk":
            return StrawBerryMilk()
        case "RedBull":
            return RedBull()
        case "TOP":
            return TOP()
        default:
            return nil
        }
    }
}
