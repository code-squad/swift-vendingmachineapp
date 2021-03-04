//
//  Top.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/25.
//

import Foundation

class Top: Coffee {
    private var hasSugar: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacture: Date, temperature: Int, hasSugar: Bool, expiredAt: Date) {
        self.hasSugar = hasSugar
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture, temperature: temperature, expiredAt: expiredAt)
    }
}
