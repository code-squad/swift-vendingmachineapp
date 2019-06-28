//
//  SupplyableDrinkList.swift
//  VendingMachineApp
//
//  Created by joon-ho kil on 6/26/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import Foundation

struct SupplyableDrinkList: Codable {
    static func getSupplyableDrinkList () -> [Drink] {
        let bananaMilk = BananaMilk(brand: "빙그레", ml: 200, price: 1300, productDate: "20190301", farmCode: 5, expirationDate: "20190930")
        let strawberryMilk = StrawberryMilk(brand: "빙그레", ml: 200, price: 1300, productDate: "20190405", farmCode: 3, expirationDate: "20190925")
        let fanta = Fanta(brand: "롯데", ml: 350, price: 2000, productDate: "20190505", orangeIncense: 0.7, expirationDate: "20190921")
        let top = TOP(brand: "맥심", ml: 400, price: 3000, productDate: "20190606", hot: false, expirationDate: "20190920")
        let hot6 = Hot6(brand: "롯데", ml: 240, price: 1000, productDate: "20190529", expirationDate: "20191029")
        let pepsiCoke = PepsiCoke(brand: "펩시", ml: 255, price: 1200, productDate: "20190610", expirationDate: "20191010")
        return [bananaMilk, strawberryMilk, fanta, top, hot6, pepsiCoke]
    }
}
