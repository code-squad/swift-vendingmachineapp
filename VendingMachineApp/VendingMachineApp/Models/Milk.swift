//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Milk: Drink {
    private let fatContent: Int
    
    init(manufacturer: String, volume: Int, name: String, manufacturedAt: Date, price: Int, temperature: Int, calorie: Int, fatContent: Int, expiredAt: Date) {
        self.fatContent = fatContent
        super.init(manufacturer: manufacturer, volume: volume, name: name, manufacturedAt: manufacturedAt, price: price, temperature: temperature, calorie: calorie, expiredAt: expiredAt)
    }
    
    func isLowFat() -> Bool {
        return fatContent < 3 ? true : false
    }
}
