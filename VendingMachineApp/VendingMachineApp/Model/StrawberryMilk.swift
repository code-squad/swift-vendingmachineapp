//
//  File.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class StrawberryMilk : Milk {
    init(liter: Int, price: Int, name: String, date: String) {
        super.init(brand: MilkBrand.seoulMilk.description, liter: liter, price: price, name: name, date: date)
    }
}
