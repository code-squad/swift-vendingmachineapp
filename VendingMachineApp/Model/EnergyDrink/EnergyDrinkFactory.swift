//
//  EnergyDrinkFactory.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

enum EnergyDrinkKind : String{
    case monster = "Monster"
    case hot6ix = "Hot6ix"
}
class EnergyDrinkFactory : BeverageFactory{
    func createBeverage(with name: String) -> Beverage {
        let drink = EnergyDrinkKind(rawValue: name)
        switch drink {
        case .monster: return Monster(create: "20210220", expire: "20220101")
        default : return Hot6ix(create: "20210220", expire: "20220101", flaver: .lemon)
        }
    }
}
