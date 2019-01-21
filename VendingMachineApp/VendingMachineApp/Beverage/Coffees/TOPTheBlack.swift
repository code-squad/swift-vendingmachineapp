//
//  TOPTheBlack.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 18..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class TOPTheBlack: Coffee, Product {
    
    required init() {
        super.init(hasMilk: false,
                   isHot: false,
                   brand: "맥심",
                   size: 275,
                   price: 1800,
                   name: "맥심티오피더블랙",
                   expiryDate: 143)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
