//
//  Coffee.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

enum CoffeeType: String {
    case top = "TOP"
    case cantata = "칸타타"
    case georgia = "조지아"
}

class Coffee: Beverage {
    private var type: CoffeeType
    private var caffeineContent: Int
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, type: CoffeeType, caffeineContent: Int) {
        self.type = type
        self.caffeineContent = caffeineContent
        super.init(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactured: manufactured)
    }
}
