//
//  Milk.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 23..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private var farmCode: Int
    
    init(name: String, price: Int, farmCode: Int) {
        self.farmCode = farmCode
        super.init(name: name, price: price)
    }
    
    convenience init() {
        self.init(name: DefaultData.milk.name, price: DefaultData.milk.price, farmCode: 100)
    }
}
