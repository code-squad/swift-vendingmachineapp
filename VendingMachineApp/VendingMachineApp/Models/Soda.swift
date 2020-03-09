//
//  Soda.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Soda: Beverage {
    
    private let calorie: Int
    
    init?(brand: String, volume: Int, price: Int,
          name: String, manufacturingDateInfo: String, calorie: Int) {
        self.calorie = calorie
        super.init(brand: brand, volume: volume, price: price,
        name: name, manufacturingDateInfo: manufacturingDateInfo)
    }
    
    func isLowCalorie() -> Bool {
        guard calorie < 100
        else {
           return false
        }
        return true
    }
    
}
