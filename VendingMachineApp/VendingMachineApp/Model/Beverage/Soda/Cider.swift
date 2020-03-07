//
//  Cider.swift
//  VendingMachineApp
//
//  Created by delma on 04/03/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Cider: Soda {
    private var sugarRatio: SugarRatio = .original
    
    init(manufacturer: String, brand: String, capacity: Int, price: Int, name: String, manufacturedDate: Date, expirationDate: Date, temperature: Int) {

        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, sugarRatio: sugarRatio, temperature: temperature)
    }
}
