//
//  Soda.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 23..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class Soda: Beverage {
    override init(name: String, price: Int) {
        super.init(name: name, price: price)
    }
    
    required init() {
        super.init(name: DefaultData.soda.name, price: DefaultData.soda.price)
    }
}
