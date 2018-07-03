//
//  StrawberryMilk.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 23..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {
    private var flavor: String
    
    override init(name: String, price: Int, farmCode: Int) {
        self.flavor = "딸기맛"
        super.init(name: name, price: price, farmCode: farmCode)
    }
    
    convenience init() {
        self.init(name: DefaultData.strawberryMilk.name, price: DefaultData.strawberryMilk.price, farmCode: 101)
    }
}
