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
        case is ChocolateMilk.Type : return ChocolateMilk(createdAt: Date().toString(), expiredAt: Date().toString())
        case is StroberryMilk.Type : return StroberryMilk(createdAt: Date().toString(), expiredAt: Date().toString())
        case is BananaMilk.Type : return BananaMilk(createdAt: Date().toString(), expiredAt: Date().toString())
        default:
            return nil
        }
    }
}
