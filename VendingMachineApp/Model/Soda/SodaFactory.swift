//
//  SodaFactory.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

class SodaFactory : BeverageFactory{
    static func createBeverage<T>(type value: T) -> Beverage? {
        switch value {
        case is Coke.Type : return Coke(create: Date().toString(), expire: Date().toString(), flaver: .vanilla)
        case is Sprite.Type : return Sprite(create: Date().toString(), expire: Date().toString(), lowSuger: false)
        default:
            return nil
        }
    }
}
