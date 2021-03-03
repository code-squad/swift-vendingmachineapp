//
//  DrinkFactory.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/03/03.
//

import Foundation

class DrinkFactory {
    static func createDrink(tag: Int) -> Drink? {
        switch tag {
        case 1:
            return BananaMilk.init()
        case 2:
            return Cantata.init()
        case 3:
            return Fanta.init()
        default:
            return nil
        }
    }
}
