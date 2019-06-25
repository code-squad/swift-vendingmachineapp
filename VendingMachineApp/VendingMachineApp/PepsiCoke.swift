//
//  PepsiCoke.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/19/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class PepsiCoke: Sparkling {
    init(brand: String, ml: Int, price: Int, productDate: String, expirationDate: String) {
        super.init(brand: brand, ml: ml, price: price, name: "펩시 콜라", productDate: productDate, calorie: 80, barcode: Barcode.upc(42, 31, 350, 15), expirationDate: expirationDate)
    }
}
