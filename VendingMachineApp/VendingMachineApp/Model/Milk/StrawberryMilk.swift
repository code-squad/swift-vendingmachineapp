//
//  StrawberryMilk.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 23..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {
    override init() {
        super.init(name: DefaultData.strawberryMilk.name, price: DefaultData.strawberryMilk.price)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
}
