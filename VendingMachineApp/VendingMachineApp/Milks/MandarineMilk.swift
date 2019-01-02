//
//  MandarineMilk.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 18..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class MandarineMilk: Milk, Product {
    let tag: Int = 1
    
    required init() {
        super.init(lactose: 27,
                   brand: "빙그레",
                   size: 240,
                   price: 1200,
                   name: "귤맛우유",
                   expiryDate: 7)
    }
}
