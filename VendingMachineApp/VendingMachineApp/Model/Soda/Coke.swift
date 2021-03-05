//
//  Coke.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/03.
//

import Foundation

class Coke: Soda {

    private let zeroCalorie: Bool
    
    init(brand: String, volume: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, suger: Int, zeroCalorie: Bool) {
        self.zeroCalorie = zeroCalorie
        super.init(brand: brand, volume: volume, price: price, name: name, createdAt: createdAt, expiredAt: expiredAt, suger: suger)
    }
    
    convenience init() {
        self.init(brand: "펩시코", volume: 355, price: 500, name: "펩시", createdAt: date, expiredAt: date, suger: 40, zeroCalorie: false)
    }
    
    func isZeroCalorie() -> Bool {
        return zeroCalorie
    }
}
