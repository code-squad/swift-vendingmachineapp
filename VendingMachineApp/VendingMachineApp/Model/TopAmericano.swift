//
//  TopAmericano.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class TopAmericano : Coffee {
    override init(brand : String, liter: Int, price: Int, name: String, manufactured: Date) {
        super.init(brand: brand, liter: liter, price: price, name: name, manufactured: manufactured)
    }
}
