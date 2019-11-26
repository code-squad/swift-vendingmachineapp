//
//  Soda.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/21.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Soda: Beverage {
    private let sugarContent: Double
    
    init(brand: String, capacity: Int, price: Int, name: String, expirationDate: Date, temperature: Int, sugarContent: Double) {
        self.sugarContent = sugarContent
        
        super.init(brand: brand, capacity: capacity, price: price, name: name, expirationDate: expirationDate, temperature: temperature)
    }
    
    var isSugarFree: Bool {
        return sugarContent == 0
    }
}
