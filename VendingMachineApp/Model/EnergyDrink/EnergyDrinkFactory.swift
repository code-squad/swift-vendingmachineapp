//
//  EnergyDrinkFactory.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

class EnergyDrinkFactory : BeverageFactory {
    func createBeverage<T>(type value : T) -> Beverage? {
        switch value {
        case is Monster.Type : return Monster(createdAt: Date().toString(), expiredAt: Date().toString())
        case is Hot6ix.Type : return Hot6ix(createdAt: Date().toString(), expiredAt: Date().toString())
        default : return nil
        }
    }
}
