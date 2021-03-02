//
//  Soda.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class Soda: Drink, Sweetable {
    private let sugarContent: Int
    
    init(manufacturer: String, volume: Int, name: String,
         manufacturedAt: Date, price: Int, calorie: Int, temperature: Int, sugarContent: Int, expiredAt: Date) {
        self.sugarContent = sugarContent
        super.init(manufacturer: manufacturer, volume: volume, name: name, manufacturedAt: manufacturedAt, price: price, temperature: temperature, calorie: calorie, expiredAt: expiredAt)
    }
    
    func isUnSweetened() -> Bool {
        return sugarContent < 100 ? true : false
    }
}

