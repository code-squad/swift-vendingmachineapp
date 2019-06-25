//
//  Milk.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/18/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Milk: Drink {
    private let farmCode: Int
    
    init(brand: String, ml: Int, price: Int, productDate: String, name: String, farmCode: Int, barcode: Barcode, expirationDate: String) {
        self.farmCode = farmCode
        
        super.init(brand: brand, ml: ml, price: price, name: name, productDate: productDate, barcode: barcode, expirationDate: expirationDate)
    }
    
    func isFarmCode(_ farmCodeCompared: Int) -> Bool {
        return farmCode == farmCodeCompared
    }
}
