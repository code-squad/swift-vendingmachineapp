//
//  DrinkFactory.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/03/10.
//

import Foundation

struct DrinkFactory {
    
    static func create(type: Drink.Type) -> Drink? {
        return type.init()
    }
}
