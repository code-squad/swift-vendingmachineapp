//
//  Milk.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class Milk : Beverage {
    private let milkFarmCode : Int
    
    init(brand: String, liter: Int, price: Int, name: String, manufactured: Date, mlikFarmCode : Int) {
        self.milkFarmCode = mlikFarmCode
        super.init(brand: brand, liter: liter, price: price, name: name, manufactured: manufactured)
    }
}
