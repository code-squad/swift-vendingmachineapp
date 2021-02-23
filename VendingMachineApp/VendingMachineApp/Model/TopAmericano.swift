//
//  TopAmericano.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class TopAmericano : Coffee {
    init(liter: Int, price: Int, name: String, date: String) {
        super.init(brand: CoffeeBrand.Maxim.description, liter: liter, price: price, name: name, date: date)
    }
}
