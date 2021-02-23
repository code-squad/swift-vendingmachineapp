//
//  File.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class strawberryMilk : Milk {
    override init(brand: String, liter: Int, price: Int, name: String, date: String) {
        super.init(brand : brand, liter: liter, price: price, name: name, date: date)
    }
}
