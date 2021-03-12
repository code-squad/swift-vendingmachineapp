//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/24.
//

import Foundation

class Coffee: Drink {
    
    private var caffein:  Int
    
    init(brand: String, capacity: Int, price: Money, name: String, manufacturedDate: Date, caffein: Int, expiration: Date, hot: Bool, calorie: Int) {
        self.caffein = caffein
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expiration: expiration, hot: hot, calorie: calorie )
    }
    
    required init() {
        self.caffein = 0
        super.init()
    }
    
    func isDecaffein() -> Bool {
        return caffein < 10
    }
}
