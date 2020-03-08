//
//  Georgia.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/25.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Georgia: Coffee {
    private var black: Bool
    
    init(brand: String, capacity: Double, price: Price, name: String, manufacturingDate: Date, calorie: Double, temperature: Double, decaffeinated: Bool, black: Bool) {
        self.black = black
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, calorie: calorie, temperature: temperature, decaffeinated: decaffeinated)
    }
    
    func isBlack() -> Bool {
        return black
    }
}
