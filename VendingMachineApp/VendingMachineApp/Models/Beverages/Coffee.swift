//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    let servingCaffeine: Int
    
    init(name: String, brand: String, servingSize: Int, price: Int, dateOfManufacture: Date, servingCaffeine: Int) {
        self.servingCaffeine = servingCaffeine
        super.init(name: name, brand: brand, servingSize: servingSize, price: price, dateOfManufacture: dateOfManufacture)
    }
}
