//
//  LactoseFreeMilk.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 18..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class LactoseFreeMilk: Milk, Product {
    
    required init() {
        super.init(lactose: 0,
                   brand: "매일유업",
                   size: 190,
                   price: 1100,
                   name: "소화가잘되는우유",
                   expiryDate: 5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
