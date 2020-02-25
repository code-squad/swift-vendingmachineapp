//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/25.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private var hot: Bool
    private var decaffeinated: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturingDate: Date, expirationDate: Date, calorie: Double, hot: Bool, decaffeinated: Bool) {
        self.hot = hot
        self.decaffeinated = decaffeinated
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, expirationDate: expirationDate, calorie: calorie)
    }
    
    func isHot() -> Bool {
        return hot
    }
    
    func isDecaffeinated() -> Bool {
        return decaffeinated
    }
}
