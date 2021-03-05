//
//  Cola.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/03.
//

import Foundation

class Cola: Soda {

    private let zeroCalorie: Bool
    
    init(brand: String, volume: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, sugarPercent: Int, zeroCalorie: Bool) {
        self.zeroCalorie = zeroCalorie
        super.init(brand: brand, volume: volume, price: price, name: name, createdAt: createdAt, expiredAt: expiredAt, sugarPercent: sugarPercent)
    }
    
    convenience init() {
        self.init(brand: "펩시코", volume: 355, price: 500, name: "펩시", createdAt: date, expiredAt: date, sugarPercent: 6, zeroCalorie: false)
    }
    
    func isZeroCalorie() -> Bool {
        return zeroCalorie
    }
}
