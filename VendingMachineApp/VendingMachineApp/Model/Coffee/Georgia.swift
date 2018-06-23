//
//  Georgia.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 23..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class Georgia: Coffee {
    required init() {
        super.init(name: DefaultData.georgia.name, price: DefaultData.georgia.price)
    }
}
