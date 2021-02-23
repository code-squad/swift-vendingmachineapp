//
//  DietCola.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class DietCola : Soda {
    override init(brand: String, liter: Int, price: Int, name: String, manufactured: Date, calory: Int) {
        super.init(brand: brand, liter: liter, price: price, name: name, manufactured: manufactured, calory: calory)
    }
}
