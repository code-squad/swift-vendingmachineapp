//
//  BananaMilk.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/18/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class BananaMilk: Milk {
    private let bananaContainPercent: Double
    
    init(brand: String, ml: Int, price: Int, productDate: String, farmCode: Int, expirationDate: String) {
        bananaContainPercent = 0.3
        
        super.init(brand: brand, ml: ml, price: price, productDate: productDate, name: "빙그레 바나나우유", farmCode: farmCode, barcode: "50, 150, 40, 30", expirationDate: expirationDate)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    func isLessthanBananaContainPercent (_ bananaContainPercentCompared: Double) -> Bool {
        return bananaContainPercent < bananaContainPercentCompared
    }
}
