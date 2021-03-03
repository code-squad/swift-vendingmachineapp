//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import Foundation

class BananaMilk: Milk {
    private var hasDoraemonSticker: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacture: Date, farmCode: String, hasDoraemonSticker: Bool, expiry: Date) {
        self.hasDoraemonSticker = hasDoraemonSticker
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture, farmCode: farmCode, expiry: expiry)
    }
    
    convenience init (brand: String, capacity: Int, price: Int, name: String, manufacture: Date, farmCode: String, hasDoraemonSticker: Bool) {
        
        self.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture, farmCode: farmCode, hasDoraemonSticker: hasDoraemonSticker, expiry: Calendar.current.date(byAdding: .day, value: 5, to: Date())!)
    }
}
