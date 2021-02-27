//
//  CoffeeFactory.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

enum CoffeeKind : String {
    case cantata = "Cantata"
    case top = "TOP"
    case georiga = "Georgia"
}
class CoffeeFactory : BeverageFactory{
    func createBeverage(with name: String) -> Beverage {
        let drink = CoffeeKind(rawValue: name)
        switch drink {
        case .cantata: return Cantata(create: "20210214", expire: "20210216")
        case .georiga: return Georgia(create: "20210214", expire: "20210216")
        default:
            return Top(create: "20210214", expire: "20210216")
        }
    }
}

