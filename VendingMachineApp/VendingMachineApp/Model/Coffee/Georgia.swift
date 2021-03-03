//
//  Georgia.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/03.
//

import Foundation

class Georgia: Coffee {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date) {
        super.init(brand: "코카콜라", volume: 240, price: 1000, name: "조지아", manufacturedAt: date)
    }
}
