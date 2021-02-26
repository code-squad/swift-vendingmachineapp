//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import Foundation

class BananaMilk: Milk {
    private var hasDoraemonSticker: Bool
    
    init(brand: String, miliLiter: Int, price: Int, name: String, dateOfManufacture: Date, farmCode: String, hasDoraemonSticker: Bool) {
        self.hasDoraemonSticker = hasDoraemonSticker
        super.init(brand: brand, miliLiter: miliLiter, price: price, name: name, dateOfManufacture: dateOfManufacture, farmCode: farmCode)
    }
}
