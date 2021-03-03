//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/03.
//

import Foundation

class BananaMilk: Milk {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date) {
        super.init(brand: "서울우유", volume: 200, price: 600, name: "바나나우유", manufacturedAt: date)
    }
}
