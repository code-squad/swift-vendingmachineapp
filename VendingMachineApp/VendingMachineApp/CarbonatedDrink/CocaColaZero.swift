//
//  CocaColaZero.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 18..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class CocaColaZero: CarbonatedDrink, Product {
    required init() {
        super.init(calorie: 0,
                   brand: "코카콜라",
                   size: 185,
                   price: 1400,
                   name: "코카콜라제로",
                   expiryDate: 290)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
