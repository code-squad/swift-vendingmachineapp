//
//  StrawberryMilk.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/18/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {
    private let strawberryContainPercent: Double
    
    init(brand: String, ml: Int, price: Int, productDate: String, farmCode: Int, expirationDate: String) {
        strawberryContainPercent = 0.4
        
        super.init(brand: brand, ml: ml, price: price, productDate: productDate, name: "빙그레 딸기우유", farmCode: farmCode, barcode: "77, 80, 20, 1", expirationDate: expirationDate)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    func isLessthanStrawberryContainPercent (_ strawberryContainPercentCompared: Double) -> Bool {
        return strawberryContainPercent < strawberryContainPercentCompared
    }
}
