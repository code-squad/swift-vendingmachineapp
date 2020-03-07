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
    
    init(brand: Brand, capacity: Capacity, price: Price, name: Name, manufacturingDate: Date, expirationDate: Date, calorie: Calorie, temperature: Temperature, zeroCalorie: Bool, taste: Taste) {
        self.taste = taste
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, calorie: calorie, temperature: temperature)
    }
    
    func isSameTaste(as taste: Taste) -> Bool {
        return self.taste == taste
    }
}
