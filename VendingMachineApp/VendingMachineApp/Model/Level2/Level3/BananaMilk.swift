//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import Foundation

class BananaMilk: Milk {
    private var hasDoraemonSticker: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacture: Date, farmCode: String, hasDoraemonSticker: Bool) {
        self.hasDoraemonSticker = hasDoraemonSticker
        super.init(brand: brand, capacity: capacity, price: price, name: "바나나유유", manufacture: manufacture, farmCode: farmCode)
    }
}
