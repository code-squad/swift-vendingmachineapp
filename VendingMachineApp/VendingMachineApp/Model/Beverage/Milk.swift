//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/24.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Milk: Beverage {
    enum Property: String, CustomStringConvertible {
        case farmCode
        
        var description: String {
            return self.rawValue
        }
    }
    
    enum FarmCode: String, CaseIterable {
        case A, B, C, D, E, F
        
        init() {
            self = FarmCode.allCases[Int.random(in: 0..<FarmCode.allCases.count)]
        }
    }
    
    private var farmCode: FarmCode
    
    init(brand: String, capacity: Int, price: Price, name: String, manufacturingDate: Date, calorie: Double, temperature: Temperature, farmCode: FarmCode) {
        self.farmCode = farmCode
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, calorie: calorie, temperature: temperature)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(farmCode, forKey: "\(Property.farmCode)")
    }
    
    required init?(coder decoder: NSCoder) {
        self.farmCode = decoder.decodeObject(forKey: "\(Property.farmCode)") as! FarmCode
        super.init(coder: decoder)
    }
    
    func from() -> String {
        return farmCode.rawValue
    }
}
