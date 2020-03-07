//
//  StrawberryMilk.swift
//  VendingMachineApp
//
//  Created by delma on 04/03/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class StrawberryMilk: Milk {
    private var fatRatio: FatRatio = .lower
    private var isLactoFree = false
    
    init(manufacturer: String, brand: String, capacity: Int, price: Int, name: String, manufacturedDate: Date, expirationDate: Date, temperature: Int) {
        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, fatRatio: fatRatio, isLactoFree: isLactoFree, temperature: temperature)
    }
}
