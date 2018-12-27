//
//  BeverageFactory.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 26..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct BeverageFactory {
    static func produce(addableBeverage: AddableBeverage) -> Beverage {
        switch addableBeverage {
        case .mandarineMilk:
            return MandarineMilk()
        case .lactoseFreeMilk:
            return LactoseFreeMilk()
        case .starbucksDoubleShot:
            return StarbucksDoubleShot()
        case .topTheBlack:
            return TOPTheBlack()
        case .cocaCola:
            return CocaCola()
        case .cocaColaZero:
            return CocaColaZero()
        }
    }
}
