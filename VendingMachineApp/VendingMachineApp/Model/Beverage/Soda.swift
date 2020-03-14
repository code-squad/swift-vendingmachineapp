//
//  Soda.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/25.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Soda: Beverage {
    static let zeroStandard = 10.0
    private var zeroCalorie: Bool
    
    override init(brand: String, capacity: Int, price: Price, name: String, manufacturingDate: Date, calorie: Double, temperature: Temperature) {
        self.zeroCalorie = Soda.zeroStandard >= calorie ? true : false
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, calorie: calorie, temperature: temperature)
    }

    override func encode(with coder: NSCoder) {
        coder.encode(zeroCalorie, forKey: Property.zeroCalorie)
        super.encode(with: coder)
    }
    
    required init?(coder decoder: NSCoder) {
        self.zeroCalorie = decoder.decodeBool(forKey: Property.zeroCalorie)
        super.init(coder: decoder)
    }
    
    func isZeroCalorie() -> Bool {
        return zeroCalorie
    }
}
