//
//  ChocoMilk.swift
//  VendingMachineApp
//
//  Created by delma on 04/03/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class ChocoMilk: Milk {
    private var fatRatio: FatRatio = .original
    private var flavor: Flavor = .choco
    private var isLactoFree = true
    
    init(manufacturer: String, brand: String, capacity: Int, price: Int, name: String, manufacturedDate: Date, expirationDate: Date) {
        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, fatRatio: fatRatio, flavor: flavor, isLactoFree: isLactoFree)
    }
}
