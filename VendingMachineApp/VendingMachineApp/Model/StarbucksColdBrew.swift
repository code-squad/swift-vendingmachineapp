//
//  StarbucksColdBrew.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/26.
//

import Foundation

class StarbucksColdBrew: Coffee {
    private var isBlack: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, isDecaffeinated: Bool, isBlack: Bool, manufacture: Date = Date()) {
        self.isBlack = isBlack
        super.init(brand: brand, capacity: capacity, price: price, name: name, isDecaffeinated: isDecaffeinated, manufacture: manufacture)
    }
}
