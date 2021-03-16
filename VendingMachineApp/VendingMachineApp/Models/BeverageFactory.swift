//
//  DrinkFactory.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/03/10.
//

import Foundation

struct BeverageFactory {
    static func create(type: Beverage.Type) -> Beverage? {
        return type.init()
    }
}
