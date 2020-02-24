//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/21.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class BananaMilk: Milk {
    let bananaContentGram: Int
    
    init(name: String, brand: String, servingSize: Int, price: Money, dateOfManufacture: Date, farmCode: String, bananaContentGram: Int) {
        self.bananaContentGram = bananaContentGram
        super.init(name: name, brand: brand, servingSize: servingSize, price: price, dateOfManufacture: dateOfManufacture, farmCode: farmCode)
    }
}
