//
//  Soda.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/25.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Soda: Beverage {
    private var zeroCalorie: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturingDate: Date, expirationDate: Date, calorie: Double, zeroCalorie: Bool) {
        self.zeroCalorie = zeroCalorie
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, expirationDate: expirationDate, calorie: calorie)
    }
    
    func isZeroCalorie() -> Bool {
        return zeroCalorie
    }
}
