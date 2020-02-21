//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/21.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Cantata: Coffee {
    let isLattee: Bool
    
    init(name: String, brand: String, servingSize: Int, price: Int, dateOfManufacture: Date, servingCaffeine: Int, isLattee: Bool) {
        self.isLattee = isLattee
        super.init(name: name, brand: brand, servingSize: servingSize, price: price, dateOfManufacture: dateOfManufacture, servingCaffeine: servingCaffeine)
    }
}
