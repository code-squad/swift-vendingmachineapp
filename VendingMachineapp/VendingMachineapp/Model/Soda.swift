//
//  Soda.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

enum SodaType: String {
    case coke = "콜라"
    case sprite = "사이다"
    case hwanta = "환타"
}

class Soda: Beverage {
    private var type: SodaType
    private var flavor: String
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, expirydate: Date, calorie: Int, hot: Bool, type: SodaType, flavor: String) {
        self.type = type
        self.flavor = flavor
        super.init(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactured: manufactured, expirydate: expirydate, calorie: calorie, hot: hot)
    }
}
