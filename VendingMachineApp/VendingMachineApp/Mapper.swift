//
//  DrinkMenu1.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/16.
//

import Foundation
import UIKit

class BeverageMapper {
    static let drinkTypeList = [StrawberryMilk.self, DietCola.self, TopAmericano.self]
    private var map : [UIButton : Beverage.Type] = [:]

    init(drinkButtons : [UIButton]) {
        self.map = Dictionary(uniqueKeysWithValues: zip(drinkButtons, BeverageMapper.drinkTypeList))
    }
    subscript(button : UIButton) -> Beverage.Type? {
        return map[button]
    }
}
