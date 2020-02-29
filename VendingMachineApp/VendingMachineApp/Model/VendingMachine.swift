//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by delma on 29/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class VendingMachine {
    private let topCoffee = Coffee(manufacturer: "동서식품", brand: "TOP", capacity: 275, price: 2500, name: "마스터라떼", manufacturedDate: Date(), isContainMilk: true, flavor: .latte, package: .can)
    private let bananaMilk = Milk(manufacturer: "빙그레", brand: "빙그레", capacity: 250, price: 1400, name: "빙그레 바나나맛 우유", manufacturedDate: Date(), fatRatio: .original, flavor: .banana, isLactoFree: false)
    private let splite = Soda(manufacturer: "코카콜라", brand: "스프라이트", capacity: 355, price: 1500, name: "스프라이트", manufacturedDate: Date(), sugarRatio:.original, flavor: .cider)
    
    func showBeverages() {
        print(topCoffee.description)
        print(bananaMilk.description)
        print(splite.description)
    }
}
