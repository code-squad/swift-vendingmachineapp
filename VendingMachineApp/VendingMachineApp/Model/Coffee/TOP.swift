//
//  TOP.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 23..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class TOP: Coffee {
    override init() {
        super.init(name: DefaultData.top.name, price: DefaultData.top.price)
    }
}
