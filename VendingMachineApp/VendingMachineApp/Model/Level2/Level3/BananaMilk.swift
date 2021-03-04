//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import Foundation

class BananaMilk: Milk {
    private var hasDoraemonSticker: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacture: Date, farmCode: String, hasDoraemonSticker: Bool, expiredAt: Date) {
        self.hasDoraemonSticker = hasDoraemonSticker
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture, farmCode: farmCode, expiredAt: expiredAt)
    }
    
    convenience init (brand: String, capacity: Int, price: Int, name: String, manufacture: Date, farmCode: String, hasDoraemonSticker: Bool) {
        
        self.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture, farmCode: farmCode, hasDoraemonSticker: hasDoraemonSticker, expiredAt: Calendar.current.date(byAdding: .day, value: 5, to: Date())!)
    }
}
