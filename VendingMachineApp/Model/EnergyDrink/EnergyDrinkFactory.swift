//
//  EnergyDrinkFactory.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

class EnergyDrinkFactory : BeverageFactory{
    static func createBeverage(with name: String) -> Beverage {
        let drink = EnergyDrink.Kind(rawValue: name)
        switch drink {
        case .monster: return Monster(create: Date().toString(), expire: Date().toString())
        default : return Hot6ix(create: Date().toString(), expire: Date().toString(), flaver: .lemon)
        }
    }
}
