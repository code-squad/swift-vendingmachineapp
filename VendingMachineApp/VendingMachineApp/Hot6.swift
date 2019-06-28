//
//  Hot6.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/19/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Hot6: Sparkling {
    init(brand: String, ml: Int, price: Int, productDate: String, expirationDate: String) {
        super.init(brand: brand, ml: ml, price: price, name: "핫식스", productDate: productDate, calorie: 50, barcode: "21, 13, 35, 51", expirationDate: expirationDate)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
