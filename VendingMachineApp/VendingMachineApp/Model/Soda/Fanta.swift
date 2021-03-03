//
//  Fanta.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/03.
//

import Foundation

class Fanta: Soda {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date) {
        super.init(brand: "코카콜라", volume: 355, price: 800, name: "환타", manufacturedAt: date)
    }
}
