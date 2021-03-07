//
//  CoffeeFactory.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

class CoffeeFactory : BeverageFactory{
    func createBeverage<T>(type value: T) -> Beverage? {
        switch value {
        case is Top.Type : return Top(createdAt: Date().toString(), expiredAt: Date().toString())
        case is Georgia.Type : return Georgia(createdAt: Date().toString(), expiredAt: Date().toString())
        case is Cantata.Type : return Cantata(createdAt: Date().toString(), expiredAt: Date().toString())
        default:
            return nil
        }
    }
}

