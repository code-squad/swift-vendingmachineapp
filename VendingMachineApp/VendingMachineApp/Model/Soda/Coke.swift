//
//  Coke.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 23..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class Coke: Soda {
    required init() {
        super.init(name: DefaultData.coke.name, price: DefaultData.coke.price)
    }
}
