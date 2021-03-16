//
//  DrinkMenu1.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/16.
//

import Foundation
import UIKit

class DrinkMenu {
    private var list : [UIButton : Beverage.Type] = [:]
    private(set) var drinkList = [StrawberryMilk.self, DietCola.self, TopAmericano.self]
    
    init(drinkButtons : [UIButton]) {
        self.list = Dictionary(uniqueKeysWithValues: zip(drinkButtons, drinkList))
    }
    
    func addMenu(button : UIButton) -> Beverage.Type? {
        return list[button]
    }
}
