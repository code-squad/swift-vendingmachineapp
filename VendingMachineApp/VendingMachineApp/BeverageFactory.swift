//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/16.
//

import Foundation


class BeverageFactory {
    static func make(_ drinkType : Beverage.Type) -> Beverage {
        return drinkType.init()
    }
}
