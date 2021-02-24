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
    override init(manufacturer: String, volume: Int, price: Int, brand: String, manufactoringDate: Date) {
        super.init(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactoringDate: manufactoringDate)
    }
}

class Top: Coffee {
    private var type: CoffeeType
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactoringDate: Date, type: CoffeeType) {
        self.type = type
        super.init(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactoringDate: manufactoringDate)
    }
}

class Cantata: Coffee {
    private var type: CoffeeType
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactoringDate: Date, type: CoffeeType) {
        self.type = type
        super.init(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactoringDate: manufactoringDate)
    }
}

class Georgia: Coffee {
    private var type: CoffeeType
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactoringDate: Date, type: CoffeeType) {
        self.type = type
        super.init(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactoringDate: manufactoringDate)
    }
}
