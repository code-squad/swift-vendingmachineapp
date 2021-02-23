//
//  TopAmericano.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class TopAmericano : Coffee {
    init(liter: Int, price: Int, name: String, manufactured: String) {
        super.init(brand: Brand.Coffee(.Maxim), liter: liter, price: price, name: name, manufactured: manufactured)
    }
}
