//
//  SodaFactory.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

class SodaFactory : BeverageFactory{
    func createBeverage<T>(type value: T) -> Beverage? {
        switch value {
        case is Coke.Type : return Coke(createdAt: Date().toString(), expiredAt: Date().toString())
        case is Sprite.Type : return Sprite(createdAt: Date().toString(), expiredAt: Date().toString())
        default:
            return nil
        }
    }
}
