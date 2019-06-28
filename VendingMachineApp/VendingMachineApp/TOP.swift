//
//  TOP.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/18/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class TOP: Coffee {
    private var topLevelCoffeebeanContainPercent: Double
    
    init(brand: String, ml: Int, price: Int, productDate: String, hot: Bool, expirationDate: String) {
        topLevelCoffeebeanContainPercent = 0.5
        
        super.init(brand: brand, ml: ml, price: price, name: "TOP아메리카노", productDate: productDate, hot: hot, barcode: "60, 70, 80, 100", expirationDate: expirationDate)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    func isTopLevelCoffeebeanContainPercent(_ percent: Double) -> Bool {
        return topLevelCoffeebeanContainPercent == percent
    }
}
