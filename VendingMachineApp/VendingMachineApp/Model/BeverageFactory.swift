//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 24..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

struct BeverageFactory {
    
    static func makeBeverage( meunNumber: Int) -> Beverage? {
        switch meunNumber {
        case Menu.strawberryMilk.rawValue:
            return StrawberryMilk()
        case Menu.bananaMilk.rawValue:
            return BananaMilk()
        case Menu.coke.rawValue:
            return Coke()
        case Menu.top.rawValue:
            return TOP()
        case Menu.sprite.rawValue:
            return Sprite()
        default:
            return nil
        }
    }
}

enum Menu: Int {
    case strawberryMilk = 0
    case bananaMilk
    case coke
    case top
    case sprite
    
    var beverageType: BeverageType {
        switch self {
        case .strawberryMilk:
            return BeverageType(StrawberryMilk.self)
        case .bananaMilk:
            return BeverageType(BananaMilk.self)
        case .coke:
            return BeverageType(Coke.self)
        case .top:
            return BeverageType(TOP.self)
        case .sprite:
            return BeverageType(Sprite.self)
        }
    }
}
