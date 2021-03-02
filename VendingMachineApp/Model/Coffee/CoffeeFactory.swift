//
//  CoffeeFactory.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

class CoffeeFactory : BeverageFactory{
    static func createBeverage<T>(type value: T) -> Beverage? {
        switch value {
        case is Top.Type : return Top(create: Date().toString(), expire: Date().toString())
        case is Georgia.Type : return Georgia(create: Date().toString(), expire: Date().toString())
        case is Cantata.Type : return Cantata(create: Date().toString(), expire: Date().toString())
        default:
            return nil
        }
    }
}

