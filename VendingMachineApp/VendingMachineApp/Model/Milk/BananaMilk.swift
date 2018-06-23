//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 23..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class BananaMilk: Milk {
    override init() {
        super.init(name: DefaultData.bananaMilk.name, price: DefaultData.bananaMilk.price)
    }
}
