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

    static func createBeverageAll() -> [Beverage] {
        var beverages: [Beverage] = []
        beverages.append(createBeverage(taste: Taste.chocoMilk))
        beverages.append(createBeverage(taste: Taste.bananaMilk))
        beverages.append(createBeverage(taste: Taste.strawberryMilk))
        beverages.append(createBeverage(taste: Taste.georgia))
        beverages.append(createBeverage(taste: Taste.cantata))
        beverages.append(createBeverage(taste: Taste.topCoffee))
        beverages.append(createBeverage(taste: Taste.sprite))
        beverages.append(createBeverage(taste: Taste.fanta))
        beverages.append(createBeverage(taste: Taste.pepsi))
        return beverages
    }

}
