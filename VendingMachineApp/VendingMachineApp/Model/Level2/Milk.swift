//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import Foundation

class Milk: Beverage, CustomStringConvertible {
    
    private var farmCode: String
    
    init(brand: String, miliLiter: Int, price: Int, name: String, dateOfManufacture: Date, farmCode: String) {
        self.farmCode = farmCode
        super.init(brand: brand, miliLiter: miliLiter, price: price, name: name, dateOfManufacture: dateOfManufacture)
    }
}
