//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 16/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

// Fat -> 저지방 우유일 경우 False, 고지방 우유일 경우 True
class Milk: Beverage {
    var isHighFat: Bool
    
    init(name: String, volume: Int, price: Int, brand: String, date: String, fat: Bool) {
        self.isHighFat = fat
        super.init(name: name, volume: volume, price: price, brand: brand, date: date)
    }
    
    func isHighFatMilk() -> Bool {
        return isHighFat
    }
}
