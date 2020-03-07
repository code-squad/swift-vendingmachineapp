//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/24.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Milk: Beverage {
    enum FarmCode: String, CaseIterable {
        case A, B, C, D, E, F
        
        init(index: Int) {
            self = FarmCode.allCases[index]
        }
        
        func isSame(farmCode: String) -> Bool {
            return self.rawValue == farmCode
        }
    }
    
    private var farmCode: FarmCode
    
    init(brand: Brand, capacity: Capacity, price: Price, name: Name, manufacturingDate: Date, calorie: Calorie, temperature: Temperature, farmCode: FarmCode) {
        self.farmCode = farmCode
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, calorie: calorie, temperature: temperature)
    }
    
    func from() -> String {
        return farmCode.rawValue
    }
    
    func isSameFarm(farmCode: String) ->  Bool {
        return self.farmCode.isSame(farmCode: farmCode)
    }
}
