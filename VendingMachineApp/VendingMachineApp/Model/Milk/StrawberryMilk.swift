//
//  StrawberryMilk.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/03.
//

import Foundation

class StrawberryMilk: Milk {
    
    private let realFruit: Bool
    
    init(brand: String, volume: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, fatPercent: Int, realFruit: Bool) {
        self.realFruit = realFruit
        super.init(brand: brand, volume: volume, price: price, name: name, createdAt: createdAt, expiredAt: expiredAt, fatPercent: fatPercent)
    }
  
    required init() {
        realFruit = false
        super.init(brand: "서울우유", volume: 200, price: 600, name: "딸기우유", createdAt: date, expiredAt: date, fatPercent: 6)
    }
    
    func isRealFruit() -> Bool {
        return realFruit
    }
}
