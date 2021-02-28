//
//  OutPut.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/28.
//

import Foundation

class DrinkFactory: DrinkProduceable {
    static func makeDrink(of drink: KinkOfDrink, manufactured: Date = Date()) -> Drink {
        switch drink {
        case .blueBottleColdBrew: return BlueBottleColdBrew(manufactured: manufactured)
        case .starBucksColdBrew: return StarbucksColdBrew(manufactured: manufactured)
        case .seoulStrawberryMilk: return SeoulStrawberryMilk(manufactured: manufactured)
        case .bingBananaMilk: return BingBananaMilk(manufactured: manufactured)
        case .sanpellegrino: return Sanpellegrino(manufactured: manufactured)
        case .fanta: return Fanta(manufactured: manufactured)
        }
    }
}

protocol DrinkProduceable {
    static func makeDrink(of drink: KinkOfDrink, manufactured: Date) -> Drink
}
