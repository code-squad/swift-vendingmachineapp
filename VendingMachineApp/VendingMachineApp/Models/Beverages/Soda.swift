//
//  Sparkling.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Soda: Beverage {
    let isSugarFree: Bool
    
    init(name: String, brand: String, servingSize: Int, price: Int, dateOfManufacture: Date, isSugarFree: Bool) {
        self.isSugarFree = isSugarFree
        super.init(name: name, brand: brand, servingSize: servingSize, price: price, dateOfManufacture: dateOfManufacture)
    }
}
