//
//  MilkFactory.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

class MilkFactory : BeverageFactory{
    static func createBeverage<T>(type value: T) -> Beverage? {
        switch value {
        case is ChocolateMilk.Type : return ChocolateMilk(create: Date().toString(), expire: Date().toString())
        case is StroberryMilk.Type : return StroberryMilk(create: Date().toString(), expire: Date().toString())
        case is BananaMilk.Type : return BananaMilk(create: Date().toString(), expire: Date().toString())
        default:
            return nil
        }
    }
}
