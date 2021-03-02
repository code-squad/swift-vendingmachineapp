//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

class Coffee: Beverage {
    private let isDecaffein: Bool

    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, isDecaffein
         : Bool) {
        self.isDecaffein = isDecaffein
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt)
    }
}
