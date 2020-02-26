//
//  Coke.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/25.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Coke: Soda {
    private let standardOfStrong: Double = 40
    private var carbonicAcid: Double
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturingDate: Date, expirationDate: Date, calorie: Double, temperature: Double, zeroCalorie: Bool, carbonicAcid: Double) {
        self.carbonicAcid = carbonicAcid
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, expirationDate: expirationDate, calorie: calorie, temperature: temperature, zeroCalorie: zeroCalorie)
    }
    
    func isStrong() -> Bool {
        return carbonicAcid >= standardOfStrong
    }
}
