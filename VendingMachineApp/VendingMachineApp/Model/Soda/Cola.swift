//
//  Cola.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/03.
//

import Foundation

class Cola: Soda {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date) {
        super.init(brand: "펩시코", volume: 355, price: 500, name: "펩시", manufacturedAt: date)
    }
}
