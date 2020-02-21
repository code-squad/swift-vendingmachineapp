//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Milk: Beverage {
    let type: MilkType
    
    init(name: String, brand: String, servingSize: Int, price: Int, dateOfManufacture: Date, milkType: MilkType) {
        self.type = milkType
        super.init(name: name, brand: brand, servingSize: servingSize, price: price, dateOfManufacture: dateOfManufacture)
    }
    
    enum MilkType {
        case strawberryMilk, chocolateMilk, bananaMilk
    }
}
