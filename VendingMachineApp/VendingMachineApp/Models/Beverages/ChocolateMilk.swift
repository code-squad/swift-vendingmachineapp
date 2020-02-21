//
//  ChocolateMilk.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/21.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class ChocolateMilk: Milk {
    let cacaoContentRate: Int
    
    init(name: String, brand: String, servingSize: Int, price: Int, dateOfManufacture: Date, farmCode: String, cacaoContentRate: Int) {
        self.cacaoContentRate = cacaoContentRate
        super.init(name: name, brand: brand, servingSize: servingSize, price: price, dateOfManufacture: dateOfManufacture, farmCode: farmCode)
    }
}
