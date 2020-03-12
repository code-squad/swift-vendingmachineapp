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

    init(manufacturer: String, brand: String, capacity: Int, price: Money, name: String, manufacturedDate: Date, expirationDate: Date, sugarRatio: SugarRatio, temperature: Int) {
        self.sugarRatio = sugarRatio
        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, temperature: temperature)
    }

    enum SugarRatio {
        case original
        case lower
        case free
    }
    
    required init?(coder: NSCoder) {
        guard let sugarRatio = coder.decodeObject(forKey: "sugarRatio") as? SugarRatio else { return nil }
        self.sugarRatio = sugarRatio
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(self.sugarRatio, forKey: "sugarRatio")
    }
}
