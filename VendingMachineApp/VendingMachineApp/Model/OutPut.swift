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
    
    
    static func makeDrink(of drink: KinkOfDrink, manufacture: Date = Date()) -> Drink {
        switch drink {
        case .blueBottleColdBrew: return BlueBottleColdBrew(flavor: .bold, manufacture: manufacture)
        case .starBucksColdBrew: return StarbucksColdBrew(flavor: .black, manufacture: manufacture)
        case .seoulStrawberryMilk: return SeoulStrawberryMilk(manufacture: manufacture)
        case .bingBananaMilk: return BingBananaMilk(manufacture: manufacture)
        case .sanpellegrino: return Sanpellegrino(manufacture: manufacture)
        case .fanta: return Fanta(manufacture: manufacture)
        }
    }
}
