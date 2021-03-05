//
//  Cider.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/03.
//

import Foundation

class Cider: Soda {
    
    private let flat: Bool
    
    init(brand: String, volume: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, suger: Int, flat: Bool) {
        self.flat = flat
        super.init(brand: brand, volume: volume, price: price, name: name, createdAt: createdAt, expiredAt: expiredAt, suger: suger)
    }
    
    convenience init() {
        self.init(brand: "코카콜라", volume: 185, price: 1000, name: "스프라이트", createdAt: date, expiredAt: date, suger: 21, flat: false)
    }
    
    func isflat() -> Bool {
        return flat
    }
}
