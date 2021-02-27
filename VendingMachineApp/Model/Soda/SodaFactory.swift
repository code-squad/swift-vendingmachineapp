//
//  SodaFactory.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

enum SodaKind : String {
    case sprite = "Sprite"
    case coke = "Coke"
}
class SodaFactory : BeverageFactory{
    func createBeverage(with name: String) -> Beverage {
        let drink = SodaKind(rawValue: name)
        switch drink {
        case .coke: return Coke(create: "20210214", expire: "20210216", flaver: .vanilla)
        default:
            return Sprite(create: "20210214", expire: "20210216", lowSuger: false)
        }
    }
}
