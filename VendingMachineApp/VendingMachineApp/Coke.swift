//
//  Coke.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/25.
//

import Foundation

class Coke: Soda {
    
    override init(brand: String, miliLiter: Int, price: Int, name: String, dateOfManufacture: Date) {
        super.init(brand: brand, miliLiter: miliLiter, price: price, name: name, dateOfManufacture: dateOfManufacture)
    }
}
