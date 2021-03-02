//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

class Coffee: Beverage {
    private let caffeinContent: Int

    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, caffeinContent
         : Int) {
        self.caffeinContent = caffeinContent
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt)
    }
}
