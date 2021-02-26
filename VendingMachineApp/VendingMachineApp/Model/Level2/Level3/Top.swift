//
//  Top.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/25.
//

import Foundation

class Top: Coffee {
    private var hasSugar: Bool
    
    init(brand: String, miliLiter: Int, price: Int, name: String, dateOfManufacture: Date, isHot: Bool, hasSugar: Bool) {
        self.hasSugar = hasSugar
        super.init(brand: brand, miliLiter: miliLiter, price: price, name: name, dateOfManufacture: dateOfManufacture, isHot: isHot)
    }
}
