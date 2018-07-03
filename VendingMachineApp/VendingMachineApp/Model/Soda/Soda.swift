//
//  Soda.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 23..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class Soda: Beverage {
    private var calorie: Int
    
    init(name: String, price: Int, calorie: Int) {
        self.calorie = calorie
        super.init(name: name, price: price)
    }
    
    convenience init() {
        self.init(name: DefaultData.soda.name, price: DefaultData.soda.price, calorie: 0)
    }
}
