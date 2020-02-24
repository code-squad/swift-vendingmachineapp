//
//  Sprite.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/21.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Sprite: Soda {
    let packageMaterial: String
    
    init(name: String, brand: String, servingSize: Int, price: Money, dateOfManufacture: Date, isSugarFree: Bool, packageMaterial: String) {
        self.packageMaterial = packageMaterial
        super.init(name: name, brand: brand, servingSize: servingSize, price: price, dateOfManufacture: dateOfManufacture, isSugarFree: isSugarFree)
    }
}
