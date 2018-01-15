//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by TaeHyeonLee on 2018. 1. 15..
//  Copyright © 2018년 ChocOZerO. All rights reserved.
//

import Foundation

struct BeverageFactory {

    enum Taste {
        case chocoMilk
        case bananaMilk
        case strawberryMilk
        case georgia
        case cantata
        case topCoffee
        case sprite
        case fanta
        case pepsi
    }

    static func createBeverage(taste: Taste) -> Beverage {
        var beverage: Beverage!
        let validate = Date.init(timeInterval: (Date.MilkExpirationInterval.twoWeek.value), since: Date())
        switch taste {
        case .chocoMilk:
            beverage = ChocolateMilk.init(validate: validate)
        case .bananaMilk:
            beverage = BananaMilk.init(validate: validate)
        case .strawberryMilk:
            beverage = StrawberryMilk.init(validate: validate)
        case .georgia:
            beverage = Georgia.init(hot: false)
        case .cantata:
            beverage = Cantata.init(hot: true)
        case .topCoffee:
            beverage = TOPCoffee.init(hot: false)
        case .sprite:
            beverage = Sprite.init(lowCalorie: false)
        case .fanta:
            beverage = Fanta.init(lowCalorie: false)
        default:
            beverage = PepsiCoke.init(lowCalorie: true)
        }
        return beverage
    }

}
