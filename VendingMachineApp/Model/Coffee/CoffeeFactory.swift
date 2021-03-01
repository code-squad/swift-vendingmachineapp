//
//  CoffeeFactory.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

class CoffeeFactory : BeverageFactory{
    static func createBeverage(with name: String) -> Beverage {
        let drink = Coffee.Kind(rawValue: name)
        switch drink {
        case .cantata: return Cantata(create: Date().toString(), expire: Date().toString())
        case .georiga: return Georgia(create: Date().toString(), expire: Date().toString())
        default:
            return Top(create: Date().toString(), expire: Date().toString())
        }
    }
}

