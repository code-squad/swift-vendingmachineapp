//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    let type: CoffeeType
    
    init(name: String, brand: String, servingSize: Int, price: Int, dateOfManufacture: Date, coffeeType: CoffeeType) {
        self.type = coffeeType
        super.init(name: name, brand: brand, servingSize: servingSize, price: price, dateOfManufacture: dateOfManufacture)
    }
    
    enum CoffeeType {
        case TOP, Cantata, Georgia
    }
}
