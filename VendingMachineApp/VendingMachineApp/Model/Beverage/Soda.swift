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
    
    override init(brand: Brand, capacity: Capacity, price: Price, name: Name, manufacturingDate: Date, calorie: Calorie, temperature: Temperature, beverageIndex: VendingMachine.BeverageNumbers) {
        self.zeroCalorie = calorie.isZero()
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, calorie: calorie, temperature: temperature, beverageIndex: beverageIndex)
    }
    
    func isZeroCalorie() -> Bool {
        return zeroCalorie
    }
}
