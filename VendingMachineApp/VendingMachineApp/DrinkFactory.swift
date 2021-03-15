//
//  DrinkFactory.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/03/03.
//

import Foundation

class DrinkFactory {
    static func createDrink(for drinkType: Drink.Type) -> Drink? {
        return drinkType.init()
    }
}
