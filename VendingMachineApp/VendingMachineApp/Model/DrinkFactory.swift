//
//  OutPut.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/28.
//

import Foundation

class DrinkFactory: DrinkProduceable {
    static func makeDrink(of drink: ProductizationEnum, manufactured: Date = Date()) -> Drink {
        switch drink {
        case .blueBottleColdBrew: return BlueBottleColdBrew()
        case .starBucksColdBrew: return StarbucksColdBrew()
        case .seoulStrawberryMilk: return SeoulStrawberryMilk()
        case .bingBananaMilk: return BingBananaMilk()
        case .sanpellegrino: return Sanpellegrino()
        case .fanta: return Fanta()
        }
    }
}

protocol DrinkProduceable {
    static func makeDrink(of drink: ProductizationEnum, manufactured: Date) -> Drink
}
