//
//  Coke.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/25.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Coke: Soda {
    private var strongCarbonicAcid: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturingDate: Date, expirationDate: Date, calorie: Double, zeroCalorie: Bool, strongCarbonicAcid: Bool) {
        self.strongCarbonicAcid = strongCarbonicAcid
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, expirationDate: expirationDate, calorie: calorie, zeroCalorie: zeroCalorie)
    }
    
    func isStrong() -> Bool {
        return strongCarbonicAcid
    }
}
