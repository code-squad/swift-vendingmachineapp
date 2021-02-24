//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/24.
//

import Foundation

class Coffee: Drink {
    
    private var decaffein: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, date: Date, decaffein: Bool) {
        self.decaffein = decaffein
        super.init(brand: brand, capacity: capacity, price: price, name: name, date: date)
    }
    
    func isDecaffein() -> Bool {
        return decaffein
    }
}
