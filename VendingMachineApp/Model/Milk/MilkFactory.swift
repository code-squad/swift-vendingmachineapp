//
//  MilkFactory.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

enum MilkKind : String {
    case chocolate = "Chocolate"
    case stroberry = "Stroberry"
    case banana = "Banana"
}
class MilkFactory : BeverageFactory{
    
    func createBeverage(with name: String) -> Beverage {
        let drink = MilkKind(rawValue: name)
        switch drink {
        case .chocolate: return ChocolateMilk(create: "20210214", expire: "20210216")
        case .stroberry: return StroberryMilk(create: "20210214", expire: "20210216")
        default:
            return BananaMilk(create: "20210214", expire: "20210216")
        }
    }
}
