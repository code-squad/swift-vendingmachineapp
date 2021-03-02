//
//  EnergyDrinkFactory.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

class EnergyDrinkFactory : BeverageFactory{
    static func createBeverage<T>(type value : T) -> Beverage? {
        switch value {
        case is Monster.Type : return Monster(create: Date().toString(), expire: Date().toString())
        case is Hot6ix.Type : return Hot6ix(create: Date().toString(), expire: Date().toString(), flaver: .lemon)
        default : return nil
        }
    }
}
