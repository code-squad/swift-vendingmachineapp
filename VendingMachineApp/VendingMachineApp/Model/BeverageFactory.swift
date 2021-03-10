//
//  DrinkFactory.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/03/03.
//

import Foundation

class BeverageFactory {
    private static var sharedBeverageFactory = BeverageFactory()
    
    class func shared() -> BeverageFactory {
        return sharedBeverageFactory
    }
    
    func getBeverage(DrinkType drinkType : Drink.Type) -> Drink {
        return drinkType.init()
    }
}
