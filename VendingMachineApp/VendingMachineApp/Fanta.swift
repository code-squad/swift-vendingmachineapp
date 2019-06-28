//
//  Fanta.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/18/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Fanta: Sparkling {
    private let orangeIncense: Double
    
    init(brand: String, ml: Int, price: Int, productDate: String, orangeIncense: Double, expirationDate: String) {
        self.orangeIncense = orangeIncense
        
        super.init(brand: brand, ml: ml, price: price, name: "오렌지 환타", productDate: productDate, calorie: 70, barcode: "30, 33, 50, 150", expirationDate: expirationDate)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    func isOrangeIncense(_ orangeIncenseCompared: Double) -> Bool {
        return orangeIncense == orangeIncenseCompared
    }
}
