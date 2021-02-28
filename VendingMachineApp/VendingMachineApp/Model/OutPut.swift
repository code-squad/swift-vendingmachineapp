//
//  OutPut.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/28.
//

import Foundation

struct Output {
    enum KinkOfDrink: String {
        case blueBottleColdBrew = "BlueBottle Cold Brew"
        case starBucksColdBrew = "StarBucks Cold Brew"
        case seoulStrawberryMilk = "서울 우유 딸기맛"
        case bingBananaMilk = "빙그레 바나나우유"
        case sanpellegrino = "Sanpellegrino"
        case fanta = "Fanta"
    }
    
    
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
