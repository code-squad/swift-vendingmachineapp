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
    
    init(brand: String, capacity: Int, price: Price, name: String, manufacturingDate: Date, calorie: Double, temperature: Temperature, decaffeinated: Bool) {
        self.decaffeinated = decaffeinated
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, calorie: calorie, temperature: temperature)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(decaffeinated, forKey: Property.decaffeinated)
        super.encode(with: coder)
    }
    
    required init?(coder decoder: NSCoder) {
        self.decaffeinated = decoder.decodeBool(forKey: Property.decaffeinated)
        super.init(coder: decoder)
    }
    
    func isDecaffeinated() -> Bool {
        return decaffeinated
    }
}
