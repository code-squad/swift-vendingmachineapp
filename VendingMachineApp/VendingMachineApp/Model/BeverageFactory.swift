//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

protocol BeverageFactory {

    func create(type: Beverage.Type) -> Beverage

}

class BeverageToday: BeverageFactory {
    
    func create(type: Beverage.Type) -> Beverage {
        return type.init()
    }
}
