//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/25.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private var decaffeinated: Bool
    
    init(brand: Brand, capacity: Capacity, price: Price, name: Name, manufacturingDate: Date, calorie: Calorie, temperature: Temperature, decaffeinated: Bool) {
        self.decaffeinated = decaffeinated
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, calorie: calorie, temperature: temperature)
    }
    
    func isDecaffeinated() -> Bool {
        return decaffeinated
    }
}
