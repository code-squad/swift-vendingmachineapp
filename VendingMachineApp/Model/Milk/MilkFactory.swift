//
//  MilkFactory.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

class MilkFactory : BeverageFactory{
    
    func createBeverage(with name: String) -> Beverage {
        let drink = Milk.Kind(rawValue: name)
        switch drink {
        case .chocolate: return ChocolateMilk(create: Date().toString(), expire: Date().toString())
        case .stroberry: return StroberryMilk(create: Date().toString(), expire: Date().toString())
        default:
            return BananaMilk(create: Date().toString(), expire: Date().toString())
        }
    }
}
