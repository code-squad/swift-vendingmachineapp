//
//  Cider.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/25.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Cider: Soda {
    enum Taste: String {
        case lemon = "lemon"
        case pear = "pear"
    }
    
    private var taste: Taste
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturingDate: Date, expirationDate: Date, calorie: Double, temperature: Double, zeroCalorie: Bool, taste: Taste) {
        self.taste = taste
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, expirationDate: expirationDate, calorie: calorie, temperature: temperature, zeroCalorie: zeroCalorie)
    }
    
    func isSameTaste(as taste: Taste) -> Bool {
        return self.taste == taste
    }
}
