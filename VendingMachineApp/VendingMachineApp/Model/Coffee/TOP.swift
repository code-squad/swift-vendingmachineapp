//
//  TOP.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/03.
//

import Foundation

class TOP: Coffee {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date) {
        super.init(brand: "맥심", volume: 275, price: 900, name: "TOP", manufacturedAt: date)
    }
}
