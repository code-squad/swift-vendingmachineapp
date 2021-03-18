//
//  ChocoMilk.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/03.
//

import Foundation

class ChocoMilk: Milk {
    
    private let syrup: Int
    
    init(brand: String, volume: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, fatPercent: Int, syrup: Int) {
        self.syrup = syrup
        super.init(brand: brand, volume: volume, price: price, name: name, createdAt: createdAt, expiredAt: expiredAt, fatPercent: fatPercent)
    }
  
    required init() {
        syrup = 3
        super.init(brand: "서울우유", volume: 200, price: 600, name: "초코우유", createdAt: date, expiredAt: date, fatPercent: 5)
    }
    
    func isLowSyrup(criteria: Int) -> Bool {
        return criteria > syrup
    }
}
