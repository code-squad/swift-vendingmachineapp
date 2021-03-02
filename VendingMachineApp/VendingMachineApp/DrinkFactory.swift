//
//  OutPut.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/28.
//

import Foundation

class DrinkFactory: DrinkProduceable {
    static func makeDrink(of drink: Productization.Type, manufactured: Date = Date()) -> Drink? {
        switch drink {
        case is BlueBottleColdBrew.Type: return BlueBottleColdBrew()
        case is StarbucksColdBrew.Type: return StarbucksColdBrew(flavor: .black, manufactured: manufactured)
        case is SeoulStrawberryMilk.Type: return SeoulStrawberryMilk(isWithStraw: true, manufactured: manufactured)
        case is BingBananaMilk.Type: return BingBananaMilk(target: .all, manufactured: manufactured)
        case is Sanpellegrino.Type: return Sanpellegrino(isPackageRenewaled: true, manufactured: manufactured)
        case is Fanta.Type: return Fanta(flavor: .orange, manufactured: manufactured)
        default: return nil
        }
    }
}

protocol DrinkProduceable {
    static func makeDrink(of drink: Productization.Type, manufactured: Date) -> Drink?
}
