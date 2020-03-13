//
//  Soda.swift
//  VendingMachineApp
//
//  Created by delma on 27/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Soda: Beverage {
    private var sugarRatio: SugarRatio
    let sugarRatioString = "sugarRatio"
    
    init(manufacturer: String, brand: String, capacity: Int, price: Money, name: String, manufacturedDate: Date, expirationDate: Date, sugarRatio: SugarRatio, temperature: Int) {
        self.sugarRatio = sugarRatio
        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, temperature: temperature)
    }

    enum SugarRatio: Int {
        case original = 75
        case lower = 25
        case free = 0
    }
    
    required init?(coder: NSCoder) {
        let decodedInt = coder.decodeInteger(forKey: sugarRatioString)
        let sugarRatio = SugarRatio(rawValue: decodedInt)
        self.sugarRatio = sugarRatio ?? SugarRatio.original
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(self.sugarRatio.rawValue, forKey: sugarRatioString)
    }
}
