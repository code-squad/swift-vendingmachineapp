//
//  Coke.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/25.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Coke: Soda {
    private var carbonicAcid: Double
    
    init(brand: Brand, capacity: Capacity, price: Price, name: Name, manufacturingDate: Date, calorie: Calorie, temperature: Temperature, carbonicAcid: Double) {
        self.carbonicAcid = carbonicAcid
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, calorie: calorie, temperature: temperature)
    }
    
    func isStrong(standard: Double) -> Bool {
        return carbonicAcid >= standard
    }
}
