//
//  Milk.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class Milk : Beverage {
    override init(brand: Brand, liter: Int, price: Int, name: String, manufactured: String) {
        super.init(brand: brand, liter: liter, price: price, name: name, manufactured: manufactured)
    }
}
