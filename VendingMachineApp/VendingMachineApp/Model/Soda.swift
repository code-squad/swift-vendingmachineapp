//
//  Soda.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/24.
//

import Foundation

class Soda: Beverage {

    private var unsweetened: Bool
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, unsweetened: Bool) {
        self.unsweetened = unsweetened
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt)
    }
}
