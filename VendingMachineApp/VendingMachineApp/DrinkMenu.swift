//
//  Menu.swift
//  VendingMachineApp
//
//  Created by joon-ho kil on 7/5/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import Foundation

enum DrinkMenu: Int, CaseIterable {
    case bananaMilk
    case strawberryMilk
    case fanta
    case top
    case hot6
    case pepsiCoke

    func getSample () -> Drink {
        switch self {
        case .bananaMilk: return BananaMilk(brand: "빙그레", ml: 200, price: 1300, productDate: "20190301", farmCode: 5, expirationDate: "20190930")
        case .strawberryMilk: return StrawberryMilk(brand: "빙그레", ml: 200, price: 1300, productDate: "20190405", farmCode: 3, expirationDate: "20190925")
        case .fanta: return Fanta(brand: "롯데", ml: 350, price: 2000, productDate: "20190505", orangeIncense: 0.7, expirationDate: "20190921")
        case .top: return TOP(brand: "맥심", ml: 400, price: 3000, productDate: "20190606", hot: false, expirationDate: "20190920")
        case .hot6: return Hot6(brand: "롯데", ml: 240, price: 1000, productDate: "20190529", expirationDate: "20191029")
        case .pepsiCoke: return PepsiCoke(brand: "펩시", ml: 255, price: 1200, productDate: "20190610", expirationDate: "20191010")
        }
    }
    
    func getImageName () -> String {
        switch self {
        case .bananaMilk: return "bananaMilk.jpg"
        case .strawberryMilk: return "strawberryMilk.jpg"
        case .fanta: return "fanta.jpg"
        case .top: return "top.jpg"
        case .hot6: return "hot6.jpg"
        case .pepsiCoke: return "pepsiCoke.jpg"
        }
    }
    
    static func getDrinkMenu (_ drink: Drink) -> DrinkMenu {
        for drinkMenu in DrinkMenu.allCases {
            if drink == drinkMenu.getSample() {
                return drinkMenu
            }
        }
        return DrinkMenu.fanta
    }
}
