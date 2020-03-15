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
    
    init(name: String, brand: String, servingSize: Int, price: Money, manufactureDate: Date, expirationDate: Date, isSugarFree: Bool) {
        self.isSugarFree = isSugarFree
        super.init(name: name, brand: brand, servingSize: servingSize, price: price, manufactureDate: manufactureDate, expirationDate: expirationDate)
    }
    
    required init?(coder: NSCoder) {
        self.isSugarFree = coder.decodeBool(forKey: .isSugarFree)
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(value: isSugarFree, forKey: .isSugarFree)
    }
}
