//
//  DrinkMenu1.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/16.
//

import Foundation
import UIKit

class Mapper {
    private var map : [UIButton : Beverage.Type] = [:]

    init(drinkButtons : [UIButton], drinkTypeList : [Beverage.Type]) {
        self.map = Dictionary(uniqueKeysWithValues: zip(drinkButtons, drinkTypeList))
    }
    
    func mapping(button : UIButton) -> Beverage.Type? {
        return map[button]
    }
}
