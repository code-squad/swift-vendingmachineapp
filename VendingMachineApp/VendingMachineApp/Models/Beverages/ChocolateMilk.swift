//
//  ChocolateMilk.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/21.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class ChocolateMilk: Milk {
    let cacaoContentRate: Double
    
    init(name: String, brand: String, servingSize: Int, price: Money, manufactureDate: Date, expirationDate: Date , farmCode: String, cacaoContentRate: Double) {
        self.cacaoContentRate = cacaoContentRate
        super.init(name: name, brand: brand, servingSize: servingSize, price: price, manufactureDate: manufactureDate, expirationDate: expirationDate, farmCode: farmCode)
    }
}
