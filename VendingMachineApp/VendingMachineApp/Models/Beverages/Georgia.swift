//
//  Georgia.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/21.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Georgia: Coffee {
    let isHotCoffee: Bool
    
    init(name: String, brand: String, servingSize: Int, price: Money, dateOfManufacture: Date, servingCaffeine: Int, isHotCoffee: Bool) {
        self.isHotCoffee = isHotCoffee
        super.init(name: name, brand: brand, servingSize: servingSize, price: price, dateOfManufacture: dateOfManufacture, servingCaffeine: servingCaffeine)
    }
    
    func isHot() -> Bool {
        return isHotCoffee
    }
}
