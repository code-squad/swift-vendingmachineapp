//
//  Coffee.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/18/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coffee: Drink {
    private var hot: Bool
    
    init(brand: String, ml: Int, price: Int, name: String, productDate: String, hot: Bool, barcode: Barcode, expirationDate: String) {
        self.hot = hot
        
        super.init(brand: brand, ml: ml, price: price, name: name, productDate: productDate, barcode: barcode, expirationDate: expirationDate)
    }
    
    func isHot() -> Bool {
        return hot
    }
}
