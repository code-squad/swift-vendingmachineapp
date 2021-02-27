//
//  SodaFactory.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

class SodaFactory : BeverageFactory{
    func createBeverage(with name: String) -> Beverage {
        let drink = Soda.Kind(rawValue: name)
        switch drink {
        case .coke: return Coke(create: Date().toString(), expire: Date().toString(), flaver: .vanilla)
        default:
            return Sprite(create: Date().toString(), expire: Date().toString(), lowSuger: false)
        }
    }
}
